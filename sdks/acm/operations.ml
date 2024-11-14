open Types 
let (let+) res map = Result.map map res
module UpdateCertificateOptions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.acm", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_certificate_options_request) ->
    let input = Serializers.update_certificate_options_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.UpdateCertificateOptions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module ResendValidationEmail = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidDomainValidationOptionsException" ->
         (`InvalidDomainValidationOptionsException (invalid_domain_validation_options_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: resend_validation_email_request) ->
    let input = Serializers.resend_validation_email_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.ResendValidationEmail" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RequestCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidDomainValidationOptionsException" ->
         (`InvalidDomainValidationOptionsException (invalid_domain_validation_options_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidTagException" ->
         (`InvalidTagException (invalid_tag_exception_of_yojson tree path))
      | "com.amazonaws.acm", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.acm", "TagPolicyException" ->
         (`TagPolicyException (tag_policy_exception_of_yojson tree path))
      | "com.amazonaws.acm", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: request_certificate_request) ->
    let input = Serializers.request_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.RequestCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.request_certificate_response_of_yojson
      ~error_deserializer
      
end

module RenewCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: renew_certificate_request) ->
    let input = Serializers.renew_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.RenewCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RemoveTagsFromCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidTagException" ->
         (`InvalidTagException (invalid_tag_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.acm", "TagPolicyException" ->
         (`TagPolicyException (tag_policy_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: remove_tags_from_certificate_request) ->
    let input = Serializers.remove_tags_from_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.RemoveTagsFromCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module PutAccountConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_account_configuration_request) ->
    let input = Serializers.put_account_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.PutAccountConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module ListTagsForCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_certificate_request) ->
    let input = Serializers.list_tags_for_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.ListTagsForCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_certificate_response_of_yojson
      ~error_deserializer
      
end

module ListCertificates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArgsException" ->
         (`InvalidArgsException (invalid_args_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_certificates_request) ->
    let input = Serializers.list_certificates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.ListCertificates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_certificates_response_of_yojson
      ~error_deserializer
      
end

module ImportCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidTagException" ->
         (`InvalidTagException (invalid_tag_exception_of_yojson tree path))
      | "com.amazonaws.acm", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.acm", "TagPolicyException" ->
         (`TagPolicyException (tag_policy_exception_of_yojson tree path))
      | "com.amazonaws.acm", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: import_certificate_request) ->
    let input = Serializers.import_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.ImportCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.import_certificate_response_of_yojson
      ~error_deserializer
      
end

module GetCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "RequestInProgressException" ->
         (`RequestInProgressException (request_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_certificate_request) ->
    let input = Serializers.get_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.GetCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_certificate_response_of_yojson
      ~error_deserializer
      
end

module GetAccountConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: unit) ->
    let input = Serializers.base_unit_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.GetAccountConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_account_configuration_response_of_yojson
      ~error_deserializer
      
end

module ExportCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "RequestInProgressException" ->
         (`RequestInProgressException (request_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: export_certificate_request) ->
    let input = Serializers.export_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.ExportCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.export_certificate_response_of_yojson
      ~error_deserializer
      
end

module DescribeCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_certificate_request) ->
    let input = Serializers.describe_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.DescribeCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_certificate_response_of_yojson
      ~error_deserializer
      
end

module DeleteCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_certificate_request) ->
    let input = Serializers.delete_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.DeleteCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module AddTagsToCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.acm", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.acm", "InvalidTagException" ->
         (`InvalidTagException (invalid_tag_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.acm", "TagPolicyException" ->
         (`TagPolicyException (tag_policy_exception_of_yojson tree path))
      | "com.amazonaws.acm", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.acm", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_tags_to_certificate_request) ->
    let input = Serializers.add_tags_to_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CertificateManager.AddTagsToCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

