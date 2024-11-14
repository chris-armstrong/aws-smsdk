open Types
val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list ->
  resource_ar_n:string ->
  service_type:service_type ->
  unit -> untag_resource_request

val make_tag_resource_response : unit -> tag_resource_response

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_request :
  tags:tag list -> resource_ar_n:string -> service_type:service_type -> unit
-> tag_resource_request

val make_response_resource_metric :
  ?unit_:string -> ?description:string -> ?metric:string -> unit
-> response_resource_metric

val make_response_resource_metric_key :
  ?dimensions:(string * string) list -> metric:string -> unit
-> response_resource_metric_key

val make_response_partition_key : dimensions:(string * string) list -> unit
-> response_partition_key

val make_recommendation :
  ?recommendation_description:string -> ?recommendation_id:string -> unit
-> recommendation

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:string -> service_type:service_type -> unit
-> list_tags_for_resource_request

val make_analysis_report_summary :
  ?tags:tag list ->
  ?status:analysis_status ->
  ?end_time:float ->
  ?start_time:float ->
  ?create_time:float ->
  ?analysis_report_id:string ->
  unit
-> analysis_report_summary

val make_list_performance_analysis_reports_response :
  ?next_token:string ->
  ?analysis_reports:analysis_report_summary list ->
  unit
-> list_performance_analysis_reports_response

val make_list_performance_analysis_reports_request :
  ?list_tags:bool ->
  ?max_results:int ->
  ?next_token:string ->
  identifier:string ->
  service_type:service_type ->
  unit
-> list_performance_analysis_reports_request

val make_list_available_resource_metrics_response :
  ?next_token:string -> ?metrics:response_resource_metric list -> unit
-> list_available_resource_metrics_response

val make_list_available_resource_metrics_request :
  ?max_results:int ->
  ?next_token:string ->
  metric_types:string list ->
  identifier:string ->
  service_type:service_type ->
  unit -> list_available_resource_metrics_request

val make_dimension_detail : ?identifier:string -> unit
-> dimension_detail

val make_dimension_group_detail :
  ?dimensions:dimension_detail list -> ?group:string -> unit
-> dimension_group_detail

val make_metric_dimension_groups :
  ?groups:dimension_group_detail list -> ?metric:string -> unit
-> metric_dimension_groups

val make_list_available_resource_dimensions_response :
  ?next_token:string ->
  ?metric_dimensions:metric_dimension_groups list ->
  unit
-> list_available_resource_dimensions_response

val make_list_available_resource_dimensions_request :
  ?authorized_actions:fine_grained_action list ->
  ?next_token:string ->
  ?max_results:int ->
  metrics:string list ->
  identifier:string ->
  service_type:service_type ->
  unit -> list_available_resource_dimensions_request

val make_data_point : value:float -> timestamp_:float -> unit
-> data_point

val make_metric_key_data_points :
  ?data_points:data_point list -> ?key:response_resource_metric_key -> unit
-> metric_key_data_points

val make_get_resource_metrics_response :
  ?next_token:string ->
  ?metric_list:metric_key_data_points list ->
  ?identifier:string ->
  ?aligned_end_time:float ->
  ?aligned_start_time:float ->
  unit -> get_resource_metrics_response

val make_dimension_group :
  ?limit:int -> ?dimensions:string list -> group:string -> unit
-> dimension_group

val make_metric_query :
  ?filter:(string * string) list ->
  ?group_by:dimension_group ->
  metric:string ->
  unit -> metric_query

val make_get_resource_metrics_request :
  ?period_alignment:period_alignment ->
  ?next_token:string ->
  ?max_results:int ->
  ?period_in_seconds:int ->
  end_time:float ->
  start_time:float ->
  metric_queries:metric_query list ->
  identifier:string ->
  service_type:service_type ->
  unit -> get_resource_metrics_request

val make_feature_metadata : ?status:feature_status -> unit
-> feature_metadata

val make_get_resource_metadata_response :
  ?features:(string * feature_metadata) list -> ?identifier:string -> unit
-> get_resource_metadata_response

val make_get_resource_metadata_request :
  identifier:string -> service_type:service_type -> unit
-> get_resource_metadata_request

val make_performance_insights_metric :
  ?value:float ->
  ?dimensions:(string * string) list ->
  ?display_name:string ->
  ?metric:string ->
  unit -> performance_insights_metric

val make_data :
  ?performance_insights_metric:performance_insights_metric -> unit
-> data

val make_insight :
  ?baseline_data:data list ->
  ?insight_data:data list ->
  ?recommendations:recommendation list ->
  ?description:string ->
  ?supporting_insights:insight list ->
  ?severity:severity ->
  ?end_time:float ->
  ?start_time:float ->
  ?context:context_type ->
  ?insight_type:string ->
  insight_id:string ->
  unit -> insight

val make_analysis_report :
  ?insights:insight list ->
  ?status:analysis_status ->
  ?end_time:float ->
  ?start_time:float ->
  ?create_time:float ->
  ?service_type:service_type ->
  ?identifier:string ->
  analysis_report_id:string ->
  unit -> analysis_report

val make_get_performance_analysis_report_response :
  ?analysis_report:analysis_report -> unit
-> get_performance_analysis_report_response

val make_get_performance_analysis_report_request :
  ?accept_language:accept_language ->
  ?text_format:text_format ->
  analysis_report_id:string ->
  identifier:string ->
  service_type:service_type ->
  unit
-> get_performance_analysis_report_request

val make_dimension_key_detail :
  ?status:detail_status -> ?dimension:string -> ?value:string -> unit
-> dimension_key_detail

val make_get_dimension_key_details_response :
  ?dimensions:dimension_key_detail list -> unit
-> get_dimension_key_details_response

val make_get_dimension_key_details_request :
  ?requested_dimensions:string list ->
  group_identifier:string ->
  group:string ->
  identifier:string ->
  service_type:service_type ->
  unit
-> get_dimension_key_details_request

val make_dimension_key_description :
  ?partitions:float list ->
  ?additional_metrics:(string * float) list ->
  ?total:float ->
  ?dimensions:(string * string) list ->
  unit
-> dimension_key_description

val make_describe_dimension_keys_response :
  ?next_token:string ->
  ?keys:dimension_key_description list ->
  ?partition_keys:response_partition_key list ->
  ?aligned_end_time:float ->
  ?aligned_start_time:float ->
  unit
-> describe_dimension_keys_response

val make_describe_dimension_keys_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filter:(string * string) list ->
  ?partition_by:dimension_group ->
  ?additional_metrics:string list ->
  ?period_in_seconds:int ->
  group_by:dimension_group ->
  metric:string ->
  end_time:float ->
  start_time:float ->
  identifier:string ->
  service_type:service_type ->
  unit
-> describe_dimension_keys_request

val make_delete_performance_analysis_report_response : unit
-> delete_performance_analysis_report_response

val make_delete_performance_analysis_report_request :
  analysis_report_id:string ->
  identifier:string ->
  service_type:service_type ->
  unit
-> delete_performance_analysis_report_request

val make_create_performance_analysis_report_response :
  ?analysis_report_id:string -> unit
-> create_performance_analysis_report_response

val make_create_performance_analysis_report_request :
  ?tags:tag list ->
  end_time:float ->
  start_time:float ->
  identifier:string ->
  service_type:service_type ->
  unit
-> create_performance_analysis_report_request

