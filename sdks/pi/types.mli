open Smaws_Lib
val service : Service.descriptor

type untag_resource_response = unit

type service_type = | DOCDB
  | RDS

type untag_resource_request = {
  tag_keys: string list;
  resource_ar_n: string;
  service_type: service_type
}

type not_authorized_exception = {
  message: string option
}

type invalid_argument_exception = {
  message: string option
}

type internal_service_error = {
  message: string option
}

type text_format = | MARKDOWN
  | PLAIN_TEXT

type tag_resource_response = unit

type tag = {
  value: string;
  key: string
}

type tag_resource_request = {
  tags: tag list;
  resource_ar_n: string;
  service_type: service_type
}

type severity = | HIGH
  | MEDIUM
  | LOW

type response_resource_metric = {
  unit_: string option;
  description: string option;
  metric: string option
}

type response_resource_metric_key = {
  dimensions: (string * string) list option;
  metric: string
}

type response_partition_key = {
  dimensions: (string * string) list
}

type recommendation = {
  recommendation_description: string option;
  recommendation_id: string option
}

type period_alignment = | START_TIME
  | END_TIME

type list_tags_for_resource_response = {
  tags: tag list option
}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  service_type: service_type
}

type analysis_status = | FAILED
  | SUCCEEDED
  | RUNNING

type analysis_report_summary = {
  tags: tag list option;
  status: analysis_status option;
  end_time: float option;
  start_time: float option;
  create_time: float option;
  analysis_report_id: string option
}

type list_performance_analysis_reports_response = {
  next_token: string option;
  analysis_reports: analysis_report_summary list option
}

type list_performance_analysis_reports_request = {
  list_tags: bool option;
  max_results: int option;
  next_token: string option;
  identifier: string;
  service_type: service_type
}

type list_available_resource_metrics_response = {
  next_token: string option;
  metrics: response_resource_metric list option
}

type list_available_resource_metrics_request = {
  max_results: int option;
  next_token: string option;
  metric_types: string list;
  identifier: string;
  service_type: service_type
}

type dimension_detail = {
  identifier: string option
}

type dimension_group_detail = {
  dimensions: dimension_detail list option;
  group: string option
}

type metric_dimension_groups = {
  groups: dimension_group_detail list option;
  metric: string option
}

type list_available_resource_dimensions_response = {
  next_token: string option;
  metric_dimensions: metric_dimension_groups list option
}

type fine_grained_action = | GET_RESOURCE_METRICS
  | GET_DIMENSION_KEY_DETAILS
  | DESCRIBE_DIMENSION_KEYS

type list_available_resource_dimensions_request = {
  authorized_actions: fine_grained_action list option;
  next_token: string option;
  max_results: int option;
  metrics: string list;
  identifier: string;
  service_type: service_type
}

type data_point = {
  value: float;
  timestamp_: float
}

type metric_key_data_points = {
  data_points: data_point list option;
  key: response_resource_metric_key option
}

type get_resource_metrics_response = {
  next_token: string option;
  metric_list: metric_key_data_points list option;
  identifier: string option;
  aligned_end_time: float option;
  aligned_start_time: float option
}

type dimension_group = {
  limit: int option;
  dimensions: string list option;
  group: string
}

type metric_query = {
  filter: (string * string) list option;
  group_by: dimension_group option;
  metric: string
}

type get_resource_metrics_request = {
  period_alignment: period_alignment option;
  next_token: string option;
  max_results: int option;
  period_in_seconds: int option;
  end_time: float;
  start_time: float;
  metric_queries: metric_query list;
  identifier: string;
  service_type: service_type
}

type feature_status = | UNKNOWN
  | DISABLED_PENDING_REBOOT
  | ENABLED_PENDING_REBOOT
  | UNSUPPORTED
  | DISABLED
  | ENABLED

type feature_metadata = {
  status: feature_status option
}

type get_resource_metadata_response = {
  features: (string * feature_metadata) list option;
  identifier: string option
}

type get_resource_metadata_request = {
  identifier: string;
  service_type: service_type
}

type context_type = | CONTEXTUAL
  | CAUSAL

type performance_insights_metric = {
  value: float option;
  dimensions: (string * string) list option;
  display_name: string option;
  metric: string option
}

type data = {
  performance_insights_metric: performance_insights_metric option
}

type insight = {
  baseline_data: data list option;
  insight_data: data list option;
  recommendations: recommendation list option;
  description: string option;
  supporting_insights: insight list option;
  severity: severity option;
  end_time: float option;
  start_time: float option;
  context: context_type option;
  insight_type: string option;
  insight_id: string
}

type analysis_report = {
  insights: insight list option;
  status: analysis_status option;
  end_time: float option;
  start_time: float option;
  create_time: float option;
  service_type: service_type option;
  identifier: string option;
  analysis_report_id: string
}

type get_performance_analysis_report_response = {
  analysis_report: analysis_report option
}

type accept_language = | EN_US

type get_performance_analysis_report_request = {
  accept_language: accept_language option;
  text_format: text_format option;
  analysis_report_id: string;
  identifier: string;
  service_type: service_type
}

type detail_status = | UNAVAILABLE
  | PROCESSING
  | AVAILABLE

type dimension_key_detail = {
  status: detail_status option;
  dimension: string option;
  value: string option
}

type get_dimension_key_details_response = {
  dimensions: dimension_key_detail list option
}

type get_dimension_key_details_request = {
  requested_dimensions: string list option;
  group_identifier: string;
  group: string;
  identifier: string;
  service_type: service_type
}

type dimension_key_description = {
  partitions: float list option;
  additional_metrics: (string * float) list option;
  total: float option;
  dimensions: (string * string) list option
}

type describe_dimension_keys_response = {
  next_token: string option;
  keys: dimension_key_description list option;
  partition_keys: response_partition_key list option;
  aligned_end_time: float option;
  aligned_start_time: float option
}

type describe_dimension_keys_request = {
  next_token: string option;
  max_results: int option;
  filter: (string * string) list option;
  partition_by: dimension_group option;
  additional_metrics: string list option;
  group_by: dimension_group;
  period_in_seconds: int option;
  metric: string;
  end_time: float;
  start_time: float;
  identifier: string;
  service_type: service_type
}

type delete_performance_analysis_report_response = unit

type delete_performance_analysis_report_request = {
  analysis_report_id: string;
  identifier: string;
  service_type: service_type
}

type create_performance_analysis_report_response = {
  analysis_report_id: string option
}

type create_performance_analysis_report_request = {
  tags: tag list option;
  end_time: float;
  start_time: float;
  identifier: string;
  service_type: service_type
}



type base_document = Json.t

