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
  (** 
    Creates a new performance analysis report for a specific time period for the DB instance.
     *)

  
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
  (** 
    Deletes a performance analysis report.
     *)

  
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
  (** 
    For a specific time period, retrieve the top [N] dimension keys for a metric.
    
     Each response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500 bytes are returned.
     
      *)

  
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
  (** 
    Get the attributes of the specified dimension group for a DB instance or data source. For example, if you specify a SQL ID, [GetDimensionKeyDetails] retrieves the full text of the dimension [db.sql.statement] associated with this ID. This operation is useful because [GetResourceMetrics] and [DescribeDimensionKeys] don't support retrieval of large SQL statement text.
     *)

  
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
  (** 
    Retrieves the report including the report ID, status, time details, and the insights with recommendations. The report status can be [RUNNING], [SUCCEEDED], or [FAILED]. The insights include the [description] and [recommendation] fields.
     *)

  
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
  (** 
    Retrieve the metadata for different features. For example, the metadata might indicate that a feature is turned on or off on a specific DB instance.
     *)

  
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
  (** 
    Retrieve Performance Insights metrics for a set of data sources over a time period. You can provide specific dimension groups and dimensions, and provide filtering criteria for each group. You must specify an aggregate function for each metric.
    
     Each response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500 bytes are returned.
     
      *)

  
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
  (** 
    Retrieve the dimensions that can be queried for each specified metric type on a specified DB instance.
     *)

  
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
  (** 
    Retrieve metrics of the specified types that can be queried for a specified DB instance.
     *)

  
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
  (** 
    Lists all the analysis reports created for the DB instance. The reports are sorted based on the start time of each report.
     *)

  
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
  (** 
    Retrieves all the metadata tags associated with Amazon RDS Performance Insights resource.
     *)

  
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
  (** 
    Adds metadata tags to the Amazon RDS Performance Insights resource.
     *)

  
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
  (** 
    Deletes the metadata tags from the Amazon RDS Performance Insights resource.
     *)

  
end

