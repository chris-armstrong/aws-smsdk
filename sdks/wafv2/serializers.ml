open Smaws_Lib.Json.SerializeHelpers

open Types

let field_to_match_data_to_yojson = string_to_yojson

let single_header_to_yojson = 
  fun (x: single_header) -> assoc_to_yojson(
    [(
         "Name",
         (Some (field_to_match_data_to_yojson x.name)));
       
  ])

let single_query_argument_to_yojson = 
  fun (x: single_query_argument) -> assoc_to_yojson(
    [(
         "Name",
         (Some (field_to_match_data_to_yojson x.name)));
       
  ])

let all_query_arguments_to_yojson = 
  fun (x: all_query_arguments) -> assoc_to_yojson(
    [
  ])

let uri_path_to_yojson = fun (x: uri_path) -> assoc_to_yojson(
                           [
                         ])

let query_string_to_yojson = fun (x: query_string) -> assoc_to_yojson(
                               [
                             ])

let base_unit_to_yojson = unit_to_yojson

let oversize_handling_to_yojson = 
  fun (x: oversize_handling) -> match x with 
 
| NO_MATCH -> `String "NO_MATCH"
  | MATCH -> `String "MATCH"
  | CONTINUE -> `String "CONTINUE"
   

let body_to_yojson = 
  fun (x: body) -> assoc_to_yojson(
    [(
         "OversizeHandling",
         (option_to_yojson oversize_handling_to_yojson x.oversize_handling));
       
  ])

let method__to_yojson = fun (x: method_) -> assoc_to_yojson(
                          [
                        ])

let all_to_yojson = fun (x: all) -> assoc_to_yojson(
                      [
                    ])

let json_pointer_path_to_yojson = string_to_yojson

let json_pointer_paths_to_yojson = 
  fun tree -> list_to_yojson json_pointer_path_to_yojson tree

let json_match_pattern_to_yojson = 
  fun (x: json_match_pattern) -> assoc_to_yojson(
    [(
         "IncludedPaths",
         (option_to_yojson json_pointer_paths_to_yojson x.included_paths));
       (
         "All",
         (option_to_yojson all_to_yojson x.all));
       
  ])

let json_match_scope_to_yojson = 
  fun (x: json_match_scope) -> match x with 
  | VALUE -> `String "VALUE"
    | KEY -> `String "KEY"
    | ALL -> `String "ALL"
     

let body_parsing_fallback_behavior_to_yojson = 
  fun (x: body_parsing_fallback_behavior) -> match x with 
 
| EVALUATE_AS_STRING -> `String "EVALUATE_AS_STRING"
  | NO_MATCH -> `String "NO_MATCH"
  | MATCH -> `String "MATCH"
   

let json_body_to_yojson = 
  fun (x: json_body) -> assoc_to_yojson(
    [(
         "OversizeHandling",
         (option_to_yojson oversize_handling_to_yojson x.oversize_handling));
       (
         "InvalidFallbackBehavior",
         (option_to_yojson body_parsing_fallback_behavior_to_yojson x.invalid_fallback_behavior));
       (
         "MatchScope",
         (Some (json_match_scope_to_yojson x.match_scope)));
       (
         "MatchPattern",
         (Some (json_match_pattern_to_yojson x.match_pattern)));
       
  ])

let header_names_to_yojson = 
  fun tree -> list_to_yojson field_to_match_data_to_yojson tree

let header_match_pattern_to_yojson = 
  fun (x: header_match_pattern) -> assoc_to_yojson(
    [(
         "ExcludedHeaders",
         (option_to_yojson header_names_to_yojson x.excluded_headers));
       (
         "IncludedHeaders",
         (option_to_yojson header_names_to_yojson x.included_headers));
       (
         "All",
         (option_to_yojson all_to_yojson x.all));
       
  ])

let map_match_scope_to_yojson = 
  fun (x: map_match_scope) -> match x with 
  | VALUE -> `String "VALUE"
    | KEY -> `String "KEY"
    | ALL -> `String "ALL"
     

let headers_to_yojson = 
  fun (x: headers) -> assoc_to_yojson(
    [(
         "OversizeHandling",
         (Some (oversize_handling_to_yojson x.oversize_handling)));
       (
         "MatchScope",
         (Some (map_match_scope_to_yojson x.match_scope)));
       (
         "MatchPattern",
         (Some (header_match_pattern_to_yojson x.match_pattern)));
       
  ])

let single_cookie_name_to_yojson = string_to_yojson

let cookie_names_to_yojson = 
  fun tree -> list_to_yojson single_cookie_name_to_yojson tree

let cookie_match_pattern_to_yojson = 
  fun (x: cookie_match_pattern) -> assoc_to_yojson(
    [(
         "ExcludedCookies",
         (option_to_yojson cookie_names_to_yojson x.excluded_cookies));
       (
         "IncludedCookies",
         (option_to_yojson cookie_names_to_yojson x.included_cookies));
       (
         "All",
         (option_to_yojson all_to_yojson x.all));
       
  ])

let cookies_to_yojson = 
  fun (x: cookies) -> assoc_to_yojson(
    [(
         "OversizeHandling",
         (Some (oversize_handling_to_yojson x.oversize_handling)));
       (
         "MatchScope",
         (Some (map_match_scope_to_yojson x.match_scope)));
       (
         "MatchPattern",
         (Some (cookie_match_pattern_to_yojson x.match_pattern)));
       
  ])

let header_order_to_yojson = 
  fun (x: header_order) -> assoc_to_yojson(
    [(
         "OversizeHandling",
         (Some (oversize_handling_to_yojson x.oversize_handling)));
       
  ])

let fallback_behavior_to_yojson = 
  fun (x: fallback_behavior) -> match x with 
  | NO_MATCH -> `String "NO_MATCH"
    | MATCH -> `String "MATCH"
     

let ja3_fingerprint_to_yojson = 
  fun (x: ja3_fingerprint) -> assoc_to_yojson(
    [(
         "FallbackBehavior",
         (Some (fallback_behavior_to_yojson x.fallback_behavior)));
       
  ])

let field_to_match_to_yojson = 
  fun (x: field_to_match) -> assoc_to_yojson(
    [(
         "JA3Fingerprint",
         (option_to_yojson ja3_fingerprint_to_yojson x.ja3_fingerprint));
       (
         "HeaderOrder",
         (option_to_yojson header_order_to_yojson x.header_order));
       (
         "Cookies",
         (option_to_yojson cookies_to_yojson x.cookies));
       (
         "Headers",
         (option_to_yojson headers_to_yojson x.headers));
       (
         "JsonBody",
         (option_to_yojson json_body_to_yojson x.json_body));
       (
         "Method",
         (option_to_yojson method__to_yojson x.method_));
       (
         "Body",
         (option_to_yojson body_to_yojson x.body));
       (
         "QueryString",
         (option_to_yojson query_string_to_yojson x.query_string));
       (
         "UriPath",
         (option_to_yojson uri_path_to_yojson x.uri_path));
       (
         "AllQueryArguments",
         (option_to_yojson all_query_arguments_to_yojson x.all_query_arguments));
       (
         "SingleQueryArgument",
         (option_to_yojson single_query_argument_to_yojson x.single_query_argument));
       (
         "SingleHeader",
         (option_to_yojson single_header_to_yojson x.single_header));
       
  ])

let text_transformation_priority_to_yojson = int_to_yojson

let text_transformation_type_to_yojson = 
  fun (x: text_transformation_type) -> match x with 
 
| UTF8_TO_UNICODE -> `String "UTF8_TO_UNICODE"
  | URL_DECODE_UNI -> `String "URL_DECODE_UNI"
  | BASE64_DECODE_EXT -> `String "BASE64_DECODE_EXT"
  | REPLACE_NULLS -> `String "REPLACE_NULLS"
  | REMOVE_NULLS -> `String "REMOVE_NULLS"
  | NORMALIZE_PATH_WIN -> `String "NORMALIZE_PATH_WIN"
  | NORMALIZE_PATH -> `String "NORMALIZE_PATH"
  | JS_DECODE -> `String "JS_DECODE"
  | CSS_DECODE -> `String "CSS_DECODE"
  | SQL_HEX_DECODE -> `String "SQL_HEX_DECODE"
  | ESCAPE_SEQ_DECODE -> `String "ESCAPE_SEQ_DECODE"
  | REPLACE_COMMENTS -> `String "REPLACE_COMMENTS"
  | MD5 -> `String "MD5"
  | HEX_DECODE -> `String "HEX_DECODE"
  | BASE64_DECODE -> `String "BASE64_DECODE"
  | URL_DECODE -> `String "URL_DECODE"
  | CMD_LINE -> `String "CMD_LINE"
  | LOWERCASE -> `String "LOWERCASE"
  | HTML_ENTITY_DECODE -> `String "HTML_ENTITY_DECODE"
  | COMPRESS_WHITE_SPACE -> `String "COMPRESS_WHITE_SPACE"
  | NONE -> `String "NONE"
   

let text_transformation_to_yojson = 
  fun (x: text_transformation) -> assoc_to_yojson(
    [(
         "Type",
         (Some (text_transformation_type_to_yojson x.type_)));
       (
         "Priority",
         (Some (text_transformation_priority_to_yojson x.priority)));
       
  ])

let text_transformations_to_yojson = 
  fun tree -> list_to_yojson text_transformation_to_yojson tree

let xss_match_statement_to_yojson = 
  fun (x: xss_match_statement) -> assoc_to_yojson(
    [(
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       
  ])

let entity_name_to_yojson = string_to_yojson

let entity_id_to_yojson = string_to_yojson

let entity_description_to_yojson = string_to_yojson

let lock_token_to_yojson = string_to_yojson

let resource_arn_to_yojson = string_to_yojson

let web_acl_summary_to_yojson = 
  fun (x: web_acl_summary) -> assoc_to_yojson(
    [(
         "ARN",
         (option_to_yojson resource_arn_to_yojson x.ar_n));
       (
         "LockToken",
         (option_to_yojson lock_token_to_yojson x.lock_token));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Id",
         (option_to_yojson entity_id_to_yojson x.id));
       (
         "Name",
         (option_to_yojson entity_name_to_yojson x.name));
       
  ])

let web_acl_summaries_to_yojson = 
  fun tree -> list_to_yojson web_acl_summary_to_yojson tree

let response_status_code_to_yojson = int_to_yojson

let custom_http_header_name_to_yojson = string_to_yojson

let custom_http_header_value_to_yojson = string_to_yojson

let custom_http_header_to_yojson = 
  fun (x: custom_http_header) -> assoc_to_yojson(
    [(
         "Value",
         (Some (custom_http_header_value_to_yojson x.value)));
       (
         "Name",
         (Some (custom_http_header_name_to_yojson x.name)));
       
  ])

let custom_http_headers_to_yojson = 
  fun tree -> list_to_yojson custom_http_header_to_yojson tree

let custom_response_to_yojson = 
  fun (x: custom_response) -> assoc_to_yojson(
    [(
         "ResponseHeaders",
         (option_to_yojson custom_http_headers_to_yojson x.response_headers));
       (
         "CustomResponseBodyKey",
         (option_to_yojson entity_name_to_yojson x.custom_response_body_key));
       (
         "ResponseCode",
         (Some (response_status_code_to_yojson x.response_code)));
       
  ])

let block_action_to_yojson = 
  fun (x: block_action) -> assoc_to_yojson(
    [(
         "CustomResponse",
         (option_to_yojson custom_response_to_yojson x.custom_response));
       
  ])

let custom_request_handling_to_yojson = 
  fun (x: custom_request_handling) -> assoc_to_yojson(
    [(
         "InsertHeaders",
         (Some (custom_http_headers_to_yojson x.insert_headers)));
       
  ])

let allow_action_to_yojson = 
  fun (x: allow_action) -> assoc_to_yojson(
    [(
         "CustomRequestHandling",
         (option_to_yojson custom_request_handling_to_yojson x.custom_request_handling));
       
  ])

let default_action_to_yojson = 
  fun (x: default_action) -> assoc_to_yojson(
    [(
         "Allow",
         (option_to_yojson allow_action_to_yojson x.allow));
       (
         "Block",
         (option_to_yojson block_action_to_yojson x.block));
       
  ])

let rule_priority_to_yojson = int_to_yojson

let search_string_to_yojson = blob_to_yojson

let positional_constraint_to_yojson = 
  fun (x: positional_constraint) -> match x with 
 
| CONTAINS_WORD -> `String "CONTAINS_WORD"
  | CONTAINS -> `String "CONTAINS"
  | ENDS_WITH -> `String "ENDS_WITH"
  | STARTS_WITH -> `String "STARTS_WITH"
  | EXACTLY -> `String "EXACTLY"
   

let byte_match_statement_to_yojson = 
  fun (x: byte_match_statement) -> assoc_to_yojson(
    [(
         "PositionalConstraint",
         (Some (positional_constraint_to_yojson x.positional_constraint)));
       (
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       (
         "SearchString",
         (Some (search_string_to_yojson x.search_string)));
       
  ])

let sensitivity_level_to_yojson = 
  fun (x: sensitivity_level) -> match x with 
  | HIGH -> `String "HIGH"
    | LOW -> `String "LOW"
     

let sqli_match_statement_to_yojson = 
  fun (x: sqli_match_statement) -> assoc_to_yojson(
    [(
         "SensitivityLevel",
         (option_to_yojson sensitivity_level_to_yojson x.sensitivity_level));
       (
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       
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

let size_constraint_statement_to_yojson = 
  fun (x: size_constraint_statement) -> assoc_to_yojson(
    [(
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       (
         "Size",
         (Some (size_to_yojson x.size)));
       (
         "ComparisonOperator",
         (Some (comparison_operator_to_yojson x.comparison_operator)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       
  ])

let country_code_to_yojson = 
  fun (x: country_code) -> match x with 
 
| XK -> `String "XK"
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
   

let country_codes_to_yojson = 
  fun tree -> list_to_yojson country_code_to_yojson tree

let forwarded_ip_header_name_to_yojson = string_to_yojson

let forwarded_ip_config_to_yojson = 
  fun (x: forwarded_ip_config) -> assoc_to_yojson(
    [(
         "FallbackBehavior",
         (Some (fallback_behavior_to_yojson x.fallback_behavior)));
       (
         "HeaderName",
         (Some (forwarded_ip_header_name_to_yojson x.header_name)));
       
  ])

let geo_match_statement_to_yojson = 
  fun (x: geo_match_statement) -> assoc_to_yojson(
    [(
         "ForwardedIPConfig",
         (option_to_yojson forwarded_ip_config_to_yojson x.forwarded_ip_config));
       (
         "CountryCodes",
         (option_to_yojson country_codes_to_yojson x.country_codes));
       
  ])

let excluded_rule_to_yojson = 
  fun (x: excluded_rule) -> assoc_to_yojson(
    [(
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let excluded_rules_to_yojson = 
  fun tree -> list_to_yojson excluded_rule_to_yojson tree

let count_action_to_yojson = 
  fun (x: count_action) -> assoc_to_yojson(
    [(
         "CustomRequestHandling",
         (option_to_yojson custom_request_handling_to_yojson x.custom_request_handling));
       
  ])

let captcha_action_to_yojson = 
  fun (x: captcha_action) -> assoc_to_yojson(
    [(
         "CustomRequestHandling",
         (option_to_yojson custom_request_handling_to_yojson x.custom_request_handling));
       
  ])

let challenge_action_to_yojson = 
  fun (x: challenge_action) -> assoc_to_yojson(
    [(
         "CustomRequestHandling",
         (option_to_yojson custom_request_handling_to_yojson x.custom_request_handling));
       
  ])

let rule_action_to_yojson = 
  fun (x: rule_action) -> assoc_to_yojson(
    [(
         "Challenge",
         (option_to_yojson challenge_action_to_yojson x.challenge));
       (
         "Captcha",
         (option_to_yojson captcha_action_to_yojson x.captcha));
       (
         "Count",
         (option_to_yojson count_action_to_yojson x.count));
       (
         "Allow",
         (option_to_yojson allow_action_to_yojson x.allow));
       (
         "Block",
         (option_to_yojson block_action_to_yojson x.block));
       
  ])

let rule_action_override_to_yojson = 
  fun (x: rule_action_override) -> assoc_to_yojson(
    [(
         "ActionToUse",
         (Some (rule_action_to_yojson x.action_to_use)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let rule_action_overrides_to_yojson = 
  fun tree -> list_to_yojson rule_action_override_to_yojson tree

let rule_group_reference_statement_to_yojson = 
  fun (x: rule_group_reference_statement) -> assoc_to_yojson(
    [(
         "RuleActionOverrides",
         (option_to_yojson rule_action_overrides_to_yojson x.rule_action_overrides));
       (
         "ExcludedRules",
         (option_to_yojson excluded_rules_to_yojson x.excluded_rules));
       (
         "ARN",
         (Some (resource_arn_to_yojson x.ar_n)));
       
  ])

let forwarded_ip_position_to_yojson = 
  fun (x: forwarded_ip_position) -> match x with 
  | ANY -> `String "ANY"
    | LAST -> `String "LAST"
    | FIRST -> `String "FIRST"
     

let ip_set_forwarded_ip_config_to_yojson = 
  fun (x: ip_set_forwarded_ip_config) -> assoc_to_yojson(
    [(
         "Position",
         (Some (forwarded_ip_position_to_yojson x.position)));
       (
         "FallbackBehavior",
         (Some (fallback_behavior_to_yojson x.fallback_behavior)));
       (
         "HeaderName",
         (Some (forwarded_ip_header_name_to_yojson x.header_name)));
       
  ])

let ip_set_reference_statement_to_yojson = 
  fun (x: ip_set_reference_statement) -> assoc_to_yojson(
    [(
         "IPSetForwardedIPConfig",
         (option_to_yojson ip_set_forwarded_ip_config_to_yojson x.ip_set_forwarded_ip_config));
       (
         "ARN",
         (Some (resource_arn_to_yojson x.ar_n)));
       
  ])

let regex_pattern_set_reference_statement_to_yojson = 
  fun (x: regex_pattern_set_reference_statement) -> assoc_to_yojson(
    [(
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       (
         "ARN",
         (Some (resource_arn_to_yojson x.ar_n)));
       
  ])

let rate_limit_to_yojson = long_to_yojson

let evaluation_window_sec_to_yojson = long_to_yojson

let rate_based_statement_aggregate_key_type_to_yojson = 
  fun (x: rate_based_statement_aggregate_key_type) -> match x with 
 
| CONSTANT -> `String "CONSTANT"
  | CUSTOM_KEYS -> `String "CUSTOM_KEYS"
  | FORWARDED_IP -> `String "FORWARDED_IP"
  | IP -> `String "IP"
   

let rate_limit_header_to_yojson = 
  fun (x: rate_limit_header) -> assoc_to_yojson(
    [(
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       (
         "Name",
         (Some (field_to_match_data_to_yojson x.name)));
       
  ])

let rate_limit_cookie_to_yojson = 
  fun (x: rate_limit_cookie) -> assoc_to_yojson(
    [(
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       (
         "Name",
         (Some (field_to_match_data_to_yojson x.name)));
       
  ])

let rate_limit_query_argument_to_yojson = 
  fun (x: rate_limit_query_argument) -> assoc_to_yojson(
    [(
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       (
         "Name",
         (Some (field_to_match_data_to_yojson x.name)));
       
  ])

let rate_limit_query_string_to_yojson = 
  fun (x: rate_limit_query_string) -> assoc_to_yojson(
    [(
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       
  ])

let rate_limit_http_method_to_yojson = 
  fun (x: rate_limit_http_method) -> assoc_to_yojson(
    [
  ])

let rate_limit_forwarded_i_p_to_yojson = 
  fun (x: rate_limit_forwarded_i_p) -> assoc_to_yojson(
    [
  ])

let rate_limit_i_p_to_yojson = 
  fun (x: rate_limit_i_p) -> assoc_to_yojson(
    [
  ])

let label_namespace_to_yojson = string_to_yojson

let rate_limit_label_namespace_to_yojson = 
  fun (x: rate_limit_label_namespace) -> assoc_to_yojson(
    [(
         "Namespace",
         (Some (label_namespace_to_yojson x.namespace)));
       
  ])

let rate_limit_uri_path_to_yojson = 
  fun (x: rate_limit_uri_path) -> assoc_to_yojson(
    [(
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       
  ])

let rate_based_statement_custom_key_to_yojson = 
  fun (x: rate_based_statement_custom_key) -> assoc_to_yojson(
    [(
         "UriPath",
         (option_to_yojson rate_limit_uri_path_to_yojson x.uri_path));
       (
         "LabelNamespace",
         (option_to_yojson rate_limit_label_namespace_to_yojson x.label_namespace));
       (
         "IP",
         (option_to_yojson rate_limit_i_p_to_yojson x.i_p));
       (
         "ForwardedIP",
         (option_to_yojson rate_limit_forwarded_i_p_to_yojson x.forwarded_i_p));
       (
         "HTTPMethod",
         (option_to_yojson rate_limit_http_method_to_yojson x.http_method));
       (
         "QueryString",
         (option_to_yojson rate_limit_query_string_to_yojson x.query_string));
       (
         "QueryArgument",
         (option_to_yojson rate_limit_query_argument_to_yojson x.query_argument));
       (
         "Cookie",
         (option_to_yojson rate_limit_cookie_to_yojson x.cookie));
       (
         "Header",
         (option_to_yojson rate_limit_header_to_yojson x.header));
       
  ])

let rate_based_statement_custom_keys_to_yojson = 
  fun tree -> list_to_yojson rate_based_statement_custom_key_to_yojson tree

let vendor_name_to_yojson = string_to_yojson

let version_key_string_to_yojson = string_to_yojson

let login_path_string_to_yojson = string_to_yojson

let payload_type_to_yojson = 
  fun (x: payload_type) -> match x with 
  | FORM_ENCODED -> `String "FORM_ENCODED"
    | JSON -> `String "JSON"
     

let field_identifier_to_yojson = string_to_yojson

let username_field_to_yojson = 
  fun (x: username_field) -> assoc_to_yojson(
    [(
         "Identifier",
         (Some (field_identifier_to_yojson x.identifier)));
       
  ])

let password_field_to_yojson = 
  fun (x: password_field) -> assoc_to_yojson(
    [(
         "Identifier",
         (Some (field_identifier_to_yojson x.identifier)));
       
  ])

let inspection_level_to_yojson = 
  fun (x: inspection_level) -> match x with 
  | TARGETED -> `String "TARGETED"
    | COMMON -> `String "COMMON"
     

let enable_machine_learning_to_yojson = bool_to_yojson

let aws_managed_rules_bot_control_rule_set_to_yojson = 
  fun (x: aws_managed_rules_bot_control_rule_set) -> assoc_to_yojson(
    [(
         "EnableMachineLearning",
         (option_to_yojson enable_machine_learning_to_yojson x.enable_machine_learning));
       (
         "InspectionLevel",
         (Some (inspection_level_to_yojson x.inspection_level)));
       
  ])

let string__to_yojson = string_to_yojson

let request_inspection_to_yojson = 
  fun (x: request_inspection) -> assoc_to_yojson(
    [(
         "PasswordField",
         (Some (password_field_to_yojson x.password_field)));
       (
         "UsernameField",
         (Some (username_field_to_yojson x.username_field)));
       (
         "PayloadType",
         (Some (payload_type_to_yojson x.payload_type)));
       
  ])

let success_code_to_yojson = int_to_yojson

let response_inspection_status_code_success_codes_to_yojson = 
  fun tree -> list_to_yojson success_code_to_yojson tree

let failure_code_to_yojson = int_to_yojson

let response_inspection_status_code_failure_codes_to_yojson = 
  fun tree -> list_to_yojson failure_code_to_yojson tree

let response_inspection_status_code_to_yojson = 
  fun (x: response_inspection_status_code) -> assoc_to_yojson(
    [(
         "FailureCodes",
         (Some (response_inspection_status_code_failure_codes_to_yojson x.failure_codes)));
       (
         "SuccessCodes",
         (Some (response_inspection_status_code_success_codes_to_yojson x.success_codes)));
       
  ])

let response_inspection_header_name_to_yojson = string_to_yojson

let success_value_to_yojson = string_to_yojson

let response_inspection_header_success_values_to_yojson = 
  fun tree -> list_to_yojson success_value_to_yojson tree

let failure_value_to_yojson = string_to_yojson

let response_inspection_header_failure_values_to_yojson = 
  fun tree -> list_to_yojson failure_value_to_yojson tree

let response_inspection_header_to_yojson = 
  fun (x: response_inspection_header) -> assoc_to_yojson(
    [(
         "FailureValues",
         (Some (response_inspection_header_failure_values_to_yojson x.failure_values)));
       (
         "SuccessValues",
         (Some (response_inspection_header_success_values_to_yojson x.success_values)));
       (
         "Name",
         (Some (response_inspection_header_name_to_yojson x.name)));
       
  ])

let response_inspection_body_contains_success_strings_to_yojson = 
  fun tree -> list_to_yojson success_value_to_yojson tree

let response_inspection_body_contains_failure_strings_to_yojson = 
  fun tree -> list_to_yojson failure_value_to_yojson tree

let response_inspection_body_contains_to_yojson = 
  fun (x: response_inspection_body_contains) -> assoc_to_yojson(
    [(
         "FailureStrings",
         (Some (response_inspection_body_contains_failure_strings_to_yojson x.failure_strings)));
       (
         "SuccessStrings",
         (Some (response_inspection_body_contains_success_strings_to_yojson x.success_strings)));
       
  ])

let response_inspection_json_success_values_to_yojson = 
  fun tree -> list_to_yojson success_value_to_yojson tree

let response_inspection_json_failure_values_to_yojson = 
  fun tree -> list_to_yojson failure_value_to_yojson tree

let response_inspection_json_to_yojson = 
  fun (x: response_inspection_json) -> assoc_to_yojson(
    [(
         "FailureValues",
         (Some (response_inspection_json_failure_values_to_yojson x.failure_values)));
       (
         "SuccessValues",
         (Some (response_inspection_json_success_values_to_yojson x.success_values)));
       (
         "Identifier",
         (Some (field_identifier_to_yojson x.identifier)));
       
  ])

let response_inspection_to_yojson = 
  fun (x: response_inspection) -> assoc_to_yojson(
    [(
         "Json",
         (option_to_yojson response_inspection_json_to_yojson x.json));
       (
         "BodyContains",
         (option_to_yojson response_inspection_body_contains_to_yojson x.body_contains));
       (
         "Header",
         (option_to_yojson response_inspection_header_to_yojson x.header));
       (
         "StatusCode",
         (option_to_yojson response_inspection_status_code_to_yojson x.status_code));
       
  ])

let boolean__to_yojson = bool_to_yojson

let aws_managed_rules_atp_rule_set_to_yojson = 
  fun (x: aws_managed_rules_atp_rule_set) -> assoc_to_yojson(
    [(
         "EnableRegexInPath",
         (option_to_yojson boolean__to_yojson x.enable_regex_in_path));
       (
         "ResponseInspection",
         (option_to_yojson response_inspection_to_yojson x.response_inspection));
       (
         "RequestInspection",
         (option_to_yojson request_inspection_to_yojson x.request_inspection));
       (
         "LoginPath",
         (Some (string__to_yojson x.login_path)));
       
  ])

let creation_path_string_to_yojson = string_to_yojson

let registration_page_path_string_to_yojson = string_to_yojson

let email_field_to_yojson = 
  fun (x: email_field) -> assoc_to_yojson(
    [(
         "Identifier",
         (Some (field_identifier_to_yojson x.identifier)));
       
  ])

let phone_number_field_to_yojson = 
  fun (x: phone_number_field) -> assoc_to_yojson(
    [(
         "Identifier",
         (Some (field_identifier_to_yojson x.identifier)));
       
  ])

let phone_number_fields_to_yojson = 
  fun tree -> list_to_yojson phone_number_field_to_yojson tree

let address_field_to_yojson = 
  fun (x: address_field) -> assoc_to_yojson(
    [(
         "Identifier",
         (Some (field_identifier_to_yojson x.identifier)));
       
  ])

let address_fields_to_yojson = 
  fun tree -> list_to_yojson address_field_to_yojson tree

let request_inspection_acf_p_to_yojson = 
  fun (x: request_inspection_acf_p) -> assoc_to_yojson(
    [(
         "AddressFields",
         (option_to_yojson address_fields_to_yojson x.address_fields));
       (
         "PhoneNumberFields",
         (option_to_yojson phone_number_fields_to_yojson x.phone_number_fields));
       (
         "EmailField",
         (option_to_yojson email_field_to_yojson x.email_field));
       (
         "PasswordField",
         (option_to_yojson password_field_to_yojson x.password_field));
       (
         "UsernameField",
         (option_to_yojson username_field_to_yojson x.username_field));
       (
         "PayloadType",
         (Some (payload_type_to_yojson x.payload_type)));
       
  ])

let aws_managed_rules_acfp_rule_set_to_yojson = 
  fun (x: aws_managed_rules_acfp_rule_set) -> assoc_to_yojson(
    [(
         "EnableRegexInPath",
         (option_to_yojson boolean__to_yojson x.enable_regex_in_path));
       (
         "ResponseInspection",
         (option_to_yojson response_inspection_to_yojson x.response_inspection));
       (
         "RequestInspection",
         (Some (request_inspection_acf_p_to_yojson x.request_inspection)));
       (
         "RegistrationPagePath",
         (Some (registration_page_path_string_to_yojson x.registration_page_path)));
       (
         "CreationPath",
         (Some (creation_path_string_to_yojson x.creation_path)));
       
  ])

let managed_rule_group_config_to_yojson = 
  fun (x: managed_rule_group_config) -> assoc_to_yojson(
    [(
         "AWSManagedRulesACFPRuleSet",
         (option_to_yojson aws_managed_rules_acfp_rule_set_to_yojson x.aws_managed_rules_acfp_rule_set));
       (
         "AWSManagedRulesATPRuleSet",
         (option_to_yojson aws_managed_rules_atp_rule_set_to_yojson x.aws_managed_rules_atp_rule_set));
       (
         "AWSManagedRulesBotControlRuleSet",
         (option_to_yojson aws_managed_rules_bot_control_rule_set_to_yojson x.aws_managed_rules_bot_control_rule_set));
       (
         "PasswordField",
         (option_to_yojson password_field_to_yojson x.password_field));
       (
         "UsernameField",
         (option_to_yojson username_field_to_yojson x.username_field));
       (
         "PayloadType",
         (option_to_yojson payload_type_to_yojson x.payload_type));
       (
         "LoginPath",
         (option_to_yojson login_path_string_to_yojson x.login_path));
       
  ])

let managed_rule_group_configs_to_yojson = 
  fun tree -> list_to_yojson managed_rule_group_config_to_yojson tree

let label_match_scope_to_yojson = 
  fun (x: label_match_scope) -> match x with 
  | NAMESPACE -> `String "NAMESPACE"
    | LABEL -> `String "LABEL"
     

let label_match_key_to_yojson = string_to_yojson

let label_match_statement_to_yojson = 
  fun (x: label_match_statement) -> assoc_to_yojson(
    [(
         "Key",
         (Some (label_match_key_to_yojson x.key)));
       (
         "Scope",
         (Some (label_match_scope_to_yojson x.scope)));
       
  ])

let regex_pattern_string_to_yojson = string_to_yojson

let regex_match_statement_to_yojson = 
  fun (x: regex_match_statement) -> assoc_to_yojson(
    [(
         "TextTransformations",
         (Some (text_transformations_to_yojson x.text_transformations)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       (
         "RegexString",
         (Some (regex_pattern_string_to_yojson x.regex_string)));
       
  ])

let rec and_statement_to_yojson = 
  fun (x: and_statement) -> assoc_to_yojson(
    [(
         "Statements",
         (Some (statements_to_yojson x.statements)));
       
  ])

and managed_rule_group_statement_to_yojson = 
  fun (x: managed_rule_group_statement) -> assoc_to_yojson(
    [(
         "RuleActionOverrides",
         (option_to_yojson rule_action_overrides_to_yojson x.rule_action_overrides));
       (
         "ManagedRuleGroupConfigs",
         (option_to_yojson managed_rule_group_configs_to_yojson x.managed_rule_group_configs));
       (
         "ScopeDownStatement",
         (option_to_yojson statement_to_yojson x.scope_down_statement));
       (
         "ExcludedRules",
         (option_to_yojson excluded_rules_to_yojson x.excluded_rules));
       (
         "Version",
         (option_to_yojson version_key_string_to_yojson x.version));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       (
         "VendorName",
         (Some (vendor_name_to_yojson x.vendor_name)));
       
  ])

and not_statement_to_yojson = 
  fun (x: not_statement) -> assoc_to_yojson(
    [(
         "Statement",
         (Some (statement_to_yojson x.statement)));
       
  ])

and or_statement_to_yojson = 
  fun (x: or_statement) -> assoc_to_yojson(
    [(
         "Statements",
         (Some (statements_to_yojson x.statements)));
       
  ])

and rate_based_statement_to_yojson = 
  fun (x: rate_based_statement) -> assoc_to_yojson(
    [(
         "CustomKeys",
         (option_to_yojson rate_based_statement_custom_keys_to_yojson x.custom_keys));
       (
         "ForwardedIPConfig",
         (option_to_yojson forwarded_ip_config_to_yojson x.forwarded_ip_config));
       (
         "ScopeDownStatement",
         (option_to_yojson statement_to_yojson x.scope_down_statement));
       (
         "AggregateKeyType",
         (Some (rate_based_statement_aggregate_key_type_to_yojson x.aggregate_key_type)));
       (
         "EvaluationWindowSec",
         (option_to_yojson evaluation_window_sec_to_yojson x.evaluation_window_sec));
       (
         "Limit",
         (Some (rate_limit_to_yojson x.limit)));
       
  ])

and statement_to_yojson = 
  fun (x: statement) -> assoc_to_yojson(
    [(
         "RegexMatchStatement",
         (option_to_yojson regex_match_statement_to_yojson x.regex_match_statement));
       (
         "LabelMatchStatement",
         (option_to_yojson label_match_statement_to_yojson x.label_match_statement));
       (
         "ManagedRuleGroupStatement",
         (option_to_yojson managed_rule_group_statement_to_yojson x.managed_rule_group_statement));
       (
         "NotStatement",
         (option_to_yojson not_statement_to_yojson x.not_statement));
       (
         "OrStatement",
         (option_to_yojson or_statement_to_yojson x.or_statement));
       (
         "AndStatement",
         (option_to_yojson and_statement_to_yojson x.and_statement));
       (
         "RateBasedStatement",
         (option_to_yojson rate_based_statement_to_yojson x.rate_based_statement));
       (
         "RegexPatternSetReferenceStatement",
         (option_to_yojson regex_pattern_set_reference_statement_to_yojson x.regex_pattern_set_reference_statement));
       (
         "IPSetReferenceStatement",
         (option_to_yojson ip_set_reference_statement_to_yojson x.ip_set_reference_statement));
       (
         "RuleGroupReferenceStatement",
         (option_to_yojson rule_group_reference_statement_to_yojson x.rule_group_reference_statement));
       (
         "GeoMatchStatement",
         (option_to_yojson geo_match_statement_to_yojson x.geo_match_statement));
       (
         "SizeConstraintStatement",
         (option_to_yojson size_constraint_statement_to_yojson x.size_constraint_statement));
       (
         "XssMatchStatement",
         (option_to_yojson xss_match_statement_to_yojson x.xss_match_statement));
       (
         "SqliMatchStatement",
         (option_to_yojson sqli_match_statement_to_yojson x.sqli_match_statement));
       (
         "ByteMatchStatement",
         (option_to_yojson byte_match_statement_to_yojson x.byte_match_statement));
       
  ])

and statements_to_yojson = 
  fun tree -> list_to_yojson statement_to_yojson tree

let none_action_to_yojson = fun (x: none_action) -> assoc_to_yojson(
                              [
                            ])

let override_action_to_yojson = 
  fun (x: override_action) -> assoc_to_yojson(
    [(
         "None",
         (option_to_yojson none_action_to_yojson x.none));
       (
         "Count",
         (option_to_yojson count_action_to_yojson x.count));
       
  ])

let label_name_to_yojson = string_to_yojson

let label_to_yojson = 
  fun (x: label) -> assoc_to_yojson(
    [(
         "Name",
         (Some (label_name_to_yojson x.name)));
       
  ])

let labels_to_yojson = fun tree -> list_to_yojson label_to_yojson tree

let metric_name_to_yojson = string_to_yojson

let visibility_config_to_yojson = 
  fun (x: visibility_config) -> assoc_to_yojson(
    [(
         "MetricName",
         (Some (metric_name_to_yojson x.metric_name)));
       (
         "CloudWatchMetricsEnabled",
         (Some (boolean__to_yojson x.cloud_watch_metrics_enabled)));
       (
         "SampledRequestsEnabled",
         (Some (boolean__to_yojson x.sampled_requests_enabled)));
       
  ])

let time_window_second_to_yojson = long_to_yojson

let immunity_time_property_to_yojson = 
  fun (x: immunity_time_property) -> assoc_to_yojson(
    [(
         "ImmunityTime",
         (Some (time_window_second_to_yojson x.immunity_time)));
       
  ])

let captcha_config_to_yojson = 
  fun (x: captcha_config) -> assoc_to_yojson(
    [(
         "ImmunityTimeProperty",
         (option_to_yojson immunity_time_property_to_yojson x.immunity_time_property));
       
  ])

let challenge_config_to_yojson = 
  fun (x: challenge_config) -> assoc_to_yojson(
    [(
         "ImmunityTimeProperty",
         (option_to_yojson immunity_time_property_to_yojson x.immunity_time_property));
       
  ])

let rule_to_yojson = 
  fun (x: rule) -> assoc_to_yojson(
    [(
         "ChallengeConfig",
         (option_to_yojson challenge_config_to_yojson x.challenge_config));
       (
         "CaptchaConfig",
         (option_to_yojson captcha_config_to_yojson x.captcha_config));
       (
         "VisibilityConfig",
         (Some (visibility_config_to_yojson x.visibility_config)));
       (
         "RuleLabels",
         (option_to_yojson labels_to_yojson x.rule_labels));
       (
         "OverrideAction",
         (option_to_yojson override_action_to_yojson x.override_action));
       (
         "Action",
         (option_to_yojson rule_action_to_yojson x.action));
       (
         "Statement",
         (Some (statement_to_yojson x.statement)));
       (
         "Priority",
         (Some (rule_priority_to_yojson x.priority)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let rules_to_yojson = fun tree -> list_to_yojson rule_to_yojson tree

let consumed_capacity_to_yojson = long_to_yojson

let firewall_manager_statement_to_yojson = 
  fun (x: firewall_manager_statement) -> assoc_to_yojson(
    [(
         "RuleGroupReferenceStatement",
         (option_to_yojson rule_group_reference_statement_to_yojson x.rule_group_reference_statement));
       (
         "ManagedRuleGroupStatement",
         (option_to_yojson managed_rule_group_statement_to_yojson x.managed_rule_group_statement));
       
  ])

let firewall_manager_rule_group_to_yojson = 
  fun (x: firewall_manager_rule_group) -> assoc_to_yojson(
    [(
         "VisibilityConfig",
         (Some (visibility_config_to_yojson x.visibility_config)));
       (
         "OverrideAction",
         (Some (override_action_to_yojson x.override_action)));
       (
         "FirewallManagerStatement",
         (Some (firewall_manager_statement_to_yojson x.firewall_manager_statement)));
       (
         "Priority",
         (Some (rule_priority_to_yojson x.priority)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let firewall_manager_rule_groups_to_yojson = 
  fun tree -> list_to_yojson firewall_manager_rule_group_to_yojson tree

let response_content_type_to_yojson = 
  fun (x: response_content_type) -> match x with 
 
| APPLICATION_JSON -> `String "APPLICATION_JSON"
  | TEXT_HTML -> `String "TEXT_HTML"
  | TEXT_PLAIN -> `String "TEXT_PLAIN"
   

let response_content_to_yojson = string_to_yojson

let custom_response_body_to_yojson = 
  fun (x: custom_response_body) -> assoc_to_yojson(
    [(
         "Content",
         (Some (response_content_to_yojson x.content)));
       (
         "ContentType",
         (Some (response_content_type_to_yojson x.content_type)));
       
  ])

let custom_response_bodies_to_yojson = 
  fun tree -> map_to_yojson custom_response_body_to_yojson tree

let token_domain_to_yojson = string_to_yojson

let token_domains_to_yojson = 
  fun tree -> list_to_yojson token_domain_to_yojson tree

let size_inspection_limit_to_yojson = 
  fun (x: size_inspection_limit) -> match x with 
 
| KB_64 -> `String "KB_64"
  | KB_48 -> `String "KB_48"
  | KB_32 -> `String "KB_32"
  | KB_16 -> `String "KB_16"
   

let request_body_associated_resource_type_config_to_yojson = 
  fun (x: request_body_associated_resource_type_config) -> assoc_to_yojson(
    [(
         "DefaultSizeInspectionLimit",
         (Some (size_inspection_limit_to_yojson x.default_size_inspection_limit)));
       
  ])

let associated_resource_type_to_yojson = 
  fun (x: associated_resource_type) -> match x with 
 
| VERIFIED_ACCESS_INSTANCE -> `String "VERIFIED_ACCESS_INSTANCE"
  | APP_RUNNER_SERVICE -> `String "APP_RUNNER_SERVICE"
  | COGNITO_USER_POOL -> `String "COGNITO_USER_POOL"
  | API_GATEWAY -> `String "API_GATEWAY"
  | CLOUDFRONT -> `String "CLOUDFRONT"
   

let request_body_to_yojson = 
  fun tree -> map_to_yojson request_body_associated_resource_type_config_to_yojson tree

let association_config_to_yojson = 
  fun (x: association_config) -> assoc_to_yojson(
    [(
         "RequestBody",
         (option_to_yojson request_body_to_yojson x.request_body));
       
  ])

let web_ac_l_to_yojson = 
  fun (x: web_ac_l) -> assoc_to_yojson(
    [(
         "AssociationConfig",
         (option_to_yojson association_config_to_yojson x.association_config));
       (
         "TokenDomains",
         (option_to_yojson token_domains_to_yojson x.token_domains));
       (
         "ChallengeConfig",
         (option_to_yojson challenge_config_to_yojson x.challenge_config));
       (
         "CaptchaConfig",
         (option_to_yojson captcha_config_to_yojson x.captcha_config));
       (
         "CustomResponseBodies",
         (option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies));
       (
         "LabelNamespace",
         (option_to_yojson label_name_to_yojson x.label_namespace));
       (
         "ManagedByFirewallManager",
         (option_to_yojson boolean__to_yojson x.managed_by_firewall_manager));
       (
         "PostProcessFirewallManagerRuleGroups",
         (option_to_yojson firewall_manager_rule_groups_to_yojson x.post_process_firewall_manager_rule_groups));
       (
         "PreProcessFirewallManagerRuleGroups",
         (option_to_yojson firewall_manager_rule_groups_to_yojson x.pre_process_firewall_manager_rule_groups));
       (
         "Capacity",
         (option_to_yojson consumed_capacity_to_yojson x.capacity));
       (
         "VisibilityConfig",
         (Some (visibility_config_to_yojson x.visibility_config)));
       (
         "Rules",
         (option_to_yojson rules_to_yojson x.rules));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "DefaultAction",
         (Some (default_action_to_yojson x.default_action)));
       (
         "ARN",
         (Some (resource_arn_to_yojson x.ar_n)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let error_message_to_yojson = string_to_yojson

let waf_unsupported_aggregate_key_type_exception_to_yojson = 
  fun (x: waf_unsupported_aggregate_key_type_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_unavailable_entity_exception_to_yojson = 
  fun (x: waf_unavailable_entity_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_tag_operation_internal_error_exception_to_yojson = 
  fun (x: waf_tag_operation_internal_error_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_tag_operation_exception_to_yojson = 
  fun (x: waf_tag_operation_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_subscription_not_found_exception_to_yojson = 
  fun (x: waf_subscription_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_service_linked_role_error_exception_to_yojson = 
  fun (x: waf_service_linked_role_error_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_optimistic_lock_exception_to_yojson = 
  fun (x: waf_optimistic_lock_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_nonexistent_item_exception_to_yojson = 
  fun (x: waf_nonexistent_item_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_log_destination_permission_issue_exception_to_yojson = 
  fun (x: waf_log_destination_permission_issue_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let source_type_to_yojson = string_to_yojson

let waf_limits_exceeded_exception_to_yojson = 
  fun (x: waf_limits_exceeded_exception) -> assoc_to_yojson(
    [(
         "SourceType",
         (option_to_yojson source_type_to_yojson x.source_type));
       (
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_invalid_resource_exception_to_yojson = 
  fun (x: waf_invalid_resource_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_invalid_permission_policy_exception_to_yojson = 
  fun (x: waf_invalid_permission_policy_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let parameter_exception_field_to_yojson = 
  fun (x: parameter_exception_field) -> match x with 
 
| ACP_RULE_SET_RESPONSE_INSPECTION -> `String "ACP_RULE_SET_RESPONSE_INSPECTION"
  | CUSTOM_KEYS -> `String "CUSTOM_KEYS"
  | SCOPE_DOWN -> `String "SCOPE_DOWN"
  | ASSOCIATED_RESOURCE_TYPE -> `String "ASSOCIATED_RESOURCE_TYPE"
  | ATP_RULE_SET_RESPONSE_INSPECTION -> `String "ATP_RULE_SET_RESPONSE_INSPECTION"
  | TOKEN_DOMAIN -> `String "TOKEN_DOMAIN"
  | CHALLENGE_CONFIG -> `String "CHALLENGE_CONFIG"
  | OVERSIZE_HANDLING -> `String "OVERSIZE_HANDLING"
  | MAP_MATCH_SCOPE -> `String "MAP_MATCH_SCOPE"
  | COOKIE_MATCH_PATTERN -> `String "COOKIE_MATCH_PATTERN"
  | HEADER_MATCH_PATTERN -> `String "HEADER_MATCH_PATTERN"
  | PAYLOAD_TYPE -> `String "PAYLOAD_TYPE"
  | MANAGED_RULE_GROUP_CONFIG -> `String "MANAGED_RULE_GROUP_CONFIG"
  | LOG_DESTINATION -> `String "LOG_DESTINATION"
  | ASSOCIABLE_RESOURCE -> `String "ASSOCIABLE_RESOURCE"
  | CHANGE_PROPAGATION_STATUS -> `String "CHANGE_PROPAGATION_STATUS"
  | EXPIRE_TIMESTAMP -> `String "EXPIRE_TIMESTAMP"
  | FILTER_CONDITION -> `String "FILTER_CONDITION"
  | LOGGING_FILTER -> `String "LOGGING_FILTER"
  | BODY_PARSING_FALLBACK_BEHAVIOR -> `String "BODY_PARSING_FALLBACK_BEHAVIOR"
  | JSON_MATCH_SCOPE -> `String "JSON_MATCH_SCOPE"
  | JSON_MATCH_PATTERN -> `String "JSON_MATCH_PATTERN"
  | CUSTOM_RESPONSE_BODY -> `String "CUSTOM_RESPONSE_BODY"
  | CUSTOM_RESPONSE -> `String "CUSTOM_RESPONSE"
  | RESPONSE_CONTENT_TYPE -> `String "RESPONSE_CONTENT_TYPE"
  | CUSTOM_REQUEST_HANDLING -> `String "CUSTOM_REQUEST_HANDLING"
  | HEADER_NAME -> `String "HEADER_NAME"
  | IP_SET_FORWARDED_IP_CONFIG -> `String "IP_SET_FORWARDED_IP_CONFIG"
  | FORWARDED_IP_CONFIG -> `String "FORWARDED_IP_CONFIG"
  | POSITION -> `String "POSITION"
  | FALLBACK_BEHAVIOR -> `String "FALLBACK_BEHAVIOR"
  | FIREWALL_MANAGER_STATEMENT -> `String "FIREWALL_MANAGER_STATEMENT"
  | METRIC_NAME -> `String "METRIC_NAME"
  | TAG_KEYS -> `String "TAG_KEYS"
  | TAGS -> `String "TAGS"
  | RESOURCE_TYPE -> `String "RESOURCE_TYPE"
  | RESOURCE_ARN -> `String "RESOURCE_ARN"
  | SCOPE_VALUE -> `String "SCOPE_VALUE"
  | OVERRIDE_ACTION -> `String "OVERRIDE_ACTION"
  | ENTITY_LIMIT -> `String "ENTITY_LIMIT"
  | RULE_ACTION -> `String "RULE_ACTION"
  | DEFAULT_ACTION -> `String "DEFAULT_ACTION"
  | SINGLE_HEADER -> `String "SINGLE_HEADER"
  | SINGLE_QUERY_ARGUMENT -> `String "SINGLE_QUERY_ARGUMENT"
  | TEXT_TRANSFORMATION -> `String "TEXT_TRANSFORMATION"
  | FIELD_TO_MATCH -> `String "FIELD_TO_MATCH"
  | IP_ADDRESS_VERSION -> `String "IP_ADDRESS_VERSION"
  | IP_ADDRESS -> `String "IP_ADDRESS"
  | NOT_STATEMENT -> `String "NOT_STATEMENT"
  | OR_STATEMENT -> `String "OR_STATEMENT"
  | AND_STATEMENT -> `String "AND_STATEMENT"
  | LABEL_MATCH_STATEMENT -> `String "LABEL_MATCH_STATEMENT"
  | MANAGED_RULE_SET_STATEMENT -> `String "MANAGED_RULE_SET_STATEMENT"
  | IP_SET_REFERENCE_STATEMENT -> `String "IP_SET_REFERENCE_STATEMENT"
  | REGEX_PATTERN_REFERENCE_STATEMENT -> `String "REGEX_PATTERN_REFERENCE_STATEMENT"
  | RULE_GROUP_REFERENCE_STATEMENT -> `String "RULE_GROUP_REFERENCE_STATEMENT"
  | RATE_BASED_STATEMENT -> `String "RATE_BASED_STATEMENT"
  | GEO_MATCH_STATEMENT -> `String "GEO_MATCH_STATEMENT"
  | SIZE_CONSTRAINT_STATEMENT -> `String "SIZE_CONSTRAINT_STATEMENT"
  | XSS_MATCH_STATEMENT -> `String "XSS_MATCH_STATEMENT"
  | SQLI_MATCH_STATEMENT -> `String "SQLI_MATCH_STATEMENT"
  | BYTE_MATCH_STATEMENT -> `String "BYTE_MATCH_STATEMENT"
  | STATEMENT -> `String "STATEMENT"
  | EXCLUDED_RULE -> `String "EXCLUDED_RULE"
  | RULE -> `String "RULE"
  | MANAGED_RULE_SET -> `String "MANAGED_RULE_SET"
  | IP_SET -> `String "IP_SET"
  | REGEX_PATTERN_SET -> `String "REGEX_PATTERN_SET"
  | RULE_GROUP -> `String "RULE_GROUP"
  | WEB_ACL -> `String "WEB_ACL"
   

let parameter_exception_parameter_to_yojson = string_to_yojson

let error_reason_to_yojson = string_to_yojson

let waf_invalid_parameter_exception_to_yojson = 
  fun (x: waf_invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "Reason",
         (option_to_yojson error_reason_to_yojson x.reason));
       (
         "Parameter",
         (option_to_yojson parameter_exception_parameter_to_yojson x.parameter));
       (
         "Field",
         (option_to_yojson parameter_exception_field_to_yojson x.field));
       (
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_invalid_operation_exception_to_yojson = 
  fun (x: waf_invalid_operation_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_internal_error_exception_to_yojson = 
  fun (x: waf_internal_error_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_expired_managed_rule_group_version_exception_to_yojson = 
  fun (x: waf_expired_managed_rule_group_version_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_duplicate_item_exception_to_yojson = 
  fun (x: waf_duplicate_item_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_configuration_warning_exception_to_yojson = 
  fun (x: waf_configuration_warning_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_associated_item_exception_to_yojson = 
  fun (x: waf_associated_item_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let time_window_day_to_yojson = int_to_yojson

let version_to_publish_to_yojson = 
  fun (x: version_to_publish) -> assoc_to_yojson(
    [(
         "ForecastedLifetime",
         (option_to_yojson time_window_day_to_yojson x.forecasted_lifetime));
       (
         "AssociatedRuleGroupArn",
         (option_to_yojson resource_arn_to_yojson x.associated_rule_group_arn));
       
  ])

let versions_to_publish_to_yojson = 
  fun tree -> map_to_yojson version_to_publish_to_yojson tree

let update_web_acl_response_to_yojson = 
  fun (x: update_web_acl_response) -> assoc_to_yojson(
    [(
         "NextLockToken",
         (option_to_yojson lock_token_to_yojson x.next_lock_token));
       
  ])

let scope_to_yojson = 
  fun (x: scope) -> match x with 
  | REGIONAL -> `String "REGIONAL"
    | CLOUDFRONT -> `String "CLOUDFRONT"
     

let update_web_acl_request_to_yojson = 
  fun (x: update_web_acl_request) -> assoc_to_yojson(
    [(
         "AssociationConfig",
         (option_to_yojson association_config_to_yojson x.association_config));
       (
         "TokenDomains",
         (option_to_yojson token_domains_to_yojson x.token_domains));
       (
         "ChallengeConfig",
         (option_to_yojson challenge_config_to_yojson x.challenge_config));
       (
         "CaptchaConfig",
         (option_to_yojson captcha_config_to_yojson x.captcha_config));
       (
         "CustomResponseBodies",
         (option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies));
       (
         "LockToken",
         (Some (lock_token_to_yojson x.lock_token)));
       (
         "VisibilityConfig",
         (Some (visibility_config_to_yojson x.visibility_config)));
       (
         "Rules",
         (option_to_yojson rules_to_yojson x.rules));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "DefaultAction",
         (Some (default_action_to_yojson x.default_action)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let update_rule_group_response_to_yojson = 
  fun (x: update_rule_group_response) -> assoc_to_yojson(
    [(
         "NextLockToken",
         (option_to_yojson lock_token_to_yojson x.next_lock_token));
       
  ])

let update_rule_group_request_to_yojson = 
  fun (x: update_rule_group_request) -> assoc_to_yojson(
    [(
         "CustomResponseBodies",
         (option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies));
       (
         "LockToken",
         (Some (lock_token_to_yojson x.lock_token)));
       (
         "VisibilityConfig",
         (Some (visibility_config_to_yojson x.visibility_config)));
       (
         "Rules",
         (option_to_yojson rules_to_yojson x.rules));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let update_regex_pattern_set_response_to_yojson = 
  fun (x: update_regex_pattern_set_response) -> assoc_to_yojson(
    [(
         "NextLockToken",
         (option_to_yojson lock_token_to_yojson x.next_lock_token));
       
  ])

let regex_to_yojson = 
  fun (x: regex) -> assoc_to_yojson(
    [(
         "RegexString",
         (option_to_yojson regex_pattern_string_to_yojson x.regex_string));
       
  ])

let regular_expression_list_to_yojson = 
  fun tree -> list_to_yojson regex_to_yojson tree

let update_regex_pattern_set_request_to_yojson = 
  fun (x: update_regex_pattern_set_request) -> assoc_to_yojson(
    [(
         "LockToken",
         (Some (lock_token_to_yojson x.lock_token)));
       (
         "RegularExpressionList",
         (Some (regular_expression_list_to_yojson x.regular_expression_list)));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let timestamp__to_yojson = timestamp_to_yojson

let update_managed_rule_set_version_expiry_date_response_to_yojson = 
  fun (x: update_managed_rule_set_version_expiry_date_response) -> assoc_to_yojson(
    [(
         "NextLockToken",
         (option_to_yojson lock_token_to_yojson x.next_lock_token));
       (
         "ExpiryTimestamp",
         (option_to_yojson timestamp__to_yojson x.expiry_timestamp));
       (
         "ExpiringVersion",
         (option_to_yojson version_key_string_to_yojson x.expiring_version));
       
  ])

let update_managed_rule_set_version_expiry_date_request_to_yojson = 
  fun (x: update_managed_rule_set_version_expiry_date_request) -> assoc_to_yojson(
    [(
         "ExpiryTimestamp",
         (Some (timestamp__to_yojson x.expiry_timestamp)));
       (
         "VersionToExpire",
         (Some (version_key_string_to_yojson x.version_to_expire)));
       (
         "LockToken",
         (Some (lock_token_to_yojson x.lock_token)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let update_ip_set_response_to_yojson = 
  fun (x: update_ip_set_response) -> assoc_to_yojson(
    [(
         "NextLockToken",
         (option_to_yojson lock_token_to_yojson x.next_lock_token));
       
  ])

let ip_address_to_yojson = string_to_yojson

let ip_addresses_to_yojson = 
  fun tree -> list_to_yojson ip_address_to_yojson tree

let update_ip_set_request_to_yojson = 
  fun (x: update_ip_set_request) -> assoc_to_yojson(
    [(
         "LockToken",
         (Some (lock_token_to_yojson x.lock_token)));
       (
         "Addresses",
         (Some (ip_addresses_to_yojson x.addresses)));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
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

let solve_timestamp_to_yojson = long_to_yojson

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

let response_code_to_yojson = int_to_yojson

let failure_reason_to_yojson = 
  fun (x: failure_reason) -> match x with 
 
| TOKEN_DOMAIN_MISMATCH -> `String "TOKEN_DOMAIN_MISMATCH"
  | TOKEN_INVALID -> `String "TOKEN_INVALID"
  | TOKEN_EXPIRED -> `String "TOKEN_EXPIRED"
  | TOKEN_MISSING -> `String "TOKEN_MISSING"
   

let captcha_response_to_yojson = 
  fun (x: captcha_response) -> assoc_to_yojson(
    [(
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "SolveTimestamp",
         (option_to_yojson solve_timestamp_to_yojson x.solve_timestamp));
       (
         "ResponseCode",
         (option_to_yojson response_code_to_yojson x.response_code));
       
  ])

let challenge_response_to_yojson = 
  fun (x: challenge_response) -> assoc_to_yojson(
    [(
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "SolveTimestamp",
         (option_to_yojson solve_timestamp_to_yojson x.solve_timestamp));
       (
         "ResponseCode",
         (option_to_yojson response_code_to_yojson x.response_code));
       
  ])

let sampled_http_request_to_yojson = 
  fun (x: sampled_http_request) -> assoc_to_yojson(
    [(
         "OverriddenAction",
         (option_to_yojson action_to_yojson x.overridden_action));
       (
         "ChallengeResponse",
         (option_to_yojson challenge_response_to_yojson x.challenge_response));
       (
         "CaptchaResponse",
         (option_to_yojson captcha_response_to_yojson x.captcha_response));
       (
         "Labels",
         (option_to_yojson labels_to_yojson x.labels));
       (
         "ResponseCodeSent",
         (option_to_yojson response_status_code_to_yojson x.response_code_sent));
       (
         "RequestHeadersInserted",
         (option_to_yojson http_headers_to_yojson x.request_headers_inserted));
       (
         "RuleNameWithinRuleGroup",
         (option_to_yojson entity_name_to_yojson x.rule_name_within_rule_group));
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

let rule_summary_to_yojson = 
  fun (x: rule_summary) -> assoc_to_yojson(
    [(
         "Action",
         (option_to_yojson rule_action_to_yojson x.action));
       (
         "Name",
         (option_to_yojson entity_name_to_yojson x.name));
       
  ])

let rule_summaries_to_yojson = 
  fun tree -> list_to_yojson rule_summary_to_yojson tree

let rule_group_summary_to_yojson = 
  fun (x: rule_group_summary) -> assoc_to_yojson(
    [(
         "ARN",
         (option_to_yojson resource_arn_to_yojson x.ar_n));
       (
         "LockToken",
         (option_to_yojson lock_token_to_yojson x.lock_token));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Id",
         (option_to_yojson entity_id_to_yojson x.id));
       (
         "Name",
         (option_to_yojson entity_name_to_yojson x.name));
       
  ])

let rule_group_summaries_to_yojson = 
  fun tree -> list_to_yojson rule_group_summary_to_yojson tree

let capacity_unit_to_yojson = long_to_yojson

let label_summary_to_yojson = 
  fun (x: label_summary) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson label_name_to_yojson x.name));
       
  ])

let label_summaries_to_yojson = 
  fun tree -> list_to_yojson label_summary_to_yojson tree

let rule_group_to_yojson = 
  fun (x: rule_group) -> assoc_to_yojson(
    [(
         "ConsumedLabels",
         (option_to_yojson label_summaries_to_yojson x.consumed_labels));
       (
         "AvailableLabels",
         (option_to_yojson label_summaries_to_yojson x.available_labels));
       (
         "CustomResponseBodies",
         (option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies));
       (
         "LabelNamespace",
         (option_to_yojson label_name_to_yojson x.label_namespace));
       (
         "VisibilityConfig",
         (Some (visibility_config_to_yojson x.visibility_config)));
       (
         "Rules",
         (option_to_yojson rules_to_yojson x.rules));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "ARN",
         (Some (resource_arn_to_yojson x.ar_n)));
       (
         "Capacity",
         (Some (capacity_unit_to_yojson x.capacity)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let resource_type_to_yojson = 
  fun (x: resource_type) -> match x with 
 
| VERIFIED_ACCESS_INSTANCE -> `String "VERIFIED_ACCESS_INSTANCE"
  | APP_RUNNER_SERVICE -> `String "APP_RUNNER_SERVICE"
  | COGNITIO_USER_POOL -> `String "COGNITO_USER_POOL"
  | APPSYNC -> `String "APPSYNC"
  | API_GATEWAY -> `String "API_GATEWAY"
  | APPLICATION_LOAD_BALANCER -> `String "APPLICATION_LOAD_BALANCER"
   

let resource_arns_to_yojson = 
  fun tree -> list_to_yojson resource_arn_to_yojson tree

let release_summary_to_yojson = 
  fun (x: release_summary) -> assoc_to_yojson(
    [(
         "Timestamp",
         (option_to_yojson timestamp__to_yojson x.timestamp_));
       (
         "ReleaseVersion",
         (option_to_yojson version_key_string_to_yojson x.release_version));
       
  ])

let release_summaries_to_yojson = 
  fun tree -> list_to_yojson release_summary_to_yojson tree

let release_notes_to_yojson = string_to_yojson

let regex_pattern_set_summary_to_yojson = 
  fun (x: regex_pattern_set_summary) -> assoc_to_yojson(
    [(
         "ARN",
         (option_to_yojson resource_arn_to_yojson x.ar_n));
       (
         "LockToken",
         (option_to_yojson lock_token_to_yojson x.lock_token));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Id",
         (option_to_yojson entity_id_to_yojson x.id));
       (
         "Name",
         (option_to_yojson entity_name_to_yojson x.name));
       
  ])

let regex_pattern_set_summaries_to_yojson = 
  fun tree -> list_to_yojson regex_pattern_set_summary_to_yojson tree

let regex_pattern_set_to_yojson = 
  fun (x: regex_pattern_set) -> assoc_to_yojson(
    [(
         "RegularExpressionList",
         (option_to_yojson regular_expression_list_to_yojson x.regular_expression_list));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "ARN",
         (option_to_yojson resource_arn_to_yojson x.ar_n));
       (
         "Id",
         (option_to_yojson entity_id_to_yojson x.id));
       (
         "Name",
         (option_to_yojson entity_name_to_yojson x.name));
       
  ])

let redacted_fields_to_yojson = 
  fun tree -> list_to_yojson field_to_match_to_yojson tree

let ip_address_version_to_yojson = 
  fun (x: ip_address_version) -> match x with 
  | IPV6 -> `String "IPV6"
    | IPV4 -> `String "IPV4"
     

let rate_based_statement_managed_keys_ip_set_to_yojson = 
  fun (x: rate_based_statement_managed_keys_ip_set) -> assoc_to_yojson(
    [(
         "Addresses",
         (option_to_yojson ip_addresses_to_yojson x.addresses));
       (
         "IPAddressVersion",
         (option_to_yojson ip_address_version_to_yojson x.ip_address_version));
       
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

let put_managed_rule_set_versions_response_to_yojson = 
  fun (x: put_managed_rule_set_versions_response) -> assoc_to_yojson(
    [(
         "NextLockToken",
         (option_to_yojson lock_token_to_yojson x.next_lock_token));
       
  ])

let put_managed_rule_set_versions_request_to_yojson = 
  fun (x: put_managed_rule_set_versions_request) -> assoc_to_yojson(
    [(
         "VersionsToPublish",
         (option_to_yojson versions_to_publish_to_yojson x.versions_to_publish));
       (
         "RecommendedVersion",
         (option_to_yojson version_key_string_to_yojson x.recommended_version));
       (
         "LockToken",
         (Some (lock_token_to_yojson x.lock_token)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let log_destination_configs_to_yojson = 
  fun tree -> list_to_yojson resource_arn_to_yojson tree

let filter_behavior_to_yojson = 
  fun (x: filter_behavior) -> match x with 
  | DROP -> `String "DROP"
    | KEEP -> `String "KEEP"
     

let filter_requirement_to_yojson = 
  fun (x: filter_requirement) -> match x with 
  | MEETS_ANY -> `String "MEETS_ANY"
    | MEETS_ALL -> `String "MEETS_ALL"
     

let action_value_to_yojson = 
  fun (x: action_value) -> match x with 
 
| EXCLUDED_AS_COUNT -> `String "EXCLUDED_AS_COUNT"
  | CHALLENGE -> `String "CHALLENGE"
  | CAPTCHA -> `String "CAPTCHA"
  | COUNT -> `String "COUNT"
  | BLOCK -> `String "BLOCK"
  | ALLOW -> `String "ALLOW"
   

let action_condition_to_yojson = 
  fun (x: action_condition) -> assoc_to_yojson(
    [(
         "Action",
         (Some (action_value_to_yojson x.action)));
       
  ])

let label_name_condition_to_yojson = 
  fun (x: label_name_condition) -> assoc_to_yojson(
    [(
         "LabelName",
         (Some (label_name_to_yojson x.label_name)));
       
  ])

let condition_to_yojson = 
  fun (x: condition) -> assoc_to_yojson(
    [(
         "LabelNameCondition",
         (option_to_yojson label_name_condition_to_yojson x.label_name_condition));
       (
         "ActionCondition",
         (option_to_yojson action_condition_to_yojson x.action_condition));
       
  ])

let conditions_to_yojson = 
  fun tree -> list_to_yojson condition_to_yojson tree

let filter_to_yojson = 
  fun (x: filter) -> assoc_to_yojson(
    [(
         "Conditions",
         (Some (conditions_to_yojson x.conditions)));
       (
         "Requirement",
         (Some (filter_requirement_to_yojson x.requirement)));
       (
         "Behavior",
         (Some (filter_behavior_to_yojson x.behavior)));
       
  ])

let filters_to_yojson = fun tree -> list_to_yojson filter_to_yojson tree

let logging_filter_to_yojson = 
  fun (x: logging_filter) -> assoc_to_yojson(
    [(
         "DefaultBehavior",
         (Some (filter_behavior_to_yojson x.default_behavior)));
       (
         "Filters",
         (Some (filters_to_yojson x.filters)));
       
  ])

let log_type_to_yojson = 
  fun (x: log_type) -> match x with 
  | WAF_LOGS -> `String "WAF_LOGS"
     

let log_scope_to_yojson = 
  fun (x: log_scope) -> match x with 
 
| SECURITY_LAKE -> `String "SECURITY_LAKE"
  | CUSTOMER -> `String "CUSTOMER"
   

let logging_configuration_to_yojson = 
  fun (x: logging_configuration) -> assoc_to_yojson(
    [(
         "LogScope",
         (option_to_yojson log_scope_to_yojson x.log_scope));
       (
         "LogType",
         (option_to_yojson log_type_to_yojson x.log_type));
       (
         "LoggingFilter",
         (option_to_yojson logging_filter_to_yojson x.logging_filter));
       (
         "ManagedByFirewallManager",
         (option_to_yojson boolean__to_yojson x.managed_by_firewall_manager));
       (
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

let managed_rule_set_version_to_yojson = 
  fun (x: managed_rule_set_version) -> assoc_to_yojson(
    [(
         "ExpiryTimestamp",
         (option_to_yojson timestamp__to_yojson x.expiry_timestamp));
       (
         "LastUpdateTimestamp",
         (option_to_yojson timestamp__to_yojson x.last_update_timestamp));
       (
         "PublishTimestamp",
         (option_to_yojson timestamp__to_yojson x.publish_timestamp));
       (
         "ForecastedLifetime",
         (option_to_yojson time_window_day_to_yojson x.forecasted_lifetime));
       (
         "Capacity",
         (option_to_yojson capacity_unit_to_yojson x.capacity));
       (
         "AssociatedRuleGroupArn",
         (option_to_yojson resource_arn_to_yojson x.associated_rule_group_arn));
       
  ])

let published_versions_to_yojson = 
  fun tree -> map_to_yojson managed_rule_set_version_to_yojson tree

let product_title_to_yojson = string_to_yojson

let product_link_to_yojson = string_to_yojson

let product_id_to_yojson = string_to_yojson

let product_description_to_yojson = string_to_yojson

let population_size_to_yojson = long_to_yojson

let platform_to_yojson = 
  fun (x: platform) -> match x with 
  | ANDROID -> `String "ANDROID"
    | IOS -> `String "IOS"
     

let pagination_limit_to_yojson = int_to_yojson

let output_url_to_yojson = string_to_yojson

let next_marker_to_yojson = string_to_yojson

let mobile_sdk_release_to_yojson = 
  fun (x: mobile_sdk_release) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ReleaseNotes",
         (option_to_yojson release_notes_to_yojson x.release_notes));
       (
         "Timestamp",
         (option_to_yojson timestamp__to_yojson x.timestamp_));
       (
         "ReleaseVersion",
         (option_to_yojson version_key_string_to_yojson x.release_version));
       
  ])

let managed_rule_set_summary_to_yojson = 
  fun (x: managed_rule_set_summary) -> assoc_to_yojson(
    [(
         "LabelNamespace",
         (option_to_yojson label_name_to_yojson x.label_namespace));
       (
         "ARN",
         (option_to_yojson resource_arn_to_yojson x.ar_n));
       (
         "LockToken",
         (option_to_yojson lock_token_to_yojson x.lock_token));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Id",
         (option_to_yojson entity_id_to_yojson x.id));
       (
         "Name",
         (option_to_yojson entity_name_to_yojson x.name));
       
  ])

let managed_rule_set_summaries_to_yojson = 
  fun tree -> list_to_yojson managed_rule_set_summary_to_yojson tree

let managed_rule_set_to_yojson = 
  fun (x: managed_rule_set) -> assoc_to_yojson(
    [(
         "LabelNamespace",
         (option_to_yojson label_name_to_yojson x.label_namespace));
       (
         "RecommendedVersion",
         (option_to_yojson version_key_string_to_yojson x.recommended_version));
       (
         "PublishedVersions",
         (option_to_yojson published_versions_to_yojson x.published_versions));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "ARN",
         (Some (resource_arn_to_yojson x.ar_n)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let managed_rule_group_version_to_yojson = 
  fun (x: managed_rule_group_version) -> assoc_to_yojson(
    [(
         "LastUpdateTimestamp",
         (option_to_yojson timestamp__to_yojson x.last_update_timestamp));
       (
         "Name",
         (option_to_yojson version_key_string_to_yojson x.name));
       
  ])

let managed_rule_group_versions_to_yojson = 
  fun tree -> list_to_yojson managed_rule_group_version_to_yojson tree

let managed_rule_group_summary_to_yojson = 
  fun (x: managed_rule_group_summary) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "VersioningSupported",
         (option_to_yojson boolean__to_yojson x.versioning_supported));
       (
         "Name",
         (option_to_yojson entity_name_to_yojson x.name));
       (
         "VendorName",
         (option_to_yojson vendor_name_to_yojson x.vendor_name));
       
  ])

let managed_rule_group_summaries_to_yojson = 
  fun tree -> list_to_yojson managed_rule_group_summary_to_yojson tree

let managed_product_descriptor_to_yojson = 
  fun (x: managed_product_descriptor) -> assoc_to_yojson(
    [(
         "IsAdvancedManagedRuleSet",
         (option_to_yojson boolean__to_yojson x.is_advanced_managed_rule_set));
       (
         "IsVersioningSupported",
         (option_to_yojson boolean__to_yojson x.is_versioning_supported));
       (
         "SnsTopicArn",
         (option_to_yojson resource_arn_to_yojson x.sns_topic_arn));
       (
         "ProductDescription",
         (option_to_yojson product_description_to_yojson x.product_description));
       (
         "ProductTitle",
         (option_to_yojson product_title_to_yojson x.product_title));
       (
         "ProductLink",
         (option_to_yojson product_link_to_yojson x.product_link));
       (
         "ProductId",
         (option_to_yojson product_id_to_yojson x.product_id));
       (
         "ManagedRuleSetName",
         (option_to_yojson entity_name_to_yojson x.managed_rule_set_name));
       (
         "VendorName",
         (option_to_yojson vendor_name_to_yojson x.vendor_name));
       
  ])

let managed_product_descriptors_to_yojson = 
  fun tree -> list_to_yojson managed_product_descriptor_to_yojson tree

let logging_configurations_to_yojson = 
  fun tree -> list_to_yojson logging_configuration_to_yojson tree

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
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
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
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let list_resources_for_web_acl_response_to_yojson = 
  fun (x: list_resources_for_web_acl_response) -> assoc_to_yojson(
    [(
         "ResourceArns",
         (option_to_yojson resource_arns_to_yojson x.resource_arns));
       
  ])

let list_resources_for_web_acl_request_to_yojson = 
  fun (x: list_resources_for_web_acl_request) -> assoc_to_yojson(
    [(
         "ResourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "WebACLArn",
         (Some (resource_arn_to_yojson x.web_acl_arn)));
       
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
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let list_mobile_sdk_releases_response_to_yojson = 
  fun (x: list_mobile_sdk_releases_response) -> assoc_to_yojson(
    [(
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "ReleaseSummaries",
         (option_to_yojson release_summaries_to_yojson x.release_summaries));
       
  ])

let list_mobile_sdk_releases_request_to_yojson = 
  fun (x: list_mobile_sdk_releases_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "Platform",
         (Some (platform_to_yojson x.platform)));
       
  ])

let list_max_items_to_yojson = long_to_yojson

let list_managed_rule_sets_response_to_yojson = 
  fun (x: list_managed_rule_sets_response) -> assoc_to_yojson(
    [(
         "ManagedRuleSets",
         (option_to_yojson managed_rule_set_summaries_to_yojson x.managed_rule_sets));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_managed_rule_sets_request_to_yojson = 
  fun (x: list_managed_rule_sets_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
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
         "LogScope",
         (option_to_yojson log_scope_to_yojson x.log_scope));
       (
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let ip_set_summary_to_yojson = 
  fun (x: ip_set_summary) -> assoc_to_yojson(
    [(
         "ARN",
         (option_to_yojson resource_arn_to_yojson x.ar_n));
       (
         "LockToken",
         (option_to_yojson lock_token_to_yojson x.lock_token));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Id",
         (option_to_yojson entity_id_to_yojson x.id));
       (
         "Name",
         (option_to_yojson entity_name_to_yojson x.name));
       
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
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let list_available_managed_rule_groups_response_to_yojson = 
  fun (x: list_available_managed_rule_groups_response) -> assoc_to_yojson(
    [(
         "ManagedRuleGroups",
         (option_to_yojson managed_rule_group_summaries_to_yojson x.managed_rule_groups));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_available_managed_rule_groups_request_to_yojson = 
  fun (x: list_available_managed_rule_groups_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let list_available_managed_rule_group_versions_response_to_yojson = 
  fun (x: list_available_managed_rule_group_versions_response) -> assoc_to_yojson(
    [(
         "CurrentDefaultVersion",
         (option_to_yojson version_key_string_to_yojson x.current_default_version));
       (
         "Versions",
         (option_to_yojson managed_rule_group_versions_to_yojson x.versions));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_available_managed_rule_group_versions_request_to_yojson = 
  fun (x: list_available_managed_rule_group_versions_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       (
         "VendorName",
         (Some (vendor_name_to_yojson x.vendor_name)));
       
  ])

let api_key_to_yojson = string_to_yojson

let api_key_version_to_yojson = int_to_yojson

let api_key_summary_to_yojson = 
  fun (x: api_key_summary) -> assoc_to_yojson(
    [(
         "Version",
         (option_to_yojson api_key_version_to_yojson x.version));
       (
         "CreationTimestamp",
         (option_to_yojson timestamp__to_yojson x.creation_timestamp));
       (
         "APIKey",
         (option_to_yojson api_key_to_yojson x.api_key));
       (
         "TokenDomains",
         (option_to_yojson token_domains_to_yojson x.token_domains));
       
  ])

let api_key_summaries_to_yojson = 
  fun tree -> list_to_yojson api_key_summary_to_yojson tree

let list_api_keys_response_to_yojson = 
  fun (x: list_api_keys_response) -> assoc_to_yojson(
    [(
         "ApplicationIntegrationURL",
         (option_to_yojson output_url_to_yojson x.application_integration_ur_l));
       (
         "APIKeySummaries",
         (option_to_yojson api_key_summaries_to_yojson x.api_key_summaries));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_api_keys_request_to_yojson = 
  fun (x: list_api_keys_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let ip_set_to_yojson = 
  fun (x: ip_set) -> assoc_to_yojson(
    [(
         "Addresses",
         (Some (ip_addresses_to_yojson x.addresses)));
       (
         "IPAddressVersion",
         (Some (ip_address_version_to_yojson x.ip_address_version)));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "ARN",
         (Some (resource_arn_to_yojson x.ar_n)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let get_web_acl_response_to_yojson = 
  fun (x: get_web_acl_response) -> assoc_to_yojson(
    [(
         "ApplicationIntegrationURL",
         (option_to_yojson output_url_to_yojson x.application_integration_ur_l));
       (
         "LockToken",
         (option_to_yojson lock_token_to_yojson x.lock_token));
       (
         "WebACL",
         (option_to_yojson web_ac_l_to_yojson x.web_ac_l));
       
  ])

let get_web_acl_request_to_yojson = 
  fun (x: get_web_acl_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let get_web_acl_for_resource_response_to_yojson = 
  fun (x: get_web_acl_for_resource_response) -> assoc_to_yojson(
    [(
         "WebACL",
         (option_to_yojson web_ac_l_to_yojson x.web_ac_l));
       
  ])

let get_web_acl_for_resource_request_to_yojson = 
  fun (x: get_web_acl_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
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

let get_sampled_requests_request_to_yojson = 
  fun (x: get_sampled_requests_request) -> assoc_to_yojson(
    [(
         "MaxItems",
         (Some (list_max_items_to_yojson x.max_items)));
       (
         "TimeWindow",
         (Some (time_window_to_yojson x.time_window)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "RuleMetricName",
         (Some (metric_name_to_yojson x.rule_metric_name)));
       (
         "WebAclArn",
         (Some (resource_arn_to_yojson x.web_acl_arn)));
       
  ])

let get_rule_group_response_to_yojson = 
  fun (x: get_rule_group_response) -> assoc_to_yojson(
    [(
         "LockToken",
         (option_to_yojson lock_token_to_yojson x.lock_token));
       (
         "RuleGroup",
         (option_to_yojson rule_group_to_yojson x.rule_group));
       
  ])

let get_rule_group_request_to_yojson = 
  fun (x: get_rule_group_request) -> assoc_to_yojson(
    [(
         "ARN",
         (option_to_yojson resource_arn_to_yojson x.ar_n));
       (
         "Id",
         (option_to_yojson entity_id_to_yojson x.id));
       (
         "Scope",
         (option_to_yojson scope_to_yojson x.scope));
       (
         "Name",
         (option_to_yojson entity_name_to_yojson x.name));
       
  ])

let get_regex_pattern_set_response_to_yojson = 
  fun (x: get_regex_pattern_set_response) -> assoc_to_yojson(
    [(
         "LockToken",
         (option_to_yojson lock_token_to_yojson x.lock_token));
       (
         "RegexPatternSet",
         (option_to_yojson regex_pattern_set_to_yojson x.regex_pattern_set));
       
  ])

let get_regex_pattern_set_request_to_yojson = 
  fun (x: get_regex_pattern_set_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let get_rate_based_statement_managed_keys_response_to_yojson = 
  fun (x: get_rate_based_statement_managed_keys_response) -> assoc_to_yojson(
    [(
         "ManagedKeysIPV6",
         (option_to_yojson rate_based_statement_managed_keys_ip_set_to_yojson x.managed_keys_ip_v6));
       (
         "ManagedKeysIPV4",
         (option_to_yojson rate_based_statement_managed_keys_ip_set_to_yojson x.managed_keys_ip_v4));
       
  ])

let get_rate_based_statement_managed_keys_request_to_yojson = 
  fun (x: get_rate_based_statement_managed_keys_request) -> assoc_to_yojson(
    [(
         "RuleName",
         (Some (entity_name_to_yojson x.rule_name)));
       (
         "RuleGroupRuleName",
         (option_to_yojson entity_name_to_yojson x.rule_group_rule_name));
       (
         "WebACLId",
         (Some (entity_id_to_yojson x.web_acl_id)));
       (
         "WebACLName",
         (Some (entity_name_to_yojson x.web_acl_name)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
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

let get_mobile_sdk_release_response_to_yojson = 
  fun (x: get_mobile_sdk_release_response) -> assoc_to_yojson(
    [(
         "MobileSdkRelease",
         (option_to_yojson mobile_sdk_release_to_yojson x.mobile_sdk_release));
       
  ])

let get_mobile_sdk_release_request_to_yojson = 
  fun (x: get_mobile_sdk_release_request) -> assoc_to_yojson(
    [(
         "ReleaseVersion",
         (Some (version_key_string_to_yojson x.release_version)));
       (
         "Platform",
         (Some (platform_to_yojson x.platform)));
       
  ])

let get_managed_rule_set_response_to_yojson = 
  fun (x: get_managed_rule_set_response) -> assoc_to_yojson(
    [(
         "LockToken",
         (option_to_yojson lock_token_to_yojson x.lock_token));
       (
         "ManagedRuleSet",
         (option_to_yojson managed_rule_set_to_yojson x.managed_rule_set));
       
  ])

let get_managed_rule_set_request_to_yojson = 
  fun (x: get_managed_rule_set_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
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
         "LogScope",
         (option_to_yojson log_scope_to_yojson x.log_scope));
       (
         "LogType",
         (option_to_yojson log_type_to_yojson x.log_type));
       (
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let get_ip_set_response_to_yojson = 
  fun (x: get_ip_set_response) -> assoc_to_yojson(
    [(
         "LockToken",
         (option_to_yojson lock_token_to_yojson x.lock_token));
       (
         "IPSet",
         (option_to_yojson ip_set_to_yojson x.ip_set));
       
  ])

let get_ip_set_request_to_yojson = 
  fun (x: get_ip_set_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let get_decrypted_api_key_response_to_yojson = 
  fun (x: get_decrypted_api_key_response) -> assoc_to_yojson(
    [(
         "CreationTimestamp",
         (option_to_yojson timestamp__to_yojson x.creation_timestamp));
       (
         "TokenDomains",
         (option_to_yojson token_domains_to_yojson x.token_domains));
       
  ])

let get_decrypted_api_key_request_to_yojson = 
  fun (x: get_decrypted_api_key_request) -> assoc_to_yojson(
    [(
         "APIKey",
         (Some (api_key_to_yojson x.api_key)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let download_url_to_yojson = string_to_yojson

let generate_mobile_sdk_release_url_response_to_yojson = 
  fun (x: generate_mobile_sdk_release_url_response) -> assoc_to_yojson(
    [(
         "Url",
         (option_to_yojson download_url_to_yojson x.url));
       
  ])

let generate_mobile_sdk_release_url_request_to_yojson = 
  fun (x: generate_mobile_sdk_release_url_request) -> assoc_to_yojson(
    [(
         "ReleaseVersion",
         (Some (version_key_string_to_yojson x.release_version)));
       (
         "Platform",
         (Some (platform_to_yojson x.platform)));
       
  ])

let disassociate_web_acl_response_to_yojson = 
  fun (x: disassociate_web_acl_response) -> assoc_to_yojson(
    [
  ])

let disassociate_web_acl_request_to_yojson = 
  fun (x: disassociate_web_acl_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let describe_managed_rule_group_response_to_yojson = 
  fun (x: describe_managed_rule_group_response) -> assoc_to_yojson(
    [(
         "ConsumedLabels",
         (option_to_yojson label_summaries_to_yojson x.consumed_labels));
       (
         "AvailableLabels",
         (option_to_yojson label_summaries_to_yojson x.available_labels));
       (
         "LabelNamespace",
         (option_to_yojson label_name_to_yojson x.label_namespace));
       (
         "Rules",
         (option_to_yojson rule_summaries_to_yojson x.rules));
       (
         "Capacity",
         (option_to_yojson capacity_unit_to_yojson x.capacity));
       (
         "SnsTopicArn",
         (option_to_yojson resource_arn_to_yojson x.sns_topic_arn));
       (
         "VersionName",
         (option_to_yojson version_key_string_to_yojson x.version_name));
       
  ])

let describe_managed_rule_group_request_to_yojson = 
  fun (x: describe_managed_rule_group_request) -> assoc_to_yojson(
    [(
         "VersionName",
         (option_to_yojson version_key_string_to_yojson x.version_name));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       (
         "VendorName",
         (Some (vendor_name_to_yojson x.vendor_name)));
       
  ])

let describe_managed_products_by_vendor_response_to_yojson = 
  fun (x: describe_managed_products_by_vendor_response) -> assoc_to_yojson(
    [(
         "ManagedProducts",
         (option_to_yojson managed_product_descriptors_to_yojson x.managed_products));
       
  ])

let describe_managed_products_by_vendor_request_to_yojson = 
  fun (x: describe_managed_products_by_vendor_request) -> assoc_to_yojson(
    [(
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "VendorName",
         (Some (vendor_name_to_yojson x.vendor_name)));
       
  ])

let describe_all_managed_products_response_to_yojson = 
  fun (x: describe_all_managed_products_response) -> assoc_to_yojson(
    [(
         "ManagedProducts",
         (option_to_yojson managed_product_descriptors_to_yojson x.managed_products));
       
  ])

let describe_all_managed_products_request_to_yojson = 
  fun (x: describe_all_managed_products_request) -> assoc_to_yojson(
    [(
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let delete_web_acl_response_to_yojson = 
  fun (x: delete_web_acl_response) -> assoc_to_yojson(
    [
  ])

let delete_web_acl_request_to_yojson = 
  fun (x: delete_web_acl_request) -> assoc_to_yojson(
    [(
         "LockToken",
         (Some (lock_token_to_yojson x.lock_token)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let delete_rule_group_response_to_yojson = 
  fun (x: delete_rule_group_response) -> assoc_to_yojson(
    [
  ])

let delete_rule_group_request_to_yojson = 
  fun (x: delete_rule_group_request) -> assoc_to_yojson(
    [(
         "LockToken",
         (Some (lock_token_to_yojson x.lock_token)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let delete_regex_pattern_set_response_to_yojson = 
  fun (x: delete_regex_pattern_set_response) -> assoc_to_yojson(
    [
  ])

let delete_regex_pattern_set_request_to_yojson = 
  fun (x: delete_regex_pattern_set_request) -> assoc_to_yojson(
    [(
         "LockToken",
         (Some (lock_token_to_yojson x.lock_token)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
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
         "LogScope",
         (option_to_yojson log_scope_to_yojson x.log_scope));
       (
         "LogType",
         (option_to_yojson log_type_to_yojson x.log_type));
       (
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let delete_ip_set_response_to_yojson = 
  fun (x: delete_ip_set_response) -> assoc_to_yojson(
    [
  ])

let delete_ip_set_request_to_yojson = 
  fun (x: delete_ip_set_request) -> assoc_to_yojson(
    [(
         "LockToken",
         (Some (lock_token_to_yojson x.lock_token)));
       (
         "Id",
         (Some (entity_id_to_yojson x.id)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let delete_firewall_manager_rule_groups_response_to_yojson = 
  fun (x: delete_firewall_manager_rule_groups_response) -> assoc_to_yojson(
    [(
         "NextWebACLLockToken",
         (option_to_yojson lock_token_to_yojson x.next_web_acl_lock_token));
       
  ])

let delete_firewall_manager_rule_groups_request_to_yojson = 
  fun (x: delete_firewall_manager_rule_groups_request) -> assoc_to_yojson(
    [(
         "WebACLLockToken",
         (Some (lock_token_to_yojson x.web_acl_lock_token)));
       (
         "WebACLArn",
         (Some (resource_arn_to_yojson x.web_acl_arn)));
       
  ])

let delete_api_key_response_to_yojson = 
  fun (x: delete_api_key_response) -> assoc_to_yojson(
    [
  ])

let delete_api_key_request_to_yojson = 
  fun (x: delete_api_key_request) -> assoc_to_yojson(
    [(
         "APIKey",
         (Some (api_key_to_yojson x.api_key)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let create_web_acl_response_to_yojson = 
  fun (x: create_web_acl_response) -> assoc_to_yojson(
    [(
         "Summary",
         (option_to_yojson web_acl_summary_to_yojson x.summary));
       
  ])

let create_web_acl_request_to_yojson = 
  fun (x: create_web_acl_request) -> assoc_to_yojson(
    [(
         "AssociationConfig",
         (option_to_yojson association_config_to_yojson x.association_config));
       (
         "TokenDomains",
         (option_to_yojson token_domains_to_yojson x.token_domains));
       (
         "ChallengeConfig",
         (option_to_yojson challenge_config_to_yojson x.challenge_config));
       (
         "CaptchaConfig",
         (option_to_yojson captcha_config_to_yojson x.captcha_config));
       (
         "CustomResponseBodies",
         (option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "VisibilityConfig",
         (Some (visibility_config_to_yojson x.visibility_config)));
       (
         "Rules",
         (option_to_yojson rules_to_yojson x.rules));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "DefaultAction",
         (Some (default_action_to_yojson x.default_action)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let create_rule_group_response_to_yojson = 
  fun (x: create_rule_group_response) -> assoc_to_yojson(
    [(
         "Summary",
         (option_to_yojson rule_group_summary_to_yojson x.summary));
       
  ])

let create_rule_group_request_to_yojson = 
  fun (x: create_rule_group_request) -> assoc_to_yojson(
    [(
         "CustomResponseBodies",
         (option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "VisibilityConfig",
         (Some (visibility_config_to_yojson x.visibility_config)));
       (
         "Rules",
         (option_to_yojson rules_to_yojson x.rules));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Capacity",
         (Some (capacity_unit_to_yojson x.capacity)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let create_regex_pattern_set_response_to_yojson = 
  fun (x: create_regex_pattern_set_response) -> assoc_to_yojson(
    [(
         "Summary",
         (option_to_yojson regex_pattern_set_summary_to_yojson x.summary));
       
  ])

let create_regex_pattern_set_request_to_yojson = 
  fun (x: create_regex_pattern_set_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "RegularExpressionList",
         (Some (regular_expression_list_to_yojson x.regular_expression_list)));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let create_ip_set_response_to_yojson = 
  fun (x: create_ip_set_response) -> assoc_to_yojson(
    [(
         "Summary",
         (option_to_yojson ip_set_summary_to_yojson x.summary));
       
  ])

let create_ip_set_request_to_yojson = 
  fun (x: create_ip_set_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Addresses",
         (Some (ip_addresses_to_yojson x.addresses)));
       (
         "IPAddressVersion",
         (Some (ip_address_version_to_yojson x.ip_address_version)));
       (
         "Description",
         (option_to_yojson entity_description_to_yojson x.description));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       (
         "Name",
         (Some (entity_name_to_yojson x.name)));
       
  ])

let create_api_key_response_to_yojson = 
  fun (x: create_api_key_response) -> assoc_to_yojson(
    [(
         "APIKey",
         (option_to_yojson api_key_to_yojson x.api_key));
       
  ])

let api_key_token_domains_to_yojson = 
  fun tree -> list_to_yojson token_domain_to_yojson tree

let create_api_key_request_to_yojson = 
  fun (x: create_api_key_request) -> assoc_to_yojson(
    [(
         "TokenDomains",
         (Some (api_key_token_domains_to_yojson x.token_domains)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let check_capacity_response_to_yojson = 
  fun (x: check_capacity_response) -> assoc_to_yojson(
    [(
         "Capacity",
         (option_to_yojson consumed_capacity_to_yojson x.capacity));
       
  ])

let check_capacity_request_to_yojson = 
  fun (x: check_capacity_request) -> assoc_to_yojson(
    [(
         "Rules",
         (Some (rules_to_yojson x.rules)));
       (
         "Scope",
         (Some (scope_to_yojson x.scope)));
       
  ])

let associate_web_acl_response_to_yojson = 
  fun (x: associate_web_acl_response) -> assoc_to_yojson(
    [
  ])

let associate_web_acl_request_to_yojson = 
  fun (x: associate_web_acl_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       (
         "WebACLArn",
         (Some (resource_arn_to_yojson x.web_acl_arn)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

