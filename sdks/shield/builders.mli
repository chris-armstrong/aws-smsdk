open Types
val make_validation_exception_field : message:string -> name:string -> unit
-> validation_exception_field

val make_update_subscription_response : unit
-> update_subscription_response

val make_update_subscription_request : ?auto_renew:auto_renew -> unit
-> update_subscription_request

val make_update_protection_group_response : unit
-> update_protection_group_response

val make_update_protection_group_request :
  ?members:string list ->
  ?resource_type:protected_resource_type ->
  pattern:protection_group_pattern ->
  aggregation:protection_group_aggregation ->
  protection_group_id:string ->
  unit
-> update_protection_group_request

val make_update_emergency_contact_settings_response : unit
-> update_emergency_contact_settings_response

val make_emergency_contact :
  ?contact_notes:string ->
  ?phone_number:string ->
  email_address:string ->
  unit
-> emergency_contact

val make_update_emergency_contact_settings_request :
  ?emergency_contact_list:emergency_contact list -> unit
-> update_emergency_contact_settings_request

val make_update_application_layer_automatic_response_response : unit
-> update_application_layer_automatic_response_response

val make_block_action : unit -> block_action

val make_count_action : unit -> count_action

val make_response_action : ?count:count_action -> ?block:block_action -> unit
-> response_action

val make_update_application_layer_automatic_response_request :
  action:response_action -> resource_arn:string -> unit
-> update_application_layer_automatic_response_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request

val make_contributor : ?value:int -> ?name:string -> unit
-> contributor

val make_time_range : ?to_exclusive:float -> ?from_inclusive:float -> unit
-> time_range

val make_tag_resource_response : unit -> tag_resource_response

val make_tag : ?value:string -> ?key:string -> unit
-> tag

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request

val make_summarized_counter :
  ?unit_:string ->
  ?n:int ->
  ?sum:float ->
  ?average:float ->
  ?max:float ->
  ?name:string ->
  unit -> summarized_counter

val make_summarized_attack_vector :
  ?vector_counters:summarized_counter list -> vector_type:string -> unit
-> summarized_attack_vector

val make_limit : ?max:int -> ?type_:string -> unit
-> limit

val make_protection_limits :
  protected_resource_type_limits:limit list -> unit
-> protection_limits

val make_protection_group_arbitrary_pattern_limits : max_members:int -> unit
-> protection_group_arbitrary_pattern_limits

val make_protection_group_pattern_type_limits :
  arbitrary_pattern_limits:protection_group_arbitrary_pattern_limits -> unit
-> protection_group_pattern_type_limits

val make_protection_group_limits :
  pattern_type_limits:protection_group_pattern_type_limits ->
  max_protection_groups:int ->
  unit -> protection_group_limits

val make_subscription_limits :
  protection_group_limits:protection_group_limits ->
  protection_limits:protection_limits ->
  unit -> subscription_limits

val make_subscription :
  ?subscription_arn:string ->
  ?proactive_engagement_status:proactive_engagement_status ->
  ?limits:limit list ->
  ?auto_renew:auto_renew ->
  ?time_commitment_in_seconds:int ->
  ?end_time:float ->
  ?start_time:float ->
  subscription_limits:subscription_limits ->
  unit -> subscription

val make_sub_resource_summary :
  ?counters:summarized_counter list ->
  ?attack_vectors:summarized_attack_vector list ->
  ?id:string ->
  ?type_:sub_resource_type ->
  unit
-> sub_resource_summary

val make_application_layer_automatic_response_configuration :
  action:response_action ->
  status:application_layer_automatic_response_status ->
  unit
-> application_layer_automatic_response_configuration

val make_protection :
  ?application_layer_automatic_response_configuration:application_layer_automatic_response_configuration ->
  ?protection_arn:string ->
  ?health_check_ids:string list ->
  ?resource_arn:string ->
  ?name:string ->
  ?id:string ->
  unit -> protection

val make_protection_group :
  ?protection_group_arn:string ->
  ?resource_type:protected_resource_type ->
  members:string list ->
  pattern:protection_group_pattern ->
  aggregation:protection_group_aggregation ->
  protection_group_id:string ->
  unit -> protection_group

val make_mitigation : ?mitigation_name:string -> unit
-> mitigation

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request

val make_list_resources_in_protection_group_response :
  ?next_token:string -> resource_arns:string list -> unit
-> list_resources_in_protection_group_response

val make_list_resources_in_protection_group_request :
  ?max_results:int ->
  ?next_token:string ->
  protection_group_id:string ->
  unit
-> list_resources_in_protection_group_request

val make_list_protections_response :
  ?next_token:string -> ?protections:protection list -> unit
-> list_protections_response

val make_inclusion_protection_filters :
  ?resource_types:protected_resource_type list ->
  ?protection_names:string list ->
  ?resource_arns:string list ->
  unit -> inclusion_protection_filters

val make_list_protections_request :
  ?inclusion_filters:inclusion_protection_filters ->
  ?max_results:int ->
  ?next_token:string ->
  unit -> list_protections_request

val make_list_protection_groups_response :
  ?next_token:string -> protection_groups:protection_group list -> unit
-> list_protection_groups_response

val make_inclusion_protection_group_filters :
  ?aggregations:protection_group_aggregation list ->
  ?resource_types:protected_resource_type list ->
  ?patterns:protection_group_pattern list ->
  ?protection_group_ids:string list ->
  unit
-> inclusion_protection_group_filters

val make_list_protection_groups_request :
  ?inclusion_filters:inclusion_protection_group_filters ->
  ?max_results:int ->
  ?next_token:string ->
  unit -> list_protection_groups_request

val make_attack_vector_description : vector_type:string -> unit
-> attack_vector_description

val make_attack_summary :
  ?attack_vectors:attack_vector_description list ->
  ?end_time:float ->
  ?start_time:float ->
  ?resource_arn:string ->
  ?attack_id:string ->
  unit -> attack_summary

val make_list_attacks_response :
  ?next_token:string -> ?attack_summaries:attack_summary list -> unit
-> list_attacks_response

val make_list_attacks_request :
  ?max_results:int ->
  ?next_token:string ->
  ?end_time:time_range ->
  ?start_time:time_range ->
  ?resource_arns:string list ->
  unit -> list_attacks_request

val make_get_subscription_state_response :
  subscription_state:subscription_state -> unit
-> get_subscription_state_response

val make_get_subscription_state_request : unit
-> get_subscription_state_request

val make_enable_proactive_engagement_response : unit
-> enable_proactive_engagement_response

val make_enable_proactive_engagement_request : unit
-> enable_proactive_engagement_request

val make_enable_application_layer_automatic_response_response : unit
-> enable_application_layer_automatic_response_response

val make_enable_application_layer_automatic_response_request :
  action:response_action -> resource_arn:string -> unit
-> enable_application_layer_automatic_response_request

val make_disassociate_health_check_response : unit
-> disassociate_health_check_response

val make_disassociate_health_check_request :
  health_check_arn:string -> protection_id:string -> unit
-> disassociate_health_check_request

val make_disassociate_drt_role_response : unit
-> disassociate_drt_role_response

val make_disassociate_drt_role_request : unit
-> disassociate_drt_role_request

val make_disassociate_drt_log_bucket_response : unit
-> disassociate_drt_log_bucket_response

val make_disassociate_drt_log_bucket_request : log_bucket:string -> unit
-> disassociate_drt_log_bucket_request

val make_disable_proactive_engagement_response : unit
-> disable_proactive_engagement_response

val make_disable_proactive_engagement_request : unit
-> disable_proactive_engagement_request

val make_disable_application_layer_automatic_response_response : unit
-> disable_application_layer_automatic_response_response

val make_disable_application_layer_automatic_response_request :
  resource_arn:string -> unit
-> disable_application_layer_automatic_response_request

val make_describe_subscription_response : ?subscription:subscription -> unit
-> describe_subscription_response

val make_describe_subscription_request : unit
-> describe_subscription_request

val make_describe_protection_response : ?protection:protection -> unit
-> describe_protection_response

val make_describe_protection_request :
  ?resource_arn:string -> ?protection_id:string -> unit
-> describe_protection_request

val make_describe_protection_group_response :
  protection_group:protection_group -> unit
-> describe_protection_group_response

val make_describe_protection_group_request :
  protection_group_id:string -> unit
-> describe_protection_group_request

val make_describe_emergency_contact_settings_response :
  ?emergency_contact_list:emergency_contact list -> unit
-> describe_emergency_contact_settings_response

val make_describe_emergency_contact_settings_request : unit
-> describe_emergency_contact_settings_request

val make_describe_drt_access_response :
  ?log_bucket_list:string list -> ?role_arn:string -> unit
-> describe_drt_access_response

val make_describe_drt_access_request : unit
-> describe_drt_access_request

val make_attack_volume_statistics : max:float -> unit
-> attack_volume_statistics

val make_attack_volume :
  ?requests_per_second:attack_volume_statistics ->
  ?packets_per_second:attack_volume_statistics ->
  ?bits_per_second:attack_volume_statistics ->
  unit -> attack_volume

val make_attack_statistics_data_item :
  ?attack_volume:attack_volume -> attack_count:int -> unit
-> attack_statistics_data_item

val make_describe_attack_statistics_response :
  data_items:attack_statistics_data_item list ->
  time_range:time_range ->
  unit
-> describe_attack_statistics_response

val make_describe_attack_statistics_request : unit
-> describe_attack_statistics_request

val make_attack_property :
  ?total:int ->
  ?unit_:unit_ ->
  ?top_contributors:contributor list ->
  ?attack_property_identifier:attack_property_identifier ->
  ?attack_layer:attack_layer ->
  unit -> attack_property

val make_attack_detail :
  ?mitigations:mitigation list ->
  ?attack_properties:attack_property list ->
  ?attack_counters:summarized_counter list ->
  ?end_time:float ->
  ?start_time:float ->
  ?sub_resources:sub_resource_summary list ->
  ?resource_arn:string ->
  ?attack_id:string ->
  unit -> attack_detail

val make_describe_attack_response : ?attack:attack_detail -> unit
-> describe_attack_response

val make_describe_attack_request : attack_id:string -> unit
-> describe_attack_request

val make_delete_subscription_response : unit
-> delete_subscription_response

val make_delete_subscription_request : unit
-> delete_subscription_request

val make_delete_protection_response : unit
-> delete_protection_response

val make_delete_protection_request : protection_id:string -> unit
-> delete_protection_request

val make_delete_protection_group_response : unit
-> delete_protection_group_response

val make_delete_protection_group_request : protection_group_id:string -> unit
-> delete_protection_group_request

val make_create_subscription_response : unit
-> create_subscription_response

val make_create_subscription_request : unit
-> create_subscription_request

val make_create_protection_response : ?protection_id:string -> unit
-> create_protection_response

val make_create_protection_request :
  ?tags:tag list -> resource_arn:string -> name:string -> unit
-> create_protection_request

val make_create_protection_group_response : unit
-> create_protection_group_response

val make_create_protection_group_request :
  ?tags:tag list ->
  ?members:string list ->
  ?resource_type:protected_resource_type ->
  pattern:protection_group_pattern ->
  aggregation:protection_group_aggregation ->
  protection_group_id:string ->
  unit
-> create_protection_group_request

val make_associate_proactive_engagement_details_response : unit
-> associate_proactive_engagement_details_response

val make_associate_proactive_engagement_details_request :
  emergency_contact_list:emergency_contact list -> unit
-> associate_proactive_engagement_details_request

val make_associate_health_check_response : unit
-> associate_health_check_response

val make_associate_health_check_request :
  health_check_arn:string -> protection_id:string -> unit
-> associate_health_check_request

val make_associate_drt_role_response : unit
-> associate_drt_role_response

val make_associate_drt_role_request : role_arn:string -> unit
-> associate_drt_role_request

val make_associate_drt_log_bucket_response : unit
-> associate_drt_log_bucket_response

val make_associate_drt_log_bucket_request : log_bucket:string -> unit
-> associate_drt_log_bucket_request

