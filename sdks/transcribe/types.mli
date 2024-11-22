open Smaws_Lib
val service : Service.descriptor

type vocabulary_state = | FAILED
  | READY
  | PENDING

type language_code = | ZU_ZA
  | WO_SN
  | UZ_UZ
  | UK_UA
  | UG_CN
  | TT_RU
  | TL_PH
  | SW_UG
  | SW_TZ
  | SW_RW
  | SW_KE
  | SW_BI
  | SU_ID
  | SR_RS
  | SO_SO
  | SL_SI
  | SK_SK
  | SI_LK
  | RW_RW
  | RO_RO
  | PS_AF
  | PL_PL
  | PA_IN
  | OR_IN
  | NO_NO
  | MT_MT
  | MR_IN
  | MN_MN
  | ML_IN
  | MK_MK
  | MI_NZ
  | MHR_RU
  | LV_LV
  | LT_LT
  | LG_IN
  | KY_KG
  | KN_IN
  | KK_KZ
  | KAB_DZ
  | KA_GE
  | IS_IS
  | HY_AM
  | HU_HU
  | HR_HR
  | HA_NG
  | GU_IN
  | GL_ES
  | FI_FI
  | EU_ES
  | ET_ET
  | EL_GR
  | CY_WL
  | CS_CZ
  | CKB_IR
  | CKB_IQ
  | CA_ES
  | BS_BA
  | BN_IN
  | BG_BG
  | BE_BY
  | BA_RU
  | AZ_AZ
  | AST_ES
  | AB_GE
  | SV_SE
  | VI_VN
  | EN_NZ
  | EN_ZA
  | TH_TH
  | ZH_TW
  | ZH_CN
  | TR_TR
  | TE_IN
  | TA_IN
  | RU_RU
  | PT_PT
  | PT_BR
  | NL_NL
  | MS_MY
  | KO_KR
  | JA_JP
  | IT_IT
  | ID_ID
  | HI_IN
  | HE_IL
  | FR_FR
  | FR_CA
  | FA_IR
  | ES_US
  | ES_ES
  | EN_WL
  | EN_US
  | EN_IN
  | EN_IE
  | EN_GB
  | EN_AU
  | EN_AB
  | DE_DE
  | DE_CH
  | DA_DK
  | AR_SA
  | AR_AE
  | AF_ZA

type vocabulary_info = {
  vocabulary_state: vocabulary_state option;
  last_modified_time: float option;
  language_code: language_code option;
  vocabulary_name: string option
}

type vocabulary_filter_info = {
  last_modified_time: float option;
  language_code: language_code option;
  vocabulary_filter_name: string option
}

type vocabulary_filter_method = | TAG
  | MASK
  | REMOVE

type update_vocabulary_response = {
  vocabulary_state: vocabulary_state option;
  last_modified_time: float option;
  language_code: language_code option;
  vocabulary_name: string option
}

type update_vocabulary_request = {
  data_access_role_arn: string option;
  vocabulary_file_uri: string option;
  phrases: string list option;
  language_code: language_code;
  vocabulary_name: string
}

type update_vocabulary_filter_response = {
  last_modified_time: float option;
  language_code: language_code option;
  vocabulary_filter_name: string option
}

type update_vocabulary_filter_request = {
  data_access_role_arn: string option;
  vocabulary_filter_file_uri: string option;
  words: string list option;
  vocabulary_filter_name: string
}

type not_found_exception = {
  message: string option
}

type limit_exceeded_exception = {
  message: string option
}

type internal_failure_exception = {
  message: string option
}

type bad_request_exception = {
  message: string option
}

type conflict_exception = {
  message: string option
}

type update_medical_vocabulary_response = {
  vocabulary_state: vocabulary_state option;
  last_modified_time: float option;
  language_code: language_code option;
  vocabulary_name: string option
}

type update_medical_vocabulary_request = {
  vocabulary_file_uri: string;
  language_code: language_code;
  vocabulary_name: string
}

type absolute_time_range = {
  last: int option;
  first: int option;
  end_time: int option;
  start_time: int option
}

type relative_time_range = {
  last: int option;
  first: int option;
  end_percentage: int option;
  start_percentage: int option
}

type non_talk_time_filter = {
  negate: bool option;
  relative_time_range: relative_time_range option;
  absolute_time_range: absolute_time_range option;
  threshold: int option
}

type participant_role = | CUSTOMER
  | AGENT

type interruption_filter = {
  negate: bool option;
  relative_time_range: relative_time_range option;
  absolute_time_range: absolute_time_range option;
  participant_role: participant_role option;
  threshold: int option
}

type transcript_filter_type = | EXACT

type transcript_filter = {
  targets: string list;
  negate: bool option;
  participant_role: participant_role option;
  relative_time_range: relative_time_range option;
  absolute_time_range: absolute_time_range option;
  transcript_filter_type: transcript_filter_type
}

type sentiment_value = | MIXED
  | NEUTRAL
  | NEGATIVE
  | POSITIVE

type sentiment_filter = {
  negate: bool option;
  participant_role: participant_role option;
  relative_time_range: relative_time_range option;
  absolute_time_range: absolute_time_range option;
  sentiments: sentiment_value list
}

type rule = SentimentFilter of sentiment_filter | TranscriptFilter of transcript_filter | InterruptionFilter of interruption_filter | NonTalkTimeFilter of non_talk_time_filter

type input_type = | POST_CALL
  | REAL_TIME

type category_properties = {
  input_type: input_type option;
  last_update_time: float option;
  create_time: float option;
  rules: rule list option;
  category_name: string option
}

type update_call_analytics_category_response = {
  category_properties: category_properties option
}

type update_call_analytics_category_request = {
  input_type: input_type option;
  rules: rule list;
  category_name: string
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_arn: string
}

type type_ = | DICTATION
  | CONVERSATION

type transcription_job_status = | COMPLETED
  | FAILED
  | IN_PROGRESS
  | QUEUED

type output_location_type = | SERVICE_BUCKET
  | CUSTOMER_BUCKET

type redaction_type = | PII

type redaction_output = | REDACTED_AND_UNREDACTED
  | REDACTED

type pii_entity_type = | ALL
  | SSN
  | PHONE
  | NAME
  | ADDRESS
  | EMAIL
  | PIN
  | CREDIT_DEBIT_EXPIRY
  | CREDIT_DEBIT_CVV
  | CREDIT_DEBIT_NUMBER
  | BANK_ROUTING
  | BANK_ACCOUNT_NUMBER

type content_redaction = {
  pii_entity_types: pii_entity_type list option;
  redaction_output: redaction_output;
  redaction_type: redaction_type
}

type model_settings = {
  language_model_name: string option
}

type language_code_item = {
  duration_in_seconds: float option;
  language_code: language_code option
}

type toxicity_category = | ALL

type toxicity_detection_settings = {
  toxicity_categories: toxicity_category list
}

type transcription_job_summary = {
  toxicity_detection: toxicity_detection_settings list option;
  language_codes: language_code_item list option;
  identified_language_score: float option;
  identify_multiple_languages: bool option;
  identify_language: bool option;
  model_settings: model_settings option;
  content_redaction: content_redaction option;
  output_location_type: output_location_type option;
  failure_reason: string option;
  transcription_job_status: transcription_job_status option;
  language_code: language_code option;
  completion_time: float option;
  start_time: float option;
  creation_time: float option;
  transcription_job_name: string option
}

type media_format = | M4A
  | WEBM
  | AMR
  | OGG
  | FLAC
  | WAV
  | MP4
  | MP3

type media = {
  redacted_media_file_uri: string option;
  media_file_uri: string option
}

type transcript = {
  redacted_transcript_file_uri: string option;
  transcript_file_uri: string option
}

type settings = {
  vocabulary_filter_method: vocabulary_filter_method option;
  vocabulary_filter_name: string option;
  max_alternatives: int option;
  show_alternatives: bool option;
  channel_identification: bool option;
  max_speaker_labels: int option;
  show_speaker_labels: bool option;
  vocabulary_name: string option
}

type job_execution_settings = {
  data_access_role_arn: string option;
  allow_deferred_execution: bool option
}

type tag = {
  value: string;
  key: string
}

type subtitle_format = | SRT
  | VTT

type subtitles_output = {
  output_start_index: int option;
  subtitle_file_uris: string list option;
  formats: subtitle_format list option
}

type language_id_settings = {
  language_model_name: string option;
  vocabulary_filter_name: string option;
  vocabulary_name: string option
}

type transcription_job = {
  toxicity_detection: toxicity_detection_settings list option;
  language_id_settings: (string * language_id_settings) list option;
  subtitles: subtitles_output option;
  tags: tag list option;
  language_codes: language_code_item list option;
  identified_language_score: float option;
  language_options: language_code list option;
  identify_multiple_languages: bool option;
  identify_language: bool option;
  content_redaction: content_redaction option;
  job_execution_settings: job_execution_settings option;
  model_settings: model_settings option;
  settings: settings option;
  failure_reason: string option;
  completion_time: float option;
  creation_time: float option;
  start_time: float option;
  transcript: transcript option;
  media: media option;
  media_format: media_format option;
  media_sample_rate_hertz: int option;
  language_code: language_code option;
  transcription_job_status: transcription_job_status option;
  transcription_job_name: string option
}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
  resource_arn: string
}

type start_transcription_job_response = {
  transcription_job: transcription_job option
}

type subtitles = {
  output_start_index: int option;
  formats: subtitle_format list option
}

type start_transcription_job_request = {
  toxicity_detection: toxicity_detection_settings list option;
  language_id_settings: (string * language_id_settings) list option;
  tags: tag list option;
  subtitles: subtitles option;
  language_options: language_code list option;
  identify_multiple_languages: bool option;
  identify_language: bool option;
  content_redaction: content_redaction option;
  job_execution_settings: job_execution_settings option;
  model_settings: model_settings option;
  settings: settings option;
  kms_encryption_context: (string * string) list option;
  output_encryption_kms_key_id: string option;
  output_key: string option;
  output_bucket_name: string option;
  media: media;
  media_format: media_format option;
  media_sample_rate_hertz: int option;
  language_code: language_code option;
  transcription_job_name: string
}

type medical_transcript = {
  transcript_file_uri: string option
}

type medical_transcription_setting = {
  vocabulary_name: string option;
  max_alternatives: int option;
  show_alternatives: bool option;
  channel_identification: bool option;
  max_speaker_labels: int option;
  show_speaker_labels: bool option
}

type medical_content_identification_type = | PHI

type specialty = | PRIMARYCARE

type medical_transcription_job = {
  tags: tag list option;
  type_: type_ option;
  specialty: specialty option;
  content_identification_type: medical_content_identification_type option;
  settings: medical_transcription_setting option;
  failure_reason: string option;
  completion_time: float option;
  creation_time: float option;
  start_time: float option;
  transcript: medical_transcript option;
  media: media option;
  media_format: media_format option;
  media_sample_rate_hertz: int option;
  language_code: language_code option;
  transcription_job_status: transcription_job_status option;
  medical_transcription_job_name: string option
}

type start_medical_transcription_job_response = {
  medical_transcription_job: medical_transcription_job option
}

type start_medical_transcription_job_request = {
  tags: tag list option;
  type_: type_;
  specialty: specialty;
  content_identification_type: medical_content_identification_type option;
  settings: medical_transcription_setting option;
  kms_encryption_context: (string * string) list option;
  output_encryption_kms_key_id: string option;
  output_key: string option;
  output_bucket_name: string;
  media: media;
  media_format: media_format option;
  media_sample_rate_hertz: int option;
  language_code: language_code;
  medical_transcription_job_name: string
}

type medical_scribe_job_status = | COMPLETED
  | FAILED
  | IN_PROGRESS
  | QUEUED

type medical_scribe_language_code = | EN_US

type medical_scribe_output = {
  clinical_document_uri: string;
  transcript_file_uri: string
}

type medical_scribe_settings = {
  vocabulary_filter_method: vocabulary_filter_method option;
  vocabulary_filter_name: string option;
  vocabulary_name: string option;
  channel_identification: bool option;
  max_speaker_labels: int option;
  show_speaker_labels: bool option
}

type medical_scribe_participant_role = | CLINICIAN
  | PATIENT

type medical_scribe_channel_definition = {
  participant_role: medical_scribe_participant_role;
  channel_id: int
}

type medical_scribe_job = {
  tags: tag list option;
  channel_definitions: medical_scribe_channel_definition list option;
  data_access_role_arn: string option;
  settings: medical_scribe_settings option;
  failure_reason: string option;
  completion_time: float option;
  creation_time: float option;
  start_time: float option;
  medical_scribe_output: medical_scribe_output option;
  media: media option;
  language_code: medical_scribe_language_code option;
  medical_scribe_job_status: medical_scribe_job_status option;
  medical_scribe_job_name: string option
}

type start_medical_scribe_job_response = {
  medical_scribe_job: medical_scribe_job option
}

type start_medical_scribe_job_request = {
  tags: tag list option;
  channel_definitions: medical_scribe_channel_definition list option;
  settings: medical_scribe_settings;
  data_access_role_arn: string;
  kms_encryption_context: (string * string) list option;
  output_encryption_kms_key_id: string option;
  output_bucket_name: string;
  media: media;
  medical_scribe_job_name: string
}

type call_analytics_job_status = | COMPLETED
  | FAILED
  | IN_PROGRESS
  | QUEUED

type call_analytics_feature = | GENERATIVE_SUMMARIZATION

type call_analytics_skipped_reason_code = | FAILED_SAFETY_GUIDELINES
  | INSUFFICIENT_CONVERSATION_CONTENT

type call_analytics_skipped_feature = {
  message: string option;
  reason_code: call_analytics_skipped_reason_code option;
  feature: call_analytics_feature option
}

type call_analytics_job_details = {
  skipped: call_analytics_skipped_feature list option
}

type summarization = {
  generate_abstractive_summary: bool
}

type call_analytics_job_settings = {
  summarization: summarization option;
  language_id_settings: (string * language_id_settings) list option;
  language_options: language_code list option;
  content_redaction: content_redaction option;
  language_model_name: string option;
  vocabulary_filter_method: vocabulary_filter_method option;
  vocabulary_filter_name: string option;
  vocabulary_name: string option
}

type channel_definition = {
  participant_role: participant_role option;
  channel_id: int option
}

type call_analytics_job = {
  channel_definitions: channel_definition list option;
  settings: call_analytics_job_settings option;
  identified_language_score: float option;
  data_access_role_arn: string option;
  failure_reason: string option;
  completion_time: float option;
  creation_time: float option;
  start_time: float option;
  transcript: transcript option;
  media: media option;
  media_format: media_format option;
  media_sample_rate_hertz: int option;
  language_code: language_code option;
  call_analytics_job_details: call_analytics_job_details option;
  call_analytics_job_status: call_analytics_job_status option;
  call_analytics_job_name: string option
}

type start_call_analytics_job_response = {
  call_analytics_job: call_analytics_job option
}

type start_call_analytics_job_request = {
  channel_definitions: channel_definition list option;
  settings: call_analytics_job_settings option;
  data_access_role_arn: string option;
  output_encryption_kms_key_id: string option;
  output_location: string option;
  media: media;
  call_analytics_job_name: string
}

type list_vocabulary_filters_response = {
  vocabulary_filters: vocabulary_filter_info list option;
  next_token: string option
}

type list_vocabulary_filters_request = {
  name_contains: string option;
  max_results: int option;
  next_token: string option
}

type list_vocabularies_response = {
  vocabularies: vocabulary_info list option;
  next_token: string option;
  status: vocabulary_state option
}

type list_vocabularies_request = {
  name_contains: string option;
  state_equals: vocabulary_state option;
  max_results: int option;
  next_token: string option
}

type list_transcription_jobs_response = {
  transcription_job_summaries: transcription_job_summary list option;
  next_token: string option;
  status: transcription_job_status option
}

type list_transcription_jobs_request = {
  max_results: int option;
  next_token: string option;
  job_name_contains: string option;
  status: transcription_job_status option
}

type list_tags_for_resource_response = {
  tags: tag list option;
  resource_arn: string option
}

type list_tags_for_resource_request = {
  resource_arn: string
}

type list_medical_vocabularies_response = {
  vocabularies: vocabulary_info list option;
  next_token: string option;
  status: vocabulary_state option
}

type list_medical_vocabularies_request = {
  name_contains: string option;
  state_equals: vocabulary_state option;
  max_results: int option;
  next_token: string option
}

type medical_transcription_job_summary = {
  type_: type_ option;
  content_identification_type: medical_content_identification_type option;
  specialty: specialty option;
  output_location_type: output_location_type option;
  failure_reason: string option;
  transcription_job_status: transcription_job_status option;
  language_code: language_code option;
  completion_time: float option;
  start_time: float option;
  creation_time: float option;
  medical_transcription_job_name: string option
}

type list_medical_transcription_jobs_response = {
  medical_transcription_job_summaries: medical_transcription_job_summary list option;
  next_token: string option;
  status: transcription_job_status option
}

type list_medical_transcription_jobs_request = {
  max_results: int option;
  next_token: string option;
  job_name_contains: string option;
  status: transcription_job_status option
}

type medical_scribe_job_summary = {
  failure_reason: string option;
  medical_scribe_job_status: medical_scribe_job_status option;
  language_code: medical_scribe_language_code option;
  completion_time: float option;
  start_time: float option;
  creation_time: float option;
  medical_scribe_job_name: string option
}

type list_medical_scribe_jobs_response = {
  medical_scribe_job_summaries: medical_scribe_job_summary list option;
  next_token: string option;
  status: medical_scribe_job_status option
}

type list_medical_scribe_jobs_request = {
  max_results: int option;
  next_token: string option;
  job_name_contains: string option;
  status: medical_scribe_job_status option
}

type clm_language_code = | JA_JP
  | DE_DE
  | EN_AU
  | EN_GB
  | ES_US
  | HI_IN
  | EN_US

type base_model_name = | WIDE_BAND
  | NARROW_BAND

type model_status = | COMPLETED
  | FAILED
  | IN_PROGRESS

type input_data_config = {
  data_access_role_arn: string;
  tuning_data_s3_uri: string option;
  s3_uri: string
}

type language_model = {
  input_data_config: input_data_config option;
  failure_reason: string option;
  upgrade_availability: bool option;
  model_status: model_status option;
  base_model_name: base_model_name option;
  language_code: clm_language_code option;
  last_modified_time: float option;
  create_time: float option;
  model_name: string option
}

type list_language_models_response = {
  models: language_model list option;
  next_token: string option
}

type list_language_models_request = {
  max_results: int option;
  next_token: string option;
  name_contains: string option;
  status_equals: model_status option
}

type call_analytics_job_summary = {
  failure_reason: string option;
  call_analytics_job_details: call_analytics_job_details option;
  call_analytics_job_status: call_analytics_job_status option;
  language_code: language_code option;
  completion_time: float option;
  start_time: float option;
  creation_time: float option;
  call_analytics_job_name: string option
}

type list_call_analytics_jobs_response = {
  call_analytics_job_summaries: call_analytics_job_summary list option;
  next_token: string option;
  status: call_analytics_job_status option
}

type list_call_analytics_jobs_request = {
  max_results: int option;
  next_token: string option;
  job_name_contains: string option;
  status: call_analytics_job_status option
}

type list_call_analytics_categories_response = {
  categories: category_properties list option;
  next_token: string option
}

type list_call_analytics_categories_request = {
  max_results: int option;
  next_token: string option
}

type get_vocabulary_filter_response = {
  download_uri: string option;
  last_modified_time: float option;
  language_code: language_code option;
  vocabulary_filter_name: string option
}

type get_vocabulary_filter_request = {
  vocabulary_filter_name: string
}

type get_vocabulary_response = {
  download_uri: string option;
  failure_reason: string option;
  last_modified_time: float option;
  vocabulary_state: vocabulary_state option;
  language_code: language_code option;
  vocabulary_name: string option
}

type get_vocabulary_request = {
  vocabulary_name: string
}

type get_transcription_job_response = {
  transcription_job: transcription_job option
}

type get_transcription_job_request = {
  transcription_job_name: string
}

type get_medical_vocabulary_response = {
  download_uri: string option;
  failure_reason: string option;
  last_modified_time: float option;
  vocabulary_state: vocabulary_state option;
  language_code: language_code option;
  vocabulary_name: string option
}

type get_medical_vocabulary_request = {
  vocabulary_name: string
}

type get_medical_transcription_job_response = {
  medical_transcription_job: medical_transcription_job option
}

type get_medical_transcription_job_request = {
  medical_transcription_job_name: string
}

type get_medical_scribe_job_response = {
  medical_scribe_job: medical_scribe_job option
}

type get_medical_scribe_job_request = {
  medical_scribe_job_name: string
}

type get_call_analytics_job_response = {
  call_analytics_job: call_analytics_job option
}

type get_call_analytics_job_request = {
  call_analytics_job_name: string
}

type get_call_analytics_category_response = {
  category_properties: category_properties option
}

type get_call_analytics_category_request = {
  category_name: string
}

type describe_language_model_response = {
  language_model: language_model option
}

type describe_language_model_request = {
  model_name: string
}

type delete_vocabulary_filter_request = {
  vocabulary_filter_name: string
}

type delete_vocabulary_request = {
  vocabulary_name: string
}

type delete_transcription_job_request = {
  transcription_job_name: string
}

type delete_medical_vocabulary_request = {
  vocabulary_name: string
}

type delete_medical_transcription_job_request = {
  medical_transcription_job_name: string
}

type delete_medical_scribe_job_request = {
  medical_scribe_job_name: string
}

type delete_language_model_request = {
  model_name: string
}

type delete_call_analytics_job_response = unit

type delete_call_analytics_job_request = {
  call_analytics_job_name: string
}

type delete_call_analytics_category_response = unit

type delete_call_analytics_category_request = {
  category_name: string
}

type create_vocabulary_filter_response = {
  last_modified_time: float option;
  language_code: language_code option;
  vocabulary_filter_name: string option
}

type create_vocabulary_filter_request = {
  data_access_role_arn: string option;
  tags: tag list option;
  vocabulary_filter_file_uri: string option;
  words: string list option;
  language_code: language_code;
  vocabulary_filter_name: string
}

type create_vocabulary_response = {
  failure_reason: string option;
  last_modified_time: float option;
  vocabulary_state: vocabulary_state option;
  language_code: language_code option;
  vocabulary_name: string option
}

type create_vocabulary_request = {
  data_access_role_arn: string option;
  tags: tag list option;
  vocabulary_file_uri: string option;
  phrases: string list option;
  language_code: language_code;
  vocabulary_name: string
}

type create_medical_vocabulary_response = {
  failure_reason: string option;
  last_modified_time: float option;
  vocabulary_state: vocabulary_state option;
  language_code: language_code option;
  vocabulary_name: string option
}

type create_medical_vocabulary_request = {
  tags: tag list option;
  vocabulary_file_uri: string;
  language_code: language_code;
  vocabulary_name: string
}

type create_language_model_response = {
  model_status: model_status option;
  input_data_config: input_data_config option;
  model_name: string option;
  base_model_name: base_model_name option;
  language_code: clm_language_code option
}

type create_language_model_request = {
  tags: tag list option;
  input_data_config: input_data_config;
  model_name: string;
  base_model_name: base_model_name;
  language_code: clm_language_code
}

type create_call_analytics_category_response = {
  category_properties: category_properties option
}

type create_call_analytics_category_request = {
  input_type: input_type option;
  rules: rule list;
  category_name: string
}



type base_document = Json.t

