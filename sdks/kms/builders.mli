open Types
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

