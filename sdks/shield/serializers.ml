open Smaws_Lib.Json.SerializeHelpers

open Types

let error_message_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let validation_exception_reason_to_yojson = 
  fun (x: validation_exception_reason) -> match x with 
 
| OTHER -> `String "OTHER"
  | FIELD_VALIDATION_FAILED -> `String "FIELD_VALIDATION_FAILED"
   

let string__to_yojson = string_to_yojson

let validation_exception_field_to_yojson = 
  fun (x: validation_exception_field) -> assoc_to_yojson(
    [(
         "message",
         (Some (string__to_yojson x.message)));
       (
         "name",
         (Some (string__to_yojson x.name)));
       
  ])

let validation_exception_field_list_to_yojson = 
  fun tree -> list_to_yojson validation_exception_field_to_yojson tree

let update_subscription_response_to_yojson = 
  fun (x: update_subscription_response) -> assoc_to_yojson(
    [
  ])

let auto_renew_to_yojson = 
  fun (x: auto_renew) -> match x with 
  | DISABLED -> `String "DISABLED"
    | ENABLED -> `String "ENABLED"
     

let update_subscription_request_to_yojson = 
  fun (x: update_subscription_request) -> assoc_to_yojson(
    [(
         "AutoRenew",
         (option_to_yojson auto_renew_to_yojson x.auto_renew));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "resourceType",
         (option_to_yojson string__to_yojson x.resource_type));
       (
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let optimistic_lock_exception_to_yojson = 
  fun (x: optimistic_lock_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let locked_subscription_exception_to_yojson = 
  fun (x: locked_subscription_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_parameter_exception_to_yojson = 
  fun (x: invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "fields",
         (option_to_yojson validation_exception_field_list_to_yojson x.fields));
       (
         "reason",
         (option_to_yojson validation_exception_reason_to_yojson x.reason));
       (
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let internal_error_exception_to_yojson = 
  fun (x: internal_error_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let update_protection_group_response_to_yojson = 
  fun (x: update_protection_group_response) -> assoc_to_yojson(
    [
  ])

let protection_group_id_to_yojson = string_to_yojson

let protection_group_aggregation_to_yojson = 
  fun (x: protection_group_aggregation) -> match x with 
  | MAX -> `String "MAX"
    | MEAN -> `String "MEAN"
    | SUM -> `String "SUM"
     

let protection_group_pattern_to_yojson = 
  fun (x: protection_group_pattern) -> match x with 
 
| BY_RESOURCE_TYPE -> `String "BY_RESOURCE_TYPE"
  | ARBITRARY -> `String "ARBITRARY"
  | ALL -> `String "ALL"
   

let protected_resource_type_to_yojson = 
  fun (x: protected_resource_type) -> match x with 
 
| GLOBAL_ACCELERATOR -> `String "GLOBAL_ACCELERATOR"
  | APPLICATION_LOAD_BALANCER -> `String "APPLICATION_LOAD_BALANCER"
  | CLASSIC_LOAD_BALANCER -> `String "CLASSIC_LOAD_BALANCER"
  | ELASTIC_IP_ALLOCATION -> `String "ELASTIC_IP_ALLOCATION"
  | ROUTE_53_HOSTED_ZONE -> `String "ROUTE_53_HOSTED_ZONE"
  | CLOUDFRONT_DISTRIBUTION -> `String "CLOUDFRONT_DISTRIBUTION"
   

let resource_arn_to_yojson = string_to_yojson

let protection_group_members_to_yojson = 
  fun tree -> list_to_yojson resource_arn_to_yojson tree

let update_protection_group_request_to_yojson = 
  fun (x: update_protection_group_request) -> assoc_to_yojson(
    [(
         "Members",
         (option_to_yojson protection_group_members_to_yojson x.members));
       (
         "ResourceType",
         (option_to_yojson protected_resource_type_to_yojson x.resource_type));
       (
         "Pattern",
         (Some (protection_group_pattern_to_yojson x.pattern)));
       (
         "Aggregation",
         (Some (protection_group_aggregation_to_yojson x.aggregation)));
       (
         "ProtectionGroupId",
         (Some (protection_group_id_to_yojson x.protection_group_id)));
       
  ])

let update_emergency_contact_settings_response_to_yojson = 
  fun (x: update_emergency_contact_settings_response) -> assoc_to_yojson(
    [
  ])

let email_address_to_yojson = string_to_yojson

let phone_number_to_yojson = string_to_yojson

let contact_notes_to_yojson = string_to_yojson

let emergency_contact_to_yojson = 
  fun (x: emergency_contact) -> assoc_to_yojson(
    [(
         "ContactNotes",
         (option_to_yojson contact_notes_to_yojson x.contact_notes));
       (
         "PhoneNumber",
         (option_to_yojson phone_number_to_yojson x.phone_number));
       (
         "EmailAddress",
         (Some (email_address_to_yojson x.email_address)));
       
  ])

let emergency_contact_list_to_yojson = 
  fun tree -> list_to_yojson emergency_contact_to_yojson tree

let update_emergency_contact_settings_request_to_yojson = 
  fun (x: update_emergency_contact_settings_request) -> assoc_to_yojson(
    [(
         "EmergencyContactList",
         (option_to_yojson emergency_contact_list_to_yojson x.emergency_contact_list));
       
  ])

let update_application_layer_automatic_response_response_to_yojson = 
  fun (x: update_application_layer_automatic_response_response) -> assoc_to_yojson(
    [
  ])

let block_action_to_yojson = fun (x: block_action) -> assoc_to_yojson(
                               [
                             ])

let count_action_to_yojson = fun (x: count_action) -> assoc_to_yojson(
                               [
                             ])

let response_action_to_yojson = 
  fun (x: response_action) -> assoc_to_yojson(
    [(
         "Count",
         (option_to_yojson count_action_to_yojson x.count));
       (
         "Block",
         (option_to_yojson block_action_to_yojson x.block));
       
  ])

let update_application_layer_automatic_response_request_to_yojson = 
  fun (x: update_application_layer_automatic_response_request) -> assoc_to_yojson(
    [(
         "Action",
         (Some (response_action_to_yojson x.action)));
       (
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let invalid_operation_exception_to_yojson = 
  fun (x: invalid_operation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceARN",
         (Some (resource_arn_to_yojson x.resource_ar_n)));
       
  ])

let invalid_resource_exception_to_yojson = 
  fun (x: invalid_resource_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let unit__to_yojson = 
  fun (x: unit_) -> match x with 
 
| REQUESTS -> `String "REQUESTS"
  | PACKETS -> `String "PACKETS"
  | BYTES -> `String "BYTES"
  | BITS -> `String "BITS"
   

let long_to_yojson = long_to_yojson

let contributor_to_yojson = 
  fun (x: contributor) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson long_to_yojson x.value));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let top_contributors_to_yojson = 
  fun tree -> list_to_yojson contributor_to_yojson tree

let token_to_yojson = string_to_yojson

let timestamp__to_yojson = timestamp_to_yojson

let time_range_to_yojson = 
  fun (x: time_range) -> assoc_to_yojson(
    [(
         "ToExclusive",
         (option_to_yojson timestamp__to_yojson x.to_exclusive));
       (
         "FromInclusive",
         (option_to_yojson timestamp__to_yojson x.from_inclusive));
       
  ])

let tag_value_to_yojson = string_to_yojson

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson tag_value_to_yojson x.value));
       (
         "Key",
         (option_to_yojson tag_key_to_yojson x.key));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceARN",
         (Some (resource_arn_to_yojson x.resource_ar_n)));
       
  ])

let double_to_yojson = double_to_yojson

let integer__to_yojson = int_to_yojson

let summarized_counter_to_yojson = 
  fun (x: summarized_counter) -> assoc_to_yojson(
    [(
         "Unit",
         (option_to_yojson string__to_yojson x.unit_));
       (
         "N",
         (option_to_yojson integer__to_yojson x.n));
       (
         "Sum",
         (option_to_yojson double_to_yojson x.sum));
       (
         "Average",
         (option_to_yojson double_to_yojson x.average));
       (
         "Max",
         (option_to_yojson double_to_yojson x.max));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let summarized_counter_list_to_yojson = 
  fun tree -> list_to_yojson summarized_counter_to_yojson tree

let summarized_attack_vector_to_yojson = 
  fun (x: summarized_attack_vector) -> assoc_to_yojson(
    [(
         "VectorCounters",
         (option_to_yojson summarized_counter_list_to_yojson x.vector_counters));
       (
         "VectorType",
         (Some (string__to_yojson x.vector_type)));
       
  ])

let summarized_attack_vector_list_to_yojson = 
  fun tree -> list_to_yojson summarized_attack_vector_to_yojson tree

let subscription_state_to_yojson = 
  fun (x: subscription_state) -> match x with 
  | INACTIVE -> `String "INACTIVE"
    | ACTIVE -> `String "ACTIVE"
     

let limit_to_yojson = 
  fun (x: limit) -> assoc_to_yojson(
    [(
         "Max",
         (option_to_yojson long_to_yojson x.max));
       (
         "Type",
         (option_to_yojson string__to_yojson x.type_));
       
  ])

let limits_to_yojson = fun tree -> list_to_yojson limit_to_yojson tree

let protection_limits_to_yojson = 
  fun (x: protection_limits) -> assoc_to_yojson(
    [(
         "ProtectedResourceTypeLimits",
         (Some (limits_to_yojson x.protected_resource_type_limits)));
       
  ])

let protection_group_arbitrary_pattern_limits_to_yojson = 
  fun (x: protection_group_arbitrary_pattern_limits) -> assoc_to_yojson(
    [(
         "MaxMembers",
         (Some (long_to_yojson x.max_members)));
       
  ])

let protection_group_pattern_type_limits_to_yojson = 
  fun (x: protection_group_pattern_type_limits) -> assoc_to_yojson(
    [(
         "ArbitraryPatternLimits",
         (Some (protection_group_arbitrary_pattern_limits_to_yojson x.arbitrary_pattern_limits)));
       
  ])

let protection_group_limits_to_yojson = 
  fun (x: protection_group_limits) -> assoc_to_yojson(
    [(
         "PatternTypeLimits",
         (Some (protection_group_pattern_type_limits_to_yojson x.pattern_type_limits)));
       (
         "MaxProtectionGroups",
         (Some (long_to_yojson x.max_protection_groups)));
       
  ])

let subscription_limits_to_yojson = 
  fun (x: subscription_limits) -> assoc_to_yojson(
    [(
         "ProtectionGroupLimits",
         (Some (protection_group_limits_to_yojson x.protection_group_limits)));
       (
         "ProtectionLimits",
         (Some (protection_limits_to_yojson x.protection_limits)));
       
  ])

let duration_in_seconds_to_yojson = long_to_yojson

let proactive_engagement_status_to_yojson = 
  fun (x: proactive_engagement_status) -> match x with 
 
| PENDING -> `String "PENDING"
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
   

let subscription_to_yojson = 
  fun (x: subscription) -> assoc_to_yojson(
    [(
         "SubscriptionArn",
         (option_to_yojson resource_arn_to_yojson x.subscription_arn));
       (
         "SubscriptionLimits",
         (Some (subscription_limits_to_yojson x.subscription_limits)));
       (
         "ProactiveEngagementStatus",
         (option_to_yojson proactive_engagement_status_to_yojson x.proactive_engagement_status));
       (
         "Limits",
         (option_to_yojson limits_to_yojson x.limits));
       (
         "AutoRenew",
         (option_to_yojson auto_renew_to_yojson x.auto_renew));
       (
         "TimeCommitmentInSeconds",
         (option_to_yojson duration_in_seconds_to_yojson x.time_commitment_in_seconds));
       (
         "EndTime",
         (option_to_yojson timestamp__to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson timestamp__to_yojson x.start_time));
       
  ])

let sub_resource_type_to_yojson = 
  fun (x: sub_resource_type) -> match x with 
  | URL -> `String "URL"
    | IP -> `String "IP"
     

let sub_resource_summary_to_yojson = 
  fun (x: sub_resource_summary) -> assoc_to_yojson(
    [(
         "Counters",
         (option_to_yojson summarized_counter_list_to_yojson x.counters));
       (
         "AttackVectors",
         (option_to_yojson summarized_attack_vector_list_to_yojson x.attack_vectors));
       (
         "Id",
         (option_to_yojson string__to_yojson x.id));
       (
         "Type",
         (option_to_yojson sub_resource_type_to_yojson x.type_));
       
  ])

let sub_resource_summary_list_to_yojson = 
  fun tree -> list_to_yojson sub_resource_summary_to_yojson tree

let role_arn_to_yojson = string_to_yojson

let resource_arn_list_to_yojson = 
  fun tree -> list_to_yojson resource_arn_to_yojson tree

let resource_arn_filters_to_yojson = 
  fun tree -> list_to_yojson resource_arn_to_yojson tree

let resource_arn_filter_list_to_yojson = 
  fun tree -> list_to_yojson resource_arn_to_yojson tree

let resource_already_exists_exception_to_yojson = 
  fun (x: resource_already_exists_exception) -> assoc_to_yojson(
    [(
         "resourceType",
         (option_to_yojson string__to_yojson x.resource_type));
       (
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let protection_id_to_yojson = string_to_yojson

let protection_name_to_yojson = string_to_yojson

let health_check_id_to_yojson = string_to_yojson

let health_check_ids_to_yojson = 
  fun tree -> list_to_yojson health_check_id_to_yojson tree

let application_layer_automatic_response_status_to_yojson = 
  fun (x: application_layer_automatic_response_status) -> match x with 
  | DISABLED -> `String "DISABLED"
    | ENABLED -> `String "ENABLED"
     

let application_layer_automatic_response_configuration_to_yojson = 
  fun (x: application_layer_automatic_response_configuration) -> assoc_to_yojson(
    [(
         "Action",
         (Some (response_action_to_yojson x.action)));
       (
         "Status",
         (Some (application_layer_automatic_response_status_to_yojson x.status)));
       
  ])

let protection_to_yojson = 
  fun (x: protection) -> assoc_to_yojson(
    [(
         "ApplicationLayerAutomaticResponseConfiguration",
         (option_to_yojson application_layer_automatic_response_configuration_to_yojson x.application_layer_automatic_response_configuration));
       (
         "ProtectionArn",
         (option_to_yojson resource_arn_to_yojson x.protection_arn));
       (
         "HealthCheckIds",
         (option_to_yojson health_check_ids_to_yojson x.health_check_ids));
       (
         "ResourceArn",
         (option_to_yojson resource_arn_to_yojson x.resource_arn));
       (
         "Name",
         (option_to_yojson protection_name_to_yojson x.name));
       (
         "Id",
         (option_to_yojson protection_id_to_yojson x.id));
       
  ])

let protections_to_yojson = 
  fun tree -> list_to_yojson protection_to_yojson tree

let protection_name_filters_to_yojson = 
  fun tree -> list_to_yojson protection_name_to_yojson tree

let protection_group_to_yojson = 
  fun (x: protection_group) -> assoc_to_yojson(
    [(
         "ProtectionGroupArn",
         (option_to_yojson resource_arn_to_yojson x.protection_group_arn));
       (
         "Members",
         (Some (protection_group_members_to_yojson x.members)));
       (
         "ResourceType",
         (option_to_yojson protected_resource_type_to_yojson x.resource_type));
       (
         "Pattern",
         (Some (protection_group_pattern_to_yojson x.pattern)));
       (
         "Aggregation",
         (Some (protection_group_aggregation_to_yojson x.aggregation)));
       (
         "ProtectionGroupId",
         (Some (protection_group_id_to_yojson x.protection_group_id)));
       
  ])

let protection_groups_to_yojson = 
  fun tree -> list_to_yojson protection_group_to_yojson tree

let protection_group_pattern_filters_to_yojson = 
  fun tree -> list_to_yojson protection_group_pattern_to_yojson tree

let protection_group_id_filters_to_yojson = 
  fun tree -> list_to_yojson protection_group_id_to_yojson tree

let protection_group_aggregation_filters_to_yojson = 
  fun tree -> list_to_yojson protection_group_aggregation_to_yojson tree

let protected_resource_type_filters_to_yojson = 
  fun tree -> list_to_yojson protected_resource_type_to_yojson tree

let no_associated_role_exception_to_yojson = 
  fun (x: no_associated_role_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let mitigation_to_yojson = 
  fun (x: mitigation) -> assoc_to_yojson(
    [(
         "MitigationName",
         (option_to_yojson string__to_yojson x.mitigation_name));
       
  ])

let mitigation_list_to_yojson = 
  fun tree -> list_to_yojson mitigation_to_yojson tree

let max_results_to_yojson = int_to_yojson

let log_bucket_to_yojson = string_to_yojson

let log_bucket_list_to_yojson = 
  fun tree -> list_to_yojson log_bucket_to_yojson tree

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (resource_arn_to_yojson x.resource_ar_n)));
       
  ])

let list_resources_in_protection_group_response_to_yojson = 
  fun (x: list_resources_in_protection_group_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "ResourceArns",
         (Some (resource_arn_list_to_yojson x.resource_arns)));
       
  ])

let list_resources_in_protection_group_request_to_yojson = 
  fun (x: list_resources_in_protection_group_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "ProtectionGroupId",
         (Some (protection_group_id_to_yojson x.protection_group_id)));
       
  ])

let invalid_pagination_token_exception_to_yojson = 
  fun (x: invalid_pagination_token_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let list_protections_response_to_yojson = 
  fun (x: list_protections_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "Protections",
         (option_to_yojson protections_to_yojson x.protections));
       
  ])

let inclusion_protection_filters_to_yojson = 
  fun (x: inclusion_protection_filters) -> assoc_to_yojson(
    [(
         "ResourceTypes",
         (option_to_yojson protected_resource_type_filters_to_yojson x.resource_types));
       (
         "ProtectionNames",
         (option_to_yojson protection_name_filters_to_yojson x.protection_names));
       (
         "ResourceArns",
         (option_to_yojson resource_arn_filters_to_yojson x.resource_arns));
       
  ])

let list_protections_request_to_yojson = 
  fun (x: list_protections_request) -> assoc_to_yojson(
    [(
         "InclusionFilters",
         (option_to_yojson inclusion_protection_filters_to_yojson x.inclusion_filters));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       
  ])

let list_protection_groups_response_to_yojson = 
  fun (x: list_protection_groups_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "ProtectionGroups",
         (Some (protection_groups_to_yojson x.protection_groups)));
       
  ])

let inclusion_protection_group_filters_to_yojson = 
  fun (x: inclusion_protection_group_filters) -> assoc_to_yojson(
    [(
         "Aggregations",
         (option_to_yojson protection_group_aggregation_filters_to_yojson x.aggregations));
       (
         "ResourceTypes",
         (option_to_yojson protected_resource_type_filters_to_yojson x.resource_types));
       (
         "Patterns",
         (option_to_yojson protection_group_pattern_filters_to_yojson x.patterns));
       (
         "ProtectionGroupIds",
         (option_to_yojson protection_group_id_filters_to_yojson x.protection_group_ids));
       
  ])

let list_protection_groups_request_to_yojson = 
  fun (x: list_protection_groups_request) -> assoc_to_yojson(
    [(
         "InclusionFilters",
         (option_to_yojson inclusion_protection_group_filters_to_yojson x.inclusion_filters));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       
  ])

let attack_timestamp_to_yojson = timestamp_to_yojson

let attack_vector_description_to_yojson = 
  fun (x: attack_vector_description) -> assoc_to_yojson(
    [(
         "VectorType",
         (Some (string__to_yojson x.vector_type)));
       
  ])

let attack_vector_description_list_to_yojson = 
  fun tree -> list_to_yojson attack_vector_description_to_yojson tree

let attack_summary_to_yojson = 
  fun (x: attack_summary) -> assoc_to_yojson(
    [(
         "AttackVectors",
         (option_to_yojson attack_vector_description_list_to_yojson x.attack_vectors));
       (
         "EndTime",
         (option_to_yojson attack_timestamp_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson attack_timestamp_to_yojson x.start_time));
       (
         "ResourceArn",
         (option_to_yojson string__to_yojson x.resource_arn));
       (
         "AttackId",
         (option_to_yojson string__to_yojson x.attack_id));
       
  ])

let attack_summaries_to_yojson = 
  fun tree -> list_to_yojson attack_summary_to_yojson tree

let list_attacks_response_to_yojson = 
  fun (x: list_attacks_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "AttackSummaries",
         (option_to_yojson attack_summaries_to_yojson x.attack_summaries));
       
  ])

let list_attacks_request_to_yojson = 
  fun (x: list_attacks_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "EndTime",
         (option_to_yojson time_range_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson time_range_to_yojson x.start_time));
       (
         "ResourceArns",
         (option_to_yojson resource_arn_filter_list_to_yojson x.resource_arns));
       
  ])

let limit_type_to_yojson = string_to_yojson

let limit_number_to_yojson = long_to_yojson

let limits_exceeded_exception_to_yojson = 
  fun (x: limits_exceeded_exception) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_number_to_yojson x.limit));
       (
         "Type",
         (option_to_yojson limit_type_to_yojson x.type_));
       (
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let health_check_arn_to_yojson = string_to_yojson

let get_subscription_state_response_to_yojson = 
  fun (x: get_subscription_state_response) -> assoc_to_yojson(
    [(
         "SubscriptionState",
         (Some (subscription_state_to_yojson x.subscription_state)));
       
  ])

let get_subscription_state_request_to_yojson = 
  fun (x: get_subscription_state_request) -> assoc_to_yojson(
    [
  ])

let enable_proactive_engagement_response_to_yojson = 
  fun (x: enable_proactive_engagement_response) -> assoc_to_yojson(
    [
  ])

let enable_proactive_engagement_request_to_yojson = 
  fun (x: enable_proactive_engagement_request) -> assoc_to_yojson(
    [
  ])

let enable_application_layer_automatic_response_response_to_yojson = 
  fun (x: enable_application_layer_automatic_response_response) -> assoc_to_yojson(
    [
  ])

let enable_application_layer_automatic_response_request_to_yojson = 
  fun (x: enable_application_layer_automatic_response_request) -> assoc_to_yojson(
    [(
         "Action",
         (Some (response_action_to_yojson x.action)));
       (
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let disassociate_health_check_response_to_yojson = 
  fun (x: disassociate_health_check_response) -> assoc_to_yojson(
    [
  ])

let disassociate_health_check_request_to_yojson = 
  fun (x: disassociate_health_check_request) -> assoc_to_yojson(
    [(
         "HealthCheckArn",
         (Some (health_check_arn_to_yojson x.health_check_arn)));
       (
         "ProtectionId",
         (Some (protection_id_to_yojson x.protection_id)));
       
  ])

let disassociate_drt_role_response_to_yojson = 
  fun (x: disassociate_drt_role_response) -> assoc_to_yojson(
    [
  ])

let disassociate_drt_role_request_to_yojson = 
  fun (x: disassociate_drt_role_request) -> assoc_to_yojson(
    [
  ])

let disassociate_drt_log_bucket_response_to_yojson = 
  fun (x: disassociate_drt_log_bucket_response) -> assoc_to_yojson(
    [
  ])

let disassociate_drt_log_bucket_request_to_yojson = 
  fun (x: disassociate_drt_log_bucket_request) -> assoc_to_yojson(
    [(
         "LogBucket",
         (Some (log_bucket_to_yojson x.log_bucket)));
       
  ])

let access_denied_for_dependency_exception_to_yojson = 
  fun (x: access_denied_for_dependency_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let disable_proactive_engagement_response_to_yojson = 
  fun (x: disable_proactive_engagement_response) -> assoc_to_yojson(
    [
  ])

let disable_proactive_engagement_request_to_yojson = 
  fun (x: disable_proactive_engagement_request) -> assoc_to_yojson(
    [
  ])

let disable_application_layer_automatic_response_response_to_yojson = 
  fun (x: disable_application_layer_automatic_response_response) -> assoc_to_yojson(
    [
  ])

let disable_application_layer_automatic_response_request_to_yojson = 
  fun (x: disable_application_layer_automatic_response_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let describe_subscription_response_to_yojson = 
  fun (x: describe_subscription_response) -> assoc_to_yojson(
    [(
         "Subscription",
         (option_to_yojson subscription_to_yojson x.subscription));
       
  ])

let describe_subscription_request_to_yojson = 
  fun (x: describe_subscription_request) -> assoc_to_yojson(
    [
  ])

let describe_protection_response_to_yojson = 
  fun (x: describe_protection_response) -> assoc_to_yojson(
    [(
         "Protection",
         (option_to_yojson protection_to_yojson x.protection));
       
  ])

let describe_protection_request_to_yojson = 
  fun (x: describe_protection_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (option_to_yojson resource_arn_to_yojson x.resource_arn));
       (
         "ProtectionId",
         (option_to_yojson protection_id_to_yojson x.protection_id));
       
  ])

let describe_protection_group_response_to_yojson = 
  fun (x: describe_protection_group_response) -> assoc_to_yojson(
    [(
         "ProtectionGroup",
         (Some (protection_group_to_yojson x.protection_group)));
       
  ])

let describe_protection_group_request_to_yojson = 
  fun (x: describe_protection_group_request) -> assoc_to_yojson(
    [(
         "ProtectionGroupId",
         (Some (protection_group_id_to_yojson x.protection_group_id)));
       
  ])

let describe_emergency_contact_settings_response_to_yojson = 
  fun (x: describe_emergency_contact_settings_response) -> assoc_to_yojson(
    [(
         "EmergencyContactList",
         (option_to_yojson emergency_contact_list_to_yojson x.emergency_contact_list));
       
  ])

let describe_emergency_contact_settings_request_to_yojson = 
  fun (x: describe_emergency_contact_settings_request) -> assoc_to_yojson(
    [
  ])

let describe_drt_access_response_to_yojson = 
  fun (x: describe_drt_access_response) -> assoc_to_yojson(
    [(
         "LogBucketList",
         (option_to_yojson log_bucket_list_to_yojson x.log_bucket_list));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       
  ])

let describe_drt_access_request_to_yojson = 
  fun (x: describe_drt_access_request) -> assoc_to_yojson(
    [
  ])

let attack_volume_statistics_to_yojson = 
  fun (x: attack_volume_statistics) -> assoc_to_yojson(
    [(
         "Max",
         (Some (double_to_yojson x.max)));
       
  ])

let attack_volume_to_yojson = 
  fun (x: attack_volume) -> assoc_to_yojson(
    [(
         "RequestsPerSecond",
         (option_to_yojson attack_volume_statistics_to_yojson x.requests_per_second));
       (
         "PacketsPerSecond",
         (option_to_yojson attack_volume_statistics_to_yojson x.packets_per_second));
       (
         "BitsPerSecond",
         (option_to_yojson attack_volume_statistics_to_yojson x.bits_per_second));
       
  ])

let attack_statistics_data_item_to_yojson = 
  fun (x: attack_statistics_data_item) -> assoc_to_yojson(
    [(
         "AttackCount",
         (Some (long_to_yojson x.attack_count)));
       (
         "AttackVolume",
         (option_to_yojson attack_volume_to_yojson x.attack_volume));
       
  ])

let attack_statistics_data_list_to_yojson = 
  fun tree -> list_to_yojson attack_statistics_data_item_to_yojson tree

let describe_attack_statistics_response_to_yojson = 
  fun (x: describe_attack_statistics_response) -> assoc_to_yojson(
    [(
         "DataItems",
         (Some (attack_statistics_data_list_to_yojson x.data_items)));
       (
         "TimeRange",
         (Some (time_range_to_yojson x.time_range)));
       
  ])

let describe_attack_statistics_request_to_yojson = 
  fun (x: describe_attack_statistics_request) -> assoc_to_yojson(
    [
  ])

let attack_id_to_yojson = string_to_yojson

let attack_layer_to_yojson = 
  fun (x: attack_layer) -> match x with 
  | APPLICATION -> `String "APPLICATION"
    | NETWORK -> `String "NETWORK"
     

let attack_property_identifier_to_yojson = 
  fun (x: attack_property_identifier) -> match x with 
 
| WORDPRESS_PINGBACK_SOURCE -> `String "WORDPRESS_PINGBACK_SOURCE"
  | WORDPRESS_PINGBACK_REFLECTOR -> `String "WORDPRESS_PINGBACK_REFLECTOR"
  | SOURCE_USER_AGENT -> `String "SOURCE_USER_AGENT"
  | SOURCE_IP_ADDRESS -> `String "SOURCE_IP_ADDRESS"
  | SOURCE_COUNTRY -> `String "SOURCE_COUNTRY"
  | SOURCE_ASN -> `String "SOURCE_ASN"
  | REFERRER -> `String "REFERRER"
  | DESTINATION_URL -> `String "DESTINATION_URL"
   

let attack_property_to_yojson = 
  fun (x: attack_property) -> assoc_to_yojson(
    [(
         "Total",
         (option_to_yojson long_to_yojson x.total));
       (
         "Unit",
         (option_to_yojson unit__to_yojson x.unit_));
       (
         "TopContributors",
         (option_to_yojson top_contributors_to_yojson x.top_contributors));
       (
         "AttackPropertyIdentifier",
         (option_to_yojson attack_property_identifier_to_yojson x.attack_property_identifier));
       (
         "AttackLayer",
         (option_to_yojson attack_layer_to_yojson x.attack_layer));
       
  ])

let attack_properties_to_yojson = 
  fun tree -> list_to_yojson attack_property_to_yojson tree

let attack_detail_to_yojson = 
  fun (x: attack_detail) -> assoc_to_yojson(
    [(
         "Mitigations",
         (option_to_yojson mitigation_list_to_yojson x.mitigations));
       (
         "AttackProperties",
         (option_to_yojson attack_properties_to_yojson x.attack_properties));
       (
         "AttackCounters",
         (option_to_yojson summarized_counter_list_to_yojson x.attack_counters));
       (
         "EndTime",
         (option_to_yojson attack_timestamp_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson attack_timestamp_to_yojson x.start_time));
       (
         "SubResources",
         (option_to_yojson sub_resource_summary_list_to_yojson x.sub_resources));
       (
         "ResourceArn",
         (option_to_yojson resource_arn_to_yojson x.resource_arn));
       (
         "AttackId",
         (option_to_yojson attack_id_to_yojson x.attack_id));
       
  ])

let describe_attack_response_to_yojson = 
  fun (x: describe_attack_response) -> assoc_to_yojson(
    [(
         "Attack",
         (option_to_yojson attack_detail_to_yojson x.attack));
       
  ])

let describe_attack_request_to_yojson = 
  fun (x: describe_attack_request) -> assoc_to_yojson(
    [(
         "AttackId",
         (Some (attack_id_to_yojson x.attack_id)));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let delete_subscription_response_to_yojson = 
  fun (x: delete_subscription_response) -> assoc_to_yojson(
    [
  ])

let delete_subscription_request_to_yojson = 
  fun (x: delete_subscription_request) -> assoc_to_yojson(
    [
  ])

let delete_protection_response_to_yojson = 
  fun (x: delete_protection_response) -> assoc_to_yojson(
    [
  ])

let delete_protection_request_to_yojson = 
  fun (x: delete_protection_request) -> assoc_to_yojson(
    [(
         "ProtectionId",
         (Some (protection_id_to_yojson x.protection_id)));
       
  ])

let delete_protection_group_response_to_yojson = 
  fun (x: delete_protection_group_response) -> assoc_to_yojson(
    [
  ])

let delete_protection_group_request_to_yojson = 
  fun (x: delete_protection_group_request) -> assoc_to_yojson(
    [(
         "ProtectionGroupId",
         (Some (protection_group_id_to_yojson x.protection_group_id)));
       
  ])

let create_subscription_response_to_yojson = 
  fun (x: create_subscription_response) -> assoc_to_yojson(
    [
  ])

let create_subscription_request_to_yojson = 
  fun (x: create_subscription_request) -> assoc_to_yojson(
    [
  ])

let create_protection_response_to_yojson = 
  fun (x: create_protection_response) -> assoc_to_yojson(
    [(
         "ProtectionId",
         (option_to_yojson protection_id_to_yojson x.protection_id));
       
  ])

let create_protection_request_to_yojson = 
  fun (x: create_protection_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       (
         "Name",
         (Some (protection_name_to_yojson x.name)));
       
  ])

let create_protection_group_response_to_yojson = 
  fun (x: create_protection_group_response) -> assoc_to_yojson(
    [
  ])

let create_protection_group_request_to_yojson = 
  fun (x: create_protection_group_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Members",
         (option_to_yojson protection_group_members_to_yojson x.members));
       (
         "ResourceType",
         (option_to_yojson protected_resource_type_to_yojson x.resource_type));
       (
         "Pattern",
         (Some (protection_group_pattern_to_yojson x.pattern)));
       (
         "Aggregation",
         (Some (protection_group_aggregation_to_yojson x.aggregation)));
       (
         "ProtectionGroupId",
         (Some (protection_group_id_to_yojson x.protection_group_id)));
       
  ])

let associate_proactive_engagement_details_response_to_yojson = 
  fun (x: associate_proactive_engagement_details_response) -> assoc_to_yojson(
    [
  ])

let associate_proactive_engagement_details_request_to_yojson = 
  fun (x: associate_proactive_engagement_details_request) -> assoc_to_yojson(
    [(
         "EmergencyContactList",
         (Some (emergency_contact_list_to_yojson x.emergency_contact_list)));
       
  ])

let associate_health_check_response_to_yojson = 
  fun (x: associate_health_check_response) -> assoc_to_yojson(
    [
  ])

let associate_health_check_request_to_yojson = 
  fun (x: associate_health_check_request) -> assoc_to_yojson(
    [(
         "HealthCheckArn",
         (Some (health_check_arn_to_yojson x.health_check_arn)));
       (
         "ProtectionId",
         (Some (protection_id_to_yojson x.protection_id)));
       
  ])

let associate_drt_role_response_to_yojson = 
  fun (x: associate_drt_role_response) -> assoc_to_yojson(
    [
  ])

let associate_drt_role_request_to_yojson = 
  fun (x: associate_drt_role_request) -> assoc_to_yojson(
    [(
         "RoleArn",
         (Some (role_arn_to_yojson x.role_arn)));
       
  ])

let associate_drt_log_bucket_response_to_yojson = 
  fun (x: associate_drt_log_bucket_response) -> assoc_to_yojson(
    [
  ])

let associate_drt_log_bucket_request_to_yojson = 
  fun (x: associate_drt_log_bucket_request) -> assoc_to_yojson(
    [(
         "LogBucket",
         (Some (log_bucket_to_yojson x.log_bucket)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

