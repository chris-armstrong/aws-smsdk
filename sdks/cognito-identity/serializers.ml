open Smaws_Lib.Json.SerializeHelpers

open Types

let use_defaults_to_yojson = bool_to_yojson

let string__to_yojson = string_to_yojson

let too_many_requests_exception_to_yojson = 
  fun (x: too_many_requests_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let resource_conflict_exception_to_yojson = 
  fun (x: resource_conflict_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let not_authorized_exception_to_yojson = 
  fun (x: not_authorized_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_parameter_exception_to_yojson = 
  fun (x: invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let internal_error_exception_to_yojson = 
  fun (x: internal_error_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let concurrent_modification_exception_to_yojson = 
  fun (x: concurrent_modification_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let identity_pool_id_to_yojson = string_to_yojson

let identity_pool_name_to_yojson = string_to_yojson

let identity_pool_unauthenticated_to_yojson = bool_to_yojson

let classic_flow_to_yojson = bool_to_yojson

let identity_provider_id_to_yojson = string_to_yojson

let identity_provider_name_to_yojson = string_to_yojson

let identity_providers_to_yojson = 
  fun tree -> map_to_yojson identity_provider_id_to_yojson tree

let developer_provider_name_to_yojson = string_to_yojson

let arn_string_to_yojson = string_to_yojson

let oidc_provider_list_to_yojson = 
  fun tree -> list_to_yojson arn_string_to_yojson tree

let cognito_identity_provider_name_to_yojson = string_to_yojson

let cognito_identity_provider_client_id_to_yojson = string_to_yojson

let cognito_identity_provider_token_check_to_yojson = bool_to_yojson

let cognito_identity_provider_to_yojson = 
  fun (x: cognito_identity_provider) -> assoc_to_yojson(
    [(
         "ServerSideTokenCheck",
         (option_to_yojson cognito_identity_provider_token_check_to_yojson x.server_side_token_check));
       (
         "ClientId",
         (option_to_yojson cognito_identity_provider_client_id_to_yojson x.client_id));
       (
         "ProviderName",
         (option_to_yojson cognito_identity_provider_name_to_yojson x.provider_name));
       
  ])

let cognito_identity_provider_list_to_yojson = 
  fun tree -> list_to_yojson cognito_identity_provider_to_yojson tree

let saml_provider_list_to_yojson = 
  fun tree -> list_to_yojson arn_string_to_yojson tree

let tag_value_type_to_yojson = string_to_yojson

let tag_keys_type_to_yojson = string_to_yojson

let identity_pool_tags_type_to_yojson = 
  fun tree -> map_to_yojson tag_value_type_to_yojson tree

let identity_pool_to_yojson = 
  fun (x: identity_pool) -> assoc_to_yojson(
    [(
         "IdentityPoolTags",
         (option_to_yojson identity_pool_tags_type_to_yojson x.identity_pool_tags));
       (
         "SamlProviderARNs",
         (option_to_yojson saml_provider_list_to_yojson x.saml_provider_ar_ns));
       (
         "CognitoIdentityProviders",
         (option_to_yojson cognito_identity_provider_list_to_yojson x.cognito_identity_providers));
       (
         "OpenIdConnectProviderARNs",
         (option_to_yojson oidc_provider_list_to_yojson x.open_id_connect_provider_ar_ns));
       (
         "DeveloperProviderName",
         (option_to_yojson developer_provider_name_to_yojson x.developer_provider_name));
       (
         "SupportedLoginProviders",
         (option_to_yojson identity_providers_to_yojson x.supported_login_providers));
       (
         "AllowClassicFlow",
         (option_to_yojson classic_flow_to_yojson x.allow_classic_flow));
       (
         "AllowUnauthenticatedIdentities",
         (Some (identity_pool_unauthenticated_to_yojson x.allow_unauthenticated_identities)));
       (
         "IdentityPoolName",
         (Some (identity_pool_name_to_yojson x.identity_pool_name)));
       (
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let identity_pool_tags_list_type_to_yojson = 
  fun tree -> list_to_yojson tag_keys_type_to_yojson tree

let untag_resource_input_to_yojson = 
  fun (x: untag_resource_input) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (identity_pool_tags_list_type_to_yojson x.tag_keys)));
       (
         "ResourceArn",
         (Some (arn_string_to_yojson x.resource_arn)));
       
  ])

let identity_id_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let error_code_to_yojson = 
  fun (x: error_code) -> match x with 
 
| INTERNAL_SERVER_ERROR -> `String "InternalServerError"
  | ACCESS_DENIED -> `String "AccessDenied"
   

let unprocessed_identity_id_to_yojson = 
  fun (x: unprocessed_identity_id) -> assoc_to_yojson(
    [(
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "IdentityId",
         (option_to_yojson identity_id_to_yojson x.identity_id));
       
  ])

let unprocessed_identity_id_list_to_yojson = 
  fun tree -> list_to_yojson unprocessed_identity_id_to_yojson tree

let identity_provider_token_to_yojson = string_to_yojson

let logins_map_to_yojson = 
  fun tree -> map_to_yojson identity_provider_token_to_yojson tree

let logins_list_to_yojson = 
  fun tree -> list_to_yojson identity_provider_name_to_yojson tree

let unlink_identity_input_to_yojson = 
  fun (x: unlink_identity_input) -> assoc_to_yojson(
    [(
         "LoginsToRemove",
         (Some (logins_list_to_yojson x.logins_to_remove)));
       (
         "Logins",
         (Some (logins_map_to_yojson x.logins)));
       (
         "IdentityId",
         (Some (identity_id_to_yojson x.identity_id)));
       
  ])

let external_service_exception_to_yojson = 
  fun (x: external_service_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let developer_user_identifier_to_yojson = string_to_yojson

let unlink_developer_identity_input_to_yojson = 
  fun (x: unlink_developer_identity_input) -> assoc_to_yojson(
    [(
         "DeveloperUserIdentifier",
         (Some (developer_user_identifier_to_yojson x.developer_user_identifier)));
       (
         "DeveloperProviderName",
         (Some (developer_provider_name_to_yojson x.developer_provider_name)));
       (
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       (
         "IdentityId",
         (Some (identity_id_to_yojson x.identity_id)));
       
  ])

let token_duration_to_yojson = long_to_yojson

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_resource_input_to_yojson = 
  fun (x: tag_resource_input) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (identity_pool_tags_type_to_yojson x.tags)));
       (
         "ResourceArn",
         (Some (arn_string_to_yojson x.resource_arn)));
       
  ])

let principal_tag_value_to_yojson = string_to_yojson

let principal_tag_i_d_to_yojson = string_to_yojson

let principal_tags_to_yojson = 
  fun tree -> map_to_yojson principal_tag_value_to_yojson tree

let set_principal_tag_attribute_map_response_to_yojson = 
  fun (x: set_principal_tag_attribute_map_response) -> assoc_to_yojson(
    [(
         "PrincipalTags",
         (option_to_yojson principal_tags_to_yojson x.principal_tags));
       (
         "UseDefaults",
         (option_to_yojson use_defaults_to_yojson x.use_defaults));
       (
         "IdentityProviderName",
         (option_to_yojson identity_provider_name_to_yojson x.identity_provider_name));
       (
         "IdentityPoolId",
         (option_to_yojson identity_pool_id_to_yojson x.identity_pool_id));
       
  ])

let set_principal_tag_attribute_map_input_to_yojson = 
  fun (x: set_principal_tag_attribute_map_input) -> assoc_to_yojson(
    [(
         "PrincipalTags",
         (option_to_yojson principal_tags_to_yojson x.principal_tags));
       (
         "UseDefaults",
         (option_to_yojson use_defaults_to_yojson x.use_defaults));
       (
         "IdentityProviderName",
         (Some (identity_provider_name_to_yojson x.identity_provider_name)));
       (
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       
  ])

let role_type_to_yojson = string_to_yojson

let roles_map_to_yojson = 
  fun tree -> map_to_yojson arn_string_to_yojson tree

let role_mapping_type_to_yojson = 
  fun (x: role_mapping_type) -> match x with 
  | RULES -> `String "Rules"
    | TOKEN -> `String "Token"
     

let ambiguous_role_resolution_type_to_yojson = 
  fun (x: ambiguous_role_resolution_type) -> match x with 
 
| DENY -> `String "Deny"
  | AUTHENTICATED_ROLE -> `String "AuthenticatedRole"
   

let claim_name_to_yojson = string_to_yojson

let mapping_rule_match_type_to_yojson = 
  fun (x: mapping_rule_match_type) -> match x with 
 
| NOT_EQUAL -> `String "NotEqual"
  | STARTS_WITH -> `String "StartsWith"
  | CONTAINS -> `String "Contains"
  | EQUALS -> `String "Equals"
   

let claim_value_to_yojson = string_to_yojson

let mapping_rule_to_yojson = 
  fun (x: mapping_rule) -> assoc_to_yojson(
    [(
         "RoleARN",
         (Some (arn_string_to_yojson x.role_ar_n)));
       (
         "Value",
         (Some (claim_value_to_yojson x.value)));
       (
         "MatchType",
         (Some (mapping_rule_match_type_to_yojson x.match_type)));
       (
         "Claim",
         (Some (claim_name_to_yojson x.claim)));
       
  ])

let mapping_rules_list_to_yojson = 
  fun tree -> list_to_yojson mapping_rule_to_yojson tree

let rules_configuration_type_to_yojson = 
  fun (x: rules_configuration_type) -> assoc_to_yojson(
    [(
         "Rules",
         (Some (mapping_rules_list_to_yojson x.rules)));
       
  ])

let role_mapping_to_yojson = 
  fun (x: role_mapping) -> assoc_to_yojson(
    [(
         "RulesConfiguration",
         (option_to_yojson rules_configuration_type_to_yojson x.rules_configuration));
       (
         "AmbiguousRoleResolution",
         (option_to_yojson ambiguous_role_resolution_type_to_yojson x.ambiguous_role_resolution));
       (
         "Type",
         (Some (role_mapping_type_to_yojson x.type_)));
       
  ])

let role_mapping_map_to_yojson = 
  fun tree -> map_to_yojson role_mapping_to_yojson tree

let set_identity_pool_roles_input_to_yojson = 
  fun (x: set_identity_pool_roles_input) -> assoc_to_yojson(
    [(
         "RoleMappings",
         (option_to_yojson role_mapping_map_to_yojson x.role_mappings));
       (
         "Roles",
         (Some (roles_map_to_yojson x.roles)));
       (
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       
  ])

let session_token_string_to_yojson = string_to_yojson

let secret_key_string_to_yojson = string_to_yojson

let query_limit_to_yojson = int_to_yojson

let pagination_key_to_yojson = string_to_yojson

let oidc_token_to_yojson = string_to_yojson

let merge_developer_identities_response_to_yojson = 
  fun (x: merge_developer_identities_response) -> assoc_to_yojson(
    [(
         "IdentityId",
         (option_to_yojson identity_id_to_yojson x.identity_id));
       
  ])

let merge_developer_identities_input_to_yojson = 
  fun (x: merge_developer_identities_input) -> assoc_to_yojson(
    [(
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       (
         "DeveloperProviderName",
         (Some (developer_provider_name_to_yojson x.developer_provider_name)));
       (
         "DestinationUserIdentifier",
         (Some (developer_user_identifier_to_yojson x.destination_user_identifier)));
       (
         "SourceUserIdentifier",
         (Some (developer_user_identifier_to_yojson x.source_user_identifier)));
       
  ])

let developer_user_identifier_list_to_yojson = 
  fun tree -> list_to_yojson developer_user_identifier_to_yojson tree

let lookup_developer_identity_response_to_yojson = 
  fun (x: lookup_developer_identity_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_key_to_yojson x.next_token));
       (
         "DeveloperUserIdentifierList",
         (option_to_yojson developer_user_identifier_list_to_yojson x.developer_user_identifier_list));
       (
         "IdentityId",
         (option_to_yojson identity_id_to_yojson x.identity_id));
       
  ])

let lookup_developer_identity_input_to_yojson = 
  fun (x: lookup_developer_identity_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_key_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson query_limit_to_yojson x.max_results));
       (
         "DeveloperUserIdentifier",
         (option_to_yojson developer_user_identifier_to_yojson x.developer_user_identifier));
       (
         "IdentityId",
         (option_to_yojson identity_id_to_yojson x.identity_id));
       (
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       
  ])

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson identity_pool_tags_type_to_yojson x.tags));
       
  ])

let list_tags_for_resource_input_to_yojson = 
  fun (x: list_tags_for_resource_input) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (arn_string_to_yojson x.resource_arn)));
       
  ])

let identity_pool_short_description_to_yojson = 
  fun (x: identity_pool_short_description) -> assoc_to_yojson(
    [(
         "IdentityPoolName",
         (option_to_yojson identity_pool_name_to_yojson x.identity_pool_name));
       (
         "IdentityPoolId",
         (option_to_yojson identity_pool_id_to_yojson x.identity_pool_id));
       
  ])

let identity_pools_list_to_yojson = 
  fun tree -> list_to_yojson identity_pool_short_description_to_yojson tree

let list_identity_pools_response_to_yojson = 
  fun (x: list_identity_pools_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_key_to_yojson x.next_token));
       (
         "IdentityPools",
         (option_to_yojson identity_pools_list_to_yojson x.identity_pools));
       
  ])

let list_identity_pools_input_to_yojson = 
  fun (x: list_identity_pools_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_key_to_yojson x.next_token));
       (
         "MaxResults",
         (Some (query_limit_to_yojson x.max_results)));
       
  ])

let date_type_to_yojson = timestamp_to_yojson

let identity_description_to_yojson = 
  fun (x: identity_description) -> assoc_to_yojson(
    [(
         "LastModifiedDate",
         (option_to_yojson date_type_to_yojson x.last_modified_date));
       (
         "CreationDate",
         (option_to_yojson date_type_to_yojson x.creation_date));
       (
         "Logins",
         (option_to_yojson logins_list_to_yojson x.logins));
       (
         "IdentityId",
         (option_to_yojson identity_id_to_yojson x.identity_id));
       
  ])

let identities_list_to_yojson = 
  fun tree -> list_to_yojson identity_description_to_yojson tree

let list_identities_response_to_yojson = 
  fun (x: list_identities_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_key_to_yojson x.next_token));
       (
         "Identities",
         (option_to_yojson identities_list_to_yojson x.identities));
       (
         "IdentityPoolId",
         (option_to_yojson identity_pool_id_to_yojson x.identity_pool_id));
       
  ])

let hide_disabled_to_yojson = bool_to_yojson

let list_identities_input_to_yojson = 
  fun (x: list_identities_input) -> assoc_to_yojson(
    [(
         "HideDisabled",
         (option_to_yojson hide_disabled_to_yojson x.hide_disabled));
       (
         "NextToken",
         (option_to_yojson pagination_key_to_yojson x.next_token));
       (
         "MaxResults",
         (Some (query_limit_to_yojson x.max_results)));
       (
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       
  ])

let invalid_identity_pool_configuration_exception_to_yojson = 
  fun (x: invalid_identity_pool_configuration_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let identity_id_list_to_yojson = 
  fun tree -> list_to_yojson identity_id_to_yojson tree

let get_principal_tag_attribute_map_response_to_yojson = 
  fun (x: get_principal_tag_attribute_map_response) -> assoc_to_yojson(
    [(
         "PrincipalTags",
         (option_to_yojson principal_tags_to_yojson x.principal_tags));
       (
         "UseDefaults",
         (option_to_yojson use_defaults_to_yojson x.use_defaults));
       (
         "IdentityProviderName",
         (option_to_yojson identity_provider_name_to_yojson x.identity_provider_name));
       (
         "IdentityPoolId",
         (option_to_yojson identity_pool_id_to_yojson x.identity_pool_id));
       
  ])

let get_principal_tag_attribute_map_input_to_yojson = 
  fun (x: get_principal_tag_attribute_map_input) -> assoc_to_yojson(
    [(
         "IdentityProviderName",
         (Some (identity_provider_name_to_yojson x.identity_provider_name)));
       (
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       
  ])

let get_open_id_token_response_to_yojson = 
  fun (x: get_open_id_token_response) -> assoc_to_yojson(
    [(
         "Token",
         (option_to_yojson oidc_token_to_yojson x.token));
       (
         "IdentityId",
         (option_to_yojson identity_id_to_yojson x.identity_id));
       
  ])

let get_open_id_token_input_to_yojson = 
  fun (x: get_open_id_token_input) -> assoc_to_yojson(
    [(
         "Logins",
         (option_to_yojson logins_map_to_yojson x.logins));
       (
         "IdentityId",
         (Some (identity_id_to_yojson x.identity_id)));
       
  ])

let get_open_id_token_for_developer_identity_response_to_yojson = 
  fun (x: get_open_id_token_for_developer_identity_response) -> assoc_to_yojson(
    [(
         "Token",
         (option_to_yojson oidc_token_to_yojson x.token));
       (
         "IdentityId",
         (option_to_yojson identity_id_to_yojson x.identity_id));
       
  ])

let get_open_id_token_for_developer_identity_input_to_yojson = 
  fun (x: get_open_id_token_for_developer_identity_input) -> assoc_to_yojson(
    [(
         "TokenDuration",
         (option_to_yojson token_duration_to_yojson x.token_duration));
       (
         "PrincipalTags",
         (option_to_yojson principal_tags_to_yojson x.principal_tags));
       (
         "Logins",
         (Some (logins_map_to_yojson x.logins)));
       (
         "IdentityId",
         (option_to_yojson identity_id_to_yojson x.identity_id));
       (
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       
  ])

let developer_user_already_registered_exception_to_yojson = 
  fun (x: developer_user_already_registered_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let get_identity_pool_roles_response_to_yojson = 
  fun (x: get_identity_pool_roles_response) -> assoc_to_yojson(
    [(
         "RoleMappings",
         (option_to_yojson role_mapping_map_to_yojson x.role_mappings));
       (
         "Roles",
         (option_to_yojson roles_map_to_yojson x.roles));
       (
         "IdentityPoolId",
         (option_to_yojson identity_pool_id_to_yojson x.identity_pool_id));
       
  ])

let get_identity_pool_roles_input_to_yojson = 
  fun (x: get_identity_pool_roles_input) -> assoc_to_yojson(
    [(
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       
  ])

let get_id_response_to_yojson = 
  fun (x: get_id_response) -> assoc_to_yojson(
    [(
         "IdentityId",
         (option_to_yojson identity_id_to_yojson x.identity_id));
       
  ])

let account_id_to_yojson = string_to_yojson

let get_id_input_to_yojson = 
  fun (x: get_id_input) -> assoc_to_yojson(
    [(
         "Logins",
         (option_to_yojson logins_map_to_yojson x.logins));
       (
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       
  ])

let access_key_string_to_yojson = string_to_yojson

let credentials_to_yojson = 
  fun (x: credentials) -> assoc_to_yojson(
    [(
         "Expiration",
         (option_to_yojson date_type_to_yojson x.expiration));
       (
         "SessionToken",
         (option_to_yojson session_token_string_to_yojson x.session_token));
       (
         "SecretKey",
         (option_to_yojson secret_key_string_to_yojson x.secret_key));
       (
         "AccessKeyId",
         (option_to_yojson access_key_string_to_yojson x.access_key_id));
       
  ])

let get_credentials_for_identity_response_to_yojson = 
  fun (x: get_credentials_for_identity_response) -> assoc_to_yojson(
    [(
         "Credentials",
         (option_to_yojson credentials_to_yojson x.credentials));
       (
         "IdentityId",
         (option_to_yojson identity_id_to_yojson x.identity_id));
       
  ])

let get_credentials_for_identity_input_to_yojson = 
  fun (x: get_credentials_for_identity_input) -> assoc_to_yojson(
    [(
         "CustomRoleArn",
         (option_to_yojson arn_string_to_yojson x.custom_role_arn));
       (
         "Logins",
         (option_to_yojson logins_map_to_yojson x.logins));
       (
         "IdentityId",
         (Some (identity_id_to_yojson x.identity_id)));
       
  ])

let describe_identity_pool_input_to_yojson = 
  fun (x: describe_identity_pool_input) -> assoc_to_yojson(
    [(
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       
  ])

let describe_identity_input_to_yojson = 
  fun (x: describe_identity_input) -> assoc_to_yojson(
    [(
         "IdentityId",
         (Some (identity_id_to_yojson x.identity_id)));
       
  ])

let delete_identity_pool_input_to_yojson = 
  fun (x: delete_identity_pool_input) -> assoc_to_yojson(
    [(
         "IdentityPoolId",
         (Some (identity_pool_id_to_yojson x.identity_pool_id)));
       
  ])

let delete_identities_response_to_yojson = 
  fun (x: delete_identities_response) -> assoc_to_yojson(
    [(
         "UnprocessedIdentityIds",
         (option_to_yojson unprocessed_identity_id_list_to_yojson x.unprocessed_identity_ids));
       
  ])

let delete_identities_input_to_yojson = 
  fun (x: delete_identities_input) -> assoc_to_yojson(
    [(
         "IdentityIdsToDelete",
         (Some (identity_id_list_to_yojson x.identity_ids_to_delete)));
       
  ])

let create_identity_pool_input_to_yojson = 
  fun (x: create_identity_pool_input) -> assoc_to_yojson(
    [(
         "IdentityPoolTags",
         (option_to_yojson identity_pool_tags_type_to_yojson x.identity_pool_tags));
       (
         "SamlProviderARNs",
         (option_to_yojson saml_provider_list_to_yojson x.saml_provider_ar_ns));
       (
         "CognitoIdentityProviders",
         (option_to_yojson cognito_identity_provider_list_to_yojson x.cognito_identity_providers));
       (
         "OpenIdConnectProviderARNs",
         (option_to_yojson oidc_provider_list_to_yojson x.open_id_connect_provider_ar_ns));
       (
         "DeveloperProviderName",
         (option_to_yojson developer_provider_name_to_yojson x.developer_provider_name));
       (
         "SupportedLoginProviders",
         (option_to_yojson identity_providers_to_yojson x.supported_login_providers));
       (
         "AllowClassicFlow",
         (option_to_yojson classic_flow_to_yojson x.allow_classic_flow));
       (
         "AllowUnauthenticatedIdentities",
         (Some (identity_pool_unauthenticated_to_yojson x.allow_unauthenticated_identities)));
       (
         "IdentityPoolName",
         (Some (identity_pool_name_to_yojson x.identity_pool_name)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

