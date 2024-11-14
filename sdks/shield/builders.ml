[@@@warning "-39"]
open Types
let make_validation_exception_field  ~(message : string) ~(name : string) ()
: validation_exception_field = { message; name; 
}

let make_update_subscription_response  () : update_subscription_response =
()

let make_update_subscription_request  ?(auto_renew : auto_renew option) ()
: update_subscription_request = { auto_renew; 
}

let make_update_protection_group_response  ()
: update_protection_group_response =
()

let make_update_protection_group_request 
  ?(members : string list option)
  ?(resource_type : protected_resource_type option)
  ~(pattern : protection_group_pattern)
  ~(aggregation : protection_group_aggregation)
  ~(protection_group_id : string)
  () : update_protection_group_request = {
  members; resource_type; pattern; aggregation; protection_group_id; 
}

let make_update_emergency_contact_settings_response  ()
: update_emergency_contact_settings_response = ()

let make_emergency_contact 
  ?(contact_notes : string option)
  ?(phone_number : string option)
  ~(email_address : string)
  () : emergency_contact = { contact_notes; phone_number; email_address; 
}

let make_update_emergency_contact_settings_request 
  ?(emergency_contact_list : emergency_contact list option) ()
: update_emergency_contact_settings_request = { emergency_contact_list; 
}

let make_update_application_layer_automatic_response_response  ()
: update_application_layer_automatic_response_response =
()

let make_block_action  () : block_action = ()

let make_count_action  () : count_action = ()

let make_response_action 
  ?(count : count_action option) ?(block : block_action option) ()
: response_action = { count; block; 
}

let make_update_application_layer_automatic_response_request 
  ~(action : response_action) ~(resource_arn : string) ()
: update_application_layer_automatic_response_request = {
  action; resource_arn;  }

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_ar_n : string) ()
: untag_resource_request = { tag_keys; resource_ar_n;  }

let make_contributor  ?(value : int option) ?(name : string option) ()
: contributor = { value; name;  }

let make_time_range 
  ?(to_exclusive : float option) ?(from_inclusive : float option) ()
: time_range = { to_exclusive; from_inclusive; 
}

let make_tag_resource_response  () : tag_resource_response = ()

let make_tag  ?(value : string option) ?(key : string option) () : tag = {
  value; key;  }

let make_tag_resource_request 
  ~(tags : tag list) ~(resource_ar_n : string) () : tag_resource_request = {
  tags; resource_ar_n;  }

let make_summarized_counter 
  ?(unit_ : string option)
  ?(n : int option)
  ?(sum : float option)
  ?(average : float option)
  ?(max : float option)
  ?(name : string option)
  () : summarized_counter = { unit_; n; sum; average; max; name; 
}

let make_summarized_attack_vector 
  ?(vector_counters : summarized_counter list option)
  ~(vector_type : string)
  () : summarized_attack_vector = { vector_counters; vector_type; 
}

let make_limit  ?(max : int option) ?(type_ : string option) () : limit = {
  max; type_;  }

let make_protection_limits  ~(protected_resource_type_limits : limit list) ()
: protection_limits = { protected_resource_type_limits; 
}

let make_protection_group_arbitrary_pattern_limits  ~(max_members : int) ()
: protection_group_arbitrary_pattern_limits = { max_members; 
}

let make_protection_group_pattern_type_limits 
  ~(arbitrary_pattern_limits : protection_group_arbitrary_pattern_limits) ()
: protection_group_pattern_type_limits = { arbitrary_pattern_limits; 
}

let make_protection_group_limits 
  ~(pattern_type_limits : protection_group_pattern_type_limits)
  ~(max_protection_groups : int)
  () : protection_group_limits = {
  pattern_type_limits; max_protection_groups;  }

let make_subscription_limits 
  ~(protection_group_limits : protection_group_limits)
  ~(protection_limits : protection_limits)
  () : subscription_limits = { protection_group_limits; protection_limits; 
}

let make_subscription 
  ?(subscription_arn : string option)
  ?(proactive_engagement_status : proactive_engagement_status option)
  ?(limits : limit list option)
  ?(auto_renew : auto_renew option)
  ?(time_commitment_in_seconds : int option)
  ?(end_time : float option)
  ?(start_time : float option)
  ~(subscription_limits : subscription_limits)
  () : subscription = {
  subscription_arn;
  subscription_limits;
  proactive_engagement_status;
  limits;
  auto_renew;
  time_commitment_in_seconds;
  end_time;
  start_time;
   }

let make_sub_resource_summary 
  ?(counters : summarized_counter list option)
  ?(attack_vectors : summarized_attack_vector list option)
  ?(id : string option)
  ?(type_ : sub_resource_type option)
  () : sub_resource_summary = { counters; attack_vectors; id; type_; 
}

let make_application_layer_automatic_response_configuration 
  ~(action : response_action)
  ~(status : application_layer_automatic_response_status)
  () : application_layer_automatic_response_configuration = {
  action; status;  }

let make_protection 
  ?(application_layer_automatic_response_configuration : application_layer_automatic_response_configuration option)
  ?(protection_arn : string option)
  ?(health_check_ids : string list option)
  ?(resource_arn : string option)
  ?(name : string option)
  ?(id : string option)
  () : protection = {
  application_layer_automatic_response_configuration;
  protection_arn;
  health_check_ids;
  resource_arn;
  name;
  id;
   }

let make_protection_group 
  ?(protection_group_arn : string option)
  ?(resource_type : protected_resource_type option)
  ~(members : string list)
  ~(pattern : protection_group_pattern)
  ~(aggregation : protection_group_aggregation)
  ~(protection_group_id : string)
  () : protection_group = {
  protection_group_arn;
  members;
  resource_type;
  pattern;
  aggregation;
  protection_group_id;
   }

let make_mitigation  ?(mitigation_name : string option) () : mitigation = {
  mitigation_name;  }

let make_list_tags_for_resource_response  ?(tags : tag list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_request  ~(resource_ar_n : string) ()
: list_tags_for_resource_request = { resource_ar_n; 
}

let make_list_resources_in_protection_group_response 
  ?(next_token : string option) ~(resource_arns : string list) ()
: list_resources_in_protection_group_response = { next_token; resource_arns; 
}

let make_list_resources_in_protection_group_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(protection_group_id : string)
  () : list_resources_in_protection_group_request = {
  max_results; next_token; protection_group_id; 
}

let make_list_protections_response 
  ?(next_token : string option) ?(protections : protection list option) ()
: list_protections_response = { next_token; protections; 
}

let make_inclusion_protection_filters 
  ?(resource_types : protected_resource_type list option)
  ?(protection_names : string list option)
  ?(resource_arns : string list option)
  () : inclusion_protection_filters = {
  resource_types; protection_names; resource_arns; 
}

let make_list_protections_request 
  ?(inclusion_filters : inclusion_protection_filters option)
  ?(max_results : int option)
  ?(next_token : string option)
  () : list_protections_request = {
  inclusion_filters; max_results; next_token; 
}

let make_list_protection_groups_response 
  ?(next_token : string option)
  ~(protection_groups : protection_group list)
  () : list_protection_groups_response = { next_token; protection_groups; 
}

let make_inclusion_protection_group_filters 
  ?(aggregations : protection_group_aggregation list option)
  ?(resource_types : protected_resource_type list option)
  ?(patterns : protection_group_pattern list option)
  ?(protection_group_ids : string list option)
  () : inclusion_protection_group_filters = {
  aggregations; resource_types; patterns; protection_group_ids; 
}

let make_list_protection_groups_request 
  ?(inclusion_filters : inclusion_protection_group_filters option)
  ?(max_results : int option)
  ?(next_token : string option)
  () : list_protection_groups_request = {
  inclusion_filters; max_results; next_token; 
}

let make_attack_vector_description  ~(vector_type : string) ()
: attack_vector_description = { vector_type;  }

let make_attack_summary 
  ?(attack_vectors : attack_vector_description list option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(resource_arn : string option)
  ?(attack_id : string option)
  () : attack_summary = {
  attack_vectors; end_time; start_time; resource_arn; attack_id; 
}

let make_list_attacks_response 
  ?(next_token : string option)
  ?(attack_summaries : attack_summary list option)
  () : list_attacks_response = { next_token; attack_summaries; 
}

let make_list_attacks_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(end_time : time_range option)
  ?(start_time : time_range option)
  ?(resource_arns : string list option)
  () : list_attacks_request = {
  max_results; next_token; end_time; start_time; resource_arns; 
}

let make_get_subscription_state_response 
  ~(subscription_state : subscription_state) ()
: get_subscription_state_response = { subscription_state; 
}

let make_get_subscription_state_request  () : get_subscription_state_request
= ()

let make_enable_proactive_engagement_response  ()
: enable_proactive_engagement_response =
()

let make_enable_proactive_engagement_request  ()
: enable_proactive_engagement_request =
()

let make_enable_application_layer_automatic_response_response  ()
: enable_application_layer_automatic_response_response =
()

let make_enable_application_layer_automatic_response_request 
  ~(action : response_action) ~(resource_arn : string) ()
: enable_application_layer_automatic_response_request = {
  action; resource_arn;  }

let make_disassociate_health_check_response  ()
: disassociate_health_check_response =
()

let make_disassociate_health_check_request 
  ~(health_check_arn : string) ~(protection_id : string) ()
: disassociate_health_check_request = { health_check_arn; protection_id; 
}

let make_disassociate_drt_role_response  () : disassociate_drt_role_response
= ()

let make_disassociate_drt_role_request  () : disassociate_drt_role_request =
()

let make_disassociate_drt_log_bucket_response  ()
: disassociate_drt_log_bucket_response =
()

let make_disassociate_drt_log_bucket_request  ~(log_bucket : string) ()
: disassociate_drt_log_bucket_request = { log_bucket; 
}

let make_disable_proactive_engagement_response  ()
: disable_proactive_engagement_response =
()

let make_disable_proactive_engagement_request  ()
: disable_proactive_engagement_request =
()

let make_disable_application_layer_automatic_response_response  ()
: disable_application_layer_automatic_response_response =
()

let make_disable_application_layer_automatic_response_request 
  ~(resource_arn : string) ()
: disable_application_layer_automatic_response_request = { resource_arn; 
}

let make_describe_subscription_response 
  ?(subscription : subscription option) () : describe_subscription_response =
{ subscription;  }

let make_describe_subscription_request  () : describe_subscription_request =
()

let make_describe_protection_response  ?(protection : protection option) ()
: describe_protection_response = { protection; 
}

let make_describe_protection_request 
  ?(resource_arn : string option) ?(protection_id : string option) ()
: describe_protection_request = { resource_arn; protection_id; 
}

let make_describe_protection_group_response 
  ~(protection_group : protection_group) ()
: describe_protection_group_response = { protection_group; 
}

let make_describe_protection_group_request 
  ~(protection_group_id : string) () : describe_protection_group_request = {
  protection_group_id; 
}

let make_describe_emergency_contact_settings_response 
  ?(emergency_contact_list : emergency_contact list option) ()
: describe_emergency_contact_settings_response = { emergency_contact_list; 
}

let make_describe_emergency_contact_settings_request  ()
: describe_emergency_contact_settings_request =
()

let make_describe_drt_access_response 
  ?(log_bucket_list : string list option) ?(role_arn : string option) ()
: describe_drt_access_response = { log_bucket_list; role_arn; 
}

let make_describe_drt_access_request  () : describe_drt_access_request =
()

let make_attack_volume_statistics  ~(max : float) ()
: attack_volume_statistics = { max;  }

let make_attack_volume 
  ?(requests_per_second : attack_volume_statistics option)
  ?(packets_per_second : attack_volume_statistics option)
  ?(bits_per_second : attack_volume_statistics option)
  () : attack_volume = {
  requests_per_second; packets_per_second; bits_per_second; 
}

let make_attack_statistics_data_item 
  ?(attack_volume : attack_volume option) ~(attack_count : int) ()
: attack_statistics_data_item = { attack_count; attack_volume; 
}

let make_describe_attack_statistics_response 
  ~(data_items : attack_statistics_data_item list)
  ~(time_range : time_range)
  () : describe_attack_statistics_response = { data_items; time_range; 
}

let make_describe_attack_statistics_request  ()
: describe_attack_statistics_request = ()

let make_attack_property 
  ?(total : int option)
  ?(unit_ : unit_ option)
  ?(top_contributors : contributor list option)
  ?(attack_property_identifier : attack_property_identifier option)
  ?(attack_layer : attack_layer option)
  () : attack_property = {
  total; unit_; top_contributors; attack_property_identifier; attack_layer; 
}

let make_attack_detail 
  ?(mitigations : mitigation list option)
  ?(attack_properties : attack_property list option)
  ?(attack_counters : summarized_counter list option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(sub_resources : sub_resource_summary list option)
  ?(resource_arn : string option)
  ?(attack_id : string option)
  () : attack_detail = {
  mitigations;
  attack_properties;
  attack_counters;
  end_time;
  start_time;
  sub_resources;
  resource_arn;
  attack_id;
   }

let make_describe_attack_response  ?(attack : attack_detail option) ()
: describe_attack_response = { attack;  }

let make_describe_attack_request  ~(attack_id : string) ()
: describe_attack_request = { attack_id; 
}

let make_delete_subscription_response  () : delete_subscription_response =
()

let make_delete_subscription_request  () : delete_subscription_request =
()

let make_delete_protection_response  () : delete_protection_response =
()

let make_delete_protection_request  ~(protection_id : string) ()
: delete_protection_request = { protection_id; 
}

let make_delete_protection_group_response  ()
: delete_protection_group_response =
()

let make_delete_protection_group_request  ~(protection_group_id : string) ()
: delete_protection_group_request = { protection_group_id; 
}

let make_create_subscription_response  () : create_subscription_response =
()

let make_create_subscription_request  () : create_subscription_request =
()

let make_create_protection_response  ?(protection_id : string option) ()
: create_protection_response = { protection_id; 
}

let make_create_protection_request 
  ?(tags : tag list option) ~(resource_arn : string) ~(name : string) ()
: create_protection_request = { tags; resource_arn; name; 
}

let make_create_protection_group_response  ()
: create_protection_group_response =
()

let make_create_protection_group_request 
  ?(tags : tag list option)
  ?(members : string list option)
  ?(resource_type : protected_resource_type option)
  ~(pattern : protection_group_pattern)
  ~(aggregation : protection_group_aggregation)
  ~(protection_group_id : string)
  () : create_protection_group_request = {
  tags; members; resource_type; pattern; aggregation; protection_group_id; 
}

let make_associate_proactive_engagement_details_response  ()
: associate_proactive_engagement_details_response =
()

let make_associate_proactive_engagement_details_request 
  ~(emergency_contact_list : emergency_contact list) ()
: associate_proactive_engagement_details_request = { emergency_contact_list; 
}

let make_associate_health_check_response  ()
: associate_health_check_response =
()

let make_associate_health_check_request 
  ~(health_check_arn : string) ~(protection_id : string) ()
: associate_health_check_request = { health_check_arn; protection_id; 
}

let make_associate_drt_role_response  () : associate_drt_role_response =
()

let make_associate_drt_role_request  ~(role_arn : string) ()
: associate_drt_role_request = { role_arn; 
}

let make_associate_drt_log_bucket_response  ()
: associate_drt_log_bucket_response =
()

let make_associate_drt_log_bucket_request  ~(log_bucket : string) ()
: associate_drt_log_bucket_request = { log_bucket; 
}

