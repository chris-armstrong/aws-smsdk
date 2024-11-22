open Smaws_Lib
let service =
  Service.{
    namespace = "cognito-identity";
    endpointPrefix = "cognito-identity";
    version = "2014-06-30";
    protocol = AwsJson_1_1
  };
type too_many_requests_exception = {
  message: string option
}

type resource_not_found_exception = {
  message: string option
}

type resource_conflict_exception = {
  message: string option
}

type not_authorized_exception = {
  message: string option
}

type limit_exceeded_exception = {
  message: string option
}

type invalid_parameter_exception = {
  message: string option
}

type internal_error_exception = {
  message: string option
}

type concurrent_modification_exception = {
  message: string option
}

type cognito_identity_provider = {
  server_side_token_check: bool option;
  client_id: string option;
  provider_name: string option
}

type identity_pool = {
  identity_pool_tags: (string * string) list option;
  saml_provider_ar_ns: string list option;
  cognito_identity_providers: cognito_identity_provider list option;
  open_id_connect_provider_ar_ns: string list option;
  developer_provider_name: string option;
  supported_login_providers: (string * string) list option;
  allow_classic_flow: bool option;
  allow_unauthenticated_identities: bool;
  identity_pool_name: string;
  identity_pool_id: string
}

type untag_resource_response = unit

type untag_resource_input = {
  tag_keys: string list;
  resource_arn: string
}

type error_code = | INTERNAL_SERVER_ERROR
  | ACCESS_DENIED

type unprocessed_identity_id = {
  error_code: error_code option;
  identity_id: string option
}

type unlink_identity_input = {
  logins_to_remove: string list;
  logins: (string * string) list;
  identity_id: string
}

type external_service_exception = {
  message: string option
}

type unlink_developer_identity_input = {
  developer_user_identifier: string;
  developer_provider_name: string;
  identity_pool_id: string;
  identity_id: string
}

type tag_resource_response = unit

type tag_resource_input = {
  tags: (string * string) list;
  resource_arn: string
}

type set_principal_tag_attribute_map_response = {
  principal_tags: (string * string) list option;
  use_defaults: bool option;
  identity_provider_name: string option;
  identity_pool_id: string option
}

type set_principal_tag_attribute_map_input = {
  principal_tags: (string * string) list option;
  use_defaults: bool option;
  identity_provider_name: string;
  identity_pool_id: string
}

type role_mapping_type = | RULES
  | TOKEN

type ambiguous_role_resolution_type = | DENY
  | AUTHENTICATED_ROLE

type mapping_rule_match_type = | NOT_EQUAL
  | STARTS_WITH
  | CONTAINS
  | EQUALS

type mapping_rule = {
  role_ar_n: string;
  value: string;
  match_type: mapping_rule_match_type;
  claim: string
}

type rules_configuration_type = {
  rules: mapping_rule list
}

type role_mapping = {
  rules_configuration: rules_configuration_type option;
  ambiguous_role_resolution: ambiguous_role_resolution_type option;
  type_: role_mapping_type
}

type set_identity_pool_roles_input = {
  role_mappings: (string * role_mapping) list option;
  roles: (string * string) list;
  identity_pool_id: string
}

type merge_developer_identities_response = {
  identity_id: string option
}

type merge_developer_identities_input = {
  identity_pool_id: string;
  developer_provider_name: string;
  destination_user_identifier: string;
  source_user_identifier: string
}

type lookup_developer_identity_response = {
  next_token: string option;
  developer_user_identifier_list: string list option;
  identity_id: string option
}

type lookup_developer_identity_input = {
  next_token: string option;
  max_results: int option;
  developer_user_identifier: string option;
  identity_id: string option;
  identity_pool_id: string
}

type list_tags_for_resource_response = {
  tags: (string * string) list option
}

type list_tags_for_resource_input = {
  resource_arn: string
}

type identity_pool_short_description = {
  identity_pool_name: string option;
  identity_pool_id: string option
}

type list_identity_pools_response = {
  next_token: string option;
  identity_pools: identity_pool_short_description list option
}

type list_identity_pools_input = {
  next_token: string option;
  max_results: int
}

type identity_description = {
  last_modified_date: float option;
  creation_date: float option;
  logins: string list option;
  identity_id: string option
}

type list_identities_response = {
  next_token: string option;
  identities: identity_description list option;
  identity_pool_id: string option
}

type list_identities_input = {
  hide_disabled: bool option;
  next_token: string option;
  max_results: int;
  identity_pool_id: string
}

type invalid_identity_pool_configuration_exception = {
  message: string option
}

type get_principal_tag_attribute_map_response = {
  principal_tags: (string * string) list option;
  use_defaults: bool option;
  identity_provider_name: string option;
  identity_pool_id: string option
}

type get_principal_tag_attribute_map_input = {
  identity_provider_name: string;
  identity_pool_id: string
}

type get_open_id_token_response = {
  token: string option;
  identity_id: string option
}

type get_open_id_token_input = {
  logins: (string * string) list option;
  identity_id: string
}

type get_open_id_token_for_developer_identity_response = {
  token: string option;
  identity_id: string option
}

type get_open_id_token_for_developer_identity_input = {
  token_duration: int option;
  principal_tags: (string * string) list option;
  logins: (string * string) list;
  identity_id: string option;
  identity_pool_id: string
}

type developer_user_already_registered_exception = {
  message: string option
}

type get_identity_pool_roles_response = {
  role_mappings: (string * role_mapping) list option;
  roles: (string * string) list option;
  identity_pool_id: string option
}

type get_identity_pool_roles_input = {
  identity_pool_id: string
}

type get_id_response = {
  identity_id: string option
}

type get_id_input = {
  logins: (string * string) list option;
  identity_pool_id: string;
  account_id: string option
}

type credentials = {
  expiration: float option;
  session_token: string option;
  secret_key: string option;
  access_key_id: string option
}

type get_credentials_for_identity_response = {
  credentials: credentials option;
  identity_id: string option
}

type get_credentials_for_identity_input = {
  custom_role_arn: string option;
  logins: (string * string) list option;
  identity_id: string
}

type describe_identity_pool_input = {
  identity_pool_id: string
}

type describe_identity_input = {
  identity_id: string
}

type delete_identity_pool_input = {
  identity_pool_id: string
}

type delete_identities_response = {
  unprocessed_identity_ids: unprocessed_identity_id list option
}

type delete_identities_input = {
  identity_ids_to_delete: string list
}

type create_identity_pool_input = {
  identity_pool_tags: (string * string) list option;
  saml_provider_ar_ns: string list option;
  cognito_identity_providers: cognito_identity_provider list option;
  open_id_connect_provider_ar_ns: string list option;
  developer_provider_name: string option;
  supported_login_providers: (string * string) list option;
  allow_classic_flow: bool option;
  allow_unauthenticated_identities: bool;
  identity_pool_name: string
}



type base_document = Json.t

