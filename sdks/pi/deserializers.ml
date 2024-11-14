open Smaws_Lib.Json.DeserializeHelpers

open Types

let untag_resource_response_of_yojson = 
  fun tree path : untag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_response = ()
  in _res

let base_unit_of_yojson = unit_of_yojson

let service_type_of_yojson = 
  fun (tree: t) path : service_type -> match tree with 
    | `String "DOCDB" -> DOCDB
    | `String "RDS" -> RDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceType")

let amazon_resource_name_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "TagKeys" _list path;
    resource_ar_n = value_for_key (amazon_resource_name_of_yojson) "ResourceARN" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let error_string_of_yojson = string_of_yojson

let not_authorized_exception_of_yojson = 
  fun tree path : not_authorized_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : not_authorized_exception = {
    message = option_of_yojson (value_for_key (error_string_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_argument_exception_of_yojson = 
  fun tree path : invalid_argument_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_argument_exception = {
    message = option_of_yojson (value_for_key (error_string_of_yojson) "Message") _list path;
    
  }
  in _res

let internal_service_error_of_yojson = 
  fun tree path : internal_service_error ->
  let _list = assoc_of_yojson tree path in
  let _res : internal_service_error = {
    message = option_of_yojson (value_for_key (error_string_of_yojson) "Message") _list path;
    
  }
  in _res

let text_format_of_yojson = 
  fun (tree: t) path : text_format -> match tree with 
    | `String "MARKDOWN" -> MARKDOWN
    | `String "PLAIN_TEXT" -> PLAIN_TEXT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TextFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "TextFormat")

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
    resource_ar_n = value_for_key (amazon_resource_name_of_yojson) "ResourceARN" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let string__of_yojson = string_of_yojson

let severity_of_yojson = 
  fun (tree: t) path : severity -> match tree with 
    | `String "HIGH" -> HIGH
    | `String "MEDIUM" -> MEDIUM
    | `String "LOW" -> LOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "Severity" value)
    | _ -> raise (deserialize_wrong_type_error path "Severity")

let sanitized_string_of_yojson = string_of_yojson

let sanitized_string_list_of_yojson = 
  fun tree path -> list_of_yojson sanitized_string_of_yojson tree path 

let description_of_yojson = string_of_yojson

let response_resource_metric_of_yojson = 
  fun tree path : response_resource_metric ->
  let _list = assoc_of_yojson tree path in
  let _res : response_resource_metric = {
    unit_ = option_of_yojson (value_for_key (string__of_yojson) "Unit") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    metric = option_of_yojson (value_for_key (string__of_yojson) "Metric") _list path;
    
  }
  in _res

let response_resource_metric_list_of_yojson = 
  fun tree path -> list_of_yojson response_resource_metric_of_yojson tree path 

let request_string_of_yojson = string_of_yojson

let dimension_map_of_yojson = 
  fun tree path -> map_of_yojson request_string_of_yojson tree path

let response_resource_metric_key_of_yojson = 
  fun tree path : response_resource_metric_key ->
  let _list = assoc_of_yojson tree path in
  let _res : response_resource_metric_key = {
    dimensions = option_of_yojson (value_for_key (dimension_map_of_yojson) "Dimensions") _list path;
    metric = value_for_key (string__of_yojson) "Metric" _list path;
    
  }
  in _res

let response_partition_key_of_yojson = 
  fun tree path : response_partition_key ->
  let _list = assoc_of_yojson tree path in
  let _res : response_partition_key = {
    dimensions = value_for_key (dimension_map_of_yojson) "Dimensions" _list path;
    
  }
  in _res

let response_partition_key_list_of_yojson = 
  fun tree path -> list_of_yojson response_partition_key_of_yojson tree path 

let requested_dimension_list_of_yojson = 
  fun tree path -> list_of_yojson sanitized_string_of_yojson tree path 

let markdown_string_of_yojson = string_of_yojson

let recommendation_of_yojson = 
  fun tree path : recommendation ->
  let _list = assoc_of_yojson tree path in
  let _res : recommendation = {
    recommendation_description = option_of_yojson (value_for_key (markdown_string_of_yojson) "RecommendationDescription") _list path;
    recommendation_id = option_of_yojson (value_for_key (string__of_yojson) "RecommendationId") _list path;
    
  }
  in _res

let recommendation_list_of_yojson = 
  fun tree path -> list_of_yojson recommendation_of_yojson tree path 

let period_alignment_of_yojson = 
  fun (tree: t) path : period_alignment -> match tree with 
    | `String "START_TIME" -> START_TIME
    | `String "END_TIME" -> END_TIME
    | `String value -> raise (deserialize_unknown_enum_value_error path "PeriodAlignment" value)
    | _ -> raise (deserialize_wrong_type_error path "PeriodAlignment")

let list_tags_for_resource_response_of_yojson = 
  fun tree path : list_tags_for_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_response = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    
  }
  in _res

let list_tags_for_resource_request_of_yojson = 
  fun tree path : list_tags_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request = {
    resource_ar_n = value_for_key (amazon_resource_name_of_yojson) "ResourceARN" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let iso_timestamp_of_yojson = timestamp_of_yojson

let analysis_status_of_yojson = 
  fun (tree: t) path : analysis_status -> match tree with 
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RUNNING" -> RUNNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "AnalysisStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AnalysisStatus")

let analysis_report_summary_of_yojson = 
  fun tree path : analysis_report_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : analysis_report_summary = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    status = option_of_yojson (value_for_key (analysis_status_of_yojson) "Status") _list path;
    end_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "StartTime") _list path;
    create_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "CreateTime") _list path;
    analysis_report_id = option_of_yojson (value_for_key (string__of_yojson) "AnalysisReportId") _list path;
    
  }
  in _res

let analysis_report_summary_list_of_yojson = 
  fun tree path -> list_of_yojson analysis_report_summary_of_yojson tree path 

let next_token_of_yojson = string_of_yojson

let list_performance_analysis_reports_response_of_yojson = 
  fun tree path : list_performance_analysis_reports_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_performance_analysis_reports_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    analysis_reports = option_of_yojson (value_for_key (analysis_report_summary_list_of_yojson) "AnalysisReports") _list path;
    
  }
  in _res

let identifier_string_of_yojson = string_of_yojson

let max_results_of_yojson = int_of_yojson

let boolean__of_yojson = bool_of_yojson

let list_performance_analysis_reports_request_of_yojson = 
  fun tree path : list_performance_analysis_reports_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_performance_analysis_reports_request = {
    list_tags = option_of_yojson (value_for_key (boolean__of_yojson) "ListTags") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    identifier = value_for_key (identifier_string_of_yojson) "Identifier" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let list_available_resource_metrics_response_of_yojson = 
  fun tree path : list_available_resource_metrics_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_available_resource_metrics_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    metrics = option_of_yojson (value_for_key (response_resource_metric_list_of_yojson) "Metrics") _list path;
    
  }
  in _res

let metric_type_list_of_yojson = 
  fun tree path -> list_of_yojson sanitized_string_of_yojson tree path 

let list_available_resource_metrics_request_of_yojson = 
  fun tree path : list_available_resource_metrics_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_available_resource_metrics_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    metric_types = value_for_key (metric_type_list_of_yojson) "MetricTypes" _list path;
    identifier = value_for_key (identifier_string_of_yojson) "Identifier" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let dimension_detail_of_yojson = 
  fun tree path : dimension_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : dimension_detail = {
    identifier = option_of_yojson (value_for_key (string__of_yojson) "Identifier") _list path;
    
  }
  in _res

let dimension_detail_list_of_yojson = 
  fun tree path -> list_of_yojson dimension_detail_of_yojson tree path 

let dimension_group_detail_of_yojson = 
  fun tree path : dimension_group_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : dimension_group_detail = {
    dimensions = option_of_yojson (value_for_key (dimension_detail_list_of_yojson) "Dimensions") _list path;
    group = option_of_yojson (value_for_key (string__of_yojson) "Group") _list path;
    
  }
  in _res

let dimension_group_detail_list_of_yojson = 
  fun tree path -> list_of_yojson dimension_group_detail_of_yojson tree path 

let metric_dimension_groups_of_yojson = 
  fun tree path : metric_dimension_groups ->
  let _list = assoc_of_yojson tree path in
  let _res : metric_dimension_groups = {
    groups = option_of_yojson (value_for_key (dimension_group_detail_list_of_yojson) "Groups") _list path;
    metric = option_of_yojson (value_for_key (string__of_yojson) "Metric") _list path;
    
  }
  in _res

let metric_dimensions_list_of_yojson = 
  fun tree path -> list_of_yojson metric_dimension_groups_of_yojson tree path 

let list_available_resource_dimensions_response_of_yojson = 
  fun tree path : list_available_resource_dimensions_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_available_resource_dimensions_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    metric_dimensions = option_of_yojson (value_for_key (metric_dimensions_list_of_yojson) "MetricDimensions") _list path;
    
  }
  in _res

let dimensions_metric_list_of_yojson = 
  fun tree path -> list_of_yojson sanitized_string_of_yojson tree path 

let fine_grained_action_of_yojson = 
  fun (tree: t) path : fine_grained_action -> match tree with 
    | `String "GetResourceMetrics" -> GET_RESOURCE_METRICS
    | `String "GetDimensionKeyDetails" -> GET_DIMENSION_KEY_DETAILS
    | `String "DescribeDimensionKeys" -> DESCRIBE_DIMENSION_KEYS
    | `String value -> raise (deserialize_unknown_enum_value_error path "FineGrainedAction" value)
    | _ -> raise (deserialize_wrong_type_error path "FineGrainedAction")

let authorized_actions_list_of_yojson = 
  fun tree path -> list_of_yojson fine_grained_action_of_yojson tree path 

let list_available_resource_dimensions_request_of_yojson = 
  fun tree path : list_available_resource_dimensions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_available_resource_dimensions_request = {
    authorized_actions = option_of_yojson (value_for_key (authorized_actions_list_of_yojson) "AuthorizedActions") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    metrics = value_for_key (dimensions_metric_list_of_yojson) "Metrics" _list path;
    identifier = value_for_key (identifier_string_of_yojson) "Identifier" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let double_of_yojson = double_of_yojson

let data_point_of_yojson = 
  fun tree path : data_point ->
  let _list = assoc_of_yojson tree path in
  let _res : data_point = {
    value = value_for_key (double_of_yojson) "Value" _list path;
    timestamp_ = value_for_key (iso_timestamp_of_yojson) "Timestamp" _list path;
    
  }
  in _res

let data_points_list_of_yojson = 
  fun tree path -> list_of_yojson data_point_of_yojson tree path 

let metric_key_data_points_of_yojson = 
  fun tree path : metric_key_data_points ->
  let _list = assoc_of_yojson tree path in
  let _res : metric_key_data_points = {
    data_points = option_of_yojson (value_for_key (data_points_list_of_yojson) "DataPoints") _list path;
    key = option_of_yojson (value_for_key (response_resource_metric_key_of_yojson) "Key") _list path;
    
  }
  in _res

let metric_key_data_points_list_of_yojson = 
  fun tree path -> list_of_yojson metric_key_data_points_of_yojson tree path 

let get_resource_metrics_response_of_yojson = 
  fun tree path : get_resource_metrics_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_metrics_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    metric_list = option_of_yojson (value_for_key (metric_key_data_points_list_of_yojson) "MetricList") _list path;
    identifier = option_of_yojson (value_for_key (string__of_yojson) "Identifier") _list path;
    aligned_end_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "AlignedEndTime") _list path;
    aligned_start_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "AlignedStartTime") _list path;
    
  }
  in _res

let limit_of_yojson = int_of_yojson

let dimension_group_of_yojson = 
  fun tree path : dimension_group ->
  let _list = assoc_of_yojson tree path in
  let _res : dimension_group = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    dimensions = option_of_yojson (value_for_key (sanitized_string_list_of_yojson) "Dimensions") _list path;
    group = value_for_key (sanitized_string_of_yojson) "Group" _list path;
    
  }
  in _res

let metric_query_filter_map_of_yojson = 
  fun tree path -> map_of_yojson request_string_of_yojson tree path

let metric_query_of_yojson = 
  fun tree path : metric_query ->
  let _list = assoc_of_yojson tree path in
  let _res : metric_query = {
    filter = option_of_yojson (value_for_key (metric_query_filter_map_of_yojson) "Filter") _list path;
    group_by = option_of_yojson (value_for_key (dimension_group_of_yojson) "GroupBy") _list path;
    metric = value_for_key (sanitized_string_of_yojson) "Metric" _list path;
    
  }
  in _res

let metric_query_list_of_yojson = 
  fun tree path -> list_of_yojson metric_query_of_yojson tree path 

let integer__of_yojson = int_of_yojson

let get_resource_metrics_request_of_yojson = 
  fun tree path : get_resource_metrics_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_metrics_request = {
    period_alignment = option_of_yojson (value_for_key (period_alignment_of_yojson) "PeriodAlignment") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    period_in_seconds = option_of_yojson (value_for_key (integer__of_yojson) "PeriodInSeconds") _list path;
    end_time = value_for_key (iso_timestamp_of_yojson) "EndTime" _list path;
    start_time = value_for_key (iso_timestamp_of_yojson) "StartTime" _list path;
    metric_queries = value_for_key (metric_query_list_of_yojson) "MetricQueries" _list path;
    identifier = value_for_key (identifier_string_of_yojson) "Identifier" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let feature_status_of_yojson = 
  fun (tree: t) path : feature_status -> match tree with 
    | `String "UNKNOWN" -> UNKNOWN
    | `String "DISABLED_PENDING_REBOOT" -> DISABLED_PENDING_REBOOT
    | `String "ENABLED_PENDING_REBOOT" -> ENABLED_PENDING_REBOOT
    | `String "UNSUPPORTED" -> UNSUPPORTED
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FeatureStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FeatureStatus")

let feature_metadata_of_yojson = 
  fun tree path : feature_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : feature_metadata = {
    status = option_of_yojson (value_for_key (feature_status_of_yojson) "Status") _list path;
    
  }
  in _res

let feature_metadata_map_of_yojson = 
  fun tree path -> map_of_yojson feature_metadata_of_yojson tree path

let get_resource_metadata_response_of_yojson = 
  fun tree path : get_resource_metadata_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_metadata_response = {
    features = option_of_yojson (value_for_key (feature_metadata_map_of_yojson) "Features") _list path;
    identifier = option_of_yojson (value_for_key (string__of_yojson) "Identifier") _list path;
    
  }
  in _res

let get_resource_metadata_request_of_yojson = 
  fun tree path : get_resource_metadata_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_metadata_request = {
    identifier = value_for_key (identifier_string_of_yojson) "Identifier" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let analysis_report_id_of_yojson = string_of_yojson

let context_type_of_yojson = 
  fun (tree: t) path : context_type -> match tree with 
    | `String "CONTEXTUAL" -> CONTEXTUAL
    | `String "CAUSAL" -> CAUSAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContextType" value)
    | _ -> raise (deserialize_wrong_type_error path "ContextType")

let descriptive_string_of_yojson = string_of_yojson

let descriptive_map_of_yojson = 
  fun tree path -> map_of_yojson descriptive_string_of_yojson tree path

let performance_insights_metric_of_yojson = 
  fun tree path : performance_insights_metric ->
  let _list = assoc_of_yojson tree path in
  let _res : performance_insights_metric = {
    value = option_of_yojson (value_for_key (double_of_yojson) "Value") _list path;
    dimensions = option_of_yojson (value_for_key (descriptive_map_of_yojson) "Dimensions") _list path;
    display_name = option_of_yojson (value_for_key (descriptive_string_of_yojson) "DisplayName") _list path;
    metric = option_of_yojson (value_for_key (descriptive_string_of_yojson) "Metric") _list path;
    
  }
  in _res

let data_of_yojson = 
  fun tree path : data ->
  let _list = assoc_of_yojson tree path in
  let _res : data = {
    performance_insights_metric = option_of_yojson (value_for_key (performance_insights_metric_of_yojson) "PerformanceInsightsMetric") _list path;
    
  }
  in _res

let data_list_of_yojson = 
  fun tree path -> list_of_yojson data_of_yojson tree path 

let rec insight_of_yojson = 
  fun tree path : insight ->
  let _list = assoc_of_yojson tree path in
  let _res : insight = {
    baseline_data = option_of_yojson (value_for_key (data_list_of_yojson) "BaselineData") _list path;
    insight_data = option_of_yojson (value_for_key (data_list_of_yojson) "InsightData") _list path;
    recommendations = option_of_yojson (value_for_key (recommendation_list_of_yojson) "Recommendations") _list path;
    description = option_of_yojson (value_for_key (markdown_string_of_yojson) "Description") _list path;
    supporting_insights = option_of_yojson (value_for_key (insight_list_of_yojson) "SupportingInsights") _list path;
    severity = option_of_yojson (value_for_key (severity_of_yojson) "Severity") _list path;
    end_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "StartTime") _list path;
    context = option_of_yojson (value_for_key (context_type_of_yojson) "Context") _list path;
    insight_type = option_of_yojson (value_for_key (string__of_yojson) "InsightType") _list path;
    insight_id = value_for_key (string__of_yojson) "InsightId" _list path;
    
  }
  in _res

and insight_list_of_yojson = 
  fun tree path -> list_of_yojson insight_of_yojson tree path 

let analysis_report_of_yojson = 
  fun tree path : analysis_report ->
  let _list = assoc_of_yojson tree path in
  let _res : analysis_report = {
    insights = option_of_yojson (value_for_key (insight_list_of_yojson) "Insights") _list path;
    status = option_of_yojson (value_for_key (analysis_status_of_yojson) "Status") _list path;
    end_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "StartTime") _list path;
    create_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "CreateTime") _list path;
    service_type = option_of_yojson (value_for_key (service_type_of_yojson) "ServiceType") _list path;
    identifier = option_of_yojson (value_for_key (identifier_string_of_yojson) "Identifier") _list path;
    analysis_report_id = value_for_key (analysis_report_id_of_yojson) "AnalysisReportId" _list path;
    
  }
  in _res

let get_performance_analysis_report_response_of_yojson = 
  fun tree path : get_performance_analysis_report_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_performance_analysis_report_response = {
    analysis_report = option_of_yojson (value_for_key (analysis_report_of_yojson) "AnalysisReport") _list path;
    
  }
  in _res

let accept_language_of_yojson = 
  fun (tree: t) path : accept_language -> match tree with 
    | `String "EN_US" -> EN_US
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcceptLanguage" value)
    | _ -> raise (deserialize_wrong_type_error path "AcceptLanguage")

let get_performance_analysis_report_request_of_yojson = 
  fun tree path : get_performance_analysis_report_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_performance_analysis_report_request = {
    accept_language = option_of_yojson (value_for_key (accept_language_of_yojson) "AcceptLanguage") _list path;
    text_format = option_of_yojson (value_for_key (text_format_of_yojson) "TextFormat") _list path;
    analysis_report_id = value_for_key (analysis_report_id_of_yojson) "AnalysisReportId" _list path;
    identifier = value_for_key (identifier_string_of_yojson) "Identifier" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let detail_status_of_yojson = 
  fun (tree: t) path : detail_status -> match tree with 
    | `String "UNAVAILABLE" -> UNAVAILABLE
    | `String "PROCESSING" -> PROCESSING
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DetailStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DetailStatus")

let dimension_key_detail_of_yojson = 
  fun tree path : dimension_key_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : dimension_key_detail = {
    status = option_of_yojson (value_for_key (detail_status_of_yojson) "Status") _list path;
    dimension = option_of_yojson (value_for_key (string__of_yojson) "Dimension") _list path;
    value = option_of_yojson (value_for_key (string__of_yojson) "Value") _list path;
    
  }
  in _res

let dimension_key_detail_list_of_yojson = 
  fun tree path -> list_of_yojson dimension_key_detail_of_yojson tree path 

let get_dimension_key_details_response_of_yojson = 
  fun tree path : get_dimension_key_details_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_dimension_key_details_response = {
    dimensions = option_of_yojson (value_for_key (dimension_key_detail_list_of_yojson) "Dimensions") _list path;
    
  }
  in _res

let get_dimension_key_details_request_of_yojson = 
  fun tree path : get_dimension_key_details_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_dimension_key_details_request = {
    requested_dimensions = option_of_yojson (value_for_key (requested_dimension_list_of_yojson) "RequestedDimensions") _list path;
    group_identifier = value_for_key (request_string_of_yojson) "GroupIdentifier" _list path;
    group = value_for_key (request_string_of_yojson) "Group" _list path;
    identifier = value_for_key (identifier_string_of_yojson) "Identifier" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let additional_metrics_map_of_yojson = 
  fun tree path -> map_of_yojson double_of_yojson tree path

let metric_values_list_of_yojson = 
  fun tree path -> list_of_yojson double_of_yojson tree path 

let dimension_key_description_of_yojson = 
  fun tree path : dimension_key_description ->
  let _list = assoc_of_yojson tree path in
  let _res : dimension_key_description = {
    partitions = option_of_yojson (value_for_key (metric_values_list_of_yojson) "Partitions") _list path;
    additional_metrics = option_of_yojson (value_for_key (additional_metrics_map_of_yojson) "AdditionalMetrics") _list path;
    total = option_of_yojson (value_for_key (double_of_yojson) "Total") _list path;
    dimensions = option_of_yojson (value_for_key (dimension_map_of_yojson) "Dimensions") _list path;
    
  }
  in _res

let dimension_key_description_list_of_yojson = 
  fun tree path -> list_of_yojson dimension_key_description_of_yojson tree path 

let describe_dimension_keys_response_of_yojson = 
  fun tree path : describe_dimension_keys_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_dimension_keys_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    keys = option_of_yojson (value_for_key (dimension_key_description_list_of_yojson) "Keys") _list path;
    partition_keys = option_of_yojson (value_for_key (response_partition_key_list_of_yojson) "PartitionKeys") _list path;
    aligned_end_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "AlignedEndTime") _list path;
    aligned_start_time = option_of_yojson (value_for_key (iso_timestamp_of_yojson) "AlignedStartTime") _list path;
    
  }
  in _res

let additional_metrics_list_of_yojson = 
  fun tree path -> list_of_yojson sanitized_string_of_yojson tree path 

let describe_dimension_keys_request_of_yojson = 
  fun tree path : describe_dimension_keys_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_dimension_keys_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    filter = option_of_yojson (value_for_key (metric_query_filter_map_of_yojson) "Filter") _list path;
    partition_by = option_of_yojson (value_for_key (dimension_group_of_yojson) "PartitionBy") _list path;
    additional_metrics = option_of_yojson (value_for_key (additional_metrics_list_of_yojson) "AdditionalMetrics") _list path;
    group_by = value_for_key (dimension_group_of_yojson) "GroupBy" _list path;
    period_in_seconds = option_of_yojson (value_for_key (integer__of_yojson) "PeriodInSeconds") _list path;
    metric = value_for_key (request_string_of_yojson) "Metric" _list path;
    end_time = value_for_key (iso_timestamp_of_yojson) "EndTime" _list path;
    start_time = value_for_key (iso_timestamp_of_yojson) "StartTime" _list path;
    identifier = value_for_key (identifier_string_of_yojson) "Identifier" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let delete_performance_analysis_report_response_of_yojson = 
  fun tree path : delete_performance_analysis_report_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_performance_analysis_report_response = ()
  in _res

let delete_performance_analysis_report_request_of_yojson = 
  fun tree path : delete_performance_analysis_report_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_performance_analysis_report_request = {
    analysis_report_id = value_for_key (analysis_report_id_of_yojson) "AnalysisReportId" _list path;
    identifier = value_for_key (identifier_string_of_yojson) "Identifier" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let create_performance_analysis_report_response_of_yojson = 
  fun tree path : create_performance_analysis_report_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_performance_analysis_report_response = {
    analysis_report_id = option_of_yojson (value_for_key (analysis_report_id_of_yojson) "AnalysisReportId") _list path;
    
  }
  in _res

let create_performance_analysis_report_request_of_yojson = 
  fun tree path : create_performance_analysis_report_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_performance_analysis_report_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    end_time = value_for_key (iso_timestamp_of_yojson) "EndTime" _list path;
    start_time = value_for_key (iso_timestamp_of_yojson) "StartTime" _list path;
    identifier = value_for_key (identifier_string_of_yojson) "Identifier" _list path;
    service_type = value_for_key (service_type_of_yojson) "ServiceType" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

