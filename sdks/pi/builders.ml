[@@@warning "-39"]
open Types
let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list)
  ~(resource_ar_n : string)
  ~(service_type : service_type)
  () : untag_resource_request = { tag_keys; resource_ar_n; service_type; 
}

let make_tag_resource_response  () : tag_resource_response = ()

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_resource_request 
  ~(tags : tag list)
  ~(resource_ar_n : string)
  ~(service_type : service_type)
  () : tag_resource_request = { tags; resource_ar_n; service_type; 
}

let make_response_resource_metric 
  ?(unit_ : string option)
  ?(description : string option)
  ?(metric : string option)
  () : response_resource_metric = { unit_; description; metric; 
}

let make_response_resource_metric_key 
  ?(dimensions : (string * string) list option) ~(metric : string) ()
: response_resource_metric_key = { dimensions; metric; 
}

let make_response_partition_key  ~(dimensions : (string * string) list) ()
: response_partition_key = { dimensions;  }

let make_recommendation 
  ?(recommendation_description : string option)
  ?(recommendation_id : string option)
  () : recommendation = { recommendation_description; recommendation_id; 
}

let make_list_tags_for_resource_response  ?(tags : tag list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_request 
  ~(resource_ar_n : string) ~(service_type : service_type) ()
: list_tags_for_resource_request = { resource_ar_n; service_type; 
}

let make_analysis_report_summary 
  ?(tags : tag list option)
  ?(status : analysis_status option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(create_time : float option)
  ?(analysis_report_id : string option)
  () : analysis_report_summary = {
  tags; status; end_time; start_time; create_time; analysis_report_id; 
}

let make_list_performance_analysis_reports_response 
  ?(next_token : string option)
  ?(analysis_reports : analysis_report_summary list option)
  () : list_performance_analysis_reports_response = {
  next_token; analysis_reports; 
}

let make_list_performance_analysis_reports_request 
  ?(list_tags : bool option)
  ?(max_results : int option)
  ?(next_token : string option)
  ~(identifier : string)
  ~(service_type : service_type)
  () : list_performance_analysis_reports_request = {
  list_tags; max_results; next_token; identifier; service_type; 
}

let make_list_available_resource_metrics_response 
  ?(next_token : string option)
  ?(metrics : response_resource_metric list option)
  () : list_available_resource_metrics_response = { next_token; metrics; 
}

let make_list_available_resource_metrics_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(metric_types : string list)
  ~(identifier : string)
  ~(service_type : service_type)
  () : list_available_resource_metrics_request = {
  max_results; next_token; metric_types; identifier; service_type; 
}

let make_dimension_detail  ?(identifier : string option) ()
: dimension_detail = { identifier;  }

let make_dimension_group_detail 
  ?(dimensions : dimension_detail list option) ?(group : string option) ()
: dimension_group_detail = { dimensions; group; 
}

let make_metric_dimension_groups 
  ?(groups : dimension_group_detail list option) ?(metric : string option) ()
: metric_dimension_groups = { groups; metric; 
}

let make_list_available_resource_dimensions_response 
  ?(next_token : string option)
  ?(metric_dimensions : metric_dimension_groups list option)
  () : list_available_resource_dimensions_response = {
  next_token; metric_dimensions; 
}

let make_list_available_resource_dimensions_request 
  ?(authorized_actions : fine_grained_action list option)
  ?(next_token : string option)
  ?(max_results : int option)
  ~(metrics : string list)
  ~(identifier : string)
  ~(service_type : service_type)
  () : list_available_resource_dimensions_request = {
  authorized_actions;
  next_token;
  max_results;
  metrics;
  identifier;
  service_type;
   }

let make_data_point  ~(value : float) ~(timestamp_ : float) () : data_point =
{ value; timestamp_;  }

let make_metric_key_data_points 
  ?(data_points : data_point list option)
  ?(key : response_resource_metric_key option)
  () : metric_key_data_points = { data_points; key; 
}

let make_get_resource_metrics_response 
  ?(next_token : string option)
  ?(metric_list : metric_key_data_points list option)
  ?(identifier : string option)
  ?(aligned_end_time : float option)
  ?(aligned_start_time : float option)
  () : get_resource_metrics_response = {
  next_token; metric_list; identifier; aligned_end_time; aligned_start_time; 
}

let make_dimension_group 
  ?(limit : int option)
  ?(dimensions : string list option)
  ~(group : string)
  () : dimension_group = { limit; dimensions; group;  }

let make_metric_query 
  ?(filter : (string * string) list option)
  ?(group_by : dimension_group option)
  ~(metric : string)
  () : metric_query = { filter; group_by; metric; 
}

let make_get_resource_metrics_request 
  ?(period_alignment : period_alignment option)
  ?(next_token : string option)
  ?(max_results : int option)
  ?(period_in_seconds : int option)
  ~(end_time : float)
  ~(start_time : float)
  ~(metric_queries : metric_query list)
  ~(identifier : string)
  ~(service_type : service_type)
  () : get_resource_metrics_request = {
  period_alignment;
  next_token;
  max_results;
  period_in_seconds;
  end_time;
  start_time;
  metric_queries;
  identifier;
  service_type;
   }

let make_feature_metadata  ?(status : feature_status option) ()
: feature_metadata = { status;  }

let make_get_resource_metadata_response 
  ?(features : (string * feature_metadata) list option)
  ?(identifier : string option)
  () : get_resource_metadata_response = { features; identifier; 
}

let make_get_resource_metadata_request 
  ~(identifier : string) ~(service_type : service_type) ()
: get_resource_metadata_request = { identifier; service_type; 
}

let make_performance_insights_metric 
  ?(value : float option)
  ?(dimensions : (string * string) list option)
  ?(display_name : string option)
  ?(metric : string option)
  () : performance_insights_metric = {
  value; dimensions; display_name; metric;  }

let make_data 
  ?(performance_insights_metric : performance_insights_metric option) ()
: data = { performance_insights_metric;  }

let make_insight 
  ?(baseline_data : data list option)
  ?(insight_data : data list option)
  ?(recommendations : recommendation list option)
  ?(description : string option)
  ?(supporting_insights : insight list option)
  ?(severity : severity option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(context : context_type option)
  ?(insight_type : string option)
  ~(insight_id : string)
  () : insight = {
  baseline_data;
  insight_data;
  recommendations;
  description;
  supporting_insights;
  severity;
  end_time;
  start_time;
  context;
  insight_type;
  insight_id;
   }

let make_analysis_report 
  ?(insights : insight list option)
  ?(status : analysis_status option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(create_time : float option)
  ?(service_type : service_type option)
  ?(identifier : string option)
  ~(analysis_report_id : string)
  () : analysis_report = {
  insights;
  status;
  end_time;
  start_time;
  create_time;
  service_type;
  identifier;
  analysis_report_id;
   }

let make_get_performance_analysis_report_response 
  ?(analysis_report : analysis_report option) ()
: get_performance_analysis_report_response = { analysis_report; 
}

let make_get_performance_analysis_report_request 
  ?(accept_language : accept_language option)
  ?(text_format : text_format option)
  ~(analysis_report_id : string)
  ~(identifier : string)
  ~(service_type : service_type)
  () : get_performance_analysis_report_request = {
  accept_language; text_format; analysis_report_id; identifier; service_type; 
}

let make_dimension_key_detail 
  ?(status : detail_status option)
  ?(dimension : string option)
  ?(value : string option)
  () : dimension_key_detail = { status; dimension; value; 
}

let make_get_dimension_key_details_response 
  ?(dimensions : dimension_key_detail list option) ()
: get_dimension_key_details_response = { dimensions; 
}

let make_get_dimension_key_details_request 
  ?(requested_dimensions : string list option)
  ~(group_identifier : string)
  ~(group : string)
  ~(identifier : string)
  ~(service_type : service_type)
  () : get_dimension_key_details_request = {
  requested_dimensions; group_identifier; group; identifier; service_type; 
}

let make_dimension_key_description 
  ?(partitions : float list option)
  ?(additional_metrics : (string * float) list option)
  ?(total : float option)
  ?(dimensions : (string * string) list option)
  () : dimension_key_description = {
  partitions; additional_metrics; total; dimensions; 
}

let make_describe_dimension_keys_response 
  ?(next_token : string option)
  ?(keys : dimension_key_description list option)
  ?(partition_keys : response_partition_key list option)
  ?(aligned_end_time : float option)
  ?(aligned_start_time : float option)
  () : describe_dimension_keys_response = {
  next_token; keys; partition_keys; aligned_end_time; aligned_start_time; 
}

let make_describe_dimension_keys_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filter : (string * string) list option)
  ?(partition_by : dimension_group option)
  ?(additional_metrics : string list option)
  ?(period_in_seconds : int option)
  ~(group_by : dimension_group)
  ~(metric : string)
  ~(end_time : float)
  ~(start_time : float)
  ~(identifier : string)
  ~(service_type : service_type)
  () : describe_dimension_keys_request = {
  next_token;
  max_results;
  filter;
  partition_by;
  additional_metrics;
  group_by;
  period_in_seconds;
  metric;
  end_time;
  start_time;
  identifier;
  service_type;
   }

let make_delete_performance_analysis_report_response  ()
: delete_performance_analysis_report_response =
()

let make_delete_performance_analysis_report_request 
  ~(analysis_report_id : string)
  ~(identifier : string)
  ~(service_type : service_type)
  () : delete_performance_analysis_report_request = {
  analysis_report_id; identifier; service_type; 
}

let make_create_performance_analysis_report_response 
  ?(analysis_report_id : string option) ()
: create_performance_analysis_report_response = { analysis_report_id; 
}

let make_create_performance_analysis_report_request 
  ?(tags : tag list option)
  ~(end_time : float)
  ~(start_time : float)
  ~(identifier : string)
  ~(service_type : service_type)
  () : create_performance_analysis_report_request = {
  tags; end_time; start_time; identifier; service_type; 
}

