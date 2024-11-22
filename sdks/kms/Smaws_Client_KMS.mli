open Smaws_Lib
val service : Service.descriptor

type xks_proxy_vpc_endpoint_service_not_found_exception = {
  message: string option
}

type xks_proxy_vpc_endpoint_service_invalid_configuration_exception = {
  message: string option
}

type xks_proxy_vpc_endpoint_service_in_use_exception = {
  message: string option
}

type xks_proxy_uri_unreachable_exception = {
  message: string option
}

type xks_proxy_uri_in_use_exception = {
  message: string option
}

type xks_proxy_uri_endpoint_in_use_exception = {
  message: string option
}

type xks_proxy_invalid_response_exception = {
  message: string option
}

type xks_proxy_invalid_configuration_exception = {
  message: string option
}

type xks_proxy_incorrect_authentication_credential_exception = {
  message: string option
}

type xks_proxy_connectivity_type = | VPC_ENDPOINT_SERVICE
  | PUBLIC_ENDPOINT

type xks_proxy_configuration_type = {
  vpc_endpoint_service_name: string option;
  uri_path: string option;
  uri_endpoint: string option;
  access_key_id: string option;
  connectivity: xks_proxy_connectivity_type option
}

type xks_proxy_authentication_credential_type = {
  raw_secret_access_key: string;
  access_key_id: string
}

type xks_key_not_found_exception = {
  message: string option
}

type xks_key_invalid_configuration_exception = {
  message: string option
}

type xks_key_configuration_type = {
  id: string option
}

type xks_key_already_in_use_exception = {
  message: string option
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
  signature_valid: bool option;
  key_id: string option
}

type message_type = | DIGEST
  | RAW

type verify_request = {
  dry_run: bool option;
  grant_tokens: string list option;
  signing_algorithm: signing_algorithm_spec;
  signature: bytes;
  message_type: message_type option;
  message: bytes;
  key_id: string
}

type mac_algorithm_spec = | HMAC_SHA_512
  | HMAC_SHA_384
  | HMAC_SHA_256
  | HMAC_SHA_224

type verify_mac_response = {
  mac_algorithm: mac_algorithm_spec option;
  mac_valid: bool option;
  key_id: string option
}

type verify_mac_request = {
  dry_run: bool option;
  grant_tokens: string list option;
  mac: bytes;
  mac_algorithm: mac_algorithm_spec;
  key_id: string;
  message: bytes
}

type not_found_exception = {
  message: string option
}

type kms_invalid_state_exception = {
  message: string option
}

type kms_invalid_mac_exception = {
  message: string option
}

type kms_internal_exception = {
  message: string option
}

type key_unavailable_exception = {
  message: string option
}

type invalid_key_usage_exception = {
  message: string option
}

type invalid_grant_token_exception = {
  message: string option
}

type dry_run_operation_exception = {
  message: string option
}

type disabled_exception = {
  message: string option
}

type kms_invalid_signature_exception = {
  message: string option
}

type dependency_timeout_exception = {
  message: string option
}

type update_primary_region_request = {
  primary_region: string;
  key_id: string
}

type unsupported_operation_exception = {
  message: string option
}

type invalid_arn_exception = {
  message: string option
}

type update_key_description_request = {
  description: string;
  key_id: string
}

type update_custom_key_store_response = unit

type update_custom_key_store_request = {
  xks_proxy_connectivity: xks_proxy_connectivity_type option;
  xks_proxy_authentication_credential: xks_proxy_authentication_credential_type option;
  xks_proxy_vpc_endpoint_service_name: string option;
  xks_proxy_uri_path: string option;
  xks_proxy_uri_endpoint: string option;
  cloud_hsm_cluster_id: string option;
  key_store_password: string option;
  new_custom_key_store_name: string option;
  custom_key_store_id: string
}

type custom_key_store_not_found_exception = {
  message: string option
}

type custom_key_store_name_in_use_exception = {
  message: string option
}

type custom_key_store_invalid_state_exception = {
  message: string option
}

type cloud_hsm_cluster_not_related_exception = {
  message: string option
}

type cloud_hsm_cluster_not_found_exception = {
  message: string option
}

type cloud_hsm_cluster_not_active_exception = {
  message: string option
}

type cloud_hsm_cluster_invalid_configuration_exception = {
  message: string option
}

type update_alias_request = {
  target_key_id: string;
  alias_name: string
}

type limit_exceeded_exception = {
  message: string option
}

type untag_resource_request = {
  tag_keys: string list;
  key_id: string
}

type tag_exception = {
  message: string option
}

type tag = {
  tag_value: string;
  tag_key: string
}

type tag_resource_request = {
  tags: tag list;
  key_id: string
}

type sign_response = {
  signing_algorithm: signing_algorithm_spec option;
  signature: bytes option;
  key_id: string option
}

type sign_request = {
  dry_run: bool option;
  signing_algorithm: signing_algorithm_spec;
  grant_tokens: string list option;
  message_type: message_type option;
  message: bytes;
  key_id: string
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
  key_state: key_state option;
  deletion_date: float option;
  key_id: string option
}

type schedule_key_deletion_request = {
  pending_window_in_days: int option;
  key_id: string
}

type conflict_exception = {
  message: string option
}

type rotate_key_on_demand_response = {
  key_id: string option
}

type rotate_key_on_demand_request = {
  key_id: string
}

type invalid_grant_id_exception = {
  message: string option
}

type revoke_grant_request = {
  dry_run: bool option;
  grant_id: string;
  key_id: string
}

type retire_grant_request = {
  dry_run: bool option;
  grant_id: string option;
  key_id: string option;
  grant_token: string option
}

type malformed_policy_document_exception = {
  message: string option
}

type already_exists_exception = {
  message: string option
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

type multi_region_key = {
  region: string option;
  arn: string option
}

type multi_region_configuration = {
  replica_keys: multi_region_key list option;
  primary_key: multi_region_key option;
  multi_region_key_type: multi_region_key_type option
}

type key_metadata = {
  xks_key_configuration: xks_key_configuration_type option;
  mac_algorithms: mac_algorithm_spec list option;
  pending_deletion_window_in_days: int option;
  multi_region_configuration: multi_region_configuration option;
  multi_region: bool option;
  key_agreement_algorithms: key_agreement_algorithm_spec list option;
  signing_algorithms: signing_algorithm_spec list option;
  encryption_algorithms: encryption_algorithm_spec list option;
  key_spec: key_spec option;
  customer_master_key_spec: customer_master_key_spec option;
  key_manager: key_manager_type option;
  expiration_model: expiration_model_type option;
  cloud_hsm_cluster_id: string option;
  custom_key_store_id: string option;
  origin: origin_type option;
  valid_to: float option;
  deletion_date: float option;
  key_state: key_state option;
  key_usage: key_usage_type option;
  description: string option;
  enabled: bool option;
  creation_date: float option;
  arn: string option;
  key_id: string;
  aws_account_id: string option
}

type replicate_key_response = {
  replica_tags: tag list option;
  replica_policy: string option;
  replica_key_metadata: key_metadata option
}

type replicate_key_request = {
  tags: tag list option;
  description: string option;
  bypass_policy_lockout_safety_check: bool option;
  policy: string option;
  replica_region: string;
  key_id: string
}

type invalid_ciphertext_exception = {
  message: string option
}

type incorrect_key_exception = {
  message: string option
}

type re_encrypt_response = {
  destination_encryption_algorithm: encryption_algorithm_spec option;
  source_encryption_algorithm: encryption_algorithm_spec option;
  key_id: string option;
  source_key_id: string option;
  ciphertext_blob: bytes option
}

type re_encrypt_request = {
  dry_run: bool option;
  grant_tokens: string list option;
  destination_encryption_algorithm: encryption_algorithm_spec option;
  source_encryption_algorithm: encryption_algorithm_spec option;
  destination_encryption_context: (string * string) list option;
  destination_key_id: string;
  source_key_id: string option;
  source_encryption_context: (string * string) list option;
  ciphertext_blob: bytes
}

type put_key_policy_request = {
  bypass_policy_lockout_safety_check: bool option;
  policy: string;
  policy_name: string option;
  key_id: string
}

type invalid_marker_exception = {
  message: string option
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

type grant_constraints = {
  encryption_context_equals: (string * string) list option;
  encryption_context_subset: (string * string) list option
}

type grant_list_entry = {
  constraints: grant_constraints option;
  operations: grant_operation list option;
  issuing_account: string option;
  retiring_principal: string option;
  grantee_principal: string option;
  creation_date: float option;
  name: string option;
  grant_id: string option;
  key_id: string option
}

type list_grants_response = {
  truncated: bool option;
  next_marker: string option;
  grants: grant_list_entry list option
}

type list_retirable_grants_request = {
  retiring_principal: string;
  marker: string option;
  limit: int option
}

type list_resource_tags_response = {
  truncated: bool option;
  next_marker: string option;
  tags: tag list option
}

type list_resource_tags_request = {
  marker: string option;
  limit: int option;
  key_id: string
}

type key_list_entry = {
  key_arn: string option;
  key_id: string option
}

type list_keys_response = {
  truncated: bool option;
  next_marker: string option;
  keys: key_list_entry list option
}

type list_keys_request = {
  marker: string option;
  limit: int option
}

type rotation_type = | ON_DEMAND
  | AUTOMATIC

type rotations_list_entry = {
  rotation_type: rotation_type option;
  rotation_date: float option;
  key_id: string option
}

type list_key_rotations_response = {
  truncated: bool option;
  next_marker: string option;
  rotations: rotations_list_entry list option
}

type list_key_rotations_request = {
  marker: string option;
  limit: int option;
  key_id: string
}

type list_key_policies_response = {
  truncated: bool option;
  next_marker: string option;
  policy_names: string list option
}

type list_key_policies_request = {
  marker: string option;
  limit: int option;
  key_id: string
}

type list_grants_request = {
  grantee_principal: string option;
  grant_id: string option;
  key_id: string;
  marker: string option;
  limit: int option
}

type alias_list_entry = {
  last_updated_date: float option;
  creation_date: float option;
  target_key_id: string option;
  alias_arn: string option;
  alias_name: string option
}

type list_aliases_response = {
  truncated: bool option;
  next_marker: string option;
  aliases: alias_list_entry list option
}

type list_aliases_request = {
  marker: string option;
  limit: int option;
  key_id: string option
}

type invalid_import_token_exception = {
  message: string option
}

type incorrect_key_material_exception = {
  message: string option
}

type expired_import_token_exception = {
  message: string option
}

type import_key_material_response = unit

type import_key_material_request = {
  expiration_model: expiration_model_type option;
  valid_to: float option;
  encrypted_key_material: bytes;
  import_token: bytes;
  key_id: string
}

type get_public_key_response = {
  key_agreement_algorithms: key_agreement_algorithm_spec list option;
  signing_algorithms: signing_algorithm_spec list option;
  encryption_algorithms: encryption_algorithm_spec list option;
  key_usage: key_usage_type option;
  key_spec: key_spec option;
  customer_master_key_spec: customer_master_key_spec option;
  public_key: bytes option;
  key_id: string option
}

type get_public_key_request = {
  grant_tokens: string list option;
  key_id: string
}

type get_parameters_for_import_response = {
  parameters_valid_to: float option;
  public_key: bytes option;
  import_token: bytes option;
  key_id: string option
}

type algorithm_spec = | SM2PKE
  | RSA_AES_KEY_WRAP_SHA_256
  | RSA_AES_KEY_WRAP_SHA_1
  | RSAES_OAEP_SHA_256
  | RSAES_OAEP_SHA_1
  | RSAES_PKCS1_V1_5

type get_parameters_for_import_request = {
  wrapping_key_spec: wrapping_key_spec;
  wrapping_algorithm: algorithm_spec;
  key_id: string
}

type get_key_rotation_status_response = {
  on_demand_rotation_start_date: float option;
  next_rotation_date: float option;
  rotation_period_in_days: int option;
  key_id: string option;
  key_rotation_enabled: bool option
}

type get_key_rotation_status_request = {
  key_id: string
}

type get_key_policy_response = {
  policy_name: string option;
  policy: string option
}

type get_key_policy_request = {
  policy_name: string option;
  key_id: string
}

type generate_random_response = {
  ciphertext_for_recipient: bytes option;
  plaintext: bytes option
}

type key_encryption_mechanism = | RSAES_OAEP_SHA_256

type recipient_info = {
  attestation_document: bytes option;
  key_encryption_algorithm: key_encryption_mechanism option
}

type generate_random_request = {
  recipient: recipient_info option;
  custom_key_store_id: string option;
  number_of_bytes: int option
}

type generate_mac_response = {
  key_id: string option;
  mac_algorithm: mac_algorithm_spec option;
  mac: bytes option
}

type generate_mac_request = {
  dry_run: bool option;
  grant_tokens: string list option;
  mac_algorithm: mac_algorithm_spec;
  key_id: string;
  message: bytes
}

type generate_data_key_without_plaintext_response = {
  key_id: string option;
  ciphertext_blob: bytes option
}

type data_key_spec = | AES_128
  | AES_256

type generate_data_key_without_plaintext_request = {
  dry_run: bool option;
  grant_tokens: string list option;
  number_of_bytes: int option;
  key_spec: data_key_spec option;
  encryption_context: (string * string) list option;
  key_id: string
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
  key_id: string option;
  public_key: bytes option;
  private_key_ciphertext_blob: bytes option
}

type generate_data_key_pair_without_plaintext_request = {
  dry_run: bool option;
  grant_tokens: string list option;
  key_pair_spec: data_key_pair_spec;
  key_id: string;
  encryption_context: (string * string) list option
}

type generate_data_key_pair_response = {
  ciphertext_for_recipient: bytes option;
  key_pair_spec: data_key_pair_spec option;
  key_id: string option;
  public_key: bytes option;
  private_key_plaintext: bytes option;
  private_key_ciphertext_blob: bytes option
}

type generate_data_key_pair_request = {
  dry_run: bool option;
  recipient: recipient_info option;
  grant_tokens: string list option;
  key_pair_spec: data_key_pair_spec;
  key_id: string;
  encryption_context: (string * string) list option
}

type generate_data_key_response = {
  ciphertext_for_recipient: bytes option;
  key_id: string option;
  plaintext: bytes option;
  ciphertext_blob: bytes option
}

type generate_data_key_request = {
  dry_run: bool option;
  recipient: recipient_info option;
  grant_tokens: string list option;
  key_spec: data_key_spec option;
  number_of_bytes: int option;
  encryption_context: (string * string) list option;
  key_id: string
}

type encrypt_response = {
  encryption_algorithm: encryption_algorithm_spec option;
  key_id: string option;
  ciphertext_blob: bytes option
}

type encrypt_request = {
  dry_run: bool option;
  encryption_algorithm: encryption_algorithm_spec option;
  grant_tokens: string list option;
  encryption_context: (string * string) list option;
  plaintext: bytes;
  key_id: string
}

type enable_key_rotation_request = {
  rotation_period_in_days: int option;
  key_id: string
}

type enable_key_request = {
  key_id: string
}

type disconnect_custom_key_store_response = unit

type disconnect_custom_key_store_request = {
  custom_key_store_id: string
}

type disable_key_rotation_request = {
  key_id: string
}

type disable_key_request = {
  key_id: string
}

type describe_key_response = {
  key_metadata: key_metadata option
}

type describe_key_request = {
  grant_tokens: string list option;
  key_id: string
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

type custom_key_stores_list_entry = {
  xks_proxy_configuration: xks_proxy_configuration_type option;
  custom_key_store_type: custom_key_store_type option;
  creation_date: float option;
  connection_error_code: connection_error_code_type option;
  connection_state: connection_state_type option;
  trust_anchor_certificate: string option;
  cloud_hsm_cluster_id: string option;
  custom_key_store_name: string option;
  custom_key_store_id: string option
}

type describe_custom_key_stores_response = {
  truncated: bool option;
  next_marker: string option;
  custom_key_stores: custom_key_stores_list_entry list option
}

type describe_custom_key_stores_request = {
  marker: string option;
  limit: int option;
  custom_key_store_name: string option;
  custom_key_store_id: string option
}

type derive_shared_secret_response = {
  key_origin: origin_type option;
  key_agreement_algorithm: key_agreement_algorithm_spec option;
  ciphertext_for_recipient: bytes option;
  shared_secret: bytes option;
  key_id: string option
}

type derive_shared_secret_request = {
  recipient: recipient_info option;
  dry_run: bool option;
  grant_tokens: string list option;
  public_key: bytes;
  key_agreement_algorithm: key_agreement_algorithm_spec;
  key_id: string
}

type delete_imported_key_material_request = {
  key_id: string
}

type custom_key_store_has_cm_ks_exception = {
  message: string option
}

type delete_custom_key_store_response = unit

type delete_custom_key_store_request = {
  custom_key_store_id: string
}

type delete_alias_request = {
  alias_name: string
}

type decrypt_response = {
  ciphertext_for_recipient: bytes option;
  encryption_algorithm: encryption_algorithm_spec option;
  plaintext: bytes option;
  key_id: string option
}

type decrypt_request = {
  dry_run: bool option;
  recipient: recipient_info option;
  encryption_algorithm: encryption_algorithm_spec option;
  key_id: string option;
  grant_tokens: string list option;
  encryption_context: (string * string) list option;
  ciphertext_blob: bytes
}

type create_key_response = {
  key_metadata: key_metadata option
}

type create_key_request = {
  xks_key_id: string option;
  multi_region: bool option;
  tags: tag list option;
  bypass_policy_lockout_safety_check: bool option;
  custom_key_store_id: string option;
  origin: origin_type option;
  key_spec: key_spec option;
  customer_master_key_spec: customer_master_key_spec option;
  key_usage: key_usage_type option;
  description: string option;
  policy: string option
}

type create_grant_response = {
  grant_id: string option;
  grant_token: string option
}

type create_grant_request = {
  dry_run: bool option;
  name: string option;
  grant_tokens: string list option;
  constraints: grant_constraints option;
  operations: grant_operation list;
  retiring_principal: string option;
  grantee_principal: string;
  key_id: string
}

type incorrect_trust_anchor_exception = {
  message: string option
}

type cloud_hsm_cluster_in_use_exception = {
  message: string option
}

type create_custom_key_store_response = {
  custom_key_store_id: string option
}

type create_custom_key_store_request = {
  xks_proxy_connectivity: xks_proxy_connectivity_type option;
  xks_proxy_authentication_credential: xks_proxy_authentication_credential_type option;
  xks_proxy_vpc_endpoint_service_name: string option;
  xks_proxy_uri_path: string option;
  xks_proxy_uri_endpoint: string option;
  custom_key_store_type: custom_key_store_type option;
  key_store_password: string option;
  trust_anchor_certificate: string option;
  cloud_hsm_cluster_id: string option;
  custom_key_store_name: string
}

type invalid_alias_name_exception = {
  message: string option
}

type create_alias_request = {
  target_key_id: string;
  alias_name: string
}

type connect_custom_key_store_response = unit

type connect_custom_key_store_request = {
  custom_key_store_id: string
}

type cancel_key_deletion_response = {
  key_id: string option
}

type cancel_key_deletion_request = {
  key_id: string
}



type base_document = Json.t

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

