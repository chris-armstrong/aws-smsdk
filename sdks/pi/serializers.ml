open Smaws_Lib.Json.SerializeHelpers

open Types

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let base_unit_to_yojson = unit_to_yojson

let service_type_to_yojson = 
  fun (x: service_type) -> match x with 
  | DOCDB -> `String "DOCDB"
    | RDS -> `String "RDS"
     

let amazon_resource_name_to_yojson = string_to_yojson

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
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let error_string_to_yojson = string_to_yojson

let not_authorized_exception_to_yojson = 
  fun (x: not_authorized_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_string_to_yojson x.message));
       
  ])

let invalid_argument_exception_to_yojson = 
  fun (x: invalid_argument_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_string_to_yojson x.message));
       
  ])

let internal_service_error_to_yojson = 
  fun (x: internal_service_error) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_string_to_yojson x.message));
       
  ])

let text_format_to_yojson = 
  fun (x: text_format) -> match x with 
  | MARKDOWN -> `String "MARKDOWN"
    | PLAIN_TEXT -> `String "PLAIN_TEXT"
     

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
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let string__to_yojson = string_to_yojson

let severity_to_yojson = 
  fun (x: severity) -> match x with 
 
| HIGH -> `String "HIGH"
  | MEDIUM -> `String "MEDIUM"
  | LOW -> `String "LOW"
   

let sanitized_string_to_yojson = string_to_yojson

let sanitized_string_list_to_yojson = 
  fun tree -> list_to_yojson sanitized_string_to_yojson tree

let description_to_yojson = string_to_yojson

let response_resource_metric_to_yojson = 
  fun (x: response_resource_metric) -> assoc_to_yojson(
    [(
         "Unit",
         (option_to_yojson string__to_yojson x.unit_));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Metric",
         (option_to_yojson string__to_yojson x.metric));
       
  ])

let response_resource_metric_list_to_yojson = 
  fun tree -> list_to_yojson response_resource_metric_to_yojson tree

let request_string_to_yojson = string_to_yojson

let dimension_map_to_yojson = 
  fun tree -> map_to_yojson request_string_to_yojson tree

let response_resource_metric_key_to_yojson = 
  fun (x: response_resource_metric_key) -> assoc_to_yojson(
    [(
         "Dimensions",
         (option_to_yojson dimension_map_to_yojson x.dimensions));
       (
         "Metric",
         (Some (string__to_yojson x.metric)));
       
  ])

let response_partition_key_to_yojson = 
  fun (x: response_partition_key) -> assoc_to_yojson(
    [(
         "Dimensions",
         (Some (dimension_map_to_yojson x.dimensions)));
       
  ])

let response_partition_key_list_to_yojson = 
  fun tree -> list_to_yojson response_partition_key_to_yojson tree

let requested_dimension_list_to_yojson = 
  fun tree -> list_to_yojson sanitized_string_to_yojson tree

let markdown_string_to_yojson = string_to_yojson

let recommendation_to_yojson = 
  fun (x: recommendation) -> assoc_to_yojson(
    [(
         "RecommendationDescription",
         (option_to_yojson markdown_string_to_yojson x.recommendation_description));
       (
         "RecommendationId",
         (option_to_yojson string__to_yojson x.recommendation_id));
       
  ])

let recommendation_list_to_yojson = 
  fun tree -> list_to_yojson recommendation_to_yojson tree

let period_alignment_to_yojson = 
  fun (x: period_alignment) -> match x with 
  | START_TIME -> `String "START_TIME"
    | END_TIME -> `String "END_TIME"
     

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let iso_timestamp_to_yojson = timestamp_to_yojson

let analysis_status_to_yojson = 
  fun (x: analysis_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | RUNNING -> `String "RUNNING"
   

let analysis_report_summary_to_yojson = 
  fun (x: analysis_report_summary) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Status",
         (option_to_yojson analysis_status_to_yojson x.status));
       (
         "EndTime",
         (option_to_yojson iso_timestamp_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson iso_timestamp_to_yojson x.start_time));
       (
         "CreateTime",
         (option_to_yojson iso_timestamp_to_yojson x.create_time));
       (
         "AnalysisReportId",
         (option_to_yojson string__to_yojson x.analysis_report_id));
       
  ])

let analysis_report_summary_list_to_yojson = 
  fun tree -> list_to_yojson analysis_report_summary_to_yojson tree

let next_token_to_yojson = string_to_yojson

let list_performance_analysis_reports_response_to_yojson = 
  fun (x: list_performance_analysis_reports_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AnalysisReports",
         (option_to_yojson analysis_report_summary_list_to_yojson x.analysis_reports));
       
  ])

let identifier_string_to_yojson = string_to_yojson

let max_results_to_yojson = int_to_yojson

let boolean__to_yojson = bool_to_yojson

let list_performance_analysis_reports_request_to_yojson = 
  fun (x: list_performance_analysis_reports_request) -> assoc_to_yojson(
    [(
         "ListTags",
         (option_to_yojson boolean__to_yojson x.list_tags));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Identifier",
         (Some (identifier_string_to_yojson x.identifier)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let list_available_resource_metrics_response_to_yojson = 
  fun (x: list_available_resource_metrics_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Metrics",
         (option_to_yojson response_resource_metric_list_to_yojson x.metrics));
       
  ])

let metric_type_list_to_yojson = 
  fun tree -> list_to_yojson sanitized_string_to_yojson tree

let list_available_resource_metrics_request_to_yojson = 
  fun (x: list_available_resource_metrics_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MetricTypes",
         (Some (metric_type_list_to_yojson x.metric_types)));
       (
         "Identifier",
         (Some (identifier_string_to_yojson x.identifier)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let dimension_detail_to_yojson = 
  fun (x: dimension_detail) -> assoc_to_yojson(
    [(
         "Identifier",
         (option_to_yojson string__to_yojson x.identifier));
       
  ])

let dimension_detail_list_to_yojson = 
  fun tree -> list_to_yojson dimension_detail_to_yojson tree

let dimension_group_detail_to_yojson = 
  fun (x: dimension_group_detail) -> assoc_to_yojson(
    [(
         "Dimensions",
         (option_to_yojson dimension_detail_list_to_yojson x.dimensions));
       (
         "Group",
         (option_to_yojson string__to_yojson x.group));
       
  ])

let dimension_group_detail_list_to_yojson = 
  fun tree -> list_to_yojson dimension_group_detail_to_yojson tree

let metric_dimension_groups_to_yojson = 
  fun (x: metric_dimension_groups) -> assoc_to_yojson(
    [(
         "Groups",
         (option_to_yojson dimension_group_detail_list_to_yojson x.groups));
       (
         "Metric",
         (option_to_yojson string__to_yojson x.metric));
       
  ])

let metric_dimensions_list_to_yojson = 
  fun tree -> list_to_yojson metric_dimension_groups_to_yojson tree

let list_available_resource_dimensions_response_to_yojson = 
  fun (x: list_available_resource_dimensions_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MetricDimensions",
         (option_to_yojson metric_dimensions_list_to_yojson x.metric_dimensions));
       
  ])

let dimensions_metric_list_to_yojson = 
  fun tree -> list_to_yojson sanitized_string_to_yojson tree

let fine_grained_action_to_yojson = 
  fun (x: fine_grained_action) -> match x with 
 
| GET_RESOURCE_METRICS -> `String "GetResourceMetrics"
  | GET_DIMENSION_KEY_DETAILS -> `String "GetDimensionKeyDetails"
  | DESCRIBE_DIMENSION_KEYS -> `String "DescribeDimensionKeys"
   

let authorized_actions_list_to_yojson = 
  fun tree -> list_to_yojson fine_grained_action_to_yojson tree

let list_available_resource_dimensions_request_to_yojson = 
  fun (x: list_available_resource_dimensions_request) -> assoc_to_yojson(
    [(
         "AuthorizedActions",
         (option_to_yojson authorized_actions_list_to_yojson x.authorized_actions));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "Metrics",
         (Some (dimensions_metric_list_to_yojson x.metrics)));
       (
         "Identifier",
         (Some (identifier_string_to_yojson x.identifier)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let double_to_yojson = double_to_yojson

let data_point_to_yojson = 
  fun (x: data_point) -> assoc_to_yojson(
    [(
         "Value",
         (Some (double_to_yojson x.value)));
       (
         "Timestamp",
         (Some (iso_timestamp_to_yojson x.timestamp_)));
       
  ])

let data_points_list_to_yojson = 
  fun tree -> list_to_yojson data_point_to_yojson tree

let metric_key_data_points_to_yojson = 
  fun (x: metric_key_data_points) -> assoc_to_yojson(
    [(
         "DataPoints",
         (option_to_yojson data_points_list_to_yojson x.data_points));
       (
         "Key",
         (option_to_yojson response_resource_metric_key_to_yojson x.key));
       
  ])

let metric_key_data_points_list_to_yojson = 
  fun tree -> list_to_yojson metric_key_data_points_to_yojson tree

let get_resource_metrics_response_to_yojson = 
  fun (x: get_resource_metrics_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MetricList",
         (option_to_yojson metric_key_data_points_list_to_yojson x.metric_list));
       (
         "Identifier",
         (option_to_yojson string__to_yojson x.identifier));
       (
         "AlignedEndTime",
         (option_to_yojson iso_timestamp_to_yojson x.aligned_end_time));
       (
         "AlignedStartTime",
         (option_to_yojson iso_timestamp_to_yojson x.aligned_start_time));
       
  ])

let limit_to_yojson = int_to_yojson

let dimension_group_to_yojson = 
  fun (x: dimension_group) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "Dimensions",
         (option_to_yojson sanitized_string_list_to_yojson x.dimensions));
       (
         "Group",
         (Some (sanitized_string_to_yojson x.group)));
       
  ])

let metric_query_filter_map_to_yojson = 
  fun tree -> map_to_yojson request_string_to_yojson tree

let metric_query_to_yojson = 
  fun (x: metric_query) -> assoc_to_yojson(
    [(
         "Filter",
         (option_to_yojson metric_query_filter_map_to_yojson x.filter));
       (
         "GroupBy",
         (option_to_yojson dimension_group_to_yojson x.group_by));
       (
         "Metric",
         (Some (sanitized_string_to_yojson x.metric)));
       
  ])

let metric_query_list_to_yojson = 
  fun tree -> list_to_yojson metric_query_to_yojson tree

let integer__to_yojson = int_to_yojson

let get_resource_metrics_request_to_yojson = 
  fun (x: get_resource_metrics_request) -> assoc_to_yojson(
    [(
         "PeriodAlignment",
         (option_to_yojson period_alignment_to_yojson x.period_alignment));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "PeriodInSeconds",
         (option_to_yojson integer__to_yojson x.period_in_seconds));
       (
         "EndTime",
         (Some (iso_timestamp_to_yojson x.end_time)));
       (
         "StartTime",
         (Some (iso_timestamp_to_yojson x.start_time)));
       (
         "MetricQueries",
         (Some (metric_query_list_to_yojson x.metric_queries)));
       (
         "Identifier",
         (Some (identifier_string_to_yojson x.identifier)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let feature_status_to_yojson = 
  fun (x: feature_status) -> match x with 
 
| UNKNOWN -> `String "UNKNOWN"
  | DISABLED_PENDING_REBOOT -> `String "DISABLED_PENDING_REBOOT"
  | ENABLED_PENDING_REBOOT -> `String "ENABLED_PENDING_REBOOT"
  | UNSUPPORTED -> `String "UNSUPPORTED"
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
   

let feature_metadata_to_yojson = 
  fun (x: feature_metadata) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson feature_status_to_yojson x.status));
       
  ])

let feature_metadata_map_to_yojson = 
  fun tree -> map_to_yojson feature_metadata_to_yojson tree

let get_resource_metadata_response_to_yojson = 
  fun (x: get_resource_metadata_response) -> assoc_to_yojson(
    [(
         "Features",
         (option_to_yojson feature_metadata_map_to_yojson x.features));
       (
         "Identifier",
         (option_to_yojson string__to_yojson x.identifier));
       
  ])

let get_resource_metadata_request_to_yojson = 
  fun (x: get_resource_metadata_request) -> assoc_to_yojson(
    [(
         "Identifier",
         (Some (identifier_string_to_yojson x.identifier)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let analysis_report_id_to_yojson = string_to_yojson

let context_type_to_yojson = 
  fun (x: context_type) -> match x with 
  | CONTEXTUAL -> `String "CONTEXTUAL"
    | CAUSAL -> `String "CAUSAL"
     

let descriptive_string_to_yojson = string_to_yojson

let descriptive_map_to_yojson = 
  fun tree -> map_to_yojson descriptive_string_to_yojson tree

let performance_insights_metric_to_yojson = 
  fun (x: performance_insights_metric) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson double_to_yojson x.value));
       (
         "Dimensions",
         (option_to_yojson descriptive_map_to_yojson x.dimensions));
       (
         "DisplayName",
         (option_to_yojson descriptive_string_to_yojson x.display_name));
       (
         "Metric",
         (option_to_yojson descriptive_string_to_yojson x.metric));
       
  ])

let data_to_yojson = 
  fun (x: data) -> assoc_to_yojson(
    [(
         "PerformanceInsightsMetric",
         (option_to_yojson performance_insights_metric_to_yojson x.performance_insights_metric));
       
  ])

let data_list_to_yojson = 
  fun tree -> list_to_yojson data_to_yojson tree

let rec insight_to_yojson = 
  fun (x: insight) -> assoc_to_yojson(
    [(
         "BaselineData",
         (option_to_yojson data_list_to_yojson x.baseline_data));
       (
         "InsightData",
         (option_to_yojson data_list_to_yojson x.insight_data));
       (
         "Recommendations",
         (option_to_yojson recommendation_list_to_yojson x.recommendations));
       (
         "Description",
         (option_to_yojson markdown_string_to_yojson x.description));
       (
         "SupportingInsights",
         (option_to_yojson insight_list_to_yojson x.supporting_insights));
       (
         "Severity",
         (option_to_yojson severity_to_yojson x.severity));
       (
         "EndTime",
         (option_to_yojson iso_timestamp_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson iso_timestamp_to_yojson x.start_time));
       (
         "Context",
         (option_to_yojson context_type_to_yojson x.context));
       (
         "InsightType",
         (option_to_yojson string__to_yojson x.insight_type));
       (
         "InsightId",
         (Some (string__to_yojson x.insight_id)));
       
  ])

and insight_list_to_yojson = 
  fun tree -> list_to_yojson insight_to_yojson tree

let analysis_report_to_yojson = 
  fun (x: analysis_report) -> assoc_to_yojson(
    [(
         "Insights",
         (option_to_yojson insight_list_to_yojson x.insights));
       (
         "Status",
         (option_to_yojson analysis_status_to_yojson x.status));
       (
         "EndTime",
         (option_to_yojson iso_timestamp_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson iso_timestamp_to_yojson x.start_time));
       (
         "CreateTime",
         (option_to_yojson iso_timestamp_to_yojson x.create_time));
       (
         "ServiceType",
         (option_to_yojson service_type_to_yojson x.service_type));
       (
         "Identifier",
         (option_to_yojson identifier_string_to_yojson x.identifier));
       (
         "AnalysisReportId",
         (Some (analysis_report_id_to_yojson x.analysis_report_id)));
       
  ])

let get_performance_analysis_report_response_to_yojson = 
  fun (x: get_performance_analysis_report_response) -> assoc_to_yojson(
    [(
         "AnalysisReport",
         (option_to_yojson analysis_report_to_yojson x.analysis_report));
       
  ])

let accept_language_to_yojson = 
  fun (x: accept_language) -> match x with 
  | EN_US -> `String "EN_US"
     

let get_performance_analysis_report_request_to_yojson = 
  fun (x: get_performance_analysis_report_request) -> assoc_to_yojson(
    [(
         "AcceptLanguage",
         (option_to_yojson accept_language_to_yojson x.accept_language));
       (
         "TextFormat",
         (option_to_yojson text_format_to_yojson x.text_format));
       (
         "AnalysisReportId",
         (Some (analysis_report_id_to_yojson x.analysis_report_id)));
       (
         "Identifier",
         (Some (identifier_string_to_yojson x.identifier)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let detail_status_to_yojson = 
  fun (x: detail_status) -> match x with 
 
| UNAVAILABLE -> `String "UNAVAILABLE"
  | PROCESSING -> `String "PROCESSING"
  | AVAILABLE -> `String "AVAILABLE"
   

let dimension_key_detail_to_yojson = 
  fun (x: dimension_key_detail) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson detail_status_to_yojson x.status));
       (
         "Dimension",
         (option_to_yojson string__to_yojson x.dimension));
       (
         "Value",
         (option_to_yojson string__to_yojson x.value));
       
  ])

let dimension_key_detail_list_to_yojson = 
  fun tree -> list_to_yojson dimension_key_detail_to_yojson tree

let get_dimension_key_details_response_to_yojson = 
  fun (x: get_dimension_key_details_response) -> assoc_to_yojson(
    [(
         "Dimensions",
         (option_to_yojson dimension_key_detail_list_to_yojson x.dimensions));
       
  ])

let get_dimension_key_details_request_to_yojson = 
  fun (x: get_dimension_key_details_request) -> assoc_to_yojson(
    [(
         "RequestedDimensions",
         (option_to_yojson requested_dimension_list_to_yojson x.requested_dimensions));
       (
         "GroupIdentifier",
         (Some (request_string_to_yojson x.group_identifier)));
       (
         "Group",
         (Some (request_string_to_yojson x.group)));
       (
         "Identifier",
         (Some (identifier_string_to_yojson x.identifier)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let additional_metrics_map_to_yojson = 
  fun tree -> map_to_yojson double_to_yojson tree

let metric_values_list_to_yojson = 
  fun tree -> list_to_yojson double_to_yojson tree

let dimension_key_description_to_yojson = 
  fun (x: dimension_key_description) -> assoc_to_yojson(
    [(
         "Partitions",
         (option_to_yojson metric_values_list_to_yojson x.partitions));
       (
         "AdditionalMetrics",
         (option_to_yojson additional_metrics_map_to_yojson x.additional_metrics));
       (
         "Total",
         (option_to_yojson double_to_yojson x.total));
       (
         "Dimensions",
         (option_to_yojson dimension_map_to_yojson x.dimensions));
       
  ])

let dimension_key_description_list_to_yojson = 
  fun tree -> list_to_yojson dimension_key_description_to_yojson tree

let describe_dimension_keys_response_to_yojson = 
  fun (x: describe_dimension_keys_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Keys",
         (option_to_yojson dimension_key_description_list_to_yojson x.keys));
       (
         "PartitionKeys",
         (option_to_yojson response_partition_key_list_to_yojson x.partition_keys));
       (
         "AlignedEndTime",
         (option_to_yojson iso_timestamp_to_yojson x.aligned_end_time));
       (
         "AlignedStartTime",
         (option_to_yojson iso_timestamp_to_yojson x.aligned_start_time));
       
  ])

let additional_metrics_list_to_yojson = 
  fun tree -> list_to_yojson sanitized_string_to_yojson tree

let describe_dimension_keys_request_to_yojson = 
  fun (x: describe_dimension_keys_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "Filter",
         (option_to_yojson metric_query_filter_map_to_yojson x.filter));
       (
         "PartitionBy",
         (option_to_yojson dimension_group_to_yojson x.partition_by));
       (
         "AdditionalMetrics",
         (option_to_yojson additional_metrics_list_to_yojson x.additional_metrics));
       (
         "GroupBy",
         (Some (dimension_group_to_yojson x.group_by)));
       (
         "PeriodInSeconds",
         (option_to_yojson integer__to_yojson x.period_in_seconds));
       (
         "Metric",
         (Some (request_string_to_yojson x.metric)));
       (
         "EndTime",
         (Some (iso_timestamp_to_yojson x.end_time)));
       (
         "StartTime",
         (Some (iso_timestamp_to_yojson x.start_time)));
       (
         "Identifier",
         (Some (identifier_string_to_yojson x.identifier)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let delete_performance_analysis_report_response_to_yojson = 
  fun (x: delete_performance_analysis_report_response) -> assoc_to_yojson(
    [
  ])

let delete_performance_analysis_report_request_to_yojson = 
  fun (x: delete_performance_analysis_report_request) -> assoc_to_yojson(
    [(
         "AnalysisReportId",
         (Some (analysis_report_id_to_yojson x.analysis_report_id)));
       (
         "Identifier",
         (Some (identifier_string_to_yojson x.identifier)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let create_performance_analysis_report_response_to_yojson = 
  fun (x: create_performance_analysis_report_response) -> assoc_to_yojson(
    [(
         "AnalysisReportId",
         (option_to_yojson analysis_report_id_to_yojson x.analysis_report_id));
       
  ])

let create_performance_analysis_report_request_to_yojson = 
  fun (x: create_performance_analysis_report_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "EndTime",
         (Some (iso_timestamp_to_yojson x.end_time)));
       (
         "StartTime",
         (Some (iso_timestamp_to_yojson x.start_time)));
       (
         "Identifier",
         (Some (identifier_string_to_yojson x.identifier)));
       (
         "ServiceType",
         (Some (service_type_to_yojson x.service_type)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

