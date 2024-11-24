open Types 
module CancelKeyDeletion : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_key_deletion_request ->
        (cancel_key_deletion_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module ConnectCustomKeyStore : sig
  val request :
    Smaws_Lib.Context.t ->
      connect_custom_key_store_request ->
        (connect_custom_key_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudHsmClusterInvalidConfigurationException of cloud_hsm_cluster_invalid_configuration_exception
            | `CloudHsmClusterNotActiveException of cloud_hsm_cluster_not_active_exception
            | `CustomKeyStoreInvalidStateException of custom_key_store_invalid_state_exception
            | `CustomKeyStoreNotFoundException of custom_key_store_not_found_exception
            | `KMSInternalException of kms_internal_exception
            
        ]
      ) result
end

module CreateAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_alias_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AlreadyExistsException of already_exists_exception
            | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidAliasNameException of invalid_alias_name_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module CreateCustomKeyStore : sig
  val request :
    Smaws_Lib.Context.t ->
      create_custom_key_store_request ->
        (create_custom_key_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudHsmClusterInUseException of cloud_hsm_cluster_in_use_exception
            | `CloudHsmClusterInvalidConfigurationException of cloud_hsm_cluster_invalid_configuration_exception
            | `CloudHsmClusterNotActiveException of cloud_hsm_cluster_not_active_exception
            | `CloudHsmClusterNotFoundException of cloud_hsm_cluster_not_found_exception
            | `CustomKeyStoreNameInUseException of custom_key_store_name_in_use_exception
            | `IncorrectTrustAnchorException of incorrect_trust_anchor_exception
            | `KMSInternalException of kms_internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `XksProxyIncorrectAuthenticationCredentialException of xks_proxy_incorrect_authentication_credential_exception
            | `XksProxyInvalidConfigurationException of xks_proxy_invalid_configuration_exception
            | `XksProxyInvalidResponseException of xks_proxy_invalid_response_exception
            | `XksProxyUriEndpointInUseException of xks_proxy_uri_endpoint_in_use_exception
            | `XksProxyUriInUseException of xks_proxy_uri_in_use_exception
            | `XksProxyUriUnreachableException of xks_proxy_uri_unreachable_exception
            | `XksProxyVpcEndpointServiceInUseException of xks_proxy_vpc_endpoint_service_in_use_exception
            | `XksProxyVpcEndpointServiceInvalidConfigurationException of xks_proxy_vpc_endpoint_service_invalid_configuration_exception
            | `XksProxyVpcEndpointServiceNotFoundException of xks_proxy_vpc_endpoint_service_not_found_exception
            
        ]
      ) result
end

module CreateGrant : sig
  val request :
    Smaws_Lib.Context.t ->
      create_grant_request ->
        (create_grant_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidArnException of invalid_arn_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module CreateKey : sig
  val request :
    Smaws_Lib.Context.t ->
      create_key_request ->
        (create_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudHsmClusterInvalidConfigurationException of cloud_hsm_cluster_invalid_configuration_exception
            | `CustomKeyStoreInvalidStateException of custom_key_store_invalid_state_exception
            | `CustomKeyStoreNotFoundException of custom_key_store_not_found_exception
            | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `MalformedPolicyDocumentException of malformed_policy_document_exception
            | `TagException of tag_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            | `XksKeyAlreadyInUseException of xks_key_already_in_use_exception
            | `XksKeyInvalidConfigurationException of xks_key_invalid_configuration_exception
            | `XksKeyNotFoundException of xks_key_not_found_exception
            
        ]
      ) result
end

module Decrypt : sig
  val request :
    Smaws_Lib.Context.t ->
      decrypt_request ->
        (decrypt_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `IncorrectKeyException of incorrect_key_exception
            | `InvalidCiphertextException of invalid_ciphertext_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module DeleteAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_alias_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module DeleteCustomKeyStore : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_custom_key_store_request ->
        (delete_custom_key_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CustomKeyStoreHasCMKsException of custom_key_store_has_cm_ks_exception
            | `CustomKeyStoreInvalidStateException of custom_key_store_invalid_state_exception
            | `CustomKeyStoreNotFoundException of custom_key_store_not_found_exception
            | `KMSInternalException of kms_internal_exception
            
        ]
      ) result
end

module DeleteImportedKeyMaterial : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_imported_key_material_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeriveSharedSecret : sig
  val request :
    Smaws_Lib.Context.t ->
      derive_shared_secret_request ->
        (derive_shared_secret_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module DescribeCustomKeyStores : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_custom_key_stores_request ->
        (describe_custom_key_stores_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CustomKeyStoreNotFoundException of custom_key_store_not_found_exception
            | `InvalidMarkerException of invalid_marker_exception
            | `KMSInternalException of kms_internal_exception
            
        ]
      ) result
end

module DescribeKey : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_key_request ->
        (describe_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module DisableKey : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_key_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module DisableKeyRotation : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_key_rotation_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DisconnectCustomKeyStore : sig
  val request :
    Smaws_Lib.Context.t ->
      disconnect_custom_key_store_request ->
        (disconnect_custom_key_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CustomKeyStoreInvalidStateException of custom_key_store_invalid_state_exception
            | `CustomKeyStoreNotFoundException of custom_key_store_not_found_exception
            | `KMSInternalException of kms_internal_exception
            
        ]
      ) result
end

module EnableKey : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_key_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module EnableKeyRotation : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_key_rotation_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module Encrypt : sig
  val request :
    Smaws_Lib.Context.t ->
      encrypt_request ->
        (encrypt_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GenerateDataKey : sig
  val request :
    Smaws_Lib.Context.t ->
      generate_data_key_request ->
        (generate_data_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GenerateDataKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      generate_data_key_pair_request ->
        (generate_data_key_pair_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module GenerateDataKeyPairWithoutPlaintext : sig
  val request :
    Smaws_Lib.Context.t ->
      generate_data_key_pair_without_plaintext_request ->
        (generate_data_key_pair_without_plaintext_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module GenerateDataKeyWithoutPlaintext : sig
  val request :
    Smaws_Lib.Context.t ->
      generate_data_key_without_plaintext_request ->
        (generate_data_key_without_plaintext_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GenerateMac : sig
  val request :
    Smaws_Lib.Context.t ->
      generate_mac_request ->
        (generate_mac_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GenerateRandom : sig
  val request :
    Smaws_Lib.Context.t ->
      generate_random_request ->
        (generate_random_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CustomKeyStoreInvalidStateException of custom_key_store_invalid_state_exception
            | `CustomKeyStoreNotFoundException of custom_key_store_not_found_exception
            | `DependencyTimeoutException of dependency_timeout_exception
            | `KMSInternalException of kms_internal_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module GetKeyPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_policy_request ->
        (get_key_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module GetKeyRotationStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_rotation_status_request ->
        (get_key_rotation_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module GetParametersForImport : sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameters_for_import_request ->
        (get_parameters_for_import_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module GetPublicKey : sig
  val request :
    Smaws_Lib.Context.t ->
      get_public_key_request ->
        (get_public_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `InvalidArnException of invalid_arn_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ImportKeyMaterial : sig
  val request :
    Smaws_Lib.Context.t ->
      import_key_material_request ->
        (import_key_material_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `ExpiredImportTokenException of expired_import_token_exception
            | `IncorrectKeyMaterialException of incorrect_key_material_exception
            | `InvalidArnException of invalid_arn_exception
            | `InvalidCiphertextException of invalid_ciphertext_exception
            | `InvalidImportTokenException of invalid_import_token_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ListAliases : sig
  val request :
    Smaws_Lib.Context.t ->
      list_aliases_request ->
        (list_aliases_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `InvalidMarkerException of invalid_marker_exception
            | `KMSInternalException of kms_internal_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module ListGrants : sig
  val request :
    Smaws_Lib.Context.t ->
      list_grants_request ->
        (list_grants_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `InvalidGrantIdException of invalid_grant_id_exception
            | `InvalidMarkerException of invalid_marker_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module ListKeyPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_key_policies_request ->
        (list_key_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module ListKeyRotations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_key_rotations_request ->
        (list_key_rotations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidMarkerException of invalid_marker_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ListKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      list_keys_request ->
        (list_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidMarkerException of invalid_marker_exception
            | `KMSInternalException of kms_internal_exception
            
        ]
      ) result
end

module ListResourceTags : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_tags_request ->
        (list_resource_tags_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidMarkerException of invalid_marker_exception
            | `KMSInternalException of kms_internal_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module ListRetirableGrants : sig
  val request :
    Smaws_Lib.Context.t ->
      list_retirable_grants_request ->
        (list_grants_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `InvalidMarkerException of invalid_marker_exception
            | `KMSInternalException of kms_internal_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module PutKeyPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_key_policy_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `MalformedPolicyDocumentException of malformed_policy_document_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ReEncrypt : sig
  val request :
    Smaws_Lib.Context.t ->
      re_encrypt_request ->
        (re_encrypt_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `IncorrectKeyException of incorrect_key_exception
            | `InvalidCiphertextException of invalid_ciphertext_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module ReplicateKey : sig
  val request :
    Smaws_Lib.Context.t ->
      replicate_key_request ->
        (replicate_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AlreadyExistsException of already_exists_exception
            | `DisabledException of disabled_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `MalformedPolicyDocumentException of malformed_policy_document_exception
            | `NotFoundException of not_found_exception
            | `TagException of tag_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module RetireGrant : sig
  val request :
    Smaws_Lib.Context.t ->
      retire_grant_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidArnException of invalid_arn_exception
            | `InvalidGrantIdException of invalid_grant_id_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module RevokeGrant : sig
  val request :
    Smaws_Lib.Context.t ->
      revoke_grant_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidArnException of invalid_arn_exception
            | `InvalidGrantIdException of invalid_grant_id_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module RotateKeyOnDemand : sig
  val request :
    Smaws_Lib.Context.t ->
      rotate_key_on_demand_request ->
        (rotate_key_on_demand_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ScheduleKeyDeletion : sig
  val request :
    Smaws_Lib.Context.t ->
      schedule_key_deletion_request ->
        (schedule_key_deletion_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module Sign : sig
  val request :
    Smaws_Lib.Context.t ->
      sign_request ->
        (sign_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            | `TagException of tag_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `TagException of tag_exception
            
        ]
      ) result
end

module UpdateAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      update_alias_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module UpdateCustomKeyStore : sig
  val request :
    Smaws_Lib.Context.t ->
      update_custom_key_store_request ->
        (update_custom_key_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudHsmClusterInvalidConfigurationException of cloud_hsm_cluster_invalid_configuration_exception
            | `CloudHsmClusterNotActiveException of cloud_hsm_cluster_not_active_exception
            | `CloudHsmClusterNotFoundException of cloud_hsm_cluster_not_found_exception
            | `CloudHsmClusterNotRelatedException of cloud_hsm_cluster_not_related_exception
            | `CustomKeyStoreInvalidStateException of custom_key_store_invalid_state_exception
            | `CustomKeyStoreNameInUseException of custom_key_store_name_in_use_exception
            | `CustomKeyStoreNotFoundException of custom_key_store_not_found_exception
            | `KMSInternalException of kms_internal_exception
            | `XksProxyIncorrectAuthenticationCredentialException of xks_proxy_incorrect_authentication_credential_exception
            | `XksProxyInvalidConfigurationException of xks_proxy_invalid_configuration_exception
            | `XksProxyInvalidResponseException of xks_proxy_invalid_response_exception
            | `XksProxyUriEndpointInUseException of xks_proxy_uri_endpoint_in_use_exception
            | `XksProxyUriInUseException of xks_proxy_uri_in_use_exception
            | `XksProxyUriUnreachableException of xks_proxy_uri_unreachable_exception
            | `XksProxyVpcEndpointServiceInUseException of xks_proxy_vpc_endpoint_service_in_use_exception
            | `XksProxyVpcEndpointServiceInvalidConfigurationException of xks_proxy_vpc_endpoint_service_invalid_configuration_exception
            | `XksProxyVpcEndpointServiceNotFoundException of xks_proxy_vpc_endpoint_service_not_found_exception
            
        ]
      ) result
end

module UpdateKeyDescription : sig
  val request :
    Smaws_Lib.Context.t ->
      update_key_description_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module UpdatePrimaryRegion : sig
  val request :
    Smaws_Lib.Context.t ->
      update_primary_region_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DisabledException of disabled_exception
            | `InvalidArnException of invalid_arn_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module Verify : sig
  val request :
    Smaws_Lib.Context.t ->
      verify_request ->
        (verify_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DependencyTimeoutException of dependency_timeout_exception
            | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidSignatureException of kms_invalid_signature_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

module VerifyMac : sig
  val request :
    Smaws_Lib.Context.t ->
      verify_mac_request ->
        (verify_mac_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DisabledException of disabled_exception
            | `DryRunOperationException of dry_run_operation_exception
            | `InvalidGrantTokenException of invalid_grant_token_exception
            | `InvalidKeyUsageException of invalid_key_usage_exception
            | `KeyUnavailableException of key_unavailable_exception
            | `KMSInternalException of kms_internal_exception
            | `KMSInvalidMacException of kms_invalid_mac_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `NotFoundException of not_found_exception
            
        ]
      ) result
end

