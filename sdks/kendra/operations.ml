open Types 
let (let+) res map = Result.map map res
module AssociateEntitiesToExperience = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceAlreadyExistException" ->
         (`ResourceAlreadyExistException (resource_already_exist_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_entities_to_experience_request) ->
    let input = Serializers.associate_entities_to_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.AssociateEntitiesToExperience" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_entities_to_experience_response_of_yojson
      ~error_deserializer
      
end

module AssociatePersonasToEntities = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceAlreadyExistException" ->
         (`ResourceAlreadyExistException (resource_already_exist_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_personas_to_entities_request) ->
    let input = Serializers.associate_personas_to_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.AssociatePersonasToEntities" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_personas_to_entities_response_of_yojson
      ~error_deserializer
      
end

module BatchDeleteDocument = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_delete_document_request) ->
    let input = Serializers.batch_delete_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.BatchDeleteDocument" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_delete_document_response_of_yojson
      ~error_deserializer
      
end

module BatchDeleteFeaturedResultsSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_delete_featured_results_set_request) ->
    let input = Serializers.batch_delete_featured_results_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.BatchDeleteFeaturedResultsSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_delete_featured_results_set_response_of_yojson
      ~error_deserializer
      
end

module BatchGetDocumentStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_get_document_status_request) ->
    let input = Serializers.batch_get_document_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.BatchGetDocumentStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_get_document_status_response_of_yojson
      ~error_deserializer
      
end

module BatchPutDocument = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_put_document_request) ->
    let input = Serializers.batch_put_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.BatchPutDocument" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_put_document_response_of_yojson
      ~error_deserializer
      
end

module ClearQuerySuggestions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: clear_query_suggestions_request) ->
    let input = Serializers.clear_query_suggestions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ClearQuerySuggestions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module CreateAccessControlConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_access_control_configuration_request) ->
    let input = Serializers.create_access_control_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.CreateAccessControlConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_access_control_configuration_response_of_yojson
      ~error_deserializer
      
end

module CreateDataSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceAlreadyExistException" ->
         (`ResourceAlreadyExistException (resource_already_exist_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_data_source_request) ->
    let input = Serializers.create_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.CreateDataSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_data_source_response_of_yojson
      ~error_deserializer
      
end

module CreateExperience = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_experience_request) ->
    let input = Serializers.create_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.CreateExperience" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_experience_response_of_yojson
      ~error_deserializer
      
end

module CreateFaq = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_faq_request) ->
    let input = Serializers.create_faq_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.CreateFaq" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_faq_response_of_yojson
      ~error_deserializer
      
end

module CreateFeaturedResultsSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "FeaturedResultsConflictException" ->
         (`FeaturedResultsConflictException (featured_results_conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_featured_results_set_request) ->
    let input = Serializers.create_featured_results_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.CreateFeaturedResultsSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_featured_results_set_response_of_yojson
      ~error_deserializer
      
end

module CreateIndex = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceAlreadyExistException" ->
         (`ResourceAlreadyExistException (resource_already_exist_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_index_request) ->
    let input = Serializers.create_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.CreateIndex" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_index_response_of_yojson
      ~error_deserializer
      
end

module CreateQuerySuggestionsBlockList = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_query_suggestions_block_list_request) ->
    let input = Serializers.create_query_suggestions_block_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.CreateQuerySuggestionsBlockList" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_query_suggestions_block_list_response_of_yojson
      ~error_deserializer
      
end

module CreateThesaurus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_thesaurus_request) ->
    let input = Serializers.create_thesaurus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.CreateThesaurus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_thesaurus_response_of_yojson
      ~error_deserializer
      
end

module DeleteAccessControlConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_access_control_configuration_request) ->
    let input = Serializers.delete_access_control_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DeleteAccessControlConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_access_control_configuration_response_of_yojson
      ~error_deserializer
      
end

module DeleteDataSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_data_source_request) ->
    let input = Serializers.delete_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DeleteDataSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteExperience = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_experience_request) ->
    let input = Serializers.delete_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DeleteExperience" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_experience_response_of_yojson
      ~error_deserializer
      
end

module DeleteFaq = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_faq_request) ->
    let input = Serializers.delete_faq_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DeleteFaq" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteIndex = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_index_request) ->
    let input = Serializers.delete_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DeleteIndex" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeletePrincipalMapping = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_principal_mapping_request) ->
    let input = Serializers.delete_principal_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DeletePrincipalMapping" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteQuerySuggestionsBlockList = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_query_suggestions_block_list_request) ->
    let input = Serializers.delete_query_suggestions_block_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DeleteQuerySuggestionsBlockList" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteThesaurus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_thesaurus_request) ->
    let input = Serializers.delete_thesaurus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DeleteThesaurus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DescribeAccessControlConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_access_control_configuration_request) ->
    let input = Serializers.describe_access_control_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DescribeAccessControlConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_access_control_configuration_response_of_yojson
      ~error_deserializer
      
end

module DescribeDataSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_data_source_request) ->
    let input = Serializers.describe_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DescribeDataSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_data_source_response_of_yojson
      ~error_deserializer
      
end

module DescribeExperience = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_experience_request) ->
    let input = Serializers.describe_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DescribeExperience" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_experience_response_of_yojson
      ~error_deserializer
      
end

module DescribeFaq = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_faq_request) ->
    let input = Serializers.describe_faq_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DescribeFaq" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_faq_response_of_yojson
      ~error_deserializer
      
end

module DescribeFeaturedResultsSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_featured_results_set_request) ->
    let input = Serializers.describe_featured_results_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DescribeFeaturedResultsSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_featured_results_set_response_of_yojson
      ~error_deserializer
      
end

module DescribeIndex = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_index_request) ->
    let input = Serializers.describe_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DescribeIndex" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_index_response_of_yojson
      ~error_deserializer
      
end

module DescribePrincipalMapping = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_principal_mapping_request) ->
    let input = Serializers.describe_principal_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DescribePrincipalMapping" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_principal_mapping_response_of_yojson
      ~error_deserializer
      
end

module DescribeQuerySuggestionsBlockList = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_query_suggestions_block_list_request) ->
    let input = Serializers.describe_query_suggestions_block_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DescribeQuerySuggestionsBlockList" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_query_suggestions_block_list_response_of_yojson
      ~error_deserializer
      
end

module DescribeQuerySuggestionsConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_query_suggestions_config_request) ->
    let input = Serializers.describe_query_suggestions_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DescribeQuerySuggestionsConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_query_suggestions_config_response_of_yojson
      ~error_deserializer
      
end

module DescribeThesaurus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_thesaurus_request) ->
    let input = Serializers.describe_thesaurus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DescribeThesaurus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_thesaurus_response_of_yojson
      ~error_deserializer
      
end

module DisassociateEntitiesFromExperience = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_entities_from_experience_request) ->
    let input = Serializers.disassociate_entities_from_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DisassociateEntitiesFromExperience" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_entities_from_experience_response_of_yojson
      ~error_deserializer
      
end

module DisassociatePersonasFromEntities = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_personas_from_entities_request) ->
    let input = Serializers.disassociate_personas_from_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.DisassociatePersonasFromEntities" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_personas_from_entities_response_of_yojson
      ~error_deserializer
      
end

module GetQuerySuggestions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_query_suggestions_request) ->
    let input = Serializers.get_query_suggestions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.GetQuerySuggestions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_query_suggestions_response_of_yojson
      ~error_deserializer
      
end

module GetSnapshots = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_snapshots_request) ->
    let input = Serializers.get_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.GetSnapshots" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_snapshots_response_of_yojson
      ~error_deserializer
      
end

module ListAccessControlConfigurations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_access_control_configurations_request) ->
    let input = Serializers.list_access_control_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListAccessControlConfigurations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_access_control_configurations_response_of_yojson
      ~error_deserializer
      
end

module ListDataSourceSyncJobs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_data_source_sync_jobs_request) ->
    let input = Serializers.list_data_source_sync_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListDataSourceSyncJobs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_data_source_sync_jobs_response_of_yojson
      ~error_deserializer
      
end

module ListDataSources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_data_sources_request) ->
    let input = Serializers.list_data_sources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListDataSources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_data_sources_response_of_yojson
      ~error_deserializer
      
end

module ListEntityPersonas = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_entity_personas_request) ->
    let input = Serializers.list_entity_personas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListEntityPersonas" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_entity_personas_response_of_yojson
      ~error_deserializer
      
end

module ListExperienceEntities = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_experience_entities_request) ->
    let input = Serializers.list_experience_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListExperienceEntities" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_experience_entities_response_of_yojson
      ~error_deserializer
      
end

module ListExperiences = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_experiences_request) ->
    let input = Serializers.list_experiences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListExperiences" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_experiences_response_of_yojson
      ~error_deserializer
      
end

module ListFaqs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_faqs_request) ->
    let input = Serializers.list_faqs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListFaqs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_faqs_response_of_yojson
      ~error_deserializer
      
end

module ListFeaturedResultsSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_featured_results_sets_request) ->
    let input = Serializers.list_featured_results_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListFeaturedResultsSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_featured_results_sets_response_of_yojson
      ~error_deserializer
      
end

module ListGroupsOlderThanOrderingId = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_groups_older_than_ordering_id_request) ->
    let input = Serializers.list_groups_older_than_ordering_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListGroupsOlderThanOrderingId" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_groups_older_than_ordering_id_response_of_yojson
      ~error_deserializer
      
end

module ListIndices = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_indices_request) ->
    let input = Serializers.list_indices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListIndices" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_indices_response_of_yojson
      ~error_deserializer
      
end

module ListQuerySuggestionsBlockLists = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_query_suggestions_block_lists_request) ->
    let input = Serializers.list_query_suggestions_block_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListQuerySuggestionsBlockLists" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_query_suggestions_block_lists_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceUnavailableException" ->
         (`ResourceUnavailableException (resource_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListThesauri = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_thesauri_request) ->
    let input = Serializers.list_thesauri_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.ListThesauri" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_thesauri_response_of_yojson
      ~error_deserializer
      
end

module PutPrincipalMapping = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_principal_mapping_request) ->
    let input = Serializers.put_principal_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.PutPrincipalMapping" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module Query = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: query_request) ->
    let input = Serializers.query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.Query" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.query_result_of_yojson
      ~error_deserializer
      
end

module Retrieve = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: retrieve_request) ->
    let input = Serializers.retrieve_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.Retrieve" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.retrieve_result_of_yojson
      ~error_deserializer
      
end

module StartDataSourceSyncJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_data_source_sync_job_request) ->
    let input = Serializers.start_data_source_sync_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.StartDataSourceSyncJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_data_source_sync_job_response_of_yojson
      ~error_deserializer
      
end

module StopDataSourceSyncJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_data_source_sync_job_request) ->
    let input = Serializers.stop_data_source_sync_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.StopDataSourceSyncJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module SubmitFeedback = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceUnavailableException" ->
         (`ResourceUnavailableException (resource_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: submit_feedback_request) ->
    let input = Serializers.submit_feedback_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.SubmitFeedback" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceUnavailableException" ->
         (`ResourceUnavailableException (resource_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceUnavailableException" ->
         (`ResourceUnavailableException (resource_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module UpdateAccessControlConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_access_control_configuration_request) ->
    let input = Serializers.update_access_control_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.UpdateAccessControlConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_access_control_configuration_response_of_yojson
      ~error_deserializer
      
end

module UpdateDataSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_data_source_request) ->
    let input = Serializers.update_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.UpdateDataSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UpdateExperience = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_experience_request) ->
    let input = Serializers.update_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.UpdateExperience" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UpdateFeaturedResultsSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "FeaturedResultsConflictException" ->
         (`FeaturedResultsConflictException (featured_results_conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_featured_results_set_request) ->
    let input = Serializers.update_featured_results_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.UpdateFeaturedResultsSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_featured_results_set_response_of_yojson
      ~error_deserializer
      
end

module UpdateIndex = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_index_request) ->
    let input = Serializers.update_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.UpdateIndex" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UpdateQuerySuggestionsBlockList = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_query_suggestions_block_list_request) ->
    let input = Serializers.update_query_suggestions_block_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.UpdateQuerySuggestionsBlockList" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UpdateQuerySuggestionsConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_query_suggestions_config_request) ->
    let input = Serializers.update_query_suggestions_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.UpdateQuerySuggestionsConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UpdateThesaurus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kendra", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.kendra", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_thesaurus_request) ->
    let input = Serializers.update_thesaurus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSKendraFrontendService.UpdateThesaurus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

