[@@@warning "-39"]
open Types
let make_vocabulary_info 
  ?(vocabulary_state : vocabulary_state option)
  ?(last_modified_time : float option)
  ?(language_code : language_code option)
  ?(vocabulary_name : string option)
  () : vocabulary_info = {
  vocabulary_state; last_modified_time; language_code; vocabulary_name; 
}

let make_vocabulary_filter_info 
  ?(last_modified_time : float option)
  ?(language_code : language_code option)
  ?(vocabulary_filter_name : string option)
  () : vocabulary_filter_info = {
  last_modified_time; language_code; vocabulary_filter_name; 
}

let make_update_vocabulary_response 
  ?(vocabulary_state : vocabulary_state option)
  ?(last_modified_time : float option)
  ?(language_code : language_code option)
  ?(vocabulary_name : string option)
  () : update_vocabulary_response = {
  vocabulary_state; last_modified_time; language_code; vocabulary_name; 
}

let make_update_vocabulary_request 
  ?(data_access_role_arn : string option)
  ?(vocabulary_file_uri : string option)
  ?(phrases : string list option)
  ~(language_code : language_code)
  ~(vocabulary_name : string)
  () : update_vocabulary_request = {
  data_access_role_arn;
  vocabulary_file_uri;
  phrases;
  language_code;
  vocabulary_name;
   }

let make_update_vocabulary_filter_response 
  ?(last_modified_time : float option)
  ?(language_code : language_code option)
  ?(vocabulary_filter_name : string option)
  () : update_vocabulary_filter_response = {
  last_modified_time; language_code; vocabulary_filter_name; 
}

let make_update_vocabulary_filter_request 
  ?(data_access_role_arn : string option)
  ?(vocabulary_filter_file_uri : string option)
  ?(words : string list option)
  ~(vocabulary_filter_name : string)
  () : update_vocabulary_filter_request = {
  data_access_role_arn;
  vocabulary_filter_file_uri;
  words;
  vocabulary_filter_name;
   }

let make_update_medical_vocabulary_response 
  ?(vocabulary_state : vocabulary_state option)
  ?(last_modified_time : float option)
  ?(language_code : language_code option)
  ?(vocabulary_name : string option)
  () : update_medical_vocabulary_response = {
  vocabulary_state; last_modified_time; language_code; vocabulary_name; 
}

let make_update_medical_vocabulary_request 
  ~(vocabulary_file_uri : string)
  ~(language_code : language_code)
  ~(vocabulary_name : string)
  () : update_medical_vocabulary_request = {
  vocabulary_file_uri; language_code; vocabulary_name; 
}

let make_absolute_time_range 
  ?(last : int option)
  ?(first : int option)
  ?(end_time : int option)
  ?(start_time : int option)
  () : absolute_time_range = { last; first; end_time; start_time; 
}

let make_relative_time_range 
  ?(last : int option)
  ?(first : int option)
  ?(end_percentage : int option)
  ?(start_percentage : int option)
  () : relative_time_range = {
  last; first; end_percentage; start_percentage; 
}

let make_non_talk_time_filter 
  ?(negate : bool option)
  ?(relative_time_range : relative_time_range option)
  ?(absolute_time_range : absolute_time_range option)
  ?(threshold : int option)
  () : non_talk_time_filter = {
  negate; relative_time_range; absolute_time_range; threshold; 
}

let make_interruption_filter 
  ?(negate : bool option)
  ?(relative_time_range : relative_time_range option)
  ?(absolute_time_range : absolute_time_range option)
  ?(participant_role : participant_role option)
  ?(threshold : int option)
  () : interruption_filter = {
  negate;
  relative_time_range;
  absolute_time_range;
  participant_role;
  threshold;
   }

let make_transcript_filter 
  ?(negate : bool option)
  ?(participant_role : participant_role option)
  ?(relative_time_range : relative_time_range option)
  ?(absolute_time_range : absolute_time_range option)
  ~(targets : string list)
  ~(transcript_filter_type : transcript_filter_type)
  () : transcript_filter = {
  targets;
  negate;
  participant_role;
  relative_time_range;
  absolute_time_range;
  transcript_filter_type;
   }

let make_sentiment_filter 
  ?(negate : bool option)
  ?(participant_role : participant_role option)
  ?(relative_time_range : relative_time_range option)
  ?(absolute_time_range : absolute_time_range option)
  ~(sentiments : sentiment_value list)
  () : sentiment_filter = {
  negate;
  participant_role;
  relative_time_range;
  absolute_time_range;
  sentiments;
   }

let make_category_properties 
  ?(input_type : input_type option)
  ?(last_update_time : float option)
  ?(create_time : float option)
  ?(rules : rule list option)
  ?(category_name : string option)
  () : category_properties = {
  input_type; last_update_time; create_time; rules; category_name; 
}

let make_update_call_analytics_category_response 
  ?(category_properties : category_properties option) ()
: update_call_analytics_category_response = { category_properties; 
}

let make_update_call_analytics_category_request 
  ?(input_type : input_type option)
  ~(rules : rule list)
  ~(category_name : string)
  () : update_call_analytics_category_request = {
  input_type; rules; category_name;  }

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_request = { tag_keys; resource_arn; 
}

let make_content_redaction 
  ?(pii_entity_types : pii_entity_type list option)
  ~(redaction_output : redaction_output)
  ~(redaction_type : redaction_type)
  () : content_redaction = {
  pii_entity_types; redaction_output; redaction_type; 
}

let make_model_settings  ?(language_model_name : string option) ()
: model_settings = { language_model_name;  }

let make_language_code_item 
  ?(duration_in_seconds : float option)
  ?(language_code : language_code option)
  () : language_code_item = { duration_in_seconds; language_code; 
}

let make_toxicity_detection_settings 
  ~(toxicity_categories : toxicity_category list) ()
: toxicity_detection_settings = { toxicity_categories; 
}

let make_transcription_job_summary 
  ?(toxicity_detection : toxicity_detection_settings list option)
  ?(language_codes : language_code_item list option)
  ?(identified_language_score : float option)
  ?(identify_multiple_languages : bool option)
  ?(identify_language : bool option)
  ?(model_settings : model_settings option)
  ?(content_redaction : content_redaction option)
  ?(output_location_type : output_location_type option)
  ?(failure_reason : string option)
  ?(transcription_job_status : transcription_job_status option)
  ?(language_code : language_code option)
  ?(completion_time : float option)
  ?(start_time : float option)
  ?(creation_time : float option)
  ?(transcription_job_name : string option)
  () : transcription_job_summary = {
  toxicity_detection;
  language_codes;
  identified_language_score;
  identify_multiple_languages;
  identify_language;
  model_settings;
  content_redaction;
  output_location_type;
  failure_reason;
  transcription_job_status;
  language_code;
  completion_time;
  start_time;
  creation_time;
  transcription_job_name;
   }

let make_media 
  ?(redacted_media_file_uri : string option)
  ?(media_file_uri : string option)
  () : media = { redacted_media_file_uri; media_file_uri; 
}

let make_transcript 
  ?(redacted_transcript_file_uri : string option)
  ?(transcript_file_uri : string option)
  () : transcript = { redacted_transcript_file_uri; transcript_file_uri; 
}

let make_settings 
  ?(vocabulary_filter_method : vocabulary_filter_method option)
  ?(vocabulary_filter_name : string option)
  ?(max_alternatives : int option)
  ?(show_alternatives : bool option)
  ?(channel_identification : bool option)
  ?(max_speaker_labels : int option)
  ?(show_speaker_labels : bool option)
  ?(vocabulary_name : string option)
  () : settings = {
  vocabulary_filter_method;
  vocabulary_filter_name;
  max_alternatives;
  show_alternatives;
  channel_identification;
  max_speaker_labels;
  show_speaker_labels;
  vocabulary_name;
   }

let make_job_execution_settings 
  ?(data_access_role_arn : string option)
  ?(allow_deferred_execution : bool option)
  () : job_execution_settings = {
  data_access_role_arn; allow_deferred_execution;  }

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_subtitles_output 
  ?(output_start_index : int option)
  ?(subtitle_file_uris : string list option)
  ?(formats : subtitle_format list option)
  () : subtitles_output = { output_start_index; subtitle_file_uris; formats; 
}

let make_language_id_settings 
  ?(language_model_name : string option)
  ?(vocabulary_filter_name : string option)
  ?(vocabulary_name : string option)
  () : language_id_settings = {
  language_model_name; vocabulary_filter_name; vocabulary_name; 
}

let make_transcription_job 
  ?(toxicity_detection : toxicity_detection_settings list option)
  ?(language_id_settings : (string * language_id_settings) list option)
  ?(subtitles : subtitles_output option)
  ?(tags : tag list option)
  ?(language_codes : language_code_item list option)
  ?(identified_language_score : float option)
  ?(language_options : language_code list option)
  ?(identify_multiple_languages : bool option)
  ?(identify_language : bool option)
  ?(content_redaction : content_redaction option)
  ?(job_execution_settings : job_execution_settings option)
  ?(model_settings : model_settings option)
  ?(settings : settings option)
  ?(failure_reason : string option)
  ?(completion_time : float option)
  ?(creation_time : float option)
  ?(start_time : float option)
  ?(transcript : transcript option)
  ?(media : media option)
  ?(media_format : media_format option)
  ?(media_sample_rate_hertz : int option)
  ?(language_code : language_code option)
  ?(transcription_job_status : transcription_job_status option)
  ?(transcription_job_name : string option)
  () : transcription_job = {
  toxicity_detection;
  language_id_settings;
  subtitles;
  tags;
  language_codes;
  identified_language_score;
  language_options;
  identify_multiple_languages;
  identify_language;
  content_redaction;
  job_execution_settings;
  model_settings;
  settings;
  failure_reason;
  completion_time;
  creation_time;
  start_time;
  transcript;
  media;
  media_format;
  media_sample_rate_hertz;
  language_code;
  transcription_job_status;
  transcription_job_name;
   }

let make_tag_resource_response  () : tag_resource_response =
()

let make_tag_resource_request  ~(tags : tag list) ~(resource_arn : string) ()
: tag_resource_request = { tags; resource_arn; 
}

let make_start_transcription_job_response 
  ?(transcription_job : transcription_job option) ()
: start_transcription_job_response = { transcription_job; 
}

let make_subtitles 
  ?(output_start_index : int option)
  ?(formats : subtitle_format list option)
  () : subtitles = { output_start_index; formats; 
}

let make_start_transcription_job_request 
  ?(toxicity_detection : toxicity_detection_settings list option)
  ?(language_id_settings : (string * language_id_settings) list option)
  ?(tags : tag list option)
  ?(subtitles : subtitles option)
  ?(language_options : language_code list option)
  ?(identify_multiple_languages : bool option)
  ?(identify_language : bool option)
  ?(content_redaction : content_redaction option)
  ?(job_execution_settings : job_execution_settings option)
  ?(model_settings : model_settings option)
  ?(settings : settings option)
  ?(kms_encryption_context : (string * string) list option)
  ?(output_encryption_kms_key_id : string option)
  ?(output_key : string option)
  ?(output_bucket_name : string option)
  ?(media_format : media_format option)
  ?(media_sample_rate_hertz : int option)
  ?(language_code : language_code option)
  ~(media : media)
  ~(transcription_job_name : string)
  () : start_transcription_job_request = {
  toxicity_detection;
  language_id_settings;
  tags;
  subtitles;
  language_options;
  identify_multiple_languages;
  identify_language;
  content_redaction;
  job_execution_settings;
  model_settings;
  settings;
  kms_encryption_context;
  output_encryption_kms_key_id;
  output_key;
  output_bucket_name;
  media;
  media_format;
  media_sample_rate_hertz;
  language_code;
  transcription_job_name;
   }

let make_medical_transcript  ?(transcript_file_uri : string option) ()
: medical_transcript = { transcript_file_uri; 
}

let make_medical_transcription_setting 
  ?(vocabulary_name : string option)
  ?(max_alternatives : int option)
  ?(show_alternatives : bool option)
  ?(channel_identification : bool option)
  ?(max_speaker_labels : int option)
  ?(show_speaker_labels : bool option)
  () : medical_transcription_setting = {
  vocabulary_name;
  max_alternatives;
  show_alternatives;
  channel_identification;
  max_speaker_labels;
  show_speaker_labels;
   }

let make_medical_transcription_job 
  ?(tags : tag list option)
  ?(type_ : type_ option)
  ?(specialty : specialty option)
  ?(content_identification_type : medical_content_identification_type option)
  ?(settings : medical_transcription_setting option)
  ?(failure_reason : string option)
  ?(completion_time : float option)
  ?(creation_time : float option)
  ?(start_time : float option)
  ?(transcript : medical_transcript option)
  ?(media : media option)
  ?(media_format : media_format option)
  ?(media_sample_rate_hertz : int option)
  ?(language_code : language_code option)
  ?(transcription_job_status : transcription_job_status option)
  ?(medical_transcription_job_name : string option)
  () : medical_transcription_job = {
  tags;
  type_;
  specialty;
  content_identification_type;
  settings;
  failure_reason;
  completion_time;
  creation_time;
  start_time;
  transcript;
  media;
  media_format;
  media_sample_rate_hertz;
  language_code;
  transcription_job_status;
  medical_transcription_job_name;
   }

let make_start_medical_transcription_job_response 
  ?(medical_transcription_job : medical_transcription_job option) ()
: start_medical_transcription_job_response = { medical_transcription_job; 
}

let make_start_medical_transcription_job_request 
  ?(tags : tag list option)
  ?(content_identification_type : medical_content_identification_type option)
  ?(settings : medical_transcription_setting option)
  ?(kms_encryption_context : (string * string) list option)
  ?(output_encryption_kms_key_id : string option)
  ?(output_key : string option)
  ?(media_format : media_format option)
  ?(media_sample_rate_hertz : int option)
  ~(type_ : type_)
  ~(specialty : specialty)
  ~(output_bucket_name : string)
  ~(media : media)
  ~(language_code : language_code)
  ~(medical_transcription_job_name : string)
  () : start_medical_transcription_job_request = {
  tags;
  type_;
  specialty;
  content_identification_type;
  settings;
  kms_encryption_context;
  output_encryption_kms_key_id;
  output_key;
  output_bucket_name;
  media;
  media_format;
  media_sample_rate_hertz;
  language_code;
  medical_transcription_job_name;
   }

let make_medical_scribe_output 
  ~(clinical_document_uri : string) ~(transcript_file_uri : string) ()
: medical_scribe_output = { clinical_document_uri; transcript_file_uri; 
}

let make_medical_scribe_settings 
  ?(vocabulary_filter_method : vocabulary_filter_method option)
  ?(vocabulary_filter_name : string option)
  ?(vocabulary_name : string option)
  ?(channel_identification : bool option)
  ?(max_speaker_labels : int option)
  ?(show_speaker_labels : bool option)
  () : medical_scribe_settings = {
  vocabulary_filter_method;
  vocabulary_filter_name;
  vocabulary_name;
  channel_identification;
  max_speaker_labels;
  show_speaker_labels;
   }

let make_medical_scribe_channel_definition 
  ~(participant_role : medical_scribe_participant_role)
  ~(channel_id : int)
  () : medical_scribe_channel_definition = { participant_role; channel_id; 
}

let make_medical_scribe_job 
  ?(tags : tag list option)
  ?(channel_definitions : medical_scribe_channel_definition list option)
  ?(data_access_role_arn : string option)
  ?(settings : medical_scribe_settings option)
  ?(failure_reason : string option)
  ?(completion_time : float option)
  ?(creation_time : float option)
  ?(start_time : float option)
  ?(medical_scribe_output : medical_scribe_output option)
  ?(media : media option)
  ?(language_code : medical_scribe_language_code option)
  ?(medical_scribe_job_status : medical_scribe_job_status option)
  ?(medical_scribe_job_name : string option)
  () : medical_scribe_job = {
  tags;
  channel_definitions;
  data_access_role_arn;
  settings;
  failure_reason;
  completion_time;
  creation_time;
  start_time;
  medical_scribe_output;
  media;
  language_code;
  medical_scribe_job_status;
  medical_scribe_job_name;
   }

let make_start_medical_scribe_job_response 
  ?(medical_scribe_job : medical_scribe_job option) ()
: start_medical_scribe_job_response = { medical_scribe_job; 
}

let make_start_medical_scribe_job_request 
  ?(tags : tag list option)
  ?(channel_definitions : medical_scribe_channel_definition list option)
  ?(kms_encryption_context : (string * string) list option)
  ?(output_encryption_kms_key_id : string option)
  ~(settings : medical_scribe_settings)
  ~(data_access_role_arn : string)
  ~(output_bucket_name : string)
  ~(media : media)
  ~(medical_scribe_job_name : string)
  () : start_medical_scribe_job_request = {
  tags;
  channel_definitions;
  settings;
  data_access_role_arn;
  kms_encryption_context;
  output_encryption_kms_key_id;
  output_bucket_name;
  media;
  medical_scribe_job_name;
   }

let make_call_analytics_skipped_feature 
  ?(message : string option)
  ?(reason_code : call_analytics_skipped_reason_code option)
  ?(feature : call_analytics_feature option)
  () : call_analytics_skipped_feature = { message; reason_code; feature; 
}

let make_call_analytics_job_details 
  ?(skipped : call_analytics_skipped_feature list option) ()
: call_analytics_job_details = { skipped;  }

let make_summarization  ~(generate_abstractive_summary : bool) ()
: summarization = { generate_abstractive_summary; 
}

let make_call_analytics_job_settings 
  ?(summarization : summarization option)
  ?(language_id_settings : (string * language_id_settings) list option)
  ?(language_options : language_code list option)
  ?(content_redaction : content_redaction option)
  ?(language_model_name : string option)
  ?(vocabulary_filter_method : vocabulary_filter_method option)
  ?(vocabulary_filter_name : string option)
  ?(vocabulary_name : string option)
  () : call_analytics_job_settings = {
  summarization;
  language_id_settings;
  language_options;
  content_redaction;
  language_model_name;
  vocabulary_filter_method;
  vocabulary_filter_name;
  vocabulary_name;
   }

let make_channel_definition 
  ?(participant_role : participant_role option) ?(channel_id : int option) ()
: channel_definition = { participant_role; channel_id; 
}

let make_call_analytics_job 
  ?(channel_definitions : channel_definition list option)
  ?(settings : call_analytics_job_settings option)
  ?(identified_language_score : float option)
  ?(data_access_role_arn : string option)
  ?(failure_reason : string option)
  ?(completion_time : float option)
  ?(creation_time : float option)
  ?(start_time : float option)
  ?(transcript : transcript option)
  ?(media : media option)
  ?(media_format : media_format option)
  ?(media_sample_rate_hertz : int option)
  ?(language_code : language_code option)
  ?(call_analytics_job_details : call_analytics_job_details option)
  ?(call_analytics_job_status : call_analytics_job_status option)
  ?(call_analytics_job_name : string option)
  () : call_analytics_job = {
  channel_definitions;
  settings;
  identified_language_score;
  data_access_role_arn;
  failure_reason;
  completion_time;
  creation_time;
  start_time;
  transcript;
  media;
  media_format;
  media_sample_rate_hertz;
  language_code;
  call_analytics_job_details;
  call_analytics_job_status;
  call_analytics_job_name;
   }

let make_start_call_analytics_job_response 
  ?(call_analytics_job : call_analytics_job option) ()
: start_call_analytics_job_response = { call_analytics_job; 
}

let make_start_call_analytics_job_request 
  ?(channel_definitions : channel_definition list option)
  ?(settings : call_analytics_job_settings option)
  ?(data_access_role_arn : string option)
  ?(output_encryption_kms_key_id : string option)
  ?(output_location : string option)
  ~(media : media)
  ~(call_analytics_job_name : string)
  () : start_call_analytics_job_request = {
  channel_definitions;
  settings;
  data_access_role_arn;
  output_encryption_kms_key_id;
  output_location;
  media;
  call_analytics_job_name;
   }

let make_list_vocabulary_filters_response 
  ?(vocabulary_filters : vocabulary_filter_info list option)
  ?(next_token : string option)
  () : list_vocabulary_filters_response = { vocabulary_filters; next_token; 
}

let make_list_vocabulary_filters_request 
  ?(name_contains : string option)
  ?(max_results : int option)
  ?(next_token : string option)
  () : list_vocabulary_filters_request = {
  name_contains; max_results; next_token; 
}

let make_list_vocabularies_response 
  ?(vocabularies : vocabulary_info list option)
  ?(next_token : string option)
  ?(status : vocabulary_state option)
  () : list_vocabularies_response = { vocabularies; next_token; status; 
}

let make_list_vocabularies_request 
  ?(name_contains : string option)
  ?(state_equals : vocabulary_state option)
  ?(max_results : int option)
  ?(next_token : string option)
  () : list_vocabularies_request = {
  name_contains; state_equals; max_results; next_token; 
}

let make_list_transcription_jobs_response 
  ?(transcription_job_summaries : transcription_job_summary list option)
  ?(next_token : string option)
  ?(status : transcription_job_status option)
  () : list_transcription_jobs_response = {
  transcription_job_summaries; next_token; status; 
}

let make_list_transcription_jobs_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(job_name_contains : string option)
  ?(status : transcription_job_status option)
  () : list_transcription_jobs_request = {
  max_results; next_token; job_name_contains; status; 
}

let make_list_tags_for_resource_response 
  ?(tags : tag list option) ?(resource_arn : string option) ()
: list_tags_for_resource_response = { tags; resource_arn; 
}

let make_list_tags_for_resource_request  ~(resource_arn : string) ()
: list_tags_for_resource_request = { resource_arn; 
}

let make_list_medical_vocabularies_response 
  ?(vocabularies : vocabulary_info list option)
  ?(next_token : string option)
  ?(status : vocabulary_state option)
  () : list_medical_vocabularies_response = {
  vocabularies; next_token; status; 
}

let make_list_medical_vocabularies_request 
  ?(name_contains : string option)
  ?(state_equals : vocabulary_state option)
  ?(max_results : int option)
  ?(next_token : string option)
  () : list_medical_vocabularies_request = {
  name_contains; state_equals; max_results; next_token; 
}

let make_medical_transcription_job_summary 
  ?(type_ : type_ option)
  ?(content_identification_type : medical_content_identification_type option)
  ?(specialty : specialty option)
  ?(output_location_type : output_location_type option)
  ?(failure_reason : string option)
  ?(transcription_job_status : transcription_job_status option)
  ?(language_code : language_code option)
  ?(completion_time : float option)
  ?(start_time : float option)
  ?(creation_time : float option)
  ?(medical_transcription_job_name : string option)
  () : medical_transcription_job_summary = {
  type_;
  content_identification_type;
  specialty;
  output_location_type;
  failure_reason;
  transcription_job_status;
  language_code;
  completion_time;
  start_time;
  creation_time;
  medical_transcription_job_name;
   }

let make_list_medical_transcription_jobs_response 
  ?(medical_transcription_job_summaries : medical_transcription_job_summary list option)
  ?(next_token : string option)
  ?(status : transcription_job_status option)
  () : list_medical_transcription_jobs_response = {
  medical_transcription_job_summaries; next_token; status; 
}

let make_list_medical_transcription_jobs_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(job_name_contains : string option)
  ?(status : transcription_job_status option)
  () : list_medical_transcription_jobs_request = {
  max_results; next_token; job_name_contains; status; 
}

let make_medical_scribe_job_summary 
  ?(failure_reason : string option)
  ?(medical_scribe_job_status : medical_scribe_job_status option)
  ?(language_code : medical_scribe_language_code option)
  ?(completion_time : float option)
  ?(start_time : float option)
  ?(creation_time : float option)
  ?(medical_scribe_job_name : string option)
  () : medical_scribe_job_summary = {
  failure_reason;
  medical_scribe_job_status;
  language_code;
  completion_time;
  start_time;
  creation_time;
  medical_scribe_job_name;
   }

let make_list_medical_scribe_jobs_response 
  ?(medical_scribe_job_summaries : medical_scribe_job_summary list option)
  ?(next_token : string option)
  ?(status : medical_scribe_job_status option)
  () : list_medical_scribe_jobs_response = {
  medical_scribe_job_summaries; next_token; status; 
}

let make_list_medical_scribe_jobs_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(job_name_contains : string option)
  ?(status : medical_scribe_job_status option)
  () : list_medical_scribe_jobs_request = {
  max_results; next_token; job_name_contains; status; 
}

let make_input_data_config 
  ?(tuning_data_s3_uri : string option)
  ~(data_access_role_arn : string)
  ~(s3_uri : string)
  () : input_data_config = {
  data_access_role_arn; tuning_data_s3_uri; s3_uri; 
}

let make_language_model 
  ?(input_data_config : input_data_config option)
  ?(failure_reason : string option)
  ?(upgrade_availability : bool option)
  ?(model_status : model_status option)
  ?(base_model_name : base_model_name option)
  ?(language_code : clm_language_code option)
  ?(last_modified_time : float option)
  ?(create_time : float option)
  ?(model_name : string option)
  () : language_model = {
  input_data_config;
  failure_reason;
  upgrade_availability;
  model_status;
  base_model_name;
  language_code;
  last_modified_time;
  create_time;
  model_name;
   }

let make_list_language_models_response 
  ?(models : language_model list option) ?(next_token : string option) ()
: list_language_models_response = { models; next_token; 
}

let make_list_language_models_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(name_contains : string option)
  ?(status_equals : model_status option)
  () : list_language_models_request = {
  max_results; next_token; name_contains; status_equals; 
}

let make_call_analytics_job_summary 
  ?(failure_reason : string option)
  ?(call_analytics_job_details : call_analytics_job_details option)
  ?(call_analytics_job_status : call_analytics_job_status option)
  ?(language_code : language_code option)
  ?(completion_time : float option)
  ?(start_time : float option)
  ?(creation_time : float option)
  ?(call_analytics_job_name : string option)
  () : call_analytics_job_summary = {
  failure_reason;
  call_analytics_job_details;
  call_analytics_job_status;
  language_code;
  completion_time;
  start_time;
  creation_time;
  call_analytics_job_name;
   }

let make_list_call_analytics_jobs_response 
  ?(call_analytics_job_summaries : call_analytics_job_summary list option)
  ?(next_token : string option)
  ?(status : call_analytics_job_status option)
  () : list_call_analytics_jobs_response = {
  call_analytics_job_summaries; next_token; status; 
}

let make_list_call_analytics_jobs_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(job_name_contains : string option)
  ?(status : call_analytics_job_status option)
  () : list_call_analytics_jobs_request = {
  max_results; next_token; job_name_contains; status; 
}

let make_list_call_analytics_categories_response 
  ?(categories : category_properties list option)
  ?(next_token : string option)
  () : list_call_analytics_categories_response = { categories; next_token; 
}

let make_list_call_analytics_categories_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_call_analytics_categories_request = { max_results; next_token; 
}

let make_get_vocabulary_filter_response 
  ?(download_uri : string option)
  ?(last_modified_time : float option)
  ?(language_code : language_code option)
  ?(vocabulary_filter_name : string option)
  () : get_vocabulary_filter_response = {
  download_uri; last_modified_time; language_code; vocabulary_filter_name; 
}

let make_get_vocabulary_filter_request  ~(vocabulary_filter_name : string) ()
: get_vocabulary_filter_request = { vocabulary_filter_name; 
}

let make_get_vocabulary_response 
  ?(download_uri : string option)
  ?(failure_reason : string option)
  ?(last_modified_time : float option)
  ?(vocabulary_state : vocabulary_state option)
  ?(language_code : language_code option)
  ?(vocabulary_name : string option)
  () : get_vocabulary_response = {
  download_uri;
  failure_reason;
  last_modified_time;
  vocabulary_state;
  language_code;
  vocabulary_name;
   }

let make_get_vocabulary_request  ~(vocabulary_name : string) ()
: get_vocabulary_request = { vocabulary_name; 
}

let make_get_transcription_job_response 
  ?(transcription_job : transcription_job option) ()
: get_transcription_job_response = { transcription_job; 
}

let make_get_transcription_job_request  ~(transcription_job_name : string) ()
: get_transcription_job_request = { transcription_job_name; 
}

let make_get_medical_vocabulary_response 
  ?(download_uri : string option)
  ?(failure_reason : string option)
  ?(last_modified_time : float option)
  ?(vocabulary_state : vocabulary_state option)
  ?(language_code : language_code option)
  ?(vocabulary_name : string option)
  () : get_medical_vocabulary_response = {
  download_uri;
  failure_reason;
  last_modified_time;
  vocabulary_state;
  language_code;
  vocabulary_name;
   }

let make_get_medical_vocabulary_request  ~(vocabulary_name : string) ()
: get_medical_vocabulary_request = { vocabulary_name; 
}

let make_get_medical_transcription_job_response 
  ?(medical_transcription_job : medical_transcription_job option) ()
: get_medical_transcription_job_response = { medical_transcription_job; 
}

let make_get_medical_transcription_job_request 
  ~(medical_transcription_job_name : string) ()
: get_medical_transcription_job_request = { medical_transcription_job_name; 
}

let make_get_medical_scribe_job_response 
  ?(medical_scribe_job : medical_scribe_job option) ()
: get_medical_scribe_job_response = { medical_scribe_job; 
}

let make_get_medical_scribe_job_request 
  ~(medical_scribe_job_name : string) () : get_medical_scribe_job_request = {
  medical_scribe_job_name;  }

let make_get_call_analytics_job_response 
  ?(call_analytics_job : call_analytics_job option) ()
: get_call_analytics_job_response = { call_analytics_job; 
}

let make_get_call_analytics_job_request 
  ~(call_analytics_job_name : string) () : get_call_analytics_job_request = {
  call_analytics_job_name;  }

let make_get_call_analytics_category_response 
  ?(category_properties : category_properties option) ()
: get_call_analytics_category_response = { category_properties; 
}

let make_get_call_analytics_category_request  ~(category_name : string) ()
: get_call_analytics_category_request = { category_name; 
}

let make_describe_language_model_response 
  ?(language_model : language_model option) ()
: describe_language_model_response = { language_model; 
}

let make_describe_language_model_request  ~(model_name : string) ()
: describe_language_model_request = { model_name; 
}

let make_delete_vocabulary_filter_request 
  ~(vocabulary_filter_name : string) () : delete_vocabulary_filter_request =
{ vocabulary_filter_name;  }

let make_delete_vocabulary_request  ~(vocabulary_name : string) ()
: delete_vocabulary_request = { vocabulary_name; 
}

let make_delete_transcription_job_request 
  ~(transcription_job_name : string) () : delete_transcription_job_request =
{ transcription_job_name;  }

let make_delete_medical_vocabulary_request  ~(vocabulary_name : string) ()
: delete_medical_vocabulary_request = { vocabulary_name; 
}

let make_delete_medical_transcription_job_request 
  ~(medical_transcription_job_name : string) ()
: delete_medical_transcription_job_request = {
  medical_transcription_job_name; 
}

let make_delete_medical_scribe_job_request 
  ~(medical_scribe_job_name : string) () : delete_medical_scribe_job_request
= { medical_scribe_job_name;  }

let make_delete_language_model_request  ~(model_name : string) ()
: delete_language_model_request = { model_name; 
}

let make_delete_call_analytics_job_response  ()
: delete_call_analytics_job_response =
()

let make_delete_call_analytics_job_request 
  ~(call_analytics_job_name : string) () : delete_call_analytics_job_request
= { call_analytics_job_name; 
}

let make_delete_call_analytics_category_response  ()
: delete_call_analytics_category_response =
()

let make_delete_call_analytics_category_request  ~(category_name : string) ()
: delete_call_analytics_category_request = { category_name; 
}

let make_create_vocabulary_filter_response 
  ?(last_modified_time : float option)
  ?(language_code : language_code option)
  ?(vocabulary_filter_name : string option)
  () : create_vocabulary_filter_response = {
  last_modified_time; language_code; vocabulary_filter_name; 
}

let make_create_vocabulary_filter_request 
  ?(data_access_role_arn : string option)
  ?(tags : tag list option)
  ?(vocabulary_filter_file_uri : string option)
  ?(words : string list option)
  ~(language_code : language_code)
  ~(vocabulary_filter_name : string)
  () : create_vocabulary_filter_request = {
  data_access_role_arn;
  tags;
  vocabulary_filter_file_uri;
  words;
  language_code;
  vocabulary_filter_name;
   }

let make_create_vocabulary_response 
  ?(failure_reason : string option)
  ?(last_modified_time : float option)
  ?(vocabulary_state : vocabulary_state option)
  ?(language_code : language_code option)
  ?(vocabulary_name : string option)
  () : create_vocabulary_response = {
  failure_reason;
  last_modified_time;
  vocabulary_state;
  language_code;
  vocabulary_name;
   }

let make_create_vocabulary_request 
  ?(data_access_role_arn : string option)
  ?(tags : tag list option)
  ?(vocabulary_file_uri : string option)
  ?(phrases : string list option)
  ~(language_code : language_code)
  ~(vocabulary_name : string)
  () : create_vocabulary_request = {
  data_access_role_arn;
  tags;
  vocabulary_file_uri;
  phrases;
  language_code;
  vocabulary_name;
   }

let make_create_medical_vocabulary_response 
  ?(failure_reason : string option)
  ?(last_modified_time : float option)
  ?(vocabulary_state : vocabulary_state option)
  ?(language_code : language_code option)
  ?(vocabulary_name : string option)
  () : create_medical_vocabulary_response = {
  failure_reason;
  last_modified_time;
  vocabulary_state;
  language_code;
  vocabulary_name;
   }

let make_create_medical_vocabulary_request 
  ?(tags : tag list option)
  ~(vocabulary_file_uri : string)
  ~(language_code : language_code)
  ~(vocabulary_name : string)
  () : create_medical_vocabulary_request = {
  tags; vocabulary_file_uri; language_code; vocabulary_name; 
}

let make_create_language_model_response 
  ?(model_status : model_status option)
  ?(input_data_config : input_data_config option)
  ?(model_name : string option)
  ?(base_model_name : base_model_name option)
  ?(language_code : clm_language_code option)
  () : create_language_model_response = {
  model_status;
  input_data_config;
  model_name;
  base_model_name;
  language_code;
   }

let make_create_language_model_request 
  ?(tags : tag list option)
  ~(input_data_config : input_data_config)
  ~(model_name : string)
  ~(base_model_name : base_model_name)
  ~(language_code : clm_language_code)
  () : create_language_model_request = {
  tags; input_data_config; model_name; base_model_name; language_code; 
}

let make_create_call_analytics_category_response 
  ?(category_properties : category_properties option) ()
: create_call_analytics_category_response = { category_properties; 
}

let make_create_call_analytics_category_request 
  ?(input_type : input_type option)
  ~(rules : rule list)
  ~(category_name : string)
  () : create_call_analytics_category_request = {
  input_type; rules; category_name; 
}

