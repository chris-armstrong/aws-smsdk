[@@@warning "-39"]
open Types
let make_cognito_identity_provider 
  ?(server_side_token_check : bool option)
  ?(client_id : string option)
  ?(provider_name : string option)
  () : cognito_identity_provider = {
  server_side_token_check; client_id; provider_name; 
}

let make_identity_pool 
  ?(identity_pool_tags : (string * string) list option)
  ?(saml_provider_ar_ns : string list option)
  ?(cognito_identity_providers : cognito_identity_provider list option)
  ?(open_id_connect_provider_ar_ns : string list option)
  ?(developer_provider_name : string option)
  ?(supported_login_providers : (string * string) list option)
  ?(allow_classic_flow : bool option)
  ~(allow_unauthenticated_identities : bool)
  ~(identity_pool_name : string)
  ~(identity_pool_id : string)
  () : identity_pool = {
  identity_pool_tags;
  saml_provider_ar_ns;
  cognito_identity_providers;
  open_id_connect_provider_ar_ns;
  developer_provider_name;
  supported_login_providers;
  allow_classic_flow;
  allow_unauthenticated_identities;
  identity_pool_name;
  identity_pool_id;
   }

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_input 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_input = { tag_keys; resource_arn; 
}

let make_unprocessed_identity_id 
  ?(error_code : error_code option) ?(identity_id : string option) ()
: unprocessed_identity_id = { error_code; identity_id; 
}

let make_unlink_identity_input 
  ~(logins_to_remove : string list)
  ~(logins : (string * string) list)
  ~(identity_id : string)
  () : unlink_identity_input = { logins_to_remove; logins; identity_id; 
}

let make_unlink_developer_identity_input 
  ~(developer_user_identifier : string)
  ~(developer_provider_name : string)
  ~(identity_pool_id : string)
  ~(identity_id : string)
  () : unlink_developer_identity_input = {
  developer_user_identifier;
  developer_provider_name;
  identity_pool_id;
  identity_id;
   }

let make_tag_resource_response  () : tag_resource_response =
()

let make_tag_resource_input 
  ~(tags : (string * string) list) ~(resource_arn : string) ()
: tag_resource_input = { tags; resource_arn; 
}

let make_set_principal_tag_attribute_map_response 
  ?(principal_tags : (string * string) list option)
  ?(use_defaults : bool option)
  ?(identity_provider_name : string option)
  ?(identity_pool_id : string option)
  () : set_principal_tag_attribute_map_response = {
  principal_tags; use_defaults; identity_provider_name; identity_pool_id; 
}

let make_set_principal_tag_attribute_map_input 
  ?(principal_tags : (string * string) list option)
  ?(use_defaults : bool option)
  ~(identity_provider_name : string)
  ~(identity_pool_id : string)
  () : set_principal_tag_attribute_map_input = {
  principal_tags; use_defaults; identity_provider_name; identity_pool_id; 
}

let make_mapping_rule 
  ~(role_ar_n : string)
  ~(value : string)
  ~(match_type : mapping_rule_match_type)
  ~(claim : string)
  () : mapping_rule = { role_ar_n; value; match_type; claim; 
}

let make_rules_configuration_type  ~(rules : mapping_rule list) ()
: rules_configuration_type = { rules;  }

let make_role_mapping 
  ?(rules_configuration : rules_configuration_type option)
  ?(ambiguous_role_resolution : ambiguous_role_resolution_type option)
  ~(type_ : role_mapping_type)
  () : role_mapping = {
  rules_configuration; ambiguous_role_resolution; type_; 
}

let make_set_identity_pool_roles_input 
  ?(role_mappings : (string * role_mapping) list option)
  ~(roles : (string * string) list)
  ~(identity_pool_id : string)
  () : set_identity_pool_roles_input = {
  role_mappings; roles; identity_pool_id; 
}

let make_merge_developer_identities_response 
  ?(identity_id : string option) () : merge_developer_identities_response = {
  identity_id;  }

let make_merge_developer_identities_input 
  ~(identity_pool_id : string)
  ~(developer_provider_name : string)
  ~(destination_user_identifier : string)
  ~(source_user_identifier : string)
  () : merge_developer_identities_input = {
  identity_pool_id;
  developer_provider_name;
  destination_user_identifier;
  source_user_identifier;
   }

let make_lookup_developer_identity_response 
  ?(next_token : string option)
  ?(developer_user_identifier_list : string list option)
  ?(identity_id : string option)
  () : lookup_developer_identity_response = {
  next_token; developer_user_identifier_list; identity_id; 
}

let make_lookup_developer_identity_input 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(developer_user_identifier : string option)
  ?(identity_id : string option)
  ~(identity_pool_id : string)
  () : lookup_developer_identity_input = {
  next_token;
  max_results;
  developer_user_identifier;
  identity_id;
  identity_pool_id;
   }

let make_list_tags_for_resource_response 
  ?(tags : (string * string) list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_input  ~(resource_arn : string) ()
: list_tags_for_resource_input = { resource_arn; 
}

let make_identity_pool_short_description 
  ?(identity_pool_name : string option)
  ?(identity_pool_id : string option)
  () : identity_pool_short_description = {
  identity_pool_name; identity_pool_id; 
}

let make_list_identity_pools_response 
  ?(next_token : string option)
  ?(identity_pools : identity_pool_short_description list option)
  () : list_identity_pools_response = { next_token; identity_pools; 
}

let make_list_identity_pools_input 
  ?(next_token : string option) ~(max_results : int) ()
: list_identity_pools_input = { next_token; max_results; 
}

let make_identity_description 
  ?(last_modified_date : float option)
  ?(creation_date : float option)
  ?(logins : string list option)
  ?(identity_id : string option)
  () : identity_description = {
  last_modified_date; creation_date; logins; identity_id; 
}

let make_list_identities_response 
  ?(next_token : string option)
  ?(identities : identity_description list option)
  ?(identity_pool_id : string option)
  () : list_identities_response = {
  next_token; identities; identity_pool_id;  }

let make_list_identities_input 
  ?(hide_disabled : bool option)
  ?(next_token : string option)
  ~(max_results : int)
  ~(identity_pool_id : string)
  () : list_identities_input = {
  hide_disabled; next_token; max_results; identity_pool_id; 
}

let make_get_principal_tag_attribute_map_response 
  ?(principal_tags : (string * string) list option)
  ?(use_defaults : bool option)
  ?(identity_provider_name : string option)
  ?(identity_pool_id : string option)
  () : get_principal_tag_attribute_map_response = {
  principal_tags; use_defaults; identity_provider_name; identity_pool_id; 
}

let make_get_principal_tag_attribute_map_input 
  ~(identity_provider_name : string) ~(identity_pool_id : string) ()
: get_principal_tag_attribute_map_input = {
  identity_provider_name; identity_pool_id; 
}

let make_get_open_id_token_response 
  ?(token : string option) ?(identity_id : string option) ()
: get_open_id_token_response = { token; identity_id; 
}

let make_get_open_id_token_input 
  ?(logins : (string * string) list option) ~(identity_id : string) ()
: get_open_id_token_input = { logins; identity_id; 
}

let make_get_open_id_token_for_developer_identity_response 
  ?(token : string option) ?(identity_id : string option) ()
: get_open_id_token_for_developer_identity_response = { token; identity_id; 
}

let make_get_open_id_token_for_developer_identity_input 
  ?(token_duration : int option)
  ?(principal_tags : (string * string) list option)
  ?(identity_id : string option)
  ~(logins : (string * string) list)
  ~(identity_pool_id : string)
  () : get_open_id_token_for_developer_identity_input = {
  token_duration; principal_tags; logins; identity_id; identity_pool_id; 
}

let make_get_identity_pool_roles_response 
  ?(role_mappings : (string * role_mapping) list option)
  ?(roles : (string * string) list option)
  ?(identity_pool_id : string option)
  () : get_identity_pool_roles_response = {
  role_mappings; roles; identity_pool_id; 
}

let make_get_identity_pool_roles_input  ~(identity_pool_id : string) ()
: get_identity_pool_roles_input = { identity_pool_id; 
}

let make_get_id_response  ?(identity_id : string option) () : get_id_response
= { identity_id;  }

let make_get_id_input 
  ?(logins : (string * string) list option)
  ?(account_id : string option)
  ~(identity_pool_id : string)
  () : get_id_input = { logins; identity_pool_id; account_id; 
}

let make_credentials 
  ?(expiration : float option)
  ?(session_token : string option)
  ?(secret_key : string option)
  ?(access_key_id : string option)
  () : credentials = { expiration; session_token; secret_key; access_key_id; 
}

let make_get_credentials_for_identity_response 
  ?(credentials : credentials option) ?(identity_id : string option) ()
: get_credentials_for_identity_response = { credentials; identity_id; 
}

let make_get_credentials_for_identity_input 
  ?(custom_role_arn : string option)
  ?(logins : (string * string) list option)
  ~(identity_id : string)
  () : get_credentials_for_identity_input = {
  custom_role_arn; logins; identity_id; 
}

let make_describe_identity_pool_input  ~(identity_pool_id : string) ()
: describe_identity_pool_input = { identity_pool_id; 
}

let make_describe_identity_input  ~(identity_id : string) ()
: describe_identity_input = { identity_id; 
}

let make_delete_identity_pool_input  ~(identity_pool_id : string) ()
: delete_identity_pool_input = { identity_pool_id; 
}

let make_delete_identities_response 
  ?(unprocessed_identity_ids : unprocessed_identity_id list option) ()
: delete_identities_response = { unprocessed_identity_ids; 
}

let make_delete_identities_input  ~(identity_ids_to_delete : string list) ()
: delete_identities_input = { identity_ids_to_delete; 
}

let make_create_identity_pool_input 
  ?(identity_pool_tags : (string * string) list option)
  ?(saml_provider_ar_ns : string list option)
  ?(cognito_identity_providers : cognito_identity_provider list option)
  ?(open_id_connect_provider_ar_ns : string list option)
  ?(developer_provider_name : string option)
  ?(supported_login_providers : (string * string) list option)
  ?(allow_classic_flow : bool option)
  ~(allow_unauthenticated_identities : bool)
  ~(identity_pool_name : string)
  () : create_identity_pool_input = {
  identity_pool_tags;
  saml_provider_ar_ns;
  cognito_identity_providers;
  open_id_connect_provider_ar_ns;
  developer_provider_name;
  supported_login_providers;
  allow_classic_flow;
  allow_unauthenticated_identities;
  identity_pool_name;
  
}

