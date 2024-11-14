open Types 
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

