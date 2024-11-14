open Smaws_Lib
val service : Service.descriptor

type error_code = | INVALID_PARAMETER_EXCEPTION
  | INTERNAL_SERVICE_EXCEPTION

type failure_info = {
  error_message: string option;
  error_code: error_code option;
  status_code: int option
}

type untag_resources_output = {
  failed_resources_map: (string * failure_info) list option
}

type untag_resources_input = {
  tag_keys: string list;
  resource_arn_list: string list
}

type throttled_exception = {
  message: string option
}

type invalid_parameter_exception = {
  message: string option
}

type internal_service_exception = {
  message: string option
}

type target_id_type = | ROOT
  | OU
  | ACCOUNT

type tag_resources_output = {
  failed_resources_map: (string * failure_info) list option
}

type tag_resources_input = {
  tags: (string * string) list;
  resource_arn_list: string list
}

type tag = {
  value: string;
  key: string
}

type tag_filter = {
  values: string list option;
  key: string option
}

type summary = {
  non_compliant_resources: int option;
  resource_type: string option;
  region: string option;
  target_id_type: target_id_type option;
  target_id: string option;
  last_updated: string option
}

type start_report_creation_output = unit

type start_report_creation_input = {
  s3_bucket: string
}

type constraint_violation_exception = {
  message: string option
}

type concurrent_modification_exception = {
  message: string option
}

type compliance_details = {
  compliance_status: bool option;
  keys_with_noncompliant_values: string list option;
  noncompliant_keys: string list option
}

type resource_tag_mapping = {
  compliance_details: compliance_details option;
  tags: tag list option;
  resource_ar_n: string option
}

type pagination_token_expired_exception = {
  message: string option
}

type get_tag_values_output = {
  tag_values: string list option;
  pagination_token: string option
}

type get_tag_values_input = {
  key: string;
  pagination_token: string option
}

type get_tag_keys_output = {
  tag_keys: string list option;
  pagination_token: string option
}

type get_tag_keys_input = {
  pagination_token: string option
}

type get_resources_output = {
  resource_tag_mapping_list: resource_tag_mapping list option;
  pagination_token: string option
}

type get_resources_input = {
  resource_arn_list: string list option;
  exclude_compliant_resources: bool option;
  include_compliance_details: bool option;
  resource_type_filters: string list option;
  tags_per_page: int option;
  resources_per_page: int option;
  tag_filters: tag_filter list option;
  pagination_token: string option
}

type get_compliance_summary_output = {
  pagination_token: string option;
  summary_list: summary list option
}

type group_by_attribute = | RESOURCE_TYPE
  | REGION
  | TARGET_ID

type get_compliance_summary_input = {
  pagination_token: string option;
  max_results: int option;
  group_by: group_by_attribute list option;
  tag_key_filters: string list option;
  resource_type_filters: string list option;
  region_filters: string list option;
  target_id_filters: string list option
}

type describe_report_creation_output = {
  error_message: string option;
  start_date: string option;
  s3_location: string option;
  status: string option
}

type describe_report_creation_input = unit



type base_document = Json.t

