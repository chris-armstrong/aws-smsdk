open Types
val make_verify_trust_request : trust_id:string -> unit
-> verify_trust_request
(** Create a {!type-verify_trust_request} type *)

val make_os_update_settings : ?os_version:os_version -> unit
-> os_update_settings
(** Create a {!type-os_update_settings} type *)

val make_update_value : ?os_update_settings:os_update_settings -> unit
-> update_value
(** Create a {!type-update_value} type *)

val make_update_trust_request :
  ?selective_auth:selective_auth -> trust_id:string -> unit
-> update_trust_request
(** Create a {!type-update_trust_request} type *)

val make_setting : value:string -> name:string -> unit
-> setting
(** Create a {!type-setting} type *)

val make_update_settings_request :
  settings:setting list -> directory_id:string -> unit
-> update_settings_request
(** Create a {!type-update_settings_request} type *)

val make_radius_settings :
  ?use_same_username:bool ->
  ?display_label:string ->
  ?authentication_protocol:radius_authentication_protocol ->
  ?shared_secret:string ->
  ?radius_retries:int ->
  ?radius_timeout:int ->
  ?radius_port:int ->
  ?radius_servers:string list ->
  unit
-> radius_settings
(** Create a {!type-radius_settings} type *)

val make_update_radius_request :
  radius_settings:radius_settings -> directory_id:string -> unit
-> update_radius_request
(** Create a {!type-update_radius_request} type *)

val make_update_number_of_domain_controllers_request :
  desired_number:int -> directory_id:string -> unit
-> update_number_of_domain_controllers_request
(** Create a {!type-update_number_of_domain_controllers_request} type *)

val make_update_info_entry :
  ?last_updated_date_time:float ->
  ?start_time:float ->
  ?previous_value:update_value ->
  ?new_value:update_value ->
  ?initiated_by:string ->
  ?status_reason:string ->
  ?status:update_status ->
  ?region:string ->
  unit
-> update_info_entry
(** Create a {!type-update_info_entry} type *)

val make_update_directory_setup_request :
  ?create_snapshot_before_update:bool ->
  ?os_update_settings:os_update_settings ->
  update_type:update_type ->
  directory_id:string ->
  unit
-> update_directory_setup_request
(** Create a {!type-update_directory_setup_request} type *)

val make_update_conditional_forwarder_request :
  dns_ip_addrs:string list ->
  remote_domain_name:string ->
  directory_id:string ->
  unit
-> update_conditional_forwarder_request
(** Create a {!type-update_conditional_forwarder_request} type *)

val make_unshare_target : type_:target_type -> id:string -> unit
-> unshare_target
(** Create a {!type-unshare_target} type *)

val make_unshare_directory_request :
  unshare_target:unshare_target -> directory_id:string -> unit
-> unshare_directory_request
(** Create a {!type-unshare_directory_request} type *)

val make_trust :
  ?selective_auth:selective_auth ->
  ?trust_state_reason:string ->
  ?state_last_updated_date_time:float ->
  ?last_updated_date_time:float ->
  ?created_date_time:float ->
  ?trust_state:trust_state ->
  ?trust_direction:trust_direction ->
  ?trust_type:trust_type ->
  ?remote_domain_name:string ->
  ?trust_id:string ->
  ?directory_id:string ->
  unit -> trust
(** Create a {!type-trust} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_start_schema_extension_request :
  description:string ->
  ldif_content:string ->
  create_snapshot_before_schema_extension:bool ->
  directory_id:string ->
  unit
-> start_schema_extension_request
(** Create a {!type-start_schema_extension_request} type *)

val make_snapshot :
  ?start_time:float ->
  ?status:snapshot_status ->
  ?name:string ->
  ?type_:snapshot_type ->
  ?snapshot_id:string ->
  ?directory_id:string ->
  unit
-> snapshot
(** Create a {!type-snapshot} type *)

val make_snapshot_limits :
  ?manual_snapshots_limit_reached:bool ->
  ?manual_snapshots_current_count:int ->
  ?manual_snapshots_limit:int ->
  unit
-> snapshot_limits
(** Create a {!type-snapshot_limits} type *)

val make_shared_directory :
  ?last_updated_date_time:float ->
  ?created_date_time:float ->
  ?share_notes:string ->
  ?share_status:share_status ->
  ?shared_directory_id:string ->
  ?shared_account_id:string ->
  ?share_method:share_method ->
  ?owner_directory_id:string ->
  ?owner_account_id:string ->
  unit
-> shared_directory
(** Create a {!type-shared_directory} type *)

val make_share_target : type_:target_type -> id:string -> unit
-> share_target
(** Create a {!type-share_target} type *)

val make_share_directory_request :
  ?share_notes:string ->
  share_method:share_method ->
  share_target:share_target ->
  directory_id:string ->
  unit
-> share_directory_request
(** Create a {!type-share_directory_request} type *)

val make_setting_entry :
  ?data_type:string ->
  ?last_requested_date_time:float ->
  ?last_updated_date_time:float ->
  ?request_status_message:string ->
  ?request_detailed_status:(string * directory_configuration_status) list ->
  ?request_status:directory_configuration_status ->
  ?requested_value:string ->
  ?applied_value:string ->
  ?allowed_values:string ->
  ?name:string ->
  ?type_:string ->
  unit
-> setting_entry
(** Create a {!type-setting_entry} type *)

val make_schema_extension_info :
  ?end_date_time:float ->
  ?start_date_time:float ->
  ?schema_extension_status_reason:string ->
  ?schema_extension_status:schema_extension_status ->
  ?description:string ->
  ?schema_extension_id:string ->
  ?directory_id:string ->
  unit
-> schema_extension_info
(** Create a {!type-schema_extension_info} type *)

val make_restore_from_snapshot_request : snapshot_id:string -> unit
-> restore_from_snapshot_request
(** Create a {!type-restore_from_snapshot_request} type *)

val make_reset_user_password_request :
  new_password:string -> user_name:string -> directory_id:string -> unit
-> reset_user_password_request
(** Create a {!type-reset_user_password_request} type *)

val make_remove_tags_from_resource_request :
  tag_keys:string list -> resource_id:string -> unit
-> remove_tags_from_resource_request
(** Create a {!type-remove_tags_from_resource_request} type *)

val make_remove_region_request : directory_id:string -> unit
-> remove_region_request
(** Create a {!type-remove_region_request} type *)

val make_remove_ip_routes_request :
  cidr_ips:string list -> directory_id:string -> unit
-> remove_ip_routes_request
(** Create a {!type-remove_ip_routes_request} type *)

val make_reject_shared_directory_request : shared_directory_id:string -> unit
-> reject_shared_directory_request
(** Create a {!type-reject_shared_directory_request} type *)

val make_register_event_topic_request :
  topic_name:string -> directory_id:string -> unit
-> register_event_topic_request
(** Create a {!type-register_event_topic_request} type *)

val make_client_cert_auth_settings : ?ocsp_url:string -> unit
-> client_cert_auth_settings
(** Create a {!type-client_cert_auth_settings} type *)

val make_register_certificate_request :
  ?client_cert_auth_settings:client_cert_auth_settings ->
  ?type_:certificate_type ->
  certificate_data:string ->
  directory_id:string ->
  unit
-> register_certificate_request
(** Create a {!type-register_certificate_request} type *)

val make_regions_info :
  ?additional_regions:string list -> ?primary_region:string -> unit
-> regions_info
(** Create a {!type-regions_info} type *)

val make_directory_vpc_settings :
  subnet_ids:string list -> vpc_id:string -> unit
-> directory_vpc_settings
(** Create a {!type-directory_vpc_settings} type *)

val make_region_description :
  ?last_updated_date_time:float ->
  ?status_last_updated_date_time:float ->
  ?launch_time:float ->
  ?desired_number_of_domain_controllers:int ->
  ?vpc_settings:directory_vpc_settings ->
  ?status:directory_stage ->
  ?region_type:region_type ->
  ?region_name:string ->
  ?directory_id:string ->
  unit
-> region_description
(** Create a {!type-region_description} type *)

val make_directory_vpc_settings_description :
  ?availability_zones:string list ->
  ?security_group_id:string ->
  ?subnet_ids:string list ->
  ?vpc_id:string ->
  unit
-> directory_vpc_settings_description
(** Create a {!type-directory_vpc_settings_description} type *)

val make_owner_directory_description :
  ?radius_status:radius_status ->
  ?radius_settings:radius_settings ->
  ?vpc_settings:directory_vpc_settings_description ->
  ?dns_ip_addrs:string list ->
  ?account_id:string ->
  ?directory_id:string ->
  unit
-> owner_directory_description
(** Create a {!type-owner_directory_description} type *)

val make_log_subscription :
  ?subscription_created_date_time:float ->
  ?log_group_name:string ->
  ?directory_id:string ->
  unit
-> log_subscription
(** Create a {!type-log_subscription} type *)

val make_list_tags_for_resource_request :
  ?limit:int -> ?next_token:string -> resource_id:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_list_schema_extensions_request :
  ?limit:int -> ?next_token:string -> directory_id:string -> unit
-> list_schema_extensions_request
(** Create a {!type-list_schema_extensions_request} type *)

val make_list_log_subscriptions_request :
  ?limit:int -> ?next_token:string -> ?directory_id:string -> unit
-> list_log_subscriptions_request
(** Create a {!type-list_log_subscriptions_request} type *)

val make_ip_route_info :
  ?description:string ->
  ?ip_route_status_reason:string ->
  ?added_date_time:float ->
  ?ip_route_status_msg:ip_route_status_msg ->
  ?cidr_ip:string ->
  ?directory_id:string ->
  unit
-> ip_route_info
(** Create a {!type-ip_route_info} type *)

val make_list_ip_routes_request :
  ?limit:int -> ?next_token:string -> directory_id:string -> unit
-> list_ip_routes_request
(** Create a {!type-list_ip_routes_request} type *)

val make_certificate_info :
  ?type_:certificate_type ->
  ?expiry_date_time:float ->
  ?state:certificate_state ->
  ?common_name:string ->
  ?certificate_id:string ->
  unit
-> certificate_info
(** Create a {!type-certificate_info} type *)

val make_list_certificates_request :
  ?limit:int -> ?next_token:string -> directory_id:string -> unit
-> list_certificates_request
(** Create a {!type-list_certificates_request} type *)

val make_ldaps_setting_info :
  ?last_updated_date_time:float ->
  ?ldaps_status_reason:string ->
  ?ldaps_status:ldaps_status ->
  unit
-> ldaps_setting_info
(** Create a {!type-ldaps_setting_info} type *)

val make_ip_route : ?description:string -> ?cidr_ip:string -> unit
-> ip_route
(** Create a {!type-ip_route} type *)

val make_get_snapshot_limits_request : directory_id:string -> unit
-> get_snapshot_limits_request
(** Create a {!type-get_snapshot_limits_request} type *)

val make_directory_limits :
  ?connected_directories_limit_reached:bool ->
  ?connected_directories_current_count:int ->
  ?connected_directories_limit:int ->
  ?cloud_only_microsoft_ad_limit_reached:bool ->
  ?cloud_only_microsoft_ad_current_count:int ->
  ?cloud_only_microsoft_ad_limit:int ->
  ?cloud_only_directories_limit_reached:bool ->
  ?cloud_only_directories_current_count:int ->
  ?cloud_only_directories_limit:int ->
  unit
-> directory_limits
(** Create a {!type-directory_limits} type *)

val make_get_directory_limits_request : unit
-> get_directory_limits_request
(** Create a {!type-get_directory_limits_request} type *)

val make_event_topic :
  ?status:topic_status ->
  ?created_date_time:float ->
  ?topic_arn:string ->
  ?topic_name:string ->
  ?directory_id:string ->
  unit
-> event_topic
(** Create a {!type-event_topic} type *)

val make_enable_sso_request :
  ?password:string -> ?user_name:string -> directory_id:string -> unit
-> enable_sso_request
(** Create a {!type-enable_sso_request} type *)

val make_enable_radius_request :
  radius_settings:radius_settings -> directory_id:string -> unit
-> enable_radius_request
(** Create a {!type-enable_radius_request} type *)

val make_enable_ldaps_request :
  type_:ldaps_type -> directory_id:string -> unit
-> enable_ldaps_request
(** Create a {!type-enable_ldaps_request} type *)

val make_enable_client_authentication_request :
  type_:client_authentication_type -> directory_id:string -> unit
-> enable_client_authentication_request
(** Create a {!type-enable_client_authentication_request} type *)

val make_domain_controller :
  ?status_last_updated_date_time:float ->
  ?launch_time:float ->
  ?status_reason:string ->
  ?status:domain_controller_status ->
  ?availability_zone:string ->
  ?subnet_id:string ->
  ?vpc_id:string ->
  ?dns_ip_addr:string ->
  ?domain_controller_id:string ->
  ?directory_id:string ->
  unit
-> domain_controller
(** Create a {!type-domain_controller} type *)

val make_disable_sso_request :
  ?password:string -> ?user_name:string -> directory_id:string -> unit
-> disable_sso_request
(** Create a {!type-disable_sso_request} type *)

val make_disable_radius_request : directory_id:string -> unit
-> disable_radius_request
(** Create a {!type-disable_radius_request} type *)

val make_disable_ldaps_request :
  type_:ldaps_type -> directory_id:string -> unit
-> disable_ldaps_request
(** Create a {!type-disable_ldaps_request} type *)

val make_disable_client_authentication_request :
  type_:client_authentication_type -> directory_id:string -> unit
-> disable_client_authentication_request
(** Create a {!type-disable_client_authentication_request} type *)

val make_describe_update_directory_request :
  ?next_token:string ->
  ?region_name:string ->
  update_type:update_type ->
  directory_id:string ->
  unit
-> describe_update_directory_request
(** Create a {!type-describe_update_directory_request} type *)

val make_describe_trusts_request :
  ?limit:int ->
  ?next_token:string ->
  ?trust_ids:string list ->
  ?directory_id:string ->
  unit
-> describe_trusts_request
(** Create a {!type-describe_trusts_request} type *)

val make_describe_snapshots_request :
  ?limit:int ->
  ?next_token:string ->
  ?snapshot_ids:string list ->
  ?directory_id:string ->
  unit
-> describe_snapshots_request
(** Create a {!type-describe_snapshots_request} type *)

val make_describe_shared_directories_request :
  ?limit:int ->
  ?next_token:string ->
  ?shared_directory_ids:string list ->
  owner_directory_id:string ->
  unit
-> describe_shared_directories_request
(** Create a {!type-describe_shared_directories_request} type *)

val make_describe_settings_request :
  ?next_token:string ->
  ?status:directory_configuration_status ->
  directory_id:string ->
  unit
-> describe_settings_request
(** Create a {!type-describe_settings_request} type *)

val make_describe_regions_request :
  ?next_token:string -> ?region_name:string -> directory_id:string -> unit
-> describe_regions_request
(** Create a {!type-describe_regions_request} type *)

val make_describe_ldaps_settings_request :
  ?limit:int ->
  ?next_token:string ->
  ?type_:ldaps_type ->
  directory_id:string ->
  unit
-> describe_ldaps_settings_request
(** Create a {!type-describe_ldaps_settings_request} type *)

val make_describe_event_topics_request :
  ?topic_names:string list -> ?directory_id:string -> unit
-> describe_event_topics_request
(** Create a {!type-describe_event_topics_request} type *)

val make_describe_domain_controllers_request :
  ?limit:int ->
  ?next_token:string ->
  ?domain_controller_ids:string list ->
  directory_id:string ->
  unit
-> describe_domain_controllers_request
(** Create a {!type-describe_domain_controllers_request} type *)

val make_directory_connect_settings_description :
  ?connect_ips:string list ->
  ?availability_zones:string list ->
  ?security_group_id:string ->
  ?customer_user_name:string ->
  ?subnet_ids:string list ->
  ?vpc_id:string ->
  unit
-> directory_connect_settings_description
(** Create a {!type-directory_connect_settings_description} type *)

val make_directory_description :
  ?os_version:os_version ->
  ?regions_info:regions_info ->
  ?owner_directory_description:owner_directory_description ->
  ?desired_number_of_domain_controllers:int ->
  ?sso_enabled:bool ->
  ?stage_reason:string ->
  ?radius_status:radius_status ->
  ?radius_settings:radius_settings ->
  ?connect_settings:directory_connect_settings_description ->
  ?vpc_settings:directory_vpc_settings_description ->
  ?type_:directory_type ->
  ?stage_last_updated_date_time:float ->
  ?launch_time:float ->
  ?share_notes:string ->
  ?share_method:share_method ->
  ?share_status:share_status ->
  ?stage:directory_stage ->
  ?dns_ip_addrs:string list ->
  ?description:string ->
  ?access_url:string ->
  ?alias:string ->
  ?edition:directory_edition ->
  ?size:directory_size ->
  ?short_name:string ->
  ?name:string ->
  ?directory_id:string ->
  unit
-> directory_description
(** Create a {!type-directory_description} type *)

val make_describe_directories_request :
  ?limit:int -> ?next_token:string -> ?directory_ids:string list -> unit
-> describe_directories_request
(** Create a {!type-describe_directories_request} type *)

val make_conditional_forwarder :
  ?replication_scope:replication_scope ->
  ?dns_ip_addrs:string list ->
  ?remote_domain_name:string ->
  unit
-> conditional_forwarder
(** Create a {!type-conditional_forwarder} type *)

val make_describe_conditional_forwarders_request :
  ?remote_domain_names:string list -> directory_id:string -> unit
-> describe_conditional_forwarders_request
(** Create a {!type-describe_conditional_forwarders_request} type *)

val make_client_authentication_setting_info :
  ?last_updated_date_time:float ->
  ?status:client_authentication_status ->
  ?type_:client_authentication_type ->
  unit
-> client_authentication_setting_info
(** Create a {!type-client_authentication_setting_info} type *)

val make_describe_client_authentication_settings_request :
  ?limit:int ->
  ?next_token:string ->
  ?type_:client_authentication_type ->
  directory_id:string ->
  unit
-> describe_client_authentication_settings_request
(** Create a {!type-describe_client_authentication_settings_request} type *)

val make_certificate :
  ?client_cert_auth_settings:client_cert_auth_settings ->
  ?type_:certificate_type ->
  ?expiry_date_time:float ->
  ?registered_date_time:float ->
  ?common_name:string ->
  ?state_reason:string ->
  ?state:certificate_state ->
  ?certificate_id:string ->
  unit
-> certificate
(** Create a {!type-certificate} type *)

val make_describe_certificate_request :
  certificate_id:string -> directory_id:string -> unit
-> describe_certificate_request
(** Create a {!type-describe_certificate_request} type *)

val make_deregister_event_topic_request :
  topic_name:string -> directory_id:string -> unit
-> deregister_event_topic_request
(** Create a {!type-deregister_event_topic_request} type *)

val make_deregister_certificate_request :
  certificate_id:string -> directory_id:string -> unit
-> deregister_certificate_request
(** Create a {!type-deregister_certificate_request} type *)

val make_delete_trust_request :
  ?delete_associated_conditional_forwarder:bool -> trust_id:string -> unit
-> delete_trust_request
(** Create a {!type-delete_trust_request} type *)

val make_delete_snapshot_request : snapshot_id:string -> unit
-> delete_snapshot_request
(** Create a {!type-delete_snapshot_request} type *)

val make_delete_log_subscription_request : directory_id:string -> unit
-> delete_log_subscription_request
(** Create a {!type-delete_log_subscription_request} type *)

val make_delete_directory_request : directory_id:string -> unit
-> delete_directory_request
(** Create a {!type-delete_directory_request} type *)

val make_delete_conditional_forwarder_request :
  remote_domain_name:string -> directory_id:string -> unit
-> delete_conditional_forwarder_request
(** Create a {!type-delete_conditional_forwarder_request} type *)

val make_create_trust_request :
  ?selective_auth:selective_auth ->
  ?conditional_forwarder_ip_addrs:string list ->
  ?trust_type:trust_type ->
  trust_direction:trust_direction ->
  trust_password:string ->
  remote_domain_name:string ->
  directory_id:string ->
  unit
-> create_trust_request
(** Create a {!type-create_trust_request} type *)

val make_create_snapshot_request :
  ?name:string -> directory_id:string -> unit
-> create_snapshot_request
(** Create a {!type-create_snapshot_request} type *)

val make_create_microsoft_ad_request :
  ?tags:tag list ->
  ?edition:directory_edition ->
  ?description:string ->
  ?short_name:string ->
  vpc_settings:directory_vpc_settings ->
  password:string ->
  name:string ->
  unit
-> create_microsoft_ad_request
(** Create a {!type-create_microsoft_ad_request} type *)

val make_create_log_subscription_request :
  log_group_name:string -> directory_id:string -> unit
-> create_log_subscription_request
(** Create a {!type-create_log_subscription_request} type *)

val make_create_directory_request :
  ?tags:tag list ->
  ?vpc_settings:directory_vpc_settings ->
  ?description:string ->
  ?short_name:string ->
  size:directory_size ->
  password:string ->
  name:string ->
  unit
-> create_directory_request
(** Create a {!type-create_directory_request} type *)

val make_create_conditional_forwarder_request :
  dns_ip_addrs:string list ->
  remote_domain_name:string ->
  directory_id:string ->
  unit
-> create_conditional_forwarder_request
(** Create a {!type-create_conditional_forwarder_request} type *)

val make_attribute : ?value:string -> ?name:string -> unit
-> attribute
(** Create a {!type-attribute} type *)

val make_computer :
  ?computer_attributes:attribute list ->
  ?computer_name:string ->
  ?computer_id:string ->
  unit
-> computer
(** Create a {!type-computer} type *)

val make_create_computer_request :
  ?computer_attributes:attribute list ->
  ?organizational_unit_distinguished_name:string ->
  password:string ->
  computer_name:string ->
  directory_id:string ->
  unit
-> create_computer_request
(** Create a {!type-create_computer_request} type *)

val make_create_alias_request : alias:string -> directory_id:string -> unit
-> create_alias_request
(** Create a {!type-create_alias_request} type *)

val make_directory_connect_settings :
  customer_user_name:string ->
  customer_dns_ips:string list ->
  subnet_ids:string list ->
  vpc_id:string ->
  unit
-> directory_connect_settings
(** Create a {!type-directory_connect_settings} type *)

val make_connect_directory_request :
  ?tags:tag list ->
  ?description:string ->
  ?short_name:string ->
  connect_settings:directory_connect_settings ->
  size:directory_size ->
  password:string ->
  name:string ->
  unit
-> connect_directory_request
(** Create a {!type-connect_directory_request} type *)

val make_cancel_schema_extension_request :
  schema_extension_id:string -> directory_id:string -> unit
-> cancel_schema_extension_request
(** Create a {!type-cancel_schema_extension_request} type *)

val make_add_tags_to_resource_request :
  tags:tag list -> resource_id:string -> unit
-> add_tags_to_resource_request
(** Create a {!type-add_tags_to_resource_request} type *)

val make_add_region_request :
  vpc_settings:directory_vpc_settings ->
  region_name:string ->
  directory_id:string ->
  unit
-> add_region_request
(** Create a {!type-add_region_request} type *)

val make_add_ip_routes_request :
  ?update_security_group_for_directory_controllers:bool ->
  ip_routes:ip_route list ->
  directory_id:string ->
  unit
-> add_ip_routes_request
(** Create a {!type-add_ip_routes_request} type *)

val make_accept_shared_directory_request : shared_directory_id:string -> unit
-> accept_shared_directory_request
(** Create a {!type-accept_shared_directory_request} type *)

