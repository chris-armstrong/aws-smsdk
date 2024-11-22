open Smaws_Lib.Json.DeserializeHelpers

open Types

let status_code_of_yojson = int_of_yojson

let base_unit_of_yojson = unit_of_yojson

let error_code_of_yojson = 
  fun (tree: t) path : error_code -> match tree with 
    | `String "InvalidParameterException" -> INVALID_PARAMETER_EXCEPTION
    | `String "InternalServiceException" -> INTERNAL_SERVICE_EXCEPTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ErrorCode")

let error_message_of_yojson = string_of_yojson

let failure_info_of_yojson = 
  fun tree path : failure_info ->
  let _list = assoc_of_yojson tree path in
  let _res : failure_info = {
    error_message = option_of_yojson (value_for_key (error_message_of_yojson) "ErrorMessage") _list path;
    error_code = option_of_yojson (value_for_key (error_code_of_yojson) "ErrorCode") _list path;
    status_code = option_of_yojson (value_for_key (status_code_of_yojson) "StatusCode") _list path;
    
  }
  in _res

let resource_ar_n_of_yojson = string_of_yojson

let failed_resources_map_of_yojson = 
  fun tree path -> map_of_yojson failure_info_of_yojson tree path

let untag_resources_output_of_yojson = 
  fun tree path : untag_resources_output ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resources_output = {
    failed_resources_map = option_of_yojson (value_for_key (failed_resources_map_of_yojson) "FailedResourcesMap") _list path;
    
  }
  in _res

let resource_arn_list_for_tag_untag_of_yojson = 
  fun tree path -> list_of_yojson resource_ar_n_of_yojson tree path 

let tag_key_of_yojson = string_of_yojson

let tag_key_list_for_untag_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resources_input_of_yojson = 
  fun tree path : untag_resources_input ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resources_input = {
    tag_keys = value_for_key (tag_key_list_for_untag_of_yojson) "TagKeys" _list path;
    resource_arn_list = value_for_key (resource_arn_list_for_tag_untag_of_yojson) "ResourceARNList" _list path;
    
  }
  in _res

let exception_message_of_yojson = string_of_yojson

let throttled_exception_of_yojson = 
  fun tree path : throttled_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : throttled_exception = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_parameter_exception_of_yojson = 
  fun tree path : invalid_parameter_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameter_exception = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let internal_service_exception_of_yojson = 
  fun tree path : internal_service_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : internal_service_exception = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let target_id_type_of_yojson = 
  fun (tree: t) path : target_id_type -> match tree with 
    | `String "ROOT" -> ROOT
    | `String "OU" -> OU
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetIdType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetIdType")

let target_id_of_yojson = string_of_yojson

let target_id_filter_list_of_yojson = 
  fun tree path -> list_of_yojson target_id_of_yojson tree path 

let tags_per_page_of_yojson = int_of_yojson

let tag_value_of_yojson = string_of_yojson

let tag_values_output_list_of_yojson = 
  fun tree path -> list_of_yojson tag_value_of_yojson tree path 

let tag_value_list_of_yojson = 
  fun tree path -> list_of_yojson tag_value_of_yojson tree path 

let tag_resources_output_of_yojson = 
  fun tree path : tag_resources_output ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resources_output = {
    failed_resources_map = option_of_yojson (value_for_key (failed_resources_map_of_yojson) "FailedResourcesMap") _list path;
    
  }
  in _res

let tag_map_of_yojson = 
  fun tree path -> map_of_yojson tag_value_of_yojson tree path

let tag_resources_input_of_yojson = 
  fun tree path : tag_resources_input ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resources_input = {
    tags = value_for_key (tag_map_of_yojson) "Tags" _list path;
    resource_arn_list = value_for_key (resource_arn_list_for_tag_untag_of_yojson) "ResourceARNList" _list path;
    
  }
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

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let tag_key_filter_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let tag_filter_of_yojson = 
  fun tree path : tag_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_filter = {
    values = option_of_yojson (value_for_key (tag_value_list_of_yojson) "Values") _list path;
    key = option_of_yojson (value_for_key (tag_key_of_yojson) "Key") _list path;
    
  }
  in _res

let tag_filter_list_of_yojson = 
  fun tree path -> list_of_yojson tag_filter_of_yojson tree path 

let last_updated_of_yojson = string_of_yojson

let region_of_yojson = string_of_yojson

let amazon_resource_type_of_yojson = string_of_yojson

let non_compliant_resources_of_yojson = long_of_yojson

let summary_of_yojson = 
  fun tree path : summary ->
  let _list = assoc_of_yojson tree path in
  let _res : summary = {
    non_compliant_resources = option_of_yojson (value_for_key (non_compliant_resources_of_yojson) "NonCompliantResources") _list path;
    resource_type = option_of_yojson (value_for_key (amazon_resource_type_of_yojson) "ResourceType") _list path;
    region = option_of_yojson (value_for_key (region_of_yojson) "Region") _list path;
    target_id_type = option_of_yojson (value_for_key (target_id_type_of_yojson) "TargetIdType") _list path;
    target_id = option_of_yojson (value_for_key (target_id_of_yojson) "TargetId") _list path;
    last_updated = option_of_yojson (value_for_key (last_updated_of_yojson) "LastUpdated") _list path;
    
  }
  in _res

let summary_list_of_yojson = 
  fun tree path -> list_of_yojson summary_of_yojson tree path 

let status_of_yojson = string_of_yojson

let start_report_creation_output_of_yojson = 
  fun tree path : start_report_creation_output ->
  let _list = assoc_of_yojson tree path in
  let _res : start_report_creation_output = ()
  in _res

let s3_bucket_of_yojson = string_of_yojson

let start_report_creation_input_of_yojson = 
  fun tree path : start_report_creation_input ->
  let _list = assoc_of_yojson tree path in
  let _res : start_report_creation_input = {
    s3_bucket = value_for_key (s3_bucket_of_yojson) "S3Bucket" _list path;
    
  }
  in _res

let constraint_violation_exception_of_yojson = 
  fun tree path : constraint_violation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : constraint_violation_exception = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let concurrent_modification_exception_of_yojson = 
  fun tree path : concurrent_modification_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : concurrent_modification_exception = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let start_date_of_yojson = string_of_yojson

let s3_location_of_yojson = string_of_yojson

let resources_per_page_of_yojson = int_of_yojson

let resource_type_filter_list_of_yojson = 
  fun tree path -> list_of_yojson amazon_resource_type_of_yojson tree path 

let compliance_status_of_yojson = bool_of_yojson

let compliance_details_of_yojson = 
  fun tree path : compliance_details ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_details = {
    compliance_status = option_of_yojson (value_for_key (compliance_status_of_yojson) "ComplianceStatus") _list path;
    keys_with_noncompliant_values = option_of_yojson (value_for_key (tag_key_list_of_yojson) "KeysWithNoncompliantValues") _list path;
    noncompliant_keys = option_of_yojson (value_for_key (tag_key_list_of_yojson) "NoncompliantKeys") _list path;
    
  }
  in _res

let resource_tag_mapping_of_yojson = 
  fun tree path : resource_tag_mapping ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_tag_mapping = {
    compliance_details = option_of_yojson (value_for_key (compliance_details_of_yojson) "ComplianceDetails") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    resource_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ResourceARN") _list path;
    
  }
  in _res

let resource_tag_mapping_list_of_yojson = 
  fun tree path -> list_of_yojson resource_tag_mapping_of_yojson tree path 

let pagination_token_expired_exception_of_yojson = 
  fun tree path : pagination_token_expired_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : pagination_token_expired_exception = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let pagination_token_of_yojson = string_of_yojson

let get_tag_values_output_of_yojson = 
  fun tree path : get_tag_values_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_tag_values_output = {
    tag_values = option_of_yojson (value_for_key (tag_values_output_list_of_yojson) "TagValues") _list path;
    pagination_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "PaginationToken") _list path;
    
  }
  in _res

let get_tag_values_input_of_yojson = 
  fun tree path : get_tag_values_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_tag_values_input = {
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    pagination_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "PaginationToken") _list path;
    
  }
  in _res

let get_tag_keys_output_of_yojson = 
  fun tree path : get_tag_keys_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_tag_keys_output = {
    tag_keys = option_of_yojson (value_for_key (tag_key_list_of_yojson) "TagKeys") _list path;
    pagination_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "PaginationToken") _list path;
    
  }
  in _res

let get_tag_keys_input_of_yojson = 
  fun tree path : get_tag_keys_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_tag_keys_input = {
    pagination_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "PaginationToken") _list path;
    
  }
  in _res

let get_resources_output_of_yojson = 
  fun tree path : get_resources_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resources_output = {
    resource_tag_mapping_list = option_of_yojson (value_for_key (resource_tag_mapping_list_of_yojson) "ResourceTagMappingList") _list path;
    pagination_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "PaginationToken") _list path;
    
  }
  in _res

let include_compliance_details_of_yojson = bool_of_yojson

let exclude_compliant_resources_of_yojson = bool_of_yojson

let resource_arn_list_for_get_of_yojson = 
  fun tree path -> list_of_yojson resource_ar_n_of_yojson tree path 

let get_resources_input_of_yojson = 
  fun tree path : get_resources_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resources_input = {
    resource_arn_list = option_of_yojson (value_for_key (resource_arn_list_for_get_of_yojson) "ResourceARNList") _list path;
    exclude_compliant_resources = option_of_yojson (value_for_key (exclude_compliant_resources_of_yojson) "ExcludeCompliantResources") _list path;
    include_compliance_details = option_of_yojson (value_for_key (include_compliance_details_of_yojson) "IncludeComplianceDetails") _list path;
    resource_type_filters = option_of_yojson (value_for_key (resource_type_filter_list_of_yojson) "ResourceTypeFilters") _list path;
    tags_per_page = option_of_yojson (value_for_key (tags_per_page_of_yojson) "TagsPerPage") _list path;
    resources_per_page = option_of_yojson (value_for_key (resources_per_page_of_yojson) "ResourcesPerPage") _list path;
    tag_filters = option_of_yojson (value_for_key (tag_filter_list_of_yojson) "TagFilters") _list path;
    pagination_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "PaginationToken") _list path;
    
  }
  in _res

let get_compliance_summary_output_of_yojson = 
  fun tree path : get_compliance_summary_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_compliance_summary_output = {
    pagination_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "PaginationToken") _list path;
    summary_list = option_of_yojson (value_for_key (summary_list_of_yojson) "SummaryList") _list path;
    
  }
  in _res

let region_filter_list_of_yojson = 
  fun tree path -> list_of_yojson region_of_yojson tree path 

let group_by_attribute_of_yojson = 
  fun (tree: t) path : group_by_attribute -> match tree with 
    | `String "RESOURCE_TYPE" -> RESOURCE_TYPE
    | `String "REGION" -> REGION
    | `String "TARGET_ID" -> TARGET_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "GroupByAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "GroupByAttribute")

let group_by_of_yojson = 
  fun tree path -> list_of_yojson group_by_attribute_of_yojson tree path 

let max_results_get_compliance_summary_of_yojson = int_of_yojson

let get_compliance_summary_input_of_yojson = 
  fun tree path : get_compliance_summary_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_compliance_summary_input = {
    pagination_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "PaginationToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_get_compliance_summary_of_yojson) "MaxResults") _list path;
    group_by = option_of_yojson (value_for_key (group_by_of_yojson) "GroupBy") _list path;
    tag_key_filters = option_of_yojson (value_for_key (tag_key_filter_list_of_yojson) "TagKeyFilters") _list path;
    resource_type_filters = option_of_yojson (value_for_key (resource_type_filter_list_of_yojson) "ResourceTypeFilters") _list path;
    region_filters = option_of_yojson (value_for_key (region_filter_list_of_yojson) "RegionFilters") _list path;
    target_id_filters = option_of_yojson (value_for_key (target_id_filter_list_of_yojson) "TargetIdFilters") _list path;
    
  }
  in _res

let describe_report_creation_output_of_yojson = 
  fun tree path : describe_report_creation_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_report_creation_output = {
    error_message = option_of_yojson (value_for_key (error_message_of_yojson) "ErrorMessage") _list path;
    start_date = option_of_yojson (value_for_key (start_date_of_yojson) "StartDate") _list path;
    s3_location = option_of_yojson (value_for_key (s3_location_of_yojson) "S3Location") _list path;
    status = option_of_yojson (value_for_key (status_of_yojson) "Status") _list path;
    
  }
  in _res

let describe_report_creation_input_of_yojson = 
  fun tree path : describe_report_creation_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_report_creation_input = ()
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

