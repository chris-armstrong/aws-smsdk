open Smaws_Lib
let service =
  Service.{
    namespace = "shield";
    endpointPrefix = "shield";
    version = "2016-06-02";
    protocol = AwsJson_1_1
  };
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

