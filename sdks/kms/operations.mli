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
  (** 
    Cancels the deletion of a KMS key. When this operation succeeds, the key state of the KMS key is [Disabled]. To enable the KMS key, use [EnableKey].
    
     For more information about scheduling and canceling deletion of a KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html}Deleting KMS keys} in the {i Key Management Service Developer Guide}.
     
      The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
      
       {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
       
        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CancelKeyDeletion} (key policy)
        
         {b Related operations}: [ScheduleKeyDeletion]
         
          {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
           *)

  
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
  (** 
    Connects or reconnects a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store} to its backing key store. For an CloudHSM key store, [ConnectCustomKeyStore] connects the key store to its associated CloudHSM cluster. For an external key store, [ConnectCustomKeyStore] connects the key store to the external key store proxy that communicates with your external key manager.
    
     The custom key store must be connected before you can create KMS keys in the key store or use the KMS keys it contains. You can disconnect and reconnect a custom key store at any time.
     
      The connection process for a custom key store can take an extended amount of time to complete. This operation starts the connection process, but it does not wait for it to complete. When it succeeds, this operation quickly returns an HTTP 200 response and a JSON object with no properties. However, this response does not indicate that the custom key store is connected. To get the connection state of the custom key store, use the [DescribeCustomKeyStores] operation.
      
       This operation is part of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key stores} feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.
       
        The [ConnectCustomKeyStore] operation might fail for various reasons. To find the reason, use the [DescribeCustomKeyStores] operation and see the [ConnectionErrorCode] in the response. For help interpreting the [ConnectionErrorCode], see [CustomKeyStoresListEntry].
        
         To fix the failure, use the [DisconnectCustomKeyStore] operation to disconnect the custom key store, correct the error, use the [UpdateCustomKeyStore] operation if necessary, and then use [ConnectCustomKeyStore] again.
         
          {b CloudHSM key store}
          
           During the connection process for an CloudHSM key store, KMS finds the CloudHSM cluster that is associated with the custom key store, creates the connection infrastructure, connects to the cluster, logs into the CloudHSM client as the [kmsuser] CU, and rotates its password.
           
            To connect an CloudHSM key store, its associated CloudHSM cluster must have at least one active HSM. To get the number of active HSMs in a cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation. To add HSMs to the cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html}CreateHsm} operation. Also, the {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser}[kmsuser] crypto user} (CU) must not be logged into the cluster. This prevents KMS from using this account to log in.
            
             If you are having trouble connecting or disconnecting a CloudHSM key store, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html}Troubleshooting an CloudHSM key store} in the {i Key Management Service Developer Guide}.
             
              {b External key store}
              
               When you connect an external key store that uses public endpoint connectivity, KMS tests its ability to communicate with your external key manager by sending a request via the external key store proxy.
               
                When you connect to an external key store that uses VPC endpoint service connectivity, KMS establishes the networking elements that it needs to communicate with your external key manager via the external key store proxy. This includes creating an interface endpoint to the VPC endpoint service and a private hosted zone for traffic between KMS and the VPC endpoint service.
                
                 To connect an external key store, KMS must be able to connect to the external key store proxy, the external key store proxy must be able to communicate with your external key manager, and the external key manager must be available for cryptographic operations.
                 
                  If you are having trouble connecting or disconnecting an external key store, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/xks-troubleshooting.html}Troubleshooting an external key store} in the {i Key Management Service Developer Guide}.
                  
                   {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.
                   
                    {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ConnectCustomKeyStore} (IAM policy)
                    
                     {b Related operations}
                     
                      {ul
                           {- [CreateCustomKeyStore]
                              
                              }
                            {- [DeleteCustomKeyStore]
                               
                               }
                            {- [DescribeCustomKeyStores]
                               
                               }
                            {- [DisconnectCustomKeyStore]
                               
                               }
                            {- [UpdateCustomKeyStore]
                               
                               }
                           
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Creates a friendly name for a KMS key.
    
     Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.
     
      You can use an alias to identify a KMS key in the KMS console, in the [DescribeKey] operation and in {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations}, such as [Encrypt] and [GenerateDataKey]. You can also change the KMS key that's associated with the alias ([UpdateAlias]) or delete the alias ([DeleteAlias]) at any time. These operations don't affect the underlying KMS key.
      
       You can associate the alias with any customer managed key in the same Amazon Web Services Region. Each alias is associated with only one KMS key at a time, but a KMS key can have multiple aliases. A valid KMS key is required. You can't create an alias without a KMS key.
       
        The alias must be unique in the account and Region, but you can have aliases with the same name in different Regions. For detailed information about aliases, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html}Using aliases} in the {i Key Management Service Developer Guide}.
        
         This operation does not return a response. To get the alias that you created, use the [ListAliases] operation.
         
          The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
          
           {b Cross-account use}: No. You cannot perform this operation on an alias in a different Amazon Web Services account.
           
            {b Required permissions}
            
             {ul
                  {- {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CreateAlias} on the alias (IAM policy).
                     
                     }
                   {- {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CreateAlias} on the KMS key (key policy).
                      
                      }
                  
      }
       For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access}Controlling access to aliases} in the {i Key Management Service Developer Guide}.
       
        {b Related operations:}
        
         {ul
              {- [DeleteAlias]
                 
                 }
               {- [ListAliases]
                  
                  }
               {- [UpdateAlias]
                  
                  }
              
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Creates a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store} backed by a key store that you own and manage. When you use a KMS key in a custom key store for a cryptographic operation, the cryptographic operation is actually performed in your key store using your keys. KMS supports {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html}CloudHSM key stores} backed by an {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/clusters.html}CloudHSM cluster} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html}external key stores} backed by an external key store proxy and external key manager outside of Amazon Web Services.
    
     This operation is part of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key stores} feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.
     
      Before you create the custom key store, the required elements must be in place and operational. We recommend that you use the test tools that KMS provides to verify the configuration your external key store proxy. For details about the required elements and verification tests, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore}Assemble the prerequisites (for CloudHSM key stores)} or {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keystore.html#xks-requirements}Assemble the prerequisites (for external key stores)} in the {i Key Management Service Developer Guide}.
      
       To create a custom key store, use the following parameters.
       
        {ul
             {- To create an CloudHSM key store, specify the [CustomKeyStoreName], [CloudHsmClusterId], [KeyStorePassword], and [TrustAnchorCertificate]. The [CustomKeyStoreType] parameter is optional for CloudHSM key stores. If you include it, set it to the default value, [AWS_CLOUDHSM]. For help with failures, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html}Troubleshooting an CloudHSM key store} in the {i Key Management Service Developer Guide}.
                
                }
              {- To create an external key store, specify the [CustomKeyStoreName] and a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE]. Also, specify values for [XksProxyConnectivity], [XksProxyAuthenticationCredential], [XksProxyUriEndpoint], and [XksProxyUriPath]. If your [XksProxyConnectivity] value is [VPC_ENDPOINT_SERVICE], specify the [XksProxyVpcEndpointServiceName] parameter. For help with failures, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/xks-troubleshooting.html}Troubleshooting an external key store} in the {i Key Management Service Developer Guide}.
                 
                 }
             
      }
       For external key stores:
       
        Some external key managers provide a simpler method for creating an external key store. For details, see your external key manager documentation.
        
         When creating an external key store in the KMS console, you can upload a JSON-based proxy configuration file with the desired values. You cannot use a proxy configuration with the [CreateCustomKeyStore] operation. However, you can use the values in the file to help you determine the correct values for the [CreateCustomKeyStore] parameters.
         
          When the operation completes successfully, it returns the ID of the new custom key store. Before you can use your new custom key store, you need to use the [ConnectCustomKeyStore] operation to connect a new CloudHSM key store to its CloudHSM cluster, or to connect a new external key store to the external key store proxy for your external key manager. Even if you are not going to use your custom key store immediately, you might want to connect it to verify that all settings are correct and then disconnect it until you are ready to use it.
          
           For help with failures, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html}Troubleshooting a custom key store} in the {i Key Management Service Developer Guide}.
           
            {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.
            
             {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CreateCustomKeyStore} (IAM policy).
             
              {b Related operations:}
              
               {ul
                    {- [ConnectCustomKeyStore]
                       
                       }
                     {- [DeleteCustomKeyStore]
                        
                        }
                     {- [DescribeCustomKeyStores]
                        
                        }
                     {- [DisconnectCustomKeyStore]
                        
                        }
                     {- [UpdateCustomKeyStore]
                        
                        }
                    
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Adds a grant to a KMS key.
    
     A {i grant} is a policy instrument that allows Amazon Web Services principals to use KMS keys in cryptographic operations. It also can allow them to view a KMS key ([DescribeKey]) and create and manage grants. When authorizing access to a KMS key, grants are considered along with key policies and IAM policies. Grants are often used for temporary permissions because you can create one, use its permissions, and delete it without changing your key policies or IAM policies.
     
      For detailed information about grants, including grant terminology, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html}Grants in KMS} in the {i {i Key Management Service Developer Guide}}. For examples of working with grants in several programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html}Programming grants}.
      
       The [CreateGrant] operation returns a [GrantToken] and a [GrantId].
       
        {ul
             {- When you create, retire, or revoke a grant, there might be a brief delay, usually less than five minutes, until the grant is available throughout KMS. This state is known as {i eventual consistency}. Once the grant has achieved eventual consistency, the grantee principal can use the permissions in the grant without identifying the grant.
                
                 However, to use the permissions in the grant immediately, use the [GrantToken] that [CreateGrant] returns. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i {i Key Management Service Developer Guide}}.
                 
                 }
              {- The [CreateGrant] operation also returns a [GrantId]. You can use the [GrantId] and a key identifier to identify the grant in the [RetireGrant] and [RevokeGrant] operations. To find the grant ID, use the [ListGrants] or [ListRetirableGrants] operations.
                 
                 }
             
      }
       The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
       
        {b Cross-account use}: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the [KeyId] parameter.
        
         {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CreateGrant} (key policy)
         
          {b Related operations:}
          
           {ul
                {- [ListGrants]
                   
                   }
                 {- [ListRetirableGrants]
                    
                    }
                 {- [RetireGrant]
                    
                    }
                 {- [RevokeGrant]
                    
                    }
                
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Creates a unique customer managed {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms-keys}KMS key} in your Amazon Web Services account and Region. You can use a KMS key in cryptographic operations, such as encryption and signing. Some Amazon Web Services services let you use KMS keys that you create and manage to protect your service resources.
    
     A KMS key is a logical representation of a cryptographic key. In addition to the key material used in cryptographic operations, a KMS key includes metadata, such as the key ID, key policy, creation date, description, and key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/getting-started.html}Managing keys} in the {i Key Management Service Developer Guide}
     
      Use the parameters of [CreateKey] to specify the type of KMS key, the source of its key material, its key policy, description, tags, and other properties.
      
       KMS has replaced the term {i customer master key (CMK)} with {i KMS key} and {i KMS key}. The concept has not changed. To prevent breaking changes, KMS is keeping some variations of this term.
       
        To create different types of KMS keys, use the following guidance:
        
         Symmetric encryption KMS key By default, [CreateKey] creates a symmetric encryption KMS key with key material that KMS generates. This is the basic and most widely used type of KMS key, and provides the best performance.
                                      
                                       To create a symmetric encryption KMS key, you don't need to specify any parameters. The default value for [KeySpec], [SYMMETRIC_DEFAULT], the default value for [KeyUsage], [ENCRYPT_DECRYPT], and the default value for [Origin], [AWS_KMS], create a symmetric encryption KMS key with KMS key material.
                                       
                                        If you need a key for basic encryption and decryption or you are creating a KMS key to protect your resources in an Amazon Web Services service, create a symmetric encryption KMS key. The key material in a symmetric encryption key never leaves KMS unencrypted. You can use a symmetric encryption KMS key to encrypt and decrypt data up to 4,096 bytes, but they are typically used to generate data keys and data keys pairs. For details, see [GenerateDataKey] and [GenerateDataKeyPair].
                                        
                                         
                                         
                                          Asymmetric KMS keys To create an asymmetric KMS key, use the [KeySpec] parameter to specify the type of key material in the KMS key. Then, use the [KeyUsage] parameter to determine whether the KMS key will be used to encrypt and decrypt or sign and verify. You can't change these properties after the KMS key is created.
                                                              
                                                               Asymmetric KMS keys contain an RSA key pair, Elliptic Curve (ECC) key pair, or an SM2 key pair (China Regions only). The private key in an asymmetric KMS key never leaves KMS unencrypted. However, you can use the [GetPublicKey] operation to download the public key so it can be used outside of KMS. Each KMS key can have only one key usage. KMS keys with RSA key pairs can be used to encrypt and decrypt data or sign and verify messages (but not both). KMS keys with NIST-recommended ECC key pairs can be used to sign and verify messages or derive shared secrets (but not both). KMS keys with [ECC_SECG_P256K1] can be used only to sign and verify messages. KMS keys with SM2 key pairs (China Regions only) can be used to either encrypt and decrypt data, sign and verify messages, or derive shared secrets (you must choose one key usage type). For information about asymmetric KMS keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric KMS keys} in the {i Key Management Service Developer Guide}.
                                                               
                                                                
                                                                
                                                                 HMAC KMS key To create an HMAC KMS key, set the [KeySpec] parameter to a key spec value for HMAC KMS keys. Then set the [KeyUsage] parameter to [GENERATE_VERIFY_MAC]. You must set the key usage even though [GENERATE_VERIFY_MAC] is the only valid key usage value for HMAC KMS keys. You can't change these properties after the KMS key is created.
                                                                              
                                                                               HMAC KMS keys are symmetric keys that never leave KMS unencrypted. You can use HMAC keys to generate ([GenerateMac]) and verify ([VerifyMac]) HMAC codes for messages up to 4096 bytes.
                                                                               
                                                                                
                                                                                
                                                                                 Multi-Region primary keys Imported key material 
    To create a multi-Region {i primary key} in the local Amazon Web Services Region, use the [MultiRegion] parameter with a value of [True]. To create a multi-Region {i replica key}, that is, a KMS key with the same key ID and key material as a primary key, but in a different Amazon Web Services Region, use the [ReplicateKey] operation. To change a replica key to a primary key, and its primary key to a replica key, use the [UpdatePrimaryRegion] operation.
    
     You can create multi-Region KMS keys for all supported KMS key types: symmetric encryption KMS keys, HMAC KMS keys, asymmetric encryption KMS keys, and asymmetric signing KMS keys. You can also create multi-Region keys with imported key material. However, you can't create multi-Region keys in a custom key store.
     
      This operation supports {i multi-Region keys}, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.
      
       
       
        To import your own key material into a KMS key, begin by creating a KMS key with no key material. To do this, use the [Origin] parameter of [CreateKey] with a value of [EXTERNAL]. Next, use [GetParametersForImport] operation to get a public key and import token. Use the wrapping public key to encrypt your key material. Then, use [ImportKeyMaterial] with your import token to import the key material. For step-by-step instructions, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing Key Material} in the {i {i Key Management Service Developer Guide}}.
        
         You can import key material into KMS keys of all supported KMS key types: symmetric encryption KMS keys, HMAC KMS keys, asymmetric encryption KMS keys, and asymmetric signing KMS keys. You can also create multi-Region keys with imported key material. However, you can't import key material into a KMS key in a custom key store.
         
          To create a multi-Region primary key with imported key material, use the [Origin] parameter of [CreateKey] with a value of [EXTERNAL] and the [MultiRegion] parameter with a value of [True]. To create replicas of the multi-Region primary key, use the [ReplicateKey] operation. For instructions, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-import.html }Importing key material into multi-Region keys}. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.
          
           
           
            Custom key store A {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store} lets you protect your Amazon Web Services resources using keys in a backing key store that you own and manage. When you request a cryptographic operation with a KMS key in a custom key store, the operation is performed in the backing key store using its cryptographic keys.
                             
                              KMS supports {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html}CloudHSM key stores} backed by an CloudHSM cluster and {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html}external key stores} backed by an external key manager outside of Amazon Web Services. When you create a KMS key in an CloudHSM key store, KMS generates an encryption key in the CloudHSM cluster and associates it with the KMS key. When you create a KMS key in an external key store, you specify an existing encryption key in the external key manager.
                              
                               Some external key managers provide a simpler method for creating a KMS key in an external key store. For details, see your external key manager documentation.
                               
                                Before you create a KMS key in a custom key store, the [ConnectionState] of the key store must be [CONNECTED]. To connect the custom key store, use the [ConnectCustomKeyStore] operation. To find the [ConnectionState], use the [DescribeCustomKeyStores] operation.
                                
                                 To create a KMS key in a custom key store, use the [CustomKeyStoreId]. Use the default [KeySpec] value, [SYMMETRIC_DEFAULT], and the default [KeyUsage] value, [ENCRYPT_DECRYPT] to create a symmetric encryption key. No other key type is supported in a custom key store.
                                 
                                  To create a KMS key in an {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html}CloudHSM key store}, use the [Origin] parameter with a value of [AWS_CLOUDHSM]. The CloudHSM cluster that is associated with the custom key store must have at least two active HSMs in different Availability Zones in the Amazon Web Services Region.
                                  
                                   To create a KMS key in an {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html}external key store}, use the [Origin] parameter with a value of [EXTERNAL_KEY_STORE] and an [XksKeyId] parameter that identifies an existing external key.
                                   
                                    Some external key managers provide a simpler method for creating a KMS key in an external key store. For details, see your external key manager documentation.
                                    
                                     {b Cross-account use}: No. You cannot use this operation to create a KMS key in a different Amazon Web Services account.
                                     
                                      {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CreateKey} (IAM policy). To use the [Tags] parameter, {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:TagResource} (IAM policy). For examples and information about related permissions, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policy-example-create-key}Allow a user to create KMS keys} in the {i Key Management Service Developer Guide}.
                                      
                                       {b Related operations:}
                                       
                                        {ul
                                             {- [DescribeKey]
                                                
                                                }
                                              {- [ListKeys]
                                                 
                                                 }
                                              {- [ScheduleKeyDeletion]
                                                 
                                                 }
                                             
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Decrypts ciphertext that was encrypted by a KMS key using any of the following operations:
    
     {ul
          {- [Encrypt]
             
             }
           {- [GenerateDataKey]
              
              }
           {- [GenerateDataKeyPair]
              
              }
           {- [GenerateDataKeyWithoutPlaintext]
              
              }
           {- [GenerateDataKeyPairWithoutPlaintext]
              
              }
          
      }
       You can use this operation to decrypt ciphertext that was encrypted under a symmetric encryption KMS key or an asymmetric encryption KMS key. When the KMS key is asymmetric, you must specify the KMS key and the encryption algorithm that was used to encrypt the ciphertext. For information about asymmetric KMS keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric KMS keys} in the {i Key Management Service Developer Guide}.
       
        The [Decrypt] operation also decrypts ciphertext that was encrypted outside of KMS by the public key in an KMS asymmetric KMS key. However, it cannot decrypt symmetric ciphertext produced by other libraries, such as the {{:https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/}Amazon Web Services Encryption SDK} or {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html}Amazon S3 client-side encryption}. These libraries return a ciphertext format that is incompatible with KMS.
        
         If the ciphertext was encrypted under a symmetric encryption KMS key, the [KeyId] parameter is optional. KMS can get this information from metadata that it adds to the symmetric ciphertext blob. This feature adds durability to your implementation by ensuring that authorized users can decrypt ciphertext decades after it was encrypted, even if they've lost track of the key ID. However, specifying the KMS key is always recommended as a best practice. When you use the [KeyId] parameter to specify a KMS key, KMS only uses the KMS key you specify. If the ciphertext was encrypted under a different KMS key, the [Decrypt] operation fails. This practice ensures that you use the KMS key that you intend.
         
          Whenever possible, use key policies to give users permission to call the [Decrypt] operation on a particular KMS key, instead of using &IAM; policies. Otherwise, you might create an &IAM; policy that gives the user [Decrypt] permission on all KMS keys. This user could decrypt ciphertext that was encrypted by KMS keys in other accounts if the key policy for the cross-account KMS key permits it. If you must use an IAM policy for [Decrypt] permissions, limit the user to particular KMS keys or particular trusted accounts. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policies-best-practices}Best practices for IAM policies} in the {i Key Management Service Developer Guide}.
          
           [Decrypt] also supports {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html}Amazon Web Services Nitro Enclaves}, which provide an isolated compute environment in Amazon EC2. To call [Decrypt] for a Nitro enclave, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK. Use the [Recipient] parameter to provide the attestation document for the enclave. Instead of the plaintext data, the response includes the plaintext data encrypted with the public key from the attestation document ([CiphertextForRecipient]). For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
           
            The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
            
             {b Cross-account use}: Yes. If you use the [KeyId] parameter to identify a KMS key in a different Amazon Web Services account, specify the key ARN or the alias ARN of the KMS key.
             
              {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:Decrypt} (key policy)
              
               {b Related operations:}
               
                {ul
                     {- [Encrypt]
                        
                        }
                      {- [GenerateDataKey]
                         
                         }
                      {- [GenerateDataKeyPair]
                         
                         }
                      {- [ReEncrypt]
                         
                         }
                     
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Deletes the specified alias.
    
     Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.
     
      Because an alias is not a property of a KMS key, you can delete and change the aliases of a KMS key without affecting the KMS key. Also, aliases do not appear in the response from the [DescribeKey] operation. To get the aliases of all KMS keys, use the [ListAliases] operation.
      
       Each KMS key can have multiple aliases. To change the alias of a KMS key, use [DeleteAlias] to delete the current alias and [CreateAlias] to create a new alias. To associate an existing alias with a different KMS key, call [UpdateAlias].
       
        {b Cross-account use}: No. You cannot perform this operation on an alias in a different Amazon Web Services account.
        
         {b Required permissions}
         
          {ul
               {- {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DeleteAlias} on the alias (IAM policy).
                  
                  }
                {- {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DeleteAlias} on the KMS key (key policy).
                   
                   }
               
      }
       For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access}Controlling access to aliases} in the {i Key Management Service Developer Guide}.
       
        {b Related operations:}
        
         {ul
              {- [CreateAlias]
                 
                 }
               {- [ListAliases]
                  
                  }
               {- [UpdateAlias]
                  
                  }
              
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Deletes a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. This operation does not affect any backing elements of the custom key store. It does not delete the CloudHSM cluster that is associated with an CloudHSM key store, or affect any users or keys in the cluster. For an external key store, it does not affect the external key store proxy, external key manager, or any external keys.
    
     This operation is part of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key stores} feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.
     
      The custom key store that you delete cannot contain any {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys}KMS keys}. Before deleting the key store, verify that you will never need to use any of the KMS keys in the key store for any {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations}. Then, use [ScheduleKeyDeletion] to delete the KMS keys from the key store. After the required waiting period expires and all KMS keys are deleted from the custom key store, use [DisconnectCustomKeyStore] to disconnect the key store from KMS. Then, you can delete the custom key store.
      
       For keys in an CloudHSM key store, the [ScheduleKeyDeletion] operation makes a best effort to delete the key material from the associated cluster. However, you might need to manually {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key}delete the orphaned key material} from the cluster and its backups. KMS never creates, manages, or deletes cryptographic keys in the external key manager associated with an external key store. You must manage them using your external key manager tools.
       
        Instead of deleting the custom key store, consider using the [DisconnectCustomKeyStore] operation to disconnect the custom key store from its backing key store. While the key store is disconnected, you cannot create or use the KMS keys in the key store. But, you do not need to delete KMS keys and you can reconnect a disconnected custom key store at any time.
        
         If the operation succeeds, it returns a JSON object with no properties.
         
          {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.
          
           {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DeleteCustomKeyStore} (IAM policy)
           
            {b Related operations:}
            
             {ul
                  {- [ConnectCustomKeyStore]
                     
                     }
                   {- [CreateCustomKeyStore]
                      
                      }
                   {- [DescribeCustomKeyStores]
                      
                      }
                   {- [DisconnectCustomKeyStore]
                      
                      }
                   {- [UpdateCustomKeyStore]
                      
                      }
                  
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Deletes key material that was previously imported. This operation makes the specified KMS key temporarily unusable. To restore the usability of the KMS key, reimport the same key material. For more information about importing key material into KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing Key Material} in the {i Key Management Service Developer Guide}.
    
     When the specified KMS key is in the [PendingDeletion] state, this operation does not change the KMS key's state. Otherwise, it changes the KMS key's state to [PendingImport].
     
      The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
      
       {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
       
        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DeleteImportedKeyMaterial} (key policy)
        
         {b Related operations:}
         
          {ul
               {- [GetParametersForImport]
                  
                  }
                {- [ImportKeyMaterial]
                   
                   }
               
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Derives a shared secret using a key agreement algorithm.
    
     You must use an asymmetric NIST-recommended elliptic curve (ECC) or SM2 (China Regions only) KMS key pair with a [KeyUsage] value of [KEY_AGREEMENT] to call DeriveSharedSecret.
     
      DeriveSharedSecret uses the {{:https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-56Ar3.pdf#page=60}Elliptic Curve Cryptography Cofactor Diffie-Hellman Primitive} (ECDH) to establish a key agreement between two peers by deriving a shared secret from their elliptic curve public-private key pairs. You can use the raw shared secret that DeriveSharedSecret returns to derive a symmetric key that can encrypt and decrypt data that is sent between the two peers, or that can generate and verify HMACs. KMS recommends that you follow {{:https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-56Cr2.pdf}NIST recommendations for key derivation} when using the raw shared secret to derive a symmetric key.
      
       The following workflow demonstrates how to establish key agreement over an insecure communication channel using DeriveSharedSecret.
       
        {ol
             {- {b Alice} calls [CreateKey] to create an asymmetric KMS key pair with a [KeyUsage] value of [KEY_AGREEMENT].
                
                 The asymmetric KMS key must use a NIST-recommended elliptic curve (ECC) or SM2 (China Regions only) key spec.
                 
                 }
              {- {b Bob} creates an elliptic curve key pair.
                 
                  Bob can call [CreateKey] to create an asymmetric KMS key pair or generate a key pair outside of KMS. Bob's key pair must use the same NIST-recommended elliptic curve (ECC) or SM2 (China Regions ony) curve as Alice.
                  
                  }
              {- Alice and Bob {b exchange their public keys} through an insecure communication channel (like the internet).
                 
                  Use [GetPublicKey] to download the public key of your asymmetric KMS key pair.
                  
                   KMS strongly recommends verifying that the public key you receive came from the expected party before using it to derive a shared secret.
                   
                   }
              {- {b Alice} calls DeriveSharedSecret.
                 
                  KMS uses the private key from the KMS key pair generated in {b Step 1}, Bob's public key, and the Elliptic Curve Cryptography Cofactor Diffie-Hellman Primitive to derive the shared secret. The private key in your KMS key pair never leaves KMS unencrypted. DeriveSharedSecret returns the raw shared secret.
                  
                  }
              {- {b Bob} uses the Elliptic Curve Cryptography Cofactor Diffie-Hellman Primitive to calculate the same raw secret using his private key and Alice's public key.
                 
                 }
             
      }
       To derive a shared secret you must provide a key agreement algorithm, the private key of the caller's asymmetric NIST-recommended elliptic curve or SM2 (China Regions only) KMS key pair, and the public key from your peer's NIST-recommended elliptic curve or SM2 (China Regions only) key pair. The public key can be from another asymmetric KMS key pair or from a key pair generated outside of KMS, but both key pairs must be on the same elliptic curve.
       
        The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
        
         {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
         
          {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DeriveSharedSecret} (key policy)
          
           {b Related operations:}
           
            {ul
                 {- [CreateKey]
                    
                    }
                  {- [GetPublicKey]
                     
                     }
                  {- [DescribeKey]
                     
                     }
                 
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Gets information about {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key stores} in the account and Region.
    
     This operation is part of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key stores} feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.
     
      By default, this operation returns information about all custom key stores in the account and Region. To get only information about a particular custom key store, use either the [CustomKeyStoreName] or [CustomKeyStoreId] parameter (but not both).
      
       To determine whether the custom key store is connected to its CloudHSM cluster or external key store proxy, use the [ConnectionState] element in the response. If an attempt to connect the custom key store failed, the [ConnectionState] value is [FAILED] and the [ConnectionErrorCode] element in the response indicates the cause of the failure. For help interpreting the [ConnectionErrorCode], see [CustomKeyStoresListEntry].
       
        Custom key stores have a [DISCONNECTED] connection state if the key store has never been connected or you used the [DisconnectCustomKeyStore] operation to disconnect it. Otherwise, the connection state is CONNECTED. If your custom key store connection state is [CONNECTED] but you are having trouble using it, verify that the backing store is active and available. For an CloudHSM key store, verify that the associated CloudHSM cluster is active and contains the minimum number of HSMs required for the operation, if any. For an external key store, verify that the external key store proxy and its associated external key manager are reachable and enabled.
        
         For help repairing your CloudHSM key store, see the {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html}Troubleshooting CloudHSM key stores}. For help repairing your external key store, see the {{:https://docs.aws.amazon.com/kms/latest/developerguide/xks-troubleshooting.html}Troubleshooting external key stores}. Both topics are in the {i Key Management Service Developer Guide}.
         
          {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.
          
           {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DescribeCustomKeyStores} (IAM policy)
           
            {b Related operations:}
            
             {ul
                  {- [ConnectCustomKeyStore]
                     
                     }
                   {- [CreateCustomKeyStore]
                      
                      }
                   {- [DeleteCustomKeyStore]
                      
                      }
                   {- [DisconnectCustomKeyStore]
                      
                      }
                   {- [UpdateCustomKeyStore]
                      
                      }
                  
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Provides detailed information about a KMS key. You can run [DescribeKey] on a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key} or an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed key}.
    
     This detailed information includes the key ARN, creation date (and deletion date, if applicable), the key state, and the origin and expiration date (if any) of the key material. It includes fields, like [KeySpec], that help you distinguish different types of KMS keys. It also displays the key usage (encryption, signing, or generating and verifying MACs) and the algorithms that the KMS key supports.
     
      For {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}multi-Region keys}, [DescribeKey] displays the primary key and all related replica keys. For KMS keys in {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html}CloudHSM key stores}, it includes information about the key store, such as the key store ID and the CloudHSM cluster ID. For KMS keys in {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html}external key stores}, it includes the custom key store ID and the ID of the external key.
      
       [DescribeKey] does not return the following information:
       
        {ul
             {- Aliases associated with the KMS key. To get this information, use [ListAliases].
                
                }
              {- Whether automatic key rotation is enabled on the KMS key. To get this information, use [GetKeyRotationStatus]. Also, some key states prevent a KMS key from being automatically rotated. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-how-it-works}How Automatic Key Rotation Works} in the {i Key Management Service Developer Guide}.
                 
                 }
              {- Tags on the KMS key. To get this information, use [ListResourceTags].
                 
                 }
              {- Key policies and grants on the KMS key. To get this information, use [GetKeyPolicy] and [ListGrants].
                 
                 }
             
      }
       In general, [DescribeKey] is a non-mutating operation. It returns data about KMS keys, but doesn't change them. However, Amazon Web Services services use [DescribeKey] to create {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed keys} from a {i predefined Amazon Web Services alias} with no key ID.
       
        {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
        
         {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DescribeKey} (key policy)
         
          {b Related operations:}
          
           {ul
                {- [GetKeyPolicy]
                   
                   }
                 {- [GetKeyRotationStatus]
                    
                    }
                 {- [ListAliases]
                    
                    }
                 {- [ListGrants]
                    
                    }
                 {- [ListKeys]
                    
                    }
                 {- [ListResourceTags]
                    
                    }
                 {- [ListRetirableGrants]
                    
                    }
                
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Sets the state of a KMS key to disabled. This change temporarily prevents use of the KMS key for {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations}.
    
     For more information about how key state affects the use of a KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i {i Key Management Service Developer Guide}}.
     
      The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
      
       {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
       
        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DisableKey} (key policy)
        
         {b Related operations}: [EnableKey]
         
          {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
           *)

  
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
  (** 
    Disables {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html}automatic rotation of the key material} of the specified symmetric encryption KMS key.
    
     Automatic key rotation is supported only on symmetric encryption KMS keys. You cannot enable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. To enable or disable automatic rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate}multi-Region keys}, set the property on the primary key.
     
      You can enable ([EnableKeyRotation]) and disable automatic rotation of the key material in {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed KMS keys}. Key material rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed KMS keys} is not configurable. KMS always rotates the key material for every year. Rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk}Amazon Web Services owned KMS keys} varies.
      
       In May 2022, KMS changed the rotation schedule for Amazon Web Services managed keys from every three years to every year. For details, see [EnableKeyRotation].
       
        The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
        
         {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
         
          {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DisableKeyRotation} (key policy)
          
           {b Related operations:}
           
            {ul
                 {- [EnableKeyRotation]
                    
                    }
                  {- [GetKeyRotationStatus]
                     
                     }
                  {- [ListKeyRotations]
                     
                     }
                  {- [RotateKeyOnDemand]
                     
                     }
                 
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Disconnects the {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store} from its backing key store. This operation disconnects an CloudHSM key store from its associated CloudHSM cluster or disconnects an external key store from the external key store proxy that communicates with your external key manager.
    
     This operation is part of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key stores} feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.
     
      While a custom key store is disconnected, you can manage the custom key store and its KMS keys, but you cannot create or use its KMS keys. You can reconnect the custom key store at any time.
      
       While a custom key store is disconnected, all attempts to create KMS keys in the custom key store or to use existing KMS keys in {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} will fail. This action can prevent users from storing and accessing sensitive data.
       
        When you disconnect a custom key store, its [ConnectionState] changes to [Disconnected]. To find the connection state of a custom key store, use the [DescribeCustomKeyStores] operation. To reconnect a custom key store, use the [ConnectCustomKeyStore] operation.
        
         If the operation succeeds, it returns a JSON object with no properties.
         
          {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.
          
           {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DisconnectCustomKeyStore} (IAM policy)
           
            {b Related operations:}
            
             {ul
                  {- [ConnectCustomKeyStore]
                     
                     }
                   {- [CreateCustomKeyStore]
                      
                      }
                   {- [DeleteCustomKeyStore]
                      
                      }
                   {- [DescribeCustomKeyStores]
                      
                      }
                   {- [UpdateCustomKeyStore]
                      
                      }
                  
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Sets the key state of a KMS key to enabled. This allows you to use the KMS key for {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations}.
    
     The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
     
      {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
      
       {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:EnableKey} (key policy)
       
        {b Related operations}: [DisableKey]
        
         {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
          *)

  
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
  (** 
    Enables {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotating-keys-enable-disable}automatic rotation of the key material} of the specified symmetric encryption KMS key.
    
     By default, when you enable automatic rotation of a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed KMS key}, KMS rotates the key material of the KMS key one year (approximately 365 days) from the enable date and every year thereafter. You can use the optional [RotationPeriodInDays] parameter to specify a custom rotation period when you enable key rotation, or you can use [RotationPeriodInDays] to modify the rotation period of a key that you previously enabled automatic key rotation on.
     
      You can monitor rotation of the key material for your KMS keys in CloudTrail and Amazon CloudWatch. To disable rotation of the key material in a customer managed KMS key, use the [DisableKeyRotation] operation. You can use the [GetKeyRotationStatus] operation to identify any in progress rotations. You can use the [ListKeyRotations] operation to view the details of completed rotations.
      
       Automatic key rotation is supported only on {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#symmetric-cmks}symmetric encryption KMS keys}. You cannot enable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. To enable or disable automatic rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate}multi-Region keys}, set the property on the primary key.
       
        You cannot enable or disable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed KMS keys}. KMS always rotates the key material of Amazon Web Services managed keys every year. Rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk}Amazon Web Services owned KMS keys} is managed by the Amazon Web Services service that owns the key.
        
         In May 2022, KMS changed the rotation schedule for Amazon Web Services managed keys from every three years (approximately 1,095 days) to every year (approximately 365 days).
         
          New Amazon Web Services managed keys are automatically rotated one year after they are created, and approximately every year thereafter.
          
           Existing Amazon Web Services managed keys are automatically rotated one year after their most recent rotation, and every year thereafter.
           
            The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
            
             {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
             
              {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:EnableKeyRotation} (key policy)
              
               {b Related operations:}
               
                {ul
                     {- [DisableKeyRotation]
                        
                        }
                      {- [GetKeyRotationStatus]
                         
                         }
                      {- [ListKeyRotations]
                         
                         }
                      {- [RotateKeyOnDemand]
                         
                          You can perform on-demand ([RotateKeyOnDemand]) rotation of the key material in customer managed KMS keys, regardless of whether or not automatic key rotation is enabled.
                          
                          }
                     
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Encrypts plaintext of up to 4,096 bytes using a KMS key. You can use a symmetric or asymmetric KMS key with a [KeyUsage] of [ENCRYPT_DECRYPT].
    
     You can use this operation to encrypt small amounts of arbitrary data, such as a personal identifier or database password, or other sensitive information. You don't need to use the [Encrypt] operation to encrypt a data key. The [GenerateDataKey] and [GenerateDataKeyPair] operations return a plaintext data key and an encrypted copy of that data key.
     
      If you use a symmetric encryption KMS key, you can use an encryption context to add additional security to your encryption operation. If you specify an [EncryptionContext] when encrypting data, you must specify the same encryption context (a case-sensitive exact match) when decrypting the data. Otherwise, the request to decrypt fails with an [InvalidCiphertextException]. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption Context} in the {i Key Management Service Developer Guide}.
      
       If you specify an asymmetric KMS key, you must also specify the encryption algorithm. The algorithm must be compatible with the KMS key spec.
       
        When you use an asymmetric KMS key to encrypt or reencrypt data, be sure to record the KMS key and encryption algorithm that you choose. You will be required to provide the same KMS key and encryption algorithm when you decrypt the data. If the KMS key and algorithm do not match the values used to encrypt the data, the decrypt operation fails.
        
         You are not required to supply the key ID and encryption algorithm when you decrypt with symmetric encryption KMS keys because KMS stores this information in the ciphertext blob. KMS cannot store metadata in ciphertext generated with asymmetric keys. The standard format for asymmetric key ciphertext does not include configurable fields.
         
          The maximum size of the data that you can encrypt varies with the type of KMS key and the encryption algorithm that you choose.
          
           {ul
                {- Symmetric encryption KMS keys
                   
                    {ul
                         {- [SYMMETRIC_DEFAULT]: 4096 bytes
                            
                            }
                         
                  }
                  }
                 {- [RSA_2048]
                    
                     {ul
                          {- [RSAES_OAEP_SHA_1]: 214 bytes
                             
                             }
                           {- [RSAES_OAEP_SHA_256]: 190 bytes
                              
                              }
                          
                  }
                  }
                 {- [RSA_3072]
                    
                     {ul
                          {- [RSAES_OAEP_SHA_1]: 342 bytes
                             
                             }
                           {- [RSAES_OAEP_SHA_256]: 318 bytes
                              
                              }
                          
                  }
                  }
                 {- [RSA_4096]
                    
                     {ul
                          {- [RSAES_OAEP_SHA_1]: 470 bytes
                             
                             }
                           {- [RSAES_OAEP_SHA_256]: 446 bytes
                              
                              }
                          
                  }
                  }
                 {- [SM2PKE]: 1024 bytes (China Regions only)
                    
                    }
                
      }
       The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
       
        {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
        
         {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:Encrypt} (key policy)
         
          {b Related operations:}
          
           {ul
                {- [Decrypt]
                   
                   }
                 {- [GenerateDataKey]
                    
                    }
                 {- [GenerateDataKeyPair]
                    
                    }
                
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Returns a unique symmetric data key for use outside of KMS. This operation returns a plaintext copy of the data key and a copy that is encrypted under a symmetric encryption KMS key that you specify. The bytes in the plaintext key are random; they are not related to the caller or the KMS key. You can use the plaintext key to encrypt your data outside of KMS and store the encrypted data key with the encrypted data.
    
     To generate a data key, specify the symmetric encryption KMS key that will be used to encrypt the data key. You cannot use an asymmetric KMS key to encrypt data keys. To get the type of your KMS key, use the [DescribeKey] operation.
     
      You must also specify the length of the data key. Use either the [KeySpec] or [NumberOfBytes] parameters (but not both). For 128-bit and 256-bit data keys, use the [KeySpec] parameter.
      
       To generate a 128-bit SM4 data key (China Regions only), specify a [KeySpec] value of [AES_128] or a [NumberOfBytes] value of [16]. The symmetric encryption key used in China Regions to encrypt your data key is an SM4 encryption key.
       
        To get only an encrypted copy of the data key, use [GenerateDataKeyWithoutPlaintext]. To generate an asymmetric data key pair, use the [GenerateDataKeyPair] or [GenerateDataKeyPairWithoutPlaintext] operation. To get a cryptographically secure random byte string, use [GenerateRandom].
        
         You can use an optional encryption context to add additional security to the encryption operation. If you specify an [EncryptionContext], you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an [InvalidCiphertextException]. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption Context} in the {i Key Management Service Developer Guide}.
         
          [GenerateDataKey] also supports {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html}Amazon Web Services Nitro Enclaves}, which provide an isolated compute environment in Amazon EC2. To call [GenerateDataKey] for an Amazon Web Services Nitro enclave, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK. Use the [Recipient] parameter to provide the attestation document for the enclave. [GenerateDataKey] returns a copy of the data key encrypted under the specified KMS key, as usual. But instead of a plaintext copy of the data key, the response includes a copy of the data key encrypted under the public key from the attestation document ([CiphertextForRecipient]). For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}..
          
           The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
           
            {b How to use your data key}
            
             We recommend that you use the following pattern to encrypt data locally in your application. You can write your own code or use a client-side encryption library, such as the {{:https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/}Amazon Web Services Encryption SDK}, the {{:https://docs.aws.amazon.com/dynamodb-encryption-client/latest/devguide/}Amazon DynamoDB Encryption Client}, or {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html}Amazon S3 client-side encryption} to do these tasks for you.
             
              To encrypt data outside of KMS:
              
               {ol
                    {- Use the [GenerateDataKey] operation to get a data key.
                       
                       }
                     {- Use the plaintext data key (in the [Plaintext] field of the response) to encrypt your data outside of KMS. Then erase the plaintext data key from memory.
                        
                        }
                     {- Store the encrypted data key (in the [CiphertextBlob] field of the response) with the encrypted data.
                        
                        }
                    
      }
       To decrypt data outside of KMS:
       
        {ol
             {- Use the [Decrypt] operation to decrypt the encrypted data key. The operation returns a plaintext copy of the data key.
                
                }
              {- Use the plaintext data key to decrypt data outside of KMS, then erase the plaintext data key from memory.
                 
                 }
             
      }
       {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
       
        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateDataKey} (key policy)
        
         {b Related operations:}
         
          {ul
               {- [Decrypt]
                  
                  }
                {- [Encrypt]
                   
                   }
                {- [GenerateDataKeyPair]
                   
                   }
                {- [GenerateDataKeyPairWithoutPlaintext]
                   
                   }
                {- [GenerateDataKeyWithoutPlaintext]
                   
                   }
               
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Returns a unique asymmetric data key pair for use outside of KMS. This operation returns a plaintext public key, a plaintext private key, and a copy of the private key that is encrypted under the symmetric encryption KMS key you specify. You can use the data key pair to perform asymmetric cryptography and implement digital signatures outside of KMS. The bytes in the keys are random; they are not related to the caller or to the KMS key that is used to encrypt the private key.
    
     You can use the public key that [GenerateDataKeyPair] returns to encrypt data or verify a signature outside of KMS. Then, store the encrypted private key with the data. When you are ready to decrypt data or sign a message, you can use the [Decrypt] operation to decrypt the encrypted private key.
     
      To generate a data key pair, you must specify a symmetric encryption KMS key to encrypt the private key in a data key pair. You cannot use an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.
      
       Use the [KeyPairSpec] parameter to choose an RSA or Elliptic Curve (ECC) data key pair. In China Regions, you can also choose an SM2 data key pair. KMS recommends that you use ECC key pairs for signing, and use RSA and SM2 key pairs for either encryption or signing, but not both. However, KMS cannot enforce any restrictions on the use of data key pairs outside of KMS.
       
        If you are using the data key pair to encrypt data, or for any operation where you don't immediately need a private key, consider using the [GenerateDataKeyPairWithoutPlaintext] operation. [GenerateDataKeyPairWithoutPlaintext] returns a plaintext public key and an encrypted private key, but omits the plaintext private key that you need only to decrypt ciphertext or sign a message. Later, when you need to decrypt the data or sign a message, use the [Decrypt] operation to decrypt the encrypted private key in the data key pair.
        
         [GenerateDataKeyPair] returns a unique data key pair for each request. The bytes in the keys are random; they are not related to the caller or the KMS key that is used to encrypt the private key. The public key is a DER-encoded X.509 SubjectPublicKeyInfo, as specified in {{:https://tools.ietf.org/html/rfc5280}RFC 5280}. The private key is a DER-encoded PKCS8 PrivateKeyInfo, as specified in {{:https://tools.ietf.org/html/rfc5958}RFC 5958}.
         
          [GenerateDataKeyPair] also supports {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html}Amazon Web Services Nitro Enclaves}, which provide an isolated compute environment in Amazon EC2. To call [GenerateDataKeyPair] for an Amazon Web Services Nitro enclave, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK. Use the [Recipient] parameter to provide the attestation document for the enclave. [GenerateDataKeyPair] returns the public data key and a copy of the private data key encrypted under the specified KMS key, as usual. But instead of a plaintext copy of the private data key ([PrivateKeyPlaintext]), the response includes a copy of the private data key encrypted under the public key from the attestation document ([CiphertextForRecipient]). For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}..
          
           You can use an optional encryption context to add additional security to the encryption operation. If you specify an [EncryptionContext], you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an [InvalidCiphertextException]. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption Context} in the {i Key Management Service Developer Guide}.
           
            The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
            
             {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
             
              {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateDataKeyPair} (key policy)
              
               {b Related operations:}
               
                {ul
                     {- [Decrypt]
                        
                        }
                      {- [Encrypt]
                         
                         }
                      {- [GenerateDataKey]
                         
                         }
                      {- [GenerateDataKeyPairWithoutPlaintext]
                         
                         }
                      {- [GenerateDataKeyWithoutPlaintext]
                         
                         }
                     
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Returns a unique asymmetric data key pair for use outside of KMS. This operation returns a plaintext public key and a copy of the private key that is encrypted under the symmetric encryption KMS key you specify. Unlike [GenerateDataKeyPair], this operation does not return a plaintext private key. The bytes in the keys are random; they are not related to the caller or to the KMS key that is used to encrypt the private key.
    
     You can use the public key that [GenerateDataKeyPairWithoutPlaintext] returns to encrypt data or verify a signature outside of KMS. Then, store the encrypted private key with the data. When you are ready to decrypt data or sign a message, you can use the [Decrypt] operation to decrypt the encrypted private key.
     
      To generate a data key pair, you must specify a symmetric encryption KMS key to encrypt the private key in a data key pair. You cannot use an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.
      
       Use the [KeyPairSpec] parameter to choose an RSA or Elliptic Curve (ECC) data key pair. In China Regions, you can also choose an SM2 data key pair. KMS recommends that you use ECC key pairs for signing, and use RSA and SM2 key pairs for either encryption or signing, but not both. However, KMS cannot enforce any restrictions on the use of data key pairs outside of KMS.
       
        [GenerateDataKeyPairWithoutPlaintext] returns a unique data key pair for each request. The bytes in the key are not related to the caller or KMS key that is used to encrypt the private key. The public key is a DER-encoded X.509 SubjectPublicKeyInfo, as specified in {{:https://tools.ietf.org/html/rfc5280}RFC 5280}.
        
         You can use an optional encryption context to add additional security to the encryption operation. If you specify an [EncryptionContext], you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an [InvalidCiphertextException]. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption Context} in the {i Key Management Service Developer Guide}.
         
          The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
          
           {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
           
            {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateDataKeyPairWithoutPlaintext} (key policy)
            
             {b Related operations:}
             
              {ul
                   {- [Decrypt]
                      
                      }
                    {- [Encrypt]
                       
                       }
                    {- [GenerateDataKey]
                       
                       }
                    {- [GenerateDataKeyPair]
                       
                       }
                    {- [GenerateDataKeyWithoutPlaintext]
                       
                       }
                   
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Returns a unique symmetric data key for use outside of KMS. This operation returns a data key that is encrypted under a symmetric encryption KMS key that you specify. The bytes in the key are random; they are not related to the caller or to the KMS key.
    
     [GenerateDataKeyWithoutPlaintext] is identical to the [GenerateDataKey] operation except that it does not return a plaintext copy of the data key.
     
      This operation is useful for systems that need to encrypt data at some point, but not immediately. When you need to encrypt the data, you call the [Decrypt] operation on the encrypted copy of the key.
      
       It's also useful in distributed systems with different levels of trust. For example, you might store encrypted data in containers. One component of your system creates new containers and stores an encrypted data key with each container. Then, a different component puts the data into the containers. That component first decrypts the data key, uses the plaintext data key to encrypt data, puts the encrypted data into the container, and then destroys the plaintext data key. In this system, the component that creates the containers never sees the plaintext data key.
       
        To request an asymmetric data key pair, use the [GenerateDataKeyPair] or [GenerateDataKeyPairWithoutPlaintext] operations.
        
         To generate a data key, you must specify the symmetric encryption KMS key that is used to encrypt the data key. You cannot use an asymmetric KMS key or a key in a custom key store to generate a data key. To get the type of your KMS key, use the [DescribeKey] operation.
         
          You must also specify the length of the data key. Use either the [KeySpec] or [NumberOfBytes] parameters (but not both). For 128-bit and 256-bit data keys, use the [KeySpec] parameter.
          
           To generate an SM4 data key (China Regions only), specify a [KeySpec] value of [AES_128] or [NumberOfBytes] value of [16]. The symmetric encryption key used in China Regions to encrypt your data key is an SM4 encryption key.
           
            If the operation succeeds, you will find the encrypted copy of the data key in the [CiphertextBlob] field.
            
             You can use an optional encryption context to add additional security to the encryption operation. If you specify an [EncryptionContext], you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an [InvalidCiphertextException]. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption Context} in the {i Key Management Service Developer Guide}.
             
              The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
              
               {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
               
                {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateDataKeyWithoutPlaintext} (key policy)
                
                 {b Related operations:}
                 
                  {ul
                       {- [Decrypt]
                          
                          }
                        {- [Encrypt]
                           
                           }
                        {- [GenerateDataKey]
                           
                           }
                        {- [GenerateDataKeyPair]
                           
                           }
                        {- [GenerateDataKeyPairWithoutPlaintext]
                           
                           }
                       
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Generates a hash-based message authentication code (HMAC) for a message using an HMAC KMS key and a MAC algorithm that the key supports. HMAC KMS keys and the HMAC algorithms that KMS uses conform to industry standards defined in {{:https://datatracker.ietf.org/doc/html/rfc2104}RFC 2104}.
    
     You can use value that GenerateMac returns in the [VerifyMac] operation to demonstrate that the original message has not changed. Also, because a secret key is used to create the hash, you can verify that the party that generated the hash has the required secret key. You can also use the raw result to implement HMAC-based algorithms such as key derivation functions. This operation is part of KMS support for HMAC KMS keys. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC keys in KMS} in the {i {i Key Management Service Developer Guide}}.
     
      Best practices recommend that you limit the time during which any signing mechanism, including an HMAC, is effective. This deters an attack where the actor uses a signed message to establish validity repeatedly or long after the message is superseded. HMAC tags do not include a timestamp, but you can include a timestamp in the token or message to help you detect when its time to refresh the HMAC.
      
       The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
       
        {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
        
         {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateMac} (key policy)
         
          {b Related operations}: [VerifyMac]
          
           {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
            *)

  
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
  (** 
    Returns a random byte string that is cryptographically secure.
    
     You must use the [NumberOfBytes] parameter to specify the length of the random byte string. There is no default value for string length.
     
      By default, the random byte string is generated in KMS. To generate the byte string in the CloudHSM cluster associated with an CloudHSM key store, use the [CustomKeyStoreId] parameter.
      
       [GenerateRandom] also supports {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html}Amazon Web Services Nitro Enclaves}, which provide an isolated compute environment in Amazon EC2. To call [GenerateRandom] for a Nitro enclave, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK. Use the [Recipient] parameter to provide the attestation document for the enclave. Instead of plaintext bytes, the response includes the plaintext bytes encrypted under the public key from the attestation document ([CiphertextForRecipient]).For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
       
        For more information about entropy and random number generation, see {{:https://docs.aws.amazon.com/kms/latest/cryptographic-details/}Key Management Service Cryptographic Details}.
        
         {b Cross-account use}: Not applicable. [GenerateRandom] does not use any account-specific resources, such as KMS keys.
         
          {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateRandom} (IAM policy)
          
           {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
            *)

  
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
  (** 
    Gets a key policy attached to the specified KMS key.
    
     {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
     
      {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GetKeyPolicy} (key policy)
      
       {b Related operations}: {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy}
       
        {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
         *)

  
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
  (** 
    Provides detailed information about the rotation status for a KMS key, including whether {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html}automatic rotation of the key material} is enabled for the specified KMS key, the {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotation-period}rotation period}, and the next scheduled rotation date.
    
     Automatic key rotation is supported only on {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#symmetric-cmks}symmetric encryption KMS keys}. You cannot enable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. To enable or disable automatic rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate}multi-Region keys}, set the property on the primary key..
     
      You can enable ([EnableKeyRotation]) and disable automatic rotation ([DisableKeyRotation]) of the key material in customer managed KMS keys. Key material rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed KMS keys} is not configurable. KMS always rotates the key material in Amazon Web Services managed KMS keys every year. The key rotation status for Amazon Web Services managed KMS keys is always [true].
      
       You can perform on-demand ([RotateKeyOnDemand]) rotation of the key material in customer managed KMS keys, regardless of whether or not automatic key rotation is enabled. You can use GetKeyRotationStatus to identify the date and time that an in progress on-demand rotation was initiated. You can use [ListKeyRotations] to view the details of completed rotations.
       
        In May 2022, KMS changed the rotation schedule for Amazon Web Services managed keys from every three years to every year. For details, see [EnableKeyRotation].
        
         The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
         
          {ul
               {- Disabled: The key rotation status does not change when you disable a KMS key. However, while the KMS key is disabled, KMS does not rotate the key material. When you re-enable the KMS key, rotation resumes. If the key material in the re-enabled KMS key hasn't been rotated in one year, KMS rotates it immediately, and every year thereafter. If it's been less than a year since the key material in the re-enabled KMS key was rotated, the KMS key resumes its prior rotation schedule.
                  
                  }
                {- Pending deletion: While a KMS key is pending deletion, its key rotation status is [false] and KMS does not rotate the key material. If you cancel the deletion, the original key rotation status returns to [true].
                   
                   }
               
      }
       {b Cross-account use}: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the [KeyId] parameter.
       
        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GetKeyRotationStatus} (key policy)
        
         {b Related operations:}
         
          {ul
               {- [DisableKeyRotation]
                  
                  }
                {- [EnableKeyRotation]
                   
                   }
                {- [ListKeyRotations]
                   
                   }
                {- [RotateKeyOnDemand]
                   
                   }
               
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  [@@ocaml.doc {| 
    Returns the public key and an import token you need to import or reimport key material for a KMS key.
    
     By default, KMS keys are created with key material that KMS generates. This operation supports {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing key material}, an advanced feature that lets you generate and import the cryptographic key material for a KMS key. For more information about importing key material into KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing key material} in the {i Key Management Service Developer Guide}.
     
      Before calling [GetParametersForImport], use the [CreateKey] operation with an [Origin] value of [EXTERNAL] to create a KMS key with no key material. You can import key material for a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key, or asymmetric signing KMS key. You can also import key material into a {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}multi-Region key} of any supported type. However, you can't import key material into a KMS key in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. You can also use [GetParametersForImport] to get a public key and import token to {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#reimport-key-material}reimport the original key material} into a KMS key whose key material expired or was deleted.
      
       [GetParametersForImport] returns the items that you need to import your key material.
       
        {ul
             {- The public key (or "wrapping key") of an RSA key pair that KMS generates.
                
                 You will use this public key to encrypt ("wrap") your key material while it's in transit to KMS.
                 
                 }
              {- A import token that ensures that KMS can decrypt your key material and associate it with the correct KMS key.
                 
                 }
             
      }
       The public key and its import token are permanently linked and must be used together. Each public key and import token set is valid for 24 hours. The expiration date and time appear in the [ParametersValidTo] field in the [GetParametersForImport] response. You cannot use an expired public key or import token in an [ImportKeyMaterial] request. If your key and token expire, send another [GetParametersForImport] request.
       
        [GetParametersForImport] requires the following information:
        
         {ul
              {- The key ID of the KMS key for which you are importing the key material.
                 
                 }
               {- The key spec of the public key ("wrapping key") that you will use to encrypt your key material during import.
                  
                  }
               {- The wrapping algorithm that you will use with the public key to encrypt your key material.
                  
                  }
              
      }
       You can use the same or a different public key spec and wrapping algorithm each time you import or reimport the same key material.
       
        The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
        
         {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
         
          {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GetParametersForImport} (key policy)
          
           {b Related operations:}
           
            {ul
                 {- [ImportKeyMaterial]
                    
                    }
                  {- [DeleteImportedKeyMaterial]
                     
                     }
                 
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        |}]

  
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
  (** 
    Returns the public key of an asymmetric KMS key. Unlike the private key of a asymmetric KMS key, which never leaves KMS unencrypted, callers with [kms:GetPublicKey] permission can download the public key of an asymmetric KMS key. You can share the public key to allow others to encrypt messages and verify signatures outside of KMS. For information about asymmetric KMS keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric KMS keys} in the {i Key Management Service Developer Guide}.
    
     You do not need to download the public key. Instead, you can use the public key within KMS by calling the [Encrypt], [ReEncrypt], or [Verify] operations with the identifier of an asymmetric KMS key. When you use the public key within KMS, you benefit from the authentication, authorization, and logging that are part of every KMS operation. You also reduce of risk of encrypting data that cannot be decrypted. These features are not effective outside of KMS.
     
      To help you use the public key safely outside of KMS, [GetPublicKey] returns important information about the public key in the response, including:
      
       {ul
            {- {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeySpec}KeySpec}: The type of key material in the public key, such as [RSA_4096] or [ECC_NIST_P521].
               
               }
             {- {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeyUsage}KeyUsage}: Whether the key is used for encryption, signing, or deriving a shared secret.
                
                }
             {- {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-EncryptionAlgorithms}EncryptionAlgorithms} or {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-SigningAlgorithms}SigningAlgorithms}: A list of the encryption algorithms or the signing algorithms for the key.
                
                }
            
      }
       Although KMS cannot enforce these restrictions on external operations, it is crucial that you use this information to prevent the public key from being used improperly. For example, you can prevent a public signing key from being used encrypt data, or prevent a public key from being used with an encryption algorithm that is not supported by KMS. You can also avoid errors, such as using the wrong signing algorithm in a verification operation.
       
        To verify a signature outside of KMS with an SM2 public key (China Regions only), you must specify the distinguishing ID. By default, KMS uses [1234567812345678] as the distinguishing ID. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-sm-offline-verification}Offline verification with SM2 key pairs}.
        
         The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
         
          {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
          
           {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GetPublicKey} (key policy)
           
            {b Related operations}: [CreateKey]
            
             {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
              *)

  
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
  (** 
    Imports or reimports key material into an existing KMS key that was created without key material. [ImportKeyMaterial] also sets the expiration model and expiration date of the imported key material.
    
     By default, KMS keys are created with key material that KMS generates. This operation supports {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing key material}, an advanced feature that lets you generate and import the cryptographic key material for a KMS key. For more information about importing key material into KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing key material} in the {i Key Management Service Developer Guide}.
     
      After you successfully import key material into a KMS key, you can {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#reimport-key-material}reimport the same key material} into that KMS key, but you cannot import different key material. You might reimport key material to replace key material that expired or key material that you deleted. You might also reimport key material to change the expiration model or expiration date of the key material.
      
       Each time you import key material into KMS, you can determine whether ([ExpirationModel]) and when ([ValidTo]) the key material expires. To change the expiration of your key material, you must import it again, either by calling [ImportKeyMaterial] or using the {{:kms/latest/developerguide/importing-keys-import-key-material.html#importing-keys-import-key-material-console}import features} of the KMS console.
       
        Before calling [ImportKeyMaterial]:
        
         {ul
              {- Create or identify a KMS key with no key material. The KMS key must have an [Origin] value of [EXTERNAL], which indicates that the KMS key is designed for imported key material.
                 
                  To create an new KMS key for imported key material, call the [CreateKey] operation with an [Origin] value of [EXTERNAL]. You can create a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key, or asymmetric signing KMS key. You can also import key material into a {{:kms/latest/developerguide/multi-region-keys-overview.html}multi-Region key} of any supported type. However, you can't import key material into a KMS key in a {{:kms/latest/developerguide/custom-key-store-overview.html}custom key store}.
                  
                  }
               {- Use the [DescribeKey] operation to verify that the [KeyState] of the KMS key is [PendingImport], which indicates that the KMS key has no key material.
                  
                   If you are reimporting the same key material into an existing KMS key, you might need to call the [DeleteImportedKeyMaterial] to delete its existing key material.
                   
                   }
               {- Call the [GetParametersForImport] operation to get a public key and import token set for importing key material.
                  
                  }
               {- Use the public key in the [GetParametersForImport] response to encrypt your key material.
                  
                  }
              
      }
       Then, in an [ImportKeyMaterial] request, you submit your encrypted key material and import token. When calling this operation, you must specify the following values:
       
        {ul
             {- The key ID or key ARN of the KMS key to associate with the imported key material. Its [Origin] must be [EXTERNAL] and its [KeyState] must be [PendingImport]. You cannot perform this operation on a KMS key in a {{:kms/latest/developerguide/custom-key-store-overview.html}custom key store}, or on a KMS key in a different Amazon Web Services account. To get the [Origin] and [KeyState] of a KMS key, call [DescribeKey].
                
                }
              {- The encrypted key material.
                 
                 }
              {- The import token that [GetParametersForImport] returned. You must use a public key and token from the same [GetParametersForImport] response.
                 
                 }
              {- Whether the key material expires ([ExpirationModel]) and, if so, when ([ValidTo]). For help with this choice, see {{:https://docs.aws.amazon.com/en_us/kms/latest/developerguide/importing-keys.html#importing-keys-expiration}Setting an expiration time} in the {i Key Management Service Developer Guide}.
                 
                  If you set an expiration date, KMS deletes the key material from the KMS key on the specified date, making the KMS key unusable. To use the KMS key in cryptographic operations again, you must reimport the same key material. However, you can delete and reimport the key material at any time, including before the key material expires. Each time you reimport, you can eliminate or reset the expiration time.
                  
                  }
             
      }
       When this operation is successful, the key state of the KMS key changes from [PendingImport] to [Enabled], and you can use the KMS key in cryptographic operations.
       
        If this operation fails, use the exception to help determine the problem. If the error is related to the key material, the import token, or wrapping key, use [GetParametersForImport] to get a new public key and import token for the KMS key and repeat the import procedure. For help, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#importing-keys-overview}How To Import Key Material} in the {i Key Management Service Developer Guide}.
        
         The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
         
          {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
          
           {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ImportKeyMaterial} (key policy)
           
            {b Related operations:}
            
             {ul
                  {- [DeleteImportedKeyMaterial]
                     
                     }
                   {- [GetParametersForImport]
                      
                      }
                  
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Gets a list of aliases in the caller's Amazon Web Services account and region. For more information about aliases, see [CreateAlias].
    
     By default, the [ListAliases] operation returns all aliases in the account and region. To get only the aliases associated with a particular KMS key, use the [KeyId] parameter.
     
      The [ListAliases] response can include aliases that you created and associated with your customer managed keys, and aliases that Amazon Web Services created and associated with Amazon Web Services managed keys in your account. You can recognize Amazon Web Services aliases because their names have the format 
      {[
      aws/
      ]}
      , such as [aws/dynamodb].
      
       The response might also include aliases that have no [TargetKeyId] field. These are predefined aliases that Amazon Web Services has created but has not yet associated with a KMS key. Aliases that Amazon Web Services creates in your account, including predefined aliases, do not count against your {{:https://docs.aws.amazon.com/kms/latest/developerguide/limits.html#aliases-limit}KMS aliases quota}.
       
        {b Cross-account use}: No. [ListAliases] does not return aliases in other Amazon Web Services accounts.
        
         {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListAliases} (IAM policy)
         
          For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access}Controlling access to aliases} in the {i Key Management Service Developer Guide}.
          
           {b Related operations:}
           
            {ul
                 {- [CreateAlias]
                    
                    }
                  {- [DeleteAlias]
                     
                     }
                  {- [UpdateAlias]
                     
                     }
                 
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Gets a list of all grants for the specified KMS key.
    
     You must specify the KMS key in all requests. You can filter the grant list by grant ID or grantee principal.
     
      For detailed information about grants, including grant terminology, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html}Grants in KMS} in the {i {i Key Management Service Developer Guide}}. For examples of working with grants in several programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html}Programming grants}.
      
       The [GranteePrincipal] field in the [ListGrants] response usually contains the user or role designated as the grantee principal in the grant. However, when the grantee principal in the grant is an Amazon Web Services service, the [GranteePrincipal] field contains the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services}service principal}, which might represent several different grantee principals.
       
        {b Cross-account use}: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the [KeyId] parameter.
        
         {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListGrants} (key policy)
         
          {b Related operations:}
          
           {ul
                {- [CreateGrant]
                   
                   }
                 {- [ListRetirableGrants]
                    
                    }
                 {- [RetireGrant]
                    
                    }
                 {- [RevokeGrant]
                    
                    }
                
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Gets the names of the key policies that are attached to a KMS key. This operation is designed to get policy names that you can use in a [GetKeyPolicy] operation. However, the only valid policy name is [default].
    
     {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
     
      {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListKeyPolicies} (key policy)
      
       {b Related operations:}
       
        {ul
             {- [GetKeyPolicy]
                
                }
              {- {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy}
                 
                 }
             
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Returns information about all completed key material rotations for the specified KMS key.
    
     You must specify the KMS key in all requests. You can refine the key rotations list by limiting the number of rotations returned.
     
      For detailed information about automatic and on-demand key rotations, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html}Rotating KMS keys} in the {i Key Management Service Developer Guide}.
      
       {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
       
        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListKeyRotations} (key policy)
        
         {b Related operations:}
         
          {ul
               {- [EnableKeyRotation]
                  
                  }
                {- [DisableKeyRotation]
                   
                   }
                {- [GetKeyRotationStatus]
                   
                   }
                {- [RotateKeyOnDemand]
                   
                   }
               
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Gets a list of all KMS keys in the caller's Amazon Web Services account and Region.
    
     {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
     
      {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListKeys} (IAM policy)
      
       {b Related operations:}
       
        {ul
             {- [CreateKey]
                
                }
              {- [DescribeKey]
                 
                 }
              {- [ListAliases]
                 
                 }
              {- [ListResourceTags]
                 
                 }
             
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Returns all tags on the specified KMS key.
    
     For general information about tags, including the format and syntax, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web Services resources} in the {i Amazon Web Services General Reference}. For information about using tags in KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tagging keys}.
     
      {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
      
       {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListResourceTags} (key policy)
       
        {b Related operations:}
        
         {ul
              {- [CreateKey]
                 
                 }
               {- [ReplicateKey]
                  
                  }
               {- [TagResource]
                  
                  }
               {- [UntagResource]
                  
                  }
              
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Returns information about all grants in the Amazon Web Services account and Region that have the specified retiring principal.
    
     You can specify any principal in your Amazon Web Services account. The grants that are returned include grants for KMS keys in your Amazon Web Services account and other Amazon Web Services accounts. You might use this operation to determine which grants you may retire. To retire a grant, use the [RetireGrant] operation.
     
      For detailed information about grants, including grant terminology, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html}Grants in KMS} in the {i {i Key Management Service Developer Guide}}. For examples of working with grants in several programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html}Programming grants}.
      
       {b Cross-account use}: You must specify a principal in your Amazon Web Services account. This operation returns a list of grants where the retiring principal specified in the [ListRetirableGrants] request is the same retiring principal on the grant. This can include grants on KMS keys owned by other Amazon Web Services accounts, but you do not need [kms:ListRetirableGrants] permission (or any other additional permission) in any Amazon Web Services account other than your own.
       
        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListRetirableGrants} (IAM policy) in your Amazon Web Services account.
        
         KMS authorizes [ListRetirableGrants] requests by evaluating the caller account's kms:ListRetirableGrants permissions. The authorized resource in [ListRetirableGrants] calls is the retiring principal specified in the request. KMS does not evaluate the caller's permissions to verify their access to any KMS keys or grants that might be returned by the [ListRetirableGrants] call.
         
          {b Related operations:}
          
           {ul
                {- [CreateGrant]
                   
                   }
                 {- [ListGrants]
                    
                    }
                 {- [RetireGrant]
                    
                    }
                 {- [RevokeGrant]
                    
                    }
                
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Attaches a key policy to the specified KMS key.
    
     For more information about key policies, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}Key Policies} in the {i Key Management Service Developer Guide}. For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i {i Identity and Access Management User Guide}}. For examples of adding a key policy in multiple programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-key-policies.html#put-policy}Setting a key policy} in the {i Key Management Service Developer Guide}.
     
      {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
      
       {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:PutKeyPolicy} (key policy)
       
        {b Related operations}: [GetKeyPolicy]
        
         {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
          *)

  
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
  [@@ocaml.doc {| 
    Decrypts ciphertext and then reencrypts it entirely within KMS. You can use this operation to change the KMS key under which data is encrypted, such as when you {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-manually}manually rotate} a KMS key or change the KMS key that protects a ciphertext. You can also use it to reencrypt ciphertext under the same KMS key, such as to change the {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}encryption context} of a ciphertext.
    
     The [ReEncrypt] operation can decrypt ciphertext that was encrypted by using a KMS key in an KMS operation, such as [Encrypt] or [GenerateDataKey]. It can also decrypt ciphertext that was encrypted by using the public key of an {{:https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks}asymmetric KMS key} outside of KMS. However, it cannot decrypt ciphertext produced by other libraries, such as the {{:https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/}Amazon Web Services Encryption SDK} or {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html}Amazon S3 client-side encryption}. These libraries return a ciphertext format that is incompatible with KMS.
     
      When you use the [ReEncrypt] operation, you need to provide information for the decrypt operation and the subsequent encrypt operation.
      
       {ul
            {- If your ciphertext was encrypted under an asymmetric KMS key, you must use the [SourceKeyId] parameter to identify the KMS key that encrypted the ciphertext. You must also supply the encryption algorithm that was used. This information is required to decrypt the data.
               
               }
             {- If your ciphertext was encrypted under a symmetric encryption KMS key, the [SourceKeyId] parameter is optional. KMS can get this information from metadata that it adds to the symmetric ciphertext blob. This feature adds durability to your implementation by ensuring that authorized users can decrypt ciphertext decades after it was encrypted, even if they've lost track of the key ID. However, specifying the source KMS key is always recommended as a best practice. When you use the [SourceKeyId] parameter to specify a KMS key, KMS uses only the KMS key you specify. If the ciphertext was encrypted under a different KMS key, the [ReEncrypt] operation fails. This practice ensures that you use the KMS key that you intend.
                
                }
             {- To reencrypt the data, you must use the [DestinationKeyId] parameter to specify the KMS key that re-encrypts the data after it is decrypted. If the destination KMS key is an asymmetric KMS key, you must also provide the encryption algorithm. The algorithm that you choose must be compatible with the KMS key.
                
                 When you use an asymmetric KMS key to encrypt or reencrypt data, be sure to record the KMS key and encryption algorithm that you choose. You will be required to provide the same KMS key and encryption algorithm when you decrypt the data. If the KMS key and algorithm do not match the values used to encrypt the data, the decrypt operation fails.
                 
                  You are not required to supply the key ID and encryption algorithm when you decrypt with symmetric encryption KMS keys because KMS stores this information in the ciphertext blob. KMS cannot store metadata in ciphertext generated with asymmetric keys. The standard format for asymmetric key ciphertext does not include configurable fields.
                  
                  }
            
      }
       The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
       
        {b Cross-account use}: Yes. The source KMS key and destination KMS key can be in different Amazon Web Services accounts. Either or both KMS keys can be in a different account than the caller. To specify a KMS key in a different account, you must use its key ARN or alias ARN.
        
         {b Required permissions}:
         
          {ul
               {- {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ReEncryptFrom} permission on the source KMS key (key policy)
                  
                  }
                {- {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ReEncryptTo} permission on the destination KMS key (key policy)
                   
                   }
               
      }
       To permit reencryption from or to a KMS key, include the ["kms:ReEncrypt*"] permission in your {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}key policy}. This permission is automatically included in the key policy when you use the console to create a KMS key. But you must include it manually when you create a KMS key programmatically or when you use the [PutKeyPolicy] operation to set a key policy.
       
        {b Related operations:}
        
         {ul
              {- [Decrypt]
                 
                 }
               {- [Encrypt]
                  
                  }
               {- [GenerateDataKey]
                  
                  }
               {- [GenerateDataKeyPair]
                  
                  }
              
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        |}]

  
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
  (** 
    Replicates a multi-Region key into the specified Region. This operation creates a multi-Region replica key based on a multi-Region primary key in a different Region of the same Amazon Web Services partition. You can create multiple replicas of a primary key, but each must be in a different Region. To create a multi-Region primary key, use the [CreateKey] operation.
    
     This operation supports {i multi-Region keys}, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.
     
      A {i replica key} is a fully-functional KMS key that can be used independently of its primary and peer replica keys. A primary key and its replica keys share properties that make them interoperable. They have the same {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id}key ID} and key material. They also have the same {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-spec}key spec}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-usage}key usage}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-origin}key material origin}, and {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html}automatic key rotation status}. KMS automatically synchronizes these shared properties among related multi-Region keys. All other properties of a replica key can differ, including its {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}key policy}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}tags}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html}aliases}, and {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys}. KMS pricing and quotas for KMS keys apply to each primary key and replica key.
      
       When this operation completes, the new replica key has a transient key state of [Creating]. This key state changes to [Enabled] (or [PendingImport]) after a few seconds when the process of creating the new replica key is complete. While the key state is [Creating], you can manage key, but you cannot yet use it in cryptographic operations. If you are creating and using the replica key programmatically, retry on [KMSInvalidStateException] or call [DescribeKey] to check its [KeyState] value before using it. For details about the [Creating] key state, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
       
        You cannot create more than one replica of a primary key in any Region. If the Region already includes a replica of the key you're trying to replicate, [ReplicateKey] returns an [AlreadyExistsException] error. If the key state of the existing replica is [PendingDeletion], you can cancel the scheduled key deletion ([CancelKeyDeletion]) or wait for the key to be deleted. The new replica key you create will have the same {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html#mrk-sync-properties}shared properties} as the original replica key.
        
         The CloudTrail log of a [ReplicateKey] operation records a [ReplicateKey] operation in the primary key's Region and a [CreateKey] operation in the replica key's Region.
         
          If you replicate a multi-Region primary key with imported key material, the replica key is created with no key material. You must import the same key material that you imported into the primary key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-import.html}Importing key material into multi-Region keys} in the {i Key Management Service Developer Guide}.
          
           To convert a replica key to a primary key, use the [UpdatePrimaryRegion] operation.
           
            [ReplicateKey] uses different default values for the [KeyPolicy] and [Tags] parameters than those used in the KMS console. For details, see the parameter descriptions.
            
             {b Cross-account use}: No. You cannot use this operation to create a replica key in a different Amazon Web Services account.
             
              {b Required permissions}:
              
               {ul
                    {- [kms:ReplicateKey] on the primary key (in the primary key's Region). Include this permission in the primary key's key policy.
                       
                       }
                     {- [kms:CreateKey] in an IAM policy in the replica Region.
                        
                        }
                     {- To use the [Tags] parameter, [kms:TagResource] in an IAM policy in the replica Region.
                        
                        }
                    
      }
       {b Related operations}
       
        {ul
             {- [CreateKey]
                
                }
              {- [UpdatePrimaryRegion]
                 
                 }
             
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Deletes a grant. Typically, you retire a grant when you no longer need its permissions. To identify the grant to retire, use a {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}grant token}, or both the grant ID and a key identifier (key ID or key ARN) of the KMS key. The [CreateGrant] operation returns both values.
    
     This operation can be called by the {i retiring principal} for a grant, by the {i grantee principal} if the grant allows the [RetireGrant] operation, and by the Amazon Web Services account in which the grant is created. It can also be called by principals to whom permission for retiring a grant is delegated. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete}Retiring and revoking grants} in the {i Key Management Service Developer Guide}.
     
      For detailed information about grants, including grant terminology, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html}Grants in KMS} in the {i {i Key Management Service Developer Guide}}. For examples of working with grants in several programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html}Programming grants}.
      
       {b Cross-account use}: Yes. You can retire a grant on a KMS key in a different Amazon Web Services account.
       
        {b Required permissions}: Permission to retire a grant is determined primarily by the grant. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete}Retiring and revoking grants} in the {i Key Management Service Developer Guide}.
        
         {b Related operations:}
         
          {ul
               {- [CreateGrant]
                  
                  }
                {- [ListGrants]
                   
                   }
                {- [ListRetirableGrants]
                   
                   }
                {- [RevokeGrant]
                   
                   }
               
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Deletes the specified grant. You revoke a grant to terminate the permissions that the grant allows. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete}Retiring and revoking grants} in the {i {i Key Management Service Developer Guide}}.
    
     When you create, retire, or revoke a grant, there might be a brief delay, usually less than five minutes, until the grant is available throughout KMS. This state is known as {i eventual consistency}. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency}Eventual consistency} in the {i {i Key Management Service Developer Guide}}.
     
      For detailed information about grants, including grant terminology, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html}Grants in KMS} in the {i {i Key Management Service Developer Guide}}. For examples of working with grants in several programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html}Programming grants}.
      
       {b Cross-account use}: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the [KeyId] parameter.
       
        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:RevokeGrant} (key policy).
        
         {b Related operations:}
         
          {ul
               {- [CreateGrant]
                  
                  }
                {- [ListGrants]
                   
                   }
                {- [ListRetirableGrants]
                   
                   }
                {- [RetireGrant]
                   
                   }
               
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Immediately initiates rotation of the key material of the specified symmetric encryption KMS key.
    
     You can perform {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotating-keys-on-demand}on-demand rotation} of the key material in customer managed KMS keys, regardless of whether or not {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotating-keys-enable-disable}automatic key rotation} is enabled. On-demand rotations do not change existing automatic rotation schedules. For example, consider a KMS key that has automatic key rotation enabled with a rotation period of 730 days. If the key is scheduled to automatically rotate on April 14, 2024, and you perform an on-demand rotation on April 10, 2024, the key will automatically rotate, as scheduled, on April 14, 2024 and every 730 days thereafter.
     
      You can perform on-demand key rotation a {b maximum of 10 times} per KMS key. You can use the KMS console to view the number of remaining on-demand rotations available for a KMS key.
      
       You can use [GetKeyRotationStatus] to identify any in progress on-demand rotations. You can use [ListKeyRotations] to identify the date that completed on-demand rotations were performed. You can monitor rotation of the key material for your KMS keys in CloudTrail and Amazon CloudWatch.
       
        On-demand key rotation is supported only on {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#symmetric-cmks}symmetric encryption KMS keys}. You cannot perform on-demand rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. To perform on-demand rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate}multi-Region keys}, invoke the on-demand rotation on the primary key.
        
         You cannot initiate on-demand rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed KMS keys}. KMS always rotates the key material of Amazon Web Services managed keys every year. Rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk}Amazon Web Services owned KMS keys} is managed by the Amazon Web Services service that owns the key.
         
          The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
          
           {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
           
            {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:RotateKeyOnDemand} (key policy)
            
             {b Related operations:}
             
              {ul
                   {- [EnableKeyRotation]
                      
                      }
                    {- [DisableKeyRotation]
                       
                       }
                    {- [GetKeyRotationStatus]
                       
                       }
                    {- [ListKeyRotations]
                       
                       }
                   
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Schedules the deletion of a KMS key. By default, KMS applies a waiting period of 30 days, but you can specify a waiting period of 7-30 days. When this operation is successful, the key state of the KMS key changes to [PendingDeletion] and the key can't be used in any cryptographic operations. It remains in this state for the duration of the waiting period. Before the waiting period ends, you can use [CancelKeyDeletion] to cancel the deletion of the KMS key. After the waiting period ends, KMS deletes the KMS key, its key material, and all KMS data associated with it, including all aliases that refer to it.
    
     Deleting a KMS key is a destructive and potentially dangerous operation. When a KMS key is deleted, all data that was encrypted under the KMS key is unrecoverable. (The only exception is a {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-delete.html}multi-Region replica key}, or an {{:kms/latest/developerguide/importing-keys-managing.html#import-delete-key}asymmetric or HMAC KMS key with imported key material}.) To prevent the use of a KMS key without deleting it, use [DisableKey].
     
      You can schedule the deletion of a multi-Region primary key and its replica keys at any time. However, KMS will not delete a multi-Region primary key with existing replica keys. If you schedule the deletion of a primary key with replicas, its key state changes to [PendingReplicaDeletion] and it cannot be replicated or used in cryptographic operations. This status can continue indefinitely. When the last of its replicas keys is deleted (not just scheduled), the key state of the primary key changes to [PendingDeletion] and its waiting period ([PendingWindowInDays]) begins. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-delete.html}Deleting multi-Region keys} in the {i Key Management Service Developer Guide}.
      
       When KMS {{:https://docs.aws.amazon.com/kms/latest/developerguide/delete-cmk-keystore.html}deletes a KMS key from an CloudHSM key store}, it makes a best effort to delete the associated key material from the associated CloudHSM cluster. However, you might need to manually {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key}delete the orphaned key material} from the cluster and its backups. {{:https://docs.aws.amazon.com/kms/latest/developerguide/delete-xks-key.html}Deleting a KMS key from an external key store} has no effect on the associated external key. However, for both types of custom key stores, deleting a KMS key is destructive and irreversible. You cannot decrypt ciphertext encrypted under the KMS key by using only its associated external key or CloudHSM key. Also, you cannot recreate a KMS key in an external key store by creating a new KMS key with the same key material.
       
        For more information about scheduling a KMS key for deletion, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html}Deleting KMS keys} in the {i Key Management Service Developer Guide}.
        
         The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
         
          {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
          
           {b Required permissions}: kms:ScheduleKeyDeletion (key policy)
           
            {b Related operations}
            
             {ul
                  {- [CancelKeyDeletion]
                     
                     }
                   {- [DisableKey]
                      
                      }
                  
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Creates a {{:https://en.wikipedia.org/wiki/Digital_signature}digital signature} for a message or message digest by using the private key in an asymmetric signing KMS key. To verify the signature, use the [Verify] operation, or use the public key in the same asymmetric KMS key outside of KMS. For information about asymmetric KMS keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric KMS keys} in the {i Key Management Service Developer Guide}.
    
     Digital signatures are generated and verified by using asymmetric key pair, such as an RSA or ECC pair that is represented by an asymmetric KMS key. The key owner (or an authorized user) uses their private key to sign a message. Anyone with the public key can verify that the message was signed with that particular private key and that the message hasn't changed since it was signed.
     
      To use the [Sign] operation, provide the following information:
      
       {ul
            {- Use the [KeyId] parameter to identify an asymmetric KMS key with a [KeyUsage] value of [SIGN_VERIFY]. To get the [KeyUsage] value of a KMS key, use the [DescribeKey] operation. The caller must have [kms:Sign] permission on the KMS key.
               
               }
             {- Use the [Message] parameter to specify the message or message digest to sign. You can submit messages of up to 4096 bytes. To sign a larger message, generate a hash digest of the message, and then provide the hash digest in the [Message] parameter. To indicate whether the message is a full message or a digest, use the [MessageType] parameter.
                
                }
             {- Choose a signing algorithm that is compatible with the KMS key.
                
                }
            
      }
       When signing a message, be sure to record the KMS key and the signing algorithm. This information is required to verify the signature.
       
        Best practices recommend that you limit the time during which any signature is effective. This deters an attack where the actor uses a signed message to establish validity repeatedly or long after the message is superseded. Signatures do not include a timestamp, but you can include a timestamp in the signed message to help you detect when its time to refresh the signature.
        
         To verify the signature that this operation generates, use the [Verify] operation. Or use the [GetPublicKey] operation to download the public key and then use the public key to verify the signature outside of KMS.
         
          The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
          
           {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
           
            {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:Sign} (key policy)
            
             {b Related operations}: [Verify]
             
              {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
               *)

  
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
  (** 
    Adds or edits tags on a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key}.
    
     Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.
     
      Each tag consists of a tag key and a tag value, both of which are case-sensitive strings. The tag value can be an empty (null) string. To add a tag, specify a new tag key and a tag value. To edit a tag, specify an existing tag key and a new tag value.
      
       You can use this operation to tag a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key}, but you cannot tag an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed key}, an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk}Amazon Web Services owned key}, a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#keystore-concept}custom key store}, or an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#alias-concept}alias}.
       
        You can also add tags to a KMS key while creating it ([CreateKey]) or replicating it ([ReplicateKey]).
        
         For information about using tags in KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tagging keys}. For general information about tags, including the format and syntax, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web Services resources} in the {i Amazon Web Services General Reference}.
         
          The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
          
           {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
           
            {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:TagResource} (key policy)
            
             {b Related operations}
             
              {ul
                   {- [CreateKey]
                      
                      }
                    {- [ListResourceTags]
                       
                       }
                    {- [ReplicateKey]
                       
                       }
                    {- [UntagResource]
                       
                       }
                   
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Deletes tags from a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key}. To delete a tag, specify the tag key and the KMS key.
    
     Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.
     
      When it succeeds, the [UntagResource] operation doesn't return any output. Also, if the specified tag key isn't found on the KMS key, it doesn't throw an exception or return a response. To confirm that the operation worked, use the [ListResourceTags] operation.
      
       For information about using tags in KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tagging keys}. For general information about tags, including the format and syntax, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web Services resources} in the {i Amazon Web Services General Reference}.
       
        The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
        
         {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
         
          {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UntagResource} (key policy)
          
           {b Related operations}
           
            {ul
                 {- [CreateKey]
                    
                    }
                  {- [ListResourceTags]
                     
                     }
                  {- [ReplicateKey]
                     
                     }
                  {- [TagResource]
                     
                     }
                 
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Associates an existing KMS alias with a different KMS key. Each alias is associated with only one KMS key at a time, although a KMS key can have multiple aliases. The alias and the KMS key must be in the same Amazon Web Services account and Region.
    
     Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.
     
      The current and new KMS key must be the same type (both symmetric or both asymmetric or both HMAC), and they must have the same key usage. This restriction prevents errors in code that uses aliases. If you must assign an alias to a different type of KMS key, use [DeleteAlias] to delete the old alias and [CreateAlias] to create a new alias.
      
       You cannot use [UpdateAlias] to change an alias name. To change an alias name, use [DeleteAlias] to delete the old alias and [CreateAlias] to create a new alias.
       
        Because an alias is not a property of a KMS key, you can create, update, and delete the aliases of a KMS key without affecting the KMS key. Also, aliases do not appear in the response from the [DescribeKey] operation. To get the aliases of all KMS keys in the account, use the [ListAliases] operation.
        
         The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
         
          {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
          
           {b Required permissions}
           
            {ul
                 {- {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UpdateAlias} on the alias (IAM policy).
                    
                    }
                  {- {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UpdateAlias} on the current KMS key (key policy).
                     
                     }
                  {- {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UpdateAlias} on the new KMS key (key policy).
                     
                     }
                 
      }
       For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access}Controlling access to aliases} in the {i Key Management Service Developer Guide}.
       
        {b Related operations:}
        
         {ul
              {- [CreateAlias]
                 
                 }
               {- [DeleteAlias]
                  
                  }
               {- [ListAliases]
                  
                  }
              
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Changes the properties of a custom key store. You can use this operation to change the properties of an CloudHSM key store or an external key store.
    
     Use the required [CustomKeyStoreId] parameter to identify the custom key store. Use the remaining optional parameters to change its properties. This operation does not return any property values. To verify the updated property values, use the [DescribeCustomKeyStores] operation.
     
      This operation is part of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key stores} feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.
      
       When updating the properties of an external key store, verify that the updated settings connect your key store, via the external key store proxy, to the same external key manager as the previous settings, or to a backup or snapshot of the external key manager with the same cryptographic keys. If the updated connection settings fail, you can fix them and retry, although an extended delay might disrupt Amazon Web Services services. However, if KMS permanently loses its access to cryptographic keys, ciphertext encrypted under those keys is unrecoverable.
       
        For external key stores:
        
         Some external key managers provide a simpler method for updating an external key store. For details, see your external key manager documentation.
         
          When updating an external key store in the KMS console, you can upload a JSON-based proxy configuration file with the desired values. You cannot upload the proxy configuration file to the [UpdateCustomKeyStore] operation. However, you can use the file to help you determine the correct values for the [UpdateCustomKeyStore] parameters.
          
           For an CloudHSM key store, you can use this operation to change the custom key store friendly name ([NewCustomKeyStoreName]), to tell KMS about a change to the [kmsuser] crypto user password ([KeyStorePassword]), or to associate the custom key store with a different, but related, CloudHSM cluster ([CloudHsmClusterId]). To update any property of an CloudHSM key store, the [ConnectionState] of the CloudHSM key store must be [DISCONNECTED].
           
            For an external key store, you can use this operation to change the custom key store friendly name ([NewCustomKeyStoreName]), or to tell KMS about a change to the external key store proxy authentication credentials ([XksProxyAuthenticationCredential]), connection method ([XksProxyConnectivity]), external proxy endpoint ([XksProxyUriEndpoint]) and path ([XksProxyUriPath]). For external key stores with an [XksProxyConnectivity] of [VPC_ENDPOINT_SERVICE], you can also update the Amazon VPC endpoint service name ([XksProxyVpcEndpointServiceName]). To update most properties of an external key store, the [ConnectionState] of the external key store must be [DISCONNECTED]. However, you can update the [CustomKeyStoreName], [XksProxyAuthenticationCredential], and [XksProxyUriPath] of an external key store when it is in the CONNECTED or DISCONNECTED state.
            
             If your update requires a [DISCONNECTED] state, before using [UpdateCustomKeyStore], use the [DisconnectCustomKeyStore] operation to disconnect the custom key store. After the [UpdateCustomKeyStore] operation completes, use the [ConnectCustomKeyStore] to reconnect the custom key store. To find the [ConnectionState] of the custom key store, use the [DescribeCustomKeyStores] operation.
             
              
              
               Before updating the custom key store, verify that the new values allow KMS to connect the custom key store to its backing key store. For example, before you change the [XksProxyUriPath] value, verify that the external key store proxy is reachable at the new path.
               
                If the operation succeeds, it returns a JSON object with no properties.
                
                 {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.
                 
                  {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UpdateCustomKeyStore} (IAM policy)
                  
                   {b Related operations:}
                   
                    {ul
                         {- [ConnectCustomKeyStore]
                            
                            }
                          {- [CreateCustomKeyStore]
                             
                             }
                          {- [DeleteCustomKeyStore]
                             
                             }
                          {- [DescribeCustomKeyStores]
                             
                             }
                          {- [DisconnectCustomKeyStore]
                             
                             }
                         
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Updates the description of a KMS key. To see the description of a KMS key, use [DescribeKey].
    
     The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
     
      {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.
      
       {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UpdateKeyDescription} (key policy)
       
        {b Related operations}
        
         {ul
              {- [CreateKey]
                 
                 }
               {- [DescribeKey]
                  
                  }
              
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Changes the primary key of a multi-Region key.
    
     This operation changes the replica key in the specified Region to a primary key and changes the former primary key to a replica key. For example, suppose you have a primary key in [us-east-1] and a replica key in [eu-west-2]. If you run [UpdatePrimaryRegion] with a [PrimaryRegion] value of [eu-west-2], the primary key is now the key in [eu-west-2], and the key in [us-east-1] becomes a replica key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-update}Updating the primary Region} in the {i Key Management Service Developer Guide}.
     
      This operation supports {i multi-Region keys}, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.
      
       The {i primary key} of a multi-Region key is the source for properties that are always shared by primary and replica keys, including the key material, {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id}key ID}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-spec}key spec}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-usage}key usage}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-origin}key material origin}, and {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html}automatic key rotation}. It's the only key that can be replicated. You cannot {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_ScheduleKeyDeletion.html}delete the primary key} until all replica keys are deleted.
       
        The key ID and primary Region that you specify uniquely identify the replica key that will become the primary key. The primary Region must already have a replica key. This operation does not create a KMS key in the specified Region. To find the replica keys, use the [DescribeKey] operation on the primary key or any replica key. To create a replica key, use the [ReplicateKey] operation.
        
         You can run this operation while using the affected multi-Region keys in cryptographic operations. This operation should not delay, interrupt, or cause failures in cryptographic operations.
         
          Even after this operation completes, the process of updating the primary Region might still be in progress for a few more seconds. Operations such as [DescribeKey] might display both the old and new primary keys as replicas. The old and new primary keys have a transient key state of [Updating]. The original key state is restored when the update is complete. While the key state is [Updating], you can use the keys in cryptographic operations, but you cannot replicate the new primary key or perform certain management operations, such as enabling or disabling these keys. For details about the [Updating] key state, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
          
           This operation does not return any output. To verify that primary key is changed, use the [DescribeKey] operation.
           
            {b Cross-account use}: No. You cannot use this operation in a different Amazon Web Services account.
            
             {b Required permissions}:
             
              {ul
                   {- [kms:UpdatePrimaryRegion] on the current primary key (in the primary key's Region). Include this permission primary key's key policy.
                      
                      }
                    {- [kms:UpdatePrimaryRegion] on the current replica key (in the replica key's Region). Include this permission in the replica key's key policy.
                       
                       }
                   
      }
       {b Related operations}
       
        {ul
             {- [CreateKey]
                
                }
              {- [ReplicateKey]
                 
                 }
             
      }
       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
        *)

  
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
  (** 
    Verifies a digital signature that was generated by the [Sign] operation.
    
     
     
      Verification confirms that an authorized user signed the message with the specified KMS key and signing algorithm, and the message hasn't changed since it was signed. If the signature is verified, the value of the [SignatureValid] field in the response is [True]. If the signature verification fails, the [Verify] operation fails with an [KMSInvalidSignatureException] exception.
      
       A digital signature is generated by using the private key in an asymmetric KMS key. The signature is verified by using the public key in the same asymmetric KMS key. For information about asymmetric KMS keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric KMS keys} in the {i Key Management Service Developer Guide}.
       
        To use the [Verify] operation, specify the same asymmetric KMS key, message, and signing algorithm that were used to produce the signature. The message type does not need to be the same as the one used for signing, but it must indicate whether the value of the [Message] parameter should be hashed as part of the verification process.
        
         You can also verify the digital signature by using the public key of the KMS key outside of KMS. Use the [GetPublicKey] operation to download the public key in the asymmetric KMS key and then use the public key to verify the signature outside of KMS. The advantage of using the [Verify] operation is that it is performed within KMS. As a result, it's easy to call, the operation is performed within the FIPS boundary, it is logged in CloudTrail, and you can use key policy and IAM policy to determine who is authorized to use the KMS key to verify signatures.
         
          To verify a signature outside of KMS with an SM2 public key (China Regions only), you must specify the distinguishing ID. By default, KMS uses [1234567812345678] as the distinguishing ID. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-sm-offline-verification}Offline verification with SM2 key pairs}.
          
           The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
           
            {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
            
             {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:Verify} (key policy)
             
              {b Related operations}: [Sign]
              
               {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
                *)

  
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
  (** 
    Verifies the hash-based message authentication code (HMAC) for a specified message, HMAC KMS key, and MAC algorithm. To verify the HMAC, [VerifyMac] computes an HMAC using the message, HMAC KMS key, and MAC algorithm that you specify, and compares the computed HMAC to the HMAC that you specify. If the HMACs are identical, the verification succeeds; otherwise, it fails. Verification indicates that the message hasn't changed since the HMAC was calculated, and the specified key was used to generate and verify the HMAC.
    
     HMAC KMS keys and the HMAC algorithms that KMS uses conform to industry standards defined in {{:https://datatracker.ietf.org/doc/html/rfc2104}RFC 2104}.
     
      This operation is part of KMS support for HMAC KMS keys. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC keys in KMS} in the {i Key Management Service Developer Guide}.
      
       The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
       
        {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.
        
         {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:VerifyMac} (key policy)
         
          {b Related operations}: [GenerateMac]
          
           {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}KMS eventual consistency}.
            *)

  
end

