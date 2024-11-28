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
  (** 
    Creates a new Call Analytics category.
    
     All categories are automatically applied to your Call Analytics transcriptions. Note that in order to apply categories to your transcriptions, you must create them before submitting your transcription request, as categories cannot be applied retroactively.
     
      When creating a new category, you can use the [InputType] parameter to label the category as a [POST_CALL] or a [REAL_TIME] category. [POST_CALL] categories can only be applied to post-call transcriptions and [REAL_TIME] categories can only be applied to real-time transcriptions. If you do not include [InputType], your category is created as a [POST_CALL] category by default.
      
       Call Analytics categories are composed of rules. For each category, you must create between 1 and 20 rules. Rules can include these parameters: , , , and .
       
        To update an existing category, see .
        
         To learn more about Call Analytics categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.
          *)

  
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
  (** 
    Creates a new custom language model.
    
     When creating a new custom language model, you must specify:
     
      {ul
           {- If you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband (audio sample rates under 16,000 Hz) base model
              
              }
            {- The location of your training and tuning files (this must be an Amazon S3 URI)
               
               }
            {- The language of your model
               
               }
            {- A unique name for your model
               
               }
           
      }
       *)

  
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
  (** 
    Creates a new custom medical vocabulary.
    
     Before creating a new custom medical vocabulary, you must first upload a text file that contains your vocabulary table into an Amazon S3 bucket. Note that this differs from , where you can include a list of terms within your request using the [Phrases] flag; [CreateMedicalVocabulary] does not support the [Phrases] flag and only accepts vocabularies in table format.
     
      Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.
      
       For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html}Custom vocabularies}.
        *)

  
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
  (** 
    Creates a new custom vocabulary.
    
     When creating a new custom vocabulary, you can either upload a text file that contains your new entries, phrases, and terms into an Amazon S3 bucket and include the URI in your request. Or you can include a list of terms directly in your request using the [Phrases] flag.
     
      Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.
      
       For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html}Custom vocabularies}.
        *)

  
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
  (** 
    Creates a new custom vocabulary filter.
    
     You can use custom vocabulary filters to mask, delete, or flag specific words from your transcript. Custom vocabulary filters are commonly used to mask profanity in transcripts.
     
      Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html}Character Sets for Custom Vocabularies} to get the character set for your language.
      
       For more information, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html}Vocabulary filtering}.
        *)

  
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
  (** 
    Deletes a Call Analytics category. To use this operation, specify the name of the category you want to delete using [CategoryName]. Category names are case sensitive.
     *)

  
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
  (** 
    Deletes a Call Analytics job. To use this operation, specify the name of the job you want to delete using [CallAnalyticsJobName]. Job names are case sensitive.
     *)

  
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
  (** 
    Deletes a custom language model. To use this operation, specify the name of the language model you want to delete using [ModelName]. custom language model names are case sensitive.
     *)

  
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
  (** 
    Deletes a Medical Scribe job. To use this operation, specify the name of the job you want to delete using [MedicalScribeJobName]. Job names are case sensitive.
     *)

  
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
  (** 
    Deletes a medical transcription job. To use this operation, specify the name of the job you want to delete using [MedicalTranscriptionJobName]. Job names are case sensitive.
     *)

  
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
  (** 
    Deletes a custom medical vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using [VocabularyName]. Custom vocabulary names are case sensitive.
     *)

  
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
  (** 
    Deletes a transcription job. To use this operation, specify the name of the job you want to delete using [TranscriptionJobName]. Job names are case sensitive.
     *)

  
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
  (** 
    Deletes a custom vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using [VocabularyName]. Custom vocabulary names are case sensitive.
     *)

  
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
  (** 
    Deletes a custom vocabulary filter. To use this operation, specify the name of the custom vocabulary filter you want to delete using [VocabularyFilterName]. Custom vocabulary filter names are case sensitive.
     *)

  
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
  (** 
    Provides information about the specified custom language model.
    
     This operation also shows if the base language model that you used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model.
     
      If you tried to create a new custom language model and the request wasn't successful, you can use [DescribeLanguageModel] to help identify the reason for this failure.
       *)

  
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
  (** 
    Provides information about the specified Call Analytics category.
    
     To get a list of your Call Analytics categories, use the operation.
      *)

  
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
  (** 
    Provides information about the specified Call Analytics job.
    
     To view the job's status, refer to [CallAnalyticsJobStatus]. If the status is [COMPLETED], the job is finished. You can find your completed transcript at the URI specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.
     
      If you enabled personally identifiable information (PII) redaction, the redacted transcript appears at the location specified in [RedactedTranscriptFileUri].
      
       If you chose to redact the audio in your media file, you can find your redacted media file at the location specified in [RedactedMediaFileUri].
       
        To get a list of your Call Analytics jobs, use the operation.
         *)

  
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
  (** 
    Provides information about the specified Medical Scribe job.
    
     To view the status of the specified medical transcription job, check the [MedicalScribeJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [MedicalScribeOutput]. If the status is [FAILED], [FailureReason] provides details on why your Medical Scribe job failed.
     
      To get a list of your Medical Scribe jobs, use the operation.
       *)

  
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
  (** 
    Provides information about the specified medical transcription job.
    
     To view the status of the specified medical transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.
     
      To get a list of your medical transcription jobs, use the operation.
       *)

  
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
  (** 
    Provides information about the specified custom medical vocabulary.
    
     To view the status of the specified custom medical vocabulary, check the [VocabularyState] field. If the status is [READY], your custom vocabulary is available to use. If the status is [FAILED], [FailureReason] provides details on why your vocabulary failed.
     
      To get a list of your custom medical vocabularies, use the operation.
       *)

  
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
  (** 
    Provides information about the specified transcription job.
    
     To view the status of the specified transcription job, check the [TranscriptionJobStatus] field. If the status is [COMPLETED], the job is finished. You can find the results at the location specified in [TranscriptFileUri]. If the status is [FAILED], [FailureReason] provides details on why your transcription job failed.
     
      If you enabled content redaction, the redacted transcript can be found at the location specified in [RedactedTranscriptFileUri].
      
       To get a list of your transcription jobs, use the operation.
        *)

  
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
  (** 
    Provides information about the specified custom vocabulary.
    
     To view the status of the specified custom vocabulary, check the [VocabularyState] field. If the status is [READY], your custom vocabulary is available to use. If the status is [FAILED], [FailureReason] provides details on why your custom vocabulary failed.
     
      To get a list of your custom vocabularies, use the operation.
       *)

  
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
  (** 
    Provides information about the specified custom vocabulary filter.
    
     To get a list of your custom vocabulary filters, use the operation.
      *)

  
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
  (** 
    Provides a list of Call Analytics categories, including all rules that make up each category.
    
     To get detailed information about a specific Call Analytics category, use the operation.
      *)

  
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
  (** 
    Provides a list of Call Analytics jobs that match the specified criteria. If no criteria are specified, all Call Analytics jobs are returned.
    
     To get detailed information about a specific Call Analytics job, use the operation.
      *)

  
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
  (** 
    Provides a list of custom language models that match the specified criteria. If no criteria are specified, all custom language models are returned.
    
     To get detailed information about a specific custom language model, use the operation.
      *)

  
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
  (** 
    Provides a list of Medical Scribe jobs that match the specified criteria. If no criteria are specified, all Medical Scribe jobs are returned.
    
     To get detailed information about a specific Medical Scribe job, use the operation.
      *)

  
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
  (** 
    Provides a list of medical transcription jobs that match the specified criteria. If no criteria are specified, all medical transcription jobs are returned.
    
     To get detailed information about a specific medical transcription job, use the operation.
      *)

  
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
  (** 
    Provides a list of custom medical vocabularies that match the specified criteria. If no criteria are specified, all custom medical vocabularies are returned.
    
     To get detailed information about a specific custom medical vocabulary, use the operation.
      *)

  
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
  (** 
    Lists all tags associated with the specified transcription job, vocabulary, model, or resource.
    
     To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.
      *)

  
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
  (** 
    Provides a list of transcription jobs that match the specified criteria. If no criteria are specified, all transcription jobs are returned.
    
     To get detailed information about a specific transcription job, use the operation.
      *)

  
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
  (** 
    Provides a list of custom vocabularies that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.
    
     To get detailed information about a specific custom vocabulary, use the operation.
      *)

  
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
  (** 
    Provides a list of custom vocabulary filters that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.
    
     To get detailed information about a specific custom vocabulary filter, use the operation.
      *)

  
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
  (** 
    Transcribes the audio from a customer service call and applies any additional Request Parameters you choose to include in your request.
    
     In addition to many standard transcription features, Call Analytics provides you with call characteristics, call summarization, speaker sentiment, and optional redaction of your text transcript and your audio file. You can also apply custom categories to flag specified conditions. To learn more about these features and insights, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html}Analyzing call center audio with Call Analytics}.
     
      If you want to apply categories to your Call Analytics job, you must create them before submitting your job request. Categories cannot be retroactively applied to a job. To create a new category, use the operation. To learn more about Call Analytics categories, see {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html}Creating categories for post-call transcriptions} and {{:https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html}Creating categories for real-time transcriptions}.
      
       To make a [StartCallAnalyticsJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
       
        Note that job queuing is enabled by default for Call Analytics jobs.
        
         You must include the following parameters in your [StartCallAnalyticsJob] request:
         
          {ul
               {- [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.
                  
                  }
                {- [CallAnalyticsJobName]: A custom name that you create for your transcription job that's unique within your Amazon Web Services account.
                   
                   }
                {- [DataAccessRoleArn]: The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files.
                   
                   }
                {- [Media] ([MediaFileUri] or [RedactedMediaFileUri]): The Amazon S3 location of your media file.
                   
                   }
               
      }
       With Call Analytics, you can redact the audio contained in your media file by including [RedactedMediaFileUri], instead of [MediaFileUri], to specify the location of your input audio. If you choose to redact your audio, you can find your redacted media at the location specified in the [RedactedMediaFileUri] field of your response.
       
        *)

  
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
  (** 
    Transcribes patient-clinician conversations and generates clinical notes.
    
     Amazon Web Services HealthScribe automatically provides rich conversation transcripts, identifies speaker roles, classifies dialogues, extracts medical terms, and generates preliminary clinical notes. To learn more about these features, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe.html}Amazon Web Services HealthScribe}.
     
      To make a [StartMedicalScribeJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
      
       You must include the following parameters in your [StartMedicalTranscriptionJob] request:
       
        {ul
             {- [DataAccessRoleArn]: The ARN of an IAM role with the these minimum permissions: read permission on input file Amazon S3 bucket specified in [Media], write permission on the Amazon S3 bucket specified in [OutputBucketName], and full permissions on the KMS key specified in [OutputEncryptionKMSKeyId] (if set). The role should also allow [transcribe.amazonaws.com] to assume it.
                
                }
              {- [Media] ([MediaFileUri]): The Amazon S3 location of your media file.
                 
                 }
              {- [MedicalScribeJobName]: A custom name you create for your MedicalScribe job that is unique within your Amazon Web Services account.
                 
                 }
              {- [OutputBucketName]: The Amazon S3 bucket where you want your output files stored.
                 
                 }
              {- [Settings]: A [MedicalScribeSettings] obect that must set exactly one of [ShowSpeakerLabels] or [ChannelIdentification] to true. If [ShowSpeakerLabels] is true, [MaxSpeakerLabels] must also be set.
                 
                 }
              {- [ChannelDefinitions]: A [MedicalScribeChannelDefinitions] array should be set if and only if the [ChannelIdentification] value of [Settings] is set to true.
                 
                 }
             
      }
       *)

  
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
  (** 
    Transcribes the audio from a medical dictation or conversation and applies any additional Request Parameters you choose to include in your request.
    
     In addition to many standard transcription features, Amazon Transcribe Medical provides you with a robust medical vocabulary and, optionally, content identification, which adds flags to personal health information (PHI). To learn more about these features, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works-med.html}How Amazon Transcribe Medical works}.
     
      To make a [StartMedicalTranscriptionJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
      
       You must include the following parameters in your [StartMedicalTranscriptionJob] request:
       
        {ul
             {- [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.
                
                }
              {- [MedicalTranscriptionJobName]: A custom name you create for your transcription job that is unique within your Amazon Web Services account.
                 
                 }
              {- [Media] ([MediaFileUri]): The Amazon S3 location of your media file.
                 
                 }
              {- [LanguageCode]: This must be [en-US].
                 
                 }
              {- [OutputBucketName]: The Amazon S3 bucket where you want your transcript stored. If you want your output stored in a sub-folder of this bucket, you must also include [OutputKey].
                 
                 }
              {- [Specialty]: This must be [PRIMARYCARE].
                 
                 }
              {- [Type]: Choose whether your audio is a conversation or a dictation.
                 
                 }
             
      }
       *)

  
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
  (** 
    Transcribes the audio from a media file and applies any additional Request Parameters you choose to include in your request.
    
     To make a [StartTranscriptionJob] request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the [Media] parameter.
     
      You must include the following parameters in your [StartTranscriptionJob] request:
      
       {ul
            {- [region]: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/general/latest/gr/transcribe.html}Amazon Transcribe endpoints and quotas}.
               
               }
             {- [TranscriptionJobName]: A custom name you create for your transcription job that is unique within your Amazon Web Services account.
                
                }
             {- [Media] ([MediaFileUri]): The Amazon S3 location of your media file.
                
                }
             {- One of [LanguageCode], [IdentifyLanguage], or [IdentifyMultipleLanguages]: If you know the language of your media file, specify it using the [LanguageCode] parameter; you can find all valid language codes in the {{:https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html}Supported languages} table. If you do not know the languages spoken in your media, use either [IdentifyLanguage] or [IdentifyMultipleLanguages] and let Amazon Transcribe identify the languages for you.
                
                }
            
      }
       *)

  
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
  (** 
    Adds one or more custom tags, each in the form of a key:value pair, to the specified resource.
    
     To learn more about using tags with Amazon Transcribe, refer to {{:https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html}Tagging resources}.
      *)

  
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
  (** 
    Removes the specified tags from the specified Amazon Transcribe resource.
    
     If you include [UntagResource] in your request, you must also include [ResourceArn] and [TagKeys].
      *)

  
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
  (** 
    Updates the specified Call Analytics category with new rules. Note that the [UpdateCallAnalyticsCategory] operation overwrites all existing rules contained in the specified category. You cannot append additional rules onto an existing category.
    
     To create a new category, see .
      *)

  
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
  (** 
    Updates an existing custom medical vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.
     *)

  
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
  (** 
    Updates an existing custom vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.
     *)

  
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
  (** 
    Updates an existing custom vocabulary filter with a new list of words. The new list you provide overwrites all previous entries; you cannot append new terms onto an existing custom vocabulary filter.
     *)

  
end

