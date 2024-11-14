open Types 
module UntagResources : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resources_input ->
        (untag_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
end

module TagResources : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resources_input ->
        (tag_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
end

module StartReportCreation : sig
  val request :
    Smaws_Lib.Context.t ->
      start_report_creation_input ->
        (start_report_creation_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `ConstraintViolationException of constraint_violation_exception
            | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
end

module GetTagValues : sig
  val request :
    Smaws_Lib.Context.t ->
      get_tag_values_input ->
        (get_tag_values_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `PaginationTokenExpiredException of pagination_token_expired_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
end

module GetTagKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_tag_keys_input ->
        (get_tag_keys_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `PaginationTokenExpiredException of pagination_token_expired_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
end

module GetResources : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resources_input ->
        (get_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `PaginationTokenExpiredException of pagination_token_expired_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
end

module GetComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_summary_input ->
        (get_compliance_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConstraintViolationException of constraint_violation_exception
            | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
end

module DescribeReportCreation : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_report_creation_input ->
        (describe_report_creation_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConstraintViolationException of constraint_violation_exception
            | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
end

