open Types 
module CreatePerformanceAnalysisReport : sig
  val request :
    Smaws_Lib.Context.t ->
      create_performance_analysis_report_request ->
        (create_performance_analysis_report_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module DeletePerformanceAnalysisReport : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_performance_analysis_report_request ->
        (delete_performance_analysis_report_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module DescribeDimensionKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_dimension_keys_request ->
        (describe_dimension_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module GetDimensionKeyDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_dimension_key_details_request ->
        (get_dimension_key_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module GetPerformanceAnalysisReport : sig
  val request :
    Smaws_Lib.Context.t ->
      get_performance_analysis_report_request ->
        (get_performance_analysis_report_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module GetResourceMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_metadata_request ->
        (get_resource_metadata_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module GetResourceMetrics : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_metrics_request ->
        (get_resource_metrics_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module ListAvailableResourceDimensions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_resource_dimensions_request ->
        (list_available_resource_dimensions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module ListAvailableResourceMetrics : sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_resource_metrics_request ->
        (list_available_resource_metrics_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module ListPerformanceAnalysisReports : sig
  val request :
    Smaws_Lib.Context.t ->
      list_performance_analysis_reports_request ->
        (list_performance_analysis_reports_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceError of internal_service_error
            | `InvalidArgumentException of invalid_argument_exception
            | `NotAuthorizedException of not_authorized_exception
            
        ]
      ) result
end

