[@@@warning "-39"]
open Types
let make_xks_proxy_configuration_type 
  ?(vpc_endpoint_service_name : string option)
  ?(uri_path : string option)
  ?(uri_endpoint : string option)
  ?(access_key_id : string option)
  ?(connectivity : xks_proxy_connectivity_type option)
  () : xks_proxy_configuration_type = {
  vpc_endpoint_service_name;
  uri_path;
  uri_endpoint;
  access_key_id;
  connectivity;
   }

let make_xks_proxy_authentication_credential_type 
  ~(raw_secret_access_key : string) ~(access_key_id : string) ()
: xks_proxy_authentication_credential_type = {
  raw_secret_access_key; access_key_id; 
}

let make_xks_key_configuration_type  ?(id : string option) ()
: xks_key_configuration_type = { id;  }

let make_verify_response 
  ?(signing_algorithm : signing_algorithm_spec option)
  ?(signature_valid : bool option)
  ?(key_id : string option)
  () : verify_response = { signing_algorithm; signature_valid; key_id; 
}

let make_verify_request 
  ?(dry_run : bool option)
  ?(grant_tokens : string list option)
  ?(message_type : message_type option)
  ~(signing_algorithm : signing_algorithm_spec)
  ~(signature : bytes)
  ~(message : bytes)
  ~(key_id : string)
  () : verify_request = {
  dry_run;
  grant_tokens;
  signing_algorithm;
  signature;
  message_type;
  message;
  key_id;
   }

let make_verify_mac_response 
  ?(mac_algorithm : mac_algorithm_spec option)
  ?(mac_valid : bool option)
  ?(key_id : string option)
  () : verify_mac_response = { mac_algorithm; mac_valid; key_id; 
}

let make_verify_mac_request 
  ?(dry_run : bool option)
  ?(grant_tokens : string list option)
  ~(mac : bytes)
  ~(mac_algorithm : mac_algorithm_spec)
  ~(key_id : string)
  ~(message : bytes)
  () : verify_mac_request = {
  dry_run; grant_tokens; mac; mac_algorithm; key_id; message; 
}

let make_update_primary_region_request 
  ~(primary_region : string) ~(key_id : string) ()
: update_primary_region_request = { primary_region; key_id; 
}

let make_update_key_description_request 
  ~(description : string) ~(key_id : string) ()
: update_key_description_request = { description; key_id; 
}

let make_update_custom_key_store_response  ()
: update_custom_key_store_response =
()

let make_update_custom_key_store_request 
  ?(xks_proxy_connectivity : xks_proxy_connectivity_type option)
  ?(xks_proxy_authentication_credential : xks_proxy_authentication_credential_type option)
  ?(xks_proxy_vpc_endpoint_service_name : string option)
  ?(xks_proxy_uri_path : string option)
  ?(xks_proxy_uri_endpoint : string option)
  ?(cloud_hsm_cluster_id : string option)
  ?(key_store_password : string option)
  ?(new_custom_key_store_name : string option)
  ~(custom_key_store_id : string)
  () : update_custom_key_store_request = {
  xks_proxy_connectivity;
  xks_proxy_authentication_credential;
  xks_proxy_vpc_endpoint_service_name;
  xks_proxy_uri_path;
  xks_proxy_uri_endpoint;
  cloud_hsm_cluster_id;
  key_store_password;
  new_custom_key_store_name;
  custom_key_store_id;
   }

let make_update_alias_request 
  ~(target_key_id : string) ~(alias_name : string) () : update_alias_request
= { target_key_id; alias_name;  }

let make_untag_resource_request 
  ~(tag_keys : string list) ~(key_id : string) () : untag_resource_request =
{ tag_keys; key_id;  }

let make_tag  ~(tag_value : string) ~(tag_key : string) () : tag = {
  tag_value; tag_key;  }

let make_tag_resource_request  ~(tags : tag list) ~(key_id : string) ()
: tag_resource_request = { tags; key_id;  }

let make_sign_response 
  ?(signing_algorithm : signing_algorithm_spec option)
  ?(signature : bytes option)
  ?(key_id : string option)
  () : sign_response = { signing_algorithm; signature; key_id; 
}

let make_sign_request 
  ?(dry_run : bool option)
  ?(grant_tokens : string list option)
  ?(message_type : message_type option)
  ~(signing_algorithm : signing_algorithm_spec)
  ~(message : bytes)
  ~(key_id : string)
  () : sign_request = {
  dry_run; signing_algorithm; grant_tokens; message_type; message; key_id; 
}

let make_schedule_key_deletion_response 
  ?(pending_window_in_days : int option)
  ?(key_state : key_state option)
  ?(deletion_date : float option)
  ?(key_id : string option)
  () : schedule_key_deletion_response = {
  pending_window_in_days; key_state; deletion_date; key_id; 
}

let make_schedule_key_deletion_request 
  ?(pending_window_in_days : int option) ~(key_id : string) ()
: schedule_key_deletion_request = { pending_window_in_days; key_id; 
}

let make_rotate_key_on_demand_response  ?(key_id : string option) ()
: rotate_key_on_demand_response = { key_id; 
}

let make_rotate_key_on_demand_request  ~(key_id : string) ()
: rotate_key_on_demand_request = { key_id;  }

let make_revoke_grant_request 
  ?(dry_run : bool option) ~(grant_id : string) ~(key_id : string) ()
: revoke_grant_request = { dry_run; grant_id; key_id; 
}

let make_retire_grant_request 
  ?(dry_run : bool option)
  ?(grant_id : string option)
  ?(key_id : string option)
  ?(grant_token : string option)
  () : retire_grant_request = { dry_run; grant_id; key_id; grant_token; 
}

let make_multi_region_key 
  ?(region : string option) ?(arn : string option) () : multi_region_key = {
  region; arn;  }

let make_multi_region_configuration 
  ?(replica_keys : multi_region_key list option)
  ?(primary_key : multi_region_key option)
  ?(multi_region_key_type : multi_region_key_type option)
  () : multi_region_configuration = {
  replica_keys; primary_key; multi_region_key_type;  }

let make_key_metadata 
  ?(xks_key_configuration : xks_key_configuration_type option)
  ?(mac_algorithms : mac_algorithm_spec list option)
  ?(pending_deletion_window_in_days : int option)
  ?(multi_region_configuration : multi_region_configuration option)
  ?(multi_region : bool option)
  ?(key_agreement_algorithms : key_agreement_algorithm_spec list option)
  ?(signing_algorithms : signing_algorithm_spec list option)
  ?(encryption_algorithms : encryption_algorithm_spec list option)
  ?(key_spec : key_spec option)
  ?(customer_master_key_spec : customer_master_key_spec option)
  ?(key_manager : key_manager_type option)
  ?(expiration_model : expiration_model_type option)
  ?(cloud_hsm_cluster_id : string option)
  ?(custom_key_store_id : string option)
  ?(origin : origin_type option)
  ?(valid_to : float option)
  ?(deletion_date : float option)
  ?(key_state : key_state option)
  ?(key_usage : key_usage_type option)
  ?(description : string option)
  ?(enabled : bool option)
  ?(creation_date : float option)
  ?(arn : string option)
  ?(aws_account_id : string option)
  ~(key_id : string)
  () : key_metadata = {
  xks_key_configuration;
  mac_algorithms;
  pending_deletion_window_in_days;
  multi_region_configuration;
  multi_region;
  key_agreement_algorithms;
  signing_algorithms;
  encryption_algorithms;
  key_spec;
  customer_master_key_spec;
  key_manager;
  expiration_model;
  cloud_hsm_cluster_id;
  custom_key_store_id;
  origin;
  valid_to;
  deletion_date;
  key_state;
  key_usage;
  description;
  enabled;
  creation_date;
  arn;
  key_id;
  aws_account_id;
   }

let make_replicate_key_response 
  ?(replica_tags : tag list option)
  ?(replica_policy : string option)
  ?(replica_key_metadata : key_metadata option)
  () : replicate_key_response = {
  replica_tags; replica_policy; replica_key_metadata; 
}

let make_replicate_key_request 
  ?(tags : tag list option)
  ?(description : string option)
  ?(bypass_policy_lockout_safety_check : bool option)
  ?(policy : string option)
  ~(replica_region : string)
  ~(key_id : string)
  () : replicate_key_request = {
  tags;
  description;
  bypass_policy_lockout_safety_check;
  policy;
  replica_region;
  key_id;
   }

let make_re_encrypt_response 
  ?(destination_encryption_algorithm : encryption_algorithm_spec option)
  ?(source_encryption_algorithm : encryption_algorithm_spec option)
  ?(key_id : string option)
  ?(source_key_id : string option)
  ?(ciphertext_blob : bytes option)
  () : re_encrypt_response = {
  destination_encryption_algorithm;
  source_encryption_algorithm;
  key_id;
  source_key_id;
  ciphertext_blob;
   }

let make_re_encrypt_request 
  ?(dry_run : bool option)
  ?(grant_tokens : string list option)
  ?(destination_encryption_algorithm : encryption_algorithm_spec option)
  ?(source_encryption_algorithm : encryption_algorithm_spec option)
  ?(destination_encryption_context : (string * string) list option)
  ?(source_key_id : string option)
  ?(source_encryption_context : (string * string) list option)
  ~(destination_key_id : string)
  ~(ciphertext_blob : bytes)
  () : re_encrypt_request = {
  dry_run;
  grant_tokens;
  destination_encryption_algorithm;
  source_encryption_algorithm;
  destination_encryption_context;
  destination_key_id;
  source_key_id;
  source_encryption_context;
  ciphertext_blob;
   }

let make_put_key_policy_request 
  ?(bypass_policy_lockout_safety_check : bool option)
  ?(policy_name : string option)
  ~(policy : string)
  ~(key_id : string)
  () : put_key_policy_request = {
  bypass_policy_lockout_safety_check; policy; policy_name; key_id; 
}

let make_grant_constraints 
  ?(encryption_context_equals : (string * string) list option)
  ?(encryption_context_subset : (string * string) list option)
  () : grant_constraints = {
  encryption_context_equals; encryption_context_subset; 
}

let make_grant_list_entry 
  ?(constraints : grant_constraints option)
  ?(operations : grant_operation list option)
  ?(issuing_account : string option)
  ?(retiring_principal : string option)
  ?(grantee_principal : string option)
  ?(creation_date : float option)
  ?(name : string option)
  ?(grant_id : string option)
  ?(key_id : string option)
  () : grant_list_entry = {
  constraints;
  operations;
  issuing_account;
  retiring_principal;
  grantee_principal;
  creation_date;
  name;
  grant_id;
  key_id;
   }

let make_list_grants_response 
  ?(truncated : bool option)
  ?(next_marker : string option)
  ?(grants : grant_list_entry list option)
  () : list_grants_response = { truncated; next_marker; grants; 
}

let make_list_retirable_grants_request 
  ?(marker : string option)
  ?(limit : int option)
  ~(retiring_principal : string)
  () : list_retirable_grants_request = { retiring_principal; marker; limit; 
}

let make_list_resource_tags_response 
  ?(truncated : bool option)
  ?(next_marker : string option)
  ?(tags : tag list option)
  () : list_resource_tags_response = { truncated; next_marker; tags; 
}

let make_list_resource_tags_request 
  ?(marker : string option) ?(limit : int option) ~(key_id : string) ()
: list_resource_tags_request = { marker; limit; key_id; 
}

let make_key_list_entry 
  ?(key_arn : string option) ?(key_id : string option) () : key_list_entry =
{ key_arn; key_id;  }

let make_list_keys_response 
  ?(truncated : bool option)
  ?(next_marker : string option)
  ?(keys : key_list_entry list option)
  () : list_keys_response = { truncated; next_marker; keys; 
}

let make_list_keys_request 
  ?(marker : string option) ?(limit : int option) () : list_keys_request = {
  marker; limit;  }

let make_rotations_list_entry 
  ?(rotation_type : rotation_type option)
  ?(rotation_date : float option)
  ?(key_id : string option)
  () : rotations_list_entry = { rotation_type; rotation_date; key_id; 
}

let make_list_key_rotations_response 
  ?(truncated : bool option)
  ?(next_marker : string option)
  ?(rotations : rotations_list_entry list option)
  () : list_key_rotations_response = { truncated; next_marker; rotations; 
}

let make_list_key_rotations_request 
  ?(marker : string option) ?(limit : int option) ~(key_id : string) ()
: list_key_rotations_request = { marker; limit; key_id; 
}

let make_list_key_policies_response 
  ?(truncated : bool option)
  ?(next_marker : string option)
  ?(policy_names : string list option)
  () : list_key_policies_response = { truncated; next_marker; policy_names; 
}

let make_list_key_policies_request 
  ?(marker : string option) ?(limit : int option) ~(key_id : string) ()
: list_key_policies_request = { marker; limit; key_id; 
}

let make_list_grants_request 
  ?(grantee_principal : string option)
  ?(grant_id : string option)
  ?(marker : string option)
  ?(limit : int option)
  ~(key_id : string)
  () : list_grants_request = {
  grantee_principal; grant_id; key_id; marker; limit; 
}

let make_alias_list_entry 
  ?(last_updated_date : float option)
  ?(creation_date : float option)
  ?(target_key_id : string option)
  ?(alias_arn : string option)
  ?(alias_name : string option)
  () : alias_list_entry = {
  last_updated_date; creation_date; target_key_id; alias_arn; alias_name; 
}

let make_list_aliases_response 
  ?(truncated : bool option)
  ?(next_marker : string option)
  ?(aliases : alias_list_entry list option)
  () : list_aliases_response = { truncated; next_marker; aliases; 
}

let make_list_aliases_request 
  ?(marker : string option)
  ?(limit : int option)
  ?(key_id : string option)
  () : list_aliases_request = { marker; limit; key_id; 
}

let make_import_key_material_response  () : import_key_material_response =
()

let make_import_key_material_request 
  ?(expiration_model : expiration_model_type option)
  ?(valid_to : float option)
  ~(encrypted_key_material : bytes)
  ~(import_token : bytes)
  ~(key_id : string)
  () : import_key_material_request = {
  expiration_model; valid_to; encrypted_key_material; import_token; key_id; 
}

let make_get_public_key_response 
  ?(key_agreement_algorithms : key_agreement_algorithm_spec list option)
  ?(signing_algorithms : signing_algorithm_spec list option)
  ?(encryption_algorithms : encryption_algorithm_spec list option)
  ?(key_usage : key_usage_type option)
  ?(key_spec : key_spec option)
  ?(customer_master_key_spec : customer_master_key_spec option)
  ?(public_key : bytes option)
  ?(key_id : string option)
  () : get_public_key_response = {
  key_agreement_algorithms;
  signing_algorithms;
  encryption_algorithms;
  key_usage;
  key_spec;
  customer_master_key_spec;
  public_key;
  key_id;
   }

let make_get_public_key_request 
  ?(grant_tokens : string list option) ~(key_id : string) ()
: get_public_key_request = { grant_tokens; key_id; 
}

let make_get_parameters_for_import_response 
  ?(parameters_valid_to : float option)
  ?(public_key : bytes option)
  ?(import_token : bytes option)
  ?(key_id : string option)
  () : get_parameters_for_import_response = {
  parameters_valid_to; public_key; import_token; key_id; 
}

let make_get_parameters_for_import_request 
  ~(wrapping_key_spec : wrapping_key_spec)
  ~(wrapping_algorithm : algorithm_spec)
  ~(key_id : string)
  () : get_parameters_for_import_request = {
  wrapping_key_spec; wrapping_algorithm; key_id; 
}

let make_get_key_rotation_status_response 
  ?(on_demand_rotation_start_date : float option)
  ?(next_rotation_date : float option)
  ?(rotation_period_in_days : int option)
  ?(key_id : string option)
  ?(key_rotation_enabled : bool option)
  () : get_key_rotation_status_response = {
  on_demand_rotation_start_date;
  next_rotation_date;
  rotation_period_in_days;
  key_id;
  key_rotation_enabled;
   }

let make_get_key_rotation_status_request  ~(key_id : string) ()
: get_key_rotation_status_request = { key_id; 
}

let make_get_key_policy_response 
  ?(policy_name : string option) ?(policy : string option) ()
: get_key_policy_response = { policy_name; policy; 
}

let make_get_key_policy_request 
  ?(policy_name : string option) ~(key_id : string) ()
: get_key_policy_request = { policy_name; key_id; 
}

let make_generate_random_response 
  ?(ciphertext_for_recipient : bytes option) ?(plaintext : bytes option) ()
: generate_random_response = { ciphertext_for_recipient; plaintext; 
}

let make_recipient_info 
  ?(attestation_document : bytes option)
  ?(key_encryption_algorithm : key_encryption_mechanism option)
  () : recipient_info = { attestation_document; key_encryption_algorithm; 
}

let make_generate_random_request 
  ?(recipient : recipient_info option)
  ?(custom_key_store_id : string option)
  ?(number_of_bytes : int option)
  () : generate_random_request = {
  recipient; custom_key_store_id; number_of_bytes; 
}

let make_generate_mac_response 
  ?(key_id : string option)
  ?(mac_algorithm : mac_algorithm_spec option)
  ?(mac : bytes option)
  () : generate_mac_response = { key_id; mac_algorithm; mac; 
}

let make_generate_mac_request 
  ?(dry_run : bool option)
  ?(grant_tokens : string list option)
  ~(mac_algorithm : mac_algorithm_spec)
  ~(key_id : string)
  ~(message : bytes)
  () : generate_mac_request = {
  dry_run; grant_tokens; mac_algorithm; key_id; message; 
}

let make_generate_data_key_without_plaintext_response 
  ?(key_id : string option) ?(ciphertext_blob : bytes option) ()
: generate_data_key_without_plaintext_response = { key_id; ciphertext_blob; 
}

let make_generate_data_key_without_plaintext_request 
  ?(dry_run : bool option)
  ?(grant_tokens : string list option)
  ?(number_of_bytes : int option)
  ?(key_spec : data_key_spec option)
  ?(encryption_context : (string * string) list option)
  ~(key_id : string)
  () : generate_data_key_without_plaintext_request = {
  dry_run;
  grant_tokens;
  number_of_bytes;
  key_spec;
  encryption_context;
  key_id;
   }

let make_generate_data_key_pair_without_plaintext_response 
  ?(key_pair_spec : data_key_pair_spec option)
  ?(key_id : string option)
  ?(public_key : bytes option)
  ?(private_key_ciphertext_blob : bytes option)
  () : generate_data_key_pair_without_plaintext_response = {
  key_pair_spec; key_id; public_key; private_key_ciphertext_blob; 
}

let make_generate_data_key_pair_without_plaintext_request 
  ?(dry_run : bool option)
  ?(grant_tokens : string list option)
  ?(encryption_context : (string * string) list option)
  ~(key_pair_spec : data_key_pair_spec)
  ~(key_id : string)
  () : generate_data_key_pair_without_plaintext_request = {
  dry_run; grant_tokens; key_pair_spec; key_id; encryption_context; 
}

let make_generate_data_key_pair_response 
  ?(ciphertext_for_recipient : bytes option)
  ?(key_pair_spec : data_key_pair_spec option)
  ?(key_id : string option)
  ?(public_key : bytes option)
  ?(private_key_plaintext : bytes option)
  ?(private_key_ciphertext_blob : bytes option)
  () : generate_data_key_pair_response = {
  ciphertext_for_recipient;
  key_pair_spec;
  key_id;
  public_key;
  private_key_plaintext;
  private_key_ciphertext_blob;
   }

let make_generate_data_key_pair_request 
  ?(dry_run : bool option)
  ?(recipient : recipient_info option)
  ?(grant_tokens : string list option)
  ?(encryption_context : (string * string) list option)
  ~(key_pair_spec : data_key_pair_spec)
  ~(key_id : string)
  () : generate_data_key_pair_request = {
  dry_run;
  recipient;
  grant_tokens;
  key_pair_spec;
  key_id;
  encryption_context;
   }

let make_generate_data_key_response 
  ?(ciphertext_for_recipient : bytes option)
  ?(key_id : string option)
  ?(plaintext : bytes option)
  ?(ciphertext_blob : bytes option)
  () : generate_data_key_response = {
  ciphertext_for_recipient; key_id; plaintext; ciphertext_blob; 
}

let make_generate_data_key_request 
  ?(dry_run : bool option)
  ?(recipient : recipient_info option)
  ?(grant_tokens : string list option)
  ?(key_spec : data_key_spec option)
  ?(number_of_bytes : int option)
  ?(encryption_context : (string * string) list option)
  ~(key_id : string)
  () : generate_data_key_request = {
  dry_run;
  recipient;
  grant_tokens;
  key_spec;
  number_of_bytes;
  encryption_context;
  key_id;
   }

let make_encrypt_response 
  ?(encryption_algorithm : encryption_algorithm_spec option)
  ?(key_id : string option)
  ?(ciphertext_blob : bytes option)
  () : encrypt_response = { encryption_algorithm; key_id; ciphertext_blob; 
}

let make_encrypt_request 
  ?(dry_run : bool option)
  ?(encryption_algorithm : encryption_algorithm_spec option)
  ?(grant_tokens : string list option)
  ?(encryption_context : (string * string) list option)
  ~(plaintext : bytes)
  ~(key_id : string)
  () : encrypt_request = {
  dry_run;
  encryption_algorithm;
  grant_tokens;
  encryption_context;
  plaintext;
  key_id;
   }

let make_enable_key_rotation_request 
  ?(rotation_period_in_days : int option) ~(key_id : string) ()
: enable_key_rotation_request = { rotation_period_in_days; key_id; 
}

let make_enable_key_request  ~(key_id : string) () : enable_key_request = {
  key_id;  }

let make_disconnect_custom_key_store_response  ()
: disconnect_custom_key_store_response =
()

let make_disconnect_custom_key_store_request 
  ~(custom_key_store_id : string) () : disconnect_custom_key_store_request =
{ custom_key_store_id;  }

let make_disable_key_rotation_request  ~(key_id : string) ()
: disable_key_rotation_request = { key_id;  }

let make_disable_key_request  ~(key_id : string) () : disable_key_request = {
  key_id;  }

let make_describe_key_response  ?(key_metadata : key_metadata option) ()
: describe_key_response = { key_metadata;  }

let make_describe_key_request 
  ?(grant_tokens : string list option) ~(key_id : string) ()
: describe_key_request = { grant_tokens; key_id; 
}

let make_custom_key_stores_list_entry 
  ?(xks_proxy_configuration : xks_proxy_configuration_type option)
  ?(custom_key_store_type : custom_key_store_type option)
  ?(creation_date : float option)
  ?(connection_error_code : connection_error_code_type option)
  ?(connection_state : connection_state_type option)
  ?(trust_anchor_certificate : string option)
  ?(cloud_hsm_cluster_id : string option)
  ?(custom_key_store_name : string option)
  ?(custom_key_store_id : string option)
  () : custom_key_stores_list_entry = {
  xks_proxy_configuration;
  custom_key_store_type;
  creation_date;
  connection_error_code;
  connection_state;
  trust_anchor_certificate;
  cloud_hsm_cluster_id;
  custom_key_store_name;
  custom_key_store_id;
   }

let make_describe_custom_key_stores_response 
  ?(truncated : bool option)
  ?(next_marker : string option)
  ?(custom_key_stores : custom_key_stores_list_entry list option)
  () : describe_custom_key_stores_response = {
  truncated; next_marker; custom_key_stores; 
}

let make_describe_custom_key_stores_request 
  ?(marker : string option)
  ?(limit : int option)
  ?(custom_key_store_name : string option)
  ?(custom_key_store_id : string option)
  () : describe_custom_key_stores_request = {
  marker; limit; custom_key_store_name; custom_key_store_id; 
}

let make_derive_shared_secret_response 
  ?(key_origin : origin_type option)
  ?(key_agreement_algorithm : key_agreement_algorithm_spec option)
  ?(ciphertext_for_recipient : bytes option)
  ?(shared_secret : bytes option)
  ?(key_id : string option)
  () : derive_shared_secret_response = {
  key_origin;
  key_agreement_algorithm;
  ciphertext_for_recipient;
  shared_secret;
  key_id;
   }

let make_derive_shared_secret_request 
  ?(recipient : recipient_info option)
  ?(dry_run : bool option)
  ?(grant_tokens : string list option)
  ~(public_key : bytes)
  ~(key_agreement_algorithm : key_agreement_algorithm_spec)
  ~(key_id : string)
  () : derive_shared_secret_request = {
  recipient;
  dry_run;
  grant_tokens;
  public_key;
  key_agreement_algorithm;
  key_id;
   }

let make_delete_imported_key_material_request  ~(key_id : string) ()
: delete_imported_key_material_request = { key_id; 
}

let make_delete_custom_key_store_response  ()
: delete_custom_key_store_response =
()

let make_delete_custom_key_store_request  ~(custom_key_store_id : string) ()
: delete_custom_key_store_request = { custom_key_store_id; 
}

let make_delete_alias_request  ~(alias_name : string) ()
: delete_alias_request = { alias_name;  }

let make_decrypt_response 
  ?(ciphertext_for_recipient : bytes option)
  ?(encryption_algorithm : encryption_algorithm_spec option)
  ?(plaintext : bytes option)
  ?(key_id : string option)
  () : decrypt_response = {
  ciphertext_for_recipient; encryption_algorithm; plaintext; key_id; 
}

let make_decrypt_request 
  ?(dry_run : bool option)
  ?(recipient : recipient_info option)
  ?(encryption_algorithm : encryption_algorithm_spec option)
  ?(key_id : string option)
  ?(grant_tokens : string list option)
  ?(encryption_context : (string * string) list option)
  ~(ciphertext_blob : bytes)
  () : decrypt_request = {
  dry_run;
  recipient;
  encryption_algorithm;
  key_id;
  grant_tokens;
  encryption_context;
  ciphertext_blob;
   }

let make_create_key_response  ?(key_metadata : key_metadata option) ()
: create_key_response = { key_metadata;  }

let make_create_key_request 
  ?(xks_key_id : string option)
  ?(multi_region : bool option)
  ?(tags : tag list option)
  ?(bypass_policy_lockout_safety_check : bool option)
  ?(custom_key_store_id : string option)
  ?(origin : origin_type option)
  ?(key_spec : key_spec option)
  ?(customer_master_key_spec : customer_master_key_spec option)
  ?(key_usage : key_usage_type option)
  ?(description : string option)
  ?(policy : string option)
  () : create_key_request = {
  xks_key_id;
  multi_region;
  tags;
  bypass_policy_lockout_safety_check;
  custom_key_store_id;
  origin;
  key_spec;
  customer_master_key_spec;
  key_usage;
  description;
  policy;
   }

let make_create_grant_response 
  ?(grant_id : string option) ?(grant_token : string option) ()
: create_grant_response = { grant_id; grant_token; 
}

let make_create_grant_request 
  ?(dry_run : bool option)
  ?(name : string option)
  ?(grant_tokens : string list option)
  ?(constraints : grant_constraints option)
  ?(retiring_principal : string option)
  ~(operations : grant_operation list)
  ~(grantee_principal : string)
  ~(key_id : string)
  () : create_grant_request = {
  dry_run;
  name;
  grant_tokens;
  constraints;
  operations;
  retiring_principal;
  grantee_principal;
  key_id;
   }

let make_create_custom_key_store_response 
  ?(custom_key_store_id : string option) ()
: create_custom_key_store_response = { custom_key_store_id; 
}

let make_create_custom_key_store_request 
  ?(xks_proxy_connectivity : xks_proxy_connectivity_type option)
  ?(xks_proxy_authentication_credential : xks_proxy_authentication_credential_type option)
  ?(xks_proxy_vpc_endpoint_service_name : string option)
  ?(xks_proxy_uri_path : string option)
  ?(xks_proxy_uri_endpoint : string option)
  ?(custom_key_store_type : custom_key_store_type option)
  ?(key_store_password : string option)
  ?(trust_anchor_certificate : string option)
  ?(cloud_hsm_cluster_id : string option)
  ~(custom_key_store_name : string)
  () : create_custom_key_store_request = {
  xks_proxy_connectivity;
  xks_proxy_authentication_credential;
  xks_proxy_vpc_endpoint_service_name;
  xks_proxy_uri_path;
  xks_proxy_uri_endpoint;
  custom_key_store_type;
  key_store_password;
  trust_anchor_certificate;
  cloud_hsm_cluster_id;
  custom_key_store_name;
   }

let make_create_alias_request 
  ~(target_key_id : string) ~(alias_name : string) () : create_alias_request
= { target_key_id; alias_name;  }

let make_connect_custom_key_store_response  ()
: connect_custom_key_store_response =
()

let make_connect_custom_key_store_request  ~(custom_key_store_id : string) ()
: connect_custom_key_store_request = { custom_key_store_id; 
}

let make_cancel_key_deletion_response  ?(key_id : string option) ()
: cancel_key_deletion_response = { key_id; 
}

let make_cancel_key_deletion_request  ~(key_id : string) ()
: cancel_key_deletion_request = { key_id; 
}

