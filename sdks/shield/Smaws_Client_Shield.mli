open Smaws_Lib
val service : Service.descriptor

type validation_exception_reason = | OTHER
  | FIELD_VALIDATION_FAILED

type validation_exception_field = {
  message: string;
  name: string
}

type update_subscription_response = unit

type auto_renew = | DISABLED
  | ENABLED

type update_subscription_request = {
  auto_renew: auto_renew option
}

type resource_not_found_exception = {
  resource_type: string option;
  message: string option
}

type optimistic_lock_exception = {
  message: string option
}

type locked_subscription_exception = {
  message: string option
}

type invalid_parameter_exception = {
  fields: validation_exception_field list option;
  reason: validation_exception_reason option;
  message: string option
}

type internal_error_exception = {
  message: string option
}

type update_protection_group_response = unit

type protection_group_aggregation = | MAX
  | MEAN
  | SUM

type protection_group_pattern = | BY_RESOURCE_TYPE
  | ARBITRARY
  | ALL

type protected_resource_type = | GLOBAL_ACCELERATOR
  | APPLICATION_LOAD_BALANCER
  | CLASSIC_LOAD_BALANCER
  | ELASTIC_IP_ALLOCATION
  | ROUTE_53_HOSTED_ZONE
  | CLOUDFRONT_DISTRIBUTION

type update_protection_group_request = {
  members: string list option;
  resource_type: protected_resource_type option;
  pattern: protection_group_pattern;
  aggregation: protection_group_aggregation;
  protection_group_id: string
}

type update_emergency_contact_settings_response = unit

type emergency_contact = {
  contact_notes: string option;
  phone_number: string option;
  email_address: string
}

type update_emergency_contact_settings_request = {
  emergency_contact_list: emergency_contact list option
}

type update_application_layer_automatic_response_response = unit

type block_action = unit

type count_action = unit

type response_action = {
  count: count_action option;
  block: block_action option
}

type update_application_layer_automatic_response_request = {
  action: response_action;
  resource_arn: string
}

type invalid_operation_exception = {
  message: string option
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_ar_n: string
}

type invalid_resource_exception = {
  message: string option
}

type unit_ = | REQUESTS
  | PACKETS
  | BYTES
  | BITS

type contributor = {
  value: int option;
  name: string option
}

type time_range = {
  to_exclusive: float option;
  from_inclusive: float option
}

type tag_resource_response = unit

type tag = {
  value: string option;
  key: string option
}

type tag_resource_request = {
  tags: tag list;
  resource_ar_n: string
}

type summarized_counter = {
  unit_: string option;
  n: int option;
  sum: float option;
  average: float option;
  max: float option;
  name: string option
}

type summarized_attack_vector = {
  vector_counters: summarized_counter list option;
  vector_type: string
}

type subscription_state = | INACTIVE
  | ACTIVE

type limit = {
  max: int option;
  type_: string option
}

type protection_limits = {
  protected_resource_type_limits: limit list
}

type protection_group_arbitrary_pattern_limits = {
  max_members: int
}

type protection_group_pattern_type_limits = {
  arbitrary_pattern_limits: protection_group_arbitrary_pattern_limits
}

type protection_group_limits = {
  pattern_type_limits: protection_group_pattern_type_limits;
  max_protection_groups: int
}

type subscription_limits = {
  protection_group_limits: protection_group_limits;
  protection_limits: protection_limits
}

type proactive_engagement_status = | PENDING
  | DISABLED
  | ENABLED

type subscription = {
  subscription_arn: string option;
  subscription_limits: subscription_limits;
  proactive_engagement_status: proactive_engagement_status option;
  limits: limit list option;
  auto_renew: auto_renew option;
  time_commitment_in_seconds: int option;
  end_time: float option;
  start_time: float option
}

type sub_resource_type = | URL
  | IP

type sub_resource_summary = {
  counters: summarized_counter list option;
  attack_vectors: summarized_attack_vector list option;
  id: string option;
  type_: sub_resource_type option
}

type resource_already_exists_exception = {
  resource_type: string option;
  message: string option
}

type application_layer_automatic_response_status = | DISABLED
  | ENABLED

type application_layer_automatic_response_configuration = {
  action: response_action;
  status: application_layer_automatic_response_status
}

type protection = {
  application_layer_automatic_response_configuration: application_layer_automatic_response_configuration option;
  protection_arn: string option;
  health_check_ids: string list option;
  resource_arn: string option;
  name: string option;
  id: string option
}

type protection_group = {
  protection_group_arn: string option;
  members: string list;
  resource_type: protected_resource_type option;
  pattern: protection_group_pattern;
  aggregation: protection_group_aggregation;
  protection_group_id: string
}

type no_associated_role_exception = {
  message: string option
}

type mitigation = {
  mitigation_name: string option
}

type list_tags_for_resource_response = {
  tags: tag list option
}

type list_tags_for_resource_request = {
  resource_ar_n: string
}

type list_resources_in_protection_group_response = {
  next_token: string option;
  resource_arns: string list
}

type list_resources_in_protection_group_request = {
  max_results: int option;
  next_token: string option;
  protection_group_id: string
}

type invalid_pagination_token_exception = {
  message: string option
}

type list_protections_response = {
  next_token: string option;
  protections: protection list option
}

type inclusion_protection_filters = {
  resource_types: protected_resource_type list option;
  protection_names: string list option;
  resource_arns: string list option
}

type list_protections_request = {
  inclusion_filters: inclusion_protection_filters option;
  max_results: int option;
  next_token: string option
}

type list_protection_groups_response = {
  next_token: string option;
  protection_groups: protection_group list
}

type inclusion_protection_group_filters = {
  aggregations: protection_group_aggregation list option;
  resource_types: protected_resource_type list option;
  patterns: protection_group_pattern list option;
  protection_group_ids: string list option
}

type list_protection_groups_request = {
  inclusion_filters: inclusion_protection_group_filters option;
  max_results: int option;
  next_token: string option
}

type attack_vector_description = {
  vector_type: string
}

type attack_summary = {
  attack_vectors: attack_vector_description list option;
  end_time: float option;
  start_time: float option;
  resource_arn: string option;
  attack_id: string option
}

type list_attacks_response = {
  next_token: string option;
  attack_summaries: attack_summary list option
}

type list_attacks_request = {
  max_results: int option;
  next_token: string option;
  end_time: time_range option;
  start_time: time_range option;
  resource_arns: string list option
}

type limits_exceeded_exception = {
  limit: int option;
  type_: string option;
  message: string option
}

type get_subscription_state_response = {
  subscription_state: subscription_state
}

type get_subscription_state_request = unit

type enable_proactive_engagement_response = unit

type enable_proactive_engagement_request = unit

type enable_application_layer_automatic_response_response = unit

type enable_application_layer_automatic_response_request = {
  action: response_action;
  resource_arn: string
}

type disassociate_health_check_response = unit

type disassociate_health_check_request = {
  health_check_arn: string;
  protection_id: string
}

type disassociate_drt_role_response = unit

type disassociate_drt_role_request = unit

type disassociate_drt_log_bucket_response = unit

type disassociate_drt_log_bucket_request = {
  log_bucket: string
}

type access_denied_for_dependency_exception = {
  message: string option
}

type disable_proactive_engagement_response = unit

type disable_proactive_engagement_request = unit

type disable_application_layer_automatic_response_response = unit

type disable_application_layer_automatic_response_request = {
  resource_arn: string
}

type describe_subscription_response = {
  subscription: subscription option
}

type describe_subscription_request = unit

type describe_protection_response = {
  protection: protection option
}

type describe_protection_request = {
  resource_arn: string option;
  protection_id: string option
}

type describe_protection_group_response = {
  protection_group: protection_group
}

type describe_protection_group_request = {
  protection_group_id: string
}

type describe_emergency_contact_settings_response = {
  emergency_contact_list: emergency_contact list option
}

type describe_emergency_contact_settings_request = unit

type describe_drt_access_response = {
  log_bucket_list: string list option;
  role_arn: string option
}

type describe_drt_access_request = unit

type attack_volume_statistics = {
  max: float
}

type attack_volume = {
  requests_per_second: attack_volume_statistics option;
  packets_per_second: attack_volume_statistics option;
  bits_per_second: attack_volume_statistics option
}

type attack_statistics_data_item = {
  attack_count: int;
  attack_volume: attack_volume option
}

type describe_attack_statistics_response = {
  data_items: attack_statistics_data_item list;
  time_range: time_range
}

type describe_attack_statistics_request = unit

type attack_layer = | APPLICATION
  | NETWORK

type attack_property_identifier = | WORDPRESS_PINGBACK_SOURCE
  | WORDPRESS_PINGBACK_REFLECTOR
  | SOURCE_USER_AGENT
  | SOURCE_IP_ADDRESS
  | SOURCE_COUNTRY
  | SOURCE_ASN
  | REFERRER
  | DESTINATION_URL

type attack_property = {
  total: int option;
  unit_: unit_ option;
  top_contributors: contributor list option;
  attack_property_identifier: attack_property_identifier option;
  attack_layer: attack_layer option
}

type attack_detail = {
  mitigations: mitigation list option;
  attack_properties: attack_property list option;
  attack_counters: summarized_counter list option;
  end_time: float option;
  start_time: float option;
  sub_resources: sub_resource_summary list option;
  resource_arn: string option;
  attack_id: string option
}

type describe_attack_response = {
  attack: attack_detail option
}

type describe_attack_request = {
  attack_id: string
}

type access_denied_exception = {
  message: string option
}

type delete_subscription_response = unit

type delete_subscription_request = unit

type delete_protection_response = unit

type delete_protection_request = {
  protection_id: string
}

type delete_protection_group_response = unit

type delete_protection_group_request = {
  protection_group_id: string
}

type create_subscription_response = unit

type create_subscription_request = unit

type create_protection_response = {
  protection_id: string option
}

type create_protection_request = {
  tags: tag list option;
  resource_arn: string;
  name: string
}

type create_protection_group_response = unit

type create_protection_group_request = {
  tags: tag list option;
  members: string list option;
  resource_type: protected_resource_type option;
  pattern: protection_group_pattern;
  aggregation: protection_group_aggregation;
  protection_group_id: string
}

type associate_proactive_engagement_details_response = unit

type associate_proactive_engagement_details_request = {
  emergency_contact_list: emergency_contact list
}

type associate_health_check_response = unit

type associate_health_check_request = {
  health_check_arn: string;
  protection_id: string
}

type associate_drt_role_response = unit

type associate_drt_role_request = {
  role_arn: string
}

type associate_drt_log_bucket_response = unit

type associate_drt_log_bucket_request = {
  log_bucket: string
}



type base_document = Json.t

val make_validation_exception_field :
  message:string -> name:string -> unit
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

module UpdateSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      update_subscription_request ->
        (update_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LockedSubscriptionException of locked_subscription_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_protection_group_request ->
        (update_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateEmergencyContactSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_emergency_contact_settings_request ->
        (update_emergency_contact_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateApplicationLayerAutomaticResponse : sig
  val request :
    Smaws_Lib.Context.t ->
      update_application_layer_automatic_response_request ->
        (update_application_layer_automatic_response_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListResourcesInProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_in_protection_group_request ->
        (list_resources_in_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidPaginationTokenException of invalid_pagination_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListProtections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_protections_request ->
        (list_protections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidPaginationTokenException of invalid_pagination_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListProtectionGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_protection_groups_request ->
        (list_protection_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidPaginationTokenException of invalid_pagination_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListAttacks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_attacks_request ->
        (list_attacks_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            
        ]
      ) result
end

module GetSubscriptionState : sig
  val request :
    Smaws_Lib.Context.t ->
      get_subscription_state_request ->
        (get_subscription_state_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            
        ]
      ) result
end

module EnableProactiveEngagement : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_proactive_engagement_request ->
        (enable_proactive_engagement_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module EnableApplicationLayerAutomaticResponse : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_application_layer_automatic_response_request ->
        (enable_application_layer_automatic_response_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateHealthCheck : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_health_check_request ->
        (disassociate_health_check_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateDRTRole : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_drt_role_request ->
        (disassociate_drt_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateDRTLogBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_drt_log_bucket_request ->
        (disassociate_drt_log_bucket_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `NoAssociatedRoleException of no_associated_role_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisableProactiveEngagement : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_proactive_engagement_request ->
        (disable_proactive_engagement_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisableApplicationLayerAutomaticResponse : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_application_layer_automatic_response_request ->
        (disable_application_layer_automatic_response_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_subscription_request ->
        (describe_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_protection_group_request ->
        (describe_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeProtection : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_protection_request ->
        (describe_protection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeEmergencyContactSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_emergency_contact_settings_request ->
        (describe_emergency_contact_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeDRTAccess : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_drt_access_request ->
        (describe_drt_access_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeAttackStatistics : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_attack_statistics_request ->
        (describe_attack_statistics_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            
        ]
      ) result
end

module DescribeAttack : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_attack_request ->
        (describe_attack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalErrorException of internal_error_exception
            
        ]
      ) result
end

module DeleteSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_subscription_request ->
        (delete_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `LockedSubscriptionException of locked_subscription_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protection_group_request ->
        (delete_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteProtection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protection_request ->
        (delete_protection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      create_subscription_request ->
        (create_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
end

module CreateProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_protection_group_request ->
        (create_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateProtection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_protection_request ->
        (create_protection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateProactiveEngagementDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_proactive_engagement_details_request ->
        (associate_proactive_engagement_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateHealthCheck : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_health_check_request ->
        (associate_health_check_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateDRTRole : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_drt_role_request ->
        (associate_drt_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateDRTLogBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_drt_log_bucket_request ->
        (associate_drt_log_bucket_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `NoAssociatedRoleException of no_associated_role_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

