open Types 
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
  (** 
    Creates a new identity pool. The identity pool is a store of user identity information that is specific to your AWS account. The keys for [SupportedLoginProviders] are as follows:
    
     {ul
          {- Facebook: [graph.facebook.com]
             
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
       You must use AWS Developer credentials to call this API.
        *)

  
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
  (** 
    Deletes identities from an identity pool. You can specify a list of 1-60 identities that you want to delete.
    
     You must use AWS Developer credentials to call this API.
      *)

  
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
  (** 
    Deletes an identity pool. Once a pool is deleted, users will not be able to authenticate with the pool.
    
     You must use AWS Developer credentials to call this API.
      *)

  
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
  (** 
    Returns metadata related to the given identity, including when the identity was created and any associated linked logins.
    
     You must use AWS Developer credentials to call this API.
      *)

  
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
  (** 
    Gets details about a particular identity pool, including the pool name, ID description, creation date, and current number of users.
    
     You must use AWS Developer credentials to call this API.
      *)

  
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
  (** 
    Returns credentials for the provided identity ID. Any provided logins will be validated against supported login providers. If the token is for cognito-identity.amazonaws.com, it will be passed through to AWS Security Token Service with the appropriate role for the token.
    
     This is a public API. You do not need any credentials to call this API.
      *)

  
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
  (** 
    Generates (or retrieves) a Cognito ID. Supplying multiple logins will create an implicit linked account.
    
     This is a public API. You do not need any credentials to call this API.
      *)

  
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
  (** 
    Gets the roles for an identity pool.
    
     You must use AWS Developer credentials to call this API.
      *)

  
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
  (** 
    Gets an OpenID token, using a known Cognito ID. This known Cognito ID is returned by [GetId]. You can optionally add additional logins for the identity. Supplying multiple logins creates an implicit link.
    
     The OpenID token is valid for 10 minutes.
     
      This is a public API. You do not need any credentials to call this API.
       *)

  
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
  [@@ocaml.doc {| 
    Registers (or retrieves) a Cognito [IdentityId] and an OpenID Connect token for a user authenticated by your backend authentication process. Supplying multiple logins will create an implicit linked account. You can only specify one developer provider as part of the [Logins] map, which is linked to the identity pool. The developer provider is the "domain" by which Cognito will refer to your users.
    
     You can use [GetOpenIdTokenForDeveloperIdentity] to create a new identity and to link new logins (that is, user credentials issued by a public provider or developer provider) to an existing identity. When you want to create a new identity, the [IdentityId] should be null. When you want to associate a new login with an existing authenticated/unauthenticated identity, you can do so by providing the existing [IdentityId]. This API will create the identity in the specified [IdentityPoolId].
     
      You must use AWS Developer credentials to call this API.
       |}]

  
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
  (** 
    Use [GetPrincipalTagAttributeMap] to list all mappings between [PrincipalTags] and user attributes.
     *)

  
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
  (** 
    Lists the identities in an identity pool.
    
     You must use AWS Developer credentials to call this API.
      *)

  
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
  (** 
    Lists all of the Cognito identity pools registered for your account.
    
     You must use AWS Developer credentials to call this API.
      *)

  
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
  (** 
    Lists the tags that are assigned to an Amazon Cognito identity pool.
    
     A tag is a label that you can apply to identity pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.
     
      You can use this action up to 10 times per second, per account.
       *)

  
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
  (** 
    Retrieves the [IdentityID] associated with a [DeveloperUserIdentifier] or the list of [DeveloperUserIdentifier] values associated with an [IdentityId] for an existing identity. Either [IdentityID] or [DeveloperUserIdentifier] must not be null. If you supply only one of these values, the other value will be searched in the database and returned as a part of the response. If you supply both, [DeveloperUserIdentifier] will be matched against [IdentityID]. If the values are verified against the database, the response returns both values and is the same as the request. Otherwise a [ResourceConflictException] is thrown.
    
     [LookupDeveloperIdentity] is intended for low-throughput control plane operations: for example, to enable customer service to locate an identity ID by username. If you are using it for higher-volume operations such as user authentication, your requests are likely to be throttled. [GetOpenIdTokenForDeveloperIdentity] is a better option for higher-volume operations for user authentication.
     
      You must use AWS Developer credentials to call this API.
       *)

  
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
  (** 
    Merges two users having different [IdentityId]s, existing in the same identity pool, and identified by the same developer provider. You can use this action to request that discrete users be merged and identified as a single user in the Cognito environment. Cognito associates the given source user ([SourceUserIdentifier]) with the [IdentityId] of the [DestinationUserIdentifier]. Only developer-authenticated users can be merged. If the users to be merged are associated with the same public provider, but as two different users, an exception will be thrown.
    
     The number of linked logins is limited to 20. So, the number of linked logins for the source user, [SourceUserIdentifier], and the destination user, [DestinationUserIdentifier], together should not be larger than 20. Otherwise, an exception will be thrown.
     
      You must use AWS Developer credentials to call this API.
       *)

  
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
  (** 
    Sets the roles for an identity pool. These roles are used when making calls to [GetCredentialsForIdentity] action.
    
     You must use AWS Developer credentials to call this API.
      *)

  
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
  (** 
    You can use this operation to use default (username and clientID) attribute or custom attribute mappings.
     *)

  
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
  (** 
    Assigns a set of tags to the specified Amazon Cognito identity pool. A tag is a label that you can use to categorize and manage identity pools in different ways, such as by purpose, owner, environment, or other criteria.
    
     Each tag consists of a key and value, both of which you define. A key is a general category for more specific values. For example, if you have two versions of an identity pool, one for testing and another for production, you might assign an [Environment] tag key to both identity pools. The value of this key might be [Test] for one identity pool and [Production] for the other.
     
      Tags are useful for cost tracking and access control. You can activate your tags so that they appear on the Billing and Cost Management console, where you can track the costs associated with your identity pools. In an IAM policy, you can constrain permissions for identity pools based on specific tags or tag values.
      
       You can use this action up to 5 times per second, per account. An identity pool can have as many as 50 tags.
        *)

  
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
  (** 
    Unlinks a [DeveloperUserIdentifier] from an existing identity. Unlinked developer users will be considered new identities next time they are seen. If, for a given Cognito identity, you remove all federated identities as well as the developer user identifier, the Cognito identity becomes inaccessible.
    
     You must use AWS Developer credentials to call this API.
      *)

  
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
  (** 
    Unlinks a federated identity from an existing account. Unlinked logins will be considered new identities next time they are seen. Removing the last linked login will make this identity inaccessible.
    
     This is a public API. You do not need any credentials to call this API.
      *)

  
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
  (** 
    Removes the specified tags from the specified Amazon Cognito identity pool. You can use this action up to 5 times per second, per account
     *)

  
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
  (** 
    Updates an identity pool.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

