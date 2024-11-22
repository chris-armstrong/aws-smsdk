open Types 
module UpdateCertificateOptions : sig
  val request :
    Smaws_Lib.Context.t ->
      update_certificate_options_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidStateException of invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ResendValidationEmail : sig
  val request :
    Smaws_Lib.Context.t ->
      resend_validation_email_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RequestCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      request_certificate_request ->
        (request_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `LimitExceededException of limit_exceeded_exception
            | `TagPolicyException of tag_policy_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module RenewCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      renew_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RemoveTagsFromCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module PutAccountConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_account_configuration_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListTagsForCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_certificate_request ->
        (list_tags_for_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_certificates_request ->
        (list_certificates_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgsException of invalid_args_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ImportCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      import_certificate_request ->
        (import_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module GetCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_certificate_request ->
        (get_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `RequestInProgressException of request_in_progress_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetAccountConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_account_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ExportCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      export_certificate_request ->
        (export_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `RequestInProgressException of request_in_progress_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_certificate_request ->
        (describe_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InvalidArnException of invalid_arn_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module AddTagsToCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `ThrottlingException of throttling_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

