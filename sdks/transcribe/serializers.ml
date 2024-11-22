open Smaws_Lib.Json.SerializeHelpers

open Types

let word_to_yojson = string_to_yojson

let words_to_yojson = fun tree -> list_to_yojson word_to_yojson tree

let base_unit_to_yojson = unit_to_yojson

let vocabulary_state_to_yojson = 
  fun (x: vocabulary_state) -> match x with 
 
| FAILED -> `String "FAILED"
  | READY -> `String "READY"
  | PENDING -> `String "PENDING"
   

let vocabulary_name_to_yojson = string_to_yojson

let language_code_to_yojson = 
  fun (x: language_code) -> match x with 
 
| ZU_ZA -> `String "zu-ZA"
  | WO_SN -> `String "wo-SN"
  | UZ_UZ -> `String "uz-UZ"
  | UK_UA -> `String "uk-UA"
  | UG_CN -> `String "ug-CN"
  | TT_RU -> `String "tt-RU"
  | TL_PH -> `String "tl-PH"
  | SW_UG -> `String "sw-UG"
  | SW_TZ -> `String "sw-TZ"
  | SW_RW -> `String "sw-RW"
  | SW_KE -> `String "sw-KE"
  | SW_BI -> `String "sw-BI"
  | SU_ID -> `String "su-ID"
  | SR_RS -> `String "sr-RS"
  | SO_SO -> `String "so-SO"
  | SL_SI -> `String "sl-SI"
  | SK_SK -> `String "sk-SK"
  | SI_LK -> `String "si-LK"
  | RW_RW -> `String "rw-RW"
  | RO_RO -> `String "ro-RO"
  | PS_AF -> `String "ps-AF"
  | PL_PL -> `String "pl-PL"
  | PA_IN -> `String "pa-IN"
  | OR_IN -> `String "or-IN"
  | NO_NO -> `String "no-NO"
  | MT_MT -> `String "mt-MT"
  | MR_IN -> `String "mr-IN"
  | MN_MN -> `String "mn-MN"
  | ML_IN -> `String "ml-IN"
  | MK_MK -> `String "mk-MK"
  | MI_NZ -> `String "mi-NZ"
  | MHR_RU -> `String "mhr-RU"
  | LV_LV -> `String "lv-LV"
  | LT_LT -> `String "lt-LT"
  | LG_IN -> `String "lg-IN"
  | KY_KG -> `String "ky-KG"
  | KN_IN -> `String "kn-IN"
  | KK_KZ -> `String "kk-KZ"
  | KAB_DZ -> `String "kab-DZ"
  | KA_GE -> `String "ka-GE"
  | IS_IS -> `String "is-IS"
  | HY_AM -> `String "hy-AM"
  | HU_HU -> `String "hu-HU"
  | HR_HR -> `String "hr-HR"
  | HA_NG -> `String "ha-NG"
  | GU_IN -> `String "gu-IN"
  | GL_ES -> `String "gl-ES"
  | FI_FI -> `String "fi-FI"
  | EU_ES -> `String "eu-ES"
  | ET_ET -> `String "et-ET"
  | EL_GR -> `String "el-GR"
  | CY_WL -> `String "cy-WL"
  | CS_CZ -> `String "cs-CZ"
  | CKB_IR -> `String "ckb-IR"
  | CKB_IQ -> `String "ckb-IQ"
  | CA_ES -> `String "ca-ES"
  | BS_BA -> `String "bs-BA"
  | BN_IN -> `String "bn-IN"
  | BG_BG -> `String "bg-BG"
  | BE_BY -> `String "be-BY"
  | BA_RU -> `String "ba-RU"
  | AZ_AZ -> `String "az-AZ"
  | AST_ES -> `String "ast-ES"
  | AB_GE -> `String "ab-GE"
  | SV_SE -> `String "sv-SE"
  | VI_VN -> `String "vi-VN"
  | EN_NZ -> `String "en-NZ"
  | EN_ZA -> `String "en-ZA"
  | TH_TH -> `String "th-TH"
  | ZH_TW -> `String "zh-TW"
  | ZH_CN -> `String "zh-CN"
  | TR_TR -> `String "tr-TR"
  | TE_IN -> `String "te-IN"
  | TA_IN -> `String "ta-IN"
  | RU_RU -> `String "ru-RU"
  | PT_PT -> `String "pt-PT"
  | PT_BR -> `String "pt-BR"
  | NL_NL -> `String "nl-NL"
  | MS_MY -> `String "ms-MY"
  | KO_KR -> `String "ko-KR"
  | JA_JP -> `String "ja-JP"
  | IT_IT -> `String "it-IT"
  | ID_ID -> `String "id-ID"
  | HI_IN -> `String "hi-IN"
  | HE_IL -> `String "he-IL"
  | FR_FR -> `String "fr-FR"
  | FR_CA -> `String "fr-CA"
  | FA_IR -> `String "fa-IR"
  | ES_US -> `String "es-US"
  | ES_ES -> `String "es-ES"
  | EN_WL -> `String "en-WL"
  | EN_US -> `String "en-US"
  | EN_IN -> `String "en-IN"
  | EN_IE -> `String "en-IE"
  | EN_GB -> `String "en-GB"
  | EN_AU -> `String "en-AU"
  | EN_AB -> `String "en-AB"
  | DE_DE -> `String "de-DE"
  | DE_CH -> `String "de-CH"
  | DA_DK -> `String "da-DK"
  | AR_SA -> `String "ar-SA"
  | AR_AE -> `String "ar-AE"
  | AF_ZA -> `String "af-ZA"
   

let date_time_to_yojson = timestamp_to_yojson

let vocabulary_info_to_yojson = 
  fun (x: vocabulary_info) -> assoc_to_yojson(
    [(
         "VocabularyState",
         (option_to_yojson vocabulary_state_to_yojson x.vocabulary_state));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       
  ])

let vocabulary_filter_name_to_yojson = string_to_yojson

let vocabulary_filter_info_to_yojson = 
  fun (x: vocabulary_filter_info) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyFilterName",
         (option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name));
       
  ])

let vocabulary_filters_to_yojson = 
  fun tree -> list_to_yojson vocabulary_filter_info_to_yojson tree

let vocabulary_filter_method_to_yojson = 
  fun (x: vocabulary_filter_method) -> match x with 
 
| TAG -> `String "tag"
  | MASK -> `String "mask"
  | REMOVE -> `String "remove"
   

let vocabularies_to_yojson = 
  fun tree -> list_to_yojson vocabulary_info_to_yojson tree

let uri_to_yojson = string_to_yojson

let update_vocabulary_response_to_yojson = 
  fun (x: update_vocabulary_response) -> assoc_to_yojson(
    [(
         "VocabularyState",
         (option_to_yojson vocabulary_state_to_yojson x.vocabulary_state));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       
  ])

let phrase_to_yojson = string_to_yojson

let phrases_to_yojson = fun tree -> list_to_yojson phrase_to_yojson tree

let data_access_role_arn_to_yojson = string_to_yojson

let update_vocabulary_request_to_yojson = 
  fun (x: update_vocabulary_request) -> assoc_to_yojson(
    [(
         "DataAccessRoleArn",
         (option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn));
       (
         "VocabularyFileUri",
         (option_to_yojson uri_to_yojson x.vocabulary_file_uri));
       (
         "Phrases",
         (option_to_yojson phrases_to_yojson x.phrases));
       (
         "LanguageCode",
         (Some (language_code_to_yojson x.language_code)));
       (
         "VocabularyName",
         (Some (vocabulary_name_to_yojson x.vocabulary_name)));
       
  ])

let update_vocabulary_filter_response_to_yojson = 
  fun (x: update_vocabulary_filter_response) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyFilterName",
         (option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name));
       
  ])

let update_vocabulary_filter_request_to_yojson = 
  fun (x: update_vocabulary_filter_request) -> assoc_to_yojson(
    [(
         "DataAccessRoleArn",
         (option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn));
       (
         "VocabularyFilterFileUri",
         (option_to_yojson uri_to_yojson x.vocabulary_filter_file_uri));
       (
         "Words",
         (option_to_yojson words_to_yojson x.words));
       (
         "VocabularyFilterName",
         (Some (vocabulary_filter_name_to_yojson x.vocabulary_filter_name)));
       
  ])

let string__to_yojson = string_to_yojson

let not_found_exception_to_yojson = 
  fun (x: not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let internal_failure_exception_to_yojson = 
  fun (x: internal_failure_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let failure_reason_to_yojson = string_to_yojson

let bad_request_exception_to_yojson = 
  fun (x: bad_request_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson failure_reason_to_yojson x.message));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_medical_vocabulary_response_to_yojson = 
  fun (x: update_medical_vocabulary_response) -> assoc_to_yojson(
    [(
         "VocabularyState",
         (option_to_yojson vocabulary_state_to_yojson x.vocabulary_state));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       
  ])

let update_medical_vocabulary_request_to_yojson = 
  fun (x: update_medical_vocabulary_request) -> assoc_to_yojson(
    [(
         "VocabularyFileUri",
         (Some (uri_to_yojson x.vocabulary_file_uri)));
       (
         "LanguageCode",
         (Some (language_code_to_yojson x.language_code)));
       (
         "VocabularyName",
         (Some (vocabulary_name_to_yojson x.vocabulary_name)));
       
  ])

let category_name_to_yojson = string_to_yojson

let timestamp_milliseconds_to_yojson = long_to_yojson

let absolute_time_range_to_yojson = 
  fun (x: absolute_time_range) -> assoc_to_yojson(
    [(
         "Last",
         (option_to_yojson timestamp_milliseconds_to_yojson x.last));
       (
         "First",
         (option_to_yojson timestamp_milliseconds_to_yojson x.first));
       (
         "EndTime",
         (option_to_yojson timestamp_milliseconds_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson timestamp_milliseconds_to_yojson x.start_time));
       
  ])

let percentage_to_yojson = int_to_yojson

let relative_time_range_to_yojson = 
  fun (x: relative_time_range) -> assoc_to_yojson(
    [(
         "Last",
         (option_to_yojson percentage_to_yojson x.last));
       (
         "First",
         (option_to_yojson percentage_to_yojson x.first));
       (
         "EndPercentage",
         (option_to_yojson percentage_to_yojson x.end_percentage));
       (
         "StartPercentage",
         (option_to_yojson percentage_to_yojson x.start_percentage));
       
  ])

let boolean__to_yojson = bool_to_yojson

let non_talk_time_filter_to_yojson = 
  fun (x: non_talk_time_filter) -> assoc_to_yojson(
    [(
         "Negate",
         (option_to_yojson boolean__to_yojson x.negate));
       (
         "RelativeTimeRange",
         (option_to_yojson relative_time_range_to_yojson x.relative_time_range));
       (
         "AbsoluteTimeRange",
         (option_to_yojson absolute_time_range_to_yojson x.absolute_time_range));
       (
         "Threshold",
         (option_to_yojson timestamp_milliseconds_to_yojson x.threshold));
       
  ])

let participant_role_to_yojson = 
  fun (x: participant_role) -> match x with 
  | CUSTOMER -> `String "CUSTOMER"
    | AGENT -> `String "AGENT"
     

let interruption_filter_to_yojson = 
  fun (x: interruption_filter) -> assoc_to_yojson(
    [(
         "Negate",
         (option_to_yojson boolean__to_yojson x.negate));
       (
         "RelativeTimeRange",
         (option_to_yojson relative_time_range_to_yojson x.relative_time_range));
       (
         "AbsoluteTimeRange",
         (option_to_yojson absolute_time_range_to_yojson x.absolute_time_range));
       (
         "ParticipantRole",
         (option_to_yojson participant_role_to_yojson x.participant_role));
       (
         "Threshold",
         (option_to_yojson timestamp_milliseconds_to_yojson x.threshold));
       
  ])

let transcript_filter_type_to_yojson = 
  fun (x: transcript_filter_type) -> match x with 
  | EXACT -> `String "EXACT"
     

let non_empty_string_to_yojson = string_to_yojson

let string_target_list_to_yojson = 
  fun tree -> list_to_yojson non_empty_string_to_yojson tree

let transcript_filter_to_yojson = 
  fun (x: transcript_filter) -> assoc_to_yojson(
    [(
         "Targets",
         (Some (string_target_list_to_yojson x.targets)));
       (
         "Negate",
         (option_to_yojson boolean__to_yojson x.negate));
       (
         "ParticipantRole",
         (option_to_yojson participant_role_to_yojson x.participant_role));
       (
         "RelativeTimeRange",
         (option_to_yojson relative_time_range_to_yojson x.relative_time_range));
       (
         "AbsoluteTimeRange",
         (option_to_yojson absolute_time_range_to_yojson x.absolute_time_range));
       (
         "TranscriptFilterType",
         (Some (transcript_filter_type_to_yojson x.transcript_filter_type)));
       
  ])

let sentiment_value_to_yojson = 
  fun (x: sentiment_value) -> match x with 
 
| MIXED -> `String "MIXED"
  | NEUTRAL -> `String "NEUTRAL"
  | NEGATIVE -> `String "NEGATIVE"
  | POSITIVE -> `String "POSITIVE"
   

let sentiment_value_list_to_yojson = 
  fun tree -> list_to_yojson sentiment_value_to_yojson tree

let sentiment_filter_to_yojson = 
  fun (x: sentiment_filter) -> assoc_to_yojson(
    [(
         "Negate",
         (option_to_yojson boolean__to_yojson x.negate));
       (
         "ParticipantRole",
         (option_to_yojson participant_role_to_yojson x.participant_role));
       (
         "RelativeTimeRange",
         (option_to_yojson relative_time_range_to_yojson x.relative_time_range));
       (
         "AbsoluteTimeRange",
         (option_to_yojson absolute_time_range_to_yojson x.absolute_time_range));
       (
         "Sentiments",
         (Some (sentiment_value_list_to_yojson x.sentiments)));
       
  ])

let rule_to_yojson = 
  fun (x: rule) -> 
  match x with 
    | SentimentFilter(arg) -> assoc_to_yojson ["SentimentFilter", Some (sentiment_filter_to_yojson arg)]
      | TranscriptFilter(arg) -> assoc_to_yojson ["TranscriptFilter", Some (transcript_filter_to_yojson arg)]
      | InterruptionFilter(arg) -> assoc_to_yojson ["InterruptionFilter", Some (interruption_filter_to_yojson arg)]
      | NonTalkTimeFilter(arg) -> assoc_to_yojson ["NonTalkTimeFilter", Some (non_talk_time_filter_to_yojson arg)]
      
      
    

let rule_list_to_yojson = fun tree -> list_to_yojson rule_to_yojson tree

let input_type_to_yojson = 
  fun (x: input_type) -> match x with 
  | POST_CALL -> `String "POST_CALL"
    | REAL_TIME -> `String "REAL_TIME"
     

let category_properties_to_yojson = 
  fun (x: category_properties) -> assoc_to_yojson(
    [(
         "InputType",
         (option_to_yojson input_type_to_yojson x.input_type));
       (
         "LastUpdateTime",
         (option_to_yojson date_time_to_yojson x.last_update_time));
       (
         "CreateTime",
         (option_to_yojson date_time_to_yojson x.create_time));
       (
         "Rules",
         (option_to_yojson rule_list_to_yojson x.rules));
       (
         "CategoryName",
         (option_to_yojson category_name_to_yojson x.category_name));
       
  ])

let update_call_analytics_category_response_to_yojson = 
  fun (x: update_call_analytics_category_response) -> assoc_to_yojson(
    [(
         "CategoryProperties",
         (option_to_yojson category_properties_to_yojson x.category_properties));
       
  ])

let update_call_analytics_category_request_to_yojson = 
  fun (x: update_call_analytics_category_request) -> assoc_to_yojson(
    [(
         "InputType",
         (option_to_yojson input_type_to_yojson x.input_type));
       (
         "Rules",
         (Some (rule_list_to_yojson x.rules)));
       (
         "CategoryName",
         (Some (category_name_to_yojson x.category_name)));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let transcribe_arn_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceArn",
         (Some (transcribe_arn_to_yojson x.resource_arn)));
       
  ])

let type__to_yojson = 
  fun (x: type_) -> match x with 
 
| DICTATION -> `String "DICTATION"
  | CONVERSATION -> `String "CONVERSATION"
   

let transcription_job_name_to_yojson = string_to_yojson

let transcription_job_status_to_yojson = 
  fun (x: transcription_job_status) -> match x with 
 
| COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | QUEUED -> `String "QUEUED"
   

let output_location_type_to_yojson = 
  fun (x: output_location_type) -> match x with 
 
| SERVICE_BUCKET -> `String "SERVICE_BUCKET"
  | CUSTOMER_BUCKET -> `String "CUSTOMER_BUCKET"
   

let redaction_type_to_yojson = 
  fun (x: redaction_type) -> match x with 
  | PII -> `String "PII"
     

let redaction_output_to_yojson = 
  fun (x: redaction_output) -> match x with 
 
| REDACTED_AND_UNREDACTED -> `String "redacted_and_unredacted"
  | REDACTED -> `String "redacted"
   

let pii_entity_type_to_yojson = 
  fun (x: pii_entity_type) -> match x with 
 
| ALL -> `String "ALL"
  | SSN -> `String "SSN"
  | PHONE -> `String "PHONE"
  | NAME -> `String "NAME"
  | ADDRESS -> `String "ADDRESS"
  | EMAIL -> `String "EMAIL"
  | PIN -> `String "PIN"
  | CREDIT_DEBIT_EXPIRY -> `String "CREDIT_DEBIT_EXPIRY"
  | CREDIT_DEBIT_CVV -> `String "CREDIT_DEBIT_CVV"
  | CREDIT_DEBIT_NUMBER -> `String "CREDIT_DEBIT_NUMBER"
  | BANK_ROUTING -> `String "BANK_ROUTING"
  | BANK_ACCOUNT_NUMBER -> `String "BANK_ACCOUNT_NUMBER"
   

let pii_entity_types_to_yojson = 
  fun tree -> list_to_yojson pii_entity_type_to_yojson tree

let content_redaction_to_yojson = 
  fun (x: content_redaction) -> assoc_to_yojson(
    [(
         "PiiEntityTypes",
         (option_to_yojson pii_entity_types_to_yojson x.pii_entity_types));
       (
         "RedactionOutput",
         (Some (redaction_output_to_yojson x.redaction_output)));
       (
         "RedactionType",
         (Some (redaction_type_to_yojson x.redaction_type)));
       
  ])

let model_name_to_yojson = string_to_yojson

let model_settings_to_yojson = 
  fun (x: model_settings) -> assoc_to_yojson(
    [(
         "LanguageModelName",
         (option_to_yojson model_name_to_yojson x.language_model_name));
       
  ])

let identified_language_score_to_yojson = float_to_yojson

let duration_in_seconds_to_yojson = float_to_yojson

let language_code_item_to_yojson = 
  fun (x: language_code_item) -> assoc_to_yojson(
    [(
         "DurationInSeconds",
         (option_to_yojson duration_in_seconds_to_yojson x.duration_in_seconds));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       
  ])

let language_code_list_to_yojson = 
  fun tree -> list_to_yojson language_code_item_to_yojson tree

let toxicity_category_to_yojson = 
  fun (x: toxicity_category) -> match x with 
  | ALL -> `String "ALL"
     

let toxicity_categories_to_yojson = 
  fun tree -> list_to_yojson toxicity_category_to_yojson tree

let toxicity_detection_settings_to_yojson = 
  fun (x: toxicity_detection_settings) -> assoc_to_yojson(
    [(
         "ToxicityCategories",
         (Some (toxicity_categories_to_yojson x.toxicity_categories)));
       
  ])

let toxicity_detection_to_yojson = 
  fun tree -> list_to_yojson toxicity_detection_settings_to_yojson tree

let transcription_job_summary_to_yojson = 
  fun (x: transcription_job_summary) -> assoc_to_yojson(
    [(
         "ToxicityDetection",
         (option_to_yojson toxicity_detection_to_yojson x.toxicity_detection));
       (
         "LanguageCodes",
         (option_to_yojson language_code_list_to_yojson x.language_codes));
       (
         "IdentifiedLanguageScore",
         (option_to_yojson identified_language_score_to_yojson x.identified_language_score));
       (
         "IdentifyMultipleLanguages",
         (option_to_yojson boolean__to_yojson x.identify_multiple_languages));
       (
         "IdentifyLanguage",
         (option_to_yojson boolean__to_yojson x.identify_language));
       (
         "ModelSettings",
         (option_to_yojson model_settings_to_yojson x.model_settings));
       (
         "ContentRedaction",
         (option_to_yojson content_redaction_to_yojson x.content_redaction));
       (
         "OutputLocationType",
         (option_to_yojson output_location_type_to_yojson x.output_location_type));
       (
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "TranscriptionJobStatus",
         (option_to_yojson transcription_job_status_to_yojson x.transcription_job_status));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "CompletionTime",
         (option_to_yojson date_time_to_yojson x.completion_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "CreationTime",
         (option_to_yojson date_time_to_yojson x.creation_time));
       (
         "TranscriptionJobName",
         (option_to_yojson transcription_job_name_to_yojson x.transcription_job_name));
       
  ])

let transcription_job_summaries_to_yojson = 
  fun tree -> list_to_yojson transcription_job_summary_to_yojson tree

let media_sample_rate_hertz_to_yojson = int_to_yojson

let media_format_to_yojson = 
  fun (x: media_format) -> match x with 
 
| M4A -> `String "m4a"
  | WEBM -> `String "webm"
  | AMR -> `String "amr"
  | OGG -> `String "ogg"
  | FLAC -> `String "flac"
  | WAV -> `String "wav"
  | MP4 -> `String "mp4"
  | MP3 -> `String "mp3"
   

let media_to_yojson = 
  fun (x: media) -> assoc_to_yojson(
    [(
         "RedactedMediaFileUri",
         (option_to_yojson uri_to_yojson x.redacted_media_file_uri));
       (
         "MediaFileUri",
         (option_to_yojson uri_to_yojson x.media_file_uri));
       
  ])

let transcript_to_yojson = 
  fun (x: transcript) -> assoc_to_yojson(
    [(
         "RedactedTranscriptFileUri",
         (option_to_yojson uri_to_yojson x.redacted_transcript_file_uri));
       (
         "TranscriptFileUri",
         (option_to_yojson uri_to_yojson x.transcript_file_uri));
       
  ])

let max_speakers_to_yojson = int_to_yojson

let max_alternatives_to_yojson = int_to_yojson

let settings_to_yojson = 
  fun (x: settings) -> assoc_to_yojson(
    [(
         "VocabularyFilterMethod",
         (option_to_yojson vocabulary_filter_method_to_yojson x.vocabulary_filter_method));
       (
         "VocabularyFilterName",
         (option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name));
       (
         "MaxAlternatives",
         (option_to_yojson max_alternatives_to_yojson x.max_alternatives));
       (
         "ShowAlternatives",
         (option_to_yojson boolean__to_yojson x.show_alternatives));
       (
         "ChannelIdentification",
         (option_to_yojson boolean__to_yojson x.channel_identification));
       (
         "MaxSpeakerLabels",
         (option_to_yojson max_speakers_to_yojson x.max_speaker_labels));
       (
         "ShowSpeakerLabels",
         (option_to_yojson boolean__to_yojson x.show_speaker_labels));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       
  ])

let job_execution_settings_to_yojson = 
  fun (x: job_execution_settings) -> assoc_to_yojson(
    [(
         "DataAccessRoleArn",
         (option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn));
       (
         "AllowDeferredExecution",
         (option_to_yojson boolean__to_yojson x.allow_deferred_execution));
       
  ])

let language_options_to_yojson = 
  fun tree -> list_to_yojson language_code_to_yojson tree

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (Some (tag_value_to_yojson x.value)));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let subtitle_format_to_yojson = 
  fun (x: subtitle_format) -> match x with 
  | SRT -> `String "srt"
    | VTT -> `String "vtt"
     

let subtitle_formats_to_yojson = 
  fun tree -> list_to_yojson subtitle_format_to_yojson tree

let subtitle_file_uris_to_yojson = 
  fun tree -> list_to_yojson uri_to_yojson tree

let subtitle_output_start_index_to_yojson = int_to_yojson

let subtitles_output_to_yojson = 
  fun (x: subtitles_output) -> assoc_to_yojson(
    [(
         "OutputStartIndex",
         (option_to_yojson subtitle_output_start_index_to_yojson x.output_start_index));
       (
         "SubtitleFileUris",
         (option_to_yojson subtitle_file_uris_to_yojson x.subtitle_file_uris));
       (
         "Formats",
         (option_to_yojson subtitle_formats_to_yojson x.formats));
       
  ])

let language_id_settings_to_yojson = 
  fun (x: language_id_settings) -> assoc_to_yojson(
    [(
         "LanguageModelName",
         (option_to_yojson model_name_to_yojson x.language_model_name));
       (
         "VocabularyFilterName",
         (option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       
  ])

let language_id_settings_map_to_yojson = 
  fun tree -> map_to_yojson language_id_settings_to_yojson tree

let transcription_job_to_yojson = 
  fun (x: transcription_job) -> assoc_to_yojson(
    [(
         "ToxicityDetection",
         (option_to_yojson toxicity_detection_to_yojson x.toxicity_detection));
       (
         "LanguageIdSettings",
         (option_to_yojson language_id_settings_map_to_yojson x.language_id_settings));
       (
         "Subtitles",
         (option_to_yojson subtitles_output_to_yojson x.subtitles));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "LanguageCodes",
         (option_to_yojson language_code_list_to_yojson x.language_codes));
       (
         "IdentifiedLanguageScore",
         (option_to_yojson identified_language_score_to_yojson x.identified_language_score));
       (
         "LanguageOptions",
         (option_to_yojson language_options_to_yojson x.language_options));
       (
         "IdentifyMultipleLanguages",
         (option_to_yojson boolean__to_yojson x.identify_multiple_languages));
       (
         "IdentifyLanguage",
         (option_to_yojson boolean__to_yojson x.identify_language));
       (
         "ContentRedaction",
         (option_to_yojson content_redaction_to_yojson x.content_redaction));
       (
         "JobExecutionSettings",
         (option_to_yojson job_execution_settings_to_yojson x.job_execution_settings));
       (
         "ModelSettings",
         (option_to_yojson model_settings_to_yojson x.model_settings));
       (
         "Settings",
         (option_to_yojson settings_to_yojson x.settings));
       (
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "CompletionTime",
         (option_to_yojson date_time_to_yojson x.completion_time));
       (
         "CreationTime",
         (option_to_yojson date_time_to_yojson x.creation_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "Transcript",
         (option_to_yojson transcript_to_yojson x.transcript));
       (
         "Media",
         (option_to_yojson media_to_yojson x.media));
       (
         "MediaFormat",
         (option_to_yojson media_format_to_yojson x.media_format));
       (
         "MediaSampleRateHertz",
         (option_to_yojson media_sample_rate_hertz_to_yojson x.media_sample_rate_hertz));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "TranscriptionJobStatus",
         (option_to_yojson transcription_job_status_to_yojson x.transcription_job_status));
       (
         "TranscriptionJobName",
         (option_to_yojson transcription_job_name_to_yojson x.transcription_job_name));
       
  ])

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceArn",
         (Some (transcribe_arn_to_yojson x.resource_arn)));
       
  ])

let start_transcription_job_response_to_yojson = 
  fun (x: start_transcription_job_response) -> assoc_to_yojson(
    [(
         "TranscriptionJob",
         (option_to_yojson transcription_job_to_yojson x.transcription_job));
       
  ])

let output_bucket_name_to_yojson = string_to_yojson

let output_key_to_yojson = string_to_yojson

let kms_key_id_to_yojson = string_to_yojson

let kms_encryption_context_map_to_yojson = 
  fun tree -> map_to_yojson non_empty_string_to_yojson tree

let subtitles_to_yojson = 
  fun (x: subtitles) -> assoc_to_yojson(
    [(
         "OutputStartIndex",
         (option_to_yojson subtitle_output_start_index_to_yojson x.output_start_index));
       (
         "Formats",
         (option_to_yojson subtitle_formats_to_yojson x.formats));
       
  ])

let start_transcription_job_request_to_yojson = 
  fun (x: start_transcription_job_request) -> assoc_to_yojson(
    [(
         "ToxicityDetection",
         (option_to_yojson toxicity_detection_to_yojson x.toxicity_detection));
       (
         "LanguageIdSettings",
         (option_to_yojson language_id_settings_map_to_yojson x.language_id_settings));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Subtitles",
         (option_to_yojson subtitles_to_yojson x.subtitles));
       (
         "LanguageOptions",
         (option_to_yojson language_options_to_yojson x.language_options));
       (
         "IdentifyMultipleLanguages",
         (option_to_yojson boolean__to_yojson x.identify_multiple_languages));
       (
         "IdentifyLanguage",
         (option_to_yojson boolean__to_yojson x.identify_language));
       (
         "ContentRedaction",
         (option_to_yojson content_redaction_to_yojson x.content_redaction));
       (
         "JobExecutionSettings",
         (option_to_yojson job_execution_settings_to_yojson x.job_execution_settings));
       (
         "ModelSettings",
         (option_to_yojson model_settings_to_yojson x.model_settings));
       (
         "Settings",
         (option_to_yojson settings_to_yojson x.settings));
       (
         "KMSEncryptionContext",
         (option_to_yojson kms_encryption_context_map_to_yojson x.kms_encryption_context));
       (
         "OutputEncryptionKMSKeyId",
         (option_to_yojson kms_key_id_to_yojson x.output_encryption_kms_key_id));
       (
         "OutputKey",
         (option_to_yojson output_key_to_yojson x.output_key));
       (
         "OutputBucketName",
         (option_to_yojson output_bucket_name_to_yojson x.output_bucket_name));
       (
         "Media",
         (Some (media_to_yojson x.media)));
       (
         "MediaFormat",
         (option_to_yojson media_format_to_yojson x.media_format));
       (
         "MediaSampleRateHertz",
         (option_to_yojson media_sample_rate_hertz_to_yojson x.media_sample_rate_hertz));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "TranscriptionJobName",
         (Some (transcription_job_name_to_yojson x.transcription_job_name)));
       
  ])

let medical_media_sample_rate_hertz_to_yojson = int_to_yojson

let medical_transcript_to_yojson = 
  fun (x: medical_transcript) -> assoc_to_yojson(
    [(
         "TranscriptFileUri",
         (option_to_yojson uri_to_yojson x.transcript_file_uri));
       
  ])

let medical_transcription_setting_to_yojson = 
  fun (x: medical_transcription_setting) -> assoc_to_yojson(
    [(
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       (
         "MaxAlternatives",
         (option_to_yojson max_alternatives_to_yojson x.max_alternatives));
       (
         "ShowAlternatives",
         (option_to_yojson boolean__to_yojson x.show_alternatives));
       (
         "ChannelIdentification",
         (option_to_yojson boolean__to_yojson x.channel_identification));
       (
         "MaxSpeakerLabels",
         (option_to_yojson max_speakers_to_yojson x.max_speaker_labels));
       (
         "ShowSpeakerLabels",
         (option_to_yojson boolean__to_yojson x.show_speaker_labels));
       
  ])

let medical_content_identification_type_to_yojson = 
  fun (x: medical_content_identification_type) -> match x with 
  | PHI -> `String "PHI"
     

let specialty_to_yojson = 
  fun (x: specialty) -> match x with 
  | PRIMARYCARE -> `String "PRIMARYCARE"
     

let medical_transcription_job_to_yojson = 
  fun (x: medical_transcription_job) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Type",
         (option_to_yojson type__to_yojson x.type_));
       (
         "Specialty",
         (option_to_yojson specialty_to_yojson x.specialty));
       (
         "ContentIdentificationType",
         (option_to_yojson medical_content_identification_type_to_yojson x.content_identification_type));
       (
         "Settings",
         (option_to_yojson medical_transcription_setting_to_yojson x.settings));
       (
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "CompletionTime",
         (option_to_yojson date_time_to_yojson x.completion_time));
       (
         "CreationTime",
         (option_to_yojson date_time_to_yojson x.creation_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "Transcript",
         (option_to_yojson medical_transcript_to_yojson x.transcript));
       (
         "Media",
         (option_to_yojson media_to_yojson x.media));
       (
         "MediaFormat",
         (option_to_yojson media_format_to_yojson x.media_format));
       (
         "MediaSampleRateHertz",
         (option_to_yojson medical_media_sample_rate_hertz_to_yojson x.media_sample_rate_hertz));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "TranscriptionJobStatus",
         (option_to_yojson transcription_job_status_to_yojson x.transcription_job_status));
       (
         "MedicalTranscriptionJobName",
         (option_to_yojson transcription_job_name_to_yojson x.medical_transcription_job_name));
       
  ])

let start_medical_transcription_job_response_to_yojson = 
  fun (x: start_medical_transcription_job_response) -> assoc_to_yojson(
    [(
         "MedicalTranscriptionJob",
         (option_to_yojson medical_transcription_job_to_yojson x.medical_transcription_job));
       
  ])

let start_medical_transcription_job_request_to_yojson = 
  fun (x: start_medical_transcription_job_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Type",
         (Some (type__to_yojson x.type_)));
       (
         "Specialty",
         (Some (specialty_to_yojson x.specialty)));
       (
         "ContentIdentificationType",
         (option_to_yojson medical_content_identification_type_to_yojson x.content_identification_type));
       (
         "Settings",
         (option_to_yojson medical_transcription_setting_to_yojson x.settings));
       (
         "KMSEncryptionContext",
         (option_to_yojson kms_encryption_context_map_to_yojson x.kms_encryption_context));
       (
         "OutputEncryptionKMSKeyId",
         (option_to_yojson kms_key_id_to_yojson x.output_encryption_kms_key_id));
       (
         "OutputKey",
         (option_to_yojson output_key_to_yojson x.output_key));
       (
         "OutputBucketName",
         (Some (output_bucket_name_to_yojson x.output_bucket_name)));
       (
         "Media",
         (Some (media_to_yojson x.media)));
       (
         "MediaFormat",
         (option_to_yojson media_format_to_yojson x.media_format));
       (
         "MediaSampleRateHertz",
         (option_to_yojson medical_media_sample_rate_hertz_to_yojson x.media_sample_rate_hertz));
       (
         "LanguageCode",
         (Some (language_code_to_yojson x.language_code)));
       (
         "MedicalTranscriptionJobName",
         (Some (transcription_job_name_to_yojson x.medical_transcription_job_name)));
       
  ])

let medical_scribe_job_status_to_yojson = 
  fun (x: medical_scribe_job_status) -> match x with 
 
| COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | QUEUED -> `String "QUEUED"
   

let medical_scribe_language_code_to_yojson = 
  fun (x: medical_scribe_language_code) -> match x with 
  | EN_US -> `String "en-US"
     

let medical_scribe_output_to_yojson = 
  fun (x: medical_scribe_output) -> assoc_to_yojson(
    [(
         "ClinicalDocumentUri",
         (Some (uri_to_yojson x.clinical_document_uri)));
       (
         "TranscriptFileUri",
         (Some (uri_to_yojson x.transcript_file_uri)));
       
  ])

let medical_scribe_settings_to_yojson = 
  fun (x: medical_scribe_settings) -> assoc_to_yojson(
    [(
         "VocabularyFilterMethod",
         (option_to_yojson vocabulary_filter_method_to_yojson x.vocabulary_filter_method));
       (
         "VocabularyFilterName",
         (option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       (
         "ChannelIdentification",
         (option_to_yojson boolean__to_yojson x.channel_identification));
       (
         "MaxSpeakerLabels",
         (option_to_yojson max_speakers_to_yojson x.max_speaker_labels));
       (
         "ShowSpeakerLabels",
         (option_to_yojson boolean__to_yojson x.show_speaker_labels));
       
  ])

let medical_scribe_channel_id_to_yojson = int_to_yojson

let medical_scribe_participant_role_to_yojson = 
  fun (x: medical_scribe_participant_role) -> match x with 
  | CLINICIAN -> `String "CLINICIAN"
    | PATIENT -> `String "PATIENT"
     

let medical_scribe_channel_definition_to_yojson = 
  fun (x: medical_scribe_channel_definition) -> assoc_to_yojson(
    [(
         "ParticipantRole",
         (Some (medical_scribe_participant_role_to_yojson x.participant_role)));
       (
         "ChannelId",
         (Some (medical_scribe_channel_id_to_yojson x.channel_id)));
       
  ])

let medical_scribe_channel_definitions_to_yojson = 
  fun tree -> list_to_yojson medical_scribe_channel_definition_to_yojson tree

let medical_scribe_job_to_yojson = 
  fun (x: medical_scribe_job) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ChannelDefinitions",
         (option_to_yojson medical_scribe_channel_definitions_to_yojson x.channel_definitions));
       (
         "DataAccessRoleArn",
         (option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn));
       (
         "Settings",
         (option_to_yojson medical_scribe_settings_to_yojson x.settings));
       (
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "CompletionTime",
         (option_to_yojson date_time_to_yojson x.completion_time));
       (
         "CreationTime",
         (option_to_yojson date_time_to_yojson x.creation_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "MedicalScribeOutput",
         (option_to_yojson medical_scribe_output_to_yojson x.medical_scribe_output));
       (
         "Media",
         (option_to_yojson media_to_yojson x.media));
       (
         "LanguageCode",
         (option_to_yojson medical_scribe_language_code_to_yojson x.language_code));
       (
         "MedicalScribeJobStatus",
         (option_to_yojson medical_scribe_job_status_to_yojson x.medical_scribe_job_status));
       (
         "MedicalScribeJobName",
         (option_to_yojson transcription_job_name_to_yojson x.medical_scribe_job_name));
       
  ])

let start_medical_scribe_job_response_to_yojson = 
  fun (x: start_medical_scribe_job_response) -> assoc_to_yojson(
    [(
         "MedicalScribeJob",
         (option_to_yojson medical_scribe_job_to_yojson x.medical_scribe_job));
       
  ])

let start_medical_scribe_job_request_to_yojson = 
  fun (x: start_medical_scribe_job_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ChannelDefinitions",
         (option_to_yojson medical_scribe_channel_definitions_to_yojson x.channel_definitions));
       (
         "Settings",
         (Some (medical_scribe_settings_to_yojson x.settings)));
       (
         "DataAccessRoleArn",
         (Some (data_access_role_arn_to_yojson x.data_access_role_arn)));
       (
         "KMSEncryptionContext",
         (option_to_yojson kms_encryption_context_map_to_yojson x.kms_encryption_context));
       (
         "OutputEncryptionKMSKeyId",
         (option_to_yojson kms_key_id_to_yojson x.output_encryption_kms_key_id));
       (
         "OutputBucketName",
         (Some (output_bucket_name_to_yojson x.output_bucket_name)));
       (
         "Media",
         (Some (media_to_yojson x.media)));
       (
         "MedicalScribeJobName",
         (Some (transcription_job_name_to_yojson x.medical_scribe_job_name)));
       
  ])

let call_analytics_job_name_to_yojson = string_to_yojson

let call_analytics_job_status_to_yojson = 
  fun (x: call_analytics_job_status) -> match x with 
 
| COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | QUEUED -> `String "QUEUED"
   

let call_analytics_feature_to_yojson = 
  fun (x: call_analytics_feature) -> match x with 
  | GENERATIVE_SUMMARIZATION -> `String "GENERATIVE_SUMMARIZATION"
     

let call_analytics_skipped_reason_code_to_yojson = 
  fun (x: call_analytics_skipped_reason_code) -> match x with 
 
| FAILED_SAFETY_GUIDELINES -> `String "FAILED_SAFETY_GUIDELINES"
  | INSUFFICIENT_CONVERSATION_CONTENT -> `String "INSUFFICIENT_CONVERSATION_CONTENT"
   

let call_analytics_skipped_feature_to_yojson = 
  fun (x: call_analytics_skipped_feature) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "ReasonCode",
         (option_to_yojson call_analytics_skipped_reason_code_to_yojson x.reason_code));
       (
         "Feature",
         (option_to_yojson call_analytics_feature_to_yojson x.feature));
       
  ])

let call_analytics_skipped_feature_list_to_yojson = 
  fun tree -> list_to_yojson call_analytics_skipped_feature_to_yojson tree

let call_analytics_job_details_to_yojson = 
  fun (x: call_analytics_job_details) -> assoc_to_yojson(
    [(
         "Skipped",
         (option_to_yojson call_analytics_skipped_feature_list_to_yojson x.skipped));
       
  ])

let summarization_to_yojson = 
  fun (x: summarization) -> assoc_to_yojson(
    [(
         "GenerateAbstractiveSummary",
         (Some (boolean__to_yojson x.generate_abstractive_summary)));
       
  ])

let call_analytics_job_settings_to_yojson = 
  fun (x: call_analytics_job_settings) -> assoc_to_yojson(
    [(
         "Summarization",
         (option_to_yojson summarization_to_yojson x.summarization));
       (
         "LanguageIdSettings",
         (option_to_yojson language_id_settings_map_to_yojson x.language_id_settings));
       (
         "LanguageOptions",
         (option_to_yojson language_options_to_yojson x.language_options));
       (
         "ContentRedaction",
         (option_to_yojson content_redaction_to_yojson x.content_redaction));
       (
         "LanguageModelName",
         (option_to_yojson model_name_to_yojson x.language_model_name));
       (
         "VocabularyFilterMethod",
         (option_to_yojson vocabulary_filter_method_to_yojson x.vocabulary_filter_method));
       (
         "VocabularyFilterName",
         (option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       
  ])

let channel_id_to_yojson = int_to_yojson

let channel_definition_to_yojson = 
  fun (x: channel_definition) -> assoc_to_yojson(
    [(
         "ParticipantRole",
         (option_to_yojson participant_role_to_yojson x.participant_role));
       (
         "ChannelId",
         (option_to_yojson channel_id_to_yojson x.channel_id));
       
  ])

let channel_definitions_to_yojson = 
  fun tree -> list_to_yojson channel_definition_to_yojson tree

let call_analytics_job_to_yojson = 
  fun (x: call_analytics_job) -> assoc_to_yojson(
    [(
         "ChannelDefinitions",
         (option_to_yojson channel_definitions_to_yojson x.channel_definitions));
       (
         "Settings",
         (option_to_yojson call_analytics_job_settings_to_yojson x.settings));
       (
         "IdentifiedLanguageScore",
         (option_to_yojson identified_language_score_to_yojson x.identified_language_score));
       (
         "DataAccessRoleArn",
         (option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn));
       (
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "CompletionTime",
         (option_to_yojson date_time_to_yojson x.completion_time));
       (
         "CreationTime",
         (option_to_yojson date_time_to_yojson x.creation_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "Transcript",
         (option_to_yojson transcript_to_yojson x.transcript));
       (
         "Media",
         (option_to_yojson media_to_yojson x.media));
       (
         "MediaFormat",
         (option_to_yojson media_format_to_yojson x.media_format));
       (
         "MediaSampleRateHertz",
         (option_to_yojson media_sample_rate_hertz_to_yojson x.media_sample_rate_hertz));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "CallAnalyticsJobDetails",
         (option_to_yojson call_analytics_job_details_to_yojson x.call_analytics_job_details));
       (
         "CallAnalyticsJobStatus",
         (option_to_yojson call_analytics_job_status_to_yojson x.call_analytics_job_status));
       (
         "CallAnalyticsJobName",
         (option_to_yojson call_analytics_job_name_to_yojson x.call_analytics_job_name));
       
  ])

let start_call_analytics_job_response_to_yojson = 
  fun (x: start_call_analytics_job_response) -> assoc_to_yojson(
    [(
         "CallAnalyticsJob",
         (option_to_yojson call_analytics_job_to_yojson x.call_analytics_job));
       
  ])

let start_call_analytics_job_request_to_yojson = 
  fun (x: start_call_analytics_job_request) -> assoc_to_yojson(
    [(
         "ChannelDefinitions",
         (option_to_yojson channel_definitions_to_yojson x.channel_definitions));
       (
         "Settings",
         (option_to_yojson call_analytics_job_settings_to_yojson x.settings));
       (
         "DataAccessRoleArn",
         (option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn));
       (
         "OutputEncryptionKMSKeyId",
         (option_to_yojson kms_key_id_to_yojson x.output_encryption_kms_key_id));
       (
         "OutputLocation",
         (option_to_yojson uri_to_yojson x.output_location));
       (
         "Media",
         (Some (media_to_yojson x.media)));
       (
         "CallAnalyticsJobName",
         (Some (call_analytics_job_name_to_yojson x.call_analytics_job_name)));
       
  ])

let next_token_to_yojson = string_to_yojson

let list_vocabulary_filters_response_to_yojson = 
  fun (x: list_vocabulary_filters_response) -> assoc_to_yojson(
    [(
         "VocabularyFilters",
         (option_to_yojson vocabulary_filters_to_yojson x.vocabulary_filters));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let max_results_to_yojson = int_to_yojson

let list_vocabulary_filters_request_to_yojson = 
  fun (x: list_vocabulary_filters_request) -> assoc_to_yojson(
    [(
         "NameContains",
         (option_to_yojson vocabulary_filter_name_to_yojson x.name_contains));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_vocabularies_response_to_yojson = 
  fun (x: list_vocabularies_response) -> assoc_to_yojson(
    [(
         "Vocabularies",
         (option_to_yojson vocabularies_to_yojson x.vocabularies));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Status",
         (option_to_yojson vocabulary_state_to_yojson x.status));
       
  ])

let list_vocabularies_request_to_yojson = 
  fun (x: list_vocabularies_request) -> assoc_to_yojson(
    [(
         "NameContains",
         (option_to_yojson vocabulary_name_to_yojson x.name_contains));
       (
         "StateEquals",
         (option_to_yojson vocabulary_state_to_yojson x.state_equals));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_transcription_jobs_response_to_yojson = 
  fun (x: list_transcription_jobs_response) -> assoc_to_yojson(
    [(
         "TranscriptionJobSummaries",
         (option_to_yojson transcription_job_summaries_to_yojson x.transcription_job_summaries));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Status",
         (option_to_yojson transcription_job_status_to_yojson x.status));
       
  ])

let list_transcription_jobs_request_to_yojson = 
  fun (x: list_transcription_jobs_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "JobNameContains",
         (option_to_yojson transcription_job_name_to_yojson x.job_name_contains));
       (
         "Status",
         (option_to_yojson transcription_job_status_to_yojson x.status));
       
  ])

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ResourceArn",
         (option_to_yojson transcribe_arn_to_yojson x.resource_arn));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (transcribe_arn_to_yojson x.resource_arn)));
       
  ])

let list_medical_vocabularies_response_to_yojson = 
  fun (x: list_medical_vocabularies_response) -> assoc_to_yojson(
    [(
         "Vocabularies",
         (option_to_yojson vocabularies_to_yojson x.vocabularies));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Status",
         (option_to_yojson vocabulary_state_to_yojson x.status));
       
  ])

let list_medical_vocabularies_request_to_yojson = 
  fun (x: list_medical_vocabularies_request) -> assoc_to_yojson(
    [(
         "NameContains",
         (option_to_yojson vocabulary_name_to_yojson x.name_contains));
       (
         "StateEquals",
         (option_to_yojson vocabulary_state_to_yojson x.state_equals));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let medical_transcription_job_summary_to_yojson = 
  fun (x: medical_transcription_job_summary) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson type__to_yojson x.type_));
       (
         "ContentIdentificationType",
         (option_to_yojson medical_content_identification_type_to_yojson x.content_identification_type));
       (
         "Specialty",
         (option_to_yojson specialty_to_yojson x.specialty));
       (
         "OutputLocationType",
         (option_to_yojson output_location_type_to_yojson x.output_location_type));
       (
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "TranscriptionJobStatus",
         (option_to_yojson transcription_job_status_to_yojson x.transcription_job_status));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "CompletionTime",
         (option_to_yojson date_time_to_yojson x.completion_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "CreationTime",
         (option_to_yojson date_time_to_yojson x.creation_time));
       (
         "MedicalTranscriptionJobName",
         (option_to_yojson transcription_job_name_to_yojson x.medical_transcription_job_name));
       
  ])

let medical_transcription_job_summaries_to_yojson = 
  fun tree -> list_to_yojson medical_transcription_job_summary_to_yojson tree

let list_medical_transcription_jobs_response_to_yojson = 
  fun (x: list_medical_transcription_jobs_response) -> assoc_to_yojson(
    [(
         "MedicalTranscriptionJobSummaries",
         (option_to_yojson medical_transcription_job_summaries_to_yojson x.medical_transcription_job_summaries));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Status",
         (option_to_yojson transcription_job_status_to_yojson x.status));
       
  ])

let list_medical_transcription_jobs_request_to_yojson = 
  fun (x: list_medical_transcription_jobs_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "JobNameContains",
         (option_to_yojson transcription_job_name_to_yojson x.job_name_contains));
       (
         "Status",
         (option_to_yojson transcription_job_status_to_yojson x.status));
       
  ])

let medical_scribe_job_summary_to_yojson = 
  fun (x: medical_scribe_job_summary) -> assoc_to_yojson(
    [(
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "MedicalScribeJobStatus",
         (option_to_yojson medical_scribe_job_status_to_yojson x.medical_scribe_job_status));
       (
         "LanguageCode",
         (option_to_yojson medical_scribe_language_code_to_yojson x.language_code));
       (
         "CompletionTime",
         (option_to_yojson date_time_to_yojson x.completion_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "CreationTime",
         (option_to_yojson date_time_to_yojson x.creation_time));
       (
         "MedicalScribeJobName",
         (option_to_yojson transcription_job_name_to_yojson x.medical_scribe_job_name));
       
  ])

let medical_scribe_job_summaries_to_yojson = 
  fun tree -> list_to_yojson medical_scribe_job_summary_to_yojson tree

let list_medical_scribe_jobs_response_to_yojson = 
  fun (x: list_medical_scribe_jobs_response) -> assoc_to_yojson(
    [(
         "MedicalScribeJobSummaries",
         (option_to_yojson medical_scribe_job_summaries_to_yojson x.medical_scribe_job_summaries));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Status",
         (option_to_yojson medical_scribe_job_status_to_yojson x.status));
       
  ])

let list_medical_scribe_jobs_request_to_yojson = 
  fun (x: list_medical_scribe_jobs_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "JobNameContains",
         (option_to_yojson transcription_job_name_to_yojson x.job_name_contains));
       (
         "Status",
         (option_to_yojson medical_scribe_job_status_to_yojson x.status));
       
  ])

let clm_language_code_to_yojson = 
  fun (x: clm_language_code) -> match x with 
 
| JA_JP -> `String "ja-JP"
  | DE_DE -> `String "de-DE"
  | EN_AU -> `String "en-AU"
  | EN_GB -> `String "en-GB"
  | ES_US -> `String "es-US"
  | HI_IN -> `String "hi-IN"
  | EN_US -> `String "en-US"
   

let base_model_name_to_yojson = 
  fun (x: base_model_name) -> match x with 
  | WIDE_BAND -> `String "WideBand"
    | NARROW_BAND -> `String "NarrowBand"
     

let model_status_to_yojson = 
  fun (x: model_status) -> match x with 
 
| COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
   

let input_data_config_to_yojson = 
  fun (x: input_data_config) -> assoc_to_yojson(
    [(
         "DataAccessRoleArn",
         (Some (data_access_role_arn_to_yojson x.data_access_role_arn)));
       (
         "TuningDataS3Uri",
         (option_to_yojson uri_to_yojson x.tuning_data_s3_uri));
       (
         "S3Uri",
         (Some (uri_to_yojson x.s3_uri)));
       
  ])

let language_model_to_yojson = 
  fun (x: language_model) -> assoc_to_yojson(
    [(
         "InputDataConfig",
         (option_to_yojson input_data_config_to_yojson x.input_data_config));
       (
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "UpgradeAvailability",
         (option_to_yojson boolean__to_yojson x.upgrade_availability));
       (
         "ModelStatus",
         (option_to_yojson model_status_to_yojson x.model_status));
       (
         "BaseModelName",
         (option_to_yojson base_model_name_to_yojson x.base_model_name));
       (
         "LanguageCode",
         (option_to_yojson clm_language_code_to_yojson x.language_code));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "CreateTime",
         (option_to_yojson date_time_to_yojson x.create_time));
       (
         "ModelName",
         (option_to_yojson model_name_to_yojson x.model_name));
       
  ])

let models_to_yojson = 
  fun tree -> list_to_yojson language_model_to_yojson tree

let list_language_models_response_to_yojson = 
  fun (x: list_language_models_response) -> assoc_to_yojson(
    [(
         "Models",
         (option_to_yojson models_to_yojson x.models));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_language_models_request_to_yojson = 
  fun (x: list_language_models_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "NameContains",
         (option_to_yojson model_name_to_yojson x.name_contains));
       (
         "StatusEquals",
         (option_to_yojson model_status_to_yojson x.status_equals));
       
  ])

let call_analytics_job_summary_to_yojson = 
  fun (x: call_analytics_job_summary) -> assoc_to_yojson(
    [(
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "CallAnalyticsJobDetails",
         (option_to_yojson call_analytics_job_details_to_yojson x.call_analytics_job_details));
       (
         "CallAnalyticsJobStatus",
         (option_to_yojson call_analytics_job_status_to_yojson x.call_analytics_job_status));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "CompletionTime",
         (option_to_yojson date_time_to_yojson x.completion_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "CreationTime",
         (option_to_yojson date_time_to_yojson x.creation_time));
       (
         "CallAnalyticsJobName",
         (option_to_yojson call_analytics_job_name_to_yojson x.call_analytics_job_name));
       
  ])

let call_analytics_job_summaries_to_yojson = 
  fun tree -> list_to_yojson call_analytics_job_summary_to_yojson tree

let list_call_analytics_jobs_response_to_yojson = 
  fun (x: list_call_analytics_jobs_response) -> assoc_to_yojson(
    [(
         "CallAnalyticsJobSummaries",
         (option_to_yojson call_analytics_job_summaries_to_yojson x.call_analytics_job_summaries));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Status",
         (option_to_yojson call_analytics_job_status_to_yojson x.status));
       
  ])

let list_call_analytics_jobs_request_to_yojson = 
  fun (x: list_call_analytics_jobs_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "JobNameContains",
         (option_to_yojson call_analytics_job_name_to_yojson x.job_name_contains));
       (
         "Status",
         (option_to_yojson call_analytics_job_status_to_yojson x.status));
       
  ])

let category_properties_list_to_yojson = 
  fun tree -> list_to_yojson category_properties_to_yojson tree

let list_call_analytics_categories_response_to_yojson = 
  fun (x: list_call_analytics_categories_response) -> assoc_to_yojson(
    [(
         "Categories",
         (option_to_yojson category_properties_list_to_yojson x.categories));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_call_analytics_categories_request_to_yojson = 
  fun (x: list_call_analytics_categories_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let get_vocabulary_filter_response_to_yojson = 
  fun (x: get_vocabulary_filter_response) -> assoc_to_yojson(
    [(
         "DownloadUri",
         (option_to_yojson uri_to_yojson x.download_uri));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyFilterName",
         (option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name));
       
  ])

let get_vocabulary_filter_request_to_yojson = 
  fun (x: get_vocabulary_filter_request) -> assoc_to_yojson(
    [(
         "VocabularyFilterName",
         (Some (vocabulary_filter_name_to_yojson x.vocabulary_filter_name)));
       
  ])

let get_vocabulary_response_to_yojson = 
  fun (x: get_vocabulary_response) -> assoc_to_yojson(
    [(
         "DownloadUri",
         (option_to_yojson uri_to_yojson x.download_uri));
       (
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "VocabularyState",
         (option_to_yojson vocabulary_state_to_yojson x.vocabulary_state));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       
  ])

let get_vocabulary_request_to_yojson = 
  fun (x: get_vocabulary_request) -> assoc_to_yojson(
    [(
         "VocabularyName",
         (Some (vocabulary_name_to_yojson x.vocabulary_name)));
       
  ])

let get_transcription_job_response_to_yojson = 
  fun (x: get_transcription_job_response) -> assoc_to_yojson(
    [(
         "TranscriptionJob",
         (option_to_yojson transcription_job_to_yojson x.transcription_job));
       
  ])

let get_transcription_job_request_to_yojson = 
  fun (x: get_transcription_job_request) -> assoc_to_yojson(
    [(
         "TranscriptionJobName",
         (Some (transcription_job_name_to_yojson x.transcription_job_name)));
       
  ])

let get_medical_vocabulary_response_to_yojson = 
  fun (x: get_medical_vocabulary_response) -> assoc_to_yojson(
    [(
         "DownloadUri",
         (option_to_yojson uri_to_yojson x.download_uri));
       (
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "VocabularyState",
         (option_to_yojson vocabulary_state_to_yojson x.vocabulary_state));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       
  ])

let get_medical_vocabulary_request_to_yojson = 
  fun (x: get_medical_vocabulary_request) -> assoc_to_yojson(
    [(
         "VocabularyName",
         (Some (vocabulary_name_to_yojson x.vocabulary_name)));
       
  ])

let get_medical_transcription_job_response_to_yojson = 
  fun (x: get_medical_transcription_job_response) -> assoc_to_yojson(
    [(
         "MedicalTranscriptionJob",
         (option_to_yojson medical_transcription_job_to_yojson x.medical_transcription_job));
       
  ])

let get_medical_transcription_job_request_to_yojson = 
  fun (x: get_medical_transcription_job_request) -> assoc_to_yojson(
    [(
         "MedicalTranscriptionJobName",
         (Some (transcription_job_name_to_yojson x.medical_transcription_job_name)));
       
  ])

let get_medical_scribe_job_response_to_yojson = 
  fun (x: get_medical_scribe_job_response) -> assoc_to_yojson(
    [(
         "MedicalScribeJob",
         (option_to_yojson medical_scribe_job_to_yojson x.medical_scribe_job));
       
  ])

let get_medical_scribe_job_request_to_yojson = 
  fun (x: get_medical_scribe_job_request) -> assoc_to_yojson(
    [(
         "MedicalScribeJobName",
         (Some (transcription_job_name_to_yojson x.medical_scribe_job_name)));
       
  ])

let get_call_analytics_job_response_to_yojson = 
  fun (x: get_call_analytics_job_response) -> assoc_to_yojson(
    [(
         "CallAnalyticsJob",
         (option_to_yojson call_analytics_job_to_yojson x.call_analytics_job));
       
  ])

let get_call_analytics_job_request_to_yojson = 
  fun (x: get_call_analytics_job_request) -> assoc_to_yojson(
    [(
         "CallAnalyticsJobName",
         (Some (call_analytics_job_name_to_yojson x.call_analytics_job_name)));
       
  ])

let get_call_analytics_category_response_to_yojson = 
  fun (x: get_call_analytics_category_response) -> assoc_to_yojson(
    [(
         "CategoryProperties",
         (option_to_yojson category_properties_to_yojson x.category_properties));
       
  ])

let get_call_analytics_category_request_to_yojson = 
  fun (x: get_call_analytics_category_request) -> assoc_to_yojson(
    [(
         "CategoryName",
         (Some (category_name_to_yojson x.category_name)));
       
  ])

let describe_language_model_response_to_yojson = 
  fun (x: describe_language_model_response) -> assoc_to_yojson(
    [(
         "LanguageModel",
         (option_to_yojson language_model_to_yojson x.language_model));
       
  ])

let describe_language_model_request_to_yojson = 
  fun (x: describe_language_model_request) -> assoc_to_yojson(
    [(
         "ModelName",
         (Some (model_name_to_yojson x.model_name)));
       
  ])

let delete_vocabulary_filter_request_to_yojson = 
  fun (x: delete_vocabulary_filter_request) -> assoc_to_yojson(
    [(
         "VocabularyFilterName",
         (Some (vocabulary_filter_name_to_yojson x.vocabulary_filter_name)));
       
  ])

let delete_vocabulary_request_to_yojson = 
  fun (x: delete_vocabulary_request) -> assoc_to_yojson(
    [(
         "VocabularyName",
         (Some (vocabulary_name_to_yojson x.vocabulary_name)));
       
  ])

let delete_transcription_job_request_to_yojson = 
  fun (x: delete_transcription_job_request) -> assoc_to_yojson(
    [(
         "TranscriptionJobName",
         (Some (transcription_job_name_to_yojson x.transcription_job_name)));
       
  ])

let delete_medical_vocabulary_request_to_yojson = 
  fun (x: delete_medical_vocabulary_request) -> assoc_to_yojson(
    [(
         "VocabularyName",
         (Some (vocabulary_name_to_yojson x.vocabulary_name)));
       
  ])

let delete_medical_transcription_job_request_to_yojson = 
  fun (x: delete_medical_transcription_job_request) -> assoc_to_yojson(
    [(
         "MedicalTranscriptionJobName",
         (Some (transcription_job_name_to_yojson x.medical_transcription_job_name)));
       
  ])

let delete_medical_scribe_job_request_to_yojson = 
  fun (x: delete_medical_scribe_job_request) -> assoc_to_yojson(
    [(
         "MedicalScribeJobName",
         (Some (transcription_job_name_to_yojson x.medical_scribe_job_name)));
       
  ])

let delete_language_model_request_to_yojson = 
  fun (x: delete_language_model_request) -> assoc_to_yojson(
    [(
         "ModelName",
         (Some (model_name_to_yojson x.model_name)));
       
  ])

let delete_call_analytics_job_response_to_yojson = 
  fun (x: delete_call_analytics_job_response) -> assoc_to_yojson(
    [
  ])

let delete_call_analytics_job_request_to_yojson = 
  fun (x: delete_call_analytics_job_request) -> assoc_to_yojson(
    [(
         "CallAnalyticsJobName",
         (Some (call_analytics_job_name_to_yojson x.call_analytics_job_name)));
       
  ])

let delete_call_analytics_category_response_to_yojson = 
  fun (x: delete_call_analytics_category_response) -> assoc_to_yojson(
    [
  ])

let delete_call_analytics_category_request_to_yojson = 
  fun (x: delete_call_analytics_category_request) -> assoc_to_yojson(
    [(
         "CategoryName",
         (Some (category_name_to_yojson x.category_name)));
       
  ])

let create_vocabulary_filter_response_to_yojson = 
  fun (x: create_vocabulary_filter_response) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyFilterName",
         (option_to_yojson vocabulary_filter_name_to_yojson x.vocabulary_filter_name));
       
  ])

let create_vocabulary_filter_request_to_yojson = 
  fun (x: create_vocabulary_filter_request) -> assoc_to_yojson(
    [(
         "DataAccessRoleArn",
         (option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "VocabularyFilterFileUri",
         (option_to_yojson uri_to_yojson x.vocabulary_filter_file_uri));
       (
         "Words",
         (option_to_yojson words_to_yojson x.words));
       (
         "LanguageCode",
         (Some (language_code_to_yojson x.language_code)));
       (
         "VocabularyFilterName",
         (Some (vocabulary_filter_name_to_yojson x.vocabulary_filter_name)));
       
  ])

let create_vocabulary_response_to_yojson = 
  fun (x: create_vocabulary_response) -> assoc_to_yojson(
    [(
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "VocabularyState",
         (option_to_yojson vocabulary_state_to_yojson x.vocabulary_state));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       
  ])

let create_vocabulary_request_to_yojson = 
  fun (x: create_vocabulary_request) -> assoc_to_yojson(
    [(
         "DataAccessRoleArn",
         (option_to_yojson data_access_role_arn_to_yojson x.data_access_role_arn));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "VocabularyFileUri",
         (option_to_yojson uri_to_yojson x.vocabulary_file_uri));
       (
         "Phrases",
         (option_to_yojson phrases_to_yojson x.phrases));
       (
         "LanguageCode",
         (Some (language_code_to_yojson x.language_code)));
       (
         "VocabularyName",
         (Some (vocabulary_name_to_yojson x.vocabulary_name)));
       
  ])

let create_medical_vocabulary_response_to_yojson = 
  fun (x: create_medical_vocabulary_response) -> assoc_to_yojson(
    [(
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "VocabularyState",
         (option_to_yojson vocabulary_state_to_yojson x.vocabulary_state));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "VocabularyName",
         (option_to_yojson vocabulary_name_to_yojson x.vocabulary_name));
       
  ])

let create_medical_vocabulary_request_to_yojson = 
  fun (x: create_medical_vocabulary_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "VocabularyFileUri",
         (Some (uri_to_yojson x.vocabulary_file_uri)));
       (
         "LanguageCode",
         (Some (language_code_to_yojson x.language_code)));
       (
         "VocabularyName",
         (Some (vocabulary_name_to_yojson x.vocabulary_name)));
       
  ])

let create_language_model_response_to_yojson = 
  fun (x: create_language_model_response) -> assoc_to_yojson(
    [(
         "ModelStatus",
         (option_to_yojson model_status_to_yojson x.model_status));
       (
         "InputDataConfig",
         (option_to_yojson input_data_config_to_yojson x.input_data_config));
       (
         "ModelName",
         (option_to_yojson model_name_to_yojson x.model_name));
       (
         "BaseModelName",
         (option_to_yojson base_model_name_to_yojson x.base_model_name));
       (
         "LanguageCode",
         (option_to_yojson clm_language_code_to_yojson x.language_code));
       
  ])

let create_language_model_request_to_yojson = 
  fun (x: create_language_model_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "InputDataConfig",
         (Some (input_data_config_to_yojson x.input_data_config)));
       (
         "ModelName",
         (Some (model_name_to_yojson x.model_name)));
       (
         "BaseModelName",
         (Some (base_model_name_to_yojson x.base_model_name)));
       (
         "LanguageCode",
         (Some (clm_language_code_to_yojson x.language_code)));
       
  ])

let create_call_analytics_category_response_to_yojson = 
  fun (x: create_call_analytics_category_response) -> assoc_to_yojson(
    [(
         "CategoryProperties",
         (option_to_yojson category_properties_to_yojson x.category_properties));
       
  ])

let create_call_analytics_category_request_to_yojson = 
  fun (x: create_call_analytics_category_request) -> assoc_to_yojson(
    [(
         "InputType",
         (option_to_yojson input_type_to_yojson x.input_type));
       (
         "Rules",
         (Some (rule_list_to_yojson x.rules)));
       (
         "CategoryName",
         (Some (category_name_to_yojson x.category_name)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

