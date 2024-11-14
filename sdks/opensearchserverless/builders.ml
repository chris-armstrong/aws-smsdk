[@@@warning "-39"]
open Types
let make_vpc_endpoint_summary 
  ?(status : vpc_endpoint_status option)
  ?(name : string option)
  ?(id : string option)
  () : vpc_endpoint_summary = { status; name; id; 
}

let make_vpc_endpoint_filters  ?(status : vpc_endpoint_status option) ()
: vpc_endpoint_filters = { status;  }

let make_vpc_endpoint_error_detail 
  ?(error_code : string option)
  ?(error_message : string option)
  ?(id : string option)
  () : vpc_endpoint_error_detail = { error_code; error_message; id; 
}

let make_vpc_endpoint_detail 
  ?(created_date : int option)
  ?(status : vpc_endpoint_status option)
  ?(security_group_ids : string list option)
  ?(subnet_ids : string list option)
  ?(vpc_id : string option)
  ?(name : string option)
  ?(id : string option)
  () : vpc_endpoint_detail = {
  created_date; status; security_group_ids; subnet_ids; vpc_id; name; id; 
}

let make_update_vpc_endpoint_detail 
  ?(last_modified_date : int option)
  ?(security_group_ids : string list option)
  ?(subnet_ids : string list option)
  ?(status : vpc_endpoint_status option)
  ?(name : string option)
  ?(id : string option)
  () : update_vpc_endpoint_detail = {
  last_modified_date; security_group_ids; subnet_ids; status; name; id; 
}

let make_update_vpc_endpoint_response 
  ?(update_vpc_endpoint_detail : update_vpc_endpoint_detail option) ()
: update_vpc_endpoint_response = { update_vpc_endpoint_detail; 
}

let make_update_vpc_endpoint_request 
  ?(client_token : string option)
  ?(remove_security_group_ids : string list option)
  ?(add_security_group_ids : string list option)
  ?(remove_subnet_ids : string list option)
  ?(add_subnet_ids : string list option)
  ~(id : string)
  () : update_vpc_endpoint_request = {
  client_token;
  remove_security_group_ids;
  add_security_group_ids;
  remove_subnet_ids;
  add_subnet_ids;
  id;
   }

let make_security_policy_detail 
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(policy : base_document option)
  ?(description : string option)
  ?(policy_version : string option)
  ?(name : string option)
  ?(type_ : security_policy_type option)
  () : security_policy_detail = {
  last_modified_date;
  created_date;
  policy;
  description;
  policy_version;
  name;
  type_;
   }

let make_update_security_policy_response 
  ?(security_policy_detail : security_policy_detail option) ()
: update_security_policy_response = { security_policy_detail; 
}

let make_update_security_policy_request 
  ?(client_token : string option)
  ?(policy : string option)
  ?(description : string option)
  ~(policy_version : string)
  ~(name : string)
  ~(type_ : security_policy_type)
  () : update_security_policy_request = {
  client_token; policy; description; policy_version; name; type_; 
}

let make_saml_config_options 
  ?(session_timeout : int option)
  ?(group_attribute : string option)
  ?(user_attribute : string option)
  ~(metadata : string)
  () : saml_config_options = {
  session_timeout; group_attribute; user_attribute; metadata; 
}

let make_security_config_detail 
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(saml_options : saml_config_options option)
  ?(description : string option)
  ?(config_version : string option)
  ?(type_ : security_config_type option)
  ?(id : string option)
  () : security_config_detail = {
  last_modified_date;
  created_date;
  saml_options;
  description;
  config_version;
  type_;
  id;
   }

let make_update_security_config_response 
  ?(security_config_detail : security_config_detail option) ()
: update_security_config_response = { security_config_detail; 
}

let make_update_security_config_request 
  ?(client_token : string option)
  ?(saml_options : saml_config_options option)
  ?(description : string option)
  ~(config_version : string)
  ~(id : string)
  () : update_security_config_request = {
  client_token; saml_options; description; config_version; id; 
}

let make_lifecycle_policy_detail 
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(policy : base_document option)
  ?(description : string option)
  ?(policy_version : string option)
  ?(name : string option)
  ?(type_ : lifecycle_policy_type option)
  () : lifecycle_policy_detail = {
  last_modified_date;
  created_date;
  policy;
  description;
  policy_version;
  name;
  type_;
   }

let make_update_lifecycle_policy_response 
  ?(lifecycle_policy_detail : lifecycle_policy_detail option) ()
: update_lifecycle_policy_response = { lifecycle_policy_detail; 
}

let make_update_lifecycle_policy_request 
  ?(client_token : string option)
  ?(policy : string option)
  ?(description : string option)
  ~(policy_version : string)
  ~(name : string)
  ~(type_ : lifecycle_policy_type)
  () : update_lifecycle_policy_request = {
  client_token; policy; description; policy_version; name; type_; 
}

let make_update_collection_detail 
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(arn : string option)
  ?(description : string option)
  ?(type_ : collection_type option)
  ?(status : collection_status option)
  ?(name : string option)
  ?(id : string option)
  () : update_collection_detail = {
  last_modified_date;
  created_date;
  arn;
  description;
  type_;
  status;
  name;
  id;
   }

let make_update_collection_response 
  ?(update_collection_detail : update_collection_detail option) ()
: update_collection_response = { update_collection_detail; 
}

let make_update_collection_request 
  ?(client_token : string option)
  ?(description : string option)
  ~(id : string)
  () : update_collection_request = { client_token; description; id; 
}

let make_capacity_limits 
  ?(max_search_capacity_in_oc_u : int option)
  ?(max_indexing_capacity_in_oc_u : int option)
  () : capacity_limits = {
  max_search_capacity_in_oc_u; max_indexing_capacity_in_oc_u; 
}

let make_account_settings_detail 
  ?(capacity_limits : capacity_limits option) () : account_settings_detail =
{ capacity_limits;  }

let make_update_account_settings_response 
  ?(account_settings_detail : account_settings_detail option) ()
: update_account_settings_response = { account_settings_detail; 
}

let make_update_account_settings_request 
  ?(capacity_limits : capacity_limits option) ()
: update_account_settings_request = { capacity_limits; 
}

let make_access_policy_detail 
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(policy : base_document option)
  ?(description : string option)
  ?(policy_version : string option)
  ?(name : string option)
  ?(type_ : access_policy_type option)
  () : access_policy_detail = {
  last_modified_date;
  created_date;
  policy;
  description;
  policy_version;
  name;
  type_;
   }

let make_update_access_policy_response 
  ?(access_policy_detail : access_policy_detail option) ()
: update_access_policy_response = { access_policy_detail; 
}

let make_update_access_policy_request 
  ?(client_token : string option)
  ?(policy : string option)
  ?(description : string option)
  ~(policy_version : string)
  ~(name : string)
  ~(type_ : access_policy_type)
  () : update_access_policy_request = {
  client_token; policy; description; policy_version; name; type_; 
}

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_request = { tag_keys; resource_arn;  }

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_resource_response  () : tag_resource_response =
()

let make_tag_resource_request  ~(tags : tag list) ~(resource_arn : string) ()
: tag_resource_request = { tags; resource_arn; 
}

let make_security_policy_summary 
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(description : string option)
  ?(policy_version : string option)
  ?(name : string option)
  ?(type_ : security_policy_type option)
  () : security_policy_summary = {
  last_modified_date; created_date; description; policy_version; name; type_; 
}

let make_security_policy_stats 
  ?(network_policy_count : int option)
  ?(encryption_policy_count : int option)
  () : security_policy_stats = {
  network_policy_count; encryption_policy_count; 
}

let make_security_config_summary 
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(description : string option)
  ?(config_version : string option)
  ?(type_ : security_config_type option)
  ?(id : string option)
  () : security_config_summary = {
  last_modified_date; created_date; description; config_version; type_; id; 
}

let make_security_config_stats  ?(saml_config_count : int option) ()
: security_config_stats = { saml_config_count; 
}

let make_list_tags_for_resource_response  ?(tags : tag list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_request  ~(resource_arn : string) ()
: list_tags_for_resource_request = { resource_arn; 
}

let make_access_policy_stats  ?(data_policy_count : int option) ()
: access_policy_stats = { data_policy_count; 
}

let make_lifecycle_policy_stats  ?(retention_policy_count : int option) ()
: lifecycle_policy_stats = { retention_policy_count; 
}

let make_get_policies_stats_response 
  ?(total_policy_count : int option)
  ?(lifecycle_policy_stats : lifecycle_policy_stats option)
  ?(security_config_stats : security_config_stats option)
  ?(security_policy_stats : security_policy_stats option)
  ?(access_policy_stats : access_policy_stats option)
  () : get_policies_stats_response = {
  total_policy_count;
  lifecycle_policy_stats;
  security_config_stats;
  security_policy_stats;
  access_policy_stats;
   }

let make_get_policies_stats_request  () : get_policies_stats_request =
()

let make_get_account_settings_response 
  ?(account_settings_detail : account_settings_detail option) ()
: get_account_settings_response = { account_settings_detail; 
}

let make_get_account_settings_request  () : get_account_settings_request =
()

let make_create_security_policy_response 
  ?(security_policy_detail : security_policy_detail option) ()
: create_security_policy_response = { security_policy_detail; 
}

let make_create_security_policy_request 
  ?(client_token : string option)
  ?(description : string option)
  ~(policy : string)
  ~(name : string)
  ~(type_ : security_policy_type)
  () : create_security_policy_request = {
  client_token; policy; description; name; type_; 
}

let make_create_lifecycle_policy_response 
  ?(lifecycle_policy_detail : lifecycle_policy_detail option) ()
: create_lifecycle_policy_response = { lifecycle_policy_detail; 
}

let make_create_lifecycle_policy_request 
  ?(client_token : string option)
  ?(description : string option)
  ~(policy : string)
  ~(name : string)
  ~(type_ : lifecycle_policy_type)
  () : create_lifecycle_policy_request = {
  client_token; policy; description; name; type_; 
}

let make_batch_get_vpc_endpoint_response 
  ?(vpc_endpoint_error_details : vpc_endpoint_error_detail list option)
  ?(vpc_endpoint_details : vpc_endpoint_detail list option)
  () : batch_get_vpc_endpoint_response = {
  vpc_endpoint_error_details; vpc_endpoint_details; 
}

let make_batch_get_vpc_endpoint_request  ~(ids : string list) ()
: batch_get_vpc_endpoint_request = { ids; 
}

let make_lifecycle_policy_error_detail 
  ?(error_code : string option)
  ?(error_message : string option)
  ?(name : string option)
  ?(type_ : lifecycle_policy_type option)
  () : lifecycle_policy_error_detail = {
  error_code; error_message; name; type_; 
}

let make_batch_get_lifecycle_policy_response 
  ?(lifecycle_policy_error_details : lifecycle_policy_error_detail list option)
  ?(lifecycle_policy_details : lifecycle_policy_detail list option)
  () : batch_get_lifecycle_policy_response = {
  lifecycle_policy_error_details; lifecycle_policy_details; 
}

let make_lifecycle_policy_identifier 
  ~(name : string) ~(type_ : lifecycle_policy_type) ()
: lifecycle_policy_identifier = { name; type_; 
}

let make_batch_get_lifecycle_policy_request 
  ~(identifiers : lifecycle_policy_identifier list) ()
: batch_get_lifecycle_policy_request = { identifiers; 
}

let make_effective_lifecycle_policy_detail 
  ?(no_min_retention_period : bool option)
  ?(retention_period : string option)
  ?(resource_type : resource_type option)
  ?(policy_name : string option)
  ?(resource : string option)
  ?(type_ : lifecycle_policy_type option)
  () : effective_lifecycle_policy_detail = {
  no_min_retention_period;
  retention_period;
  resource_type;
  policy_name;
  resource;
  type_;
   }

let make_effective_lifecycle_policy_error_detail 
  ?(error_code : string option)
  ?(error_message : string option)
  ?(resource : string option)
  ?(type_ : lifecycle_policy_type option)
  () : effective_lifecycle_policy_error_detail = {
  error_code; error_message; resource; type_; 
}

let make_batch_get_effective_lifecycle_policy_response 
  ?(effective_lifecycle_policy_error_details : effective_lifecycle_policy_error_detail list option)
  ?(effective_lifecycle_policy_details : effective_lifecycle_policy_detail list option)
  () : batch_get_effective_lifecycle_policy_response = {
  effective_lifecycle_policy_error_details;
  effective_lifecycle_policy_details;
   }

let make_lifecycle_policy_resource_identifier 
  ~(resource : string) ~(type_ : lifecycle_policy_type) ()
: lifecycle_policy_resource_identifier = { resource; type_; 
}

let make_batch_get_effective_lifecycle_policy_request 
  ~(resource_identifiers : lifecycle_policy_resource_identifier list) ()
: batch_get_effective_lifecycle_policy_request = { resource_identifiers; 
}

let make_collection_detail 
  ?(dashboard_endpoint : string option)
  ?(collection_endpoint : string option)
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(standby_replicas : standby_replicas option)
  ?(kms_key_arn : string option)
  ?(arn : string option)
  ?(description : string option)
  ?(type_ : collection_type option)
  ?(status : collection_status option)
  ?(name : string option)
  ?(id : string option)
  () : collection_detail = {
  dashboard_endpoint;
  collection_endpoint;
  last_modified_date;
  created_date;
  standby_replicas;
  kms_key_arn;
  arn;
  description;
  type_;
  status;
  name;
  id;
   }

let make_collection_error_detail 
  ?(error_code : string option)
  ?(error_message : string option)
  ?(name : string option)
  ?(id : string option)
  () : collection_error_detail = { error_code; error_message; name; id; 
}

let make_batch_get_collection_response 
  ?(collection_error_details : collection_error_detail list option)
  ?(collection_details : collection_detail list option)
  () : batch_get_collection_response = {
  collection_error_details; collection_details; 
}

let make_batch_get_collection_request 
  ?(names : string list option) ?(ids : string list option) ()
: batch_get_collection_request = { names; ids; 
}

let make_list_vpc_endpoints_response 
  ?(next_token : string option)
  ?(vpc_endpoint_summaries : vpc_endpoint_summary list option)
  () : list_vpc_endpoints_response = { next_token; vpc_endpoint_summaries; 
}

let make_list_vpc_endpoints_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(vpc_endpoint_filters : vpc_endpoint_filters option)
  () : list_vpc_endpoints_request = {
  max_results; next_token; vpc_endpoint_filters; 
}

let make_list_security_policies_response 
  ?(next_token : string option)
  ?(security_policy_summaries : security_policy_summary list option)
  () : list_security_policies_response = {
  next_token; security_policy_summaries; 
}

let make_list_security_policies_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(resource : string list option)
  ~(type_ : security_policy_type)
  () : list_security_policies_request = {
  max_results; next_token; resource; type_; 
}

let make_list_security_configs_response 
  ?(next_token : string option)
  ?(security_config_summaries : security_config_summary list option)
  () : list_security_configs_response = {
  next_token; security_config_summaries; 
}

let make_list_security_configs_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(type_ : security_config_type)
  () : list_security_configs_request = { max_results; next_token; type_; 
}

let make_lifecycle_policy_summary 
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(description : string option)
  ?(policy_version : string option)
  ?(name : string option)
  ?(type_ : lifecycle_policy_type option)
  () : lifecycle_policy_summary = {
  last_modified_date; created_date; description; policy_version; name; type_; 
}

let make_list_lifecycle_policies_response 
  ?(next_token : string option)
  ?(lifecycle_policy_summaries : lifecycle_policy_summary list option)
  () : list_lifecycle_policies_response = {
  next_token; lifecycle_policy_summaries; 
}

let make_list_lifecycle_policies_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(resources : string list option)
  ~(type_ : lifecycle_policy_type)
  () : list_lifecycle_policies_request = {
  max_results; next_token; resources; type_;  }

let make_collection_summary 
  ?(arn : string option)
  ?(status : collection_status option)
  ?(name : string option)
  ?(id : string option)
  () : collection_summary = { arn; status; name; id; 
}

let make_list_collections_response 
  ?(next_token : string option)
  ?(collection_summaries : collection_summary list option)
  () : list_collections_response = { next_token; collection_summaries; 
}

let make_collection_filters 
  ?(status : collection_status option) ?(name : string option) ()
: collection_filters = { status; name;  }

let make_list_collections_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(collection_filters : collection_filters option)
  () : list_collections_request = {
  max_results; next_token; collection_filters; 
}

let make_access_policy_summary 
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(description : string option)
  ?(policy_version : string option)
  ?(name : string option)
  ?(type_ : access_policy_type option)
  () : access_policy_summary = {
  last_modified_date; created_date; description; policy_version; name; type_; 
}

let make_list_access_policies_response 
  ?(next_token : string option)
  ?(access_policy_summaries : access_policy_summary list option)
  () : list_access_policies_response = {
  next_token; access_policy_summaries; 
}

let make_list_access_policies_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(resource : string list option)
  ~(type_ : access_policy_type)
  () : list_access_policies_request = {
  max_results; next_token; resource; type_; 
}

let make_get_security_policy_response 
  ?(security_policy_detail : security_policy_detail option) ()
: get_security_policy_response = { security_policy_detail; 
}

let make_get_security_policy_request 
  ~(name : string) ~(type_ : security_policy_type) ()
: get_security_policy_request = { name; type_; 
}

let make_get_security_config_response 
  ?(security_config_detail : security_config_detail option) ()
: get_security_config_response = { security_config_detail; 
}

let make_get_security_config_request  ~(id : string) ()
: get_security_config_request = { id;  }

let make_get_access_policy_response 
  ?(access_policy_detail : access_policy_detail option) ()
: get_access_policy_response = { access_policy_detail; 
}

let make_get_access_policy_request 
  ~(name : string) ~(type_ : access_policy_type) ()
: get_access_policy_request = { name; type_; 
}

let make_delete_vpc_endpoint_detail 
  ?(status : vpc_endpoint_status option)
  ?(name : string option)
  ?(id : string option)
  () : delete_vpc_endpoint_detail = { status; name; id; 
}

let make_delete_vpc_endpoint_response 
  ?(delete_vpc_endpoint_detail : delete_vpc_endpoint_detail option) ()
: delete_vpc_endpoint_response = { delete_vpc_endpoint_detail; 
}

let make_delete_vpc_endpoint_request 
  ?(client_token : string option) ~(id : string) ()
: delete_vpc_endpoint_request = { client_token; id; 
}

let make_delete_security_policy_response  ()
: delete_security_policy_response =
()

let make_delete_security_policy_request 
  ?(client_token : string option)
  ~(name : string)
  ~(type_ : security_policy_type)
  () : delete_security_policy_request = { client_token; name; type_; 
}

let make_delete_security_config_response  ()
: delete_security_config_response =
()

let make_delete_security_config_request 
  ?(client_token : string option) ~(id : string) ()
: delete_security_config_request = { client_token; id; 
}

let make_delete_lifecycle_policy_response  ()
: delete_lifecycle_policy_response =
()

let make_delete_lifecycle_policy_request 
  ?(client_token : string option)
  ~(name : string)
  ~(type_ : lifecycle_policy_type)
  () : delete_lifecycle_policy_request = { client_token; name; type_; 
}

let make_delete_collection_detail 
  ?(status : collection_status option)
  ?(name : string option)
  ?(id : string option)
  () : delete_collection_detail = { status; name; id; 
}

let make_delete_collection_response 
  ?(delete_collection_detail : delete_collection_detail option) ()
: delete_collection_response = { delete_collection_detail; 
}

let make_delete_collection_request 
  ?(client_token : string option) ~(id : string) ()
: delete_collection_request = { client_token; id; 
}

let make_delete_access_policy_response  () : delete_access_policy_response =
()

let make_delete_access_policy_request 
  ?(client_token : string option)
  ~(name : string)
  ~(type_ : access_policy_type)
  () : delete_access_policy_request = { client_token; name; type_; 
}

let make_create_vpc_endpoint_detail 
  ?(status : vpc_endpoint_status option)
  ?(name : string option)
  ?(id : string option)
  () : create_vpc_endpoint_detail = { status; name; id; 
}

let make_create_vpc_endpoint_response 
  ?(create_vpc_endpoint_detail : create_vpc_endpoint_detail option) ()
: create_vpc_endpoint_response = { create_vpc_endpoint_detail; 
}

let make_create_vpc_endpoint_request 
  ?(client_token : string option)
  ?(security_group_ids : string list option)
  ~(subnet_ids : string list)
  ~(vpc_id : string)
  ~(name : string)
  () : create_vpc_endpoint_request = {
  client_token; security_group_ids; subnet_ids; vpc_id; name; 
}

let make_create_security_config_response 
  ?(security_config_detail : security_config_detail option) ()
: create_security_config_response = { security_config_detail; 
}

let make_create_security_config_request 
  ?(client_token : string option)
  ?(saml_options : saml_config_options option)
  ?(description : string option)
  ~(name : string)
  ~(type_ : security_config_type)
  () : create_security_config_request = {
  client_token; saml_options; description; name; type_; 
}

let make_create_collection_detail 
  ?(last_modified_date : int option)
  ?(created_date : int option)
  ?(standby_replicas : standby_replicas option)
  ?(kms_key_arn : string option)
  ?(arn : string option)
  ?(description : string option)
  ?(type_ : collection_type option)
  ?(status : collection_status option)
  ?(name : string option)
  ?(id : string option)
  () : create_collection_detail = {
  last_modified_date;
  created_date;
  standby_replicas;
  kms_key_arn;
  arn;
  description;
  type_;
  status;
  name;
  id;
   }

let make_create_collection_response 
  ?(create_collection_detail : create_collection_detail option) ()
: create_collection_response = { create_collection_detail; 
}

let make_create_collection_request 
  ?(client_token : string option)
  ?(standby_replicas : standby_replicas option)
  ?(tags : tag list option)
  ?(description : string option)
  ?(type_ : collection_type option)
  ~(name : string)
  () : create_collection_request = {
  client_token; standby_replicas; tags; description; type_; name; 
}

let make_create_access_policy_response 
  ?(access_policy_detail : access_policy_detail option) ()
: create_access_policy_response = { access_policy_detail; 
}

let make_create_access_policy_request 
  ?(client_token : string option)
  ?(description : string option)
  ~(policy : string)
  ~(name : string)
  ~(type_ : access_policy_type)
  () : create_access_policy_request = {
  client_token; policy; description; name; type_; 
}

