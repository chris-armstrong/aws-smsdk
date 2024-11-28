(** 
    KMS client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(** 
    The request was rejected because KMS could not find the specified VPC endpoint service. Use [DescribeCustomKeyStores] to verify the VPC endpoint service name for the external key store. Also, confirm that the [Allow principals] list for the VPC endpoint service includes the KMS service principal for the Region, such as [cks.kms.us-east-1.amazonaws.com].
     *)
type xks_proxy_vpc_endpoint_service_not_found_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the Amazon VPC endpoint service configuration does not fulfill the requirements for an external key store. To identify the cause, see the error message that accompanies the exception and {{:https://docs.aws.amazon.com/kms/latest/developerguide/vpc-connectivity.html#xks-vpc-requirements}review the requirements} for Amazon VPC endpoint service connectivity for an external key store.
     *)
type xks_proxy_vpc_endpoint_service_invalid_configuration_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the specified Amazon VPC endpoint service is already associated with another external key store in this Amazon Web Services Region. Each external key store in a Region must use a different Amazon VPC endpoint service.
     *)
type xks_proxy_vpc_endpoint_service_in_use_exception = {
  message: string option;
  
}

(** 
    KMS was unable to reach the specified [XksProxyUriPath]. The path must be reachable before you create the external key store or update its settings.
    
     This exception is also thrown when the external key store proxy response to a [GetHealthStatus] request indicates that all external key manager instances are unavailable.
      *)
type xks_proxy_uri_unreachable_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the concatenation of the [XksProxyUriEndpoint] and [XksProxyUriPath] is already associated with another external key store in this Amazon Web Services Region. Each external key store in a Region must use a unique external key store proxy API address.
     *)
type xks_proxy_uri_in_use_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the [XksProxyUriEndpoint] is already associated with another external key store in this Amazon Web Services Region. To identify the cause, see the error message that accompanies the exception.
     *)
type xks_proxy_uri_endpoint_in_use_exception = {
  message: string option;
  
}

(** 
    
    
     KMS cannot interpret the response it received from the external key store proxy. The problem might be a poorly constructed response, but it could also be a transient network issue. If you see this error repeatedly, report it to the proxy vendor.
      *)
type xks_proxy_invalid_response_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the external key store proxy is not configured correctly. To identify the cause, see the error message that accompanies the exception.
     *)
type xks_proxy_invalid_configuration_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the proxy credentials failed to authenticate to the specified external key store proxy. The specified external key store proxy rejected a status request from KMS due to invalid credentials. This can indicate an error in the credentials or in the identification of the external key store proxy.
     *)
type xks_proxy_incorrect_authentication_credential_exception = {
  message: string option;
  
}

type xks_proxy_connectivity_type = | VPC_ENDPOINT_SERVICE
  | PUBLIC_ENDPOINT

(** 
    Detailed information about the external key store proxy (XKS proxy). Your external key store proxy translates KMS requests into a format that your external key manager can understand. These fields appear in a [DescribeCustomKeyStores] response only when the [CustomKeyStoreType] is [EXTERNAL_KEY_STORE].
     *)
type xks_proxy_configuration_type = {
  vpc_endpoint_service_name: string option;
  (** 
    The Amazon VPC endpoint service used to communicate with the external key store proxy. This field appears only when the external key store proxy uses an Amazon VPC endpoint service to communicate with KMS.
     *)

  uri_path: string option;
  (** 
    The path to the external key store proxy APIs.
     *)

  uri_endpoint: string option;
  (** 
    The URI endpoint for the external key store proxy.
    
     If the external key store proxy has a public endpoint, it is displayed here.
     
      If the external key store proxy uses an Amazon VPC endpoint service name, this field displays the private DNS name associated with the VPC endpoint service.
       *)

  access_key_id: string option;
  (** 
    The part of the external key store {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateCustomKeyStore.html#KMS-CreateCustomKeyStore-request-XksProxyAuthenticationCredential}proxy authentication credential} that uniquely identifies the secret access key.
     *)

  connectivity: xks_proxy_connectivity_type option;
  (** 
    Indicates whether the external key store proxy uses a public endpoint or an Amazon VPC endpoint service to communicate with KMS.
     *)

}

(** 
    KMS uses the authentication credential to sign requests that it sends to the external key store proxy (XKS proxy) on your behalf. You establish these credentials on your external key store proxy and report them to KMS.
    
     The [XksProxyAuthenticationCredential] includes two required elements.
      *)
type xks_proxy_authentication_credential_type = {
  raw_secret_access_key: string;
  (** 
    A secret string of 43-64 characters. Valid characters are a-z, A-Z, 0-9, /, +, and =.
     *)

  access_key_id: string;
  (** 
    A unique identifier for the raw secret access key.
     *)

}

(** 
    The request was rejected because the external key store proxy could not find the external key. This exception is thrown when the value of the [XksKeyId] parameter doesn't identify a key in the external key manager associated with the external key proxy.
    
     Verify that the [XksKeyId] represents an existing key in the external key manager. Use the key identifier that the external key store proxy uses to identify the key. For details, see the documentation provided with your external key store proxy or key manager.
      *)
type xks_key_not_found_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the external key specified by the [XksKeyId] parameter did not meet the configuration requirements for an external key store.
    
     The external key must be an AES-256 symmetric key that is enabled and performs encryption and decryption.
      *)
type xks_key_invalid_configuration_exception = {
  message: string option;
  
}

(** 
    Information about the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}external key}that is associated with a KMS key in an external key store.
    
     This element appears in a [CreateKey] or [DescribeKey] response only for a KMS key in an external key store.
     
      The {i external key} is a symmetric encryption key that is hosted by an external key manager outside of Amazon Web Services. When you use the KMS key in an external key store in a cryptographic operation, the cryptographic operation is performed in the external key manager using the specified external key. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}External key} in the {i Key Management Service Developer Guide}.
       *)
type xks_key_configuration_type = {
  id: string option;
  (** 
    The ID of the external key in its external key manager. This is the ID that the external key store proxy uses to identify the external key.
     *)

}

(** 
    The request was rejected because the ([XksKeyId]) is already associated with another KMS key in this external key store. Each KMS key in an external key store must be associated with a different external key.
     *)
type xks_key_already_in_use_exception = {
  message: string option;
  
}

type wrapping_key_spec = | SM2
  | RSA_4096
  | RSA_3072
  | RSA_2048

type signing_algorithm_spec = | SM2DSA
  | ECDSA_SHA_512
  | ECDSA_SHA_384
  | ECDSA_SHA_256
  | RSASSA_PKCS1_V1_5_SHA_512
  | RSASSA_PKCS1_V1_5_SHA_384
  | RSASSA_PKCS1_V1_5_SHA_256
  | RSASSA_PSS_SHA_512
  | RSASSA_PSS_SHA_384
  | RSASSA_PSS_SHA_256

type verify_response = {
  signing_algorithm: signing_algorithm_spec option;
  (** 
    The signing algorithm that was used to verify the signature.
     *)

  signature_valid: bool option;
  (** 
    A Boolean value that indicates whether the signature was verified. A value of [True] indicates that the [Signature] was produced by signing the [Message] with the specified [KeyID] and [SigningAlgorithm.] If the signature is not verified, the [Verify] operation fails with a [KMSInvalidSignatureException] exception.
     *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the asymmetric KMS key that was used to verify the signature.
     *)

}

type message_type = | DIGEST
  | RAW

type verify_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  signing_algorithm: signing_algorithm_spec;
  (** 
    The signing algorithm that was used to sign the message. If you submit a different algorithm, the signature verification fails.
     *)

  signature: bytes;
  (** 
    The signature that the [Sign] operation generated.
     *)

  message_type: message_type option;
  (** 
    Tells KMS whether the value of the [Message] parameter should be hashed as part of the signing algorithm. Use [RAW] for unhashed messages; use [DIGEST] for message digests, which are already hashed.
    
     When the value of [MessageType] is [RAW], KMS uses the standard signing algorithm, which begins with a hash function. When the value is [DIGEST], KMS skips the hashing step in the signing algorithm.
     
      Use the [DIGEST] value only when the value of the [Message] parameter is a message digest. If you use the [DIGEST] value with an unhashed message, the security of the verification operation can be compromised.
      
       When the value of [MessageType]is [DIGEST], the length of the [Message] value must match the length of hashed messages for the specified signing algorithm.
       
        You can submit a message digest and omit the [MessageType] or specify [RAW] so the digest is hashed again while signing. However, if the signed message is hashed once while signing, but twice while verifying, verification fails, even when the message hasn't changed.
        
         The hashing algorithm in that [Verify] uses is based on the [SigningAlgorithm] value.
         
          {ul
               {- Signing algorithms that end in SHA_256 use the SHA_256 hashing algorithm.
                  
                  }
                {- Signing algorithms that end in SHA_384 use the SHA_384 hashing algorithm.
                   
                   }
                {- Signing algorithms that end in SHA_512 use the SHA_512 hashing algorithm.
                   
                   }
                {- SM2DSA uses the SM3 hashing algorithm. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-sm-offline-verification}Offline verification with SM2 key pairs}.
                   
                   }
               
      }
       *)

  message: bytes;
  (** 
    Specifies the message that was signed. You can submit a raw message of up to 4096 bytes, or a hash digest of the message. If you submit a digest, use the [MessageType] parameter with a value of [DIGEST].
    
     If the message specified here is different from the message that was signed, the signature verification fails. A message and its hash digest are considered to be the same message.
      *)

  key_id: string;
  [@ocaml.doc {| 
    Identifies the asymmetric KMS key that will be used to verify the signature. This must be the same KMS key that was used to generate the signature. If you specify a different KMS key, the signature verification fails.
    
     To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
             {- Alias name: [alias/ExampleAlias]
                
                }
             {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

}

type mac_algorithm_spec = | HMAC_SHA_512
  | HMAC_SHA_384
  | HMAC_SHA_256
  | HMAC_SHA_224

type verify_mac_response = {
  mac_algorithm: mac_algorithm_spec option;
  (** 
    The MAC algorithm used in the verification.
     *)

  mac_valid: bool option;
  (** 
    A Boolean value that indicates whether the HMAC was verified. A value of [True] indicates that the HMAC ([Mac]) was generated with the specified [Message], HMAC KMS key ([KeyID]) and [MacAlgorithm.].
    
     If the HMAC is not verified, the [VerifyMac] operation fails with a [KMSInvalidMacException] exception. This exception indicates that one or more of the inputs changed since the HMAC was computed.
      *)

  key_id: string option;
  (** 
    The HMAC KMS key used in the verification.
     *)

}

type verify_mac_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  mac: bytes;
  (** 
    The HMAC to verify. Enter the HMAC that was generated by the [GenerateMac] operation when you specified the same message, HMAC KMS key, and MAC algorithm as the values specified in this request.
     *)

  mac_algorithm: mac_algorithm_spec;
  (** 
    The MAC algorithm that will be used in the verification. Enter the same MAC algorithm that was used to compute the HMAC. This algorithm must be supported by the HMAC KMS key identified by the [KeyId] parameter.
     *)

  key_id: string;
  (** 
    The KMS key that will be used in the verification.
    
     Enter a key ID of the KMS key that was used to generate the HMAC. If you identify a different KMS key, the [VerifyMac] operation fails.
      *)

  message: bytes;
  (** 
    The message that will be used in the verification. Enter the same message that was used to generate the HMAC.
    
     [GenerateMac] and [VerifyMac] do not provide special handling for message digests. If you generated an HMAC for a hash digest of a message, you must verify the HMAC for the same hash digest.
      *)

}

(** 
    The request was rejected because the specified entity or resource could not be found.
     *)
type not_found_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the state of the specified resource is not valid for this request.
    
     This exceptions means one of the following:
     
      {ul
           {- The key state of the KMS key is not compatible with the operation.
              
               To find the key state, use the [DescribeKey] operation. For more information about which key states are compatible with each KMS operation, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i {i Key Management Service Developer Guide}}.
               
               }
            {- For cryptographic operations on KMS keys in custom key stores, this exception represents a general failure with many possible causes. To identify the cause, see the error message that accompanies the exception.
               
               }
           
      }
       *)
type kms_invalid_state_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the HMAC verification failed. HMAC verification fails when the HMAC computed by using the specified message, HMAC KMS key, and MAC algorithm does not match the HMAC specified in the request.
     *)
type kms_invalid_mac_exception = {
  message: string option;
  
}

(** 
    The request was rejected because an internal exception occurred. The request can be retried.
     *)
type kms_internal_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the specified KMS key was not available. You can retry the request.
     *)
type key_unavailable_exception = {
  message: string option;
  
}

(** 
    The request was rejected for one of the following reasons:
    
     {ul
          {- The [KeyUsage] value of the KMS key is incompatible with the API operation.
             
             }
           {- The encryption algorithm or signing algorithm specified for the operation is incompatible with the type of key material in the KMS key [(KeySpec]).
              
              }
          
      }
       For encrypting, decrypting, re-encrypting, and generating data keys, the [KeyUsage] must be [ENCRYPT_DECRYPT]. For signing and verifying messages, the [KeyUsage] must be [SIGN_VERIFY]. For generating and verifying message authentication codes (MACs), the [KeyUsage] must be [GENERATE_VERIFY_MAC]. For deriving key agreement secrets, the [KeyUsage] must be [KEY_AGREEMENT]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.
       
        To find the encryption or signing algorithms supported for a particular KMS key, use the [DescribeKey] operation.
         *)
type invalid_key_usage_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the specified grant token is not valid.
     *)
type invalid_grant_token_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the DryRun parameter was specified.
     *)
type dry_run_operation_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the specified KMS key is not enabled.
     *)
type disabled_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the signature verification failed. Signature verification fails when it cannot confirm that signature was produced by signing the specified message with the specified KMS key and signing algorithm.
     *)
type kms_invalid_signature_exception = {
  message: string option;
  
}

(** 
    The system timed out while trying to fulfill the request. You can retry the request.
     *)
type dependency_timeout_exception = {
  message: string option;
  
}

type update_primary_region_request = {
  primary_region: string;
  (** 
    The Amazon Web Services Region of the new primary key. Enter the Region ID, such as [us-east-1] or [ap-southeast-2]. There must be an existing replica key in this Region.
    
     When the operation completes, the multi-Region key in this Region will be the primary key.
      *)

  key_id: string;
  (** 
    Identifies the current primary key. When the operation completes, this KMS key will be a replica key.
    
     Specify the key ID or key ARN of a multi-Region primary key.
     
      For example:
      
       {ul
            {- Key ID: [mrk-1234abcd12ab34cd56ef1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation.
     *)
type unsupported_operation_exception = {
  message: string option;
  
}

(** 
    The request was rejected because a specified ARN, or an ARN in a key policy, is not valid.
     *)
type invalid_arn_exception = {
  message: string option;
  
}

type update_key_description_request = {
  description: string;
  (** 
    New description for the KMS key.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      *)

  key_id: string;
  (** 
    Updates the description of the specified KMS key.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type update_custom_key_store_response = unit

type update_custom_key_store_request = {
  xks_proxy_connectivity: xks_proxy_connectivity_type option;
  (** 
    Changes the connectivity setting for the external key store. To indicate that the external key store proxy uses a Amazon VPC endpoint service to communicate with KMS, specify [VPC_ENDPOINT_SERVICE]. Otherwise, specify [PUBLIC_ENDPOINT].
    
     If you change the [XksProxyConnectivity] to [VPC_ENDPOINT_SERVICE], you must also change the [XksProxyUriEndpoint] and add an [XksProxyVpcEndpointServiceName] value.
     
      If you change the [XksProxyConnectivity] to [PUBLIC_ENDPOINT], you must also change the [XksProxyUriEndpoint] and specify a null or empty string for the [XksProxyVpcEndpointServiceName] value.
      
       To change this value, the external key store must be disconnected.
        *)

  xks_proxy_authentication_credential: xks_proxy_authentication_credential_type option;
  (** 
    Changes the credentials that KMS uses to sign requests to the external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].
    
     You must specify both the [AccessKeyId] and [SecretAccessKey] value in the authentication credential, even if you are only updating one value.
     
      This parameter doesn't establish or change your authentication credentials on the proxy. It just tells KMS the credential that you established with your external key store proxy. For example, if you rotate the credential on your external key store proxy, you can use this parameter to update the credential in KMS.
      
       You can change this value when the external key store is connected or disconnected.
        *)

  xks_proxy_vpc_endpoint_service_name: string option;
  (** 
    Changes the name that KMS uses to identify the Amazon VPC endpoint service for your external key store proxy (XKS proxy). This parameter is valid when the [CustomKeyStoreType] is [EXTERNAL_KEY_STORE] and the [XksProxyConnectivity] is [VPC_ENDPOINT_SERVICE].
    
     To change this value, the external key store must be disconnected.
      *)

  xks_proxy_uri_path: string option;
  (** 
    Changes the base path to the proxy APIs for this external key store. To find this value, see the documentation for your external key manager and external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].
    
     The value must start with [/] and must end with [/kms/xks/v1], where [v1] represents the version of the KMS external key store proxy API. You can include an optional prefix between the required elements such as 
     {[
     /{i example}/kms/xks/v1
     ]}
     .
     
      The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.
      
       You can change this value when the external key store is connected or disconnected.
        *)

  xks_proxy_uri_endpoint: string option;
  (** 
    Changes the URI endpoint that KMS uses to connect to your external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].
    
     For external key stores with an [XksProxyConnectivity] value of [PUBLIC_ENDPOINT], the protocol must be HTTPS.
     
      For external key stores with an [XksProxyConnectivity] value of [VPC_ENDPOINT_SERVICE], specify [https://] followed by the private DNS name associated with the VPC endpoint service. Each external key store must use a different private DNS name.
      
       The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.
       
        To change this value, the external key store must be disconnected.
         *)

  cloud_hsm_cluster_id: string option;
  (** 
    Associates the custom key store with a related CloudHSM cluster. This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].
    
     Enter the cluster ID of the cluster that you used to create the custom key store or a cluster that shares a backup history and has the same cluster certificate as the original cluster. You cannot use this parameter to associate a custom key store with an unrelated cluster. In addition, the replacement cluster must {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore}fulfill the requirements} for a cluster associated with a custom key store. To view the cluster certificate of a cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.
     
      To change this value, the CloudHSM key store must be disconnected.
       *)

  key_store_password: string option;
  (** 
    Enter the current password of the [kmsuser] crypto user (CU) in the CloudHSM cluster that is associated with the custom key store. This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].
    
     This parameter tells KMS the current password of the [kmsuser] crypto user (CU). It does not set or change the password of any users in the CloudHSM cluster.
     
      To change this value, the CloudHSM key store must be disconnected.
       *)

  new_custom_key_store_name: string option;
  (** 
    Changes the friendly name of the custom key store to the value that you specify. The custom key store name must be unique in the Amazon Web Services account.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      To change this value, an CloudHSM key store must be disconnected. An external key store can be connected or disconnected.
       *)

  custom_key_store_id: string;
  (** 
    Identifies the custom key store that you want to update. Enter the ID of the custom key store. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.
     *)

}

(** 
    The request was rejected because KMS cannot find a custom key store with the specified key store name or ID.
     *)
type custom_key_store_not_found_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the specified custom key store name is already assigned to another custom key store in the account. Try again with a custom key store name that is unique in the account.
     *)
type custom_key_store_name_in_use_exception = {
  message: string option;
  
}

(** 
    The request was rejected because of the [ConnectionState] of the custom key store. To get the [ConnectionState] of a custom key store, use the [DescribeCustomKeyStores] operation.
    
     This exception is thrown under the following conditions:
     
      {ul
           {- You requested the [ConnectCustomKeyStore] operation on a custom key store with a [ConnectionState] of [DISCONNECTING] or [FAILED]. This operation is valid for all other [ConnectionState] values. To reconnect a custom key store in a [FAILED] state, disconnect it ([DisconnectCustomKeyStore]), then connect it ([ConnectCustomKeyStore]).
              
              }
            {- You requested the [CreateKey] operation in a custom key store that is not connected. This operations is valid only when the custom key store [ConnectionState] is [CONNECTED].
               
               }
            {- You requested the [DisconnectCustomKeyStore] operation on a custom key store with a [ConnectionState] of [DISCONNECTING] or [DISCONNECTED]. This operation is valid for all other [ConnectionState] values.
               
               }
            {- You requested the [UpdateCustomKeyStore] or [DeleteCustomKeyStore] operation on a custom key store that is not disconnected. This operation is valid only when the custom key store [ConnectionState] is [DISCONNECTED].
               
               }
            {- You requested the [GenerateRandom] operation in an CloudHSM key store that is not connected. This operation is valid only when the CloudHSM key store [ConnectionState] is [CONNECTED].
               
               }
           
      }
       *)
type custom_key_store_invalid_state_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the specified CloudHSM cluster has a different cluster certificate than the original cluster. You cannot use the operation to specify an unrelated cluster for an CloudHSM key store.
    
     Specify an CloudHSM cluster that shares a backup history with the original cluster. This includes clusters that were created from a backup of the current cluster, and clusters that were created from the same backup that produced the current cluster.
     
      CloudHSM clusters that share a backup history have the same cluster certificate. To view the cluster certificate of an CloudHSM cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.
       *)
type cloud_hsm_cluster_not_related_exception = {
  message: string option;
  
}

(** 
    The request was rejected because KMS cannot find the CloudHSM cluster with the specified cluster ID. Retry the request with a different cluster ID.
     *)
type cloud_hsm_cluster_not_found_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the CloudHSM cluster associated with the CloudHSM key store is not active. Initialize and activate the cluster and try the command again. For detailed instructions, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/getting-started.html}Getting Started} in the {i CloudHSM User Guide}.
     *)
type cloud_hsm_cluster_not_active_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the associated CloudHSM cluster did not meet the configuration requirements for an CloudHSM key store.
    
     {ul
          {- The CloudHSM cluster must be configured with private subnets in at least two different Availability Zones in the Region.
             
             }
           {- The {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/configure-sg.html}security group for the cluster} (cloudhsm-cluster-{i }-sg) must include inbound rules and outbound rules that allow TCP traffic on ports 2223-2225. The {b Source} in the inbound rules and the {b Destination} in the outbound rules must match the security group ID. These rules are set by default when you create the CloudHSM cluster. Do not delete or change them. To get information about a particular security group, use the {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSecurityGroups.html}DescribeSecurityGroups} operation.
              
              }
           {- The CloudHSM cluster must contain at least as many HSMs as the operation requires. To add HSMs, use the CloudHSM {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html}CreateHsm} operation.
              
               For the [CreateCustomKeyStore], [UpdateCustomKeyStore], and [CreateKey] operations, the CloudHSM cluster must have at least two active HSMs, each in a different Availability Zone. For the [ConnectCustomKeyStore] operation, the CloudHSM must contain at least one active HSM.
               
               }
          
      }
       For information about the requirements for an CloudHSM cluster that is associated with an CloudHSM key store, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore}Assemble the Prerequisites} in the {i Key Management Service Developer Guide}. For information about creating a private subnet for an CloudHSM cluster, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/create-subnets.html}Create a Private Subnet} in the {i CloudHSM User Guide}. For information about cluster security groups, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/configure-sg.html}Configure a Default Security Group} in the {i {i CloudHSM User Guide}}.
        *)
type cloud_hsm_cluster_invalid_configuration_exception = {
  message: string option;
  
}

type update_alias_request = {
  target_key_id: string;
  (** 
    Identifies the {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key} to associate with the alias. You don't have permission to associate an alias with an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed key}.
    
     The KMS key must be in the same Amazon Web Services account and Region as the alias. Also, the new target KMS key must be the same type as the current target KMS key (both symmetric or both asymmetric or both HMAC) and they must have the same key usage.
     
      Specify the key ID or key ARN of the KMS key.
      
       For example:
       
        {ul
             {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
              {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                 
                 }
             
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
       
        To verify that the alias is mapped to the correct KMS key, use [ListAliases].
         *)

  alias_name: string;
  (** 
    Identifies the alias that is changing its KMS key. This value must begin with [alias/] followed by the alias name, such as [alias/ExampleAlias]. You cannot use [UpdateAlias] to change the alias name.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      *)

}

(** 
    The request was rejected because a quota was exceeded. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/limits.html}Quotas} in the {i Key Management Service Developer Guide}.
     *)
type limit_exceeded_exception = {
  message: string option;
  
}

type untag_resource_request = {
  tag_keys: string list;
  (** 
    One or more tag keys. Specify only the tag keys, not the tag values.
     *)

  key_id: string;
  (** 
    Identifies the KMS key from which you are removing tags.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    The request was rejected because one or more tags are not valid.
     *)
type tag_exception = {
  message: string option;
  
}

(** 
    A key-value pair. A tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      For information about the rules that apply to tag keys and tag values, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html}User-Defined Tag Restrictions} in the {i Amazon Web Services Billing and Cost Management User Guide}.
       *)
type tag = {
  tag_value: string;
  (** 
    The value of the tag.
     *)

  tag_key: string;
  (** 
    The key of the tag.
     *)

}

type tag_resource_request = {
  tags: tag list;
  (** 
    One or more tags. Each tag consists of a tag key and a tag value. The tag value can be an empty (null) string.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.
       *)

  key_id: string;
  (** 
    Identifies a customer managed key in the account and Region.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type sign_response = {
  signing_algorithm: signing_algorithm_spec option;
  (** 
    The signing algorithm that was used to sign the message.
     *)

  signature: bytes option;
  (** 
    The cryptographic signature that was generated for the message.
    
     {ul
          {- When used with the supported RSA signing algorithms, the encoding of this value is defined by {{:https://tools.ietf.org/html/rfc8017}PKCS #1 in RFC 8017}.
             
             }
           {- When used with the [ECDSA_SHA_256], [ECDSA_SHA_384], or [ECDSA_SHA_512] signing algorithms, this value is a DER-encoded object as defined by ANSI X9.62–2005 and {{:https://tools.ietf.org/html/rfc3279#section-2.2.3}RFC 3279 Section 2.2.3}. This is the most commonly used signature format and is appropriate for most uses.
              
              }
          
      }
       When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
        *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the asymmetric KMS key that was used to sign the message.
     *)

}

type sign_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  signing_algorithm: signing_algorithm_spec;
  (** 
    Specifies the signing algorithm to use when signing the message.
    
     Choose an algorithm that is compatible with the type and size of the specified asymmetric KMS key. When signing with RSA key pairs, RSASSA-PSS algorithms are preferred. We include RSASSA-PKCS1-v1_5 algorithms for compatibility with existing applications.
      *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  message_type: message_type option;
  (** 
    Tells KMS whether the value of the [Message] parameter should be hashed as part of the signing algorithm. Use [RAW] for unhashed messages; use [DIGEST] for message digests, which are already hashed.
    
     When the value of [MessageType] is [RAW], KMS uses the standard signing algorithm, which begins with a hash function. When the value is [DIGEST], KMS skips the hashing step in the signing algorithm.
     
      Use the [DIGEST] value only when the value of the [Message] parameter is a message digest. If you use the [DIGEST] value with an unhashed message, the security of the signing operation can be compromised.
      
       When the value of [MessageType]is [DIGEST], the length of the [Message] value must match the length of hashed messages for the specified signing algorithm.
       
        You can submit a message digest and omit the [MessageType] or specify [RAW] so the digest is hashed again while signing. However, this can cause verification failures when verifying with a system that assumes a single hash.
        
         The hashing algorithm in that [Sign] uses is based on the [SigningAlgorithm] value.
         
          {ul
               {- Signing algorithms that end in SHA_256 use the SHA_256 hashing algorithm.
                  
                  }
                {- Signing algorithms that end in SHA_384 use the SHA_384 hashing algorithm.
                   
                   }
                {- Signing algorithms that end in SHA_512 use the SHA_512 hashing algorithm.
                   
                   }
                {- SM2DSA uses the SM3 hashing algorithm. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-sm-offline-verification}Offline verification with SM2 key pairs}.
                   
                   }
               
      }
       *)

  message: bytes;
  (** 
    Specifies the message or message digest to sign. Messages can be 0-4096 bytes. To sign a larger message, provide a message digest.
    
     If you provide a message digest, use the [DIGEST] value of [MessageType] to prevent the digest from being hashed again while signing.
      *)

  key_id: string;
  [@ocaml.doc {| 
    Identifies an asymmetric KMS key. KMS uses the private key in the asymmetric KMS key to sign the message. The [KeyUsage] type of the KMS key must be [SIGN_VERIFY]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.
    
     To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
             {- Alias name: [alias/ExampleAlias]
                
                }
             {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

}

type key_state = | Updating
  | Unavailable
  | PendingReplicaDeletion
  | PendingImport
  | PendingDeletion
  | Disabled
  | Enabled
  | Creating

type schedule_key_deletion_response = {
  pending_window_in_days: int option;
  (** 
    The waiting period before the KMS key is deleted.
    
     If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.
      *)

  key_state: key_state option;
  (** 
    The current status of the KMS key.
    
     For more information about how key state affects the use of a KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
      *)

  deletion_date: float option;
  (** 
    The date and time after which KMS deletes the KMS key.
    
     If the KMS key is a multi-Region primary key with replica keys, this field does not appear. The deletion date for the primary key isn't known until its last replica key is deleted.
      *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key whose deletion is scheduled.
     *)

}

type schedule_key_deletion_request = {
  pending_window_in_days: int option;
  (** 
    The waiting period, specified in number of days. After the waiting period ends, KMS deletes the KMS key.
    
     If the KMS key is a multi-Region primary key with replica keys, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.
     
      This value is optional. If you include a value, it must be between 7 and 30, inclusive. If you do not include a value, it defaults to 30. You can use the {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-schedule-key-deletion-pending-window-in-days}[kms:ScheduleKeyDeletionPendingWindowInDays]} condition key to further constrain the values that principals can specify in the [PendingWindowInDays] parameter.
       *)

  key_id: string;
  (** 
    The unique identifier of the KMS key to delete.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    The request was rejected because an automatic rotation of this key is currently in progress or scheduled to begin within the next 20 minutes.
     *)
type conflict_exception = {
  message: string option;
  
}

type rotate_key_on_demand_response = {
  key_id: string option;
  (** 
    Identifies the symmetric encryption KMS key that you initiated on-demand rotation on.
     *)

}

type rotate_key_on_demand_request = {
  key_id: string;
  (** 
    Identifies a symmetric encryption KMS key. You cannot perform on-demand rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. To perform on-demand rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate}multi-Region keys}, invoke the on-demand rotation on the primary key.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    The request was rejected because the specified [GrantId] is not valid.
     *)
type invalid_grant_id_exception = {
  message: string option;
  
}

type revoke_grant_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  grant_id: string;
  (** 
    Identifies the grant to revoke. To get the grant ID, use [CreateGrant], [ListGrants], or [ListRetirableGrants].
     *)

  key_id: string;
  (** 
    A unique identifier for the KMS key associated with the grant. To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
    
     Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type retire_grant_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  grant_id: string option;
  (** 
    Identifies the grant to retire. To get the grant ID, use [CreateGrant], [ListGrants], or [ListRetirableGrants].
    
     {ul
          {- Grant ID Example - 0123456789012345678901234567890123456789012345678901234567890123
             
             }
          
      }
       *)

  key_id: string option;
  (** 
    The key ARN KMS key associated with the grant. To find the key ARN, use the [ListKeys] operation.
    
     For example: [arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab]
      *)

  grant_token: string option;
  (** 
    Identifies the grant to be retired. You can use a grant token to identify a new grant even before it has achieved eventual consistency.
    
     Only the [CreateGrant] operation returns a grant token. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency}Eventual consistency} in the {i Key Management Service Developer Guide}.
      *)

}

(** 
    The request was rejected because the specified policy is not syntactically or semantically correct.
     *)
type malformed_policy_document_exception = {
  message: string option;
  
}

(** 
    The request was rejected because it attempted to create a resource that already exists.
     *)
type already_exists_exception = {
  message: string option;
  
}

type key_usage_type = | KEY_AGREEMENT
  | GENERATE_VERIFY_MAC
  | ENCRYPT_DECRYPT
  | SIGN_VERIFY

type origin_type = | EXTERNAL_KEY_STORE
  | AWS_CLOUDHSM
  | EXTERNAL
  | AWS_KMS

type expiration_model_type = | KEY_MATERIAL_DOES_NOT_EXPIRE
  | KEY_MATERIAL_EXPIRES

type key_manager_type = | CUSTOMER
  | AWS

type customer_master_key_spec = | SM2
  | HMAC_512
  | HMAC_384
  | HMAC_256
  | HMAC_224
  | SYMMETRIC_DEFAULT
  | ECC_SECG_P256K1
  | ECC_NIST_P521
  | ECC_NIST_P384
  | ECC_NIST_P256
  | RSA_4096
  | RSA_3072
  | RSA_2048

type key_spec = | SM2
  | HMAC_512
  | HMAC_384
  | HMAC_256
  | HMAC_224
  | SYMMETRIC_DEFAULT
  | ECC_SECG_P256K1
  | ECC_NIST_P521
  | ECC_NIST_P384
  | ECC_NIST_P256
  | RSA_4096
  | RSA_3072
  | RSA_2048

type encryption_algorithm_spec = | SM2PKE
  | RSAES_OAEP_SHA_256
  | RSAES_OAEP_SHA_1
  | SYMMETRIC_DEFAULT

type key_agreement_algorithm_spec = | ECDH

type multi_region_key_type = | REPLICA
  | PRIMARY

(** 
    Describes the primary or replica key in a multi-Region key.
     *)
type multi_region_key = {
  region: string option;
  (** 
    Displays the Amazon Web Services Region of a primary or replica key in a multi-Region key.
     *)

  arn: string option;
  (** 
    Displays the key ARN of a primary or replica key of a multi-Region key.
     *)

}

(** 
    Describes the configuration of this multi-Region key. This field appears only when the KMS key is a primary or replica of a multi-Region key.
    
     For more information about any listed KMS key, use the [DescribeKey] operation.
      *)
type multi_region_configuration = {
  replica_keys: multi_region_key list option;
  (** 
    displays the key ARNs and Regions of all replica keys. This field includes the current KMS key if it is a replica key.
     *)

  primary_key: multi_region_key option;
  (** 
    Displays the key ARN and Region of the primary key. This field includes the current KMS key if it is the primary key.
     *)

  multi_region_key_type: multi_region_key_type option;
  (** 
    Indicates whether the KMS key is a [PRIMARY] or [REPLICA] key.
     *)

}

(** 
    Contains metadata about a KMS key.
    
     This data type is used as a response element for the [CreateKey], [DescribeKey], and [ReplicateKey] operations.
      *)
type key_metadata = {
  xks_key_configuration: xks_key_configuration_type option;
  (** 
    Information about the external key that is associated with a KMS key in an external key store.
    
     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}External key} in the {i Key Management Service Developer Guide}.
      *)

  mac_algorithms: mac_algorithm_spec list option;
  (** 
    The message authentication code (MAC) algorithm that the HMAC KMS key supports.
    
     This value is present only when the [KeyUsage] of the KMS key is [GENERATE_VERIFY_MAC].
      *)

  pending_deletion_window_in_days: int option;
  (** 
    The waiting period before the primary key in a multi-Region key is deleted. This waiting period begins when the last of its replica keys is deleted. This value is present only when the [KeyState] of the KMS key is [PendingReplicaDeletion]. That indicates that the KMS key is the primary key in a multi-Region key, it is scheduled for deletion, and it still has existing replica keys.
    
     When a single-Region KMS key or a multi-Region replica key is scheduled for deletion, its deletion date is displayed in the [DeletionDate] field. However, when the primary key in a multi-Region key is scheduled for deletion, its waiting period doesn't begin until all of its replica keys are deleted. This value displays that waiting period. When the last replica key in the multi-Region key is deleted, the [KeyState] of the scheduled primary key changes from [PendingReplicaDeletion] to [PendingDeletion] and the deletion date appears in the [DeletionDate] field.
      *)

  multi_region_configuration: multi_region_configuration option;
  (** 
    Lists the primary and replica keys in same multi-Region key. This field is present only when the value of the [MultiRegion] field is [True].
    
     For more information about any listed KMS key, use the [DescribeKey] operation.
     
      {ul
           {- [MultiRegionKeyType] indicates whether the KMS key is a [PRIMARY] or [REPLICA] key.
              
              }
            {- [PrimaryKey] displays the key ARN and Region of the primary key. This field displays the current KMS key if it is the primary key.
               
               }
            {- [ReplicaKeys] displays the key ARNs and Regions of all replica keys. This field includes the current KMS key if it is a replica key.
               
               }
           
      }
       *)

  multi_region: bool option;
  (** 
    Indicates whether the KMS key is a multi-Region ([True]) or regional ([False]) key. This value is [True] for multi-Region primary and replica keys and [False] for regional KMS keys.
    
     For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.
      *)

  key_agreement_algorithms: key_agreement_algorithm_spec list option;
  (** 
    The key agreement algorithm used to derive a shared secret.
     *)

  signing_algorithms: signing_algorithm_spec list option;
  (** 
    The signing algorithms that the KMS key supports. You cannot use the KMS key with other signing algorithms within KMS.
    
     This field appears only when the [KeyUsage] of the KMS key is [SIGN_VERIFY].
      *)

  encryption_algorithms: encryption_algorithm_spec list option;
  (** 
    The encryption algorithms that the KMS key supports. You cannot use the KMS key with other encryption algorithms within KMS.
    
     This value is present only when the [KeyUsage] of the KMS key is [ENCRYPT_DECRYPT].
      *)

  key_spec: key_spec option;
  (** 
    Describes the type of key material in the KMS key.
     *)

  customer_master_key_spec: customer_master_key_spec option;
  (** 
    Instead, use the [KeySpec] field.
    
     The [KeySpec] and [CustomerMasterKeySpec] fields have the same value. We recommend that you use the [KeySpec] field in your code. However, to avoid breaking changes, KMS supports both fields.
      *)

  key_manager: key_manager_type option;
  (** 
    The manager of the KMS key. KMS keys in your Amazon Web Services account are either customer managed or Amazon Web Services managed. For more information about the difference, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys}KMS keys} in the {i Key Management Service Developer Guide}.
     *)

  expiration_model: expiration_model_type option;
  (** 
    Specifies whether the KMS key's key material expires. This value is present only when [Origin] is [EXTERNAL], otherwise this value is omitted.
     *)

  cloud_hsm_cluster_id: string option;
  (** 
    The cluster ID of the CloudHSM cluster that contains the key material for the KMS key. When you create a KMS key in an CloudHSM {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}, KMS creates the key material for the KMS key in the associated CloudHSM cluster. This field is present only when the KMS key is created in an CloudHSM key store.
     *)

  custom_key_store_id: string option;
  (** 
    A unique identifier for the {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store} that contains the KMS key. This field is present only when the KMS key is created in a custom key store.
     *)

  origin: origin_type option;
  (** 
    The source of the key material for the KMS key. When this value is [AWS_KMS], KMS created the key material. When this value is [EXTERNAL], the key material was imported or the KMS key doesn't have any key material. When this value is [AWS_CLOUDHSM], the key material was created in the CloudHSM cluster associated with a custom key store.
     *)

  valid_to: float option;
  (** 
    The time at which the imported key material expires. When the key material expires, KMS deletes the key material and the KMS key becomes unusable. This value is present only for KMS keys whose [Origin] is [EXTERNAL] and whose [ExpirationModel] is [KEY_MATERIAL_EXPIRES], otherwise this value is omitted.
     *)

  deletion_date: float option;
  (** 
    The date and time after which KMS deletes this KMS key. This value is present only when the KMS key is scheduled for deletion, that is, when its [KeyState] is [PendingDeletion].
    
     When the primary key in a multi-Region key is scheduled for deletion but still has replica keys, its key state is [PendingReplicaDeletion] and the length of its waiting period is displayed in the [PendingDeletionWindowInDays] field.
      *)

  key_state: key_state option;
  (** 
    The current status of the KMS key.
    
     For more information about how key state affects the use of a KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.
      *)

  key_usage: key_usage_type option;
  (** 
    The {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} for which you can use the KMS key.
     *)

  description: string option;
  (** 
    The description of the KMS key.
     *)

  enabled: bool option;
  (** 
    Specifies whether the KMS key is enabled. When [KeyState] is [Enabled] this value is true, otherwise it is false.
     *)

  creation_date: float option;
  (** 
    The date and time when the KMS key was created.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the KMS key. For examples, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms}Key Management Service (KMS)} in the Example ARNs section of the {i Amazon Web Services General Reference}.
     *)

  key_id: string;
  (** 
    The globally unique identifier for the KMS key.
     *)

  aws_account_id: string option;
  (** 
    The twelve-digit account ID of the Amazon Web Services account that owns the KMS key.
     *)

}

type replicate_key_response = {
  replica_tags: tag list option;
  (** 
    The tags on the new replica key. The value is a list of tag key and tag value pairs.
     *)

  replica_policy: string option;
  (** 
    The key policy of the new replica key. The value is a key policy document in JSON format.
     *)

  replica_key_metadata: key_metadata option;
  (** 
    Displays details about the new replica key, including its Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) and {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys}. It also includes the ARN and Amazon Web Services Region of its primary key and other replica keys.
     *)

}

type replicate_key_request = {
  tags: tag list option;
  (** 
    Assigns one or more tags to the replica key. Use this parameter to tag the KMS key when it is created. To tag an existing KMS key, use the [TagResource] operation.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.
      
       To use this parameter, you must have {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:TagResource} permission in an IAM policy.
       
        Tags are not a shared property of multi-Region keys. You can specify the same tags or different tags for each key in a set of related multi-Region keys. KMS does not synchronize this property.
        
         Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required, but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.
         
          When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost allocation report with usage and costs aggregated by tags. Tags can also be used to control access to a KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tagging Keys}.
           *)

  description: string option;
  (** 
    A description of the KMS key. The default value is an empty string (no description).
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      The description is not a shared property of multi-Region keys. You can specify the same description or a different description for each key in a set of related multi-Region keys. KMS does not synchronize this property.
       *)

  bypass_policy_lockout_safety_check: bool option;
  [@ocaml.doc {| 
    Skips ("bypasses") the key policy lockout safety check. The default value is false.
    
     Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.
     
      For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}.
      
       Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} request on the KMS key.
        |}]

  policy: string option;
  (** 
    The key policy to attach to the KMS key. This parameter is optional. If you do not provide a key policy, KMS attaches the {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default}default key policy} to the KMS key.
    
     The key policy is not a shared property of multi-Region keys. You can specify the same key policy or a different key policy for each key in a set of related multi-Region keys. KMS does not synchronize this property.
     
      If you provide a key policy, it must meet the following criteria:
      
       {ul
            {- The key policy must allow the calling principal to make a subsequent [PutKeyPolicy] request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}. (To omit this condition, set [BypassPolicyLockoutSafetyCheck] to true.)
               
               }
             {- Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency}Changes that I make are not always immediately visible} in the {i Amazon Web Services Identity and Access Management User Guide}.
                
                }
            
      }
       A key policy document can include only the following characters:
       
        {ul
             {- Printable ASCII characters from the space character ([\u0020]) through the end of the ASCII character range.
                
                }
              {- Printable characters in the Basic Latin and Latin-1 Supplement character set (through [\u00FF]).
                 
                 }
              {- The tab ([\u0009]), line feed ([\u000A]), and carriage return ([\u000D]) special characters
                 
                 }
             
      }
       For information about key policies, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}Key policies in KMS} in the {i Key Management Service Developer Guide}. For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i {i Identity and Access Management User Guide}}.
        *)

  replica_region: string;
  (** 
    The Region ID of the Amazon Web Services Region for this replica key.
    
     Enter the Region ID, such as [us-east-1] or [ap-southeast-2]. For a list of Amazon Web Services Regions in which KMS is supported, see {{:https://docs.aws.amazon.com/general/latest/gr/kms.html#kms_region}KMS service endpoints} in the {i Amazon Web Services General Reference}.
     
      HMAC KMS keys are not supported in all Amazon Web Services Regions. If you try to replicate an HMAC KMS key in an Amazon Web Services Region in which HMAC keys are not supported, the [ReplicateKey] operation returns an [UnsupportedOperationException]. For a list of Regions in which HMAC KMS keys are supported, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC keys in KMS} in the {i Key Management Service Developer Guide}.
      
       The replica must be in a different Amazon Web Services Region than its primary key and other replicas of that primary key, but in the same Amazon Web Services partition. KMS must be available in the replica Region. If the Region is not enabled by default, the Amazon Web Services account must be enabled in the Region. For information about Amazon Web Services partitions, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)} in the {i Amazon Web Services General Reference}. For information about enabling and disabling Regions, see {{:https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-enable}Enabling a Region} and {{:https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-disable}Disabling a Region} in the {i Amazon Web Services General Reference}.
        *)

  key_id: string;
  (** 
    Identifies the multi-Region primary key that is being replicated. To determine whether a KMS key is a multi-Region primary key, use the [DescribeKey] operation to check the value of the [MultiRegionKeyType] property.
    
     Specify the key ID or key ARN of a multi-Region primary key.
     
      For example:
      
       {ul
            {- Key ID: [mrk-1234abcd12ab34cd56ef1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    From the [Decrypt] or [ReEncrypt] operation, the request was rejected because the specified ciphertext, or additional authenticated data incorporated into the ciphertext, such as the encryption context, is corrupted, missing, or otherwise invalid.
    
     From the [ImportKeyMaterial] operation, the request was rejected because KMS could not decrypt the encrypted (wrapped) key material.
      *)
type invalid_ciphertext_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the specified KMS key cannot decrypt the data. The [KeyId] in a [Decrypt] request and the [SourceKeyId] in a [ReEncrypt] request must identify the same KMS key that was used to encrypt the ciphertext.
     *)
type incorrect_key_exception = {
  message: string option;
  
}

type re_encrypt_response = {
  destination_encryption_algorithm: encryption_algorithm_spec option;
  (** 
    The encryption algorithm that was used to reencrypt the data.
     *)

  source_encryption_algorithm: encryption_algorithm_spec option;
  (** 
    The encryption algorithm that was used to decrypt the ciphertext before it was reencrypted.
     *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that was used to reencrypt the data.
     *)

  source_key_id: string option;
  (** 
    Unique identifier of the KMS key used to originally encrypt the data.
     *)

  ciphertext_blob: bytes option;
  (** 
    The reencrypted data. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
     *)

}

type re_encrypt_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  destination_encryption_algorithm: encryption_algorithm_spec option;
  (** 
    Specifies the encryption algorithm that KMS will use to reecrypt the data after it has decrypted it. The default value, [SYMMETRIC_DEFAULT], represents the encryption algorithm used for symmetric encryption KMS keys.
    
     This parameter is required only when the destination KMS key is an asymmetric KMS key.
      *)

  source_encryption_algorithm: encryption_algorithm_spec option;
  (** 
    Specifies the encryption algorithm that KMS will use to decrypt the ciphertext before it is reencrypted. The default value, [SYMMETRIC_DEFAULT], represents the algorithm used for symmetric encryption KMS keys.
    
     Specify the same algorithm that was used to encrypt the ciphertext. If you specify a different algorithm, the decrypt attempt fails.
     
      This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key.
       *)

  destination_encryption_context: (string * string) list option;
  (** 
    Specifies that encryption context to use when the reencrypting the data.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      A destination encryption context is valid only when the destination KMS key is a symmetric encryption KMS key. The standard ciphertext format for asymmetric KMS keys does not include fields for metadata.
      
       An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.
       
        For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.
         *)

  destination_key_id: string;
  [@ocaml.doc {| 
    A unique identifier for the KMS key that is used to reencrypt the data. Specify a symmetric encryption KMS key or an asymmetric KMS key with a [KeyUsage] value of [ENCRYPT_DECRYPT]. To find the [KeyUsage] value of a KMS key, use the [DescribeKey] operation.
    
     To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
             {- Alias name: [alias/ExampleAlias]
                
                }
             {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

  source_key_id: string option;
  [@ocaml.doc {| 
    Specifies the KMS key that KMS will use to decrypt the ciphertext before it is re-encrypted.
    
     Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a different KMS key, the [ReEncrypt] operation throws an [IncorrectKeyException].
     
      This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. If you used a symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the symmetric ciphertext blob. However, it is always recommended as a best practice. This practice ensures that you use the KMS key that you intend.
      
       To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
       
        For example:
        
         {ul
              {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
                 
                 }
               {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                  
                  }
               {- Alias name: [alias/ExampleAlias]
                  
                  }
               {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                  
                  }
              
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

  source_encryption_context: (string * string) list option;
  (** 
    Specifies the encryption context to use to decrypt the ciphertext. Enter the same encryption context that was used to encrypt the ciphertext.
    
     An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.
     
      For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.
       *)

  ciphertext_blob: bytes;
  (** 
    Ciphertext of the data to reencrypt.
     *)

}

type put_key_policy_request = {
  bypass_policy_lockout_safety_check: bool option;
  [@ocaml.doc {| 
    Skips ("bypasses") the key policy lockout safety check. The default value is false.
    
     Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.
     
      For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}.
      
       Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} request on the KMS key.
        |}]

  policy: string;
  (** 
    The key policy to attach to the KMS key.
    
     The key policy must meet the following criteria:
     
      {ul
           {- The key policy must allow the calling principal to make a subsequent [PutKeyPolicy] request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}. (To omit this condition, set [BypassPolicyLockoutSafetyCheck] to true.)
              
              }
            {- Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency}Changes that I make are not always immediately visible} in the {i Amazon Web Services Identity and Access Management User Guide}.
               
               }
           
      }
       A key policy document can include only the following characters:
       
        {ul
             {- Printable ASCII characters from the space character ([\u0020]) through the end of the ASCII character range.
                
                }
              {- Printable characters in the Basic Latin and Latin-1 Supplement character set (through [\u00FF]).
                 
                 }
              {- The tab ([\u0009]), line feed ([\u000A]), and carriage return ([\u000D]) special characters
                 
                 }
             
      }
       For information about key policies, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}Key policies in KMS} in the {i Key Management Service Developer Guide}.For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i {i Identity and Access Management User Guide}}.
        *)

  policy_name: string option;
  (** 
    The name of the key policy. If no policy name is specified, the default value is [default]. The only valid value is [default].
     *)

  key_id: string;
  (** 
    Sets the key policy on the specified KMS key.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    The request was rejected because the marker that specifies where pagination should next begin is not valid.
     *)
type invalid_marker_exception = {
  message: string option;
  
}

type grant_operation = | DeriveSharedSecret
  | VerifyMac
  | GenerateMac
  | GenerateDataKeyPairWithoutPlaintext
  | GenerateDataKeyPair
  | DescribeKey
  | RetireGrant
  | CreateGrant
  | GetPublicKey
  | Verify
  | Sign
  | ReEncryptTo
  | ReEncryptFrom
  | GenerateDataKeyWithoutPlaintext
  | GenerateDataKey
  | Encrypt
  | Decrypt

(** 
    Use this structure to allow {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} in the grant only when the operation request includes the specified {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}encryption context}.
    
     KMS applies the grant constraints only to cryptographic operations that support an encryption context, that is, all cryptographic operations with a {{:https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#symmetric-cmks}symmetric KMS key}. Grant constraints are not applied to operations that do not support an encryption context, such as cryptographic operations with asymmetric KMS keys and management operations, such as [DescribeKey] or [RetireGrant].
     
      In a cryptographic operation, the encryption context in the decryption operation must be an exact, case-sensitive match for the keys and values in the encryption context of the encryption operation. Only the order of the pairs can vary.
      
       However, in a grant constraint, the key in each key-value pair is not case sensitive, but the value is case sensitive.
       
        To avoid confusion, do not use multiple encryption context pairs that differ only by case. To require a fully case-sensitive encryption context, use the [kms:EncryptionContext:] and [kms:EncryptionContextKeys] conditions in an IAM or key policy. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-context}kms:EncryptionContext:} in the {i {i Key Management Service Developer Guide}}.
        
         *)
type grant_constraints = {
  encryption_context_equals: (string * string) list option;
  (** 
    A list of key-value pairs that must match the encryption context in the {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operation} request. The grant allows the operation only when the encryption context in the request is the same as the encryption context specified in this constraint.
     *)

  encryption_context_subset: (string * string) list option;
  (** 
    A list of key-value pairs that must be included in the encryption context of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operation} request. The grant allows the cryptographic operation only when the encryption context in the request includes the key-value pairs specified in this constraint, although it can include additional key-value pairs.
     *)

}

(** 
    Contains information about a grant.
     *)
type grant_list_entry = {
  constraints: grant_constraints option;
  (** 
    A list of key-value pairs that must be present in the encryption context of certain subsequent operations that the grant allows.
     *)

  operations: grant_operation list option;
  (** 
    The list of operations permitted by the grant.
     *)

  issuing_account: string option;
  (** 
    The Amazon Web Services account under which the grant was issued.
     *)

  retiring_principal: string option;
  (** 
    The principal that can retire the grant.
     *)

  grantee_principal: string option;
  (** 
    The identity that gets the permissions in the grant.
    
     The [GranteePrincipal] field in the [ListGrants] response usually contains the user or role designated as the grantee principal in the grant. However, when the grantee principal in the grant is an Amazon Web Services service, the [GranteePrincipal] field contains the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services}service principal}, which might represent several different grantee principals.
      *)

  creation_date: float option;
  (** 
    The date and time when the grant was created.
     *)

  name: string option;
  (** 
    The friendly name that identifies the grant. If a name was provided in the [CreateGrant] request, that name is returned. Otherwise this value is null.
     *)

  grant_id: string option;
  (** 
    The unique identifier for the grant.
     *)

  key_id: string option;
  (** 
    The unique identifier for the KMS key to which the grant applies.
     *)

}

type list_grants_response = {
  truncated: bool option;
  (** 
    A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.
     *)

  next_marker: string option;
  (** 
    When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.
     *)

  grants: grant_list_entry list option;
  (** 
    A list of grants.
     *)

}

type list_retirable_grants_request = {
  retiring_principal: string;
  (** 
    The retiring principal for which to list grants. Enter a principal in your Amazon Web Services account.
    
     To specify the retiring principal, use the {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Name (ARN)} of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs} in the {i {i Identity and Access Management User Guide}}.
      *)

  marker: string option;
  (** 
    Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.
     *)

  limit: int option;
  (** 
    Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.
    
     This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.
      *)

}

type list_resource_tags_response = {
  truncated: bool option;
  (** 
    A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.
     *)

  next_marker: string option;
  (** 
    When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.
    
     Do not assume or infer any information from this value.
      *)

  tags: tag list option;
  (** 
    A list of tags. Each tag consists of a tag key and a tag value.
    
     Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.
     
      *)

}

type list_resource_tags_request = {
  marker: string option;
  (** 
    Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.
    
     Do not attempt to construct this value. Use only the value of [NextMarker] from the truncated response you just received.
      *)

  limit: int option;
  (** 
    Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.
    
     This value is optional. If you include a value, it must be between 1 and 50, inclusive. If you do not include a value, it defaults to 50.
      *)

  key_id: string;
  (** 
    Gets tags on the specified KMS key.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    Contains information about each entry in the key list.
     *)
type key_list_entry = {
  key_arn: string option;
  (** 
    ARN of the key.
     *)

  key_id: string option;
  (** 
    Unique identifier of the key.
     *)

}

type list_keys_response = {
  truncated: bool option;
  (** 
    A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.
     *)

  next_marker: string option;
  (** 
    When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.
     *)

  keys: key_list_entry list option;
  (** 
    A list of KMS keys.
     *)

}

type list_keys_request = {
  marker: string option;
  (** 
    Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.
     *)

  limit: int option;
  (** 
    Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.
    
     This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.
      *)

}

type rotation_type = | ON_DEMAND
  | AUTOMATIC

(** 
    Contains information about completed key material rotations.
     *)
type rotations_list_entry = {
  rotation_type: rotation_type option;
  (** 
    Identifies whether the key material rotation was a scheduled {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotating-keys-enable-disable}automatic rotation} or an {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotating-keys-on-demand}on-demand rotation}.
     *)

  rotation_date: float option;
  (** 
    Date and time that the key material rotation completed. Formatted as Unix time.
     *)

  key_id: string option;
  (** 
    Unique identifier of the key.
     *)

}

type list_key_rotations_response = {
  truncated: bool option;
  (** 
    A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.
     *)

  next_marker: string option;
  (** 
    When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.
     *)

  rotations: rotations_list_entry list option;
  (** 
    A list of completed key material rotations.
     *)

}

type list_key_rotations_request = {
  marker: string option;
  (** 
    Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.
     *)

  limit: int option;
  (** 
    Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.
    
     This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.
      *)

  key_id: string;
  (** 
    Gets the key rotations for the specified KMS key.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type list_key_policies_response = {
  truncated: bool option;
  (** 
    A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.
     *)

  next_marker: string option;
  (** 
    When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.
     *)

  policy_names: string list option;
  (** 
    A list of key policy names. The only valid value is [default].
     *)

}

type list_key_policies_request = {
  marker: string option;
  (** 
    Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.
     *)

  limit: int option;
  (** 
    Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.
    
     This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.
     
      Only one policy can be attached to a key.
       *)

  key_id: string;
  (** 
    Gets the names of key policies for the specified KMS key.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type list_grants_request = {
  grantee_principal: string option;
  (** 
    Returns only grants where the specified principal is the grantee principal for the grant.
     *)

  grant_id: string option;
  (** 
    Returns only the grant with the specified grant ID. The grant ID uniquely identifies the grant.
     *)

  key_id: string;
  (** 
    Returns only grants for the specified KMS key. This parameter is required.
    
     Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

  marker: string option;
  (** 
    Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.
     *)

  limit: int option;
  (** 
    Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.
    
     This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.
      *)

}

(** 
    Contains information about an alias.
     *)
type alias_list_entry = {
  last_updated_date: float option;
  (** 
    Date and time that the alias was most recently associated with a KMS key in the account and Region. Formatted as Unix time.
     *)

  creation_date: float option;
  (** 
    Date and time that the alias was most recently created in the account and Region. Formatted as Unix time.
     *)

  target_key_id: string option;
  (** 
    String that contains the key identifier of the KMS key associated with the alias.
     *)

  alias_arn: string option;
  (** 
    String that contains the key ARN.
     *)

  alias_name: string option;
  (** 
    String that contains the alias. This value begins with [alias/].
     *)

}

type list_aliases_response = {
  truncated: bool option;
  (** 
    A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.
     *)

  next_marker: string option;
  (** 
    When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.
     *)

  aliases: alias_list_entry list option;
  (** 
    A list of aliases.
     *)

}

type list_aliases_request = {
  marker: string option;
  (** 
    Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.
     *)

  limit: int option;
  (** 
    Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.
    
     This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.
      *)

  key_id: string option;
  (** 
    Lists only aliases that are associated with the specified KMS key. Enter a KMS key in your Amazon Web Services account.
    
     This parameter is optional. If you omit it, [ListAliases] returns all aliases in the account and Region.
     
      Specify the key ID or key ARN of the KMS key.
      
       For example:
       
        {ul
             {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
              {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                 
                 }
             
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    The request was rejected because the provided import token is invalid or is associated with a different KMS key.
     *)
type invalid_import_token_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the key material in the request is, expired, invalid, or is not the same key material that was previously imported into this KMS key.
     *)
type incorrect_key_material_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the specified import token is expired. Use [GetParametersForImport] to get a new import token and public key, use the new public key to encrypt the key material, and then try the request again.
     *)
type expired_import_token_exception = {
  message: string option;
  
}

type import_key_material_response = unit

type import_key_material_request = {
  expiration_model: expiration_model_type option;
  (** 
    Specifies whether the key material expires. The default is [KEY_MATERIAL_EXPIRES]. For help with this choice, see {{:https://docs.aws.amazon.com/en_us/kms/latest/developerguide/importing-keys.html#importing-keys-expiration}Setting an expiration time} in the {i Key Management Service Developer Guide}.
    
     When the value of [ExpirationModel] is [KEY_MATERIAL_EXPIRES], you must specify a value for the [ValidTo] parameter. When value is [KEY_MATERIAL_DOES_NOT_EXPIRE], you must omit the [ValidTo] parameter.
     
      You cannot change the [ExpirationModel] or [ValidTo] values for the current import after the request completes. To change either value, you must reimport the key material.
       *)

  valid_to: float option;
  (** 
    The date and time when the imported key material expires. This parameter is required when the value of the [ExpirationModel] parameter is [KEY_MATERIAL_EXPIRES]. Otherwise it is not valid.
    
     The value of this parameter must be a future date and time. The maximum value is 365 days from the request date.
     
      When the key material expires, KMS deletes the key material from the KMS key. Without its key material, the KMS key is unusable. To use the KMS key in cryptographic operations, you must reimport the same key material.
      
       You cannot change the [ExpirationModel] or [ValidTo] values for the current import after the request completes. To change either value, you must delete ([DeleteImportedKeyMaterial]) and reimport the key material.
        *)

  encrypted_key_material: bytes;
  (** 
    The encrypted key material to import. The key material must be encrypted under the public wrapping key that [GetParametersForImport] returned, using the wrapping algorithm that you specified in the same [GetParametersForImport] request.
     *)

  import_token: bytes;
  (** 
    The import token that you received in the response to a previous [GetParametersForImport] request. It must be from the same response that contained the public key that you used to encrypt the key material.
     *)

  key_id: string;
  (** 
    The identifier of the KMS key that will be associated with the imported key material. This must be the same KMS key specified in the [KeyID] parameter of the corresponding [GetParametersForImport] request. The [Origin] of the KMS key must be [EXTERNAL] and its [KeyState] must be [PendingImport].
    
     The KMS key can be a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key, or asymmetric signing KMS key, including a {{:kms/latest/developerguide/multi-region-keys-overview.html}multi-Region key} of any supported type. You cannot perform this operation on a KMS key in a custom key store, or on a KMS key in a different Amazon Web Services account.
     
      Specify the key ID or key ARN of the KMS key.
      
       For example:
       
        {ul
             {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
              {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                 
                 }
             
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type get_public_key_response = {
  key_agreement_algorithms: key_agreement_algorithm_spec list option;
  (** 
    The key agreement algorithm used to derive a shared secret. This field is present only when the KMS key has a [KeyUsage] value of [KEY_AGREEMENT].
     *)

  signing_algorithms: signing_algorithm_spec list option;
  (** 
    The signing algorithms that KMS supports for this key.
    
     This field appears in the response only when the [KeyUsage] of the public key is [SIGN_VERIFY].
      *)

  encryption_algorithms: encryption_algorithm_spec list option;
  (** 
    The encryption algorithms that KMS supports for this key.
    
     This information is critical. If a public key encrypts data outside of KMS by using an unsupported encryption algorithm, the ciphertext cannot be decrypted.
     
      This field appears in the response only when the [KeyUsage] of the public key is [ENCRYPT_DECRYPT].
       *)

  key_usage: key_usage_type option;
  (** 
    The permitted use of the public key. Valid values for asymmetric key pairs are [ENCRYPT_DECRYPT], [SIGN_VERIFY], and [KEY_AGREEMENT].
    
     This information is critical. For example, if a public key with [SIGN_VERIFY] key usage encrypts data outside of KMS, the ciphertext cannot be decrypted.
      *)

  key_spec: key_spec option;
  (** 
    The type of the of the public key that was downloaded.
     *)

  customer_master_key_spec: customer_master_key_spec option;
  (** 
    Instead, use the [KeySpec] field in the [GetPublicKey] response.
    
     The [KeySpec] and [CustomerMasterKeySpec] fields have the same value. We recommend that you use the [KeySpec] field in your code. However, to avoid breaking changes, KMS supports both fields.
      *)

  public_key: bytes option;
  (** 
    The exported public key.
    
     The value is a DER-encoded X.509 public key, also known as [SubjectPublicKeyInfo] (SPKI), as defined in {{:https://tools.ietf.org/html/rfc5280}RFC 5280}. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
     
      
       *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the asymmetric KMS key from which the public key was downloaded.
     *)

}

type get_public_key_request = {
  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  key_id: string;
  [@ocaml.doc {| 
    Identifies the asymmetric KMS key that includes the public key.
    
     To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
             {- Alias name: [alias/ExampleAlias]
                
                }
             {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

}

type get_parameters_for_import_response = {
  parameters_valid_to: float option;
  (** 
    The time at which the import token and public key are no longer valid. After this time, you cannot use them to make an [ImportKeyMaterial] request and you must send another [GetParametersForImport] request to get new ones.
     *)

  public_key: bytes option;
  (** 
    The public key to use to encrypt the key material before importing it with [ImportKeyMaterial].
     *)

  import_token: bytes option;
  (** 
    The import token to send in a subsequent [ImportKeyMaterial] request.
     *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key to use in a subsequent [ImportKeyMaterial] request. This is the same KMS key specified in the [GetParametersForImport] request.
     *)

}

type algorithm_spec = | SM2PKE
  | RSA_AES_KEY_WRAP_SHA_256
  | RSA_AES_KEY_WRAP_SHA_1
  | RSAES_OAEP_SHA_256
  | RSAES_OAEP_SHA_1
  | RSAES_PKCS1_V1_5

type get_parameters_for_import_request = {
  wrapping_key_spec: wrapping_key_spec;
  (** 
    The type of RSA public key to return in the response. You will use this wrapping key with the specified wrapping algorithm to protect your key material during import.
    
     Use the longest RSA wrapping key that is practical.
     
      You cannot use an RSA_2048 public key to directly wrap an ECC_NIST_P521 private key. Instead, use an RSA_AES wrapping algorithm or choose a longer RSA public key.
       *)

  wrapping_algorithm: algorithm_spec;
  (** 
    The algorithm you will use with the RSA public key ([PublicKey]) in the response to protect your key material during import. For more information, see {{:kms/latest/developerguide/importing-keys-get-public-key-and-token.html#select-wrapping-algorithm}Select a wrapping algorithm} in the {i Key Management Service Developer Guide}.
    
     For RSA_AES wrapping algorithms, you encrypt your key material with an AES key that you generate, then encrypt your AES key with the RSA public key from KMS. For RSAES wrapping algorithms, you encrypt your key material directly with the RSA public key from KMS.
     
      The wrapping algorithms that you can use depend on the type of key material that you are importing. To import an RSA private key, you must use an RSA_AES wrapping algorithm.
      
       {ul
            {- {b RSA_AES_KEY_WRAP_SHA_256} — Supported for wrapping RSA and ECC key material.
               
               }
             {- {b RSA_AES_KEY_WRAP_SHA_1} — Supported for wrapping RSA and ECC key material.
                
                }
             {- {b RSAES_OAEP_SHA_256} — Supported for all types of key material, except RSA key material (private key).
                
                 You cannot use the RSAES_OAEP_SHA_256 wrapping algorithm with the RSA_2048 wrapping key spec to wrap ECC_NIST_P521 key material.
                 
                 }
             {- {b RSAES_OAEP_SHA_1} — Supported for all types of key material, except RSA key material (private key).
                
                 You cannot use the RSAES_OAEP_SHA_1 wrapping algorithm with the RSA_2048 wrapping key spec to wrap ECC_NIST_P521 key material.
                 
                 }
             {- {b RSAES_PKCS1_V1_5} (Deprecated) — As of October 10, 2023, KMS does not support the RSAES_PKCS1_V1_5 wrapping algorithm.
                
                }
            
      }
       *)

  key_id: string;
  (** 
    The identifier of the KMS key that will be associated with the imported key material. The [Origin] of the KMS key must be [EXTERNAL].
    
     All KMS key types are supported, including multi-Region keys. However, you cannot import key material into a KMS key in a custom key store.
     
      Specify the key ID or key ARN of the KMS key.
      
       For example:
       
        {ul
             {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
              {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                 
                 }
             
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type get_key_rotation_status_response = {
  on_demand_rotation_start_date: float option;
  (** 
    Identifies the date and time that an in progress on-demand rotation was initiated.
    
     The KMS API follows an {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}eventual consistency} model due to the distributed nature of the system. As a result, there might be a slight delay between initiating on-demand key rotation and the rotation's completion. Once the on-demand rotation is complete, use [ListKeyRotations] to view the details of the on-demand rotation.
      *)

  next_rotation_date: float option;
  (** 
    The next date that KMS will automatically rotate the key material.
     *)

  rotation_period_in_days: int option;
  (** 
    The number of days between each automatic rotation. The default value is 365 days.
     *)

  key_id: string option;
  (** 
    Identifies the specified symmetric encryption KMS key.
     *)

  key_rotation_enabled: bool option;
  (** 
    A Boolean value that specifies whether key rotation is enabled.
     *)

}

type get_key_rotation_status_request = {
  key_id: string;
  (** 
    Gets the rotation status for the specified KMS key.
    
     Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type get_key_policy_response = {
  policy_name: string option;
  (** 
    The name of the key policy. The only valid value is [default].
     *)

  policy: string option;
  (** 
    A key policy document in JSON format.
     *)

}

type get_key_policy_request = {
  policy_name: string option;
  (** 
    Specifies the name of the key policy. If no policy name is specified, the default value is [default]. The only valid name is [default]. To get the names of key policies, use [ListKeyPolicies].
     *)

  key_id: string;
  (** 
    Gets the key policy for the specified KMS key.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type generate_random_response = {
  ciphertext_for_recipient: bytes option;
  (** 
    The plaintext random bytes encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave.
    
     This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
      *)

  plaintext: bytes option;
  (** 
    The random byte string. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
    
     If the response includes the [CiphertextForRecipient] field, the [Plaintext] field is null or empty.
      *)

}

type key_encryption_mechanism = | RSAES_OAEP_SHA_256

(** 
    Contains information about the party that receives the response from the API operation.
    
     This data type is designed to support Amazon Web Services Nitro Enclaves, which lets you create an isolated compute environment in Amazon EC2. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
      *)
type recipient_info = {
  attestation_document: bytes option;
  (** 
    The attestation document for an Amazon Web Services Nitro Enclave. This document includes the enclave's public key.
     *)

  key_encryption_algorithm: key_encryption_mechanism option;
  (** 
    The encryption algorithm that KMS should use with the public key for an Amazon Web Services Nitro Enclave to encrypt plaintext values for the response. The only valid value is [RSAES_OAEP_SHA_256].
     *)

}

type generate_random_request = {
  recipient: recipient_info option;
  (** 
    A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256].
    
     This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK.
     
      When you use this parameter, instead of returning plaintext bytes, KMS encrypts the plaintext bytes under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [Plaintext] field in the response is null or empty.
      
       For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
        *)

  custom_key_store_id: string option;
  (** 
    Generates the random byte string in the CloudHSM cluster that is associated with the specified CloudHSM key store. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.
    
     External key store IDs are not valid for this parameter. If you specify the ID of an external key store, [GenerateRandom] throws an [UnsupportedOperationException].
      *)

  number_of_bytes: int option;
  (** 
    The length of the random byte string. This parameter is required.
     *)

}

type generate_mac_response = {
  key_id: string option;
  (** 
    The HMAC KMS key used in the operation.
     *)

  mac_algorithm: mac_algorithm_spec option;
  (** 
    The MAC algorithm that was used to generate the HMAC.
     *)

  mac: bytes option;
  (** 
    The hash-based message authentication code (HMAC) that was generated for the specified message, HMAC KMS key, and MAC algorithm.
    
     This is the standard, raw HMAC defined in {{:https://datatracker.ietf.org/doc/html/rfc2104}RFC 2104}.
      *)

}

type generate_mac_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  mac_algorithm: mac_algorithm_spec;
  (** 
    The MAC algorithm used in the operation.
    
     The algorithm must be compatible with the HMAC KMS key that you specify. To find the MAC algorithms that your HMAC KMS key supports, use the [DescribeKey] operation and see the [MacAlgorithms] field in the [DescribeKey] response.
      *)

  key_id: string;
  (** 
    The HMAC KMS key to use in the operation. The MAC algorithm computes the HMAC for the message and the key as described in {{:https://datatracker.ietf.org/doc/html/rfc2104}RFC 2104}.
    
     To identify an HMAC KMS key, use the [DescribeKey] operation and see the [KeySpec] field in the response.
      *)

  message: bytes;
  (** 
    The message to be hashed. Specify a message of up to 4,096 bytes.
    
     [GenerateMac] and [VerifyMac] do not provide special handling for message digests. If you generate an HMAC for a hash digest of a message, you must verify the HMAC of the same hash digest.
      *)

}

type generate_data_key_without_plaintext_response = {
  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the data key.
     *)

  ciphertext_blob: bytes option;
  (** 
    The encrypted data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
     *)

}

type data_key_spec = | AES_128
  | AES_256

type generate_data_key_without_plaintext_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  number_of_bytes: int option;
  (** 
    The length of the data key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use the [KeySpec] field instead of this one.
     *)

  key_spec: data_key_spec option;
  (** 
    The length of the data key. Use [AES_128] to generate a 128-bit symmetric key, or [AES_256] to generate a 256-bit symmetric key.
     *)

  encryption_context: (string * string) list option;
  (** 
    Specifies the encryption context that will be used when encrypting the data key.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.
      
       For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.
        *)

  key_id: string;
  [@ocaml.doc {| 
    Specifies the symmetric encryption KMS key that encrypts the data key. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.
    
     To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
             {- Alias name: [alias/ExampleAlias]
                
                }
             {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

}

type data_key_pair_spec = | SM2
  | ECC_SECG_P256K1
  | ECC_NIST_P521
  | ECC_NIST_P384
  | ECC_NIST_P256
  | RSA_4096
  | RSA_3072
  | RSA_2048

type generate_data_key_pair_without_plaintext_response = {
  key_pair_spec: data_key_pair_spec option;
  (** 
    The type of data key pair that was generated.
     *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the private key.
     *)

  public_key: bytes option;
  (** 
    The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
     *)

  private_key_ciphertext_blob: bytes option;
  (** 
    The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
     *)

}

type generate_data_key_pair_without_plaintext_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  key_pair_spec: data_key_pair_spec;
  (** 
    Determines the type of data key pair that is generated.
    
     The KMS rule that restricts the use of asymmetric RSA and SM2 KMS keys to encrypt and decrypt or to sign and verify (but not both), and the rule that permits you to use ECC KMS keys only to sign and verify, are not effective on data key pairs, which are used outside of KMS. The SM2 key spec is only available in China Regions.
      *)

  key_id: string;
  [@ocaml.doc {| 
    Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.
    
     To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
             {- Alias name: [alias/ExampleAlias]
                
                }
             {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

  encryption_context: (string * string) list option;
  (** 
    Specifies the encryption context that will be used when encrypting the private key in the data key pair.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.
      
       For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.
        *)

}

type generate_data_key_pair_response = {
  ciphertext_for_recipient: bytes option;
  (** 
    The plaintext private data key encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave.
    
     This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
      *)

  key_pair_spec: data_key_pair_spec option;
  (** 
    The type of data key pair that was generated.
     *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the private key.
     *)

  public_key: bytes option;
  (** 
    The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
     *)

  private_key_plaintext: bytes option;
  (** 
    The plaintext copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
    
     If the response includes the [CiphertextForRecipient] field, the [PrivateKeyPlaintext] field is null or empty.
      *)

  private_key_ciphertext_blob: bytes option;
  (** 
    The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
     *)

}

type generate_data_key_pair_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  recipient: recipient_info option;
  (** 
    A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256].
    
     This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To call DeriveSharedSecret for an Amazon Web Services Nitro Enclaves, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} to generate the attestation document and then use the Recipient parameter from any Amazon Web Services SDK to provide the attestation document for the enclave.
     
      When you use this parameter, instead of returning a plaintext copy of the private data key, KMS encrypts the plaintext private data key under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [CiphertextBlob] field in the response contains a copy of the private data key encrypted under the KMS key specified by the [KeyId] parameter. The [PrivateKeyPlaintext] field in the response is null or empty.
      
       For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
        *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  key_pair_spec: data_key_pair_spec;
  (** 
    Determines the type of data key pair that is generated.
    
     The KMS rule that restricts the use of asymmetric RSA and SM2 KMS keys to encrypt and decrypt or to sign and verify (but not both), and the rule that permits you to use ECC KMS keys only to sign and verify, are not effective on data key pairs, which are used outside of KMS. The SM2 key spec is only available in China Regions.
      *)

  key_id: string;
  [@ocaml.doc {| 
    Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.
    
     To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
             {- Alias name: [alias/ExampleAlias]
                
                }
             {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

  encryption_context: (string * string) list option;
  (** 
    Specifies the encryption context that will be used when encrypting the private key in the data key pair.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.
      
       For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.
        *)

}

type generate_data_key_response = {
  ciphertext_for_recipient: bytes option;
  (** 
    The plaintext data key encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave.
    
     This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
      *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the data key.
     *)

  plaintext: bytes option;
  (** 
    The plaintext data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded. Use this data key to encrypt your data outside of KMS. Then, remove it from memory as soon as possible.
    
     If the response includes the [CiphertextForRecipient] field, the [Plaintext] field is null or empty.
      *)

  ciphertext_blob: bytes option;
  (** 
    The encrypted copy of the data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
     *)

}

type generate_data_key_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  recipient: recipient_info option;
  (** 
    A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256].
    
     This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK.
     
      When you use this parameter, instead of returning the plaintext data key, KMS encrypts the plaintext data key under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [CiphertextBlob] field in the response contains a copy of the data key encrypted under the KMS key specified by the [KeyId] parameter. The [Plaintext] field in the response is null or empty.
      
       For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
        *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  key_spec: data_key_spec option;
  (** 
    Specifies the length of the data key. Use [AES_128] to generate a 128-bit symmetric key, or [AES_256] to generate a 256-bit symmetric key.
    
     You must specify either the [KeySpec] or the [NumberOfBytes] parameter (but not both) in every [GenerateDataKey] request.
      *)

  number_of_bytes: int option;
  (** 
    Specifies the length of the data key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For 128-bit (16-byte) and 256-bit (32-byte) data keys, use the [KeySpec] parameter.
    
     You must specify either the [KeySpec] or the [NumberOfBytes] parameter (but not both) in every [GenerateDataKey] request.
      *)

  encryption_context: (string * string) list option;
  (** 
    Specifies the encryption context that will be used when encrypting the data key.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.
      
       For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.
        *)

  key_id: string;
  [@ocaml.doc {| 
    Specifies the symmetric encryption KMS key that encrypts the data key. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.
    
     To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
             {- Alias name: [alias/ExampleAlias]
                
                }
             {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

}

type encrypt_response = {
  encryption_algorithm: encryption_algorithm_spec option;
  (** 
    The encryption algorithm that was used to encrypt the plaintext.
     *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that was used to encrypt the plaintext.
     *)

  ciphertext_blob: bytes option;
  (** 
    The encrypted plaintext. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
     *)

}

type encrypt_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  encryption_algorithm: encryption_algorithm_spec option;
  (** 
    Specifies the encryption algorithm that KMS will use to encrypt the plaintext message. The algorithm must be compatible with the KMS key that you specify.
    
     This parameter is required only for asymmetric KMS keys. The default value, [SYMMETRIC_DEFAULT], is the algorithm used for symmetric encryption KMS keys. If you are using an asymmetric KMS key, we recommend RSAES_OAEP_SHA_256.
     
      The SM2PKE algorithm is only available in China Regions.
       *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  encryption_context: (string * string) list option;
  (** 
    Specifies the encryption context that will be used to encrypt the data. An encryption context is valid only for {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC algorithms that KMS uses do not support an encryption context.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.
      
       For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.
        *)

  plaintext: bytes;
  (** 
    Data to be encrypted.
     *)

  key_id: string;
  [@ocaml.doc {| 
    Identifies the KMS key to use in the encryption operation. The KMS key must have a [KeyUsage] of [ENCRYPT_DECRYPT]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.
    
     To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
             {- Alias name: [alias/ExampleAlias]
                
                }
             {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

}

type enable_key_rotation_request = {
  rotation_period_in_days: int option;
  (** 
    Use this parameter to specify a custom period of time between each rotation date. If no value is specified, the default value is 365 days.
    
     The rotation period defines the number of days after you enable automatic key rotation that KMS will rotate your key material, and the number of days between each automatic rotation thereafter.
     
      You can use the {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-rotation-period-in-days}[kms:RotationPeriodInDays]} condition key to further constrain the values that principals can specify in the [RotationPeriodInDays] parameter.
      
       
        *)

  key_id: string;
  (** 
    Identifies a symmetric encryption KMS key. You cannot enable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. To enable or disable automatic rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate}multi-Region keys}, set the property on the primary key.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type enable_key_request = {
  key_id: string;
  (** 
    Identifies the KMS key to enable.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type disconnect_custom_key_store_response = unit

type disconnect_custom_key_store_request = {
  custom_key_store_id: string;
  (** 
    Enter the ID of the custom key store you want to disconnect. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.
     *)

}

type disable_key_rotation_request = {
  key_id: string;
  (** 
    Identifies a symmetric encryption KMS key. You cannot enable or disable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html#asymmetric-cmks}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type disable_key_request = {
  key_id: string;
  (** 
    Identifies the KMS key to disable.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

type describe_key_response = {
  key_metadata: key_metadata option;
  (** 
    Metadata associated with the key.
     *)

}

type describe_key_request = {
  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  key_id: string;
  [@ocaml.doc {| 
    Describes the specified KMS key.
    
     If you specify a predefined Amazon Web Services alias (an Amazon Web Services alias with no key ID), KMS associates the alias with an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html##aws-managed-cmk}Amazon Web Services managed key} and returns its [KeyId] and [Arn] in the response.
     
      To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
      
       For example:
       
        {ul
             {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
              {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                 
                 }
              {- Alias name: [alias/ExampleAlias]
                 
                 }
              {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                 
                 }
             
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

}

type connection_state_type = | DISCONNECTING
  | DISCONNECTED
  | FAILED
  | CONNECTING
  | CONNECTED

type connection_error_code_type = | XKS_PROXY_INVALID_TLS_CONFIGURATION
  | XKS_PROXY_TIMED_OUT
  | XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION
  | XKS_PROXY_INVALID_CONFIGURATION
  | XKS_PROXY_INVALID_RESPONSE
  | XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND
  | XKS_PROXY_NOT_REACHABLE
  | XKS_PROXY_ACCESS_DENIED
  | INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET
  | SUBNET_NOT_FOUND
  | USER_LOGGED_IN
  | USER_NOT_FOUND
  | USER_LOCKED_OUT
  | INSUFFICIENT_CLOUDHSM_HSMS
  | INTERNAL_ERROR
  | NETWORK_ERRORS
  | CLUSTER_NOT_FOUND
  | INVALID_CREDENTIALS

type custom_key_store_type = | EXTERNAL_KEY_STORE
  | AWS_CLOUDHSM

(** 
    Contains information about each custom key store in the custom key store list.
     *)
type custom_key_stores_list_entry = {
  xks_proxy_configuration: xks_proxy_configuration_type option;
  (** 
    Configuration settings for the external key store proxy (XKS proxy). The external key store proxy translates KMS requests into a format that your external key manager can understand. The proxy configuration includes connection information that KMS requires.
    
     This field appears only when the [CustomKeyStoreType] is [EXTERNAL_KEY_STORE].
      *)

  custom_key_store_type: custom_key_store_type option;
  (** 
    Indicates the type of the custom key store. [AWS_CLOUDHSM] indicates a custom key store backed by an CloudHSM cluster. [EXTERNAL_KEY_STORE] indicates a custom key store backed by an external key store proxy and external key manager outside of Amazon Web Services.
     *)

  creation_date: float option;
  (** 
    The date and time when the custom key store was created.
     *)

  connection_error_code: connection_error_code_type option;
  (** 
    Describes the connection error. This field appears in the response only when the [ConnectionState] is [FAILED].
    
     Many failures can be resolved by updating the properties of the custom key store. To update a custom key store, disconnect it ([DisconnectCustomKeyStore]), correct the errors ([UpdateCustomKeyStore]), and try to connect again ([ConnectCustomKeyStore]). For additional help resolving these errors, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed}How to Fix a Connection Failure} in {i Key Management Service Developer Guide}.
     
      {b All custom key stores:}
      
       {ul
            {- [INTERNAL_ERROR] — KMS could not complete the request due to an internal error. Retry the request. For [ConnectCustomKeyStore] requests, disconnect the custom key store before trying to connect again.
               
               }
             {- [NETWORK_ERRORS] — Network errors are preventing KMS from connecting the custom key store to its backing key store.
                
                }
            
      }
       {b CloudHSM key stores:}
       
        {ul
             {- [CLUSTER_NOT_FOUND] — KMS cannot find the CloudHSM cluster with the specified cluster ID.
                
                }
              {- [INSUFFICIENT_CLOUDHSM_HSMS] — The associated CloudHSM cluster does not contain any active HSMs. To connect a custom key store to its CloudHSM cluster, the cluster must contain at least one active HSM.
                 
                 }
              {- [INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET] — At least one private subnet associated with the CloudHSM cluster doesn't have any available IP addresses. A CloudHSM key store connection requires one free IP address in each of the associated private subnets, although two are preferable. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed}How to Fix a Connection Failure} in the {i Key Management Service Developer Guide}.
                 
                 }
              {- [INVALID_CREDENTIALS] — The [KeyStorePassword] for the custom key store doesn't match the current password of the [kmsuser] crypto user in the CloudHSM cluster. Before you can connect your custom key store to its CloudHSM cluster, you must change the [kmsuser] account password and update the [KeyStorePassword] value for the custom key store.
                 
                 }
              {- [SUBNET_NOT_FOUND] — A subnet in the CloudHSM cluster configuration was deleted. If KMS cannot find all of the subnets in the cluster configuration, attempts to connect the custom key store to the CloudHSM cluster fail. To fix this error, create a cluster from a recent backup and associate it with your custom key store. (This process creates a new cluster configuration with a VPC and private subnets.) For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed}How to Fix a Connection Failure} in the {i Key Management Service Developer Guide}.
                 
                 }
              {- [USER_LOCKED_OUT] — The [kmsuser] CU account is locked out of the associated CloudHSM cluster due to too many failed password attempts. Before you can connect your custom key store to its CloudHSM cluster, you must change the [kmsuser] account password and update the key store password value for the custom key store.
                 
                 }
              {- [USER_LOGGED_IN] — The [kmsuser] CU account is logged into the associated CloudHSM cluster. This prevents KMS from rotating the [kmsuser] account password and logging into the cluster. Before you can connect your custom key store to its CloudHSM cluster, you must log the [kmsuser] CU out of the cluster. If you changed the [kmsuser] password to log into the cluster, you must also and update the key store password value for the custom key store. For help, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#login-kmsuser-2}How to Log Out and Reconnect} in the {i Key Management Service Developer Guide}.
                 
                 }
              {- [USER_NOT_FOUND] — KMS cannot find a [kmsuser] CU account in the associated CloudHSM cluster. Before you can connect your custom key store to its CloudHSM cluster, you must create a [kmsuser] CU account in the cluster, and then update the key store password value for the custom key store.
                 
                 }
             
      }
       {b External key stores:}
       
        {ul
             {- [INVALID_CREDENTIALS] — One or both of the [XksProxyAuthenticationCredential] values is not valid on the specified external key store proxy.
                
                }
              {- [XKS_PROXY_ACCESS_DENIED] — KMS requests are denied access to the external key store proxy. If the external key store proxy has authorization rules, verify that they permit KMS to communicate with the proxy on your behalf.
                 
                 }
              {- [XKS_PROXY_INVALID_CONFIGURATION] — A configuration error is preventing the external key store from connecting to its proxy. Verify the value of the [XksProxyUriPath].
                 
                 }
              {- [XKS_PROXY_INVALID_RESPONSE] — KMS cannot interpret the response from the external key store proxy. If you see this connection error code repeatedly, notify your external key store proxy vendor.
                 
                 }
              {- [XKS_PROXY_INVALID_TLS_CONFIGURATION] — KMS cannot connect to the external key store proxy because the TLS configuration is invalid. Verify that the XKS proxy supports TLS 1.2 or 1.3. Also, verify that the TLS certificate is not expired, and that it matches the hostname in the [XksProxyUriEndpoint] value, and that it is signed by a certificate authority included in the {{:https://github.com/aws/aws-kms-xksproxy-api-spec/blob/main/TrustedCertificateAuthorities}Trusted Certificate Authorities} list.
                 
                 }
              {- [XKS_PROXY_NOT_REACHABLE] — KMS can't communicate with your external key store proxy. Verify that the [XksProxyUriEndpoint] and [XksProxyUriPath] are correct. Use the tools for your external key store proxy to verify that the proxy is active and available on its network. Also, verify that your external key manager instances are operating properly. Connection attempts fail with this connection error code if the proxy reports that all external key manager instances are unavailable.
                 
                 }
              {- [XKS_PROXY_TIMED_OUT] — KMS can connect to the external key store proxy, but the proxy does not respond to KMS in the time allotted. If you see this connection error code repeatedly, notify your external key store proxy vendor.
                 
                 }
              {- [XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION] — The Amazon VPC endpoint service configuration doesn't conform to the requirements for an KMS external key store.
                 
                  {ul
                       {- The VPC endpoint service must be an endpoint service for interface endpoints in the caller's Amazon Web Services account.
                          
                          }
                        {- It must have a network load balancer (NLB) connected to at least two subnets, each in a different Availability Zone.
                           
                           }
                        {- The [Allow principals] list must include the KMS service principal for the Region, 
                           {[
                           cks.kms..amazonaws.com
                           ]}
                           , such as [cks.kms.us-east-1.amazonaws.com].
                           
                           }
                        {- It must {i not} require {{:https://docs.aws.amazon.com/vpc/latest/privatelink/create-endpoint-service.html}acceptance} of connection requests.
                           
                           }
                        {- It must have a private DNS name. The private DNS name for an external key store with [VPC_ENDPOINT_SERVICE] connectivity must be unique in its Amazon Web Services Region.
                           
                           }
                        {- The domain of the private DNS name must have a {{:https://docs.aws.amazon.com/vpc/latest/privatelink/verify-domains.html}verification status} of [verified].
                           
                           }
                        {- The {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html}TLS certificate} specifies the private DNS hostname at which the endpoint is reachable.
                           
                           }
                       
               }
               }
              {- [XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND] — KMS can't find the VPC endpoint service that it uses to communicate with the external key store proxy. Verify that the [XksProxyVpcEndpointServiceName] is correct and the KMS service principal has service consumer permissions on the Amazon VPC endpoint service.
                 
                 }
             
      }
       *)

  connection_state: connection_state_type option;
  (** 
    Indicates whether the custom key store is connected to its backing key store. For an CloudHSM key store, the [ConnectionState] indicates whether it is connected to its CloudHSM cluster. For an external key store, the [ConnectionState] indicates whether it is connected to the external key store proxy that communicates with your external key manager.
    
     You can create and use KMS keys in your custom key stores only when its [ConnectionState] is [CONNECTED].
     
      The [ConnectionState] value is [DISCONNECTED] only if the key store has never been connected or you use the [DisconnectCustomKeyStore] operation to disconnect it. If the value is [CONNECTED] but you are having trouble using the custom key store, make sure that the backing key store is reachable and active. For an CloudHSM key store, verify that its associated CloudHSM cluster is active and contains at least one active HSM. For an external key store, verify that the external key store proxy and external key manager are connected and enabled.
      
       A value of [FAILED] indicates that an attempt to connect was unsuccessful. The [ConnectionErrorCode] field in the response indicates the cause of the failure. For help resolving a connection failure, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html}Troubleshooting a custom key store} in the {i Key Management Service Developer Guide}.
        *)

  trust_anchor_certificate: string option;
  (** 
    The trust anchor certificate of the CloudHSM cluster associated with an CloudHSM key store. When you {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr}initialize the cluster}, you create this certificate and save it in the [customerCA.crt] file.
    
     This field appears only when the [CustomKeyStoreType] is [AWS_CLOUDHSM].
      *)

  cloud_hsm_cluster_id: string option;
  (** 
    A unique identifier for the CloudHSM cluster that is associated with an CloudHSM key store. This field appears only when the [CustomKeyStoreType] is [AWS_CLOUDHSM].
     *)

  custom_key_store_name: string option;
  (** 
    The user-specified friendly name for the custom key store.
     *)

  custom_key_store_id: string option;
  (** 
    A unique identifier for the custom key store.
     *)

}

type describe_custom_key_stores_response = {
  truncated: bool option;
  (** 
    A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.
     *)

  next_marker: string option;
  (** 
    When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.
     *)

  custom_key_stores: custom_key_stores_list_entry list option;
  (** 
    Contains metadata about each custom key store.
     *)

}

type describe_custom_key_stores_request = {
  marker: string option;
  (** 
    Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.
     *)

  limit: int option;
  (** 
    Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.
     *)

  custom_key_store_name: string option;
  (** 
    Gets only information about the specified custom key store. Enter the friendly name of the custom key store.
    
     By default, this operation gets information about all custom key stores in the account and Region. To limit the output to a particular custom key store, provide either the [CustomKeyStoreId] or [CustomKeyStoreName] parameter, but not both.
      *)

  custom_key_store_id: string option;
  (** 
    Gets only information about the specified custom key store. Enter the key store ID.
    
     By default, this operation gets information about all custom key stores in the account and Region. To limit the output to a particular custom key store, provide either the [CustomKeyStoreId] or [CustomKeyStoreName] parameter, but not both.
      *)

}

type derive_shared_secret_response = {
  key_origin: origin_type option;
  (** 
    The source of the key material for the specified KMS key.
    
     When this value is [AWS_KMS], KMS created the key material. When this value is [EXTERNAL], the key material was imported or the KMS key doesn't have any key material.
     
      The only valid values for DeriveSharedSecret are [AWS_KMS] and [EXTERNAL]. DeriveSharedSecret does not support KMS keys with a [KeyOrigin] value of [AWS_CLOUDHSM] or [EXTERNAL_KEY_STORE].
       *)

  key_agreement_algorithm: key_agreement_algorithm_spec option;
  (** 
    Identifies the key agreement algorithm used to derive the shared secret.
     *)

  ciphertext_for_recipient: bytes option;
  (** 
    The plaintext shared secret encrypted with the public key in the attestation document.
    
     This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
      *)

  shared_secret: bytes option;
  (** 
    The raw secret derived from the specified key agreement algorithm, private key in the asymmetric KMS key, and your peer's public key.
    
     If the response includes the [CiphertextForRecipient] field, the [SharedSecret] field is null or empty.
      *)

  key_id: string option;
  (** 
    Identifies the KMS key used to derive the shared secret.
     *)

}

type derive_shared_secret_request = {
  recipient: recipient_info option;
  (** 
    A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256].
    
     This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To call DeriveSharedSecret for an Amazon Web Services Nitro Enclaves, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} to generate the attestation document and then use the Recipient parameter from any Amazon Web Services SDK to provide the attestation document for the enclave.
     
      When you use this parameter, instead of returning a plaintext copy of the shared secret, KMS encrypts the plaintext shared secret under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [CiphertextBlob] field in the response contains the encrypted shared secret derived from the KMS key specified by the [KeyId] parameter and public key specified by the [PublicKey] parameter. The [SharedSecret] field in the response is null or empty.
      
       For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
        *)

  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  public_key: bytes;
  (** 
    Specifies the public key in your peer's NIST-recommended elliptic curve (ECC) or SM2 (China Regions only) key pair.
    
     The public key must be a DER-encoded X.509 public key, also known as [SubjectPublicKeyInfo] (SPKI), as defined in {{:https://tools.ietf.org/html/rfc5280}RFC 5280}.
     
      [GetPublicKey] returns the public key of an asymmetric KMS key pair in the required DER-encoded format.
      
       If you use {{:https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-welcome.html}Amazon Web Services CLI version 1}, you must provide the DER-encoded X.509 public key in a file. Otherwise, the Amazon Web Services CLI Base64-encodes the public key a second time, resulting in a [ValidationException].
       
        You can specify the public key as binary data in a file using fileb (
        {[
        fileb://
        ]}
        ) or in-line using a Base64 encoded string.
         *)

  key_agreement_algorithm: key_agreement_algorithm_spec;
  (** 
    Specifies the key agreement algorithm used to derive the shared secret. The only valid value is [ECDH].
     *)

  key_id: string;
  [@ocaml.doc {| 
    Identifies an asymmetric NIST-recommended ECC or SM2 (China Regions only) KMS key. KMS uses the private key in the specified key pair to derive the shared secret. The key usage of the KMS key must be [KEY_AGREEMENT]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.
    
     To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
             {- Alias name: [alias/ExampleAlias]
                
                }
             {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

}

type delete_imported_key_material_request = {
  key_id: string;
  (** 
    Identifies the KMS key from which you are deleting imported key material. The [Origin] of the KMS key must be [EXTERNAL].
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    The request was rejected because the custom key store contains KMS keys. After verifying that you do not need to use the KMS keys, use the [ScheduleKeyDeletion] operation to delete the KMS keys. After they are deleted, you can delete the custom key store.
     *)
type custom_key_store_has_cm_ks_exception = {
  message: string option;
  
}

type delete_custom_key_store_response = unit

type delete_custom_key_store_request = {
  custom_key_store_id: string;
  (** 
    Enter the ID of the custom key store you want to delete. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.
     *)

}

type delete_alias_request = {
  alias_name: string;
  (** 
    The alias to be deleted. The alias name must begin with [alias/] followed by the alias name, such as [alias/ExampleAlias].
     *)

}

type decrypt_response = {
  ciphertext_for_recipient: bytes option;
  (** 
    The plaintext data encrypted with the public key in the attestation document.
    
     This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
      *)

  encryption_algorithm: encryption_algorithm_spec option;
  (** 
    The encryption algorithm that was used to decrypt the ciphertext.
     *)

  plaintext: bytes option;
  (** 
    Decrypted plaintext data. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
    
     If the response includes the [CiphertextForRecipient] field, the [Plaintext] field is null or empty.
      *)

  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that was used to decrypt the ciphertext.
     *)

}

type decrypt_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  recipient: recipient_info option;
  (** 
    A signed {{:https://docs.aws.amazon.com/enclaves/latest/user/nitro-enclave-concepts.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256].
    
     This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK.
     
      When you use this parameter, instead of returning the plaintext data, KMS encrypts the plaintext data with the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [Plaintext] field in the response is null or empty.
      
       For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.
        *)

  encryption_algorithm: encryption_algorithm_spec option;
  (** 
    Specifies the encryption algorithm that will be used to decrypt the ciphertext. Specify the same algorithm that was used to encrypt the data. If you specify a different algorithm, the [Decrypt] operation fails.
    
     This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. The default value, [SYMMETRIC_DEFAULT], represents the only supported algorithm that is valid for symmetric encryption KMS keys.
      *)

  key_id: string option;
  [@ocaml.doc {| 
    Specifies the KMS key that KMS uses to decrypt the ciphertext.
    
     Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a different KMS key, the [Decrypt] operation throws an [IncorrectKeyException].
     
      This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. If you used a symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the symmetric ciphertext blob. However, it is always recommended as a best practice. This practice ensures that you use the KMS key that you intend.
      
       To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with ["alias/"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
       
        For example:
        
         {ul
              {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
                 
                 }
               {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                  
                  }
               {- Alias name: [alias/ExampleAlias]
                  
                  }
               {- Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias]
                  
                  }
              
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].
        |}]

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  encryption_context: (string * string) list option;
  (** 
    Specifies the encryption context to use when decrypting the data. An encryption context is valid only for {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC algorithms that KMS uses do not support an encryption context.
    
     An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.
     
      For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.
       *)

  ciphertext_blob: bytes;
  (** 
    Ciphertext to be decrypted. The blob includes metadata.
     *)

}

type create_key_response = {
  key_metadata: key_metadata option;
  (** 
    Metadata associated with the KMS key.
     *)

}

type create_key_request = {
  xks_key_id: string option;
  (** 
    Identifies the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}external key} that serves as key material for the KMS key in an {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html}external key store}. Specify the ID that the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-xks-proxy}external key store proxy} uses to refer to the external key. For help, see the documentation for your external key store proxy.
    
     This parameter is required for a KMS key with an [Origin] value of [EXTERNAL_KEY_STORE]. It is not valid for KMS keys with any other [Origin] value.
     
      The external key must be an existing 256-bit AES symmetric encryption key hosted outside of Amazon Web Services in an external key manager associated with the external key store specified by the [CustomKeyStoreId] parameter. This key must be enabled and configured to perform encryption and decryption. Each KMS key in an external key store must use a different external key. For details, see {{:https://docs.aws.amazon.com/create-xks-keys.html#xks-key-requirements}Requirements for a KMS key in an external key store} in the {i Key Management Service Developer Guide}.
      
       Each KMS key in an external key store is associated two backing keys. One is key material that KMS generates. The other is the external key specified by this parameter. When you use the KMS key in an external key store to encrypt data, the encryption operation is performed first by KMS using the KMS key material, and then by the external key manager using the specified external key, a process known as {i double encryption}. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-double-encryption}Double encryption} in the {i Key Management Service Developer Guide}.
        *)

  multi_region: bool option;
  (** 
    Creates a multi-Region primary key that you can replicate into other Amazon Web Services Regions. You cannot change this value after you create the KMS key.
    
     For a multi-Region key, set this parameter to [True]. For a single-Region KMS key, omit this parameter or set it to [False]. The default value is [False].
     
      This operation supports {i multi-Region keys}, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.
      
       This value creates a {i primary key}, not a replica. To create a {i replica key}, use the [ReplicateKey] operation.
       
        You can create a symmetric or asymmetric multi-Region key, and you can create a multi-Region key with imported key material. However, you cannot create a multi-Region key in a custom key store.
         *)

  tags: tag list option;
  (** 
    Assigns one or more tags to the KMS key. Use this parameter to tag the KMS key when it is created. To tag an existing KMS key, use the [TagResource] operation.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.
      
       To use this parameter, you must have {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:TagResource} permission in an IAM policy.
       
        Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required, but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.
        
         When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost allocation report with usage and costs aggregated by tags. Tags can also be used to control access to a KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tagging Keys}.
          *)

  bypass_policy_lockout_safety_check: bool option;
  [@ocaml.doc {| 
    Skips ("bypasses") the key policy lockout safety check. The default value is false.
    
     Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.
     
      For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}.
      
       Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} request on the KMS key.
        |}]

  custom_key_store_id: string option;
  (** 
    Creates the KMS key in the specified {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. The [ConnectionState] of the custom key store must be [CONNECTED]. To find the CustomKeyStoreID and ConnectionState use the [DescribeCustomKeyStores] operation.
    
     This parameter is valid only for symmetric encryption KMS keys in a single Region. You cannot create any other type of KMS key in a custom key store.
     
      When you create a KMS key in an CloudHSM key store, KMS generates a non-exportable 256-bit symmetric key in its associated CloudHSM cluster and associates it with the KMS key. When you create a KMS key in an external key store, you must use the [XksKeyId] parameter to specify an external key that serves as key material for the KMS key.
       *)

  origin: origin_type option;
  (** 
    The source of the key material for the KMS key. You cannot change the origin after you create the KMS key. The default is [AWS_KMS], which means that KMS creates the key material.
    
     To {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-create-cmk.html}create a KMS key with no key material} (for imported key material), set this value to [EXTERNAL]. For more information about importing key material into KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing Key Material} in the {i Key Management Service Developer Guide}. The [EXTERNAL] origin value is valid only for symmetric KMS keys.
     
      To {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-cmk-keystore.html}create a KMS key in an CloudHSM key store} and create its key material in the associated CloudHSM cluster, set this value to [AWS_CLOUDHSM]. You must also use the [CustomKeyStoreId] parameter to identify the CloudHSM key store. The [KeySpec] value must be [SYMMETRIC_DEFAULT].
      
       To {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keys.html}create a KMS key in an external key store}, set this value to [EXTERNAL_KEY_STORE]. You must also use the [CustomKeyStoreId] parameter to identify the external key store and the [XksKeyId] parameter to identify the associated external key. The [KeySpec] value must be [SYMMETRIC_DEFAULT].
        *)

  key_spec: key_spec option;
  (** 
    Specifies the type of KMS key to create. The default value, [SYMMETRIC_DEFAULT], creates a KMS key with a 256-bit AES-GCM key that is used for encryption and decryption, except in China Regions, where it creates a 128-bit symmetric key that uses SM4 encryption. For help choosing a key spec for your KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-types.html#symm-asymm-choose}Choosing a KMS key type} in the {i {i Key Management Service Developer Guide}}.
    
     The [KeySpec] determines whether the KMS key contains a symmetric key or an asymmetric key pair. It also determines the algorithms that the KMS key supports. You can't change the [KeySpec] after the KMS key is created. To further restrict the algorithms that can be used with the KMS key, use a condition key in its key policy or IAM policy. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-algorithm}kms:EncryptionAlgorithm}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-mac-algorithm}kms:MacAlgorithm} or {{:https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-signing-algorithm}kms:Signing Algorithm} in the {i {i Key Management Service Developer Guide}}.
     
      {{:http://aws.amazon.com/kms/features/#AWS_Service_Integration}Amazon Web Services services that are integrated with KMS} use symmetric encryption KMS keys to protect your data. These services do not support asymmetric KMS keys or HMAC KMS keys.
      
       KMS supports the following key specs for KMS keys:
       
        {ul
             {- Symmetric encryption key (default)
                
                 {ul
                      {- [SYMMETRIC_DEFAULT]
                         
                         }
                      
               }
               }
              {- HMAC keys (symmetric)
                 
                  {ul
                       {- [HMAC_224]
                          
                          }
                        {- [HMAC_256]
                           
                           }
                        {- [HMAC_384]
                           
                           }
                        {- [HMAC_512]
                           
                           }
                       
               }
               }
              {- Asymmetric RSA key pairs (encryption and decryption -or- signing and verification)
                 
                  {ul
                       {- [RSA_2048]
                          
                          }
                        {- [RSA_3072]
                           
                           }
                        {- [RSA_4096]
                           
                           }
                       
               }
               }
              {- Asymmetric NIST-recommended elliptic curve key pairs (signing and verification -or- deriving shared secrets)
                 
                  {ul
                       {- [ECC_NIST_P256] (secp256r1)
                          
                          }
                        {- [ECC_NIST_P384] (secp384r1)
                           
                           }
                        {- [ECC_NIST_P521] (secp521r1)
                           
                           }
                       
               }
               }
              {- Other asymmetric elliptic curve key pairs (signing and verification)
                 
                  {ul
                       {- [ECC_SECG_P256K1] (secp256k1), commonly used for cryptocurrencies.
                          
                          }
                       
               }
               }
              {- SM2 key pairs (encryption and decryption -or- signing and verification -or- deriving shared secrets)
                 
                  {ul
                       {- [SM2] (China Regions only)
                          
                          }
                       
               }
               }
             
      }
       *)

  customer_master_key_spec: customer_master_key_spec option;
  (** 
    Instead, use the [KeySpec] parameter.
    
     The [KeySpec] and [CustomerMasterKeySpec] parameters work the same way. Only the names differ. We recommend that you use [KeySpec] parameter in your code. However, to avoid breaking changes, KMS supports both parameters.
      *)

  key_usage: key_usage_type option;
  (** 
    Determines the {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} for which you can use the KMS key. The default value is [ENCRYPT_DECRYPT]. This parameter is optional when you are creating a symmetric encryption KMS key; otherwise, it is required. You can't change the [KeyUsage] value after the KMS key is created.
    
     Select only one valid value.
     
      {ul
           {- For symmetric encryption KMS keys, omit the parameter or specify [ENCRYPT_DECRYPT].
              
              }
            {- For HMAC KMS keys (symmetric), specify [GENERATE_VERIFY_MAC].
               
               }
            {- For asymmetric KMS keys with RSA key pairs, specify [ENCRYPT_DECRYPT] or [SIGN_VERIFY].
               
               }
            {- For asymmetric KMS keys with NIST-recommended elliptic curve key pairs, specify [SIGN_VERIFY] or [KEY_AGREEMENT].
               
               }
            {- For asymmetric KMS keys with [ECC_SECG_P256K1] key pairs specify [SIGN_VERIFY].
               
               }
            {- For asymmetric KMS keys with SM2 key pairs (China Regions only), specify [ENCRYPT_DECRYPT], [SIGN_VERIFY], or [KEY_AGREEMENT].
               
               }
           
      }
       *)

  description: string option;
  (** 
    A description of the KMS key. Use a description that helps you decide whether the KMS key is appropriate for a task. The default value is an empty string (no description).
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      To set or change the description after the key is created, use [UpdateKeyDescription].
       *)

  policy: string option;
  (** 
    The key policy to attach to the KMS key.
    
     If you provide a key policy, it must meet the following criteria:
     
      {ul
           {- The key policy must allow the calling principal to make a subsequent [PutKeyPolicy] request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}. (To omit this condition, set [BypassPolicyLockoutSafetyCheck] to true.)
              
              }
            {- Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency}Changes that I make are not always immediately visible} in the {i Amazon Web Services Identity and Access Management User Guide}.
               
               }
           
      }
       If you do not provide a key policy, KMS attaches a default key policy to the KMS key. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default}Default key policy} in the {i Key Management Service Developer Guide}.
       
        The key policy size quota is 32 kilobytes (32768 bytes).
        
         For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i {i Identity and Access Management User Guide}}.
          *)

}

type create_grant_response = {
  grant_id: string option;
  (** 
    The unique identifier for the grant.
    
     You can use the [GrantId] in a [ListGrants], [RetireGrant], or [RevokeGrant] operation.
      *)

  grant_token: string option;
  (** 
    The grant token.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

}

type create_grant_request = {
  dry_run: bool option;
  (** 
    Checks if your request will succeed. [DryRun] is an optional parameter.
    
     To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.
      *)

  name: string option;
  (** 
    A friendly name for the grant. Use this value to prevent the unintended creation of duplicate grants when retrying this request.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      When this value is absent, all [CreateGrant] requests result in a new grant with a unique [GrantId] even if all the supplied parameters are identical. This can result in unintended duplicates when you retry the [CreateGrant] request.
      
       When this value is present, you can retry a [CreateGrant] request with identical parameters; if the grant already exists, the original [GrantId] is returned without creating a new grant. Note that the returned grant token is unique with every [CreateGrant] request, even when a duplicate [GrantId] is returned. All grant tokens for the same grant ID can be used interchangeably.
        *)

  grant_tokens: string list option;
  (** 
    A list of grant tokens.
    
     Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.
      *)

  constraints: grant_constraints option;
  (** 
    Specifies a grant constraint.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      KMS supports the [EncryptionContextEquals] and [EncryptionContextSubset] grant constraints, which allow the permissions in the grant only when the encryption context in the request matches ([EncryptionContextEquals]) or includes ([EncryptionContextSubset]) the encryption context specified in the constraint.
      
       The encryption context grant constraints are supported only on {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations}grant operations} that include an [EncryptionContext] parameter, such as cryptographic operations on symmetric encryption KMS keys. Grants with grant constraints can include the [DescribeKey] and [RetireGrant] operations, but the constraint doesn't apply to these operations. If a grant with a grant constraint includes the [CreateGrant] operation, the constraint requires that any grants created with the [CreateGrant] permission have an equally strict or stricter encryption context constraint.
       
        You cannot use an encryption context grant constraint for cryptographic operations with asymmetric KMS keys or HMAC KMS keys. Operations with these keys don't support an encryption context.
        
         Each constraint value can include up to 8 encryption context pairs. The encryption context value in each constraint cannot exceed 384 characters. For information about grant constraints, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-grant-overview.html#grant-constraints}Using grant constraints} in the {i Key Management Service Developer Guide}. For more information about encryption context, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i {i Key Management Service Developer Guide}}.
          *)

  operations: grant_operation list;
  (** 
    A list of operations that the grant permits.
    
     This list must include only operations that are permitted in a grant. Also, the operation must be supported on the KMS key. For example, you cannot create a grant for a symmetric encryption KMS key that allows the [Sign] operation, or a grant for an asymmetric KMS key that allows the [GenerateDataKey] operation. If you try, KMS returns a [ValidationError] exception. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations}Grant operations} in the {i Key Management Service Developer Guide}.
      *)

  retiring_principal: string option;
  (** 
    The principal that has permission to use the [RetireGrant] operation to retire the grant.
    
     To specify the principal, use the {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Name (ARN)} of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs} in the {i {i Identity and Access Management User Guide}}.
     
      The grant determines the retiring principal. Other principals might have permission to retire the grant or revoke the grant. For details, see [RevokeGrant] and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete}Retiring and revoking grants} in the {i Key Management Service Developer Guide}.
       *)

  grantee_principal: string;
  (** 
    The identity that gets the permissions specified in the grant.
    
     To specify the grantee principal, use the Amazon Resource Name (ARN) of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs} in the {i {i Identity and Access Management User Guide}}.
      *)

  key_id: string;
  (** 
    Identifies the KMS key for the grant. The grant gives principals permission to use this KMS key.
    
     Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    The request was rejected because the trust anchor certificate in the request to create an CloudHSM key store is not the trust anchor certificate for the specified CloudHSM cluster.
    
     When you {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr}initialize the CloudHSM cluster}, you create the trust anchor certificate and save it in the [customerCA.crt] file.
      *)
type incorrect_trust_anchor_exception = {
  message: string option;
  
}

(** 
    The request was rejected because the specified CloudHSM cluster is already associated with an CloudHSM key store in the account, or it shares a backup history with an CloudHSM key store in the account. Each CloudHSM key store in the account must be associated with a different CloudHSM cluster.
    
     CloudHSM clusters that share a backup history have the same cluster certificate. To view the cluster certificate of an CloudHSM cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.
      *)
type cloud_hsm_cluster_in_use_exception = {
  message: string option;
  
}

type create_custom_key_store_response = {
  custom_key_store_id: string option;
  (** 
    A unique identifier for the new custom key store.
     *)

}

type create_custom_key_store_request = {
  xks_proxy_connectivity: xks_proxy_connectivity_type option;
  (** 
    Indicates how KMS communicates with the external key store proxy. This parameter is required for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].
    
     If the external key store proxy uses a public endpoint, specify [PUBLIC_ENDPOINT]. If the external key store proxy uses a Amazon VPC endpoint service for communication with KMS, specify [VPC_ENDPOINT_SERVICE]. For help making this choice, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/plan-xks-keystore.html#choose-xks-connectivity}Choosing a connectivity option} in the {i Key Management Service Developer Guide}.
     
      An Amazon VPC endpoint service keeps your communication with KMS in a private address space entirely within Amazon Web Services, but it requires more configuration, including establishing a Amazon VPC with multiple subnets, a VPC endpoint service, a network load balancer, and a verified private DNS name. A public endpoint is simpler to set up, but it might be slower and might not fulfill your security requirements. You might consider testing with a public endpoint, and then establishing a VPC endpoint service for production tasks. Note that this choice does not determine the location of the external key store proxy. Even if you choose a VPC endpoint service, the proxy can be hosted within the VPC or outside of Amazon Web Services such as in your corporate data center.
       *)

  xks_proxy_authentication_credential: xks_proxy_authentication_credential_type option;
  (** 
    Specifies an authentication credential for the external key store proxy (XKS proxy). This parameter is required for all custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].
    
     The [XksProxyAuthenticationCredential] has two required elements: [RawSecretAccessKey], a secret key, and [AccessKeyId], a unique identifier for the [RawSecretAccessKey]. For character requirements, see {{:kms/latest/APIReference/API_XksProxyAuthenticationCredentialType.html}XksProxyAuthenticationCredentialType}.
     
      KMS uses this authentication credential to sign requests to the external key store proxy on your behalf. This credential is unrelated to Identity and Access Management (IAM) and Amazon Web Services credentials.
      
       This parameter doesn't set or change the authentication credentials on the XKS proxy. It just tells KMS the credential that you established on your external key store proxy. If you rotate your proxy authentication credential, use the [UpdateCustomKeyStore] operation to provide the new credential to KMS.
        *)

  xks_proxy_vpc_endpoint_service_name: string option;
  (** 
    Specifies the name of the Amazon VPC endpoint service for interface endpoints that is used to communicate with your external key store proxy (XKS proxy). This parameter is required when the value of [CustomKeyStoreType] is [EXTERNAL_KEY_STORE] and the value of [XksProxyConnectivity] is [VPC_ENDPOINT_SERVICE].
    
     The Amazon VPC endpoint service must {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keystore.html#xks-requirements}fulfill all requirements} for use with an external key store.
     
      {b Uniqueness requirements:}
      
       {ul
            {- External key stores with [VPC_ENDPOINT_SERVICE] connectivity can share an Amazon VPC, but each external key store must have its own VPC endpoint service and private DNS name.
               
               }
            
      }
       *)

  xks_proxy_uri_path: string option;
  (** 
    Specifies the base path to the proxy APIs for this external key store. To find this value, see the documentation for your external key store proxy. This parameter is required for all custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].
    
     The value must start with [/] and must end with [/kms/xks/v1] where [v1] represents the version of the KMS external key store proxy API. This path can include an optional prefix between the required elements such as 
     {[
     /{i prefix}/kms/xks/v1
     ]}
     .
     
      {b Uniqueness requirements:}
      
       {ul
            {- The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.
               
               }
            
      }
       *)

  xks_proxy_uri_endpoint: string option;
  (** 
    Specifies the endpoint that KMS uses to send requests to the external key store proxy (XKS proxy). This parameter is required for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].
    
     The protocol must be HTTPS. KMS communicates on port 443. Do not specify the port in the [XksProxyUriEndpoint] value.
     
      For external key stores with [XksProxyConnectivity] value of [VPC_ENDPOINT_SERVICE], specify [https://] followed by the private DNS name of the VPC endpoint service.
      
       For external key stores with [PUBLIC_ENDPOINT] connectivity, this endpoint must be reachable before you create the custom key store. KMS connects to the external key store proxy while creating the custom key store. For external key stores with [VPC_ENDPOINT_SERVICE] connectivity, KMS connects when you call the [ConnectCustomKeyStore] operation.
       
        The value of this parameter must begin with [https://]. The remainder can contain upper and lower case letters (A-Z and a-z), numbers (0-9), dots ([.]), and hyphens ([-]). Additional slashes ([/] and [\]) are not permitted.
        
         {b Uniqueness requirements:}
         
          {ul
               {- The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.
                  
                  }
                {- An external key store with [PUBLIC_ENDPOINT] connectivity cannot use the same [XksProxyUriEndpoint] value as an external key store with [VPC_ENDPOINT_SERVICE] connectivity in this Amazon Web Services Region.
                   
                   }
                {- Each external key store with [VPC_ENDPOINT_SERVICE] connectivity must have its own private DNS name. The [XksProxyUriEndpoint] value for external key stores with [VPC_ENDPOINT_SERVICE] connectivity (private DNS name) must be unique in the Amazon Web Services account and Region.
                   
                   }
               
      }
       *)

  custom_key_store_type: custom_key_store_type option;
  (** 
    Specifies the type of custom key store. The default value is [AWS_CLOUDHSM].
    
     For a custom key store backed by an CloudHSM cluster, omit the parameter or enter [AWS_CLOUDHSM]. For a custom key store backed by an external key manager outside of Amazon Web Services, enter [EXTERNAL_KEY_STORE]. You cannot change this property after the key store is created.
      *)

  key_store_password: string option;
  (** 
    Specifies the [kmsuser] password for an CloudHSM key store. This parameter is required for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].
    
     Enter the password of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser}[kmsuser] crypto user (CU) account} in the specified CloudHSM cluster. KMS logs into the cluster as this user to manage key material on your behalf.
     
      The password must be a string of 7 to 32 characters. Its value is case sensitive.
      
       This parameter tells KMS the [kmsuser] account password; it does not change the password in the CloudHSM cluster.
        *)

  trust_anchor_certificate: string option;
  (** 
    Specifies the certificate for an CloudHSM key store. This parameter is required for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].
    
     Enter the content of the trust anchor certificate for the CloudHSM cluster. This is the content of the [customerCA.crt] file that you created when you {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html}initialized the cluster}.
      *)

  cloud_hsm_cluster_id: string option;
  (** 
    Identifies the CloudHSM cluster for an CloudHSM key store. This parameter is required for custom key stores with [CustomKeyStoreType] of [AWS_CLOUDHSM].
    
     Enter the cluster ID of any active CloudHSM cluster that is not already associated with a custom key store. To find the cluster ID, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.
      *)

  custom_key_store_name: string;
  (** 
    Specifies a friendly name for the custom key store. The name must be unique in your Amazon Web Services account and Region. This parameter is required for all custom key stores.
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      *)

}

(** 
    The request was rejected because the specified alias name is not valid.
     *)
type invalid_alias_name_exception = {
  message: string option;
  
}

type create_alias_request = {
  target_key_id: string;
  (** 
    Associates the alias with the specified {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key}. The KMS key must be in the same Amazon Web Services Region.
    
     A valid key ID is required. If you supply a null or empty string value, this operation returns an error.
     
      For help finding the key ID and ARN, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html#find-cmk-id-arn}Finding the Key ID and ARN} in the {i {i Key Management Service Developer Guide}}.
      
       Specify the key ID or key ARN of the KMS key.
       
        For example:
        
         {ul
              {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
                 
                 }
               {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                  
                  }
              
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

  alias_name: string;
  (** 
    Specifies the alias name. This value must begin with [alias/] followed by a name, such as [alias/ExampleAlias].
    
     Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
     
      The [AliasName] value must be string of 1-256 characters. It can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). The alias name cannot begin with [alias/aws/]. The [alias/aws/] prefix is reserved for {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed keys}.
       *)

}

type connect_custom_key_store_response = unit

type connect_custom_key_store_request = {
  custom_key_store_id: string;
  (** 
    Enter the key store ID of the custom key store that you want to connect. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.
     *)

}

type cancel_key_deletion_response = {
  key_id: string option;
  (** 
    The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key whose deletion is canceled.
     *)

}

type cancel_key_deletion_request = {
  key_id: string;
  (** 
    Identifies the KMS key whose deletion is being canceled.
    
     Specify the key ID or key ARN of the KMS key.
     
      For example:
      
       {ul
            {- Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab]
               
               }
             {- Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab]
                
                }
            
      }
       To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].
        *)

}

(** 
    Key Management Service Key Management Service (KMS) is an encryption and key management web service. This guide describes the KMS operations that you can call programmatically. For general information about KMS, see the {{:https://docs.aws.amazon.com/kms/latest/developerguide/}{i Key Management Service Developer Guide}}.
                           
                            KMS has replaced the term {i customer master key (CMK)} with {i KMS key} and {i KMS key}. The concept has not changed. To prevent breaking changes, KMS is keeping some variations of this term.
                            
                             Amazon Web Services provides SDKs that consist of libraries and sample code for various programming languages and platforms (Java, Ruby, .Net, macOS, Android, etc.). The SDKs provide a convenient way to create programmatic access to KMS and other Amazon Web Services services. For example, the SDKs take care of tasks such as signing requests (see below), managing errors, and retrying requests automatically. For more information about the Amazon Web Services SDKs, including how to download and install them, see {{:http://aws.amazon.com/tools/}Tools for Amazon Web Services}.
                             
                              We recommend that you use the Amazon Web Services SDKs to make programmatic API calls to KMS.
                              
                               If you need to use FIPS 140-2 validated cryptographic modules when communicating with Amazon Web Services, use the FIPS endpoint in your preferred Amazon Web Services Region. For more information about the available FIPS endpoints, see {{:https://docs.aws.amazon.com/general/latest/gr/kms.html#kms_region}Service endpoints} in the Key Management Service topic of the {i Amazon Web Services General Reference}.
                               
                                All KMS API calls must be signed and be transmitted using Transport Layer Security (TLS). KMS recommends you always use the latest supported TLS version. Clients must also support cipher suites with Perfect Forward Secrecy (PFS) such as Ephemeral Diffie-Hellman (DHE) or Elliptic Curve Ephemeral Diffie-Hellman (ECDHE). Most modern systems such as Java 7 and later support these modes.
                                
                                 {b Signing Requests}
                                 
                                  Requests must be signed using an access key ID and a secret access key. We strongly recommend that you do not use your Amazon Web Services account root access key ID and secret access key for everyday work. You can use the access key ID and secret access key for an IAM user or you can use the Security Token Service (STS) to generate temporary security credentials and use those to sign requests.
                                  
                                   All KMS requests must be signed with {{:https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html}Signature Version 4}.
                                   
                                    {b Logging API Requests}
                                    
                                     KMS supports CloudTrail, a service that logs Amazon Web Services API calls and related events for your Amazon Web Services account and delivers them to an Amazon S3 bucket that you specify. By using the information collected by CloudTrail, you can determine what requests were made to KMS, who made the request, when it was made, and so on. To learn more about CloudTrail, including how to turn it on and find your log files, see the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/}CloudTrail User Guide}.
                                     
                                      {b Additional Resources}
                                      
                                       For more information about credentials and request signing, see the following:
                                       
                                        {ul
                                             {- {{:https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html}Amazon Web Services Security Credentials} - This topic provides general information about the types of credentials used to access Amazon Web Services.
                                                
                                                }
                                              {- {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html}Temporary Security Credentials} - This section of the {i IAM User Guide} describes how to create and use temporary security credentials.
                                                 
                                                 }
                                              {- {{:https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html}Signature Version 4 Signing Process} - This set of topics walks you through the process of signing a request using an access key ID and a secret access key.
                                                 
                                                 }
                                             
      }
       {b Commonly Used API Operations}
       
        Of the API operations discussed in this guide, the following will prove the most useful for most applications. You will likely perform operations other than these, such as creating keys and assigning policies, by using the console.
        
         {ul
              {- [Encrypt]
                 
                 }
               {- [Decrypt]
                  
                  }
               {- [GenerateDataKey]
                  
                  }
               {- [GenerateDataKeyWithoutPlaintext]
                  
                  }
              
      }
       *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_xks_proxy_configuration_type :
  ?vpc_endpoint_service_name:string ->
  ?uri_path:string ->
  ?uri_endpoint:string ->
  ?access_key_id:string ->
  ?connectivity:xks_proxy_connectivity_type ->
  unit
-> xks_proxy_configuration_type

val make_xks_proxy_authentication_credential_type :
  raw_secret_access_key:string -> access_key_id:string -> unit
-> xks_proxy_authentication_credential_type

val make_xks_key_configuration_type : ?id:string -> unit
-> xks_key_configuration_type

val make_verify_response :
  ?signing_algorithm:signing_algorithm_spec ->
  ?signature_valid:bool ->
  ?key_id:string ->
  unit -> verify_response

val make_verify_request :
  ?dry_run:bool ->
  ?grant_tokens:string list ->
  ?message_type:message_type ->
  signing_algorithm:signing_algorithm_spec ->
  signature:bytes ->
  message:bytes ->
  key_id:string ->
  unit -> verify_request

val make_verify_mac_response :
  ?mac_algorithm:mac_algorithm_spec ->
  ?mac_valid:bool ->
  ?key_id:string ->
  unit -> verify_mac_response

val make_verify_mac_request :
  ?dry_run:bool ->
  ?grant_tokens:string list ->
  mac:bytes ->
  mac_algorithm:mac_algorithm_spec ->
  key_id:string ->
  message:bytes ->
  unit -> verify_mac_request

val make_update_primary_region_request :
  primary_region:string -> key_id:string -> unit
-> update_primary_region_request

val make_update_key_description_request :
  description:string -> key_id:string -> unit
-> update_key_description_request

val make_update_custom_key_store_response : unit
-> update_custom_key_store_response

val make_update_custom_key_store_request :
  ?xks_proxy_connectivity:xks_proxy_connectivity_type ->
  ?xks_proxy_authentication_credential:xks_proxy_authentication_credential_type ->
  ?xks_proxy_vpc_endpoint_service_name:string ->
  ?xks_proxy_uri_path:string ->
  ?xks_proxy_uri_endpoint:string ->
  ?cloud_hsm_cluster_id:string ->
  ?key_store_password:string ->
  ?new_custom_key_store_name:string ->
  custom_key_store_id:string ->
  unit -> update_custom_key_store_request

val make_update_alias_request :
  target_key_id:string -> alias_name:string -> unit
-> update_alias_request

val make_untag_resource_request :
  tag_keys:string list -> key_id:string -> unit
-> untag_resource_request

val make_tag : tag_value:string -> tag_key:string -> unit
-> tag

val make_tag_resource_request : tags:tag list -> key_id:string -> unit
-> tag_resource_request

val make_sign_response :
  ?signing_algorithm:signing_algorithm_spec ->
  ?signature:bytes ->
  ?key_id:string ->
  unit -> sign_response

val make_sign_request :
  ?dry_run:bool ->
  ?grant_tokens:string list ->
  ?message_type:message_type ->
  signing_algorithm:signing_algorithm_spec ->
  message:bytes ->
  key_id:string ->
  unit -> sign_request

val make_schedule_key_deletion_response :
  ?pending_window_in_days:int ->
  ?key_state:key_state ->
  ?deletion_date:float ->
  ?key_id:string ->
  unit
-> schedule_key_deletion_response

val make_schedule_key_deletion_request :
  ?pending_window_in_days:int -> key_id:string -> unit
-> schedule_key_deletion_request

val make_rotate_key_on_demand_response : ?key_id:string -> unit
-> rotate_key_on_demand_response

val make_rotate_key_on_demand_request : key_id:string -> unit
-> rotate_key_on_demand_request

val make_revoke_grant_request :
  ?dry_run:bool -> grant_id:string -> key_id:string -> unit
-> revoke_grant_request

val make_retire_grant_request :
  ?dry_run:bool ->
  ?grant_id:string ->
  ?key_id:string ->
  ?grant_token:string ->
  unit -> retire_grant_request

val make_multi_region_key : ?region:string -> ?arn:string -> unit
-> multi_region_key

val make_multi_region_configuration :
  ?replica_keys:multi_region_key list ->
  ?primary_key:multi_region_key ->
  ?multi_region_key_type:multi_region_key_type ->
  unit -> multi_region_configuration

val make_key_metadata :
  ?xks_key_configuration:xks_key_configuration_type ->
  ?mac_algorithms:mac_algorithm_spec list ->
  ?pending_deletion_window_in_days:int ->
  ?multi_region_configuration:multi_region_configuration ->
  ?multi_region:bool ->
  ?key_agreement_algorithms:key_agreement_algorithm_spec list ->
  ?signing_algorithms:signing_algorithm_spec list ->
  ?encryption_algorithms:encryption_algorithm_spec list ->
  ?key_spec:key_spec ->
  ?customer_master_key_spec:customer_master_key_spec ->
  ?key_manager:key_manager_type ->
  ?expiration_model:expiration_model_type ->
  ?cloud_hsm_cluster_id:string ->
  ?custom_key_store_id:string ->
  ?origin:origin_type ->
  ?valid_to:float ->
  ?deletion_date:float ->
  ?key_state:key_state ->
  ?key_usage:key_usage_type ->
  ?description:string ->
  ?enabled:bool ->
  ?creation_date:float ->
  ?arn:string ->
  ?aws_account_id:string ->
  key_id:string ->
  unit -> key_metadata

val make_replicate_key_response :
  ?replica_tags:tag list ->
  ?replica_policy:string ->
  ?replica_key_metadata:key_metadata ->
  unit -> replicate_key_response

val make_replicate_key_request :
  ?tags:tag list ->
  ?description:string ->
  ?bypass_policy_lockout_safety_check:bool ->
  ?policy:string ->
  replica_region:string ->
  key_id:string ->
  unit -> replicate_key_request

val make_re_encrypt_response :
  ?destination_encryption_algorithm:encryption_algorithm_spec ->
  ?source_encryption_algorithm:encryption_algorithm_spec ->
  ?key_id:string ->
  ?source_key_id:string ->
  ?ciphertext_blob:bytes ->
  unit -> re_encrypt_response

val make_re_encrypt_request :
  ?dry_run:bool ->
  ?grant_tokens:string list ->
  ?destination_encryption_algorithm:encryption_algorithm_spec ->
  ?source_encryption_algorithm:encryption_algorithm_spec ->
  ?destination_encryption_context:(string * string) list ->
  ?source_key_id:string ->
  ?source_encryption_context:(string * string) list ->
  destination_key_id:string ->
  ciphertext_blob:bytes ->
  unit -> re_encrypt_request

val make_put_key_policy_request :
  ?bypass_policy_lockout_safety_check:bool ->
  ?policy_name:string ->
  policy:string ->
  key_id:string ->
  unit -> put_key_policy_request

val make_grant_constraints :
  ?encryption_context_equals:(string * string) list ->
  ?encryption_context_subset:(string * string) list ->
  unit -> grant_constraints

val make_grant_list_entry :
  ?constraints:grant_constraints ->
  ?operations:grant_operation list ->
  ?issuing_account:string ->
  ?retiring_principal:string ->
  ?grantee_principal:string ->
  ?creation_date:float ->
  ?name:string ->
  ?grant_id:string ->
  ?key_id:string ->
  unit -> grant_list_entry

val make_list_grants_response :
  ?truncated:bool ->
  ?next_marker:string ->
  ?grants:grant_list_entry list ->
  unit -> list_grants_response

val make_list_retirable_grants_request :
  ?marker:string -> ?limit:int -> retiring_principal:string -> unit
-> list_retirable_grants_request

val make_list_resource_tags_response :
  ?truncated:bool -> ?next_marker:string -> ?tags:tag list -> unit
-> list_resource_tags_response

val make_list_resource_tags_request :
  ?marker:string -> ?limit:int -> key_id:string -> unit
-> list_resource_tags_request

val make_key_list_entry : ?key_arn:string -> ?key_id:string -> unit
-> key_list_entry

val make_list_keys_response :
  ?truncated:bool -> ?next_marker:string -> ?keys:key_list_entry list -> unit
-> list_keys_response

val make_list_keys_request : ?marker:string -> ?limit:int -> unit
-> list_keys_request

val make_rotations_list_entry :
  ?rotation_type:rotation_type ->
  ?rotation_date:float ->
  ?key_id:string ->
  unit -> rotations_list_entry

val make_list_key_rotations_response :
  ?truncated:bool ->
  ?next_marker:string ->
  ?rotations:rotations_list_entry list ->
  unit -> list_key_rotations_response

val make_list_key_rotations_request :
  ?marker:string -> ?limit:int -> key_id:string -> unit
-> list_key_rotations_request

val make_list_key_policies_response :
  ?truncated:bool -> ?next_marker:string -> ?policy_names:string list -> unit
-> list_key_policies_response

val make_list_key_policies_request :
  ?marker:string -> ?limit:int -> key_id:string -> unit
-> list_key_policies_request

val make_list_grants_request :
  ?grantee_principal:string ->
  ?grant_id:string ->
  ?marker:string ->
  ?limit:int ->
  key_id:string ->
  unit -> list_grants_request

val make_alias_list_entry :
  ?last_updated_date:float ->
  ?creation_date:float ->
  ?target_key_id:string ->
  ?alias_arn:string ->
  ?alias_name:string ->
  unit -> alias_list_entry

val make_list_aliases_response :
  ?truncated:bool ->
  ?next_marker:string ->
  ?aliases:alias_list_entry list ->
  unit -> list_aliases_response

val make_list_aliases_request :
  ?marker:string -> ?limit:int -> ?key_id:string -> unit
-> list_aliases_request

val make_import_key_material_response : unit
-> import_key_material_response

val make_import_key_material_request :
  ?expiration_model:expiration_model_type ->
  ?valid_to:float ->
  encrypted_key_material:bytes ->
  import_token:bytes ->
  key_id:string ->
  unit -> import_key_material_request

val make_get_public_key_response :
  ?key_agreement_algorithms:key_agreement_algorithm_spec list ->
  ?signing_algorithms:signing_algorithm_spec list ->
  ?encryption_algorithms:encryption_algorithm_spec list ->
  ?key_usage:key_usage_type ->
  ?key_spec:key_spec ->
  ?customer_master_key_spec:customer_master_key_spec ->
  ?public_key:bytes ->
  ?key_id:string ->
  unit -> get_public_key_response

val make_get_public_key_request :
  ?grant_tokens:string list -> key_id:string -> unit
-> get_public_key_request

val make_get_parameters_for_import_response :
  ?parameters_valid_to:float ->
  ?public_key:bytes ->
  ?import_token:bytes ->
  ?key_id:string ->
  unit
-> get_parameters_for_import_response

val make_get_parameters_for_import_request :
  wrapping_key_spec:wrapping_key_spec ->
  wrapping_algorithm:algorithm_spec ->
  key_id:string ->
  unit
-> get_parameters_for_import_request

val make_get_key_rotation_status_response :
  ?on_demand_rotation_start_date:float ->
  ?next_rotation_date:float ->
  ?rotation_period_in_days:int ->
  ?key_id:string ->
  ?key_rotation_enabled:bool ->
  unit
-> get_key_rotation_status_response

val make_get_key_rotation_status_request : key_id:string -> unit
-> get_key_rotation_status_request

val make_get_key_policy_response :
  ?policy_name:string -> ?policy:string -> unit
-> get_key_policy_response

val make_get_key_policy_request :
  ?policy_name:string -> key_id:string -> unit
-> get_key_policy_request

val make_generate_random_response :
  ?ciphertext_for_recipient:bytes -> ?plaintext:bytes -> unit
-> generate_random_response

val make_recipient_info :
  ?attestation_document:bytes ->
  ?key_encryption_algorithm:key_encryption_mechanism ->
  unit -> recipient_info

val make_generate_random_request :
  ?recipient:recipient_info ->
  ?custom_key_store_id:string ->
  ?number_of_bytes:int ->
  unit -> generate_random_request

val make_generate_mac_response :
  ?key_id:string -> ?mac_algorithm:mac_algorithm_spec -> ?mac:bytes -> unit
-> generate_mac_response

val make_generate_mac_request :
  ?dry_run:bool ->
  ?grant_tokens:string list ->
  mac_algorithm:mac_algorithm_spec ->
  key_id:string ->
  message:bytes ->
  unit
-> generate_mac_request

val make_generate_data_key_without_plaintext_response :
  ?key_id:string -> ?ciphertext_blob:bytes -> unit
-> generate_data_key_without_plaintext_response

val make_generate_data_key_without_plaintext_request :
  ?dry_run:bool ->
  ?grant_tokens:string list ->
  ?number_of_bytes:int ->
  ?key_spec:data_key_spec ->
  ?encryption_context:(string * string) list ->
  key_id:string ->
  unit
-> generate_data_key_without_plaintext_request

val make_generate_data_key_pair_without_plaintext_response :
  ?key_pair_spec:data_key_pair_spec ->
  ?key_id:string ->
  ?public_key:bytes ->
  ?private_key_ciphertext_blob:bytes ->
  unit
-> generate_data_key_pair_without_plaintext_response

val make_generate_data_key_pair_without_plaintext_request :
  ?dry_run:bool ->
  ?grant_tokens:string list ->
  ?encryption_context:(string * string) list ->
  key_pair_spec:data_key_pair_spec ->
  key_id:string ->
  unit
-> generate_data_key_pair_without_plaintext_request

val make_generate_data_key_pair_response :
  ?ciphertext_for_recipient:bytes ->
  ?key_pair_spec:data_key_pair_spec ->
  ?key_id:string ->
  ?public_key:bytes ->
  ?private_key_plaintext:bytes ->
  ?private_key_ciphertext_blob:bytes ->
  unit
-> generate_data_key_pair_response

val make_generate_data_key_pair_request :
  ?dry_run:bool ->
  ?recipient:recipient_info ->
  ?grant_tokens:string list ->
  ?encryption_context:(string * string) list ->
  key_pair_spec:data_key_pair_spec ->
  key_id:string ->
  unit -> generate_data_key_pair_request

val make_generate_data_key_response :
  ?ciphertext_for_recipient:bytes ->
  ?key_id:string ->
  ?plaintext:bytes ->
  ?ciphertext_blob:bytes ->
  unit -> generate_data_key_response

val make_generate_data_key_request :
  ?dry_run:bool ->
  ?recipient:recipient_info ->
  ?grant_tokens:string list ->
  ?key_spec:data_key_spec ->
  ?number_of_bytes:int ->
  ?encryption_context:(string * string) list ->
  key_id:string ->
  unit -> generate_data_key_request

val make_encrypt_response :
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?key_id:string ->
  ?ciphertext_blob:bytes ->
  unit -> encrypt_response

val make_encrypt_request :
  ?dry_run:bool ->
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?grant_tokens:string list ->
  ?encryption_context:(string * string) list ->
  plaintext:bytes ->
  key_id:string ->
  unit -> encrypt_request

val make_enable_key_rotation_request :
  ?rotation_period_in_days:int -> key_id:string -> unit
-> enable_key_rotation_request

val make_enable_key_request : key_id:string -> unit
-> enable_key_request

val make_disconnect_custom_key_store_response : unit
-> disconnect_custom_key_store_response

val make_disconnect_custom_key_store_request :
  custom_key_store_id:string -> unit
-> disconnect_custom_key_store_request

val make_disable_key_rotation_request : key_id:string -> unit
-> disable_key_rotation_request

val make_disable_key_request : key_id:string -> unit
-> disable_key_request

val make_describe_key_response : ?key_metadata:key_metadata -> unit
-> describe_key_response

val make_describe_key_request :
  ?grant_tokens:string list -> key_id:string -> unit
-> describe_key_request

val make_custom_key_stores_list_entry :
  ?xks_proxy_configuration:xks_proxy_configuration_type ->
  ?custom_key_store_type:custom_key_store_type ->
  ?creation_date:float ->
  ?connection_error_code:connection_error_code_type ->
  ?connection_state:connection_state_type ->
  ?trust_anchor_certificate:string ->
  ?cloud_hsm_cluster_id:string ->
  ?custom_key_store_name:string ->
  ?custom_key_store_id:string ->
  unit
-> custom_key_stores_list_entry

val make_describe_custom_key_stores_response :
  ?truncated:bool ->
  ?next_marker:string ->
  ?custom_key_stores:custom_key_stores_list_entry list ->
  unit
-> describe_custom_key_stores_response

val make_describe_custom_key_stores_request :
  ?marker:string ->
  ?limit:int ->
  ?custom_key_store_name:string ->
  ?custom_key_store_id:string ->
  unit
-> describe_custom_key_stores_request

val make_derive_shared_secret_response :
  ?key_origin:origin_type ->
  ?key_agreement_algorithm:key_agreement_algorithm_spec ->
  ?ciphertext_for_recipient:bytes ->
  ?shared_secret:bytes ->
  ?key_id:string ->
  unit
-> derive_shared_secret_response

val make_derive_shared_secret_request :
  ?recipient:recipient_info ->
  ?dry_run:bool ->
  ?grant_tokens:string list ->
  public_key:bytes ->
  key_agreement_algorithm:key_agreement_algorithm_spec ->
  key_id:string ->
  unit
-> derive_shared_secret_request

val make_delete_imported_key_material_request : key_id:string -> unit
-> delete_imported_key_material_request

val make_delete_custom_key_store_response : unit
-> delete_custom_key_store_response

val make_delete_custom_key_store_request : custom_key_store_id:string -> unit
-> delete_custom_key_store_request

val make_delete_alias_request : alias_name:string -> unit
-> delete_alias_request

val make_decrypt_response :
  ?ciphertext_for_recipient:bytes ->
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?plaintext:bytes ->
  ?key_id:string ->
  unit -> decrypt_response

val make_decrypt_request :
  ?dry_run:bool ->
  ?recipient:recipient_info ->
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?key_id:string ->
  ?grant_tokens:string list ->
  ?encryption_context:(string * string) list ->
  ciphertext_blob:bytes ->
  unit -> decrypt_request

val make_create_key_response : ?key_metadata:key_metadata -> unit
-> create_key_response

val make_create_key_request :
  ?xks_key_id:string ->
  ?multi_region:bool ->
  ?tags:tag list ->
  ?bypass_policy_lockout_safety_check:bool ->
  ?custom_key_store_id:string ->
  ?origin:origin_type ->
  ?key_spec:key_spec ->
  ?customer_master_key_spec:customer_master_key_spec ->
  ?key_usage:key_usage_type ->
  ?description:string ->
  ?policy:string ->
  unit -> create_key_request

val make_create_grant_response :
  ?grant_id:string -> ?grant_token:string -> unit
-> create_grant_response

val make_create_grant_request :
  ?dry_run:bool ->
  ?name:string ->
  ?grant_tokens:string list ->
  ?constraints:grant_constraints ->
  ?retiring_principal:string ->
  operations:grant_operation list ->
  grantee_principal:string ->
  key_id:string ->
  unit -> create_grant_request

val make_create_custom_key_store_response :
  ?custom_key_store_id:string -> unit
-> create_custom_key_store_response

val make_create_custom_key_store_request :
  ?xks_proxy_connectivity:xks_proxy_connectivity_type ->
  ?xks_proxy_authentication_credential:xks_proxy_authentication_credential_type ->
  ?xks_proxy_vpc_endpoint_service_name:string ->
  ?xks_proxy_uri_path:string ->
  ?xks_proxy_uri_endpoint:string ->
  ?custom_key_store_type:custom_key_store_type ->
  ?key_store_password:string ->
  ?trust_anchor_certificate:string ->
  ?cloud_hsm_cluster_id:string ->
  custom_key_store_name:string ->
  unit -> create_custom_key_store_request

val make_create_alias_request :
  target_key_id:string -> alias_name:string -> unit
-> create_alias_request

val make_connect_custom_key_store_response : unit
-> connect_custom_key_store_response

val make_connect_custom_key_store_request :
  custom_key_store_id:string -> unit
-> connect_custom_key_store_request

val make_cancel_key_deletion_response : ?key_id:string -> unit
-> cancel_key_deletion_response

val make_cancel_key_deletion_request : key_id:string -> unit
-> cancel_key_deletion_request

(** {1:operations Operations} *)

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

