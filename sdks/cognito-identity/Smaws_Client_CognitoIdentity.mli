open Smaws_Lib
val service : Service.descriptor

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

val make_cognito_identity_provider :
  ?server_side_token_check:bool ->
  ?client_id:string ->
  ?provider_name:string ->
  unit -> cognito_identity_provider

val make_identity_pool :
  ?identity_pool_tags:(string * string) list ->
  ?saml_provider_ar_ns:string list ->
  ?cognito_identity_providers:cognito_identity_provider list ->
  ?open_id_connect_provider_ar_ns:string list ->
  ?developer_provider_name:string ->
  ?supported_login_providers:(string * string) list ->
  ?allow_classic_flow:bool ->
  allow_unauthenticated_identities:bool ->
  identity_pool_name:string ->
  identity_pool_id:string ->
  unit -> identity_pool

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input

val make_unprocessed_identity_id :
  ?error_code:error_code -> ?identity_id:string -> unit
-> unprocessed_identity_id

val make_unlink_identity_input :
  logins_to_remove:string list ->
  logins:(string * string) list ->
  identity_id:string ->
  unit -> unlink_identity_input

val make_unlink_developer_identity_input :
  developer_user_identifier:string ->
  developer_provider_name:string ->
  identity_pool_id:string ->
  identity_id:string ->
  unit -> unlink_developer_identity_input

val make_tag_resource_response : unit
-> tag_resource_response

val make_tag_resource_input :
  tags:(string * string) list -> resource_arn:string -> unit
-> tag_resource_input

val make_set_principal_tag_attribute_map_response :
  ?principal_tags:(string * string) list ->
  ?use_defaults:bool ->
  ?identity_provider_name:string ->
  ?identity_pool_id:string ->
  unit
-> set_principal_tag_attribute_map_response

val make_set_principal_tag_attribute_map_input :
  ?principal_tags:(string * string) list ->
  ?use_defaults:bool ->
  identity_provider_name:string ->
  identity_pool_id:string ->
  unit -> set_principal_tag_attribute_map_input

val make_mapping_rule :
  role_ar_n:string ->
  value:string ->
  match_type:mapping_rule_match_type ->
  claim:string ->
  unit -> mapping_rule

val make_rules_configuration_type : rules:mapping_rule list -> unit
-> rules_configuration_type

val make_role_mapping :
  ?rules_configuration:rules_configuration_type ->
  ?ambiguous_role_resolution:ambiguous_role_resolution_type ->
  type_:role_mapping_type ->
  unit -> role_mapping

val make_set_identity_pool_roles_input :
  ?role_mappings:(string * role_mapping) list ->
  roles:(string * string) list ->
  identity_pool_id:string ->
  unit
-> set_identity_pool_roles_input

val make_merge_developer_identities_response : ?identity_id:string -> unit
-> merge_developer_identities_response

val make_merge_developer_identities_input :
  identity_pool_id:string ->
  developer_provider_name:string ->
  destination_user_identifier:string ->
  source_user_identifier:string ->
  unit
-> merge_developer_identities_input

val make_lookup_developer_identity_response :
  ?next_token:string ->
  ?developer_user_identifier_list:string list ->
  ?identity_id:string ->
  unit
-> lookup_developer_identity_response

val make_lookup_developer_identity_input :
  ?next_token:string ->
  ?max_results:int ->
  ?developer_user_identifier:string ->
  ?identity_id:string ->
  identity_pool_id:string ->
  unit
-> lookup_developer_identity_input

val make_list_tags_for_resource_response :
  ?tags:(string * string) list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input

val make_identity_pool_short_description :
  ?identity_pool_name:string -> ?identity_pool_id:string -> unit
-> identity_pool_short_description

val make_list_identity_pools_response :
  ?next_token:string ->
  ?identity_pools:identity_pool_short_description list ->
  unit -> list_identity_pools_response

val make_list_identity_pools_input :
  ?next_token:string -> max_results:int -> unit
-> list_identity_pools_input

val make_identity_description :
  ?last_modified_date:float ->
  ?creation_date:float ->
  ?logins:string list ->
  ?identity_id:string ->
  unit -> identity_description

val make_list_identities_response :
  ?next_token:string ->
  ?identities:identity_description list ->
  ?identity_pool_id:string ->
  unit -> list_identities_response

val make_list_identities_input :
  ?hide_disabled:bool ->
  ?next_token:string ->
  max_results:int ->
  identity_pool_id:string ->
  unit
-> list_identities_input

val make_get_principal_tag_attribute_map_response :
  ?principal_tags:(string * string) list ->
  ?use_defaults:bool ->
  ?identity_provider_name:string ->
  ?identity_pool_id:string ->
  unit
-> get_principal_tag_attribute_map_response

val make_get_principal_tag_attribute_map_input :
  identity_provider_name:string -> identity_pool_id:string -> unit
-> get_principal_tag_attribute_map_input

val make_get_open_id_token_response :
  ?token:string -> ?identity_id:string -> unit
-> get_open_id_token_response

val make_get_open_id_token_input :
  ?logins:(string * string) list -> identity_id:string -> unit
-> get_open_id_token_input

val make_get_open_id_token_for_developer_identity_response :
  ?token:string -> ?identity_id:string -> unit
-> get_open_id_token_for_developer_identity_response

val make_get_open_id_token_for_developer_identity_input :
  ?token_duration:int ->
  ?principal_tags:(string * string) list ->
  ?identity_id:string ->
  logins:(string * string) list ->
  identity_pool_id:string ->
  unit
-> get_open_id_token_for_developer_identity_input

val make_get_identity_pool_roles_response :
  ?role_mappings:(string * role_mapping) list ->
  ?roles:(string * string) list ->
  ?identity_pool_id:string ->
  unit
-> get_identity_pool_roles_response

val make_get_identity_pool_roles_input : identity_pool_id:string -> unit
-> get_identity_pool_roles_input

val make_get_id_response : ?identity_id:string -> unit
-> get_id_response

val make_get_id_input :
  ?logins:(string * string) list ->
  ?account_id:string ->
  identity_pool_id:string ->
  unit -> get_id_input

val make_credentials :
  ?expiration:float ->
  ?session_token:string ->
  ?secret_key:string ->
  ?access_key_id:string ->
  unit -> credentials

val make_get_credentials_for_identity_response :
  ?credentials:credentials -> ?identity_id:string -> unit
-> get_credentials_for_identity_response

val make_get_credentials_for_identity_input :
  ?custom_role_arn:string ->
  ?logins:(string * string) list ->
  identity_id:string ->
  unit
-> get_credentials_for_identity_input

val make_describe_identity_pool_input : identity_pool_id:string -> unit
-> describe_identity_pool_input

val make_describe_identity_input : identity_id:string -> unit
-> describe_identity_input

val make_delete_identity_pool_input : identity_pool_id:string -> unit
-> delete_identity_pool_input

val make_delete_identities_response :
  ?unprocessed_identity_ids:unprocessed_identity_id list -> unit
-> delete_identities_response

val make_delete_identities_input : identity_ids_to_delete:string list -> unit
-> delete_identities_input

val make_create_identity_pool_input :
  ?identity_pool_tags:(string * string) list ->
  ?saml_provider_ar_ns:string list ->
  ?cognito_identity_providers:cognito_identity_provider list ->
  ?open_id_connect_provider_ar_ns:string list ->
  ?developer_provider_name:string ->
  ?supported_login_providers:(string * string) list ->
  ?allow_classic_flow:bool ->
  allow_unauthenticated_identities:bool ->
  identity_pool_name:string ->
  unit -> create_identity_pool_input

module UpdateIdentityPool : sig
  val request :
    Smaws_Lib.Context.t ->
      identity_pool ->
        (identity_pool,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module UnlinkIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      unlink_identity_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExternalServiceException of external_service_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module UnlinkDeveloperIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      unlink_developer_identity_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module SetPrincipalTagAttributeMap : sig
  val request :
    Smaws_Lib.Context.t ->
      set_principal_tag_attribute_map_input ->
        (set_principal_tag_attribute_map_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module SetIdentityPoolRoles : sig
  val request :
    Smaws_Lib.Context.t ->
      set_identity_pool_roles_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module MergeDeveloperIdentities : sig
  val request :
    Smaws_Lib.Context.t ->
      merge_developer_identities_input ->
        (merge_developer_identities_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module LookupDeveloperIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      lookup_developer_identity_input ->
        (lookup_developer_identity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module ListIdentityPools : sig
  val request :
    Smaws_Lib.Context.t ->
      list_identity_pools_input ->
        (list_identity_pools_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module ListIdentities : sig
  val request :
    Smaws_Lib.Context.t ->
      list_identities_input ->
        (list_identities_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module GetPrincipalTagAttributeMap : sig
  val request :
    Smaws_Lib.Context.t ->
      get_principal_tag_attribute_map_input ->
        (get_principal_tag_attribute_map_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module GetOpenIdTokenForDeveloperIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      get_open_id_token_for_developer_identity_input ->
        (get_open_id_token_for_developer_identity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DeveloperUserAlreadyRegisteredException of developer_user_already_registered_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module GetOpenIdToken : sig
  val request :
    Smaws_Lib.Context.t ->
      get_open_id_token_input ->
        (get_open_id_token_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExternalServiceException of external_service_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module GetIdentityPoolRoles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_identity_pool_roles_input ->
        (get_identity_pool_roles_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module GetId : sig
  val request :
    Smaws_Lib.Context.t ->
      get_id_input ->
        (get_id_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExternalServiceException of external_service_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module GetCredentialsForIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      get_credentials_for_identity_input ->
        (get_credentials_for_identity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExternalServiceException of external_service_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidIdentityPoolConfigurationException of invalid_identity_pool_configuration_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module DescribeIdentityPool : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_identity_pool_input ->
        (identity_pool,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module DescribeIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_identity_input ->
        (identity_description,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module DeleteIdentityPool : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_identity_pool_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module DeleteIdentities : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_identities_input ->
        (delete_identities_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

module CreateIdentityPool : sig
  val request :
    Smaws_Lib.Context.t ->
      create_identity_pool_input ->
        (identity_pool,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
end

