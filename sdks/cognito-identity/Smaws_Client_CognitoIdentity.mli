(** 
    Cognito Identity client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(**{|
    Thrown when a request is throttled.|}*)
type too_many_requests_exception = {
  message: string option;
   (**{|
    Message returned by a TooManyRequestsException|}*)

}

(**{|
    Thrown when the requested resource (for example, a dataset or record)
    does not exist.|}*)
type resource_not_found_exception = {
  message: string option;
   (**{|
    The message returned by a ResourceNotFoundException.|}*)

}

(**{|
    Thrown when a user tries to use a login which is already linked to
    another account.|}*)
type resource_conflict_exception = {
  message: string option;
   (**{|
    The message returned by a ResourceConflictException.|}*)

}

(**{|
    Thrown when a user is not authorized to access the requested resource.|}*)
type not_authorized_exception = {
  message: string option;
   (**{|
    The message returned by a NotAuthorizedException|}*)

}

(**{|
    Thrown when the total number of user pools has exceeded a preset limit.|}*)
type limit_exceeded_exception = {
  message: string option;
   (**{|
    The message returned by a LimitExceededException.|}*)

}

(**{|
    Thrown for missing or bad input parameter(s).|}*)
type invalid_parameter_exception = {
  message: string option;
   (**{|
    The message returned by an InvalidParameterException.|}*)

}

(**{|
    Thrown when the service encounters an error during processing the request.|}*)
type internal_error_exception = {
  message: string option;
   (**{|
    The message returned by an InternalErrorException.|}*)

}

(**{|
    Thrown if there are parallel requests to modify a resource.|}*)
type concurrent_modification_exception = {
  message: string option;
   (**{|
    The message returned by a ConcurrentModificationException.|}*)

}

(**{|
    A provider representing an Amazon Cognito user pool and its client ID.|}*)
type cognito_identity_provider = {
  server_side_token_check: bool option;
   (**{|
    TRUE if server-side token validation is enabled for the identity
    provider’s token.
    
    Once you set [ServerSideTokenCheck] to TRUE for an identity pool, that
    identity pool will check with the integrated user pools to make sure that
    the user has not been globally signed out or deleted before the identity
    pool provides an OIDC token or AWS credentials for the user.
    
    If the user is signed out or deleted, the identity pool will return a 400
    Not Authorized error.|}*)

  client_id: string option;
   (**{|
    The client ID for the Amazon Cognito user pool.|}*)

  provider_name: string option;
   (**{|
    The provider name for an Amazon Cognito user pool. For example,
    [cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789].|}*)

}

(**{|
    An object representing an Amazon Cognito identity pool.|}*)
type identity_pool = {
  identity_pool_tags: (string * string) list option;
   (**{|
    The tags that are assigned to the identity pool. A tag is a label that
    you can apply to identity pools to categorize and manage them in
    different ways, such as by purpose, owner, environment, or other
    criteria.|}*)

  saml_provider_ar_ns: string list option;
   (**{|
    An array of Amazon Resource Names (ARNs) of the SAML provider for your
    identity pool.|}*)

  cognito_identity_providers: cognito_identity_provider list option;
   (**{|
    A list representing an Amazon Cognito user pool and its client ID.|}*)

  open_id_connect_provider_ar_ns: string list option;
   (**{|
    The ARNs of the OpenID Connect providers.|}*)

  developer_provider_name: string option;
   (**{|
    The "domain" by which Cognito will refer to your users.|}*)

  supported_login_providers: (string * string) list option;
   (**{|
    Optional key:value pairs mapping provider names to provider app IDs.|}*)

  allow_classic_flow: bool option;
   (**{|
    Enables or disables the Basic (Classic) authentication flow. For more
    information, see
    {{: https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html }Identity
    Pools (Federated Identities) Authentication Flow} in the {i Amazon
    Cognito Developer Guide}.|}*)

  allow_unauthenticated_identities: bool;
   (**{|
    TRUE if the identity pool supports unauthenticated logins.|}*)

  identity_pool_name: string;
   (**{|
    A string that you provide.|}*)

  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

type untag_resource_response = unit

type untag_resource_input = {
  tag_keys: string list;
   (**{|
    The keys of the tags to remove from the user pool.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the identity pool.|}*)

}

type error_code = | INTERNAL_SERVER_ERROR
  | ACCESS_DENIED

(**{|
    An array of UnprocessedIdentityId objects, each of which contains an
    ErrorCode and IdentityId.|}*)
type unprocessed_identity_id = {
  error_code: error_code option;
   (**{|
    The error code indicating the type of error that occurred.|}*)

  identity_id: string option;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    Input to the UnlinkIdentity action.|}*)
type unlink_identity_input = {
  logins_to_remove: string list;
   (**{|
    Provider names to unlink from this identity.|}*)

  logins: (string * string) list;
   (**{|
    A set of optional name-value pairs that map provider names to provider
    tokens.|}*)

  identity_id: string;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    An exception thrown when a dependent service such as Facebook or Twitter
    is not responding|}*)
type external_service_exception = {
  message: string option;
   (**{|
    The message returned by an ExternalServiceException|}*)

}

(**{|
    Input to the [UnlinkDeveloperIdentity] action.|}*)
type unlink_developer_identity_input = {
  developer_user_identifier: string;
   (**{|
    A unique ID used by your backend authentication process to identify a
    user.|}*)

  developer_provider_name: string;
   (**{|
    The "domain" by which Cognito will refer to your users.|}*)

  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

  identity_id: string;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

type tag_resource_response = unit

type tag_resource_input = {
  tags: (string * string) list;
   (**{|
    The tags to assign to the identity pool.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the identity pool.|}*)

}

type set_principal_tag_attribute_map_response = {
  principal_tags: (string * string) list option;
   (**{|
    You can use this operation to add principal tags. The
    [PrincipalTags]operation enables you to reference user attributes in your
    IAM permissions policy.|}*)

  use_defaults: bool option;
   (**{|
    You can use this operation to select default (username and clientID)
    attribute mappings.|}*)

  identity_provider_name: string option;
   (**{|
    The provider name you want to use for attribute mappings.|}*)

  identity_pool_id: string option;
   (**{|
    The ID of the Identity Pool you want to set attribute mappings for.|}*)

}

type set_principal_tag_attribute_map_input = {
  principal_tags: (string * string) list option;
   (**{|
    You can use this operation to add principal tags.|}*)

  use_defaults: bool option;
   (**{|
    You can use this operation to use default (username and clientID)
    attribute mappings.|}*)

  identity_provider_name: string;
   (**{|
    The provider name you want to use for attribute mappings.|}*)

  identity_pool_id: string;
   (**{|
    The ID of the Identity Pool you want to set attribute mappings for.|}*)

}

type role_mapping_type = | RULES
  | TOKEN

type ambiguous_role_resolution_type = | DENY
  | AUTHENTICATED_ROLE

type mapping_rule_match_type = | NOT_EQUAL
  | STARTS_WITH
  | CONTAINS
  | EQUALS

(**{|
    A rule that maps a claim name, a claim value, and a match type to a role
    ARN.|}*)
type mapping_rule = {
  role_ar_n: string;
   (**{|
    The role ARN.|}*)

  value: string;
   (**{|
    A brief string that the claim must match, for example, "paid" or "yes".|}*)

  match_type: mapping_rule_match_type;
   (**{|
    The match condition that specifies how closely the claim value in the IdP
    token must match [Value].|}*)

  claim: string;
   (**{|
    The claim name that must be present in the token, for example, "isAdmin"
    or "paid".|}*)

}

(**{|
    A container for rules.|}*)
type rules_configuration_type = {
  rules: mapping_rule list;
   (**{|
    An array of rules. You can specify up to 25 rules per identity provider.
    
    Rules are evaluated in order. The first one to match specifies the role.|}*)

}

(**{|
    A role mapping.|}*)
type role_mapping = {
  rules_configuration: rules_configuration_type option;
   (**{|
    The rules to be used for mapping users to roles.
    
    If you specify Rules as the role mapping type, [RulesConfiguration] is
    required.|}*)

  ambiguous_role_resolution: ambiguous_role_resolution_type option;
   (**{|
    If you specify Token or Rules as the [Type], [AmbiguousRoleResolution] is
    required.
    
    Specifies the action to be taken if either no rules match the claim value
    for the [Rules] type, or there is no [cognito:preferred_role] claim and
    there are multiple [cognito:roles] matches for the [Token] type.|}*)

  type_: role_mapping_type;
   (**{|
    The role mapping type. Token will use [cognito:roles] and
    [cognito:preferred_role] claims from the Cognito identity provider token
    to map groups to roles. Rules will attempt to match claims from the token
    to map to a role.|}*)

}

(**{|
    Input to the [SetIdentityPoolRoles] action.|}*)
type set_identity_pool_roles_input = {
  role_mappings: (string * role_mapping) list option;
   (**{|
    How users for a specific identity provider are to mapped to roles. This
    is a string to {{:  }RoleMapping} object map. The string identifies the
    identity provider, for example, "graph.facebook.com" or
    "cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id".
    
    Up to 25 rules can be specified per identity provider.|}*)

  roles: (string * string) list;
   (**{|
    The map of roles associated with this pool. For a given role, the key
    will be either "authenticated" or "unauthenticated" and the value will be
    the Role ARN.|}*)

  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

(**{|
    Returned in response to a successful [MergeDeveloperIdentities] action.|}*)
type merge_developer_identities_response = {
  identity_id: string option;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    Input to the [MergeDeveloperIdentities] action.|}*)
type merge_developer_identities_input = {
  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

  developer_provider_name: string;
   (**{|
    The "domain" by which Cognito will refer to your users. This is a
    (pseudo) domain name that you provide while creating an identity pool.
    This name acts as a placeholder that allows your backend and the Cognito
    service to communicate about the developer provider. For the
    [DeveloperProviderName], you can use letters as well as period (.),
    underscore (_), and dash (-).|}*)

  destination_user_identifier: string;
   (**{|
    User identifier for the destination user. The value should be a
    [DeveloperUserIdentifier].|}*)

  source_user_identifier: string;
   (**{|
    User identifier for the source user. The value should be a
    [DeveloperUserIdentifier].|}*)

}

(**{|
    Returned in response to a successful [LookupDeveloperIdentity] action.|}*)
type lookup_developer_identity_response = {
  next_token: string option;
   (**{|
    A pagination token. The first call you make will have [NextToken] set to
    null. After that the service will return [NextToken] values as needed.
    For example, let's say you make a request with [MaxResults] set to 10,
    and there are 20 matches in the database. The service will return a
    pagination token as a part of the response. This token can be used to
    call the API again and get results starting from the 11th match.|}*)

  developer_user_identifier_list: string list option;
   (**{|
    This is the list of developer user identifiers associated with an
    identity ID. Cognito supports the association of multiple developer user
    identifiers with an identity ID.|}*)

  identity_id: string option;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    Input to the [LookupDeveloperIdentityInput] action.|}*)
type lookup_developer_identity_input = {
  next_token: string option;
   (**{|
    A pagination token. The first call you make will have [NextToken] set to
    null. After that the service will return [NextToken] values as needed.
    For example, let's say you make a request with [MaxResults] set to 10,
    and there are 20 matches in the database. The service will return a
    pagination token as a part of the response. This token can be used to
    call the API again and get results starting from the 11th match.|}*)

  max_results: int option;
   (**{|
    The maximum number of identities to return.|}*)

  developer_user_identifier: string option;
   (**{|
    A unique ID used by your backend authentication process to identify a
    user. Typically, a developer identity provider would issue many developer
    user identifiers, in keeping with the number of users.|}*)

  identity_id: string option;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

type list_tags_for_resource_response = {
  tags: (string * string) list option;
   (**{|
    The tags that are assigned to the identity pool.|}*)

}

type list_tags_for_resource_input = {
  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the identity pool that the tags are
    assigned to.|}*)

}

(**{|
    A description of the identity pool.|}*)
type identity_pool_short_description = {
  identity_pool_name: string option;
   (**{|
    A string that you provide.|}*)

  identity_pool_id: string option;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

(**{|
    The result of a successful ListIdentityPools action.|}*)
type list_identity_pools_response = {
  next_token: string option;
   (**{|
    A pagination token.|}*)

  identity_pools: identity_pool_short_description list option;
   (**{|
    The identity pools returned by the ListIdentityPools action.|}*)

}

(**{|
    Input to the ListIdentityPools action.|}*)
type list_identity_pools_input = {
  next_token: string option;
   (**{|
    A pagination token.|}*)

  max_results: int;
   (**{|
    The maximum number of identities to return.|}*)

}

(**{|
    A description of the identity.|}*)
type identity_description = {
  last_modified_date: float option;
   (**{|
    Date on which the identity was last modified.|}*)

  creation_date: float option;
   (**{|
    Date on which the identity was created.|}*)

  logins: string list option;
   (**{|
    The provider names.|}*)

  identity_id: string option;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    The response to a ListIdentities request.|}*)
type list_identities_response = {
  next_token: string option;
   (**{|
    A pagination token.|}*)

  identities: identity_description list option;
   (**{|
    An object containing a set of identities and associated mappings.|}*)

  identity_pool_id: string option;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

(**{|
    Input to the ListIdentities action.|}*)
type list_identities_input = {
  hide_disabled: bool option;
   (**{|
    An optional boolean parameter that allows you to hide disabled
    identities. If omitted, the ListIdentities API will include disabled
    identities in the response.|}*)

  next_token: string option;
   (**{|
    A pagination token.|}*)

  max_results: int;
   (**{|
    The maximum number of identities to return.|}*)

  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

(**{|
    Thrown if the identity pool has no role associated for the given auth
    type (auth/unauth) or if the AssumeRole fails.|}*)
type invalid_identity_pool_configuration_exception = {
  message: string option;
   (**{|
    The message returned for an [InvalidIdentityPoolConfigurationException]|}*)

}

type get_principal_tag_attribute_map_response = {
  principal_tags: (string * string) list option;
   (**{|
    You can use this operation to add principal tags. The
    [PrincipalTags]operation enables you to reference user attributes in your
    IAM permissions policy.|}*)

  use_defaults: bool option;
   (**{|
    You can use this operation to list|}*)

  identity_provider_name: string option;
   (**{|
    You can use this operation to get the provider name.|}*)

  identity_pool_id: string option;
   (**{|
    You can use this operation to get the ID of the Identity Pool you setup
    attribute mappings for.|}*)

}

type get_principal_tag_attribute_map_input = {
  identity_provider_name: string;
   (**{|
    You can use this operation to get the provider name.|}*)

  identity_pool_id: string;
   (**{|
    You can use this operation to get the ID of the Identity Pool you setup
    attribute mappings for.|}*)

}

(**{|
    Returned in response to a successful GetOpenIdToken request.|}*)
type get_open_id_token_response = {
  token: string option;
   (**{|
    An OpenID token, valid for 10 minutes.|}*)

  identity_id: string option;
   (**{|
    A unique identifier in the format REGION:GUID. Note that the IdentityId
    returned may not match the one passed on input.|}*)

}

(**{|
    Input to the GetOpenIdToken action.|}*)
type get_open_id_token_input = {
  logins: (string * string) list option;
   (**{|
    A set of optional name-value pairs that map provider names to provider
    tokens. When using graph.facebook.com and www.amazon.com, supply the
    access_token returned from the provider's authflow. For
    accounts.google.com, an Amazon Cognito user pool provider, or any other
    OpenID Connect provider, always include the [id_token].|}*)

  identity_id: string;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    Returned in response to a successful [GetOpenIdTokenForDeveloperIdentity]
    request.|}*)
type get_open_id_token_for_developer_identity_response = {
  token: string option;
   (**{|
    An OpenID token.|}*)

  identity_id: string option;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    Input to the [GetOpenIdTokenForDeveloperIdentity] action.|}*)
type get_open_id_token_for_developer_identity_input = {
  token_duration: int option;
   (**{|
    The expiration time of the token, in seconds. You can specify a custom
    expiration time for the token so that you can cache it. If you don't
    provide an expiration time, the token is valid for 15 minutes. You can
    exchange the token with Amazon STS for temporary AWS credentials, which
    are valid for a maximum of one hour. The maximum token duration you can
    set is 24 hours. You should take care in setting the expiration time for
    a token, as there are significant security implications: an attacker
    could use a leaked token to access your AWS resources for the token's
    duration.
    
    Please provide for a small grace period, usually no more than 5 minutes,
    to account for clock skew.
    |}*)

  principal_tags: (string * string) list option;
   (**{|
    Use this operation to configure attribute mappings for custom providers.|}*)

  logins: (string * string) list;
   (**{|
    A set of optional name-value pairs that map provider names to provider
    tokens. Each name-value pair represents a user from a public provider or
    developer provider. If the user is from a developer provider, the
    name-value pair will follow the syntax ["developer_provider_name":
    "developer_user_identifier"]. The developer provider is the "domain" by
    which Cognito will refer to your users; you provided this domain while
    creating/updating the identity pool. The developer user identifier is an
    identifier from your backend that uniquely identifies a user. When you
    create an identity pool, you can specify the supported logins.|}*)

  identity_id: string option;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

(**{|
    The provided developer user identifier is already registered with Cognito
    under a different identity ID.|}*)
type developer_user_already_registered_exception = {
  message: string option;
   (**{|
    This developer user identifier is already registered with Cognito.|}*)

}

(**{|
    Returned in response to a successful [GetIdentityPoolRoles] operation.|}*)
type get_identity_pool_roles_response = {
  role_mappings: (string * role_mapping) list option;
   (**{|
    How users for a specific identity provider are to mapped to roles. This
    is a String-to-{{:  }RoleMapping} object map. The string identifies the
    identity provider, for example, "graph.facebook.com" or
    "cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id".|}*)

  roles: (string * string) list option;
   (**{|
    The map of roles associated with this pool. Currently only authenticated
    and unauthenticated roles are supported.|}*)

  identity_pool_id: string option;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

(**{|
    Input to the [GetIdentityPoolRoles] action.|}*)
type get_identity_pool_roles_input = {
  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

(**{|
    Returned in response to a GetId request.|}*)
type get_id_response = {
  identity_id: string option;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    Input to the GetId action.|}*)
type get_id_input = {
  logins: (string * string) list option;
   (**{|
    A set of optional name-value pairs that map provider names to provider
    tokens. The available provider names for [Logins] are as follows:
    
    {ol 
          {- Facebook: [graph.facebook.com]
             }
          
          {- Amazon Cognito user pool: [cognito-idp..amazonaws.com/], for
             example,
             [cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789].
             }
          
          {- Google: [accounts.google.com]
             }
          
          {- Amazon: [www.amazon.com]
             }
          
          {- Twitter: [api.twitter.com]
             }
          
          {- Digits: [www.digits.com]
             }
          
    }
    |}*)

  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

  account_id: string option;
   (**{|
    A standard AWS account ID (9+ digits).|}*)

}

(**{|
    Credentials for the provided identity ID.|}*)
type credentials = {
  expiration: float option;
   (**{|
    The date at which these credentials will expire.|}*)

  session_token: string option;
   (**{|
    The Session Token portion of the credentials|}*)

  secret_key: string option;
   (**{|
    The Secret Access Key portion of the credentials|}*)

  access_key_id: string option;
   (**{|
    The Access Key portion of the credentials.|}*)

}

(**{|
    Returned in response to a successful [GetCredentialsForIdentity]
    operation.|}*)
type get_credentials_for_identity_response = {
  credentials: credentials option;
   (**{|
    Credentials for the provided identity ID.|}*)

  identity_id: string option;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    Input to the [GetCredentialsForIdentity] action.|}*)
type get_credentials_for_identity_input = {
  custom_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the role to be assumed when multiple
    roles were received in the token from the identity provider. For example,
    a SAML-based identity provider. This parameter is optional for identity
    providers that do not support role customization.|}*)

  logins: (string * string) list option;
   (**{|
    A set of optional name-value pairs that map provider names to provider
    tokens. The name-value pair will follow the syntax "provider_name":
    "provider_user_identifier".
    
    Logins should not be specified when trying to get credentials for an
    unauthenticated identity.
    
    The Logins parameter is required when using identities associated with
    external identity providers such as Facebook. For examples of [Logins]
    maps, see the code examples in the
    {{: https://docs.aws.amazon.com/cognito/latest/developerguide/external-identity-providers.html }External
    Identity Providers} section of the Amazon Cognito Developer Guide.|}*)

  identity_id: string;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    Input to the DescribeIdentityPool action.|}*)
type describe_identity_pool_input = {
  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

(**{|
    Input to the [DescribeIdentity] action.|}*)
type describe_identity_input = {
  identity_id: string;
   (**{|
    A unique identifier in the format REGION:GUID.|}*)

}

(**{|
    Input to the DeleteIdentityPool action.|}*)
type delete_identity_pool_input = {
  identity_pool_id: string;
   (**{|
    An identity pool ID in the format REGION:GUID.|}*)

}

(**{|
    Returned in response to a successful [DeleteIdentities] operation.|}*)
type delete_identities_response = {
  unprocessed_identity_ids: unprocessed_identity_id list option;
   (**{|
    An array of UnprocessedIdentityId objects, each of which contains an
    ErrorCode and IdentityId.|}*)

}

(**{|
    Input to the [DeleteIdentities] action.|}*)
type delete_identities_input = {
  identity_ids_to_delete: string list;
   (**{|
    A list of 1-60 identities that you want to delete.|}*)

}

(**{|
    Input to the CreateIdentityPool action.|}*)
type create_identity_pool_input = {
  identity_pool_tags: (string * string) list option;
   (**{|
    Tags to assign to the identity pool. A tag is a label that you can apply
    to identity pools to categorize and manage them in different ways, such
    as by purpose, owner, environment, or other criteria.|}*)

  saml_provider_ar_ns: string list option;
   (**{|
    An array of Amazon Resource Names (ARNs) of the SAML provider for your
    identity pool.|}*)

  cognito_identity_providers: cognito_identity_provider list option;
   (**{|
    An array of Amazon Cognito user pools and their client IDs.|}*)

  open_id_connect_provider_ar_ns: string list option;
   (**{|
    The Amazon Resource Names (ARN) of the OpenID Connect providers.|}*)

  developer_provider_name: string option;
   (**{|
    The "domain" by which Cognito will refer to your users. This name acts as
    a placeholder that allows your backend and the Cognito service to
    communicate about the developer provider. For the
    [DeveloperProviderName], you can use letters as well as period ([.]),
    underscore ([_]), and dash ([-]).
    
    Once you have set a developer provider name, you cannot change it. Please
    take care in setting this parameter.|}*)

  supported_login_providers: (string * string) list option;
   (**{|
    Optional key:value pairs mapping provider names to provider app IDs.|}*)

  allow_classic_flow: bool option;
   (**{|
    Enables or disables the Basic (Classic) authentication flow. For more
    information, see
    {{: https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html }Identity
    Pools (Federated Identities) Authentication Flow} in the {i Amazon
    Cognito Developer Guide}.|}*)

  allow_unauthenticated_identities: bool;
   (**{|
    TRUE if the identity pool supports unauthenticated logins.|}*)

  identity_pool_name: string;
   (**{|
    A string that you provide.|}*)

}

(**{|
    Amazon
    Cognito
    Federated
    Identities
    Amazon Cognito Federated Identities is a web service that delivers scoped
    temporary credentials to mobile devices and other untrusted environments.
    It uniquely identifies a device and supplies the user with a consistent
    identity over the lifetime of an application.
    
    Using Amazon Cognito Federated Identities, you can enable authentication
    with one or more third-party identity providers (Facebook, Google, or
    Login with Amazon) or an Amazon Cognito user pool, and you can also
    choose to support unauthenticated access from your app. Cognito delivers
    a unique identifier for each user and acts as an OpenID token provider
    trusted by AWS Security Token Service (STS) to access temporary,
    limited-privilege AWS credentials.
    
    For a description of the authentication flow from the Amazon Cognito
    Developer Guide see
    {{: https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html }Authentication
    Flow}.
    
    For more information see
    {{: https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html }Amazon
    Cognito Federated Identities}.|}*)


type base_document = Json.t

(** {1:builders Builders} *)

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
  unit
-> create_identity_pool_input

(** {1:operations Operations} *)

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

