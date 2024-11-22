open Types 
let (let+) res map = Result.map map res
module UpdateVocabularyFilter = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_vocabulary_filter_request) ->
    let input = Serializers.update_vocabulary_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.UpdateVocabularyFilter" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_vocabulary_filter_response_of_yojson
      ~error_deserializer
      
end

module UpdateVocabulary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_vocabulary_request) ->
    let input = Serializers.update_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.UpdateVocabulary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_vocabulary_response_of_yojson
      ~error_deserializer
      
end

module UpdateMedicalVocabulary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_medical_vocabulary_request) ->
    let input = Serializers.update_medical_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.UpdateMedicalVocabulary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_medical_vocabulary_response_of_yojson
      ~error_deserializer
      
end

module UpdateCallAnalyticsCategory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_call_analytics_category_request) ->
    let input = Serializers.update_call_analytics_category_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.UpdateCallAnalyticsCategory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_call_analytics_category_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module StartTranscriptionJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_transcription_job_request) ->
    let input = Serializers.start_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.StartTranscriptionJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_transcription_job_response_of_yojson
      ~error_deserializer
      
end

module StartMedicalTranscriptionJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_medical_transcription_job_request) ->
    let input = Serializers.start_medical_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.StartMedicalTranscriptionJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_medical_transcription_job_response_of_yojson
      ~error_deserializer
      
end

module StartMedicalScribeJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_medical_scribe_job_request) ->
    let input = Serializers.start_medical_scribe_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.StartMedicalScribeJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_medical_scribe_job_response_of_yojson
      ~error_deserializer
      
end

module StartCallAnalyticsJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_call_analytics_job_request) ->
    let input = Serializers.start_call_analytics_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.StartCallAnalyticsJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_call_analytics_job_response_of_yojson
      ~error_deserializer
      
end

module ListVocabularyFilters = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_vocabulary_filters_request) ->
    let input = Serializers.list_vocabulary_filters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.ListVocabularyFilters" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_vocabulary_filters_response_of_yojson
      ~error_deserializer
      
end

module ListVocabularies = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_vocabularies_request) ->
    let input = Serializers.list_vocabularies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.ListVocabularies" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_vocabularies_response_of_yojson
      ~error_deserializer
      
end

module ListTranscriptionJobs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_transcription_jobs_request) ->
    let input = Serializers.list_transcription_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.ListTranscriptionJobs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_transcription_jobs_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListMedicalVocabularies = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_medical_vocabularies_request) ->
    let input = Serializers.list_medical_vocabularies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.ListMedicalVocabularies" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_medical_vocabularies_response_of_yojson
      ~error_deserializer
      
end

module ListMedicalTranscriptionJobs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_medical_transcription_jobs_request) ->
    let input = Serializers.list_medical_transcription_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.ListMedicalTranscriptionJobs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_medical_transcription_jobs_response_of_yojson
      ~error_deserializer
      
end

module ListMedicalScribeJobs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_medical_scribe_jobs_request) ->
    let input = Serializers.list_medical_scribe_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.ListMedicalScribeJobs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_medical_scribe_jobs_response_of_yojson
      ~error_deserializer
      
end

module ListLanguageModels = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_language_models_request) ->
    let input = Serializers.list_language_models_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.ListLanguageModels" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_language_models_response_of_yojson
      ~error_deserializer
      
end

module ListCallAnalyticsJobs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_call_analytics_jobs_request) ->
    let input = Serializers.list_call_analytics_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.ListCallAnalyticsJobs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_call_analytics_jobs_response_of_yojson
      ~error_deserializer
      
end

module ListCallAnalyticsCategories = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_call_analytics_categories_request) ->
    let input = Serializers.list_call_analytics_categories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.ListCallAnalyticsCategories" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_call_analytics_categories_response_of_yojson
      ~error_deserializer
      
end

module GetVocabularyFilter = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_vocabulary_filter_request) ->
    let input = Serializers.get_vocabulary_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.GetVocabularyFilter" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_vocabulary_filter_response_of_yojson
      ~error_deserializer
      
end

module GetVocabulary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_vocabulary_request) ->
    let input = Serializers.get_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.GetVocabulary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_vocabulary_response_of_yojson
      ~error_deserializer
      
end

module GetTranscriptionJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_transcription_job_request) ->
    let input = Serializers.get_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.GetTranscriptionJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_transcription_job_response_of_yojson
      ~error_deserializer
      
end

module GetMedicalVocabulary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_medical_vocabulary_request) ->
    let input = Serializers.get_medical_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.GetMedicalVocabulary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_medical_vocabulary_response_of_yojson
      ~error_deserializer
      
end

module GetMedicalTranscriptionJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_medical_transcription_job_request) ->
    let input = Serializers.get_medical_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.GetMedicalTranscriptionJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_medical_transcription_job_response_of_yojson
      ~error_deserializer
      
end

module GetMedicalScribeJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_medical_scribe_job_request) ->
    let input = Serializers.get_medical_scribe_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.GetMedicalScribeJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_medical_scribe_job_response_of_yojson
      ~error_deserializer
      
end

module GetCallAnalyticsJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_call_analytics_job_request) ->
    let input = Serializers.get_call_analytics_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.GetCallAnalyticsJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_call_analytics_job_response_of_yojson
      ~error_deserializer
      
end

module GetCallAnalyticsCategory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_call_analytics_category_request) ->
    let input = Serializers.get_call_analytics_category_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.GetCallAnalyticsCategory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_call_analytics_category_response_of_yojson
      ~error_deserializer
      
end

module DescribeLanguageModel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_language_model_request) ->
    let input = Serializers.describe_language_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.DescribeLanguageModel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_language_model_response_of_yojson
      ~error_deserializer
      
end

module DeleteVocabularyFilter = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_vocabulary_filter_request) ->
    let input = Serializers.delete_vocabulary_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.DeleteVocabularyFilter" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteVocabulary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_vocabulary_request) ->
    let input = Serializers.delete_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.DeleteVocabulary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteTranscriptionJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_transcription_job_request) ->
    let input = Serializers.delete_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.DeleteTranscriptionJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteMedicalVocabulary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_medical_vocabulary_request) ->
    let input = Serializers.delete_medical_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.DeleteMedicalVocabulary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteMedicalTranscriptionJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_medical_transcription_job_request) ->
    let input = Serializers.delete_medical_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.DeleteMedicalTranscriptionJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteMedicalScribeJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_medical_scribe_job_request) ->
    let input = Serializers.delete_medical_scribe_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.DeleteMedicalScribeJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteLanguageModel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_language_model_request) ->
    let input = Serializers.delete_language_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.DeleteLanguageModel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteCallAnalyticsJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_call_analytics_job_request) ->
    let input = Serializers.delete_call_analytics_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.DeleteCallAnalyticsJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_call_analytics_job_response_of_yojson
      ~error_deserializer
      
end

module DeleteCallAnalyticsCategory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_call_analytics_category_request) ->
    let input = Serializers.delete_call_analytics_category_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.DeleteCallAnalyticsCategory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_call_analytics_category_response_of_yojson
      ~error_deserializer
      
end

module CreateVocabularyFilter = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_vocabulary_filter_request) ->
    let input = Serializers.create_vocabulary_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.CreateVocabularyFilter" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_vocabulary_filter_response_of_yojson
      ~error_deserializer
      
end

module CreateVocabulary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_vocabulary_request) ->
    let input = Serializers.create_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.CreateVocabulary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_vocabulary_response_of_yojson
      ~error_deserializer
      
end

module CreateMedicalVocabulary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_medical_vocabulary_request) ->
    let input = Serializers.create_medical_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.CreateMedicalVocabulary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_medical_vocabulary_response_of_yojson
      ~error_deserializer
      
end

module CreateLanguageModel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_language_model_request) ->
    let input = Serializers.create_language_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.CreateLanguageModel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_language_model_response_of_yojson
      ~error_deserializer
      
end

module CreateCallAnalyticsCategory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.transcribe", "BadRequestException" ->
         (`BadRequestException (bad_request_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "InternalFailureException" ->
         (`InternalFailureException (internal_failure_exception_of_yojson tree path))
      | "com.amazonaws.transcribe", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_call_analytics_category_request) ->
    let input = Serializers.create_call_analytics_category_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Transcribe.CreateCallAnalyticsCategory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_call_analytics_category_response_of_yojson
      ~error_deserializer
      
end

