open Types 
let (let+) res map = Result.map map res
module UpdateIdentityPool = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: identity_pool) ->
    let input = Serializers.identity_pool_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.UpdateIdentityPool" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.identity_pool_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_input) ->
    let input = Serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module UnlinkIdentity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "ExternalServiceException" ->
         (`ExternalServiceException (external_service_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: unlink_identity_input) ->
    let input = Serializers.unlink_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.UnlinkIdentity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UnlinkDeveloperIdentity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: unlink_developer_identity_input) ->
    let input = Serializers.unlink_developer_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.UnlinkDeveloperIdentity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_input) ->
    let input = Serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module SetPrincipalTagAttributeMap = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: set_principal_tag_attribute_map_input) ->
    let input = Serializers.set_principal_tag_attribute_map_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.SetPrincipalTagAttributeMap" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.set_principal_tag_attribute_map_response_of_yojson
      ~error_deserializer
      
end

module SetIdentityPoolRoles = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: set_identity_pool_roles_input) ->
    let input = Serializers.set_identity_pool_roles_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.SetIdentityPoolRoles" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module MergeDeveloperIdentities = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: merge_developer_identities_input) ->
    let input = Serializers.merge_developer_identities_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.MergeDeveloperIdentities" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.merge_developer_identities_response_of_yojson
      ~error_deserializer
      
end

module LookupDeveloperIdentity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: lookup_developer_identity_input) ->
    let input = Serializers.lookup_developer_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.LookupDeveloperIdentity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.lookup_developer_identity_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_input) ->
    let input = Serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListIdentityPools = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_identity_pools_input) ->
    let input = Serializers.list_identity_pools_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.ListIdentityPools" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_identity_pools_response_of_yojson
      ~error_deserializer
      
end

module ListIdentities = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_identities_input) ->
    let input = Serializers.list_identities_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.ListIdentities" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_identities_response_of_yojson
      ~error_deserializer
      
end

module GetPrincipalTagAttributeMap = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_principal_tag_attribute_map_input) ->
    let input = Serializers.get_principal_tag_attribute_map_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.GetPrincipalTagAttributeMap" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_principal_tag_attribute_map_response_of_yojson
      ~error_deserializer
      
end

module GetOpenIdTokenForDeveloperIdentity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "DeveloperUserAlreadyRegisteredException" ->
         (`DeveloperUserAlreadyRegisteredException (developer_user_already_registered_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_open_id_token_for_developer_identity_input) ->
    let input = Serializers.get_open_id_token_for_developer_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.GetOpenIdTokenForDeveloperIdentity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_open_id_token_for_developer_identity_response_of_yojson
      ~error_deserializer
      
end

module GetOpenIdToken = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "ExternalServiceException" ->
         (`ExternalServiceException (external_service_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_open_id_token_input) ->
    let input = Serializers.get_open_id_token_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.GetOpenIdToken" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_open_id_token_response_of_yojson
      ~error_deserializer
      
end

module GetIdentityPoolRoles = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_identity_pool_roles_input) ->
    let input = Serializers.get_identity_pool_roles_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.GetIdentityPoolRoles" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_identity_pool_roles_response_of_yojson
      ~error_deserializer
      
end

module GetId = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "ExternalServiceException" ->
         (`ExternalServiceException (external_service_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_id_input) ->
    let input = Serializers.get_id_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.GetId" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_id_response_of_yojson
      ~error_deserializer
      
end

module GetCredentialsForIdentity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "ExternalServiceException" ->
         (`ExternalServiceException (external_service_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidIdentityPoolConfigurationException" ->
         (`InvalidIdentityPoolConfigurationException (invalid_identity_pool_configuration_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_credentials_for_identity_input) ->
    let input = Serializers.get_credentials_for_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.GetCredentialsForIdentity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_credentials_for_identity_response_of_yojson
      ~error_deserializer
      
end

module DescribeIdentityPool = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_identity_pool_input) ->
    let input = Serializers.describe_identity_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.DescribeIdentityPool" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.identity_pool_of_yojson
      ~error_deserializer
      
end

module DescribeIdentity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_identity_input) ->
    let input = Serializers.describe_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.DescribeIdentity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.identity_description_of_yojson
      ~error_deserializer
      
end

module DeleteIdentityPool = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_identity_pool_input) ->
    let input = Serializers.delete_identity_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.DeleteIdentityPool" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteIdentities = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_identities_input) ->
    let input = Serializers.delete_identities_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.DeleteIdentities" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_identities_response_of_yojson
      ~error_deserializer
      
end

module CreateIdentityPool = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cognitoidentity", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "ResourceConflictException" ->
         (`ResourceConflictException (resource_conflict_exception_of_yojson tree path))
      | "com.amazonaws.cognitoidentity", "TooManyRequestsException" ->
         (`TooManyRequestsException (too_many_requests_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_identity_pool_input) ->
    let input = Serializers.create_identity_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSCognitoIdentityService.CreateIdentityPool" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.identity_pool_of_yojson
      ~error_deserializer
      
end

