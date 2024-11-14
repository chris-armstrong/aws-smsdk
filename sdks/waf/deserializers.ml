open Smaws_Lib.Json.DeserializeHelpers

open Types

let error_message_of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let match_field_type_of_yojson = 
  fun (tree: t) path : match_field_type -> match tree with 
    | `String "ALL_QUERY_ARGS" -> ALL_QUERY_ARGS
    | `String "SINGLE_QUERY_ARG" -> SINGLE_QUERY_ARG
    | `String "BODY" -> BODY
    | `String "METHOD" -> METHOD
    | `String "HEADER" -> HEADER
    | `String "QUERY_STRING" -> QUERY_STRING
    | `String "URI" -> URI
    | `String value -> raise (deserialize_unknown_enum_value_error path "MatchFieldType" value)
    | _ -> raise (deserialize_wrong_type_error path "MatchFieldType")

let match_field_data_of_yojson = string_of_yojson

let field_to_match_of_yojson = 
  fun tree path : field_to_match ->
  let _list = assoc_of_yojson tree path in
  let _res : field_to_match = {
    data = option_of_yojson (value_for_key (match_field_data_of_yojson) "Data") _list path;
    type_ = value_for_key (match_field_type_of_yojson) "Type" _list path;
    
  }
  in _res

let text_transformation_of_yojson = 
  fun (tree: t) path : text_transformation -> match tree with 
    | `String "URL_DECODE" -> URL_DECODE
    | `String "CMD_LINE" -> CMD_LINE
    | `String "LOWERCASE" -> LOWERCASE
    | `String "HTML_ENTITY_DECODE" -> HTML_ENTITY_DECODE
    | `String "COMPRESS_WHITE_SPACE" -> COMPRESS_WHITE_SPACE
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TextTransformation" value)
    | _ -> raise (deserialize_wrong_type_error path "TextTransformation")

let xss_match_tuple_of_yojson = 
  fun tree path : xss_match_tuple ->
  let _list = assoc_of_yojson tree path in
  let _res : xss_match_tuple = {
    text_transformation = value_for_key (text_transformation_of_yojson) "TextTransformation" _list path;
    field_to_match = value_for_key (field_to_match_of_yojson) "FieldToMatch" _list path;
    
  }
  in _res

let xss_match_tuples_of_yojson = 
  fun tree path -> list_of_yojson xss_match_tuple_of_yojson tree path 

let change_action_of_yojson = 
  fun (tree: t) path : change_action -> match tree with 
    | `String "DELETE" -> DELETE
    | `String "INSERT" -> INSERT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChangeAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ChangeAction")

let xss_match_set_update_of_yojson = 
  fun tree path : xss_match_set_update ->
  let _list = assoc_of_yojson tree path in
  let _res : xss_match_set_update = {
    xss_match_tuple = value_for_key (xss_match_tuple_of_yojson) "XssMatchTuple" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let xss_match_set_updates_of_yojson = 
  fun tree path -> list_of_yojson xss_match_set_update_of_yojson tree path 

let resource_id_of_yojson = string_of_yojson

let resource_name_of_yojson = string_of_yojson

let xss_match_set_summary_of_yojson = 
  fun tree path : xss_match_set_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : xss_match_set_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    xss_match_set_id = value_for_key (resource_id_of_yojson) "XssMatchSetId" _list path;
    
  }
  in _res

let xss_match_set_summaries_of_yojson = 
  fun tree path -> list_of_yojson xss_match_set_summary_of_yojson tree path 

let xss_match_set_of_yojson = 
  fun tree path : xss_match_set ->
  let _list = assoc_of_yojson tree path in
  let _res : xss_match_set = {
    xss_match_tuples = value_for_key (xss_match_tuples_of_yojson) "XssMatchTuples" _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    xss_match_set_id = value_for_key (resource_id_of_yojson) "XssMatchSetId" _list path;
    
  }
  in _res

let rule_priority_of_yojson = int_of_yojson

let waf_action_type_of_yojson = 
  fun (tree: t) path : waf_action_type -> match tree with 
    | `String "COUNT" -> COUNT
    | `String "ALLOW" -> ALLOW
    | `String "BLOCK" -> BLOCK
    | `String value -> raise (deserialize_unknown_enum_value_error path "WafActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "WafActionType")

let waf_action_of_yojson = 
  fun tree path : waf_action ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_action = {
    type_ = value_for_key (waf_action_type_of_yojson) "Type" _list path;
    
  }
  in _res

let waf_override_action_type_of_yojson = 
  fun (tree: t) path : waf_override_action_type -> match tree with 
    | `String "COUNT" -> COUNT
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "WafOverrideActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "WafOverrideActionType")

let waf_override_action_of_yojson = 
  fun tree path : waf_override_action ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_override_action = {
    type_ = value_for_key (waf_override_action_type_of_yojson) "Type" _list path;
    
  }
  in _res

let waf_rule_type_of_yojson = 
  fun (tree: t) path : waf_rule_type -> match tree with 
    | `String "GROUP" -> GROUP
    | `String "RATE_BASED" -> RATE_BASED
    | `String "REGULAR" -> REGULAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "WafRuleType" value)
    | _ -> raise (deserialize_wrong_type_error path "WafRuleType")

let excluded_rule_of_yojson = 
  fun tree path : excluded_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : excluded_rule = {
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let excluded_rules_of_yojson = 
  fun tree path -> list_of_yojson excluded_rule_of_yojson tree path 

let activated_rule_of_yojson = 
  fun tree path : activated_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : activated_rule = {
    excluded_rules = option_of_yojson (value_for_key (excluded_rules_of_yojson) "ExcludedRules") _list path;
    type_ = option_of_yojson (value_for_key (waf_rule_type_of_yojson) "Type") _list path;
    override_action = option_of_yojson (value_for_key (waf_override_action_of_yojson) "OverrideAction") _list path;
    action = option_of_yojson (value_for_key (waf_action_of_yojson) "Action") _list path;
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    priority = value_for_key (rule_priority_of_yojson) "Priority" _list path;
    
  }
  in _res

let web_acl_update_of_yojson = 
  fun tree path : web_acl_update ->
  let _list = assoc_of_yojson tree path in
  let _res : web_acl_update = {
    activated_rule = value_for_key (activated_rule_of_yojson) "ActivatedRule" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let web_acl_updates_of_yojson = 
  fun tree path -> list_of_yojson web_acl_update_of_yojson tree path 

let web_acl_summary_of_yojson = 
  fun tree path : web_acl_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : web_acl_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    web_acl_id = value_for_key (resource_id_of_yojson) "WebACLId" _list path;
    
  }
  in _res

let web_acl_summaries_of_yojson = 
  fun tree path -> list_of_yojson web_acl_summary_of_yojson tree path 

let metric_name_of_yojson = string_of_yojson

let activated_rules_of_yojson = 
  fun tree path -> list_of_yojson activated_rule_of_yojson tree path 

let resource_arn_of_yojson = string_of_yojson

let web_ac_l_of_yojson = 
  fun tree path : web_ac_l ->
  let _list = assoc_of_yojson tree path in
  let _res : web_ac_l = {
    web_acl_arn = option_of_yojson (value_for_key (resource_arn_of_yojson) "WebACLArn") _list path;
    rules = value_for_key (activated_rules_of_yojson) "Rules" _list path;
    default_action = value_for_key (waf_action_of_yojson) "DefaultAction" _list path;
    metric_name = option_of_yojson (value_for_key (metric_name_of_yojson) "MetricName") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    web_acl_id = value_for_key (resource_id_of_yojson) "WebACLId" _list path;
    
  }
  in _res

let waf_tag_operation_internal_error_exception_of_yojson = 
  fun tree path : waf_tag_operation_internal_error_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_tag_operation_internal_error_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_tag_operation_exception_of_yojson = 
  fun tree path : waf_tag_operation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_tag_operation_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_subscription_not_found_exception_of_yojson = 
  fun tree path : waf_subscription_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_subscription_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_stale_data_exception_of_yojson = 
  fun tree path : waf_stale_data_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_stale_data_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_service_linked_role_error_exception_of_yojson = 
  fun tree path : waf_service_linked_role_error_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_service_linked_role_error_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_referenced_item_exception_of_yojson = 
  fun tree path : waf_referenced_item_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_referenced_item_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_nonexistent_item_exception_of_yojson = 
  fun tree path : waf_nonexistent_item_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_nonexistent_item_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_nonexistent_container_exception_of_yojson = 
  fun tree path : waf_nonexistent_container_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_nonexistent_container_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_non_empty_entity_exception_of_yojson = 
  fun tree path : waf_non_empty_entity_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_non_empty_entity_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_limits_exceeded_exception_of_yojson = 
  fun tree path : waf_limits_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_limits_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_invalid_regex_pattern_exception_of_yojson = 
  fun tree path : waf_invalid_regex_pattern_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_invalid_regex_pattern_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_invalid_permission_policy_exception_of_yojson = 
  fun tree path : waf_invalid_permission_policy_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_invalid_permission_policy_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let parameter_exception_field_of_yojson = 
  fun (tree: t) path : parameter_exception_field -> match tree with 
    | `String "TAG_KEYS" -> TAG_KEYS
    | `String "TAGS" -> TAGS
    | `String "RESOURCE_ARN" -> RESOURCE_ARN
    | `String "NEXT_MARKER" -> NEXT_MARKER
    | `String "RULE_TYPE" -> RULE_TYPE
    | `String "RATE_KEY" -> RATE_KEY
    | `String "GEO_MATCH_LOCATION_VALUE" -> GEO_MATCH_LOCATION_VALUE
    | `String "GEO_MATCH_LOCATION_TYPE" -> GEO_MATCH_LOCATION_TYPE
    | `String "SIZE_CONSTRAINT_COMPARISON_OPERATOR" -> SIZE_CONSTRAINT_COMPARISON_OPERATOR
    | `String "BYTE_MATCH_POSITIONAL_CONSTRAINT" -> BYTE_MATCH_POSITIONAL_CONSTRAINT
    | `String "BYTE_MATCH_TEXT_TRANSFORMATION" -> BYTE_MATCH_TEXT_TRANSFORMATION
    | `String "SQL_INJECTION_MATCH_FIELD_TYPE" -> SQL_INJECTION_MATCH_FIELD_TYPE
    | `String "BYTE_MATCH_FIELD_TYPE" -> BYTE_MATCH_FIELD_TYPE
    | `String "IPSET_TYPE" -> IPSET_TYPE
    | `String "PREDICATE_TYPE" -> PREDICATE_TYPE
    | `String "WAF_OVERRIDE_ACTION" -> WAF_OVERRIDE_ACTION
    | `String "WAF_ACTION" -> WAF_ACTION
    | `String "CHANGE_ACTION" -> CHANGE_ACTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParameterExceptionField" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterExceptionField")

let parameter_exception_parameter_of_yojson = string_of_yojson

let parameter_exception_reason_of_yojson = 
  fun (tree: t) path : parameter_exception_reason -> match tree with 
    | `String "INVALID_TAG_KEY" -> INVALID_TAG_KEY
    | `String "ILLEGAL_ARGUMENT" -> ILLEGAL_ARGUMENT
    | `String "ILLEGAL_COMBINATION" -> ILLEGAL_COMBINATION
    | `String "INVALID_OPTION" -> INVALID_OPTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParameterExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterExceptionReason")

let waf_invalid_parameter_exception_of_yojson = 
  fun tree path : waf_invalid_parameter_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_invalid_parameter_exception = {
    reason = option_of_yojson (value_for_key (parameter_exception_reason_of_yojson) "reason") _list path;
    parameter = option_of_yojson (value_for_key (parameter_exception_parameter_of_yojson) "parameter") _list path;
    field = option_of_yojson (value_for_key (parameter_exception_field_of_yojson) "field") _list path;
    
  }
  in _res

let waf_invalid_operation_exception_of_yojson = 
  fun tree path : waf_invalid_operation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_invalid_operation_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_invalid_account_exception_of_yojson = 
  fun tree path : waf_invalid_account_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_invalid_account_exception = ()
  in _res

let waf_internal_error_exception_of_yojson = 
  fun tree path : waf_internal_error_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_internal_error_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let migration_error_type_of_yojson = 
  fun (tree: t) path : migration_error_type -> match tree with 
    | `String "S3_INTERNAL_ERROR" -> S3_INTERNAL_ERROR
    | `String "S3_BUCKET_INVALID_REGION" -> S3_BUCKET_INVALID_REGION
    | `String "S3_BUCKET_NOT_FOUND" -> S3_BUCKET_NOT_FOUND
    | `String "S3_BUCKET_NOT_ACCESSIBLE" -> S3_BUCKET_NOT_ACCESSIBLE
    | `String "S3_BUCKET_NO_PERMISSION" -> S3_BUCKET_NO_PERMISSION
    | `String "ENTITY_NOT_FOUND" -> ENTITY_NOT_FOUND
    | `String "ENTITY_NOT_SUPPORTED" -> ENTITY_NOT_SUPPORTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "MigrationErrorType" value)
    | _ -> raise (deserialize_wrong_type_error path "MigrationErrorType")

let error_reason_of_yojson = string_of_yojson

let waf_entity_migration_exception_of_yojson = 
  fun tree path : waf_entity_migration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_entity_migration_exception = {
    migration_error_reason = option_of_yojson (value_for_key (error_reason_of_yojson) "MigrationErrorReason") _list path;
    migration_error_type = option_of_yojson (value_for_key (migration_error_type_of_yojson) "MigrationErrorType") _list path;
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_disallowed_name_exception_of_yojson = 
  fun tree path : waf_disallowed_name_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_disallowed_name_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let waf_bad_request_exception_of_yojson = 
  fun tree path : waf_bad_request_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : waf_bad_request_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let change_token_of_yojson = string_of_yojson

let update_xss_match_set_response_of_yojson = 
  fun tree path : update_xss_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_xss_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let update_xss_match_set_request_of_yojson = 
  fun tree path : update_xss_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_xss_match_set_request = {
    updates = value_for_key (xss_match_set_updates_of_yojson) "Updates" _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    xss_match_set_id = value_for_key (resource_id_of_yojson) "XssMatchSetId" _list path;
    
  }
  in _res

let update_web_acl_response_of_yojson = 
  fun tree path : update_web_acl_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_web_acl_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let update_web_acl_request_of_yojson = 
  fun tree path : update_web_acl_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_web_acl_request = {
    default_action = option_of_yojson (value_for_key (waf_action_of_yojson) "DefaultAction") _list path;
    updates = option_of_yojson (value_for_key (web_acl_updates_of_yojson) "Updates") _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    web_acl_id = value_for_key (resource_id_of_yojson) "WebACLId" _list path;
    
  }
  in _res

let update_sql_injection_match_set_response_of_yojson = 
  fun tree path : update_sql_injection_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_sql_injection_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let sql_injection_match_tuple_of_yojson = 
  fun tree path : sql_injection_match_tuple ->
  let _list = assoc_of_yojson tree path in
  let _res : sql_injection_match_tuple = {
    text_transformation = value_for_key (text_transformation_of_yojson) "TextTransformation" _list path;
    field_to_match = value_for_key (field_to_match_of_yojson) "FieldToMatch" _list path;
    
  }
  in _res

let sql_injection_match_set_update_of_yojson = 
  fun tree path : sql_injection_match_set_update ->
  let _list = assoc_of_yojson tree path in
  let _res : sql_injection_match_set_update = {
    sql_injection_match_tuple = value_for_key (sql_injection_match_tuple_of_yojson) "SqlInjectionMatchTuple" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let sql_injection_match_set_updates_of_yojson = 
  fun tree path -> list_of_yojson sql_injection_match_set_update_of_yojson tree path 

let update_sql_injection_match_set_request_of_yojson = 
  fun tree path : update_sql_injection_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_sql_injection_match_set_request = {
    updates = value_for_key (sql_injection_match_set_updates_of_yojson) "Updates" _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    sql_injection_match_set_id = value_for_key (resource_id_of_yojson) "SqlInjectionMatchSetId" _list path;
    
  }
  in _res

let update_size_constraint_set_response_of_yojson = 
  fun tree path : update_size_constraint_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_size_constraint_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let comparison_operator_of_yojson = 
  fun (tree: t) path : comparison_operator -> match tree with 
    | `String "GT" -> GT
    | `String "GE" -> GE
    | `String "LT" -> LT
    | `String "LE" -> LE
    | `String "NE" -> NE
    | `String "EQ" -> EQ
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")

let size_of_yojson = long_of_yojson

let size_constraint_of_yojson = 
  fun tree path : size_constraint ->
  let _list = assoc_of_yojson tree path in
  let _res : size_constraint = {
    size = value_for_key (size_of_yojson) "Size" _list path;
    comparison_operator = value_for_key (comparison_operator_of_yojson) "ComparisonOperator" _list path;
    text_transformation = value_for_key (text_transformation_of_yojson) "TextTransformation" _list path;
    field_to_match = value_for_key (field_to_match_of_yojson) "FieldToMatch" _list path;
    
  }
  in _res

let size_constraint_set_update_of_yojson = 
  fun tree path : size_constraint_set_update ->
  let _list = assoc_of_yojson tree path in
  let _res : size_constraint_set_update = {
    size_constraint = value_for_key (size_constraint_of_yojson) "SizeConstraint" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let size_constraint_set_updates_of_yojson = 
  fun tree path -> list_of_yojson size_constraint_set_update_of_yojson tree path 

let update_size_constraint_set_request_of_yojson = 
  fun tree path : update_size_constraint_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_size_constraint_set_request = {
    updates = value_for_key (size_constraint_set_updates_of_yojson) "Updates" _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    size_constraint_set_id = value_for_key (resource_id_of_yojson) "SizeConstraintSetId" _list path;
    
  }
  in _res

let update_rule_response_of_yojson = 
  fun tree path : update_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_rule_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let negated_of_yojson = bool_of_yojson

let predicate_type_of_yojson = 
  fun (tree: t) path : predicate_type -> match tree with 
    | `String "RegexMatch" -> REGEX_MATCH
    | `String "XssMatch" -> XSS_MATCH
    | `String "SizeConstraint" -> SIZE_CONSTRAINT
    | `String "GeoMatch" -> GEO_MATCH
    | `String "SqlInjectionMatch" -> SQL_INJECTION_MATCH
    | `String "ByteMatch" -> BYTE_MATCH
    | `String "IPMatch" -> IP_MATCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "PredicateType" value)
    | _ -> raise (deserialize_wrong_type_error path "PredicateType")

let predicate_of_yojson = 
  fun tree path : predicate ->
  let _list = assoc_of_yojson tree path in
  let _res : predicate = {
    data_id = value_for_key (resource_id_of_yojson) "DataId" _list path;
    type_ = value_for_key (predicate_type_of_yojson) "Type" _list path;
    negated = value_for_key (negated_of_yojson) "Negated" _list path;
    
  }
  in _res

let rule_update_of_yojson = 
  fun tree path : rule_update ->
  let _list = assoc_of_yojson tree path in
  let _res : rule_update = {
    predicate = value_for_key (predicate_of_yojson) "Predicate" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let rule_updates_of_yojson = 
  fun tree path -> list_of_yojson rule_update_of_yojson tree path 

let update_rule_request_of_yojson = 
  fun tree path : update_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_rule_request = {
    updates = value_for_key (rule_updates_of_yojson) "Updates" _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let update_rule_group_response_of_yojson = 
  fun tree path : update_rule_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_rule_group_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let rule_group_update_of_yojson = 
  fun tree path : rule_group_update ->
  let _list = assoc_of_yojson tree path in
  let _res : rule_group_update = {
    activated_rule = value_for_key (activated_rule_of_yojson) "ActivatedRule" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let rule_group_updates_of_yojson = 
  fun tree path -> list_of_yojson rule_group_update_of_yojson tree path 

let update_rule_group_request_of_yojson = 
  fun tree path : update_rule_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_rule_group_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    updates = value_for_key (rule_group_updates_of_yojson) "Updates" _list path;
    rule_group_id = value_for_key (resource_id_of_yojson) "RuleGroupId" _list path;
    
  }
  in _res

let update_regex_pattern_set_response_of_yojson = 
  fun tree path : update_regex_pattern_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_regex_pattern_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let regex_pattern_string_of_yojson = string_of_yojson

let regex_pattern_set_update_of_yojson = 
  fun tree path : regex_pattern_set_update ->
  let _list = assoc_of_yojson tree path in
  let _res : regex_pattern_set_update = {
    regex_pattern_string = value_for_key (regex_pattern_string_of_yojson) "RegexPatternString" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let regex_pattern_set_updates_of_yojson = 
  fun tree path -> list_of_yojson regex_pattern_set_update_of_yojson tree path 

let update_regex_pattern_set_request_of_yojson = 
  fun tree path : update_regex_pattern_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_regex_pattern_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    updates = value_for_key (regex_pattern_set_updates_of_yojson) "Updates" _list path;
    regex_pattern_set_id = value_for_key (resource_id_of_yojson) "RegexPatternSetId" _list path;
    
  }
  in _res

let update_regex_match_set_response_of_yojson = 
  fun tree path : update_regex_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_regex_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let regex_match_tuple_of_yojson = 
  fun tree path : regex_match_tuple ->
  let _list = assoc_of_yojson tree path in
  let _res : regex_match_tuple = {
    regex_pattern_set_id = value_for_key (resource_id_of_yojson) "RegexPatternSetId" _list path;
    text_transformation = value_for_key (text_transformation_of_yojson) "TextTransformation" _list path;
    field_to_match = value_for_key (field_to_match_of_yojson) "FieldToMatch" _list path;
    
  }
  in _res

let regex_match_set_update_of_yojson = 
  fun tree path : regex_match_set_update ->
  let _list = assoc_of_yojson tree path in
  let _res : regex_match_set_update = {
    regex_match_tuple = value_for_key (regex_match_tuple_of_yojson) "RegexMatchTuple" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let regex_match_set_updates_of_yojson = 
  fun tree path -> list_of_yojson regex_match_set_update_of_yojson tree path 

let update_regex_match_set_request_of_yojson = 
  fun tree path : update_regex_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_regex_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    updates = value_for_key (regex_match_set_updates_of_yojson) "Updates" _list path;
    regex_match_set_id = value_for_key (resource_id_of_yojson) "RegexMatchSetId" _list path;
    
  }
  in _res

let update_rate_based_rule_response_of_yojson = 
  fun tree path : update_rate_based_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_rate_based_rule_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let rate_limit_of_yojson = long_of_yojson

let update_rate_based_rule_request_of_yojson = 
  fun tree path : update_rate_based_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_rate_based_rule_request = {
    rate_limit = value_for_key (rate_limit_of_yojson) "RateLimit" _list path;
    updates = value_for_key (rule_updates_of_yojson) "Updates" _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let update_ip_set_response_of_yojson = 
  fun tree path : update_ip_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_ip_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let ip_set_descriptor_type_of_yojson = 
  fun (tree: t) path : ip_set_descriptor_type -> match tree with 
    | `String "IPV6" -> IPV6
    | `String "IPV4" -> IPV4
    | `String value -> raise (deserialize_unknown_enum_value_error path "IPSetDescriptorType" value)
    | _ -> raise (deserialize_wrong_type_error path "IPSetDescriptorType")

let ip_set_descriptor_value_of_yojson = string_of_yojson

let ip_set_descriptor_of_yojson = 
  fun tree path : ip_set_descriptor ->
  let _list = assoc_of_yojson tree path in
  let _res : ip_set_descriptor = {
    value = value_for_key (ip_set_descriptor_value_of_yojson) "Value" _list path;
    type_ = value_for_key (ip_set_descriptor_type_of_yojson) "Type" _list path;
    
  }
  in _res

let ip_set_update_of_yojson = 
  fun tree path : ip_set_update ->
  let _list = assoc_of_yojson tree path in
  let _res : ip_set_update = {
    ip_set_descriptor = value_for_key (ip_set_descriptor_of_yojson) "IPSetDescriptor" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let ip_set_updates_of_yojson = 
  fun tree path -> list_of_yojson ip_set_update_of_yojson tree path 

let update_ip_set_request_of_yojson = 
  fun tree path : update_ip_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_ip_set_request = {
    updates = value_for_key (ip_set_updates_of_yojson) "Updates" _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    ip_set_id = value_for_key (resource_id_of_yojson) "IPSetId" _list path;
    
  }
  in _res

let update_geo_match_set_response_of_yojson = 
  fun tree path : update_geo_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_geo_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let geo_match_constraint_type_of_yojson = 
  fun (tree: t) path : geo_match_constraint_type -> match tree with 
    | `String "Country" -> Country
    | `String value -> raise (deserialize_unknown_enum_value_error path "GeoMatchConstraintType" value)
    | _ -> raise (deserialize_wrong_type_error path "GeoMatchConstraintType")

let geo_match_constraint_value_of_yojson = 
  fun (tree: t) path : geo_match_constraint_value -> match tree with 
    | `String "ZW" -> ZW
    | `String "ZM" -> ZM
    | `String "YE" -> YE
    | `String "EH" -> EH
    | `String "WF" -> WF
    | `String "VI" -> VI
    | `String "VG" -> VG
    | `String "VN" -> VN
    | `String "VE" -> VE
    | `String "VU" -> VU
    | `String "UZ" -> UZ
    | `String "UY" -> UY
    | `String "UM" -> UM
    | `String "US" -> US
    | `String "GB" -> GB
    | `String "AE" -> AE
    | `String "UA" -> UA
    | `String "UG" -> UG
    | `String "TV" -> TV
    | `String "TC" -> TC
    | `String "TM" -> TM
    | `String "TR" -> TR
    | `String "TN" -> TN
    | `String "TT" -> TT
    | `String "TO" -> TO
    | `String "TK" -> TK
    | `String "TG" -> TG
    | `String "TL" -> TL
    | `String "TH" -> TH
    | `String "TZ" -> TZ
    | `String "TJ" -> TJ
    | `String "TW" -> TW
    | `String "SY" -> SY
    | `String "CH" -> CH
    | `String "SE" -> SE
    | `String "SZ" -> SZ
    | `String "SJ" -> SJ
    | `String "SR" -> SR
    | `String "SD" -> SD
    | `String "LK" -> LK
    | `String "ES" -> ES
    | `String "SS" -> SS
    | `String "GS" -> GS
    | `String "ZA" -> ZA
    | `String "SO" -> SO
    | `String "SB" -> SB
    | `String "SI" -> SI
    | `String "SK" -> SK
    | `String "SX" -> SX
    | `String "SG" -> SG
    | `String "SL" -> SL
    | `String "SC" -> SC
    | `String "RS" -> RS
    | `String "SN" -> SN
    | `String "SA" -> SA
    | `String "ST" -> ST
    | `String "SM" -> SM
    | `String "WS" -> WS
    | `String "VC" -> VC
    | `String "PM" -> PM
    | `String "MF" -> MF
    | `String "LC" -> LC
    | `String "KN" -> KN
    | `String "SH" -> SH
    | `String "BL" -> BL
    | `String "RW" -> RW
    | `String "RU" -> RU
    | `String "RO" -> RO
    | `String "RE" -> RE
    | `String "QA" -> QA
    | `String "PR" -> PR
    | `String "PT" -> PT
    | `String "PL" -> PL
    | `String "PN" -> PN
    | `String "PH" -> PH
    | `String "PE" -> PE
    | `String "PY" -> PY
    | `String "PG" -> PG
    | `String "PA" -> PA
    | `String "PS" -> PS
    | `String "PW" -> PW
    | `String "PK" -> PK
    | `String "OM" -> OM
    | `String "NO" -> NO
    | `String "MP" -> MP
    | `String "NF" -> NF
    | `String "NU" -> NU
    | `String "NG" -> NG
    | `String "NE" -> NE
    | `String "NI" -> NI
    | `String "NZ" -> NZ
    | `String "NC" -> NC
    | `String "NL" -> NL
    | `String "NP" -> NP
    | `String "NR" -> NR
    | `String "NA" -> NA
    | `String "MM" -> MM
    | `String "MZ" -> MZ
    | `String "MA" -> MA
    | `String "MS" -> MS
    | `String "ME" -> ME
    | `String "MN" -> MN
    | `String "MC" -> MC
    | `String "MD" -> MD
    | `String "FM" -> FM
    | `String "MX" -> MX
    | `String "YT" -> YT
    | `String "MU" -> MU
    | `String "MR" -> MR
    | `String "MQ" -> MQ
    | `String "MH" -> MH
    | `String "MT" -> MT
    | `String "ML" -> ML
    | `String "MV" -> MV
    | `String "MY" -> MY
    | `String "MW" -> MW
    | `String "MG" -> MG
    | `String "MK" -> MK
    | `String "MO" -> MO
    | `String "LU" -> LU
    | `String "LT" -> LT
    | `String "LI" -> LI
    | `String "LY" -> LY
    | `String "LR" -> LR
    | `String "LS" -> LS
    | `String "LB" -> LB
    | `String "LV" -> LV
    | `String "LA" -> LA
    | `String "KG" -> KG
    | `String "KW" -> KW
    | `String "KR" -> KR
    | `String "KP" -> KP
    | `String "KI" -> KI
    | `String "KE" -> KE
    | `String "KZ" -> KZ
    | `String "JO" -> JO
    | `String "JE" -> JE
    | `String "JP" -> JP
    | `String "JM" -> JM
    | `String "IT" -> IT
    | `String "IL" -> IL
    | `String "IM" -> IM
    | `String "IE" -> IE
    | `String "IQ" -> IQ
    | `String "IR" -> IR
    | `String "ID" -> ID
    | `String "IN" -> IN
    | `String "IS" -> IS
    | `String "HU" -> HU
    | `String "HK" -> HK
    | `String "HN" -> HN
    | `String "VA" -> VA
    | `String "HM" -> HM
    | `String "HT" -> HT
    | `String "GY" -> GY
    | `String "GW" -> GW
    | `String "GN" -> GN
    | `String "GG" -> GG
    | `String "GT" -> GT
    | `String "GU" -> GU
    | `String "GP" -> GP
    | `String "GD" -> GD
    | `String "GL" -> GL
    | `String "GR" -> GR
    | `String "GI" -> GI
    | `String "GH" -> GH
    | `String "DE" -> DE
    | `String "GE" -> GE
    | `String "GM" -> GM
    | `String "GA" -> GA
    | `String "TF" -> TF
    | `String "PF" -> PF
    | `String "GF" -> GF
    | `String "FR" -> FR
    | `String "FI" -> FI
    | `String "FJ" -> FJ
    | `String "FO" -> FO
    | `String "FK" -> FK
    | `String "ET" -> ET
    | `String "EE" -> EE
    | `String "ER" -> ER
    | `String "GQ" -> GQ
    | `String "SV" -> SV
    | `String "EG" -> EG
    | `String "EC" -> EC
    | `String "DO" -> DO
    | `String "DM" -> DM
    | `String "DJ" -> DJ
    | `String "DK" -> DK
    | `String "CZ" -> CZ
    | `String "CY" -> CY
    | `String "CW" -> CW
    | `String "CU" -> CU
    | `String "HR" -> HR
    | `String "CI" -> CI
    | `String "CR" -> CR
    | `String "CK" -> CK
    | `String "CD" -> CD
    | `String "CG" -> CG
    | `String "KM" -> KM
    | `String "CO" -> CO
    | `String "CC" -> CC
    | `String "CX" -> CX
    | `String "CN" -> CN
    | `String "CL" -> CL
    | `String "TD" -> TD
    | `String "CF" -> CF
    | `String "KY" -> KY
    | `String "CV" -> CV
    | `String "CA" -> CA
    | `String "CM" -> CM
    | `String "KH" -> KH
    | `String "BI" -> BI
    | `String "BF" -> BF
    | `String "BG" -> BG
    | `String "BN" -> BN
    | `String "IO" -> IO
    | `String "BR" -> BR
    | `String "BV" -> BV
    | `String "BW" -> BW
    | `String "BA" -> BA
    | `String "BQ" -> BQ
    | `String "BO" -> BO
    | `String "BT" -> BT
    | `String "BM" -> BM
    | `String "BJ" -> BJ
    | `String "BZ" -> BZ
    | `String "BE" -> BE
    | `String "BY" -> BY
    | `String "BB" -> BB
    | `String "BD" -> BD
    | `String "BH" -> BH
    | `String "BS" -> BS
    | `String "AZ" -> AZ
    | `String "AT" -> AT
    | `String "AU" -> AU
    | `String "AW" -> AW
    | `String "AM" -> AM
    | `String "AR" -> AR
    | `String "AG" -> AG
    | `String "AQ" -> AQ
    | `String "AI" -> AI
    | `String "AO" -> AO
    | `String "AD" -> AD
    | `String "AS" -> AS
    | `String "DZ" -> DZ
    | `String "AL" -> AL
    | `String "AX" -> AX
    | `String "AF" -> AF
    | `String value -> raise (deserialize_unknown_enum_value_error path "GeoMatchConstraintValue" value)
    | _ -> raise (deserialize_wrong_type_error path "GeoMatchConstraintValue")

let geo_match_constraint_of_yojson = 
  fun tree path : geo_match_constraint ->
  let _list = assoc_of_yojson tree path in
  let _res : geo_match_constraint = {
    value = value_for_key (geo_match_constraint_value_of_yojson) "Value" _list path;
    type_ = value_for_key (geo_match_constraint_type_of_yojson) "Type" _list path;
    
  }
  in _res

let geo_match_set_update_of_yojson = 
  fun tree path : geo_match_set_update ->
  let _list = assoc_of_yojson tree path in
  let _res : geo_match_set_update = {
    geo_match_constraint = value_for_key (geo_match_constraint_of_yojson) "GeoMatchConstraint" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let geo_match_set_updates_of_yojson = 
  fun tree path -> list_of_yojson geo_match_set_update_of_yojson tree path 

let update_geo_match_set_request_of_yojson = 
  fun tree path : update_geo_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_geo_match_set_request = {
    updates = value_for_key (geo_match_set_updates_of_yojson) "Updates" _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    geo_match_set_id = value_for_key (resource_id_of_yojson) "GeoMatchSetId" _list path;
    
  }
  in _res

let update_byte_match_set_response_of_yojson = 
  fun tree path : update_byte_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_byte_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let byte_match_target_string_of_yojson = blob_of_yojson

let positional_constraint_of_yojson = 
  fun (tree: t) path : positional_constraint -> match tree with 
    | `String "CONTAINS_WORD" -> CONTAINS_WORD
    | `String "CONTAINS" -> CONTAINS
    | `String "ENDS_WITH" -> ENDS_WITH
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String "EXACTLY" -> EXACTLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "PositionalConstraint" value)
    | _ -> raise (deserialize_wrong_type_error path "PositionalConstraint")

let byte_match_tuple_of_yojson = 
  fun tree path : byte_match_tuple ->
  let _list = assoc_of_yojson tree path in
  let _res : byte_match_tuple = {
    positional_constraint = value_for_key (positional_constraint_of_yojson) "PositionalConstraint" _list path;
    text_transformation = value_for_key (text_transformation_of_yojson) "TextTransformation" _list path;
    target_string = value_for_key (byte_match_target_string_of_yojson) "TargetString" _list path;
    field_to_match = value_for_key (field_to_match_of_yojson) "FieldToMatch" _list path;
    
  }
  in _res

let byte_match_set_update_of_yojson = 
  fun tree path : byte_match_set_update ->
  let _list = assoc_of_yojson tree path in
  let _res : byte_match_set_update = {
    byte_match_tuple = value_for_key (byte_match_tuple_of_yojson) "ByteMatchTuple" _list path;
    action = value_for_key (change_action_of_yojson) "Action" _list path;
    
  }
  in _res

let byte_match_set_updates_of_yojson = 
  fun tree path -> list_of_yojson byte_match_set_update_of_yojson tree path 

let update_byte_match_set_request_of_yojson = 
  fun tree path : update_byte_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_byte_match_set_request = {
    updates = value_for_key (byte_match_set_updates_of_yojson) "Updates" _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    byte_match_set_id = value_for_key (resource_id_of_yojson) "ByteMatchSetId" _list path;
    
  }
  in _res

let untag_resource_response_of_yojson = 
  fun tree path : untag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_response = ()
  in _res

let tag_key_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "TagKeys" _list path;
    resource_ar_n = value_for_key (resource_arn_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let uri_string_of_yojson = string_of_yojson

let timestamp__of_yojson = timestamp_of_yojson

let time_window_of_yojson = 
  fun tree path : time_window ->
  let _list = assoc_of_yojson tree path in
  let _res : time_window = {
    end_time = value_for_key (timestamp__of_yojson) "EndTime" _list path;
    start_time = value_for_key (timestamp__of_yojson) "StartTime" _list path;
    
  }
  in _res

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson = 
  fun tree path : tag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_response = ()
  in _res

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = value_for_key (tag_value_of_yojson) "Value" _list path;
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_resource_request_of_yojson = 
  fun tree path : tag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    resource_ar_n = value_for_key (resource_arn_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let tag_info_for_resource_of_yojson = 
  fun tree path : tag_info_for_resource ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_info_for_resource = {
    tag_list = option_of_yojson (value_for_key (tag_list_of_yojson) "TagList") _list path;
    resource_ar_n = option_of_yojson (value_for_key (resource_arn_of_yojson) "ResourceARN") _list path;
    
  }
  in _res

let subscribed_rule_group_summary_of_yojson = 
  fun tree path : subscribed_rule_group_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : subscribed_rule_group_summary = {
    metric_name = value_for_key (metric_name_of_yojson) "MetricName" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    rule_group_id = value_for_key (resource_id_of_yojson) "RuleGroupId" _list path;
    
  }
  in _res

let subscribed_rule_group_summaries_of_yojson = 
  fun tree path -> list_of_yojson subscribed_rule_group_summary_of_yojson tree path 

let sql_injection_match_tuples_of_yojson = 
  fun tree path -> list_of_yojson sql_injection_match_tuple_of_yojson tree path 

let sql_injection_match_set_summary_of_yojson = 
  fun tree path : sql_injection_match_set_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : sql_injection_match_set_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    sql_injection_match_set_id = value_for_key (resource_id_of_yojson) "SqlInjectionMatchSetId" _list path;
    
  }
  in _res

let sql_injection_match_set_summaries_of_yojson = 
  fun tree path -> list_of_yojson sql_injection_match_set_summary_of_yojson tree path 

let sql_injection_match_set_of_yojson = 
  fun tree path : sql_injection_match_set ->
  let _list = assoc_of_yojson tree path in
  let _res : sql_injection_match_set = {
    sql_injection_match_tuples = value_for_key (sql_injection_match_tuples_of_yojson) "SqlInjectionMatchTuples" _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    sql_injection_match_set_id = value_for_key (resource_id_of_yojson) "SqlInjectionMatchSetId" _list path;
    
  }
  in _res

let size_constraints_of_yojson = 
  fun tree path -> list_of_yojson size_constraint_of_yojson tree path 

let size_constraint_set_summary_of_yojson = 
  fun tree path : size_constraint_set_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : size_constraint_set_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    size_constraint_set_id = value_for_key (resource_id_of_yojson) "SizeConstraintSetId" _list path;
    
  }
  in _res

let size_constraint_set_summaries_of_yojson = 
  fun tree path -> list_of_yojson size_constraint_set_summary_of_yojson tree path 

let size_constraint_set_of_yojson = 
  fun tree path : size_constraint_set ->
  let _list = assoc_of_yojson tree path in
  let _res : size_constraint_set = {
    size_constraints = value_for_key (size_constraints_of_yojson) "SizeConstraints" _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    size_constraint_set_id = value_for_key (resource_id_of_yojson) "SizeConstraintSetId" _list path;
    
  }
  in _res

let ip_string_of_yojson = string_of_yojson

let country_of_yojson = string_of_yojson

let http_method_of_yojson = string_of_yojson

let http_version_of_yojson = string_of_yojson

let header_name_of_yojson = string_of_yojson

let header_value_of_yojson = string_of_yojson

let http_header_of_yojson = 
  fun tree path : http_header ->
  let _list = assoc_of_yojson tree path in
  let _res : http_header = {
    value = option_of_yojson (value_for_key (header_value_of_yojson) "Value") _list path;
    name = option_of_yojson (value_for_key (header_name_of_yojson) "Name") _list path;
    
  }
  in _res

let http_headers_of_yojson = 
  fun tree path -> list_of_yojson http_header_of_yojson tree path 

let http_request_of_yojson = 
  fun tree path : http_request ->
  let _list = assoc_of_yojson tree path in
  let _res : http_request = {
    headers = option_of_yojson (value_for_key (http_headers_of_yojson) "Headers") _list path;
    http_version = option_of_yojson (value_for_key (http_version_of_yojson) "HTTPVersion") _list path;
    method_ = option_of_yojson (value_for_key (http_method_of_yojson) "Method") _list path;
    ur_i = option_of_yojson (value_for_key (uri_string_of_yojson) "URI") _list path;
    country = option_of_yojson (value_for_key (country_of_yojson) "Country") _list path;
    client_i_p = option_of_yojson (value_for_key (ip_string_of_yojson) "ClientIP") _list path;
    
  }
  in _res

let sample_weight_of_yojson = long_of_yojson

let action_of_yojson = string_of_yojson

let sampled_http_request_of_yojson = 
  fun tree path : sampled_http_request ->
  let _list = assoc_of_yojson tree path in
  let _res : sampled_http_request = {
    rule_within_rule_group = option_of_yojson (value_for_key (resource_id_of_yojson) "RuleWithinRuleGroup") _list path;
    action = option_of_yojson (value_for_key (action_of_yojson) "Action") _list path;
    timestamp_ = option_of_yojson (value_for_key (timestamp__of_yojson) "Timestamp") _list path;
    weight = value_for_key (sample_weight_of_yojson) "Weight" _list path;
    request = value_for_key (http_request_of_yojson) "Request" _list path;
    
  }
  in _res

let sampled_http_requests_of_yojson = 
  fun tree path -> list_of_yojson sampled_http_request_of_yojson tree path 

let s3_object_url_of_yojson = string_of_yojson

let s3_bucket_name_of_yojson = string_of_yojson

let rule_summary_of_yojson = 
  fun tree path : rule_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : rule_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let rule_summaries_of_yojson = 
  fun tree path -> list_of_yojson rule_summary_of_yojson tree path 

let rule_group_summary_of_yojson = 
  fun tree path : rule_group_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : rule_group_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    rule_group_id = value_for_key (resource_id_of_yojson) "RuleGroupId" _list path;
    
  }
  in _res

let rule_group_summaries_of_yojson = 
  fun tree path -> list_of_yojson rule_group_summary_of_yojson tree path 

let rule_group_of_yojson = 
  fun tree path : rule_group ->
  let _list = assoc_of_yojson tree path in
  let _res : rule_group = {
    metric_name = option_of_yojson (value_for_key (metric_name_of_yojson) "MetricName") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    rule_group_id = value_for_key (resource_id_of_yojson) "RuleGroupId" _list path;
    
  }
  in _res

let predicates_of_yojson = 
  fun tree path -> list_of_yojson predicate_of_yojson tree path 

let rule_of_yojson = 
  fun tree path : rule ->
  let _list = assoc_of_yojson tree path in
  let _res : rule = {
    predicates = value_for_key (predicates_of_yojson) "Predicates" _list path;
    metric_name = option_of_yojson (value_for_key (metric_name_of_yojson) "MetricName") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let regex_pattern_strings_of_yojson = 
  fun tree path -> list_of_yojson regex_pattern_string_of_yojson tree path 

let regex_pattern_set_summary_of_yojson = 
  fun tree path : regex_pattern_set_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : regex_pattern_set_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    regex_pattern_set_id = value_for_key (resource_id_of_yojson) "RegexPatternSetId" _list path;
    
  }
  in _res

let regex_pattern_set_summaries_of_yojson = 
  fun tree path -> list_of_yojson regex_pattern_set_summary_of_yojson tree path 

let regex_pattern_set_of_yojson = 
  fun tree path : regex_pattern_set ->
  let _list = assoc_of_yojson tree path in
  let _res : regex_pattern_set = {
    regex_pattern_strings = value_for_key (regex_pattern_strings_of_yojson) "RegexPatternStrings" _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    regex_pattern_set_id = value_for_key (resource_id_of_yojson) "RegexPatternSetId" _list path;
    
  }
  in _res

let regex_match_tuples_of_yojson = 
  fun tree path -> list_of_yojson regex_match_tuple_of_yojson tree path 

let regex_match_set_summary_of_yojson = 
  fun tree path : regex_match_set_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : regex_match_set_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    regex_match_set_id = value_for_key (resource_id_of_yojson) "RegexMatchSetId" _list path;
    
  }
  in _res

let regex_match_set_summaries_of_yojson = 
  fun tree path -> list_of_yojson regex_match_set_summary_of_yojson tree path 

let regex_match_set_of_yojson = 
  fun tree path : regex_match_set ->
  let _list = assoc_of_yojson tree path in
  let _res : regex_match_set = {
    regex_match_tuples = option_of_yojson (value_for_key (regex_match_tuples_of_yojson) "RegexMatchTuples") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    regex_match_set_id = option_of_yojson (value_for_key (resource_id_of_yojson) "RegexMatchSetId") _list path;
    
  }
  in _res

let redacted_fields_of_yojson = 
  fun tree path -> list_of_yojson field_to_match_of_yojson tree path 

let rate_key_of_yojson = 
  fun (tree: t) path : rate_key -> match tree with 
    | `String "IP" -> IP
    | `String value -> raise (deserialize_unknown_enum_value_error path "RateKey" value)
    | _ -> raise (deserialize_wrong_type_error path "RateKey")

let rate_based_rule_of_yojson = 
  fun tree path : rate_based_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : rate_based_rule = {
    rate_limit = value_for_key (rate_limit_of_yojson) "RateLimit" _list path;
    rate_key = value_for_key (rate_key_of_yojson) "RateKey" _list path;
    match_predicates = value_for_key (predicates_of_yojson) "MatchPredicates" _list path;
    metric_name = option_of_yojson (value_for_key (metric_name_of_yojson) "MetricName") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let put_permission_policy_response_of_yojson = 
  fun tree path : put_permission_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_permission_policy_response = ()
  in _res

let policy_string_of_yojson = string_of_yojson

let put_permission_policy_request_of_yojson = 
  fun tree path : put_permission_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_permission_policy_request = {
    policy = value_for_key (policy_string_of_yojson) "Policy" _list path;
    resource_arn = value_for_key (resource_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let log_destination_configs_of_yojson = 
  fun tree path -> list_of_yojson resource_arn_of_yojson tree path 

let logging_configuration_of_yojson = 
  fun tree path : logging_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : logging_configuration = {
    redacted_fields = option_of_yojson (value_for_key (redacted_fields_of_yojson) "RedactedFields") _list path;
    log_destination_configs = value_for_key (log_destination_configs_of_yojson) "LogDestinationConfigs" _list path;
    resource_arn = value_for_key (resource_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let put_logging_configuration_response_of_yojson = 
  fun tree path : put_logging_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_logging_configuration_response = {
    logging_configuration = option_of_yojson (value_for_key (logging_configuration_of_yojson) "LoggingConfiguration") _list path;
    
  }
  in _res

let put_logging_configuration_request_of_yojson = 
  fun tree path : put_logging_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_logging_configuration_request = {
    logging_configuration = value_for_key (logging_configuration_of_yojson) "LoggingConfiguration" _list path;
    
  }
  in _res

let population_size_of_yojson = long_of_yojson

let pagination_limit_of_yojson = int_of_yojson

let next_marker_of_yojson = string_of_yojson

let managed_key_of_yojson = string_of_yojson

let managed_keys_of_yojson = 
  fun tree path -> list_of_yojson managed_key_of_yojson tree path 

let logging_configurations_of_yojson = 
  fun tree path -> list_of_yojson logging_configuration_of_yojson tree path 

let list_xss_match_sets_response_of_yojson = 
  fun tree path : list_xss_match_sets_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_xss_match_sets_response = {
    xss_match_sets = option_of_yojson (value_for_key (xss_match_set_summaries_of_yojson) "XssMatchSets") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_xss_match_sets_request_of_yojson = 
  fun tree path : list_xss_match_sets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_xss_match_sets_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_web_ac_ls_response_of_yojson = 
  fun tree path : list_web_ac_ls_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_web_ac_ls_response = {
    web_ac_ls = option_of_yojson (value_for_key (web_acl_summaries_of_yojson) "WebACLs") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_web_ac_ls_request_of_yojson = 
  fun tree path : list_web_ac_ls_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_web_ac_ls_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_tags_for_resource_response_of_yojson = 
  fun tree path : list_tags_for_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_response = {
    tag_info_for_resource = option_of_yojson (value_for_key (tag_info_for_resource_of_yojson) "TagInfoForResource") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_tags_for_resource_request_of_yojson = 
  fun tree path : list_tags_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request = {
    resource_ar_n = value_for_key (resource_arn_of_yojson) "ResourceARN" _list path;
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_subscribed_rule_groups_response_of_yojson = 
  fun tree path : list_subscribed_rule_groups_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_subscribed_rule_groups_response = {
    rule_groups = option_of_yojson (value_for_key (subscribed_rule_group_summaries_of_yojson) "RuleGroups") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_subscribed_rule_groups_request_of_yojson = 
  fun tree path : list_subscribed_rule_groups_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_subscribed_rule_groups_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_sql_injection_match_sets_response_of_yojson = 
  fun tree path : list_sql_injection_match_sets_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_sql_injection_match_sets_response = {
    sql_injection_match_sets = option_of_yojson (value_for_key (sql_injection_match_set_summaries_of_yojson) "SqlInjectionMatchSets") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_sql_injection_match_sets_request_of_yojson = 
  fun tree path : list_sql_injection_match_sets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_sql_injection_match_sets_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_size_constraint_sets_response_of_yojson = 
  fun tree path : list_size_constraint_sets_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_size_constraint_sets_response = {
    size_constraint_sets = option_of_yojson (value_for_key (size_constraint_set_summaries_of_yojson) "SizeConstraintSets") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_size_constraint_sets_request_of_yojson = 
  fun tree path : list_size_constraint_sets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_size_constraint_sets_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_rules_response_of_yojson = 
  fun tree path : list_rules_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_rules_response = {
    rules = option_of_yojson (value_for_key (rule_summaries_of_yojson) "Rules") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_rules_request_of_yojson = 
  fun tree path : list_rules_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_rules_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_rule_groups_response_of_yojson = 
  fun tree path : list_rule_groups_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_rule_groups_response = {
    rule_groups = option_of_yojson (value_for_key (rule_group_summaries_of_yojson) "RuleGroups") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_rule_groups_request_of_yojson = 
  fun tree path : list_rule_groups_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_rule_groups_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_regex_pattern_sets_response_of_yojson = 
  fun tree path : list_regex_pattern_sets_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_regex_pattern_sets_response = {
    regex_pattern_sets = option_of_yojson (value_for_key (regex_pattern_set_summaries_of_yojson) "RegexPatternSets") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_regex_pattern_sets_request_of_yojson = 
  fun tree path : list_regex_pattern_sets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_regex_pattern_sets_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_regex_match_sets_response_of_yojson = 
  fun tree path : list_regex_match_sets_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_regex_match_sets_response = {
    regex_match_sets = option_of_yojson (value_for_key (regex_match_set_summaries_of_yojson) "RegexMatchSets") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_regex_match_sets_request_of_yojson = 
  fun tree path : list_regex_match_sets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_regex_match_sets_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_rate_based_rules_response_of_yojson = 
  fun tree path : list_rate_based_rules_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_rate_based_rules_response = {
    rules = option_of_yojson (value_for_key (rule_summaries_of_yojson) "Rules") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_rate_based_rules_request_of_yojson = 
  fun tree path : list_rate_based_rules_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_rate_based_rules_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_logging_configurations_response_of_yojson = 
  fun tree path : list_logging_configurations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_logging_configurations_response = {
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    logging_configurations = option_of_yojson (value_for_key (logging_configurations_of_yojson) "LoggingConfigurations") _list path;
    
  }
  in _res

let list_logging_configurations_request_of_yojson = 
  fun tree path : list_logging_configurations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_logging_configurations_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let ip_set_summary_of_yojson = 
  fun tree path : ip_set_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : ip_set_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    ip_set_id = value_for_key (resource_id_of_yojson) "IPSetId" _list path;
    
  }
  in _res

let ip_set_summaries_of_yojson = 
  fun tree path -> list_of_yojson ip_set_summary_of_yojson tree path 

let list_ip_sets_response_of_yojson = 
  fun tree path : list_ip_sets_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_ip_sets_response = {
    ip_sets = option_of_yojson (value_for_key (ip_set_summaries_of_yojson) "IPSets") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_ip_sets_request_of_yojson = 
  fun tree path : list_ip_sets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_ip_sets_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let geo_match_set_summary_of_yojson = 
  fun tree path : geo_match_set_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : geo_match_set_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    geo_match_set_id = value_for_key (resource_id_of_yojson) "GeoMatchSetId" _list path;
    
  }
  in _res

let geo_match_set_summaries_of_yojson = 
  fun tree path -> list_of_yojson geo_match_set_summary_of_yojson tree path 

let list_geo_match_sets_response_of_yojson = 
  fun tree path : list_geo_match_sets_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_geo_match_sets_response = {
    geo_match_sets = option_of_yojson (value_for_key (geo_match_set_summaries_of_yojson) "GeoMatchSets") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_geo_match_sets_request_of_yojson = 
  fun tree path : list_geo_match_sets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_geo_match_sets_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let byte_match_set_summary_of_yojson = 
  fun tree path : byte_match_set_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : byte_match_set_summary = {
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    byte_match_set_id = value_for_key (resource_id_of_yojson) "ByteMatchSetId" _list path;
    
  }
  in _res

let byte_match_set_summaries_of_yojson = 
  fun tree path -> list_of_yojson byte_match_set_summary_of_yojson tree path 

let list_byte_match_sets_response_of_yojson = 
  fun tree path : list_byte_match_sets_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_byte_match_sets_response = {
    byte_match_sets = option_of_yojson (value_for_key (byte_match_set_summaries_of_yojson) "ByteMatchSets") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_byte_match_sets_request_of_yojson = 
  fun tree path : list_byte_match_sets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_byte_match_sets_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_activated_rules_in_rule_group_response_of_yojson = 
  fun tree path : list_activated_rules_in_rule_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_activated_rules_in_rule_group_response = {
    activated_rules = option_of_yojson (value_for_key (activated_rules_of_yojson) "ActivatedRules") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    
  }
  in _res

let list_activated_rules_in_rule_group_request_of_yojson = 
  fun tree path : list_activated_rules_in_rule_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_activated_rules_in_rule_group_request = {
    limit = option_of_yojson (value_for_key (pagination_limit_of_yojson) "Limit") _list path;
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    rule_group_id = option_of_yojson (value_for_key (resource_id_of_yojson) "RuleGroupId") _list path;
    
  }
  in _res

let ignore_unsupported_type_of_yojson = bool_of_yojson

let ip_set_descriptors_of_yojson = 
  fun tree path -> list_of_yojson ip_set_descriptor_of_yojson tree path 

let ip_set_of_yojson = 
  fun tree path : ip_set ->
  let _list = assoc_of_yojson tree path in
  let _res : ip_set = {
    ip_set_descriptors = value_for_key (ip_set_descriptors_of_yojson) "IPSetDescriptors" _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    ip_set_id = value_for_key (resource_id_of_yojson) "IPSetId" _list path;
    
  }
  in _res

let get_xss_match_set_response_of_yojson = 
  fun tree path : get_xss_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_xss_match_set_response = {
    xss_match_set = option_of_yojson (value_for_key (xss_match_set_of_yojson) "XssMatchSet") _list path;
    
  }
  in _res

let get_xss_match_set_request_of_yojson = 
  fun tree path : get_xss_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_xss_match_set_request = {
    xss_match_set_id = value_for_key (resource_id_of_yojson) "XssMatchSetId" _list path;
    
  }
  in _res

let get_web_acl_response_of_yojson = 
  fun tree path : get_web_acl_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_web_acl_response = {
    web_ac_l = option_of_yojson (value_for_key (web_ac_l_of_yojson) "WebACL") _list path;
    
  }
  in _res

let get_web_acl_request_of_yojson = 
  fun tree path : get_web_acl_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_web_acl_request = {
    web_acl_id = value_for_key (resource_id_of_yojson) "WebACLId" _list path;
    
  }
  in _res

let get_sql_injection_match_set_response_of_yojson = 
  fun tree path : get_sql_injection_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_sql_injection_match_set_response = {
    sql_injection_match_set = option_of_yojson (value_for_key (sql_injection_match_set_of_yojson) "SqlInjectionMatchSet") _list path;
    
  }
  in _res

let get_sql_injection_match_set_request_of_yojson = 
  fun tree path : get_sql_injection_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_sql_injection_match_set_request = {
    sql_injection_match_set_id = value_for_key (resource_id_of_yojson) "SqlInjectionMatchSetId" _list path;
    
  }
  in _res

let get_size_constraint_set_response_of_yojson = 
  fun tree path : get_size_constraint_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_size_constraint_set_response = {
    size_constraint_set = option_of_yojson (value_for_key (size_constraint_set_of_yojson) "SizeConstraintSet") _list path;
    
  }
  in _res

let get_size_constraint_set_request_of_yojson = 
  fun tree path : get_size_constraint_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_size_constraint_set_request = {
    size_constraint_set_id = value_for_key (resource_id_of_yojson) "SizeConstraintSetId" _list path;
    
  }
  in _res

let get_sampled_requests_response_of_yojson = 
  fun tree path : get_sampled_requests_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_sampled_requests_response = {
    time_window = option_of_yojson (value_for_key (time_window_of_yojson) "TimeWindow") _list path;
    population_size = option_of_yojson (value_for_key (population_size_of_yojson) "PopulationSize") _list path;
    sampled_requests = option_of_yojson (value_for_key (sampled_http_requests_of_yojson) "SampledRequests") _list path;
    
  }
  in _res

let get_sampled_requests_max_items_of_yojson = long_of_yojson

let get_sampled_requests_request_of_yojson = 
  fun tree path : get_sampled_requests_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_sampled_requests_request = {
    max_items = value_for_key (get_sampled_requests_max_items_of_yojson) "MaxItems" _list path;
    time_window = value_for_key (time_window_of_yojson) "TimeWindow" _list path;
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    web_acl_id = value_for_key (resource_id_of_yojson) "WebAclId" _list path;
    
  }
  in _res

let get_rule_response_of_yojson = 
  fun tree path : get_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_rule_response = {
    rule = option_of_yojson (value_for_key (rule_of_yojson) "Rule") _list path;
    
  }
  in _res

let get_rule_request_of_yojson = 
  fun tree path : get_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_rule_request = {
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let get_rule_group_response_of_yojson = 
  fun tree path : get_rule_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_rule_group_response = {
    rule_group = option_of_yojson (value_for_key (rule_group_of_yojson) "RuleGroup") _list path;
    
  }
  in _res

let get_rule_group_request_of_yojson = 
  fun tree path : get_rule_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_rule_group_request = {
    rule_group_id = value_for_key (resource_id_of_yojson) "RuleGroupId" _list path;
    
  }
  in _res

let get_regex_pattern_set_response_of_yojson = 
  fun tree path : get_regex_pattern_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_regex_pattern_set_response = {
    regex_pattern_set = option_of_yojson (value_for_key (regex_pattern_set_of_yojson) "RegexPatternSet") _list path;
    
  }
  in _res

let get_regex_pattern_set_request_of_yojson = 
  fun tree path : get_regex_pattern_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_regex_pattern_set_request = {
    regex_pattern_set_id = value_for_key (resource_id_of_yojson) "RegexPatternSetId" _list path;
    
  }
  in _res

let get_regex_match_set_response_of_yojson = 
  fun tree path : get_regex_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_regex_match_set_response = {
    regex_match_set = option_of_yojson (value_for_key (regex_match_set_of_yojson) "RegexMatchSet") _list path;
    
  }
  in _res

let get_regex_match_set_request_of_yojson = 
  fun tree path : get_regex_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_regex_match_set_request = {
    regex_match_set_id = value_for_key (resource_id_of_yojson) "RegexMatchSetId" _list path;
    
  }
  in _res

let get_rate_based_rule_response_of_yojson = 
  fun tree path : get_rate_based_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_rate_based_rule_response = {
    rule = option_of_yojson (value_for_key (rate_based_rule_of_yojson) "Rule") _list path;
    
  }
  in _res

let get_rate_based_rule_request_of_yojson = 
  fun tree path : get_rate_based_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_rate_based_rule_request = {
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let get_rate_based_rule_managed_keys_response_of_yojson = 
  fun tree path : get_rate_based_rule_managed_keys_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_rate_based_rule_managed_keys_response = {
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    managed_keys = option_of_yojson (value_for_key (managed_keys_of_yojson) "ManagedKeys") _list path;
    
  }
  in _res

let get_rate_based_rule_managed_keys_request_of_yojson = 
  fun tree path : get_rate_based_rule_managed_keys_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_rate_based_rule_managed_keys_request = {
    next_marker = option_of_yojson (value_for_key (next_marker_of_yojson) "NextMarker") _list path;
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let get_permission_policy_response_of_yojson = 
  fun tree path : get_permission_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_permission_policy_response = {
    policy = option_of_yojson (value_for_key (policy_string_of_yojson) "Policy") _list path;
    
  }
  in _res

let get_permission_policy_request_of_yojson = 
  fun tree path : get_permission_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_permission_policy_request = {
    resource_arn = value_for_key (resource_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let get_logging_configuration_response_of_yojson = 
  fun tree path : get_logging_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_logging_configuration_response = {
    logging_configuration = option_of_yojson (value_for_key (logging_configuration_of_yojson) "LoggingConfiguration") _list path;
    
  }
  in _res

let get_logging_configuration_request_of_yojson = 
  fun tree path : get_logging_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_logging_configuration_request = {
    resource_arn = value_for_key (resource_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let get_ip_set_response_of_yojson = 
  fun tree path : get_ip_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_ip_set_response = {
    ip_set = option_of_yojson (value_for_key (ip_set_of_yojson) "IPSet") _list path;
    
  }
  in _res

let get_ip_set_request_of_yojson = 
  fun tree path : get_ip_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_ip_set_request = {
    ip_set_id = value_for_key (resource_id_of_yojson) "IPSetId" _list path;
    
  }
  in _res

let geo_match_constraints_of_yojson = 
  fun tree path -> list_of_yojson geo_match_constraint_of_yojson tree path 

let geo_match_set_of_yojson = 
  fun tree path : geo_match_set ->
  let _list = assoc_of_yojson tree path in
  let _res : geo_match_set = {
    geo_match_constraints = value_for_key (geo_match_constraints_of_yojson) "GeoMatchConstraints" _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    geo_match_set_id = value_for_key (resource_id_of_yojson) "GeoMatchSetId" _list path;
    
  }
  in _res

let get_geo_match_set_response_of_yojson = 
  fun tree path : get_geo_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_geo_match_set_response = {
    geo_match_set = option_of_yojson (value_for_key (geo_match_set_of_yojson) "GeoMatchSet") _list path;
    
  }
  in _res

let get_geo_match_set_request_of_yojson = 
  fun tree path : get_geo_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_geo_match_set_request = {
    geo_match_set_id = value_for_key (resource_id_of_yojson) "GeoMatchSetId" _list path;
    
  }
  in _res

let change_token_status_of_yojson = 
  fun (tree: t) path : change_token_status -> match tree with 
    | `String "INSYNC" -> INSYNC
    | `String "PENDING" -> PENDING
    | `String "PROVISIONED" -> PROVISIONED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChangeTokenStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ChangeTokenStatus")

let get_change_token_status_response_of_yojson = 
  fun tree path : get_change_token_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_change_token_status_response = {
    change_token_status = option_of_yojson (value_for_key (change_token_status_of_yojson) "ChangeTokenStatus") _list path;
    
  }
  in _res

let get_change_token_status_request_of_yojson = 
  fun tree path : get_change_token_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_change_token_status_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    
  }
  in _res

let get_change_token_response_of_yojson = 
  fun tree path : get_change_token_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_change_token_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let get_change_token_request_of_yojson = 
  fun tree path : get_change_token_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_change_token_request = ()
  in _res

let byte_match_tuples_of_yojson = 
  fun tree path -> list_of_yojson byte_match_tuple_of_yojson tree path 

let byte_match_set_of_yojson = 
  fun tree path : byte_match_set ->
  let _list = assoc_of_yojson tree path in
  let _res : byte_match_set = {
    byte_match_tuples = value_for_key (byte_match_tuples_of_yojson) "ByteMatchTuples" _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    byte_match_set_id = value_for_key (resource_id_of_yojson) "ByteMatchSetId" _list path;
    
  }
  in _res

let get_byte_match_set_response_of_yojson = 
  fun tree path : get_byte_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_byte_match_set_response = {
    byte_match_set = option_of_yojson (value_for_key (byte_match_set_of_yojson) "ByteMatchSet") _list path;
    
  }
  in _res

let get_byte_match_set_request_of_yojson = 
  fun tree path : get_byte_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_byte_match_set_request = {
    byte_match_set_id = value_for_key (resource_id_of_yojson) "ByteMatchSetId" _list path;
    
  }
  in _res

let delete_xss_match_set_response_of_yojson = 
  fun tree path : delete_xss_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_xss_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_xss_match_set_request_of_yojson = 
  fun tree path : delete_xss_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_xss_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    xss_match_set_id = value_for_key (resource_id_of_yojson) "XssMatchSetId" _list path;
    
  }
  in _res

let delete_web_acl_response_of_yojson = 
  fun tree path : delete_web_acl_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_web_acl_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_web_acl_request_of_yojson = 
  fun tree path : delete_web_acl_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_web_acl_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    web_acl_id = value_for_key (resource_id_of_yojson) "WebACLId" _list path;
    
  }
  in _res

let delete_sql_injection_match_set_response_of_yojson = 
  fun tree path : delete_sql_injection_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_sql_injection_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_sql_injection_match_set_request_of_yojson = 
  fun tree path : delete_sql_injection_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_sql_injection_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    sql_injection_match_set_id = value_for_key (resource_id_of_yojson) "SqlInjectionMatchSetId" _list path;
    
  }
  in _res

let delete_size_constraint_set_response_of_yojson = 
  fun tree path : delete_size_constraint_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_size_constraint_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_size_constraint_set_request_of_yojson = 
  fun tree path : delete_size_constraint_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_size_constraint_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    size_constraint_set_id = value_for_key (resource_id_of_yojson) "SizeConstraintSetId" _list path;
    
  }
  in _res

let delete_rule_response_of_yojson = 
  fun tree path : delete_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_rule_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_rule_request_of_yojson = 
  fun tree path : delete_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_rule_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let delete_rule_group_response_of_yojson = 
  fun tree path : delete_rule_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_rule_group_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_rule_group_request_of_yojson = 
  fun tree path : delete_rule_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_rule_group_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    rule_group_id = value_for_key (resource_id_of_yojson) "RuleGroupId" _list path;
    
  }
  in _res

let delete_regex_pattern_set_response_of_yojson = 
  fun tree path : delete_regex_pattern_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_regex_pattern_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_regex_pattern_set_request_of_yojson = 
  fun tree path : delete_regex_pattern_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_regex_pattern_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    regex_pattern_set_id = value_for_key (resource_id_of_yojson) "RegexPatternSetId" _list path;
    
  }
  in _res

let delete_regex_match_set_response_of_yojson = 
  fun tree path : delete_regex_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_regex_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_regex_match_set_request_of_yojson = 
  fun tree path : delete_regex_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_regex_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    regex_match_set_id = value_for_key (resource_id_of_yojson) "RegexMatchSetId" _list path;
    
  }
  in _res

let delete_rate_based_rule_response_of_yojson = 
  fun tree path : delete_rate_based_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_rate_based_rule_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_rate_based_rule_request_of_yojson = 
  fun tree path : delete_rate_based_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_rate_based_rule_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    rule_id = value_for_key (resource_id_of_yojson) "RuleId" _list path;
    
  }
  in _res

let delete_permission_policy_response_of_yojson = 
  fun tree path : delete_permission_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_permission_policy_response = ()
  in _res

let delete_permission_policy_request_of_yojson = 
  fun tree path : delete_permission_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_permission_policy_request = {
    resource_arn = value_for_key (resource_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let delete_logging_configuration_response_of_yojson = 
  fun tree path : delete_logging_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_logging_configuration_response = ()
  in _res

let delete_logging_configuration_request_of_yojson = 
  fun tree path : delete_logging_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_logging_configuration_request = {
    resource_arn = value_for_key (resource_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let delete_ip_set_response_of_yojson = 
  fun tree path : delete_ip_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_ip_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_ip_set_request_of_yojson = 
  fun tree path : delete_ip_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_ip_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    ip_set_id = value_for_key (resource_id_of_yojson) "IPSetId" _list path;
    
  }
  in _res

let delete_geo_match_set_response_of_yojson = 
  fun tree path : delete_geo_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_geo_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_geo_match_set_request_of_yojson = 
  fun tree path : delete_geo_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_geo_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    geo_match_set_id = value_for_key (resource_id_of_yojson) "GeoMatchSetId" _list path;
    
  }
  in _res

let delete_byte_match_set_response_of_yojson = 
  fun tree path : delete_byte_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_byte_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    
  }
  in _res

let delete_byte_match_set_request_of_yojson = 
  fun tree path : delete_byte_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_byte_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    byte_match_set_id = value_for_key (resource_id_of_yojson) "ByteMatchSetId" _list path;
    
  }
  in _res

let create_xss_match_set_response_of_yojson = 
  fun tree path : create_xss_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_xss_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    xss_match_set = option_of_yojson (value_for_key (xss_match_set_of_yojson) "XssMatchSet") _list path;
    
  }
  in _res

let create_xss_match_set_request_of_yojson = 
  fun tree path : create_xss_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_xss_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_web_acl_response_of_yojson = 
  fun tree path : create_web_acl_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_web_acl_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    web_ac_l = option_of_yojson (value_for_key (web_ac_l_of_yojson) "WebACL") _list path;
    
  }
  in _res

let create_web_acl_request_of_yojson = 
  fun tree path : create_web_acl_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_web_acl_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    default_action = value_for_key (waf_action_of_yojson) "DefaultAction" _list path;
    metric_name = value_for_key (metric_name_of_yojson) "MetricName" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_web_acl_migration_stack_response_of_yojson = 
  fun tree path : create_web_acl_migration_stack_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_web_acl_migration_stack_response = {
    s3_object_url = value_for_key (s3_object_url_of_yojson) "S3ObjectUrl" _list path;
    
  }
  in _res

let create_web_acl_migration_stack_request_of_yojson = 
  fun tree path : create_web_acl_migration_stack_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_web_acl_migration_stack_request = {
    ignore_unsupported_type = value_for_key (ignore_unsupported_type_of_yojson) "IgnoreUnsupportedType" _list path;
    s3_bucket_name = value_for_key (s3_bucket_name_of_yojson) "S3BucketName" _list path;
    web_acl_id = value_for_key (resource_id_of_yojson) "WebACLId" _list path;
    
  }
  in _res

let create_sql_injection_match_set_response_of_yojson = 
  fun tree path : create_sql_injection_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_sql_injection_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    sql_injection_match_set = option_of_yojson (value_for_key (sql_injection_match_set_of_yojson) "SqlInjectionMatchSet") _list path;
    
  }
  in _res

let create_sql_injection_match_set_request_of_yojson = 
  fun tree path : create_sql_injection_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_sql_injection_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_size_constraint_set_response_of_yojson = 
  fun tree path : create_size_constraint_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_size_constraint_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    size_constraint_set = option_of_yojson (value_for_key (size_constraint_set_of_yojson) "SizeConstraintSet") _list path;
    
  }
  in _res

let create_size_constraint_set_request_of_yojson = 
  fun tree path : create_size_constraint_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_size_constraint_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_rule_response_of_yojson = 
  fun tree path : create_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_rule_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    rule = option_of_yojson (value_for_key (rule_of_yojson) "Rule") _list path;
    
  }
  in _res

let create_rule_request_of_yojson = 
  fun tree path : create_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_rule_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    metric_name = value_for_key (metric_name_of_yojson) "MetricName" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_rule_group_response_of_yojson = 
  fun tree path : create_rule_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_rule_group_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    rule_group = option_of_yojson (value_for_key (rule_group_of_yojson) "RuleGroup") _list path;
    
  }
  in _res

let create_rule_group_request_of_yojson = 
  fun tree path : create_rule_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_rule_group_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    metric_name = value_for_key (metric_name_of_yojson) "MetricName" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_regex_pattern_set_response_of_yojson = 
  fun tree path : create_regex_pattern_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_regex_pattern_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    regex_pattern_set = option_of_yojson (value_for_key (regex_pattern_set_of_yojson) "RegexPatternSet") _list path;
    
  }
  in _res

let create_regex_pattern_set_request_of_yojson = 
  fun tree path : create_regex_pattern_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_regex_pattern_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_regex_match_set_response_of_yojson = 
  fun tree path : create_regex_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_regex_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    regex_match_set = option_of_yojson (value_for_key (regex_match_set_of_yojson) "RegexMatchSet") _list path;
    
  }
  in _res

let create_regex_match_set_request_of_yojson = 
  fun tree path : create_regex_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_regex_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_rate_based_rule_response_of_yojson = 
  fun tree path : create_rate_based_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_rate_based_rule_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    rule = option_of_yojson (value_for_key (rate_based_rule_of_yojson) "Rule") _list path;
    
  }
  in _res

let create_rate_based_rule_request_of_yojson = 
  fun tree path : create_rate_based_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_rate_based_rule_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    rate_limit = value_for_key (rate_limit_of_yojson) "RateLimit" _list path;
    rate_key = value_for_key (rate_key_of_yojson) "RateKey" _list path;
    metric_name = value_for_key (metric_name_of_yojson) "MetricName" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_ip_set_response_of_yojson = 
  fun tree path : create_ip_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_ip_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    ip_set = option_of_yojson (value_for_key (ip_set_of_yojson) "IPSet") _list path;
    
  }
  in _res

let create_ip_set_request_of_yojson = 
  fun tree path : create_ip_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_ip_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_geo_match_set_response_of_yojson = 
  fun tree path : create_geo_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_geo_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    geo_match_set = option_of_yojson (value_for_key (geo_match_set_of_yojson) "GeoMatchSet") _list path;
    
  }
  in _res

let create_geo_match_set_request_of_yojson = 
  fun tree path : create_geo_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_geo_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_byte_match_set_response_of_yojson = 
  fun tree path : create_byte_match_set_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_byte_match_set_response = {
    change_token = option_of_yojson (value_for_key (change_token_of_yojson) "ChangeToken") _list path;
    byte_match_set = option_of_yojson (value_for_key (byte_match_set_of_yojson) "ByteMatchSet") _list path;
    
  }
  in _res

let create_byte_match_set_request_of_yojson = 
  fun tree path : create_byte_match_set_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_byte_match_set_request = {
    change_token = value_for_key (change_token_of_yojson) "ChangeToken" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

