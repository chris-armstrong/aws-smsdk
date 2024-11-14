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

val make_vocabulary_info :
  ?vocabulary_state:vocabulary_state ->
  ?last_modified_time:float ->
  ?language_code:language_code ->
  ?vocabulary_name:string ->
  unit -> vocabulary_info

val make_vocabulary_filter_info :
  ?last_modified_time:float ->
  ?language_code:language_code ->
  ?vocabulary_filter_name:string ->
  unit -> vocabulary_filter_info

val make_update_vocabulary_response :
  ?vocabulary_state:vocabulary_state ->
  ?last_modified_time:float ->
  ?language_code:language_code ->
  ?vocabulary_name:string ->
  unit -> update_vocabulary_response

val make_update_vocabulary_request :
  ?data_access_role_arn:string ->
  ?vocabulary_file_uri:string ->
  ?phrases:string list ->
  language_code:language_code ->
  vocabulary_name:string ->
  unit
-> update_vocabulary_request

val make_update_vocabulary_filter_response :
  ?last_modified_time:float ->
  ?language_code:language_code ->
  ?vocabulary_filter_name:string ->
  unit
-> update_vocabulary_filter_response

val make_update_vocabulary_filter_request :
  ?data_access_role_arn:string ->
  ?vocabulary_filter_file_uri:string ->
  ?words:string list ->
  vocabulary_filter_name:string ->
  unit
-> update_vocabulary_filter_request

val make_update_medical_vocabulary_response :
  ?vocabulary_state:vocabulary_state ->
  ?last_modified_time:float ->
  ?language_code:language_code ->
  ?vocabulary_name:string ->
  unit
-> update_medical_vocabulary_response

val make_update_medical_vocabulary_request :
  vocabulary_file_uri:string ->
  language_code:language_code ->
  vocabulary_name:string ->
  unit -> update_medical_vocabulary_request

val make_absolute_time_range :
  ?last:int -> ?first:int -> ?end_time:int -> ?start_time:int -> unit
-> absolute_time_range

val make_relative_time_range :
  ?last:int ->
  ?first:int ->
  ?end_percentage:int ->
  ?start_percentage:int ->
  unit -> relative_time_range

val make_non_talk_time_filter :
  ?negate:bool ->
  ?relative_time_range:relative_time_range ->
  ?absolute_time_range:absolute_time_range ->
  ?threshold:int ->
  unit -> non_talk_time_filter

val make_interruption_filter :
  ?negate:bool ->
  ?relative_time_range:relative_time_range ->
  ?absolute_time_range:absolute_time_range ->
  ?participant_role:participant_role ->
  ?threshold:int ->
  unit -> interruption_filter

val make_transcript_filter :
  ?negate:bool ->
  ?participant_role:participant_role ->
  ?relative_time_range:relative_time_range ->
  ?absolute_time_range:absolute_time_range ->
  targets:string list ->
  transcript_filter_type:transcript_filter_type ->
  unit -> transcript_filter

val make_sentiment_filter :
  ?negate:bool ->
  ?participant_role:participant_role ->
  ?relative_time_range:relative_time_range ->
  ?absolute_time_range:absolute_time_range ->
  sentiments:sentiment_value list ->
  unit -> sentiment_filter

val make_category_properties :
  ?input_type:input_type ->
  ?last_update_time:float ->
  ?create_time:float ->
  ?rules:rule list ->
  ?category_name:string ->
  unit
-> category_properties

val make_update_call_analytics_category_response :
  ?category_properties:category_properties -> unit
-> update_call_analytics_category_response

val make_update_call_analytics_category_request :
  ?input_type:input_type -> rules:rule list -> category_name:string -> unit
-> update_call_analytics_category_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_request

val make_content_redaction :
  ?pii_entity_types:pii_entity_type list ->
  redaction_output:redaction_output ->
  redaction_type:redaction_type ->
  unit -> content_redaction

val make_model_settings : ?language_model_name:string -> unit
-> model_settings

val make_language_code_item :
  ?duration_in_seconds:float -> ?language_code:language_code -> unit
-> language_code_item

val make_toxicity_detection_settings :
  toxicity_categories:toxicity_category list -> unit
-> toxicity_detection_settings

val make_transcription_job_summary :
  ?toxicity_detection:toxicity_detection_settings list ->
  ?language_codes:language_code_item list ->
  ?identified_language_score:float ->
  ?identify_multiple_languages:bool ->
  ?identify_language:bool ->
  ?model_settings:model_settings ->
  ?content_redaction:content_redaction ->
  ?output_location_type:output_location_type ->
  ?failure_reason:string ->
  ?transcription_job_status:transcription_job_status ->
  ?language_code:language_code ->
  ?completion_time:float ->
  ?start_time:float ->
  ?creation_time:float ->
  ?transcription_job_name:string ->
  unit -> transcription_job_summary

val make_media :
  ?redacted_media_file_uri:string -> ?media_file_uri:string -> unit
-> media

val make_transcript :
  ?redacted_transcript_file_uri:string -> ?transcript_file_uri:string -> unit
-> transcript

val make_settings :
  ?vocabulary_filter_method:vocabulary_filter_method ->
  ?vocabulary_filter_name:string ->
  ?max_alternatives:int ->
  ?show_alternatives:bool ->
  ?channel_identification:bool ->
  ?max_speaker_labels:int ->
  ?show_speaker_labels:bool ->
  ?vocabulary_name:string ->
  unit -> settings

val make_job_execution_settings :
  ?data_access_role_arn:string -> ?allow_deferred_execution:bool -> unit
-> job_execution_settings

val make_tag : value:string -> key:string -> unit
-> tag

val make_subtitles_output :
  ?output_start_index:int ->
  ?subtitle_file_uris:string list ->
  ?formats:subtitle_format list ->
  unit -> subtitles_output

val make_language_id_settings :
  ?language_model_name:string ->
  ?vocabulary_filter_name:string ->
  ?vocabulary_name:string ->
  unit -> language_id_settings

val make_transcription_job :
  ?toxicity_detection:toxicity_detection_settings list ->
  ?language_id_settings:(string * language_id_settings) list ->
  ?subtitles:subtitles_output ->
  ?tags:tag list ->
  ?language_codes:language_code_item list ->
  ?identified_language_score:float ->
  ?language_options:language_code list ->
  ?identify_multiple_languages:bool ->
  ?identify_language:bool ->
  ?content_redaction:content_redaction ->
  ?job_execution_settings:job_execution_settings ->
  ?model_settings:model_settings ->
  ?settings:settings ->
  ?failure_reason:string ->
  ?completion_time:float ->
  ?creation_time:float ->
  ?start_time:float ->
  ?transcript:transcript ->
  ?media:media ->
  ?media_format:media_format ->
  ?media_sample_rate_hertz:int ->
  ?language_code:language_code ->
  ?transcription_job_status:transcription_job_status ->
  ?transcription_job_name:string ->
  unit -> transcription_job

val make_tag_resource_response : unit
-> tag_resource_response

val make_tag_resource_request : tags:tag list -> resource_arn:string -> unit
-> tag_resource_request

val make_start_transcription_job_response :
  ?transcription_job:transcription_job -> unit
-> start_transcription_job_response

val make_subtitles :
  ?output_start_index:int -> ?formats:subtitle_format list -> unit
-> subtitles

val make_start_transcription_job_request :
  ?toxicity_detection:toxicity_detection_settings list ->
  ?language_id_settings:(string * language_id_settings) list ->
  ?tags:tag list ->
  ?subtitles:subtitles ->
  ?language_options:language_code list ->
  ?identify_multiple_languages:bool ->
  ?identify_language:bool ->
  ?content_redaction:content_redaction ->
  ?job_execution_settings:job_execution_settings ->
  ?model_settings:model_settings ->
  ?settings:settings ->
  ?kms_encryption_context:(string * string) list ->
  ?output_encryption_kms_key_id:string ->
  ?output_key:string ->
  ?output_bucket_name:string ->
  ?media_format:media_format ->
  ?media_sample_rate_hertz:int ->
  ?language_code:language_code ->
  media:media ->
  transcription_job_name:string ->
  unit -> start_transcription_job_request

val make_medical_transcript : ?transcript_file_uri:string -> unit
-> medical_transcript

val make_medical_transcription_setting :
  ?vocabulary_name:string ->
  ?max_alternatives:int ->
  ?show_alternatives:bool ->
  ?channel_identification:bool ->
  ?max_speaker_labels:int ->
  ?show_speaker_labels:bool ->
  unit -> medical_transcription_setting

val make_medical_transcription_job :
  ?tags:tag list ->
  ?type_:type_ ->
  ?specialty:specialty ->
  ?content_identification_type:medical_content_identification_type ->
  ?settings:medical_transcription_setting ->
  ?failure_reason:string ->
  ?completion_time:float ->
  ?creation_time:float ->
  ?start_time:float ->
  ?transcript:medical_transcript ->
  ?media:media ->
  ?media_format:media_format ->
  ?media_sample_rate_hertz:int ->
  ?language_code:language_code ->
  ?transcription_job_status:transcription_job_status ->
  ?medical_transcription_job_name:string ->
  unit
-> medical_transcription_job

val make_start_medical_transcription_job_response :
  ?medical_transcription_job:medical_transcription_job -> unit
-> start_medical_transcription_job_response

val make_start_medical_transcription_job_request :
  ?tags:tag list ->
  ?content_identification_type:medical_content_identification_type ->
  ?settings:medical_transcription_setting ->
  ?kms_encryption_context:(string * string) list ->
  ?output_encryption_kms_key_id:string ->
  ?output_key:string ->
  ?media_format:media_format ->
  ?media_sample_rate_hertz:int ->
  type_:type_ ->
  specialty:specialty ->
  output_bucket_name:string ->
  media:media ->
  language_code:language_code ->
  medical_transcription_job_name:string ->
  unit
-> start_medical_transcription_job_request

val make_medical_scribe_output :
  clinical_document_uri:string -> transcript_file_uri:string -> unit
-> medical_scribe_output

val make_medical_scribe_settings :
  ?vocabulary_filter_method:vocabulary_filter_method ->
  ?vocabulary_filter_name:string ->
  ?vocabulary_name:string ->
  ?channel_identification:bool ->
  ?max_speaker_labels:int ->
  ?show_speaker_labels:bool ->
  unit -> medical_scribe_settings

val make_medical_scribe_channel_definition :
  participant_role:medical_scribe_participant_role -> channel_id:int -> unit
-> medical_scribe_channel_definition

val make_medical_scribe_job :
  ?tags:tag list ->
  ?channel_definitions:medical_scribe_channel_definition list ->
  ?data_access_role_arn:string ->
  ?settings:medical_scribe_settings ->
  ?failure_reason:string ->
  ?completion_time:float ->
  ?creation_time:float ->
  ?start_time:float ->
  ?medical_scribe_output:medical_scribe_output ->
  ?media:media ->
  ?language_code:medical_scribe_language_code ->
  ?medical_scribe_job_status:medical_scribe_job_status ->
  ?medical_scribe_job_name:string ->
  unit -> medical_scribe_job

val make_start_medical_scribe_job_response :
  ?medical_scribe_job:medical_scribe_job -> unit
-> start_medical_scribe_job_response

val make_start_medical_scribe_job_request :
  ?tags:tag list ->
  ?channel_definitions:medical_scribe_channel_definition list ->
  ?kms_encryption_context:(string * string) list ->
  ?output_encryption_kms_key_id:string ->
  settings:medical_scribe_settings ->
  data_access_role_arn:string ->
  output_bucket_name:string ->
  media:media ->
  medical_scribe_job_name:string ->
  unit
-> start_medical_scribe_job_request

val make_call_analytics_skipped_feature :
  ?message:string ->
  ?reason_code:call_analytics_skipped_reason_code ->
  ?feature:call_analytics_feature ->
  unit -> call_analytics_skipped_feature

val make_call_analytics_job_details :
  ?skipped:call_analytics_skipped_feature list -> unit
-> call_analytics_job_details

val make_summarization : generate_abstractive_summary:bool -> unit
-> summarization

val make_call_analytics_job_settings :
  ?summarization:summarization ->
  ?language_id_settings:(string * language_id_settings) list ->
  ?language_options:language_code list ->
  ?content_redaction:content_redaction ->
  ?language_model_name:string ->
  ?vocabulary_filter_method:vocabulary_filter_method ->
  ?vocabulary_filter_name:string ->
  ?vocabulary_name:string ->
  unit -> call_analytics_job_settings

val make_channel_definition :
  ?participant_role:participant_role -> ?channel_id:int -> unit
-> channel_definition

val make_call_analytics_job :
  ?channel_definitions:channel_definition list ->
  ?settings:call_analytics_job_settings ->
  ?identified_language_score:float ->
  ?data_access_role_arn:string ->
  ?failure_reason:string ->
  ?completion_time:float ->
  ?creation_time:float ->
  ?start_time:float ->
  ?transcript:transcript ->
  ?media:media ->
  ?media_format:media_format ->
  ?media_sample_rate_hertz:int ->
  ?language_code:language_code ->
  ?call_analytics_job_details:call_analytics_job_details ->
  ?call_analytics_job_status:call_analytics_job_status ->
  ?call_analytics_job_name:string ->
  unit -> call_analytics_job

val make_start_call_analytics_job_response :
  ?call_analytics_job:call_analytics_job -> unit
-> start_call_analytics_job_response

val make_start_call_analytics_job_request :
  ?channel_definitions:channel_definition list ->
  ?settings:call_analytics_job_settings ->
  ?data_access_role_arn:string ->
  ?output_encryption_kms_key_id:string ->
  ?output_location:string ->
  media:media ->
  call_analytics_job_name:string ->
  unit
-> start_call_analytics_job_request

val make_list_vocabulary_filters_response :
  ?vocabulary_filters:vocabulary_filter_info list ->
  ?next_token:string ->
  unit
-> list_vocabulary_filters_response

val make_list_vocabulary_filters_request :
  ?name_contains:string -> ?max_results:int -> ?next_token:string -> unit
-> list_vocabulary_filters_request

val make_list_vocabularies_response :
  ?vocabularies:vocabulary_info list ->
  ?next_token:string ->
  ?status:vocabulary_state ->
  unit -> list_vocabularies_response

val make_list_vocabularies_request :
  ?name_contains:string ->
  ?state_equals:vocabulary_state ->
  ?max_results:int ->
  ?next_token:string ->
  unit
-> list_vocabularies_request

val make_list_transcription_jobs_response :
  ?transcription_job_summaries:transcription_job_summary list ->
  ?next_token:string ->
  ?status:transcription_job_status ->
  unit
-> list_transcription_jobs_response

val make_list_transcription_jobs_request :
  ?max_results:int ->
  ?next_token:string ->
  ?job_name_contains:string ->
  ?status:transcription_job_status ->
  unit
-> list_transcription_jobs_request

val make_list_tags_for_resource_response :
  ?tags:tag list -> ?resource_arn:string -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:string -> unit
-> list_tags_for_resource_request

val make_list_medical_vocabularies_response :
  ?vocabularies:vocabulary_info list ->
  ?next_token:string ->
  ?status:vocabulary_state ->
  unit
-> list_medical_vocabularies_response

val make_list_medical_vocabularies_request :
  ?name_contains:string ->
  ?state_equals:vocabulary_state ->
  ?max_results:int ->
  ?next_token:string ->
  unit
-> list_medical_vocabularies_request

val make_medical_transcription_job_summary :
  ?type_:type_ ->
  ?content_identification_type:medical_content_identification_type ->
  ?specialty:specialty ->
  ?output_location_type:output_location_type ->
  ?failure_reason:string ->
  ?transcription_job_status:transcription_job_status ->
  ?language_code:language_code ->
  ?completion_time:float ->
  ?start_time:float ->
  ?creation_time:float ->
  ?medical_transcription_job_name:string ->
  unit
-> medical_transcription_job_summary

val make_list_medical_transcription_jobs_response :
  ?medical_transcription_job_summaries:medical_transcription_job_summary list ->
  ?next_token:string ->
  ?status:transcription_job_status ->
  unit
-> list_medical_transcription_jobs_response

val make_list_medical_transcription_jobs_request :
  ?max_results:int ->
  ?next_token:string ->
  ?job_name_contains:string ->
  ?status:transcription_job_status ->
  unit
-> list_medical_transcription_jobs_request

val make_medical_scribe_job_summary :
  ?failure_reason:string ->
  ?medical_scribe_job_status:medical_scribe_job_status ->
  ?language_code:medical_scribe_language_code ->
  ?completion_time:float ->
  ?start_time:float ->
  ?creation_time:float ->
  ?medical_scribe_job_name:string ->
  unit
-> medical_scribe_job_summary

val make_list_medical_scribe_jobs_response :
  ?medical_scribe_job_summaries:medical_scribe_job_summary list ->
  ?next_token:string ->
  ?status:medical_scribe_job_status ->
  unit
-> list_medical_scribe_jobs_response

val make_list_medical_scribe_jobs_request :
  ?max_results:int ->
  ?next_token:string ->
  ?job_name_contains:string ->
  ?status:medical_scribe_job_status ->
  unit -> list_medical_scribe_jobs_request

val make_input_data_config :
  ?tuning_data_s3_uri:string ->
  data_access_role_arn:string ->
  s3_uri:string ->
  unit -> input_data_config

val make_language_model :
  ?input_data_config:input_data_config ->
  ?failure_reason:string ->
  ?upgrade_availability:bool ->
  ?model_status:model_status ->
  ?base_model_name:base_model_name ->
  ?language_code:clm_language_code ->
  ?last_modified_time:float ->
  ?create_time:float ->
  ?model_name:string ->
  unit -> language_model

val make_list_language_models_response :
  ?models:language_model list -> ?next_token:string -> unit
-> list_language_models_response

val make_list_language_models_request :
  ?max_results:int ->
  ?next_token:string ->
  ?name_contains:string ->
  ?status_equals:model_status ->
  unit -> list_language_models_request

val make_call_analytics_job_summary :
  ?failure_reason:string ->
  ?call_analytics_job_details:call_analytics_job_details ->
  ?call_analytics_job_status:call_analytics_job_status ->
  ?language_code:language_code ->
  ?completion_time:float ->
  ?start_time:float ->
  ?creation_time:float ->
  ?call_analytics_job_name:string ->
  unit
-> call_analytics_job_summary

val make_list_call_analytics_jobs_response :
  ?call_analytics_job_summaries:call_analytics_job_summary list ->
  ?next_token:string ->
  ?status:call_analytics_job_status ->
  unit
-> list_call_analytics_jobs_response

val make_list_call_analytics_jobs_request :
  ?max_results:int ->
  ?next_token:string ->
  ?job_name_contains:string ->
  ?status:call_analytics_job_status ->
  unit
-> list_call_analytics_jobs_request

val make_list_call_analytics_categories_response :
  ?categories:category_properties list -> ?next_token:string -> unit
-> list_call_analytics_categories_response

val make_list_call_analytics_categories_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_call_analytics_categories_request

val make_get_vocabulary_filter_response :
  ?download_uri:string ->
  ?last_modified_time:float ->
  ?language_code:language_code ->
  ?vocabulary_filter_name:string ->
  unit
-> get_vocabulary_filter_response

val make_get_vocabulary_filter_request :
  vocabulary_filter_name:string -> unit
-> get_vocabulary_filter_request

val make_get_vocabulary_response :
  ?download_uri:string ->
  ?failure_reason:string ->
  ?last_modified_time:float ->
  ?vocabulary_state:vocabulary_state ->
  ?language_code:language_code ->
  ?vocabulary_name:string ->
  unit -> get_vocabulary_response

val make_get_vocabulary_request : vocabulary_name:string -> unit
-> get_vocabulary_request

val make_get_transcription_job_response :
  ?transcription_job:transcription_job -> unit
-> get_transcription_job_response

val make_get_transcription_job_request :
  transcription_job_name:string -> unit
-> get_transcription_job_request

val make_get_medical_vocabulary_response :
  ?download_uri:string ->
  ?failure_reason:string ->
  ?last_modified_time:float ->
  ?vocabulary_state:vocabulary_state ->
  ?language_code:language_code ->
  ?vocabulary_name:string ->
  unit
-> get_medical_vocabulary_response

val make_get_medical_vocabulary_request : vocabulary_name:string -> unit
-> get_medical_vocabulary_request

val make_get_medical_transcription_job_response :
  ?medical_transcription_job:medical_transcription_job -> unit
-> get_medical_transcription_job_response

val make_get_medical_transcription_job_request :
  medical_transcription_job_name:string -> unit
-> get_medical_transcription_job_request

val make_get_medical_scribe_job_response :
  ?medical_scribe_job:medical_scribe_job -> unit
-> get_medical_scribe_job_response

val make_get_medical_scribe_job_request :
  medical_scribe_job_name:string -> unit
-> get_medical_scribe_job_request

val make_get_call_analytics_job_response :
  ?call_analytics_job:call_analytics_job -> unit
-> get_call_analytics_job_response

val make_get_call_analytics_job_request :
  call_analytics_job_name:string -> unit
-> get_call_analytics_job_request

val make_get_call_analytics_category_response :
  ?category_properties:category_properties -> unit
-> get_call_analytics_category_response

val make_get_call_analytics_category_request : category_name:string -> unit
-> get_call_analytics_category_request

val make_describe_language_model_response :
  ?language_model:language_model -> unit
-> describe_language_model_response

val make_describe_language_model_request : model_name:string -> unit
-> describe_language_model_request

val make_delete_vocabulary_filter_request :
  vocabulary_filter_name:string -> unit
-> delete_vocabulary_filter_request

val make_delete_vocabulary_request : vocabulary_name:string -> unit
-> delete_vocabulary_request

val make_delete_transcription_job_request :
  transcription_job_name:string -> unit
-> delete_transcription_job_request

val make_delete_medical_vocabulary_request : vocabulary_name:string -> unit
-> delete_medical_vocabulary_request

val make_delete_medical_transcription_job_request :
  medical_transcription_job_name:string -> unit
-> delete_medical_transcription_job_request

val make_delete_medical_scribe_job_request :
  medical_scribe_job_name:string -> unit
-> delete_medical_scribe_job_request

val make_delete_language_model_request : model_name:string -> unit
-> delete_language_model_request

val make_delete_call_analytics_job_response : unit
-> delete_call_analytics_job_response

val make_delete_call_analytics_job_request :
  call_analytics_job_name:string -> unit
-> delete_call_analytics_job_request

val make_delete_call_analytics_category_response : unit
-> delete_call_analytics_category_response

val make_delete_call_analytics_category_request :
  category_name:string -> unit
-> delete_call_analytics_category_request

val make_create_vocabulary_filter_response :
  ?last_modified_time:float ->
  ?language_code:language_code ->
  ?vocabulary_filter_name:string ->
  unit
-> create_vocabulary_filter_response

val make_create_vocabulary_filter_request :
  ?data_access_role_arn:string ->
  ?tags:tag list ->
  ?vocabulary_filter_file_uri:string ->
  ?words:string list ->
  language_code:language_code ->
  vocabulary_filter_name:string ->
  unit
-> create_vocabulary_filter_request

val make_create_vocabulary_response :
  ?failure_reason:string ->
  ?last_modified_time:float ->
  ?vocabulary_state:vocabulary_state ->
  ?language_code:language_code ->
  ?vocabulary_name:string ->
  unit -> create_vocabulary_response

val make_create_vocabulary_request :
  ?data_access_role_arn:string ->
  ?tags:tag list ->
  ?vocabulary_file_uri:string ->
  ?phrases:string list ->
  language_code:language_code ->
  vocabulary_name:string ->
  unit
-> create_vocabulary_request

val make_create_medical_vocabulary_response :
  ?failure_reason:string ->
  ?last_modified_time:float ->
  ?vocabulary_state:vocabulary_state ->
  ?language_code:language_code ->
  ?vocabulary_name:string ->
  unit
-> create_medical_vocabulary_response

val make_create_medical_vocabulary_request :
  ?tags:tag list ->
  vocabulary_file_uri:string ->
  language_code:language_code ->
  vocabulary_name:string ->
  unit
-> create_medical_vocabulary_request

val make_create_language_model_response :
  ?model_status:model_status ->
  ?input_data_config:input_data_config ->
  ?model_name:string ->
  ?base_model_name:base_model_name ->
  ?language_code:clm_language_code ->
  unit
-> create_language_model_response

val make_create_language_model_request :
  ?tags:tag list ->
  input_data_config:input_data_config ->
  model_name:string ->
  base_model_name:base_model_name ->
  language_code:clm_language_code ->
  unit
-> create_language_model_request

val make_create_call_analytics_category_response :
  ?category_properties:category_properties -> unit
-> create_call_analytics_category_response

val make_create_call_analytics_category_request :
  ?input_type:input_type -> rules:rule list -> category_name:string -> unit
-> create_call_analytics_category_request

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

