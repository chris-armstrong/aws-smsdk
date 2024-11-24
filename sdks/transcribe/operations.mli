open Types 
module CreateCallAnalyticsCategory : sig
  val request :
    Smaws_Lib.Context.t ->
      create_call_analytics_category_request ->
        (create_call_analytics_category_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module CreateLanguageModel : sig
  val request :
    Smaws_Lib.Context.t ->
      create_language_model_request ->
        (create_language_model_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module CreateMedicalVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      create_medical_vocabulary_request ->
        (create_medical_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module CreateVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vocabulary_request ->
        (create_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module CreateVocabularyFilter : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vocabulary_filter_request ->
        (create_vocabulary_filter_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module DeleteCallAnalyticsCategory : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_call_analytics_category_request ->
        (delete_call_analytics_category_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module DeleteCallAnalyticsJob : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_call_analytics_job_request ->
        (delete_call_analytics_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module DeleteLanguageModel : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_language_model_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module DeleteMedicalScribeJob : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_scribe_job_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module DeleteMedicalTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_transcription_job_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module DeleteMedicalVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_medical_vocabulary_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module DeleteTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_transcription_job_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module DeleteVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vocabulary_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module DeleteVocabularyFilter : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vocabulary_filter_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module DescribeLanguageModel : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_language_model_request ->
        (describe_language_model_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GetCallAnalyticsCategory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_call_analytics_category_request ->
        (get_call_analytics_category_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GetCallAnalyticsJob : sig
  val request :
    Smaws_Lib.Context.t ->
      get_call_analytics_job_request ->
        (get_call_analytics_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GetMedicalScribeJob : sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_scribe_job_request ->
        (get_medical_scribe_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GetMedicalTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_transcription_job_request ->
        (get_medical_transcription_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GetMedicalVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_medical_vocabulary_request ->
        (get_medical_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GetTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      get_transcription_job_request ->
        (get_transcription_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GetVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_vocabulary_request ->
        (get_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GetVocabularyFilter : sig
  val request :
    Smaws_Lib.Context.t ->
      get_vocabulary_filter_request ->
        (get_vocabulary_filter_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module ListCallAnalyticsCategories : sig
  val request :
    Smaws_Lib.Context.t ->
      list_call_analytics_categories_request ->
        (list_call_analytics_categories_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListCallAnalyticsJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_call_analytics_jobs_request ->
        (list_call_analytics_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListLanguageModels : sig
  val request :
    Smaws_Lib.Context.t ->
      list_language_models_request ->
        (list_language_models_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListMedicalScribeJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_scribe_jobs_request ->
        (list_medical_scribe_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListMedicalTranscriptionJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_transcription_jobs_request ->
        (list_medical_transcription_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListMedicalVocabularies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_medical_vocabularies_request ->
        (list_medical_vocabularies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module ListTranscriptionJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_transcription_jobs_request ->
        (list_transcription_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListVocabularies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vocabularies_request ->
        (list_vocabularies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListVocabularyFilters : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vocabulary_filters_request ->
        (list_vocabulary_filters_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module StartCallAnalyticsJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_call_analytics_job_request ->
        (start_call_analytics_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module StartMedicalScribeJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_medical_scribe_job_request ->
        (start_medical_scribe_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module StartMedicalTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_medical_transcription_job_request ->
        (start_medical_transcription_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module StartTranscriptionJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_transcription_job_request ->
        (start_transcription_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module UpdateCallAnalyticsCategory : sig
  val request :
    Smaws_Lib.Context.t ->
      update_call_analytics_category_request ->
        (update_call_analytics_category_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module UpdateMedicalVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      update_medical_vocabulary_request ->
        (update_medical_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module UpdateVocabulary : sig
  val request :
    Smaws_Lib.Context.t ->
      update_vocabulary_request ->
        (update_vocabulary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `ConflictException of conflict_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module UpdateVocabularyFilter : sig
  val request :
    Smaws_Lib.Context.t ->
      update_vocabulary_filter_request ->
        (update_vocabulary_filter_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BadRequestException of bad_request_exception
            | `InternalFailureException of internal_failure_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

