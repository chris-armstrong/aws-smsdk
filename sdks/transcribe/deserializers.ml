open Smaws_Lib.Json.DeserializeHelpers

open Types

let word_of_yojson = string_of_yojson

let words_of_yojson = 
  fun tree path -> list_of_yojson word_of_yojson tree path 

let base_unit_of_yojson = unit_of_yojson

let vocabulary_state_of_yojson = 
  fun (tree: t) path : vocabulary_state -> match tree with 
    | `String "FAILED" -> FAILED
    | `String "READY" -> READY
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "VocabularyState" value)
    | _ -> raise (deserialize_wrong_type_error path "VocabularyState")

let vocabulary_name_of_yojson = string_of_yojson

let language_code_of_yojson = 
  fun (tree: t) path : language_code -> match tree with 
    | `String "zu-ZA" -> ZU_ZA
    | `String "wo-SN" -> WO_SN
    | `String "uz-UZ" -> UZ_UZ
    | `String "uk-UA" -> UK_UA
    | `String "ug-CN" -> UG_CN
    | `String "tt-RU" -> TT_RU
    | `String "tl-PH" -> TL_PH
    | `String "sw-UG" -> SW_UG
    | `String "sw-TZ" -> SW_TZ
    | `String "sw-RW" -> SW_RW
    | `String "sw-KE" -> SW_KE
    | `String "sw-BI" -> SW_BI
    | `String "su-ID" -> SU_ID
    | `String "sr-RS" -> SR_RS
    | `String "so-SO" -> SO_SO
    | `String "sl-SI" -> SL_SI
    | `String "sk-SK" -> SK_SK
    | `String "si-LK" -> SI_LK
    | `String "rw-RW" -> RW_RW
    | `String "ro-RO" -> RO_RO
    | `String "ps-AF" -> PS_AF
    | `String "pl-PL" -> PL_PL
    | `String "pa-IN" -> PA_IN
    | `String "or-IN" -> OR_IN
    | `String "no-NO" -> NO_NO
    | `String "mt-MT" -> MT_MT
    | `String "mr-IN" -> MR_IN
    | `String "mn-MN" -> MN_MN
    | `String "ml-IN" -> ML_IN
    | `String "mk-MK" -> MK_MK
    | `String "mi-NZ" -> MI_NZ
    | `String "mhr-RU" -> MHR_RU
    | `String "lv-LV" -> LV_LV
    | `String "lt-LT" -> LT_LT
    | `String "lg-IN" -> LG_IN
    | `String "ky-KG" -> KY_KG
    | `String "kn-IN" -> KN_IN
    | `String "kk-KZ" -> KK_KZ
    | `String "kab-DZ" -> KAB_DZ
    | `String "ka-GE" -> KA_GE
    | `String "is-IS" -> IS_IS
    | `String "hy-AM" -> HY_AM
    | `String "hu-HU" -> HU_HU
    | `String "hr-HR" -> HR_HR
    | `String "ha-NG" -> HA_NG
    | `String "gu-IN" -> GU_IN
    | `String "gl-ES" -> GL_ES
    | `String "fi-FI" -> FI_FI
    | `String "eu-ES" -> EU_ES
    | `String "et-ET" -> ET_ET
    | `String "el-GR" -> EL_GR
    | `String "cy-WL" -> CY_WL
    | `String "cs-CZ" -> CS_CZ
    | `String "ckb-IR" -> CKB_IR
    | `String "ckb-IQ" -> CKB_IQ
    | `String "ca-ES" -> CA_ES
    | `String "bs-BA" -> BS_BA
    | `String "bn-IN" -> BN_IN
    | `String "bg-BG" -> BG_BG
    | `String "be-BY" -> BE_BY
    | `String "ba-RU" -> BA_RU
    | `String "az-AZ" -> AZ_AZ
    | `String "ast-ES" -> AST_ES
    | `String "ab-GE" -> AB_GE
    | `String "sv-SE" -> SV_SE
    | `String "vi-VN" -> VI_VN
    | `String "en-NZ" -> EN_NZ
    | `String "en-ZA" -> EN_ZA
    | `String "th-TH" -> TH_TH
    | `String "zh-TW" -> ZH_TW
    | `String "zh-CN" -> ZH_CN
    | `String "tr-TR" -> TR_TR
    | `String "te-IN" -> TE_IN
    | `String "ta-IN" -> TA_IN
    | `String "ru-RU" -> RU_RU
    | `String "pt-PT" -> PT_PT
    | `String "pt-BR" -> PT_BR
    | `String "nl-NL" -> NL_NL
    | `String "ms-MY" -> MS_MY
    | `String "ko-KR" -> KO_KR
    | `String "ja-JP" -> JA_JP
    | `String "it-IT" -> IT_IT
    | `String "id-ID" -> ID_ID
    | `String "hi-IN" -> HI_IN
    | `String "he-IL" -> HE_IL
    | `String "fr-FR" -> FR_FR
    | `String "fr-CA" -> FR_CA
    | `String "fa-IR" -> FA_IR
    | `String "es-US" -> ES_US
    | `String "es-ES" -> ES_ES
    | `String "en-WL" -> EN_WL
    | `String "en-US" -> EN_US
    | `String "en-IN" -> EN_IN
    | `String "en-IE" -> EN_IE
    | `String "en-GB" -> EN_GB
    | `String "en-AU" -> EN_AU
    | `String "en-AB" -> EN_AB
    | `String "de-DE" -> DE_DE
    | `String "de-CH" -> DE_CH
    | `String "da-DK" -> DA_DK
    | `String "ar-SA" -> AR_SA
    | `String "ar-AE" -> AR_AE
    | `String "af-ZA" -> AF_ZA
    | `String value -> raise (deserialize_unknown_enum_value_error path "LanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LanguageCode")

let date_time_of_yojson = timestamp_of_yojson

let vocabulary_info_of_yojson = 
  fun tree path : vocabulary_info ->
  let _list = assoc_of_yojson tree path in
  let _res : vocabulary_info = {
    vocabulary_state = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "VocabularyState") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    
  }
  in _res

let vocabulary_filter_name_of_yojson = string_of_yojson

let vocabulary_filter_info_of_yojson = 
  fun tree path : vocabulary_filter_info ->
  let _list = assoc_of_yojson tree path in
  let _res : vocabulary_filter_info = {
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_filter_name = option_of_yojson (value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName") _list path;
    
  }
  in _res

let vocabulary_filters_of_yojson = 
  fun tree path -> list_of_yojson vocabulary_filter_info_of_yojson tree path 

let vocabulary_filter_method_of_yojson = 
  fun (tree: t) path : vocabulary_filter_method -> match tree with 
    | `String "tag" -> TAG
    | `String "mask" -> MASK
    | `String "remove" -> REMOVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "VocabularyFilterMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "VocabularyFilterMethod")

let vocabularies_of_yojson = 
  fun tree path -> list_of_yojson vocabulary_info_of_yojson tree path 

let uri_of_yojson = string_of_yojson

let update_vocabulary_response_of_yojson = 
  fun tree path : update_vocabulary_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_vocabulary_response = {
    vocabulary_state = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "VocabularyState") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    
  }
  in _res

let phrase_of_yojson = string_of_yojson

let phrases_of_yojson = 
  fun tree path -> list_of_yojson phrase_of_yojson tree path 

let data_access_role_arn_of_yojson = string_of_yojson

let update_vocabulary_request_of_yojson = 
  fun tree path : update_vocabulary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_vocabulary_request = {
    data_access_role_arn = option_of_yojson (value_for_key (data_access_role_arn_of_yojson) "DataAccessRoleArn") _list path;
    vocabulary_file_uri = option_of_yojson (value_for_key (uri_of_yojson) "VocabularyFileUri") _list path;
    phrases = option_of_yojson (value_for_key (phrases_of_yojson) "Phrases") _list path;
    language_code = value_for_key (language_code_of_yojson) "LanguageCode" _list path;
    vocabulary_name = value_for_key (vocabulary_name_of_yojson) "VocabularyName" _list path;
    
  }
  in _res

let update_vocabulary_filter_response_of_yojson = 
  fun tree path : update_vocabulary_filter_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_vocabulary_filter_response = {
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_filter_name = option_of_yojson (value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName") _list path;
    
  }
  in _res

let update_vocabulary_filter_request_of_yojson = 
  fun tree path : update_vocabulary_filter_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_vocabulary_filter_request = {
    data_access_role_arn = option_of_yojson (value_for_key (data_access_role_arn_of_yojson) "DataAccessRoleArn") _list path;
    vocabulary_filter_file_uri = option_of_yojson (value_for_key (uri_of_yojson) "VocabularyFilterFileUri") _list path;
    words = option_of_yojson (value_for_key (words_of_yojson) "Words") _list path;
    vocabulary_filter_name = value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName" _list path;
    
  }
  in _res

let string__of_yojson = string_of_yojson

let not_found_exception_of_yojson = 
  fun tree path : not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let limit_exceeded_exception_of_yojson = 
  fun tree path : limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let internal_failure_exception_of_yojson = 
  fun tree path : internal_failure_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : internal_failure_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let failure_reason_of_yojson = string_of_yojson

let bad_request_exception_of_yojson = 
  fun tree path : bad_request_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : bad_request_exception = {
    message = option_of_yojson (value_for_key (failure_reason_of_yojson) "Message") _list path;
    
  }
  in _res

let conflict_exception_of_yojson = 
  fun tree path : conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conflict_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let update_medical_vocabulary_response_of_yojson = 
  fun tree path : update_medical_vocabulary_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_medical_vocabulary_response = {
    vocabulary_state = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "VocabularyState") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    
  }
  in _res

let update_medical_vocabulary_request_of_yojson = 
  fun tree path : update_medical_vocabulary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_medical_vocabulary_request = {
    vocabulary_file_uri = value_for_key (uri_of_yojson) "VocabularyFileUri" _list path;
    language_code = value_for_key (language_code_of_yojson) "LanguageCode" _list path;
    vocabulary_name = value_for_key (vocabulary_name_of_yojson) "VocabularyName" _list path;
    
  }
  in _res

let category_name_of_yojson = string_of_yojson

let timestamp_milliseconds_of_yojson = long_of_yojson

let absolute_time_range_of_yojson = 
  fun tree path : absolute_time_range ->
  let _list = assoc_of_yojson tree path in
  let _res : absolute_time_range = {
    last = option_of_yojson (value_for_key (timestamp_milliseconds_of_yojson) "Last") _list path;
    first = option_of_yojson (value_for_key (timestamp_milliseconds_of_yojson) "First") _list path;
    end_time = option_of_yojson (value_for_key (timestamp_milliseconds_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (timestamp_milliseconds_of_yojson) "StartTime") _list path;
    
  }
  in _res

let percentage_of_yojson = int_of_yojson

let relative_time_range_of_yojson = 
  fun tree path : relative_time_range ->
  let _list = assoc_of_yojson tree path in
  let _res : relative_time_range = {
    last = option_of_yojson (value_for_key (percentage_of_yojson) "Last") _list path;
    first = option_of_yojson (value_for_key (percentage_of_yojson) "First") _list path;
    end_percentage = option_of_yojson (value_for_key (percentage_of_yojson) "EndPercentage") _list path;
    start_percentage = option_of_yojson (value_for_key (percentage_of_yojson) "StartPercentage") _list path;
    
  }
  in _res

let boolean__of_yojson = bool_of_yojson

let non_talk_time_filter_of_yojson = 
  fun tree path : non_talk_time_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : non_talk_time_filter = {
    negate = option_of_yojson (value_for_key (boolean__of_yojson) "Negate") _list path;
    relative_time_range = option_of_yojson (value_for_key (relative_time_range_of_yojson) "RelativeTimeRange") _list path;
    absolute_time_range = option_of_yojson (value_for_key (absolute_time_range_of_yojson) "AbsoluteTimeRange") _list path;
    threshold = option_of_yojson (value_for_key (timestamp_milliseconds_of_yojson) "Threshold") _list path;
    
  }
  in _res

let participant_role_of_yojson = 
  fun (tree: t) path : participant_role -> match tree with 
    | `String "CUSTOMER" -> CUSTOMER
    | `String "AGENT" -> AGENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParticipantRole" value)
    | _ -> raise (deserialize_wrong_type_error path "ParticipantRole")

let interruption_filter_of_yojson = 
  fun tree path : interruption_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : interruption_filter = {
    negate = option_of_yojson (value_for_key (boolean__of_yojson) "Negate") _list path;
    relative_time_range = option_of_yojson (value_for_key (relative_time_range_of_yojson) "RelativeTimeRange") _list path;
    absolute_time_range = option_of_yojson (value_for_key (absolute_time_range_of_yojson) "AbsoluteTimeRange") _list path;
    participant_role = option_of_yojson (value_for_key (participant_role_of_yojson) "ParticipantRole") _list path;
    threshold = option_of_yojson (value_for_key (timestamp_milliseconds_of_yojson) "Threshold") _list path;
    
  }
  in _res

let transcript_filter_type_of_yojson = 
  fun (tree: t) path : transcript_filter_type -> match tree with 
    | `String "EXACT" -> EXACT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TranscriptFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "TranscriptFilterType")

let non_empty_string_of_yojson = string_of_yojson

let string_target_list_of_yojson = 
  fun tree path -> list_of_yojson non_empty_string_of_yojson tree path 

let transcript_filter_of_yojson = 
  fun tree path : transcript_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : transcript_filter = {
    targets = value_for_key (string_target_list_of_yojson) "Targets" _list path;
    negate = option_of_yojson (value_for_key (boolean__of_yojson) "Negate") _list path;
    participant_role = option_of_yojson (value_for_key (participant_role_of_yojson) "ParticipantRole") _list path;
    relative_time_range = option_of_yojson (value_for_key (relative_time_range_of_yojson) "RelativeTimeRange") _list path;
    absolute_time_range = option_of_yojson (value_for_key (absolute_time_range_of_yojson) "AbsoluteTimeRange") _list path;
    transcript_filter_type = value_for_key (transcript_filter_type_of_yojson) "TranscriptFilterType" _list path;
    
  }
  in _res

let sentiment_value_of_yojson = 
  fun (tree: t) path : sentiment_value -> match tree with 
    | `String "MIXED" -> MIXED
    | `String "NEUTRAL" -> NEUTRAL
    | `String "NEGATIVE" -> NEGATIVE
    | `String "POSITIVE" -> POSITIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SentimentValue" value)
    | _ -> raise (deserialize_wrong_type_error path "SentimentValue")

let sentiment_value_list_of_yojson = 
  fun tree path -> list_of_yojson sentiment_value_of_yojson tree path 

let sentiment_filter_of_yojson = 
  fun tree path : sentiment_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : sentiment_filter = {
    negate = option_of_yojson (value_for_key (boolean__of_yojson) "Negate") _list path;
    participant_role = option_of_yojson (value_for_key (participant_role_of_yojson) "ParticipantRole") _list path;
    relative_time_range = option_of_yojson (value_for_key (relative_time_range_of_yojson) "RelativeTimeRange") _list path;
    absolute_time_range = option_of_yojson (value_for_key (absolute_time_range_of_yojson) "AbsoluteTimeRange") _list path;
    sentiments = value_for_key (sentiment_value_list_of_yojson) "Sentiments" _list path;
    
  }
  in _res

let rule_of_yojson = 
  fun (tree: t) path : rule ->
  let _list = assoc_of_yojson tree path in
  let key, value_ = match _list with
    | (key, value_) :: _ -> key, value_ 
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  match key with
    | "SentimentFilter" -> SentimentFilter (sentiment_filter_of_yojson value_ (path))
    | "TranscriptFilter" -> TranscriptFilter (transcript_filter_of_yojson value_ (path))
    | "InterruptionFilter" -> InterruptionFilter (interruption_filter_of_yojson value_ (path))
    | "NonTalkTimeFilter" -> NonTalkTimeFilter (non_talk_time_filter_of_yojson value_ (path))
    | _ as unknown -> raise(deserialize_unknown_enum_value_error path "Rule"
                           unknown)
  

let rule_list_of_yojson = 
  fun tree path -> list_of_yojson rule_of_yojson tree path 

let input_type_of_yojson = 
  fun (tree: t) path : input_type -> match tree with 
    | `String "POST_CALL" -> POST_CALL
    | `String "REAL_TIME" -> REAL_TIME
    | `String value -> raise (deserialize_unknown_enum_value_error path "InputType" value)
    | _ -> raise (deserialize_wrong_type_error path "InputType")

let category_properties_of_yojson = 
  fun tree path : category_properties ->
  let _list = assoc_of_yojson tree path in
  let _res : category_properties = {
    input_type = option_of_yojson (value_for_key (input_type_of_yojson) "InputType") _list path;
    last_update_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastUpdateTime") _list path;
    create_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreateTime") _list path;
    rules = option_of_yojson (value_for_key (rule_list_of_yojson) "Rules") _list path;
    category_name = option_of_yojson (value_for_key (category_name_of_yojson) "CategoryName") _list path;
    
  }
  in _res

let update_call_analytics_category_response_of_yojson = 
  fun tree path : update_call_analytics_category_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_call_analytics_category_response = {
    category_properties = option_of_yojson (value_for_key (category_properties_of_yojson) "CategoryProperties") _list path;
    
  }
  in _res

let update_call_analytics_category_request_of_yojson = 
  fun tree path : update_call_analytics_category_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_call_analytics_category_request = {
    input_type = option_of_yojson (value_for_key (input_type_of_yojson) "InputType") _list path;
    rules = value_for_key (rule_list_of_yojson) "Rules" _list path;
    category_name = value_for_key (category_name_of_yojson) "CategoryName" _list path;
    
  }
  in _res

let untag_resource_response_of_yojson = 
  fun tree path : untag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_response = ()
  in _res

let transcribe_arn_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "TagKeys" _list path;
    resource_arn = value_for_key (transcribe_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let type__of_yojson = 
  fun (tree: t) path : type_ -> match tree with 
    | `String "DICTATION" -> DICTATION
    | `String "CONVERSATION" -> CONVERSATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "Type" value)
    | _ -> raise (deserialize_wrong_type_error path "Type")

let transcription_job_name_of_yojson = string_of_yojson

let transcription_job_status_of_yojson = 
  fun (tree: t) path : transcription_job_status -> match tree with 
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TranscriptionJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TranscriptionJobStatus")

let output_location_type_of_yojson = 
  fun (tree: t) path : output_location_type -> match tree with 
    | `String "SERVICE_BUCKET" -> SERVICE_BUCKET
    | `String "CUSTOMER_BUCKET" -> CUSTOMER_BUCKET
    | `String value -> raise (deserialize_unknown_enum_value_error path "OutputLocationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OutputLocationType")

let redaction_type_of_yojson = 
  fun (tree: t) path : redaction_type -> match tree with 
    | `String "PII" -> PII
    | `String value -> raise (deserialize_unknown_enum_value_error path "RedactionType" value)
    | _ -> raise (deserialize_wrong_type_error path "RedactionType")

let redaction_output_of_yojson = 
  fun (tree: t) path : redaction_output -> match tree with 
    | `String "redacted_and_unredacted" -> REDACTED_AND_UNREDACTED
    | `String "redacted" -> REDACTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RedactionOutput" value)
    | _ -> raise (deserialize_wrong_type_error path "RedactionOutput")

let pii_entity_type_of_yojson = 
  fun (tree: t) path : pii_entity_type -> match tree with 
    | `String "ALL" -> ALL
    | `String "SSN" -> SSN
    | `String "PHONE" -> PHONE
    | `String "NAME" -> NAME
    | `String "ADDRESS" -> ADDRESS
    | `String "EMAIL" -> EMAIL
    | `String "PIN" -> PIN
    | `String "CREDIT_DEBIT_EXPIRY" -> CREDIT_DEBIT_EXPIRY
    | `String "CREDIT_DEBIT_CVV" -> CREDIT_DEBIT_CVV
    | `String "CREDIT_DEBIT_NUMBER" -> CREDIT_DEBIT_NUMBER
    | `String "BANK_ROUTING" -> BANK_ROUTING
    | `String "BANK_ACCOUNT_NUMBER" -> BANK_ACCOUNT_NUMBER
    | `String value -> raise (deserialize_unknown_enum_value_error path "PiiEntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "PiiEntityType")

let pii_entity_types_of_yojson = 
  fun tree path -> list_of_yojson pii_entity_type_of_yojson tree path 

let content_redaction_of_yojson = 
  fun tree path : content_redaction ->
  let _list = assoc_of_yojson tree path in
  let _res : content_redaction = {
    pii_entity_types = option_of_yojson (value_for_key (pii_entity_types_of_yojson) "PiiEntityTypes") _list path;
    redaction_output = value_for_key (redaction_output_of_yojson) "RedactionOutput" _list path;
    redaction_type = value_for_key (redaction_type_of_yojson) "RedactionType" _list path;
    
  }
  in _res

let model_name_of_yojson = string_of_yojson

let model_settings_of_yojson = 
  fun tree path : model_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : model_settings = {
    language_model_name = option_of_yojson (value_for_key (model_name_of_yojson) "LanguageModelName") _list path;
    
  }
  in _res

let identified_language_score_of_yojson = float_of_yojson

let duration_in_seconds_of_yojson = float_of_yojson

let language_code_item_of_yojson = 
  fun tree path : language_code_item ->
  let _list = assoc_of_yojson tree path in
  let _res : language_code_item = {
    duration_in_seconds = option_of_yojson (value_for_key (duration_in_seconds_of_yojson) "DurationInSeconds") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    
  }
  in _res

let language_code_list_of_yojson = 
  fun tree path -> list_of_yojson language_code_item_of_yojson tree path 

let toxicity_category_of_yojson = 
  fun (tree: t) path : toxicity_category -> match tree with 
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ToxicityCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "ToxicityCategory")

let toxicity_categories_of_yojson = 
  fun tree path -> list_of_yojson toxicity_category_of_yojson tree path 

let toxicity_detection_settings_of_yojson = 
  fun tree path : toxicity_detection_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : toxicity_detection_settings = {
    toxicity_categories = value_for_key (toxicity_categories_of_yojson) "ToxicityCategories" _list path;
    
  }
  in _res

let toxicity_detection_of_yojson = 
  fun tree path -> list_of_yojson toxicity_detection_settings_of_yojson tree path 

let transcription_job_summary_of_yojson = 
  fun tree path : transcription_job_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : transcription_job_summary = {
    toxicity_detection = option_of_yojson (value_for_key (toxicity_detection_of_yojson) "ToxicityDetection") _list path;
    language_codes = option_of_yojson (value_for_key (language_code_list_of_yojson) "LanguageCodes") _list path;
    identified_language_score = option_of_yojson (value_for_key (identified_language_score_of_yojson) "IdentifiedLanguageScore") _list path;
    identify_multiple_languages = option_of_yojson (value_for_key (boolean__of_yojson) "IdentifyMultipleLanguages") _list path;
    identify_language = option_of_yojson (value_for_key (boolean__of_yojson) "IdentifyLanguage") _list path;
    model_settings = option_of_yojson (value_for_key (model_settings_of_yojson) "ModelSettings") _list path;
    content_redaction = option_of_yojson (value_for_key (content_redaction_of_yojson) "ContentRedaction") _list path;
    output_location_type = option_of_yojson (value_for_key (output_location_type_of_yojson) "OutputLocationType") _list path;
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    transcription_job_status = option_of_yojson (value_for_key (transcription_job_status_of_yojson) "TranscriptionJobStatus") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    completion_time = option_of_yojson (value_for_key (date_time_of_yojson) "CompletionTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    creation_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreationTime") _list path;
    transcription_job_name = option_of_yojson (value_for_key (transcription_job_name_of_yojson) "TranscriptionJobName") _list path;
    
  }
  in _res

let transcription_job_summaries_of_yojson = 
  fun tree path -> list_of_yojson transcription_job_summary_of_yojson tree path 

let media_sample_rate_hertz_of_yojson = int_of_yojson

let media_format_of_yojson = 
  fun (tree: t) path : media_format -> match tree with 
    | `String "m4a" -> M4A
    | `String "webm" -> WEBM
    | `String "amr" -> AMR
    | `String "ogg" -> OGG
    | `String "flac" -> FLAC
    | `String "wav" -> WAV
    | `String "mp4" -> MP4
    | `String "mp3" -> MP3
    | `String value -> raise (deserialize_unknown_enum_value_error path "MediaFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "MediaFormat")

let media_of_yojson = 
  fun tree path : media ->
  let _list = assoc_of_yojson tree path in
  let _res : media = {
    redacted_media_file_uri = option_of_yojson (value_for_key (uri_of_yojson) "RedactedMediaFileUri") _list path;
    media_file_uri = option_of_yojson (value_for_key (uri_of_yojson) "MediaFileUri") _list path;
    
  }
  in _res

let transcript_of_yojson = 
  fun tree path : transcript ->
  let _list = assoc_of_yojson tree path in
  let _res : transcript = {
    redacted_transcript_file_uri = option_of_yojson (value_for_key (uri_of_yojson) "RedactedTranscriptFileUri") _list path;
    transcript_file_uri = option_of_yojson (value_for_key (uri_of_yojson) "TranscriptFileUri") _list path;
    
  }
  in _res

let max_speakers_of_yojson = int_of_yojson

let max_alternatives_of_yojson = int_of_yojson

let settings_of_yojson = 
  fun tree path : settings ->
  let _list = assoc_of_yojson tree path in
  let _res : settings = {
    vocabulary_filter_method = option_of_yojson (value_for_key (vocabulary_filter_method_of_yojson) "VocabularyFilterMethod") _list path;
    vocabulary_filter_name = option_of_yojson (value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName") _list path;
    max_alternatives = option_of_yojson (value_for_key (max_alternatives_of_yojson) "MaxAlternatives") _list path;
    show_alternatives = option_of_yojson (value_for_key (boolean__of_yojson) "ShowAlternatives") _list path;
    channel_identification = option_of_yojson (value_for_key (boolean__of_yojson) "ChannelIdentification") _list path;
    max_speaker_labels = option_of_yojson (value_for_key (max_speakers_of_yojson) "MaxSpeakerLabels") _list path;
    show_speaker_labels = option_of_yojson (value_for_key (boolean__of_yojson) "ShowSpeakerLabels") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    
  }
  in _res

let job_execution_settings_of_yojson = 
  fun tree path : job_execution_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : job_execution_settings = {
    data_access_role_arn = option_of_yojson (value_for_key (data_access_role_arn_of_yojson) "DataAccessRoleArn") _list path;
    allow_deferred_execution = option_of_yojson (value_for_key (boolean__of_yojson) "AllowDeferredExecution") _list path;
    
  }
  in _res

let language_options_of_yojson = 
  fun tree path -> list_of_yojson language_code_of_yojson tree path 

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = value_for_key (tag_value_of_yojson) "Value" _list path;
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let subtitle_format_of_yojson = 
  fun (tree: t) path : subtitle_format -> match tree with 
    | `String "srt" -> SRT
    | `String "vtt" -> VTT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SubtitleFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "SubtitleFormat")

let subtitle_formats_of_yojson = 
  fun tree path -> list_of_yojson subtitle_format_of_yojson tree path 

let subtitle_file_uris_of_yojson = 
  fun tree path -> list_of_yojson uri_of_yojson tree path 

let subtitle_output_start_index_of_yojson = int_of_yojson

let subtitles_output_of_yojson = 
  fun tree path : subtitles_output ->
  let _list = assoc_of_yojson tree path in
  let _res : subtitles_output = {
    output_start_index = option_of_yojson (value_for_key (subtitle_output_start_index_of_yojson) "OutputStartIndex") _list path;
    subtitle_file_uris = option_of_yojson (value_for_key (subtitle_file_uris_of_yojson) "SubtitleFileUris") _list path;
    formats = option_of_yojson (value_for_key (subtitle_formats_of_yojson) "Formats") _list path;
    
  }
  in _res

let language_id_settings_of_yojson = 
  fun tree path : language_id_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : language_id_settings = {
    language_model_name = option_of_yojson (value_for_key (model_name_of_yojson) "LanguageModelName") _list path;
    vocabulary_filter_name = option_of_yojson (value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    
  }
  in _res

let language_id_settings_map_of_yojson = 
  fun tree path -> map_of_yojson language_id_settings_of_yojson tree path

let transcription_job_of_yojson = 
  fun tree path : transcription_job ->
  let _list = assoc_of_yojson tree path in
  let _res : transcription_job = {
    toxicity_detection = option_of_yojson (value_for_key (toxicity_detection_of_yojson) "ToxicityDetection") _list path;
    language_id_settings = option_of_yojson (value_for_key (language_id_settings_map_of_yojson) "LanguageIdSettings") _list path;
    subtitles = option_of_yojson (value_for_key (subtitles_output_of_yojson) "Subtitles") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    language_codes = option_of_yojson (value_for_key (language_code_list_of_yojson) "LanguageCodes") _list path;
    identified_language_score = option_of_yojson (value_for_key (identified_language_score_of_yojson) "IdentifiedLanguageScore") _list path;
    language_options = option_of_yojson (value_for_key (language_options_of_yojson) "LanguageOptions") _list path;
    identify_multiple_languages = option_of_yojson (value_for_key (boolean__of_yojson) "IdentifyMultipleLanguages") _list path;
    identify_language = option_of_yojson (value_for_key (boolean__of_yojson) "IdentifyLanguage") _list path;
    content_redaction = option_of_yojson (value_for_key (content_redaction_of_yojson) "ContentRedaction") _list path;
    job_execution_settings = option_of_yojson (value_for_key (job_execution_settings_of_yojson) "JobExecutionSettings") _list path;
    model_settings = option_of_yojson (value_for_key (model_settings_of_yojson) "ModelSettings") _list path;
    settings = option_of_yojson (value_for_key (settings_of_yojson) "Settings") _list path;
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    completion_time = option_of_yojson (value_for_key (date_time_of_yojson) "CompletionTime") _list path;
    creation_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreationTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    transcript = option_of_yojson (value_for_key (transcript_of_yojson) "Transcript") _list path;
    media = option_of_yojson (value_for_key (media_of_yojson) "Media") _list path;
    media_format = option_of_yojson (value_for_key (media_format_of_yojson) "MediaFormat") _list path;
    media_sample_rate_hertz = option_of_yojson (value_for_key (media_sample_rate_hertz_of_yojson) "MediaSampleRateHertz") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    transcription_job_status = option_of_yojson (value_for_key (transcription_job_status_of_yojson) "TranscriptionJobStatus") _list path;
    transcription_job_name = option_of_yojson (value_for_key (transcription_job_name_of_yojson) "TranscriptionJobName") _list path;
    
  }
  in _res

let tag_resource_response_of_yojson = 
  fun tree path : tag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_response = ()
  in _res

let tag_resource_request_of_yojson = 
  fun tree path : tag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    resource_arn = value_for_key (transcribe_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let start_transcription_job_response_of_yojson = 
  fun tree path : start_transcription_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_transcription_job_response = {
    transcription_job = option_of_yojson (value_for_key (transcription_job_of_yojson) "TranscriptionJob") _list path;
    
  }
  in _res

let output_bucket_name_of_yojson = string_of_yojson

let output_key_of_yojson = string_of_yojson

let kms_key_id_of_yojson = string_of_yojson

let kms_encryption_context_map_of_yojson = 
  fun tree path -> map_of_yojson non_empty_string_of_yojson tree path

let subtitles_of_yojson = 
  fun tree path : subtitles ->
  let _list = assoc_of_yojson tree path in
  let _res : subtitles = {
    output_start_index = option_of_yojson (value_for_key (subtitle_output_start_index_of_yojson) "OutputStartIndex") _list path;
    formats = option_of_yojson (value_for_key (subtitle_formats_of_yojson) "Formats") _list path;
    
  }
  in _res

let start_transcription_job_request_of_yojson = 
  fun tree path : start_transcription_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_transcription_job_request = {
    toxicity_detection = option_of_yojson (value_for_key (toxicity_detection_of_yojson) "ToxicityDetection") _list path;
    language_id_settings = option_of_yojson (value_for_key (language_id_settings_map_of_yojson) "LanguageIdSettings") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    subtitles = option_of_yojson (value_for_key (subtitles_of_yojson) "Subtitles") _list path;
    language_options = option_of_yojson (value_for_key (language_options_of_yojson) "LanguageOptions") _list path;
    identify_multiple_languages = option_of_yojson (value_for_key (boolean__of_yojson) "IdentifyMultipleLanguages") _list path;
    identify_language = option_of_yojson (value_for_key (boolean__of_yojson) "IdentifyLanguage") _list path;
    content_redaction = option_of_yojson (value_for_key (content_redaction_of_yojson) "ContentRedaction") _list path;
    job_execution_settings = option_of_yojson (value_for_key (job_execution_settings_of_yojson) "JobExecutionSettings") _list path;
    model_settings = option_of_yojson (value_for_key (model_settings_of_yojson) "ModelSettings") _list path;
    settings = option_of_yojson (value_for_key (settings_of_yojson) "Settings") _list path;
    kms_encryption_context = option_of_yojson (value_for_key (kms_encryption_context_map_of_yojson) "KMSEncryptionContext") _list path;
    output_encryption_kms_key_id = option_of_yojson (value_for_key (kms_key_id_of_yojson) "OutputEncryptionKMSKeyId") _list path;
    output_key = option_of_yojson (value_for_key (output_key_of_yojson) "OutputKey") _list path;
    output_bucket_name = option_of_yojson (value_for_key (output_bucket_name_of_yojson) "OutputBucketName") _list path;
    media = value_for_key (media_of_yojson) "Media" _list path;
    media_format = option_of_yojson (value_for_key (media_format_of_yojson) "MediaFormat") _list path;
    media_sample_rate_hertz = option_of_yojson (value_for_key (media_sample_rate_hertz_of_yojson) "MediaSampleRateHertz") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    transcription_job_name = value_for_key (transcription_job_name_of_yojson) "TranscriptionJobName" _list path;
    
  }
  in _res

let medical_media_sample_rate_hertz_of_yojson = int_of_yojson

let medical_transcript_of_yojson = 
  fun tree path : medical_transcript ->
  let _list = assoc_of_yojson tree path in
  let _res : medical_transcript = {
    transcript_file_uri = option_of_yojson (value_for_key (uri_of_yojson) "TranscriptFileUri") _list path;
    
  }
  in _res

let medical_transcription_setting_of_yojson = 
  fun tree path : medical_transcription_setting ->
  let _list = assoc_of_yojson tree path in
  let _res : medical_transcription_setting = {
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    max_alternatives = option_of_yojson (value_for_key (max_alternatives_of_yojson) "MaxAlternatives") _list path;
    show_alternatives = option_of_yojson (value_for_key (boolean__of_yojson) "ShowAlternatives") _list path;
    channel_identification = option_of_yojson (value_for_key (boolean__of_yojson) "ChannelIdentification") _list path;
    max_speaker_labels = option_of_yojson (value_for_key (max_speakers_of_yojson) "MaxSpeakerLabels") _list path;
    show_speaker_labels = option_of_yojson (value_for_key (boolean__of_yojson) "ShowSpeakerLabels") _list path;
    
  }
  in _res

let medical_content_identification_type_of_yojson = 
  fun (tree: t) path : medical_content_identification_type -> match tree with 
    | `String "PHI" -> PHI
    | `String value -> raise (deserialize_unknown_enum_value_error path "MedicalContentIdentificationType" value)
    | _ -> raise (deserialize_wrong_type_error path "MedicalContentIdentificationType")

let specialty_of_yojson = 
  fun (tree: t) path : specialty -> match tree with 
    | `String "PRIMARYCARE" -> PRIMARYCARE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Specialty" value)
    | _ -> raise (deserialize_wrong_type_error path "Specialty")

let medical_transcription_job_of_yojson = 
  fun tree path : medical_transcription_job ->
  let _list = assoc_of_yojson tree path in
  let _res : medical_transcription_job = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    type_ = option_of_yojson (value_for_key (type__of_yojson) "Type") _list path;
    specialty = option_of_yojson (value_for_key (specialty_of_yojson) "Specialty") _list path;
    content_identification_type = option_of_yojson (value_for_key (medical_content_identification_type_of_yojson) "ContentIdentificationType") _list path;
    settings = option_of_yojson (value_for_key (medical_transcription_setting_of_yojson) "Settings") _list path;
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    completion_time = option_of_yojson (value_for_key (date_time_of_yojson) "CompletionTime") _list path;
    creation_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreationTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    transcript = option_of_yojson (value_for_key (medical_transcript_of_yojson) "Transcript") _list path;
    media = option_of_yojson (value_for_key (media_of_yojson) "Media") _list path;
    media_format = option_of_yojson (value_for_key (media_format_of_yojson) "MediaFormat") _list path;
    media_sample_rate_hertz = option_of_yojson (value_for_key (medical_media_sample_rate_hertz_of_yojson) "MediaSampleRateHertz") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    transcription_job_status = option_of_yojson (value_for_key (transcription_job_status_of_yojson) "TranscriptionJobStatus") _list path;
    medical_transcription_job_name = option_of_yojson (value_for_key (transcription_job_name_of_yojson) "MedicalTranscriptionJobName") _list path;
    
  }
  in _res

let start_medical_transcription_job_response_of_yojson = 
  fun tree path : start_medical_transcription_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_medical_transcription_job_response = {
    medical_transcription_job = option_of_yojson (value_for_key (medical_transcription_job_of_yojson) "MedicalTranscriptionJob") _list path;
    
  }
  in _res

let start_medical_transcription_job_request_of_yojson = 
  fun tree path : start_medical_transcription_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_medical_transcription_job_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    type_ = value_for_key (type__of_yojson) "Type" _list path;
    specialty = value_for_key (specialty_of_yojson) "Specialty" _list path;
    content_identification_type = option_of_yojson (value_for_key (medical_content_identification_type_of_yojson) "ContentIdentificationType") _list path;
    settings = option_of_yojson (value_for_key (medical_transcription_setting_of_yojson) "Settings") _list path;
    kms_encryption_context = option_of_yojson (value_for_key (kms_encryption_context_map_of_yojson) "KMSEncryptionContext") _list path;
    output_encryption_kms_key_id = option_of_yojson (value_for_key (kms_key_id_of_yojson) "OutputEncryptionKMSKeyId") _list path;
    output_key = option_of_yojson (value_for_key (output_key_of_yojson) "OutputKey") _list path;
    output_bucket_name = value_for_key (output_bucket_name_of_yojson) "OutputBucketName" _list path;
    media = value_for_key (media_of_yojson) "Media" _list path;
    media_format = option_of_yojson (value_for_key (media_format_of_yojson) "MediaFormat") _list path;
    media_sample_rate_hertz = option_of_yojson (value_for_key (medical_media_sample_rate_hertz_of_yojson) "MediaSampleRateHertz") _list path;
    language_code = value_for_key (language_code_of_yojson) "LanguageCode" _list path;
    medical_transcription_job_name = value_for_key (transcription_job_name_of_yojson) "MedicalTranscriptionJobName" _list path;
    
  }
  in _res

let medical_scribe_job_status_of_yojson = 
  fun (tree: t) path : medical_scribe_job_status -> match tree with 
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "MedicalScribeJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MedicalScribeJobStatus")

let medical_scribe_language_code_of_yojson = 
  fun (tree: t) path : medical_scribe_language_code -> match tree with 
    | `String "en-US" -> EN_US
    | `String value -> raise (deserialize_unknown_enum_value_error path "MedicalScribeLanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "MedicalScribeLanguageCode")

let medical_scribe_output_of_yojson = 
  fun tree path : medical_scribe_output ->
  let _list = assoc_of_yojson tree path in
  let _res : medical_scribe_output = {
    clinical_document_uri = value_for_key (uri_of_yojson) "ClinicalDocumentUri" _list path;
    transcript_file_uri = value_for_key (uri_of_yojson) "TranscriptFileUri" _list path;
    
  }
  in _res

let medical_scribe_settings_of_yojson = 
  fun tree path : medical_scribe_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : medical_scribe_settings = {
    vocabulary_filter_method = option_of_yojson (value_for_key (vocabulary_filter_method_of_yojson) "VocabularyFilterMethod") _list path;
    vocabulary_filter_name = option_of_yojson (value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    channel_identification = option_of_yojson (value_for_key (boolean__of_yojson) "ChannelIdentification") _list path;
    max_speaker_labels = option_of_yojson (value_for_key (max_speakers_of_yojson) "MaxSpeakerLabels") _list path;
    show_speaker_labels = option_of_yojson (value_for_key (boolean__of_yojson) "ShowSpeakerLabels") _list path;
    
  }
  in _res

let medical_scribe_channel_id_of_yojson = int_of_yojson

let medical_scribe_participant_role_of_yojson = 
  fun (tree: t) path : medical_scribe_participant_role -> match tree with 
    | `String "CLINICIAN" -> CLINICIAN
    | `String "PATIENT" -> PATIENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "MedicalScribeParticipantRole" value)
    | _ -> raise (deserialize_wrong_type_error path "MedicalScribeParticipantRole")

let medical_scribe_channel_definition_of_yojson = 
  fun tree path : medical_scribe_channel_definition ->
  let _list = assoc_of_yojson tree path in
  let _res : medical_scribe_channel_definition = {
    participant_role = value_for_key (medical_scribe_participant_role_of_yojson) "ParticipantRole" _list path;
    channel_id = value_for_key (medical_scribe_channel_id_of_yojson) "ChannelId" _list path;
    
  }
  in _res

let medical_scribe_channel_definitions_of_yojson = 
  fun tree path -> list_of_yojson medical_scribe_channel_definition_of_yojson tree path 

let medical_scribe_job_of_yojson = 
  fun tree path : medical_scribe_job ->
  let _list = assoc_of_yojson tree path in
  let _res : medical_scribe_job = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    channel_definitions = option_of_yojson (value_for_key (medical_scribe_channel_definitions_of_yojson) "ChannelDefinitions") _list path;
    data_access_role_arn = option_of_yojson (value_for_key (data_access_role_arn_of_yojson) "DataAccessRoleArn") _list path;
    settings = option_of_yojson (value_for_key (medical_scribe_settings_of_yojson) "Settings") _list path;
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    completion_time = option_of_yojson (value_for_key (date_time_of_yojson) "CompletionTime") _list path;
    creation_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreationTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    medical_scribe_output = option_of_yojson (value_for_key (medical_scribe_output_of_yojson) "MedicalScribeOutput") _list path;
    media = option_of_yojson (value_for_key (media_of_yojson) "Media") _list path;
    language_code = option_of_yojson (value_for_key (medical_scribe_language_code_of_yojson) "LanguageCode") _list path;
    medical_scribe_job_status = option_of_yojson (value_for_key (medical_scribe_job_status_of_yojson) "MedicalScribeJobStatus") _list path;
    medical_scribe_job_name = option_of_yojson (value_for_key (transcription_job_name_of_yojson) "MedicalScribeJobName") _list path;
    
  }
  in _res

let start_medical_scribe_job_response_of_yojson = 
  fun tree path : start_medical_scribe_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_medical_scribe_job_response = {
    medical_scribe_job = option_of_yojson (value_for_key (medical_scribe_job_of_yojson) "MedicalScribeJob") _list path;
    
  }
  in _res

let start_medical_scribe_job_request_of_yojson = 
  fun tree path : start_medical_scribe_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_medical_scribe_job_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    channel_definitions = option_of_yojson (value_for_key (medical_scribe_channel_definitions_of_yojson) "ChannelDefinitions") _list path;
    settings = value_for_key (medical_scribe_settings_of_yojson) "Settings" _list path;
    data_access_role_arn = value_for_key (data_access_role_arn_of_yojson) "DataAccessRoleArn" _list path;
    kms_encryption_context = option_of_yojson (value_for_key (kms_encryption_context_map_of_yojson) "KMSEncryptionContext") _list path;
    output_encryption_kms_key_id = option_of_yojson (value_for_key (kms_key_id_of_yojson) "OutputEncryptionKMSKeyId") _list path;
    output_bucket_name = value_for_key (output_bucket_name_of_yojson) "OutputBucketName" _list path;
    media = value_for_key (media_of_yojson) "Media" _list path;
    medical_scribe_job_name = value_for_key (transcription_job_name_of_yojson) "MedicalScribeJobName" _list path;
    
  }
  in _res

let call_analytics_job_name_of_yojson = string_of_yojson

let call_analytics_job_status_of_yojson = 
  fun (tree: t) path : call_analytics_job_status -> match tree with 
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CallAnalyticsJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CallAnalyticsJobStatus")

let call_analytics_feature_of_yojson = 
  fun (tree: t) path : call_analytics_feature -> match tree with 
    | `String "GENERATIVE_SUMMARIZATION" -> GENERATIVE_SUMMARIZATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "CallAnalyticsFeature" value)
    | _ -> raise (deserialize_wrong_type_error path "CallAnalyticsFeature")

let call_analytics_skipped_reason_code_of_yojson = 
  fun (tree: t) path : call_analytics_skipped_reason_code -> match tree with 
    | `String "FAILED_SAFETY_GUIDELINES" -> FAILED_SAFETY_GUIDELINES
    | `String "INSUFFICIENT_CONVERSATION_CONTENT" -> INSUFFICIENT_CONVERSATION_CONTENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "CallAnalyticsSkippedReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CallAnalyticsSkippedReasonCode")

let call_analytics_skipped_feature_of_yojson = 
  fun tree path : call_analytics_skipped_feature ->
  let _list = assoc_of_yojson tree path in
  let _res : call_analytics_skipped_feature = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    reason_code = option_of_yojson (value_for_key (call_analytics_skipped_reason_code_of_yojson) "ReasonCode") _list path;
    feature = option_of_yojson (value_for_key (call_analytics_feature_of_yojson) "Feature") _list path;
    
  }
  in _res

let call_analytics_skipped_feature_list_of_yojson = 
  fun tree path -> list_of_yojson call_analytics_skipped_feature_of_yojson tree path 

let call_analytics_job_details_of_yojson = 
  fun tree path : call_analytics_job_details ->
  let _list = assoc_of_yojson tree path in
  let _res : call_analytics_job_details = {
    skipped = option_of_yojson (value_for_key (call_analytics_skipped_feature_list_of_yojson) "Skipped") _list path;
    
  }
  in _res

let summarization_of_yojson = 
  fun tree path : summarization ->
  let _list = assoc_of_yojson tree path in
  let _res : summarization = {
    generate_abstractive_summary = value_for_key (boolean__of_yojson) "GenerateAbstractiveSummary" _list path;
    
  }
  in _res

let call_analytics_job_settings_of_yojson = 
  fun tree path : call_analytics_job_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : call_analytics_job_settings = {
    summarization = option_of_yojson (value_for_key (summarization_of_yojson) "Summarization") _list path;
    language_id_settings = option_of_yojson (value_for_key (language_id_settings_map_of_yojson) "LanguageIdSettings") _list path;
    language_options = option_of_yojson (value_for_key (language_options_of_yojson) "LanguageOptions") _list path;
    content_redaction = option_of_yojson (value_for_key (content_redaction_of_yojson) "ContentRedaction") _list path;
    language_model_name = option_of_yojson (value_for_key (model_name_of_yojson) "LanguageModelName") _list path;
    vocabulary_filter_method = option_of_yojson (value_for_key (vocabulary_filter_method_of_yojson) "VocabularyFilterMethod") _list path;
    vocabulary_filter_name = option_of_yojson (value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    
  }
  in _res

let channel_id_of_yojson = int_of_yojson

let channel_definition_of_yojson = 
  fun tree path : channel_definition ->
  let _list = assoc_of_yojson tree path in
  let _res : channel_definition = {
    participant_role = option_of_yojson (value_for_key (participant_role_of_yojson) "ParticipantRole") _list path;
    channel_id = option_of_yojson (value_for_key (channel_id_of_yojson) "ChannelId") _list path;
    
  }
  in _res

let channel_definitions_of_yojson = 
  fun tree path -> list_of_yojson channel_definition_of_yojson tree path 

let call_analytics_job_of_yojson = 
  fun tree path : call_analytics_job ->
  let _list = assoc_of_yojson tree path in
  let _res : call_analytics_job = {
    channel_definitions = option_of_yojson (value_for_key (channel_definitions_of_yojson) "ChannelDefinitions") _list path;
    settings = option_of_yojson (value_for_key (call_analytics_job_settings_of_yojson) "Settings") _list path;
    identified_language_score = option_of_yojson (value_for_key (identified_language_score_of_yojson) "IdentifiedLanguageScore") _list path;
    data_access_role_arn = option_of_yojson (value_for_key (data_access_role_arn_of_yojson) "DataAccessRoleArn") _list path;
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    completion_time = option_of_yojson (value_for_key (date_time_of_yojson) "CompletionTime") _list path;
    creation_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreationTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    transcript = option_of_yojson (value_for_key (transcript_of_yojson) "Transcript") _list path;
    media = option_of_yojson (value_for_key (media_of_yojson) "Media") _list path;
    media_format = option_of_yojson (value_for_key (media_format_of_yojson) "MediaFormat") _list path;
    media_sample_rate_hertz = option_of_yojson (value_for_key (media_sample_rate_hertz_of_yojson) "MediaSampleRateHertz") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    call_analytics_job_details = option_of_yojson (value_for_key (call_analytics_job_details_of_yojson) "CallAnalyticsJobDetails") _list path;
    call_analytics_job_status = option_of_yojson (value_for_key (call_analytics_job_status_of_yojson) "CallAnalyticsJobStatus") _list path;
    call_analytics_job_name = option_of_yojson (value_for_key (call_analytics_job_name_of_yojson) "CallAnalyticsJobName") _list path;
    
  }
  in _res

let start_call_analytics_job_response_of_yojson = 
  fun tree path : start_call_analytics_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_call_analytics_job_response = {
    call_analytics_job = option_of_yojson (value_for_key (call_analytics_job_of_yojson) "CallAnalyticsJob") _list path;
    
  }
  in _res

let start_call_analytics_job_request_of_yojson = 
  fun tree path : start_call_analytics_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_call_analytics_job_request = {
    channel_definitions = option_of_yojson (value_for_key (channel_definitions_of_yojson) "ChannelDefinitions") _list path;
    settings = option_of_yojson (value_for_key (call_analytics_job_settings_of_yojson) "Settings") _list path;
    data_access_role_arn = option_of_yojson (value_for_key (data_access_role_arn_of_yojson) "DataAccessRoleArn") _list path;
    output_encryption_kms_key_id = option_of_yojson (value_for_key (kms_key_id_of_yojson) "OutputEncryptionKMSKeyId") _list path;
    output_location = option_of_yojson (value_for_key (uri_of_yojson) "OutputLocation") _list path;
    media = value_for_key (media_of_yojson) "Media" _list path;
    call_analytics_job_name = value_for_key (call_analytics_job_name_of_yojson) "CallAnalyticsJobName" _list path;
    
  }
  in _res

let next_token_of_yojson = string_of_yojson

let list_vocabulary_filters_response_of_yojson = 
  fun tree path : list_vocabulary_filters_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_vocabulary_filters_response = {
    vocabulary_filters = option_of_yojson (value_for_key (vocabulary_filters_of_yojson) "VocabularyFilters") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let max_results_of_yojson = int_of_yojson

let list_vocabulary_filters_request_of_yojson = 
  fun tree path : list_vocabulary_filters_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_vocabulary_filters_request = {
    name_contains = option_of_yojson (value_for_key (vocabulary_filter_name_of_yojson) "NameContains") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let list_vocabularies_response_of_yojson = 
  fun tree path : list_vocabularies_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_vocabularies_response = {
    vocabularies = option_of_yojson (value_for_key (vocabularies_of_yojson) "Vocabularies") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    status = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "Status") _list path;
    
  }
  in _res

let list_vocabularies_request_of_yojson = 
  fun tree path : list_vocabularies_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_vocabularies_request = {
    name_contains = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "NameContains") _list path;
    state_equals = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "StateEquals") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let list_transcription_jobs_response_of_yojson = 
  fun tree path : list_transcription_jobs_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_transcription_jobs_response = {
    transcription_job_summaries = option_of_yojson (value_for_key (transcription_job_summaries_of_yojson) "TranscriptionJobSummaries") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    status = option_of_yojson (value_for_key (transcription_job_status_of_yojson) "Status") _list path;
    
  }
  in _res

let list_transcription_jobs_request_of_yojson = 
  fun tree path : list_transcription_jobs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_transcription_jobs_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    job_name_contains = option_of_yojson (value_for_key (transcription_job_name_of_yojson) "JobNameContains") _list path;
    status = option_of_yojson (value_for_key (transcription_job_status_of_yojson) "Status") _list path;
    
  }
  in _res

let list_tags_for_resource_response_of_yojson = 
  fun tree path : list_tags_for_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_response = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    resource_arn = option_of_yojson (value_for_key (transcribe_arn_of_yojson) "ResourceArn") _list path;
    
  }
  in _res

let list_tags_for_resource_request_of_yojson = 
  fun tree path : list_tags_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request = {
    resource_arn = value_for_key (transcribe_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let list_medical_vocabularies_response_of_yojson = 
  fun tree path : list_medical_vocabularies_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_vocabularies_response = {
    vocabularies = option_of_yojson (value_for_key (vocabularies_of_yojson) "Vocabularies") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    status = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "Status") _list path;
    
  }
  in _res

let list_medical_vocabularies_request_of_yojson = 
  fun tree path : list_medical_vocabularies_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_vocabularies_request = {
    name_contains = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "NameContains") _list path;
    state_equals = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "StateEquals") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let medical_transcription_job_summary_of_yojson = 
  fun tree path : medical_transcription_job_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : medical_transcription_job_summary = {
    type_ = option_of_yojson (value_for_key (type__of_yojson) "Type") _list path;
    content_identification_type = option_of_yojson (value_for_key (medical_content_identification_type_of_yojson) "ContentIdentificationType") _list path;
    specialty = option_of_yojson (value_for_key (specialty_of_yojson) "Specialty") _list path;
    output_location_type = option_of_yojson (value_for_key (output_location_type_of_yojson) "OutputLocationType") _list path;
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    transcription_job_status = option_of_yojson (value_for_key (transcription_job_status_of_yojson) "TranscriptionJobStatus") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    completion_time = option_of_yojson (value_for_key (date_time_of_yojson) "CompletionTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    creation_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreationTime") _list path;
    medical_transcription_job_name = option_of_yojson (value_for_key (transcription_job_name_of_yojson) "MedicalTranscriptionJobName") _list path;
    
  }
  in _res

let medical_transcription_job_summaries_of_yojson = 
  fun tree path -> list_of_yojson medical_transcription_job_summary_of_yojson tree path 

let list_medical_transcription_jobs_response_of_yojson = 
  fun tree path : list_medical_transcription_jobs_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_transcription_jobs_response = {
    medical_transcription_job_summaries = option_of_yojson (value_for_key (medical_transcription_job_summaries_of_yojson) "MedicalTranscriptionJobSummaries") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    status = option_of_yojson (value_for_key (transcription_job_status_of_yojson) "Status") _list path;
    
  }
  in _res

let list_medical_transcription_jobs_request_of_yojson = 
  fun tree path : list_medical_transcription_jobs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_transcription_jobs_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    job_name_contains = option_of_yojson (value_for_key (transcription_job_name_of_yojson) "JobNameContains") _list path;
    status = option_of_yojson (value_for_key (transcription_job_status_of_yojson) "Status") _list path;
    
  }
  in _res

let medical_scribe_job_summary_of_yojson = 
  fun tree path : medical_scribe_job_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : medical_scribe_job_summary = {
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    medical_scribe_job_status = option_of_yojson (value_for_key (medical_scribe_job_status_of_yojson) "MedicalScribeJobStatus") _list path;
    language_code = option_of_yojson (value_for_key (medical_scribe_language_code_of_yojson) "LanguageCode") _list path;
    completion_time = option_of_yojson (value_for_key (date_time_of_yojson) "CompletionTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    creation_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreationTime") _list path;
    medical_scribe_job_name = option_of_yojson (value_for_key (transcription_job_name_of_yojson) "MedicalScribeJobName") _list path;
    
  }
  in _res

let medical_scribe_job_summaries_of_yojson = 
  fun tree path -> list_of_yojson medical_scribe_job_summary_of_yojson tree path 

let list_medical_scribe_jobs_response_of_yojson = 
  fun tree path : list_medical_scribe_jobs_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_scribe_jobs_response = {
    medical_scribe_job_summaries = option_of_yojson (value_for_key (medical_scribe_job_summaries_of_yojson) "MedicalScribeJobSummaries") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    status = option_of_yojson (value_for_key (medical_scribe_job_status_of_yojson) "Status") _list path;
    
  }
  in _res

let list_medical_scribe_jobs_request_of_yojson = 
  fun tree path : list_medical_scribe_jobs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_medical_scribe_jobs_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    job_name_contains = option_of_yojson (value_for_key (transcription_job_name_of_yojson) "JobNameContains") _list path;
    status = option_of_yojson (value_for_key (medical_scribe_job_status_of_yojson) "Status") _list path;
    
  }
  in _res

let clm_language_code_of_yojson = 
  fun (tree: t) path : clm_language_code -> match tree with 
    | `String "ja-JP" -> JA_JP
    | `String "de-DE" -> DE_DE
    | `String "en-AU" -> EN_AU
    | `String "en-GB" -> EN_GB
    | `String "es-US" -> ES_US
    | `String "hi-IN" -> HI_IN
    | `String "en-US" -> EN_US
    | `String value -> raise (deserialize_unknown_enum_value_error path "CLMLanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CLMLanguageCode")

let base_model_name_of_yojson = 
  fun (tree: t) path : base_model_name -> match tree with 
    | `String "WideBand" -> WIDE_BAND
    | `String "NarrowBand" -> NARROW_BAND
    | `String value -> raise (deserialize_unknown_enum_value_error path "BaseModelName" value)
    | _ -> raise (deserialize_wrong_type_error path "BaseModelName")

let model_status_of_yojson = 
  fun (tree: t) path : model_status -> match tree with 
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelStatus")

let input_data_config_of_yojson = 
  fun tree path : input_data_config ->
  let _list = assoc_of_yojson tree path in
  let _res : input_data_config = {
    data_access_role_arn = value_for_key (data_access_role_arn_of_yojson) "DataAccessRoleArn" _list path;
    tuning_data_s3_uri = option_of_yojson (value_for_key (uri_of_yojson) "TuningDataS3Uri") _list path;
    s3_uri = value_for_key (uri_of_yojson) "S3Uri" _list path;
    
  }
  in _res

let language_model_of_yojson = 
  fun tree path : language_model ->
  let _list = assoc_of_yojson tree path in
  let _res : language_model = {
    input_data_config = option_of_yojson (value_for_key (input_data_config_of_yojson) "InputDataConfig") _list path;
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    upgrade_availability = option_of_yojson (value_for_key (boolean__of_yojson) "UpgradeAvailability") _list path;
    model_status = option_of_yojson (value_for_key (model_status_of_yojson) "ModelStatus") _list path;
    base_model_name = option_of_yojson (value_for_key (base_model_name_of_yojson) "BaseModelName") _list path;
    language_code = option_of_yojson (value_for_key (clm_language_code_of_yojson) "LanguageCode") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    create_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreateTime") _list path;
    model_name = option_of_yojson (value_for_key (model_name_of_yojson) "ModelName") _list path;
    
  }
  in _res

let models_of_yojson = 
  fun tree path -> list_of_yojson language_model_of_yojson tree path 

let list_language_models_response_of_yojson = 
  fun tree path : list_language_models_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_language_models_response = {
    models = option_of_yojson (value_for_key (models_of_yojson) "Models") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let list_language_models_request_of_yojson = 
  fun tree path : list_language_models_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_language_models_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    name_contains = option_of_yojson (value_for_key (model_name_of_yojson) "NameContains") _list path;
    status_equals = option_of_yojson (value_for_key (model_status_of_yojson) "StatusEquals") _list path;
    
  }
  in _res

let call_analytics_job_summary_of_yojson = 
  fun tree path : call_analytics_job_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : call_analytics_job_summary = {
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    call_analytics_job_details = option_of_yojson (value_for_key (call_analytics_job_details_of_yojson) "CallAnalyticsJobDetails") _list path;
    call_analytics_job_status = option_of_yojson (value_for_key (call_analytics_job_status_of_yojson) "CallAnalyticsJobStatus") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    completion_time = option_of_yojson (value_for_key (date_time_of_yojson) "CompletionTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    creation_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreationTime") _list path;
    call_analytics_job_name = option_of_yojson (value_for_key (call_analytics_job_name_of_yojson) "CallAnalyticsJobName") _list path;
    
  }
  in _res

let call_analytics_job_summaries_of_yojson = 
  fun tree path -> list_of_yojson call_analytics_job_summary_of_yojson tree path 

let list_call_analytics_jobs_response_of_yojson = 
  fun tree path : list_call_analytics_jobs_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_call_analytics_jobs_response = {
    call_analytics_job_summaries = option_of_yojson (value_for_key (call_analytics_job_summaries_of_yojson) "CallAnalyticsJobSummaries") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    status = option_of_yojson (value_for_key (call_analytics_job_status_of_yojson) "Status") _list path;
    
  }
  in _res

let list_call_analytics_jobs_request_of_yojson = 
  fun tree path : list_call_analytics_jobs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_call_analytics_jobs_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    job_name_contains = option_of_yojson (value_for_key (call_analytics_job_name_of_yojson) "JobNameContains") _list path;
    status = option_of_yojson (value_for_key (call_analytics_job_status_of_yojson) "Status") _list path;
    
  }
  in _res

let category_properties_list_of_yojson = 
  fun tree path -> list_of_yojson category_properties_of_yojson tree path 

let list_call_analytics_categories_response_of_yojson = 
  fun tree path : list_call_analytics_categories_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_call_analytics_categories_response = {
    categories = option_of_yojson (value_for_key (category_properties_list_of_yojson) "Categories") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let list_call_analytics_categories_request_of_yojson = 
  fun tree path : list_call_analytics_categories_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_call_analytics_categories_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let get_vocabulary_filter_response_of_yojson = 
  fun tree path : get_vocabulary_filter_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_vocabulary_filter_response = {
    download_uri = option_of_yojson (value_for_key (uri_of_yojson) "DownloadUri") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_filter_name = option_of_yojson (value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName") _list path;
    
  }
  in _res

let get_vocabulary_filter_request_of_yojson = 
  fun tree path : get_vocabulary_filter_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_vocabulary_filter_request = {
    vocabulary_filter_name = value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName" _list path;
    
  }
  in _res

let get_vocabulary_response_of_yojson = 
  fun tree path : get_vocabulary_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_vocabulary_response = {
    download_uri = option_of_yojson (value_for_key (uri_of_yojson) "DownloadUri") _list path;
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    vocabulary_state = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "VocabularyState") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    
  }
  in _res

let get_vocabulary_request_of_yojson = 
  fun tree path : get_vocabulary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_vocabulary_request = {
    vocabulary_name = value_for_key (vocabulary_name_of_yojson) "VocabularyName" _list path;
    
  }
  in _res

let get_transcription_job_response_of_yojson = 
  fun tree path : get_transcription_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_transcription_job_response = {
    transcription_job = option_of_yojson (value_for_key (transcription_job_of_yojson) "TranscriptionJob") _list path;
    
  }
  in _res

let get_transcription_job_request_of_yojson = 
  fun tree path : get_transcription_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_transcription_job_request = {
    transcription_job_name = value_for_key (transcription_job_name_of_yojson) "TranscriptionJobName" _list path;
    
  }
  in _res

let get_medical_vocabulary_response_of_yojson = 
  fun tree path : get_medical_vocabulary_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_vocabulary_response = {
    download_uri = option_of_yojson (value_for_key (uri_of_yojson) "DownloadUri") _list path;
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    vocabulary_state = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "VocabularyState") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    
  }
  in _res

let get_medical_vocabulary_request_of_yojson = 
  fun tree path : get_medical_vocabulary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_vocabulary_request = {
    vocabulary_name = value_for_key (vocabulary_name_of_yojson) "VocabularyName" _list path;
    
  }
  in _res

let get_medical_transcription_job_response_of_yojson = 
  fun tree path : get_medical_transcription_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_transcription_job_response = {
    medical_transcription_job = option_of_yojson (value_for_key (medical_transcription_job_of_yojson) "MedicalTranscriptionJob") _list path;
    
  }
  in _res

let get_medical_transcription_job_request_of_yojson = 
  fun tree path : get_medical_transcription_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_transcription_job_request = {
    medical_transcription_job_name = value_for_key (transcription_job_name_of_yojson) "MedicalTranscriptionJobName" _list path;
    
  }
  in _res

let get_medical_scribe_job_response_of_yojson = 
  fun tree path : get_medical_scribe_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_scribe_job_response = {
    medical_scribe_job = option_of_yojson (value_for_key (medical_scribe_job_of_yojson) "MedicalScribeJob") _list path;
    
  }
  in _res

let get_medical_scribe_job_request_of_yojson = 
  fun tree path : get_medical_scribe_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_medical_scribe_job_request = {
    medical_scribe_job_name = value_for_key (transcription_job_name_of_yojson) "MedicalScribeJobName" _list path;
    
  }
  in _res

let get_call_analytics_job_response_of_yojson = 
  fun tree path : get_call_analytics_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_call_analytics_job_response = {
    call_analytics_job = option_of_yojson (value_for_key (call_analytics_job_of_yojson) "CallAnalyticsJob") _list path;
    
  }
  in _res

let get_call_analytics_job_request_of_yojson = 
  fun tree path : get_call_analytics_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_call_analytics_job_request = {
    call_analytics_job_name = value_for_key (call_analytics_job_name_of_yojson) "CallAnalyticsJobName" _list path;
    
  }
  in _res

let get_call_analytics_category_response_of_yojson = 
  fun tree path : get_call_analytics_category_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_call_analytics_category_response = {
    category_properties = option_of_yojson (value_for_key (category_properties_of_yojson) "CategoryProperties") _list path;
    
  }
  in _res

let get_call_analytics_category_request_of_yojson = 
  fun tree path : get_call_analytics_category_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_call_analytics_category_request = {
    category_name = value_for_key (category_name_of_yojson) "CategoryName" _list path;
    
  }
  in _res

let describe_language_model_response_of_yojson = 
  fun tree path : describe_language_model_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_language_model_response = {
    language_model = option_of_yojson (value_for_key (language_model_of_yojson) "LanguageModel") _list path;
    
  }
  in _res

let describe_language_model_request_of_yojson = 
  fun tree path : describe_language_model_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_language_model_request = {
    model_name = value_for_key (model_name_of_yojson) "ModelName" _list path;
    
  }
  in _res

let delete_vocabulary_filter_request_of_yojson = 
  fun tree path : delete_vocabulary_filter_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_vocabulary_filter_request = {
    vocabulary_filter_name = value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName" _list path;
    
  }
  in _res

let delete_vocabulary_request_of_yojson = 
  fun tree path : delete_vocabulary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_vocabulary_request = {
    vocabulary_name = value_for_key (vocabulary_name_of_yojson) "VocabularyName" _list path;
    
  }
  in _res

let delete_transcription_job_request_of_yojson = 
  fun tree path : delete_transcription_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_transcription_job_request = {
    transcription_job_name = value_for_key (transcription_job_name_of_yojson) "TranscriptionJobName" _list path;
    
  }
  in _res

let delete_medical_vocabulary_request_of_yojson = 
  fun tree path : delete_medical_vocabulary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_medical_vocabulary_request = {
    vocabulary_name = value_for_key (vocabulary_name_of_yojson) "VocabularyName" _list path;
    
  }
  in _res

let delete_medical_transcription_job_request_of_yojson = 
  fun tree path : delete_medical_transcription_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_medical_transcription_job_request = {
    medical_transcription_job_name = value_for_key (transcription_job_name_of_yojson) "MedicalTranscriptionJobName" _list path;
    
  }
  in _res

let delete_medical_scribe_job_request_of_yojson = 
  fun tree path : delete_medical_scribe_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_medical_scribe_job_request = {
    medical_scribe_job_name = value_for_key (transcription_job_name_of_yojson) "MedicalScribeJobName" _list path;
    
  }
  in _res

let delete_language_model_request_of_yojson = 
  fun tree path : delete_language_model_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_language_model_request = {
    model_name = value_for_key (model_name_of_yojson) "ModelName" _list path;
    
  }
  in _res

let delete_call_analytics_job_response_of_yojson = 
  fun tree path : delete_call_analytics_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_call_analytics_job_response = ()
  in _res

let delete_call_analytics_job_request_of_yojson = 
  fun tree path : delete_call_analytics_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_call_analytics_job_request = {
    call_analytics_job_name = value_for_key (call_analytics_job_name_of_yojson) "CallAnalyticsJobName" _list path;
    
  }
  in _res

let delete_call_analytics_category_response_of_yojson = 
  fun tree path : delete_call_analytics_category_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_call_analytics_category_response = ()
  in _res

let delete_call_analytics_category_request_of_yojson = 
  fun tree path : delete_call_analytics_category_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_call_analytics_category_request = {
    category_name = value_for_key (category_name_of_yojson) "CategoryName" _list path;
    
  }
  in _res

let create_vocabulary_filter_response_of_yojson = 
  fun tree path : create_vocabulary_filter_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_vocabulary_filter_response = {
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_filter_name = option_of_yojson (value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName") _list path;
    
  }
  in _res

let create_vocabulary_filter_request_of_yojson = 
  fun tree path : create_vocabulary_filter_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_vocabulary_filter_request = {
    data_access_role_arn = option_of_yojson (value_for_key (data_access_role_arn_of_yojson) "DataAccessRoleArn") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    vocabulary_filter_file_uri = option_of_yojson (value_for_key (uri_of_yojson) "VocabularyFilterFileUri") _list path;
    words = option_of_yojson (value_for_key (words_of_yojson) "Words") _list path;
    language_code = value_for_key (language_code_of_yojson) "LanguageCode" _list path;
    vocabulary_filter_name = value_for_key (vocabulary_filter_name_of_yojson) "VocabularyFilterName" _list path;
    
  }
  in _res

let create_vocabulary_response_of_yojson = 
  fun tree path : create_vocabulary_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_vocabulary_response = {
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    vocabulary_state = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "VocabularyState") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    
  }
  in _res

let create_vocabulary_request_of_yojson = 
  fun tree path : create_vocabulary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_vocabulary_request = {
    data_access_role_arn = option_of_yojson (value_for_key (data_access_role_arn_of_yojson) "DataAccessRoleArn") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    vocabulary_file_uri = option_of_yojson (value_for_key (uri_of_yojson) "VocabularyFileUri") _list path;
    phrases = option_of_yojson (value_for_key (phrases_of_yojson) "Phrases") _list path;
    language_code = value_for_key (language_code_of_yojson) "LanguageCode" _list path;
    vocabulary_name = value_for_key (vocabulary_name_of_yojson) "VocabularyName" _list path;
    
  }
  in _res

let create_medical_vocabulary_response_of_yojson = 
  fun tree path : create_medical_vocabulary_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_medical_vocabulary_response = {
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    vocabulary_state = option_of_yojson (value_for_key (vocabulary_state_of_yojson) "VocabularyState") _list path;
    language_code = option_of_yojson (value_for_key (language_code_of_yojson) "LanguageCode") _list path;
    vocabulary_name = option_of_yojson (value_for_key (vocabulary_name_of_yojson) "VocabularyName") _list path;
    
  }
  in _res

let create_medical_vocabulary_request_of_yojson = 
  fun tree path : create_medical_vocabulary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_medical_vocabulary_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    vocabulary_file_uri = value_for_key (uri_of_yojson) "VocabularyFileUri" _list path;
    language_code = value_for_key (language_code_of_yojson) "LanguageCode" _list path;
    vocabulary_name = value_for_key (vocabulary_name_of_yojson) "VocabularyName" _list path;
    
  }
  in _res

let create_language_model_response_of_yojson = 
  fun tree path : create_language_model_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_language_model_response = {
    model_status = option_of_yojson (value_for_key (model_status_of_yojson) "ModelStatus") _list path;
    input_data_config = option_of_yojson (value_for_key (input_data_config_of_yojson) "InputDataConfig") _list path;
    model_name = option_of_yojson (value_for_key (model_name_of_yojson) "ModelName") _list path;
    base_model_name = option_of_yojson (value_for_key (base_model_name_of_yojson) "BaseModelName") _list path;
    language_code = option_of_yojson (value_for_key (clm_language_code_of_yojson) "LanguageCode") _list path;
    
  }
  in _res

let create_language_model_request_of_yojson = 
  fun tree path : create_language_model_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_language_model_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    input_data_config = value_for_key (input_data_config_of_yojson) "InputDataConfig" _list path;
    model_name = value_for_key (model_name_of_yojson) "ModelName" _list path;
    base_model_name = value_for_key (base_model_name_of_yojson) "BaseModelName" _list path;
    language_code = value_for_key (clm_language_code_of_yojson) "LanguageCode" _list path;
    
  }
  in _res

let create_call_analytics_category_response_of_yojson = 
  fun tree path : create_call_analytics_category_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_call_analytics_category_response = {
    category_properties = option_of_yojson (value_for_key (category_properties_of_yojson) "CategoryProperties") _list path;
    
  }
  in _res

let create_call_analytics_category_request_of_yojson = 
  fun tree path : create_call_analytics_category_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_call_analytics_category_request = {
    input_type = option_of_yojson (value_for_key (input_type_of_yojson) "InputType") _list path;
    rules = value_for_key (rule_list_of_yojson) "Rules" _list path;
    category_name = value_for_key (category_name_of_yojson) "CategoryName" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

