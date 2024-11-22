open Smaws_Lib.Json.SerializeHelpers

open Types

let status_code_to_yojson = int_to_yojson

let base_unit_to_yojson = unit_to_yojson

let error_code_to_yojson = 
  fun (x: error_code) -> match x with 
 
| INVALID_PARAMETER_EXCEPTION -> `String "InvalidParameterException"
  | INTERNAL_SERVICE_EXCEPTION -> `String "InternalServiceException"
   

let error_message_to_yojson = string_to_yojson

let failure_info_to_yojson = 
  fun (x: failure_info) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "StatusCode",
         (option_to_yojson status_code_to_yojson x.status_code));
       
  ])

let resource_ar_n_to_yojson = string_to_yojson

let failed_resources_map_to_yojson = 
  fun tree -> map_to_yojson failure_info_to_yojson tree

let untag_resources_output_to_yojson = 
  fun (x: untag_resources_output) -> assoc_to_yojson(
    [(
         "FailedResourcesMap",
         (option_to_yojson failed_resources_map_to_yojson x.failed_resources_map));
       
  ])

let resource_arn_list_for_tag_untag_to_yojson = 
  fun tree -> list_to_yojson resource_ar_n_to_yojson tree

let tag_key_to_yojson = string_to_yojson

let tag_key_list_for_untag_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resources_input_to_yojson = 
  fun (x: untag_resources_input) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_for_untag_to_yojson x.tag_keys)));
       (
         "ResourceARNList",
         (Some (resource_arn_list_for_tag_untag_to_yojson x.resource_arn_list)));
       
  ])

let exception_message_to_yojson = string_to_yojson

let throttled_exception_to_yojson = 
  fun (x: throttled_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_parameter_exception_to_yojson = 
  fun (x: invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let internal_service_exception_to_yojson = 
  fun (x: internal_service_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let target_id_type_to_yojson = 
  fun (x: target_id_type) -> match x with 
 
| ROOT -> `String "ROOT"
  | OU -> `String "OU"
  | ACCOUNT -> `String "ACCOUNT"
   

let target_id_to_yojson = string_to_yojson

let target_id_filter_list_to_yojson = 
  fun tree -> list_to_yojson target_id_to_yojson tree

let tags_per_page_to_yojson = int_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_values_output_list_to_yojson = 
  fun tree -> list_to_yojson tag_value_to_yojson tree

let tag_value_list_to_yojson = 
  fun tree -> list_to_yojson tag_value_to_yojson tree

let tag_resources_output_to_yojson = 
  fun (x: tag_resources_output) -> assoc_to_yojson(
    [(
         "FailedResourcesMap",
         (option_to_yojson failed_resources_map_to_yojson x.failed_resources_map));
       
  ])

let tag_map_to_yojson = fun tree -> map_to_yojson tag_value_to_yojson tree

let tag_resources_input_to_yojson = 
  fun (x: tag_resources_input) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_map_to_yojson x.tags)));
       (
         "ResourceARNList",
         (Some (resource_arn_list_for_tag_untag_to_yojson x.resource_arn_list)));
       
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

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let tag_key_filter_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let tag_filter_to_yojson = 
  fun (x: tag_filter) -> assoc_to_yojson(
    [(
         "Values",
         (option_to_yojson tag_value_list_to_yojson x.values));
       (
         "Key",
         (option_to_yojson tag_key_to_yojson x.key));
       
  ])

let tag_filter_list_to_yojson = 
  fun tree -> list_to_yojson tag_filter_to_yojson tree

let last_updated_to_yojson = string_to_yojson

let region_to_yojson = string_to_yojson

let amazon_resource_type_to_yojson = string_to_yojson

let non_compliant_resources_to_yojson = long_to_yojson

let summary_to_yojson = 
  fun (x: summary) -> assoc_to_yojson(
    [(
         "NonCompliantResources",
         (option_to_yojson non_compliant_resources_to_yojson x.non_compliant_resources));
       (
         "ResourceType",
         (option_to_yojson amazon_resource_type_to_yojson x.resource_type));
       (
         "Region",
         (option_to_yojson region_to_yojson x.region));
       (
         "TargetIdType",
         (option_to_yojson target_id_type_to_yojson x.target_id_type));
       (
         "TargetId",
         (option_to_yojson target_id_to_yojson x.target_id));
       (
         "LastUpdated",
         (option_to_yojson last_updated_to_yojson x.last_updated));
       
  ])

let summary_list_to_yojson = 
  fun tree -> list_to_yojson summary_to_yojson tree

let status_to_yojson = string_to_yojson

let start_report_creation_output_to_yojson = 
  fun (x: start_report_creation_output) -> assoc_to_yojson(
    [
  ])

let s3_bucket_to_yojson = string_to_yojson

let start_report_creation_input_to_yojson = 
  fun (x: start_report_creation_input) -> assoc_to_yojson(
    [(
         "S3Bucket",
         (Some (s3_bucket_to_yojson x.s3_bucket)));
       
  ])

let constraint_violation_exception_to_yojson = 
  fun (x: constraint_violation_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let concurrent_modification_exception_to_yojson = 
  fun (x: concurrent_modification_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let start_date_to_yojson = string_to_yojson

let s3_location_to_yojson = string_to_yojson

let resources_per_page_to_yojson = int_to_yojson

let resource_type_filter_list_to_yojson = 
  fun tree -> list_to_yojson amazon_resource_type_to_yojson tree

let compliance_status_to_yojson = bool_to_yojson

let compliance_details_to_yojson = 
  fun (x: compliance_details) -> assoc_to_yojson(
    [(
         "ComplianceStatus",
         (option_to_yojson compliance_status_to_yojson x.compliance_status));
       (
         "KeysWithNoncompliantValues",
         (option_to_yojson tag_key_list_to_yojson x.keys_with_noncompliant_values));
       (
         "NoncompliantKeys",
         (option_to_yojson tag_key_list_to_yojson x.noncompliant_keys));
       
  ])

let resource_tag_mapping_to_yojson = 
  fun (x: resource_tag_mapping) -> assoc_to_yojson(
    [(
         "ComplianceDetails",
         (option_to_yojson compliance_details_to_yojson x.compliance_details));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ResourceARN",
         (option_to_yojson resource_ar_n_to_yojson x.resource_ar_n));
       
  ])

let resource_tag_mapping_list_to_yojson = 
  fun tree -> list_to_yojson resource_tag_mapping_to_yojson tree

let pagination_token_expired_exception_to_yojson = 
  fun (x: pagination_token_expired_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let pagination_token_to_yojson = string_to_yojson

let get_tag_values_output_to_yojson = 
  fun (x: get_tag_values_output) -> assoc_to_yojson(
    [(
         "TagValues",
         (option_to_yojson tag_values_output_list_to_yojson x.tag_values));
       (
         "PaginationToken",
         (option_to_yojson pagination_token_to_yojson x.pagination_token));
       
  ])

let get_tag_values_input_to_yojson = 
  fun (x: get_tag_values_input) -> assoc_to_yojson(
    [(
         "Key",
         (Some (tag_key_to_yojson x.key)));
       (
         "PaginationToken",
         (option_to_yojson pagination_token_to_yojson x.pagination_token));
       
  ])

let get_tag_keys_output_to_yojson = 
  fun (x: get_tag_keys_output) -> assoc_to_yojson(
    [(
         "TagKeys",
         (option_to_yojson tag_key_list_to_yojson x.tag_keys));
       (
         "PaginationToken",
         (option_to_yojson pagination_token_to_yojson x.pagination_token));
       
  ])

let get_tag_keys_input_to_yojson = 
  fun (x: get_tag_keys_input) -> assoc_to_yojson(
    [(
         "PaginationToken",
         (option_to_yojson pagination_token_to_yojson x.pagination_token));
       
  ])

let get_resources_output_to_yojson = 
  fun (x: get_resources_output) -> assoc_to_yojson(
    [(
         "ResourceTagMappingList",
         (option_to_yojson resource_tag_mapping_list_to_yojson x.resource_tag_mapping_list));
       (
         "PaginationToken",
         (option_to_yojson pagination_token_to_yojson x.pagination_token));
       
  ])

let include_compliance_details_to_yojson = bool_to_yojson

let exclude_compliant_resources_to_yojson = bool_to_yojson

let resource_arn_list_for_get_to_yojson = 
  fun tree -> list_to_yojson resource_ar_n_to_yojson tree

let get_resources_input_to_yojson = 
  fun (x: get_resources_input) -> assoc_to_yojson(
    [(
         "ResourceARNList",
         (option_to_yojson resource_arn_list_for_get_to_yojson x.resource_arn_list));
       (
         "ExcludeCompliantResources",
         (option_to_yojson exclude_compliant_resources_to_yojson x.exclude_compliant_resources));
       (
         "IncludeComplianceDetails",
         (option_to_yojson include_compliance_details_to_yojson x.include_compliance_details));
       (
         "ResourceTypeFilters",
         (option_to_yojson resource_type_filter_list_to_yojson x.resource_type_filters));
       (
         "TagsPerPage",
         (option_to_yojson tags_per_page_to_yojson x.tags_per_page));
       (
         "ResourcesPerPage",
         (option_to_yojson resources_per_page_to_yojson x.resources_per_page));
       (
         "TagFilters",
         (option_to_yojson tag_filter_list_to_yojson x.tag_filters));
       (
         "PaginationToken",
         (option_to_yojson pagination_token_to_yojson x.pagination_token));
       
  ])

let get_compliance_summary_output_to_yojson = 
  fun (x: get_compliance_summary_output) -> assoc_to_yojson(
    [(
         "PaginationToken",
         (option_to_yojson pagination_token_to_yojson x.pagination_token));
       (
         "SummaryList",
         (option_to_yojson summary_list_to_yojson x.summary_list));
       
  ])

let region_filter_list_to_yojson = 
  fun tree -> list_to_yojson region_to_yojson tree

let group_by_attribute_to_yojson = 
  fun (x: group_by_attribute) -> match x with 
 
| RESOURCE_TYPE -> `String "RESOURCE_TYPE"
  | REGION -> `String "REGION"
  | TARGET_ID -> `String "TARGET_ID"
   

let group_by_to_yojson = 
  fun tree -> list_to_yojson group_by_attribute_to_yojson tree

let max_results_get_compliance_summary_to_yojson = int_to_yojson

let get_compliance_summary_input_to_yojson = 
  fun (x: get_compliance_summary_input) -> assoc_to_yojson(
    [(
         "PaginationToken",
         (option_to_yojson pagination_token_to_yojson x.pagination_token));
       (
         "MaxResults",
         (option_to_yojson max_results_get_compliance_summary_to_yojson x.max_results));
       (
         "GroupBy",
         (option_to_yojson group_by_to_yojson x.group_by));
       (
         "TagKeyFilters",
         (option_to_yojson tag_key_filter_list_to_yojson x.tag_key_filters));
       (
         "ResourceTypeFilters",
         (option_to_yojson resource_type_filter_list_to_yojson x.resource_type_filters));
       (
         "RegionFilters",
         (option_to_yojson region_filter_list_to_yojson x.region_filters));
       (
         "TargetIdFilters",
         (option_to_yojson target_id_filter_list_to_yojson x.target_id_filters));
       
  ])

let describe_report_creation_output_to_yojson = 
  fun (x: describe_report_creation_output) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "StartDate",
         (option_to_yojson start_date_to_yojson x.start_date));
       (
         "S3Location",
         (option_to_yojson s3_location_to_yojson x.s3_location));
       (
         "Status",
         (option_to_yojson status_to_yojson x.status));
       
  ])

let describe_report_creation_input_to_yojson = 
  fun (x: describe_report_creation_input) -> assoc_to_yojson(
    [
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

