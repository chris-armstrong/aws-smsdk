open Types 
let (let+) res map = Result.map map res
module VerifyMac = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidMacException" ->
         (`KMSInvalidMacException (kms_invalid_mac_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: verify_mac_request) ->
    let input = Serializers.verify_mac_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.VerifyMac" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.verify_mac_response_of_yojson
      ~error_deserializer
      
end

module Verify = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidSignatureException" ->
         (`KMSInvalidSignatureException (kms_invalid_signature_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: verify_request) ->
    let input = Serializers.verify_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.Verify" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.verify_response_of_yojson
      ~error_deserializer
      
end

module UpdatePrimaryRegion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_primary_region_request) ->
    let input = Serializers.update_primary_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.UpdatePrimaryRegion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UpdateKeyDescription = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_key_description_request) ->
    let input = Serializers.update_key_description_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.UpdateKeyDescription" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UpdateCustomKeyStore = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "CloudHsmClusterInvalidConfigurationException" ->
         (`CloudHsmClusterInvalidConfigurationException (cloud_hsm_cluster_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CloudHsmClusterNotActiveException" ->
         (`CloudHsmClusterNotActiveException (cloud_hsm_cluster_not_active_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CloudHsmClusterNotFoundException" ->
         (`CloudHsmClusterNotFoundException (cloud_hsm_cluster_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CloudHsmClusterNotRelatedException" ->
         (`CloudHsmClusterNotRelatedException (cloud_hsm_cluster_not_related_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreInvalidStateException" ->
         (`CustomKeyStoreInvalidStateException (custom_key_store_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreNameInUseException" ->
         (`CustomKeyStoreNameInUseException (custom_key_store_name_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreNotFoundException" ->
         (`CustomKeyStoreNotFoundException (custom_key_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyIncorrectAuthenticationCredentialException" ->
         (`XksProxyIncorrectAuthenticationCredentialException (xks_proxy_incorrect_authentication_credential_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyInvalidConfigurationException" ->
         (`XksProxyInvalidConfigurationException (xks_proxy_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyInvalidResponseException" ->
         (`XksProxyInvalidResponseException (xks_proxy_invalid_response_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyUriEndpointInUseException" ->
         (`XksProxyUriEndpointInUseException (xks_proxy_uri_endpoint_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyUriInUseException" ->
         (`XksProxyUriInUseException (xks_proxy_uri_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyUriUnreachableException" ->
         (`XksProxyUriUnreachableException (xks_proxy_uri_unreachable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyVpcEndpointServiceInUseException" ->
         (`XksProxyVpcEndpointServiceInUseException (xks_proxy_vpc_endpoint_service_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyVpcEndpointServiceInvalidConfigurationException" ->
         (`XksProxyVpcEndpointServiceInvalidConfigurationException (xks_proxy_vpc_endpoint_service_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyVpcEndpointServiceNotFoundException" ->
         (`XksProxyVpcEndpointServiceNotFoundException (xks_proxy_vpc_endpoint_service_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_custom_key_store_request) ->
    let input = Serializers.update_custom_key_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.UpdateCustomKeyStore" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_custom_key_store_response_of_yojson
      ~error_deserializer
      
end

module UpdateAlias = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_alias_request) ->
    let input = Serializers.update_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.UpdateAlias" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "TagException" ->
         (`TagException (tag_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.UntagResource" 
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
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "TagException" ->
         (`TagException (tag_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module Sign = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: sign_request) ->
    let input = Serializers.sign_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.Sign" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.sign_response_of_yojson
      ~error_deserializer
      
end

module ScheduleKeyDeletion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: schedule_key_deletion_request) ->
    let input = Serializers.schedule_key_deletion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ScheduleKeyDeletion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.schedule_key_deletion_response_of_yojson
      ~error_deserializer
      
end

module RotateKeyOnDemand = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: rotate_key_on_demand_request) ->
    let input = Serializers.rotate_key_on_demand_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.RotateKeyOnDemand" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.rotate_key_on_demand_response_of_yojson
      ~error_deserializer
      
end

module RevokeGrant = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantIdException" ->
         (`InvalidGrantIdException (invalid_grant_id_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: revoke_grant_request) ->
    let input = Serializers.revoke_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.RevokeGrant" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RetireGrant = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantIdException" ->
         (`InvalidGrantIdException (invalid_grant_id_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: retire_grant_request) ->
    let input = Serializers.retire_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.RetireGrant" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module ReplicateKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "AlreadyExistsException" ->
         (`AlreadyExistsException (already_exists_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kms", "MalformedPolicyDocumentException" ->
         (`MalformedPolicyDocumentException (malformed_policy_document_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "TagException" ->
         (`TagException (tag_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: replicate_key_request) ->
    let input = Serializers.replicate_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ReplicateKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.replicate_key_response_of_yojson
      ~error_deserializer
      
end

module ReEncrypt = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "IncorrectKeyException" ->
         (`IncorrectKeyException (incorrect_key_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidCiphertextException" ->
         (`InvalidCiphertextException (invalid_ciphertext_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: re_encrypt_request) ->
    let input = Serializers.re_encrypt_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ReEncrypt" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.re_encrypt_response_of_yojson
      ~error_deserializer
      
end

module PutKeyPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kms", "MalformedPolicyDocumentException" ->
         (`MalformedPolicyDocumentException (malformed_policy_document_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_key_policy_request) ->
    let input = Serializers.put_key_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.PutKeyPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module ListRetirableGrants = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidMarkerException" ->
         (`InvalidMarkerException (invalid_marker_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_retirable_grants_request) ->
    let input = Serializers.list_retirable_grants_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ListRetirableGrants" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_grants_response_of_yojson
      ~error_deserializer
      
end

module ListResourceTags = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidMarkerException" ->
         (`InvalidMarkerException (invalid_marker_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_resource_tags_request) ->
    let input = Serializers.list_resource_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ListResourceTags" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_resource_tags_response_of_yojson
      ~error_deserializer
      
end

module ListKeys = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidMarkerException" ->
         (`InvalidMarkerException (invalid_marker_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_keys_request) ->
    let input = Serializers.list_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ListKeys" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_keys_response_of_yojson
      ~error_deserializer
      
end

module ListKeyRotations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidMarkerException" ->
         (`InvalidMarkerException (invalid_marker_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_key_rotations_request) ->
    let input = Serializers.list_key_rotations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ListKeyRotations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_key_rotations_response_of_yojson
      ~error_deserializer
      
end

module ListKeyPolicies = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_key_policies_request) ->
    let input = Serializers.list_key_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ListKeyPolicies" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_key_policies_response_of_yojson
      ~error_deserializer
      
end

module ListGrants = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantIdException" ->
         (`InvalidGrantIdException (invalid_grant_id_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidMarkerException" ->
         (`InvalidMarkerException (invalid_marker_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_grants_request) ->
    let input = Serializers.list_grants_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ListGrants" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_grants_response_of_yojson
      ~error_deserializer
      
end

module ListAliases = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidMarkerException" ->
         (`InvalidMarkerException (invalid_marker_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_aliases_request) ->
    let input = Serializers.list_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ListAliases" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_aliases_response_of_yojson
      ~error_deserializer
      
end

module ImportKeyMaterial = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "ExpiredImportTokenException" ->
         (`ExpiredImportTokenException (expired_import_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "IncorrectKeyMaterialException" ->
         (`IncorrectKeyMaterialException (incorrect_key_material_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidCiphertextException" ->
         (`InvalidCiphertextException (invalid_ciphertext_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidImportTokenException" ->
         (`InvalidImportTokenException (invalid_import_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: import_key_material_request) ->
    let input = Serializers.import_key_material_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ImportKeyMaterial" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.import_key_material_response_of_yojson
      ~error_deserializer
      
end

module GetPublicKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_public_key_request) ->
    let input = Serializers.get_public_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.GetPublicKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_public_key_response_of_yojson
      ~error_deserializer
      
end

module GetParametersForImport = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_parameters_for_import_request) ->
    let input = Serializers.get_parameters_for_import_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.GetParametersForImport" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_parameters_for_import_response_of_yojson
      ~error_deserializer
      
end

module GetKeyRotationStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_key_rotation_status_request) ->
    let input = Serializers.get_key_rotation_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.GetKeyRotationStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_key_rotation_status_response_of_yojson
      ~error_deserializer
      
end

module GetKeyPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_key_policy_request) ->
    let input = Serializers.get_key_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.GetKeyPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_key_policy_response_of_yojson
      ~error_deserializer
      
end

module GenerateRandom = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "CustomKeyStoreInvalidStateException" ->
         (`CustomKeyStoreInvalidStateException (custom_key_store_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreNotFoundException" ->
         (`CustomKeyStoreNotFoundException (custom_key_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: generate_random_request) ->
    let input = Serializers.generate_random_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.GenerateRandom" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.generate_random_response_of_yojson
      ~error_deserializer
      
end

module GenerateMac = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: generate_mac_request) ->
    let input = Serializers.generate_mac_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.GenerateMac" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.generate_mac_response_of_yojson
      ~error_deserializer
      
end

module GenerateDataKeyWithoutPlaintext = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: generate_data_key_without_plaintext_request) ->
    let input = Serializers.generate_data_key_without_plaintext_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.GenerateDataKeyWithoutPlaintext" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.generate_data_key_without_plaintext_response_of_yojson
      ~error_deserializer
      
end

module GenerateDataKeyPairWithoutPlaintext = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: generate_data_key_pair_without_plaintext_request) ->
    let input = Serializers.generate_data_key_pair_without_plaintext_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.GenerateDataKeyPairWithoutPlaintext" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.generate_data_key_pair_without_plaintext_response_of_yojson
      ~error_deserializer
      
end

module GenerateDataKeyPair = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: generate_data_key_pair_request) ->
    let input = Serializers.generate_data_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.GenerateDataKeyPair" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.generate_data_key_pair_response_of_yojson
      ~error_deserializer
      
end

module GenerateDataKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: generate_data_key_request) ->
    let input = Serializers.generate_data_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.GenerateDataKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.generate_data_key_response_of_yojson
      ~error_deserializer
      
end

module Encrypt = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: encrypt_request) ->
    let input = Serializers.encrypt_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.Encrypt" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.encrypt_response_of_yojson
      ~error_deserializer
      
end

module EnableKeyRotation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_key_rotation_request) ->
    let input = Serializers.enable_key_rotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.EnableKeyRotation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module EnableKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_key_request) ->
    let input = Serializers.enable_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.EnableKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DisconnectCustomKeyStore = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "CustomKeyStoreInvalidStateException" ->
         (`CustomKeyStoreInvalidStateException (custom_key_store_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreNotFoundException" ->
         (`CustomKeyStoreNotFoundException (custom_key_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disconnect_custom_key_store_request) ->
    let input = Serializers.disconnect_custom_key_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.DisconnectCustomKeyStore" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disconnect_custom_key_store_response_of_yojson
      ~error_deserializer
      
end

module DisableKeyRotation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_key_rotation_request) ->
    let input = Serializers.disable_key_rotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.DisableKeyRotation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DisableKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_key_request) ->
    let input = Serializers.disable_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.DisableKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DescribeKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_key_request) ->
    let input = Serializers.describe_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.DescribeKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_key_response_of_yojson
      ~error_deserializer
      
end

module DescribeCustomKeyStores = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "CustomKeyStoreNotFoundException" ->
         (`CustomKeyStoreNotFoundException (custom_key_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidMarkerException" ->
         (`InvalidMarkerException (invalid_marker_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_custom_key_stores_request) ->
    let input = Serializers.describe_custom_key_stores_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.DescribeCustomKeyStores" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_custom_key_stores_response_of_yojson
      ~error_deserializer
      
end

module DeriveSharedSecret = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: derive_shared_secret_request) ->
    let input = Serializers.derive_shared_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.DeriveSharedSecret" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.derive_shared_secret_response_of_yojson
      ~error_deserializer
      
end

module DeleteImportedKeyMaterial = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_imported_key_material_request) ->
    let input = Serializers.delete_imported_key_material_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.DeleteImportedKeyMaterial" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteCustomKeyStore = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "CustomKeyStoreHasCMKsException" ->
         (`CustomKeyStoreHasCMKsException (custom_key_store_has_cm_ks_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreInvalidStateException" ->
         (`CustomKeyStoreInvalidStateException (custom_key_store_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreNotFoundException" ->
         (`CustomKeyStoreNotFoundException (custom_key_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_custom_key_store_request) ->
    let input = Serializers.delete_custom_key_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.DeleteCustomKeyStore" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_custom_key_store_response_of_yojson
      ~error_deserializer
      
end

module DeleteAlias = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_alias_request) ->
    let input = Serializers.delete_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.DeleteAlias" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module Decrypt = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "IncorrectKeyException" ->
         (`IncorrectKeyException (incorrect_key_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidCiphertextException" ->
         (`InvalidCiphertextException (invalid_ciphertext_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidKeyUsageException" ->
         (`InvalidKeyUsageException (invalid_key_usage_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KeyUnavailableException" ->
         (`KeyUnavailableException (key_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: decrypt_request) ->
    let input = Serializers.decrypt_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.Decrypt" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.decrypt_response_of_yojson
      ~error_deserializer
      
end

module CreateKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "CloudHsmClusterInvalidConfigurationException" ->
         (`CloudHsmClusterInvalidConfigurationException (cloud_hsm_cluster_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreInvalidStateException" ->
         (`CustomKeyStoreInvalidStateException (custom_key_store_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreNotFoundException" ->
         (`CustomKeyStoreNotFoundException (custom_key_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kms", "MalformedPolicyDocumentException" ->
         (`MalformedPolicyDocumentException (malformed_policy_document_exception_of_yojson tree path))
      | "com.amazonaws.kms", "TagException" ->
         (`TagException (tag_exception_of_yojson tree path))
      | "com.amazonaws.kms", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksKeyAlreadyInUseException" ->
         (`XksKeyAlreadyInUseException (xks_key_already_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksKeyInvalidConfigurationException" ->
         (`XksKeyInvalidConfigurationException (xks_key_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksKeyNotFoundException" ->
         (`XksKeyNotFoundException (xks_key_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_key_request) ->
    let input = Serializers.create_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.CreateKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_key_response_of_yojson
      ~error_deserializer
      
end

module CreateGrant = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DisabledException" ->
         (`DisabledException (disabled_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DryRunOperationException" ->
         (`DryRunOperationException (dry_run_operation_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidGrantTokenException" ->
         (`InvalidGrantTokenException (invalid_grant_token_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_grant_request) ->
    let input = Serializers.create_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.CreateGrant" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_grant_response_of_yojson
      ~error_deserializer
      
end

module CreateCustomKeyStore = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "CloudHsmClusterInUseException" ->
         (`CloudHsmClusterInUseException (cloud_hsm_cluster_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CloudHsmClusterInvalidConfigurationException" ->
         (`CloudHsmClusterInvalidConfigurationException (cloud_hsm_cluster_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CloudHsmClusterNotActiveException" ->
         (`CloudHsmClusterNotActiveException (cloud_hsm_cluster_not_active_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CloudHsmClusterNotFoundException" ->
         (`CloudHsmClusterNotFoundException (cloud_hsm_cluster_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreNameInUseException" ->
         (`CustomKeyStoreNameInUseException (custom_key_store_name_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kms", "IncorrectTrustAnchorException" ->
         (`IncorrectTrustAnchorException (incorrect_trust_anchor_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyIncorrectAuthenticationCredentialException" ->
         (`XksProxyIncorrectAuthenticationCredentialException (xks_proxy_incorrect_authentication_credential_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyInvalidConfigurationException" ->
         (`XksProxyInvalidConfigurationException (xks_proxy_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyInvalidResponseException" ->
         (`XksProxyInvalidResponseException (xks_proxy_invalid_response_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyUriEndpointInUseException" ->
         (`XksProxyUriEndpointInUseException (xks_proxy_uri_endpoint_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyUriInUseException" ->
         (`XksProxyUriInUseException (xks_proxy_uri_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyUriUnreachableException" ->
         (`XksProxyUriUnreachableException (xks_proxy_uri_unreachable_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyVpcEndpointServiceInUseException" ->
         (`XksProxyVpcEndpointServiceInUseException (xks_proxy_vpc_endpoint_service_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyVpcEndpointServiceInvalidConfigurationException" ->
         (`XksProxyVpcEndpointServiceInvalidConfigurationException (xks_proxy_vpc_endpoint_service_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.kms", "XksProxyVpcEndpointServiceNotFoundException" ->
         (`XksProxyVpcEndpointServiceNotFoundException (xks_proxy_vpc_endpoint_service_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_custom_key_store_request) ->
    let input = Serializers.create_custom_key_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.CreateCustomKeyStore" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_custom_key_store_response_of_yojson
      ~error_deserializer
      
end

module CreateAlias = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "AlreadyExistsException" ->
         (`AlreadyExistsException (already_exists_exception_of_yojson tree path))
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidAliasNameException" ->
         (`InvalidAliasNameException (invalid_alias_name_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_alias_request) ->
    let input = Serializers.create_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.CreateAlias" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module ConnectCustomKeyStore = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "CloudHsmClusterInvalidConfigurationException" ->
         (`CloudHsmClusterInvalidConfigurationException (cloud_hsm_cluster_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CloudHsmClusterNotActiveException" ->
         (`CloudHsmClusterNotActiveException (cloud_hsm_cluster_not_active_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreInvalidStateException" ->
         (`CustomKeyStoreInvalidStateException (custom_key_store_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "CustomKeyStoreNotFoundException" ->
         (`CustomKeyStoreNotFoundException (custom_key_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: connect_custom_key_store_request) ->
    let input = Serializers.connect_custom_key_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.ConnectCustomKeyStore" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.connect_custom_key_store_response_of_yojson
      ~error_deserializer
      
end

module CancelKeyDeletion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kms", "DependencyTimeoutException" ->
         (`DependencyTimeoutException (dependency_timeout_exception_of_yojson tree path))
      | "com.amazonaws.kms", "InvalidArnException" ->
         (`InvalidArnException (invalid_arn_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInternalException" ->
         (`KMSInternalException (kms_internal_exception_of_yojson tree path))
      | "com.amazonaws.kms", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kms", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_key_deletion_request) ->
    let input = Serializers.cancel_key_deletion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"TrentService.CancelKeyDeletion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_key_deletion_response_of_yojson
      ~error_deserializer
      
end

