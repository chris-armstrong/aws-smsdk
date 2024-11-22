open Types
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

