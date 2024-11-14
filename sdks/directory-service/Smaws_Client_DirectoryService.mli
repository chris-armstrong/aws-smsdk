open Smaws_Lib
val service : Service.descriptor

type verify_trust_result = {
  trust_id: string option
}

type verify_trust_request = {
  trust_id: string
}

type unsupported_operation_exception = {
  request_id: string option;
  message: string option
}

type service_exception = {
  request_id: string option;
  message: string option
}

type invalid_parameter_exception = {
  request_id: string option;
  message: string option
}

type entity_does_not_exist_exception = {
  request_id: string option;
  message: string option
}

type client_exception = {
  request_id: string option;
  message: string option
}

type user_does_not_exist_exception = {
  request_id: string option;
  message: string option
}

type os_version = | VERSION_2019
  | VERSION_2012

type os_update_settings = {
  os_version: os_version option
}

type update_value = {
  os_update_settings: os_update_settings option
}

type update_type = | OS

type update_trust_result = {
  trust_id: string option;
  request_id: string option
}

type selective_auth = | DISABLED
  | ENABLED

type update_trust_request = {
  selective_auth: selective_auth option;
  trust_id: string
}

type update_status = | UPDATE_FAILED
  | UPDATING
  | UPDATED

type update_settings_result = {
  directory_id: string option
}

type setting = {
  value: string;
  name: string
}

type update_settings_request = {
  settings: setting list;
  directory_id: string
}

type unsupported_settings_exception = {
  request_id: string option;
  message: string option
}

type incompatible_settings_exception = {
  request_id: string option;
  message: string option
}

type directory_unavailable_exception = {
  request_id: string option;
  message: string option
}

type directory_does_not_exist_exception = {
  request_id: string option;
  message: string option
}

type update_radius_result = unit

type radius_authentication_protocol = | MSCHAPV2
  | MSCHAPV1
  | CHAP
  | PAP

type radius_settings = {
  use_same_username: bool option;
  display_label: string option;
  authentication_protocol: radius_authentication_protocol option;
  shared_secret: string option;
  radius_retries: int option;
  radius_timeout: int option;
  radius_port: int option;
  radius_servers: string list option
}

type update_radius_request = {
  radius_settings: radius_settings;
  directory_id: string
}

type update_number_of_domain_controllers_result = unit

type update_number_of_domain_controllers_request = {
  desired_number: int;
  directory_id: string
}

type domain_controller_limit_exceeded_exception = {
  request_id: string option;
  message: string option
}

type update_info_entry = {
  last_updated_date_time: float option;
  start_time: float option;
  previous_value: update_value option;
  new_value: update_value option;
  initiated_by: string option;
  status_reason: string option;
  status: update_status option;
  region: string option
}

type update_directory_setup_result = unit

type update_directory_setup_request = {
  create_snapshot_before_update: bool option;
  os_update_settings: os_update_settings option;
  update_type: update_type;
  directory_id: string
}

type snapshot_limit_exceeded_exception = {
  request_id: string option;
  message: string option
}

type directory_in_desired_state_exception = {
  request_id: string option;
  message: string option
}

type access_denied_exception = {
  request_id: string option;
  message: string option
}

type update_conditional_forwarder_result = unit

type update_conditional_forwarder_request = {
  dns_ip_addrs: string list;
  remote_domain_name: string;
  directory_id: string
}

type target_type = | ACCOUNT

type unshare_target = {
  type_: target_type;
  id: string
}

type unshare_directory_result = {
  shared_directory_id: string option
}

type unshare_directory_request = {
  unshare_target: unshare_target;
  directory_id: string
}

type invalid_target_exception = {
  request_id: string option;
  message: string option
}

type directory_not_shared_exception = {
  request_id: string option;
  message: string option
}

type trust_type = | EXTERNAL
  | FOREST

type trust_direction = | TWO_WAY
  | ONE_WAY_INCOMING
  | ONE_WAY_OUTGOING

type trust_state = | FAILED
  | DELETED
  | DELETING
  | UPDATED
  | UPDATE_FAILED
  | UPDATING
  | VERIFIED
  | VERIFY_FAILED
  | VERIFYING
  | CREATED
  | CREATING

type trust = {
  selective_auth: selective_auth option;
  trust_state_reason: string option;
  state_last_updated_date_time: float option;
  last_updated_date_time: float option;
  created_date_time: float option;
  trust_state: trust_state option;
  trust_direction: trust_direction option;
  trust_type: trust_type option;
  remote_domain_name: string option;
  trust_id: string option;
  directory_id: string option
}

type topic_status = | DELETED
  | FAILED
  | TOPIC_NOT_FOUND
  | REGISTERED

type tag = {
  value: string;
  key: string
}

type tag_limit_exceeded_exception = {
  request_id: string option;
  message: string option
}

type start_schema_extension_result = {
  schema_extension_id: string option
}

type start_schema_extension_request = {
  description: string;
  ldif_content: string;
  create_snapshot_before_schema_extension: bool;
  directory_id: string
}

type snapshot_type = | MANUAL
  | AUTO

type snapshot_status = | FAILED
  | COMPLETED
  | CREATING

type snapshot = {
  start_time: float option;
  status: snapshot_status option;
  name: string option;
  type_: snapshot_type option;
  snapshot_id: string option;
  directory_id: string option
}

type snapshot_limits = {
  manual_snapshots_limit_reached: bool option;
  manual_snapshots_current_count: int option;
  manual_snapshots_limit: int option
}

type share_method = | HANDSHAKE
  | ORGANIZATIONS

type share_status = | DELETING
  | DELETED
  | SHARE_FAILED
  | SHARING
  | REJECT_FAILED
  | REJECTING
  | REJECTED
  | PENDING_ACCEPTANCE
  | SHARED

type shared_directory = {
  last_updated_date_time: float option;
  created_date_time: float option;
  share_notes: string option;
  share_status: share_status option;
  shared_directory_id: string option;
  shared_account_id: string option;
  share_method: share_method option;
  owner_directory_id: string option;
  owner_account_id: string option
}

type share_target = {
  type_: target_type;
  id: string
}

type share_limit_exceeded_exception = {
  request_id: string option;
  message: string option
}

type share_directory_result = {
  shared_directory_id: string option
}

type share_directory_request = {
  share_method: share_method;
  share_target: share_target;
  share_notes: string option;
  directory_id: string
}

type organizations_exception = {
  request_id: string option;
  message: string option
}

type directory_already_shared_exception = {
  request_id: string option;
  message: string option
}

type directory_configuration_status = | DEFAULT
  | FAILED
  | UPDATED
  | UPDATING
  | REQUESTED

type setting_entry = {
  data_type: string option;
  last_requested_date_time: float option;
  last_updated_date_time: float option;
  request_status_message: string option;
  request_detailed_status: (string * directory_configuration_status) list option;
  request_status: directory_configuration_status option;
  requested_value: string option;
  applied_value: string option;
  allowed_values: string option;
  name: string option;
  type_: string option
}

type schema_extension_status = | COMPLETED
  | FAILED
  | CANCELLED
  | ROLLBACK_IN_PROGRESS
  | CANCEL_IN_PROGRESS
  | REPLICATING
  | UPDATING_SCHEMA
  | CREATING_SNAPSHOT
  | INITIALIZING

type schema_extension_info = {
  end_date_time: float option;
  start_date_time: float option;
  schema_extension_status_reason: string option;
  schema_extension_status: schema_extension_status option;
  description: string option;
  schema_extension_id: string option;
  directory_id: string option
}

type restore_from_snapshot_result = unit

type restore_from_snapshot_request = {
  snapshot_id: string
}

type reset_user_password_result = unit

type reset_user_password_request = {
  new_password: string;
  user_name: string;
  directory_id: string
}

type invalid_password_exception = {
  request_id: string option;
  message: string option
}

type replication_scope = | Domain

type remove_tags_from_resource_result = unit

type remove_tags_from_resource_request = {
  tag_keys: string list;
  resource_id: string
}

type remove_region_result = unit

type remove_region_request = {
  directory_id: string
}

type remove_ip_routes_result = unit

type remove_ip_routes_request = {
  cidr_ips: string list;
  directory_id: string
}

type reject_shared_directory_result = {
  shared_directory_id: string option
}

type reject_shared_directory_request = {
  shared_directory_id: string
}

type register_event_topic_result = unit

type register_event_topic_request = {
  topic_name: string;
  directory_id: string
}

type register_certificate_result = {
  certificate_id: string option
}

type certificate_type = | CLIENT_LDAPS
  | CLIENT_CERT_AUTH

type client_cert_auth_settings = {
  ocsp_url: string option
}

type register_certificate_request = {
  client_cert_auth_settings: client_cert_auth_settings option;
  type_: certificate_type option;
  certificate_data: string;
  directory_id: string
}

type invalid_certificate_exception = {
  request_id: string option;
  message: string option
}

type certificate_limit_exceeded_exception = {
  request_id: string option;
  message: string option
}

type certificate_already_exists_exception = {
  request_id: string option;
  message: string option
}

type regions_info = {
  additional_regions: string list option;
  primary_region: string option
}

type region_type = | ADDITIONAL
  | PRIMARY

type directory_stage = | FAILED
  | DELETED
  | DELETING
  | RESTOREFAILED
  | RESTORING
  | IMPAIRED
  | INOPERABLE
  | ACTIVE
  | CREATED
  | CREATING
  | REQUESTED

type directory_vpc_settings = {
  subnet_ids: string list;
  vpc_id: string
}

type region_description = {
  last_updated_date_time: float option;
  status_last_updated_date_time: float option;
  launch_time: float option;
  desired_number_of_domain_controllers: int option;
  vpc_settings: directory_vpc_settings option;
  status: directory_stage option;
  region_type: region_type option;
  region_name: string option;
  directory_id: string option
}

type region_limit_exceeded_exception = {
  request_id: string option;
  message: string option
}

type radius_status = | FAILED
  | COMPLETED
  | CREATING

type directory_vpc_settings_description = {
  availability_zones: string list option;
  security_group_id: string option;
  subnet_ids: string list option;
  vpc_id: string option
}

type owner_directory_description = {
  radius_status: radius_status option;
  radius_settings: radius_settings option;
  vpc_settings: directory_vpc_settings_description option;
  dns_ip_addrs: string list option;
  account_id: string option;
  directory_id: string option
}

type no_available_certificate_exception = {
  request_id: string option;
  message: string option
}

type log_subscription = {
  subscription_created_date_time: float option;
  log_group_name: string option;
  directory_id: string option
}

type list_tags_for_resource_result = {
  next_token: string option;
  tags: tag list option
}

type list_tags_for_resource_request = {
  limit: int option;
  next_token: string option;
  resource_id: string
}

type invalid_next_token_exception = {
  request_id: string option;
  message: string option
}

type list_schema_extensions_result = {
  next_token: string option;
  schema_extensions_info: schema_extension_info list option
}

type list_schema_extensions_request = {
  limit: int option;
  next_token: string option;
  directory_id: string
}

type list_log_subscriptions_result = {
  next_token: string option;
  log_subscriptions: log_subscription list option
}

type list_log_subscriptions_request = {
  limit: int option;
  next_token: string option;
  directory_id: string option
}

type ip_route_status_msg = | REMOVE_FAILED
  | ADD_FAILED
  | REMOVED
  | REMOVING
  | ADDED
  | ADDING

type ip_route_info = {
  description: string option;
  ip_route_status_reason: string option;
  added_date_time: float option;
  ip_route_status_msg: ip_route_status_msg option;
  cidr_ip: string option;
  directory_id: string option
}

type list_ip_routes_result = {
  next_token: string option;
  ip_routes_info: ip_route_info list option
}

type list_ip_routes_request = {
  limit: int option;
  next_token: string option;
  directory_id: string
}

type certificate_state = | DEREGISTER_FAILED
  | DEREGISTERED
  | DEREGISTERING
  | REGISTER_FAILED
  | REGISTERED
  | REGISTERING

type certificate_info = {
  type_: certificate_type option;
  expiry_date_time: float option;
  state: certificate_state option;
  common_name: string option;
  certificate_id: string option
}

type list_certificates_result = {
  certificates_info: certificate_info list option;
  next_token: string option
}

type list_certificates_request = {
  limit: int option;
  next_token: string option;
  directory_id: string
}

type ldaps_type = | CLIENT

type ldaps_status = | DISABLED
  | ENABLE_FAILED
  | ENABLED
  | ENABLING

type ldaps_setting_info = {
  last_updated_date_time: float option;
  ldaps_status_reason: string option;
  ldaps_status: ldaps_status option
}

type ip_route = {
  description: string option;
  cidr_ip: string option
}

type ip_route_limit_exceeded_exception = {
  request_id: string option;
  message: string option
}

type invalid_ldaps_status_exception = {
  request_id: string option;
  message: string option
}

type invalid_client_auth_status_exception = {
  request_id: string option;
  message: string option
}

type insufficient_permissions_exception = {
  request_id: string option;
  message: string option
}

type get_snapshot_limits_result = {
  snapshot_limits: snapshot_limits option
}

type get_snapshot_limits_request = {
  directory_id: string
}

type directory_limits = {
  connected_directories_limit_reached: bool option;
  connected_directories_current_count: int option;
  connected_directories_limit: int option;
  cloud_only_microsoft_ad_limit_reached: bool option;
  cloud_only_microsoft_ad_current_count: int option;
  cloud_only_microsoft_ad_limit: int option;
  cloud_only_directories_limit_reached: bool option;
  cloud_only_directories_current_count: int option;
  cloud_only_directories_limit: int option
}

type get_directory_limits_result = {
  directory_limits: directory_limits option
}

type get_directory_limits_request = unit

type event_topic = {
  status: topic_status option;
  created_date_time: float option;
  topic_arn: string option;
  topic_name: string option;
  directory_id: string option
}

type entity_already_exists_exception = {
  request_id: string option;
  message: string option
}

type enable_sso_result = unit

type enable_sso_request = {
  password: string option;
  user_name: string option;
  directory_id: string
}

type authentication_failed_exception = {
  request_id: string option;
  message: string option
}

type enable_radius_result = unit

type enable_radius_request = {
  radius_settings: radius_settings;
  directory_id: string
}

type enable_ldaps_result = unit

type enable_ldaps_request = {
  type_: ldaps_type;
  directory_id: string
}

type enable_client_authentication_result = unit

type client_authentication_type = | SMART_CARD_OR_PASSWORD
  | SMART_CARD

type enable_client_authentication_request = {
  type_: client_authentication_type;
  directory_id: string
}

type domain_controller_status = | FAILED
  | DELETED
  | DELETING
  | RESTORING
  | IMPAIRED
  | ACTIVE
  | CREATING

type domain_controller = {
  status_last_updated_date_time: float option;
  launch_time: float option;
  status_reason: string option;
  status: domain_controller_status option;
  availability_zone: string option;
  subnet_id: string option;
  vpc_id: string option;
  dns_ip_addr: string option;
  domain_controller_id: string option;
  directory_id: string option
}

type disable_sso_result = unit

type disable_sso_request = {
  password: string option;
  user_name: string option;
  directory_id: string
}

type disable_radius_result = unit

type disable_radius_request = {
  directory_id: string
}

type disable_ldaps_result = unit

type disable_ldaps_request = {
  type_: ldaps_type;
  directory_id: string
}

type disable_client_authentication_result = unit

type disable_client_authentication_request = {
  type_: client_authentication_type;
  directory_id: string
}

type directory_type = | SHARED_MICROSOFT_AD
  | MICROSOFT_AD
  | AD_CONNECTOR
  | SIMPLE_AD

type directory_size = | LARGE
  | SMALL

type describe_update_directory_result = {
  next_token: string option;
  update_activities: update_info_entry list option
}

type describe_update_directory_request = {
  next_token: string option;
  region_name: string option;
  update_type: update_type;
  directory_id: string
}

type describe_trusts_result = {
  next_token: string option;
  trusts: trust list option
}

type describe_trusts_request = {
  limit: int option;
  next_token: string option;
  trust_ids: string list option;
  directory_id: string option
}

type describe_snapshots_result = {
  next_token: string option;
  snapshots: snapshot list option
}

type describe_snapshots_request = {
  limit: int option;
  next_token: string option;
  snapshot_ids: string list option;
  directory_id: string option
}

type describe_shared_directories_result = {
  next_token: string option;
  shared_directories: shared_directory list option
}

type describe_shared_directories_request = {
  limit: int option;
  next_token: string option;
  shared_directory_ids: string list option;
  owner_directory_id: string
}

type describe_settings_result = {
  next_token: string option;
  setting_entries: setting_entry list option;
  directory_id: string option
}

type describe_settings_request = {
  next_token: string option;
  status: directory_configuration_status option;
  directory_id: string
}

type describe_regions_result = {
  next_token: string option;
  regions_description: region_description list option
}

type describe_regions_request = {
  next_token: string option;
  region_name: string option;
  directory_id: string
}

type describe_ldaps_settings_result = {
  next_token: string option;
  ldaps_settings_info: ldaps_setting_info list option
}

type describe_ldaps_settings_request = {
  limit: int option;
  next_token: string option;
  type_: ldaps_type option;
  directory_id: string
}

type describe_event_topics_result = {
  event_topics: event_topic list option
}

type describe_event_topics_request = {
  topic_names: string list option;
  directory_id: string option
}

type describe_domain_controllers_result = {
  next_token: string option;
  domain_controllers: domain_controller list option
}

type describe_domain_controllers_request = {
  limit: int option;
  next_token: string option;
  domain_controller_ids: string list option;
  directory_id: string
}

type directory_edition = | STANDARD
  | ENTERPRISE

type directory_connect_settings_description = {
  connect_ips: string list option;
  availability_zones: string list option;
  security_group_id: string option;
  customer_user_name: string option;
  subnet_ids: string list option;
  vpc_id: string option
}

type directory_description = {
  os_version: os_version option;
  regions_info: regions_info option;
  owner_directory_description: owner_directory_description option;
  desired_number_of_domain_controllers: int option;
  sso_enabled: bool option;
  stage_reason: string option;
  radius_status: radius_status option;
  radius_settings: radius_settings option;
  connect_settings: directory_connect_settings_description option;
  vpc_settings: directory_vpc_settings_description option;
  type_: directory_type option;
  stage_last_updated_date_time: float option;
  launch_time: float option;
  share_notes: string option;
  share_method: share_method option;
  share_status: share_status option;
  stage: directory_stage option;
  dns_ip_addrs: string list option;
  description: string option;
  access_url: string option;
  alias: string option;
  edition: directory_edition option;
  size: directory_size option;
  short_name: string option;
  name: string option;
  directory_id: string option
}

type describe_directories_result = {
  next_token: string option;
  directory_descriptions: directory_description list option
}

type describe_directories_request = {
  limit: int option;
  next_token: string option;
  directory_ids: string list option
}

type conditional_forwarder = {
  replication_scope: replication_scope option;
  dns_ip_addrs: string list option;
  remote_domain_name: string option
}

type describe_conditional_forwarders_result = {
  conditional_forwarders: conditional_forwarder list option
}

type describe_conditional_forwarders_request = {
  remote_domain_names: string list option;
  directory_id: string
}

type client_authentication_status = | DISABLED
  | ENABLED

type client_authentication_setting_info = {
  last_updated_date_time: float option;
  status: client_authentication_status option;
  type_: client_authentication_type option
}

type describe_client_authentication_settings_result = {
  next_token: string option;
  client_authentication_settings_info: client_authentication_setting_info list option
}

type describe_client_authentication_settings_request = {
  limit: int option;
  next_token: string option;
  type_: client_authentication_type option;
  directory_id: string
}

type certificate_does_not_exist_exception = {
  request_id: string option;
  message: string option
}

type certificate = {
  client_cert_auth_settings: client_cert_auth_settings option;
  type_: certificate_type option;
  expiry_date_time: float option;
  registered_date_time: float option;
  common_name: string option;
  state_reason: string option;
  state: certificate_state option;
  certificate_id: string option
}

type describe_certificate_result = {
  certificate: certificate option
}

type describe_certificate_request = {
  certificate_id: string;
  directory_id: string
}

type deregister_event_topic_result = unit

type deregister_event_topic_request = {
  topic_name: string;
  directory_id: string
}

type certificate_in_use_exception = {
  request_id: string option;
  message: string option
}

type deregister_certificate_result = unit

type deregister_certificate_request = {
  certificate_id: string;
  directory_id: string
}

type delete_trust_result = {
  trust_id: string option
}

type delete_trust_request = {
  delete_associated_conditional_forwarder: bool option;
  trust_id: string
}

type delete_snapshot_result = {
  snapshot_id: string option
}

type delete_snapshot_request = {
  snapshot_id: string
}

type delete_log_subscription_result = unit

type delete_log_subscription_request = {
  directory_id: string
}

type delete_directory_result = {
  directory_id: string option
}

type delete_directory_request = {
  directory_id: string
}

type delete_conditional_forwarder_result = unit

type delete_conditional_forwarder_request = {
  remote_domain_name: string;
  directory_id: string
}

type create_trust_result = {
  trust_id: string option
}

type create_trust_request = {
  selective_auth: selective_auth option;
  conditional_forwarder_ip_addrs: string list option;
  trust_type: trust_type option;
  trust_direction: trust_direction;
  trust_password: string;
  remote_domain_name: string;
  directory_id: string
}

type create_snapshot_result = {
  snapshot_id: string option
}

type create_snapshot_request = {
  name: string option;
  directory_id: string
}

type directory_limit_exceeded_exception = {
  request_id: string option;
  message: string option
}

type create_microsoft_ad_result = {
  directory_id: string option
}

type create_microsoft_ad_request = {
  tags: tag list option;
  edition: directory_edition option;
  vpc_settings: directory_vpc_settings;
  description: string option;
  password: string;
  short_name: string option;
  name: string
}

type create_log_subscription_result = unit

type create_log_subscription_request = {
  log_group_name: string;
  directory_id: string
}

type create_directory_result = {
  directory_id: string option
}

type create_directory_request = {
  tags: tag list option;
  vpc_settings: directory_vpc_settings option;
  size: directory_size;
  description: string option;
  password: string;
  short_name: string option;
  name: string
}

type create_conditional_forwarder_result = unit

type create_conditional_forwarder_request = {
  dns_ip_addrs: string list;
  remote_domain_name: string;
  directory_id: string
}

type attribute = {
  value: string option;
  name: string option
}

type computer = {
  computer_attributes: attribute list option;
  computer_name: string option;
  computer_id: string option
}

type create_computer_result = {
  computer: computer option
}

type create_computer_request = {
  computer_attributes: attribute list option;
  organizational_unit_distinguished_name: string option;
  password: string;
  computer_name: string;
  directory_id: string
}

type create_alias_result = {
  alias: string option;
  directory_id: string option
}

type create_alias_request = {
  alias: string;
  directory_id: string
}

type connect_directory_result = {
  directory_id: string option
}

type directory_connect_settings = {
  customer_user_name: string;
  customer_dns_ips: string list;
  subnet_ids: string list;
  vpc_id: string
}

type connect_directory_request = {
  tags: tag list option;
  connect_settings: directory_connect_settings;
  size: directory_size;
  description: string option;
  password: string;
  short_name: string option;
  name: string
}

type cancel_schema_extension_result = unit

type cancel_schema_extension_request = {
  schema_extension_id: string;
  directory_id: string
}

type add_tags_to_resource_result = unit

type add_tags_to_resource_request = {
  tags: tag list;
  resource_id: string
}

type directory_already_in_region_exception = {
  request_id: string option;
  message: string option
}

type add_region_result = unit

type add_region_request = {
  vpc_settings: directory_vpc_settings;
  region_name: string;
  directory_id: string
}

type add_ip_routes_result = unit

type add_ip_routes_request = {
  update_security_group_for_directory_controllers: bool option;
  ip_routes: ip_route list;
  directory_id: string
}

type accept_shared_directory_result = {
  shared_directory: shared_directory option
}

type accept_shared_directory_request = {
  shared_directory_id: string
}



type base_document = Json.t

val make_verify_trust_result :
  ?trust_id:string -> unit
-> verify_trust_result

val make_verify_trust_request : trust_id:string -> unit
-> verify_trust_request

val make_os_update_settings : ?os_version:os_version -> unit
-> os_update_settings

val make_update_value : ?os_update_settings:os_update_settings -> unit
-> update_value

val make_update_trust_result : ?trust_id:string -> ?request_id:string -> unit
-> update_trust_result

val make_update_trust_request :
  ?selective_auth:selective_auth -> trust_id:string -> unit
-> update_trust_request

val make_update_settings_result : ?directory_id:string -> unit
-> update_settings_result

val make_setting : value:string -> name:string -> unit
-> setting

val make_update_settings_request :
  settings:setting list -> directory_id:string -> unit
-> update_settings_request

val make_update_radius_result : unit
-> update_radius_result

val make_radius_settings :
  ?use_same_username:bool ->
  ?display_label:string ->
  ?authentication_protocol:radius_authentication_protocol ->
  ?shared_secret:string ->
  ?radius_retries:int ->
  ?radius_timeout:int ->
  ?radius_port:int ->
  ?radius_servers:string list ->
  unit -> radius_settings

val make_update_radius_request :
  radius_settings:radius_settings -> directory_id:string -> unit
-> update_radius_request

val make_update_number_of_domain_controllers_result : unit
-> update_number_of_domain_controllers_result

val make_update_number_of_domain_controllers_request :
  desired_number:int -> directory_id:string -> unit
-> update_number_of_domain_controllers_request

val make_update_info_entry :
  ?last_updated_date_time:float ->
  ?start_time:float ->
  ?previous_value:update_value ->
  ?new_value:update_value ->
  ?initiated_by:string ->
  ?status_reason:string ->
  ?status:update_status ->
  ?region:string ->
  unit -> update_info_entry

val make_update_directory_setup_result : unit
-> update_directory_setup_result

val make_update_directory_setup_request :
  ?create_snapshot_before_update:bool ->
  ?os_update_settings:os_update_settings ->
  update_type:update_type ->
  directory_id:string ->
  unit
-> update_directory_setup_request

val make_update_conditional_forwarder_result : unit
-> update_conditional_forwarder_result

val make_update_conditional_forwarder_request :
  dns_ip_addrs:string list ->
  remote_domain_name:string ->
  directory_id:string ->
  unit -> update_conditional_forwarder_request

val make_unshare_target : type_:target_type -> id:string -> unit
-> unshare_target

val make_unshare_directory_result : ?shared_directory_id:string -> unit
-> unshare_directory_result

val make_unshare_directory_request :
  unshare_target:unshare_target -> directory_id:string -> unit
-> unshare_directory_request

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

val make_tag : value:string -> key:string -> unit
-> tag

val make_start_schema_extension_result : ?schema_extension_id:string -> unit
-> start_schema_extension_result

val make_start_schema_extension_request :
  description:string ->
  ldif_content:string ->
  create_snapshot_before_schema_extension:bool ->
  directory_id:string ->
  unit -> start_schema_extension_request

val make_snapshot :
  ?start_time:float ->
  ?status:snapshot_status ->
  ?name:string ->
  ?type_:snapshot_type ->
  ?snapshot_id:string ->
  ?directory_id:string ->
  unit -> snapshot

val make_snapshot_limits :
  ?manual_snapshots_limit_reached:bool ->
  ?manual_snapshots_current_count:int ->
  ?manual_snapshots_limit:int ->
  unit -> snapshot_limits

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
  unit -> shared_directory

val make_share_target : type_:target_type -> id:string -> unit
-> share_target

val make_share_directory_result : ?shared_directory_id:string -> unit
-> share_directory_result

val make_share_directory_request :
  ?share_notes:string ->
  share_method:share_method ->
  share_target:share_target ->
  directory_id:string ->
  unit -> share_directory_request

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
  unit -> setting_entry

val make_schema_extension_info :
  ?end_date_time:float ->
  ?start_date_time:float ->
  ?schema_extension_status_reason:string ->
  ?schema_extension_status:schema_extension_status ->
  ?description:string ->
  ?schema_extension_id:string ->
  ?directory_id:string ->
  unit -> schema_extension_info

val make_restore_from_snapshot_result : unit
-> restore_from_snapshot_result

val make_restore_from_snapshot_request : snapshot_id:string -> unit
-> restore_from_snapshot_request

val make_reset_user_password_result : unit
-> reset_user_password_result

val make_reset_user_password_request :
  new_password:string -> user_name:string -> directory_id:string -> unit
-> reset_user_password_request

val make_remove_tags_from_resource_result : unit
-> remove_tags_from_resource_result

val make_remove_tags_from_resource_request :
  tag_keys:string list -> resource_id:string -> unit
-> remove_tags_from_resource_request

val make_remove_region_result : unit
-> remove_region_result

val make_remove_region_request : directory_id:string -> unit
-> remove_region_request

val make_remove_ip_routes_result : unit
-> remove_ip_routes_result

val make_remove_ip_routes_request :
  cidr_ips:string list -> directory_id:string -> unit
-> remove_ip_routes_request

val make_reject_shared_directory_result : ?shared_directory_id:string -> unit
-> reject_shared_directory_result

val make_reject_shared_directory_request : shared_directory_id:string -> unit
-> reject_shared_directory_request

val make_register_event_topic_result : unit
-> register_event_topic_result

val make_register_event_topic_request :
  topic_name:string -> directory_id:string -> unit
-> register_event_topic_request

val make_register_certificate_result : ?certificate_id:string -> unit
-> register_certificate_result

val make_client_cert_auth_settings : ?ocsp_url:string -> unit
-> client_cert_auth_settings

val make_register_certificate_request :
  ?client_cert_auth_settings:client_cert_auth_settings ->
  ?type_:certificate_type ->
  certificate_data:string ->
  directory_id:string ->
  unit -> register_certificate_request

val make_regions_info :
  ?additional_regions:string list -> ?primary_region:string -> unit
-> regions_info

val make_directory_vpc_settings :
  subnet_ids:string list -> vpc_id:string -> unit
-> directory_vpc_settings

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
  unit -> region_description

val make_directory_vpc_settings_description :
  ?availability_zones:string list ->
  ?security_group_id:string ->
  ?subnet_ids:string list ->
  ?vpc_id:string ->
  unit
-> directory_vpc_settings_description

val make_owner_directory_description :
  ?radius_status:radius_status ->
  ?radius_settings:radius_settings ->
  ?vpc_settings:directory_vpc_settings_description ->
  ?dns_ip_addrs:string list ->
  ?account_id:string ->
  ?directory_id:string ->
  unit -> owner_directory_description

val make_log_subscription :
  ?subscription_created_date_time:float ->
  ?log_group_name:string ->
  ?directory_id:string ->
  unit -> log_subscription

val make_list_tags_for_resource_result :
  ?next_token:string -> ?tags:tag list -> unit
-> list_tags_for_resource_result

val make_list_tags_for_resource_request :
  ?limit:int -> ?next_token:string -> resource_id:string -> unit
-> list_tags_for_resource_request

val make_list_schema_extensions_result :
  ?next_token:string ->
  ?schema_extensions_info:schema_extension_info list ->
  unit
-> list_schema_extensions_result

val make_list_schema_extensions_request :
  ?limit:int -> ?next_token:string -> directory_id:string -> unit
-> list_schema_extensions_request

val make_list_log_subscriptions_result :
  ?next_token:string -> ?log_subscriptions:log_subscription list -> unit
-> list_log_subscriptions_result

val make_list_log_subscriptions_request :
  ?limit:int -> ?next_token:string -> ?directory_id:string -> unit
-> list_log_subscriptions_request

val make_ip_route_info :
  ?description:string ->
  ?ip_route_status_reason:string ->
  ?added_date_time:float ->
  ?ip_route_status_msg:ip_route_status_msg ->
  ?cidr_ip:string ->
  ?directory_id:string ->
  unit -> ip_route_info

val make_list_ip_routes_result :
  ?next_token:string -> ?ip_routes_info:ip_route_info list -> unit
-> list_ip_routes_result

val make_list_ip_routes_request :
  ?limit:int -> ?next_token:string -> directory_id:string -> unit
-> list_ip_routes_request

val make_certificate_info :
  ?type_:certificate_type ->
  ?expiry_date_time:float ->
  ?state:certificate_state ->
  ?common_name:string ->
  ?certificate_id:string ->
  unit -> certificate_info

val make_list_certificates_result :
  ?certificates_info:certificate_info list -> ?next_token:string -> unit
-> list_certificates_result

val make_list_certificates_request :
  ?limit:int -> ?next_token:string -> directory_id:string -> unit
-> list_certificates_request

val make_ldaps_setting_info :
  ?last_updated_date_time:float ->
  ?ldaps_status_reason:string ->
  ?ldaps_status:ldaps_status ->
  unit -> ldaps_setting_info

val make_ip_route : ?description:string -> ?cidr_ip:string -> unit
-> ip_route

val make_get_snapshot_limits_result :
  ?snapshot_limits:snapshot_limits -> unit
-> get_snapshot_limits_result

val make_get_snapshot_limits_request : directory_id:string -> unit
-> get_snapshot_limits_request

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
  unit -> directory_limits

val make_get_directory_limits_result :
  ?directory_limits:directory_limits -> unit
-> get_directory_limits_result

val make_get_directory_limits_request : unit
-> get_directory_limits_request

val make_event_topic :
  ?status:topic_status ->
  ?created_date_time:float ->
  ?topic_arn:string ->
  ?topic_name:string ->
  ?directory_id:string ->
  unit -> event_topic

val make_enable_sso_result : unit
-> enable_sso_result

val make_enable_sso_request :
  ?password:string -> ?user_name:string -> directory_id:string -> unit
-> enable_sso_request

val make_enable_radius_result : unit
-> enable_radius_result

val make_enable_radius_request :
  radius_settings:radius_settings -> directory_id:string -> unit
-> enable_radius_request

val make_enable_ldaps_result : unit
-> enable_ldaps_result

val make_enable_ldaps_request :
  type_:ldaps_type -> directory_id:string -> unit
-> enable_ldaps_request

val make_enable_client_authentication_result : unit
-> enable_client_authentication_result

val make_enable_client_authentication_request :
  type_:client_authentication_type -> directory_id:string -> unit
-> enable_client_authentication_request

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
  unit -> domain_controller

val make_disable_sso_result : unit
-> disable_sso_result

val make_disable_sso_request :
  ?password:string -> ?user_name:string -> directory_id:string -> unit
-> disable_sso_request

val make_disable_radius_result : unit
-> disable_radius_result

val make_disable_radius_request : directory_id:string -> unit
-> disable_radius_request

val make_disable_ldaps_result : unit
-> disable_ldaps_result

val make_disable_ldaps_request :
  type_:ldaps_type -> directory_id:string -> unit
-> disable_ldaps_request

val make_disable_client_authentication_result : unit
-> disable_client_authentication_result

val make_disable_client_authentication_request :
  type_:client_authentication_type -> directory_id:string -> unit
-> disable_client_authentication_request

val make_describe_update_directory_result :
  ?next_token:string -> ?update_activities:update_info_entry list -> unit
-> describe_update_directory_result

val make_describe_update_directory_request :
  ?next_token:string ->
  ?region_name:string ->
  update_type:update_type ->
  directory_id:string ->
  unit -> describe_update_directory_request

val make_describe_trusts_result :
  ?next_token:string -> ?trusts:trust list -> unit
-> describe_trusts_result

val make_describe_trusts_request :
  ?limit:int ->
  ?next_token:string ->
  ?trust_ids:string list ->
  ?directory_id:string ->
  unit -> describe_trusts_request

val make_describe_snapshots_result :
  ?next_token:string -> ?snapshots:snapshot list -> unit
-> describe_snapshots_result

val make_describe_snapshots_request :
  ?limit:int ->
  ?next_token:string ->
  ?snapshot_ids:string list ->
  ?directory_id:string ->
  unit
-> describe_snapshots_request

val make_describe_shared_directories_result :
  ?next_token:string -> ?shared_directories:shared_directory list -> unit
-> describe_shared_directories_result

val make_describe_shared_directories_request :
  ?limit:int ->
  ?next_token:string ->
  ?shared_directory_ids:string list ->
  owner_directory_id:string ->
  unit
-> describe_shared_directories_request

val make_describe_settings_result :
  ?next_token:string ->
  ?setting_entries:setting_entry list ->
  ?directory_id:string ->
  unit -> describe_settings_result

val make_describe_settings_request :
  ?next_token:string ->
  ?status:directory_configuration_status ->
  directory_id:string ->
  unit -> describe_settings_request

val make_describe_regions_result :
  ?next_token:string -> ?regions_description:region_description list -> unit
-> describe_regions_result

val make_describe_regions_request :
  ?next_token:string -> ?region_name:string -> directory_id:string -> unit
-> describe_regions_request

val make_describe_ldaps_settings_result :
  ?next_token:string -> ?ldaps_settings_info:ldaps_setting_info list -> unit
-> describe_ldaps_settings_result

val make_describe_ldaps_settings_request :
  ?limit:int ->
  ?next_token:string ->
  ?type_:ldaps_type ->
  directory_id:string ->
  unit
-> describe_ldaps_settings_request

val make_describe_event_topics_result :
  ?event_topics:event_topic list -> unit
-> describe_event_topics_result

val make_describe_event_topics_request :
  ?topic_names:string list -> ?directory_id:string -> unit
-> describe_event_topics_request

val make_describe_domain_controllers_result :
  ?next_token:string -> ?domain_controllers:domain_controller list -> unit
-> describe_domain_controllers_result

val make_describe_domain_controllers_request :
  ?limit:int ->
  ?next_token:string ->
  ?domain_controller_ids:string list ->
  directory_id:string ->
  unit
-> describe_domain_controllers_request

val make_directory_connect_settings_description :
  ?connect_ips:string list ->
  ?availability_zones:string list ->
  ?security_group_id:string ->
  ?customer_user_name:string ->
  ?subnet_ids:string list ->
  ?vpc_id:string ->
  unit
-> directory_connect_settings_description

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
  unit -> directory_description

val make_describe_directories_result :
  ?next_token:string ->
  ?directory_descriptions:directory_description list ->
  unit -> describe_directories_result

val make_describe_directories_request :
  ?limit:int -> ?next_token:string -> ?directory_ids:string list -> unit
-> describe_directories_request

val make_conditional_forwarder :
  ?replication_scope:replication_scope ->
  ?dns_ip_addrs:string list ->
  ?remote_domain_name:string ->
  unit
-> conditional_forwarder

val make_describe_conditional_forwarders_result :
  ?conditional_forwarders:conditional_forwarder list -> unit
-> describe_conditional_forwarders_result

val make_describe_conditional_forwarders_request :
  ?remote_domain_names:string list -> directory_id:string -> unit
-> describe_conditional_forwarders_request

val make_client_authentication_setting_info :
  ?last_updated_date_time:float ->
  ?status:client_authentication_status ->
  ?type_:client_authentication_type ->
  unit
-> client_authentication_setting_info

val make_describe_client_authentication_settings_result :
  ?next_token:string ->
  ?client_authentication_settings_info:client_authentication_setting_info list ->
  unit
-> describe_client_authentication_settings_result

val make_describe_client_authentication_settings_request :
  ?limit:int ->
  ?next_token:string ->
  ?type_:client_authentication_type ->
  directory_id:string ->
  unit
-> describe_client_authentication_settings_request

val make_certificate :
  ?client_cert_auth_settings:client_cert_auth_settings ->
  ?type_:certificate_type ->
  ?expiry_date_time:float ->
  ?registered_date_time:float ->
  ?common_name:string ->
  ?state_reason:string ->
  ?state:certificate_state ->
  ?certificate_id:string ->
  unit -> certificate

val make_describe_certificate_result : ?certificate:certificate -> unit
-> describe_certificate_result

val make_describe_certificate_request :
  certificate_id:string -> directory_id:string -> unit
-> describe_certificate_request

val make_deregister_event_topic_result : unit
-> deregister_event_topic_result

val make_deregister_event_topic_request :
  topic_name:string -> directory_id:string -> unit
-> deregister_event_topic_request

val make_deregister_certificate_result : unit
-> deregister_certificate_result

val make_deregister_certificate_request :
  certificate_id:string -> directory_id:string -> unit
-> deregister_certificate_request

val make_delete_trust_result : ?trust_id:string -> unit
-> delete_trust_result

val make_delete_trust_request :
  ?delete_associated_conditional_forwarder:bool -> trust_id:string -> unit
-> delete_trust_request

val make_delete_snapshot_result : ?snapshot_id:string -> unit
-> delete_snapshot_result

val make_delete_snapshot_request : snapshot_id:string -> unit
-> delete_snapshot_request

val make_delete_log_subscription_result : unit
-> delete_log_subscription_result

val make_delete_log_subscription_request : directory_id:string -> unit
-> delete_log_subscription_request

val make_delete_directory_result : ?directory_id:string -> unit
-> delete_directory_result

val make_delete_directory_request : directory_id:string -> unit
-> delete_directory_request

val make_delete_conditional_forwarder_result : unit
-> delete_conditional_forwarder_result

val make_delete_conditional_forwarder_request :
  remote_domain_name:string -> directory_id:string -> unit
-> delete_conditional_forwarder_request

val make_create_trust_result : ?trust_id:string -> unit
-> create_trust_result

val make_create_trust_request :
  ?selective_auth:selective_auth ->
  ?conditional_forwarder_ip_addrs:string list ->
  ?trust_type:trust_type ->
  trust_direction:trust_direction ->
  trust_password:string ->
  remote_domain_name:string ->
  directory_id:string ->
  unit -> create_trust_request

val make_create_snapshot_result : ?snapshot_id:string -> unit
-> create_snapshot_result

val make_create_snapshot_request :
  ?name:string -> directory_id:string -> unit
-> create_snapshot_request

val make_create_microsoft_ad_result : ?directory_id:string -> unit
-> create_microsoft_ad_result

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

val make_create_log_subscription_result : unit
-> create_log_subscription_result

val make_create_log_subscription_request :
  log_group_name:string -> directory_id:string -> unit
-> create_log_subscription_request

val make_create_directory_result : ?directory_id:string -> unit
-> create_directory_result

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

val make_create_conditional_forwarder_result : unit
-> create_conditional_forwarder_result

val make_create_conditional_forwarder_request :
  dns_ip_addrs:string list ->
  remote_domain_name:string ->
  directory_id:string ->
  unit -> create_conditional_forwarder_request

val make_attribute : ?value:string -> ?name:string -> unit
-> attribute

val make_computer :
  ?computer_attributes:attribute list ->
  ?computer_name:string ->
  ?computer_id:string ->
  unit -> computer

val make_create_computer_result : ?computer:computer -> unit
-> create_computer_result

val make_create_computer_request :
  ?computer_attributes:attribute list ->
  ?organizational_unit_distinguished_name:string ->
  password:string ->
  computer_name:string ->
  directory_id:string ->
  unit -> create_computer_request

val make_create_alias_result : ?alias:string -> ?directory_id:string -> unit
-> create_alias_result

val make_create_alias_request : alias:string -> directory_id:string -> unit
-> create_alias_request

val make_connect_directory_result : ?directory_id:string -> unit
-> connect_directory_result

val make_directory_connect_settings :
  customer_user_name:string ->
  customer_dns_ips:string list ->
  subnet_ids:string list ->
  vpc_id:string ->
  unit -> directory_connect_settings

val make_connect_directory_request :
  ?tags:tag list ->
  ?description:string ->
  ?short_name:string ->
  connect_settings:directory_connect_settings ->
  size:directory_size ->
  password:string ->
  name:string ->
  unit -> connect_directory_request

val make_cancel_schema_extension_result : unit
-> cancel_schema_extension_result

val make_cancel_schema_extension_request :
  schema_extension_id:string -> directory_id:string -> unit
-> cancel_schema_extension_request

val make_add_tags_to_resource_result : unit
-> add_tags_to_resource_result

val make_add_tags_to_resource_request :
  tags:tag list -> resource_id:string -> unit
-> add_tags_to_resource_request

val make_add_region_result : unit
-> add_region_result

val make_add_region_request :
  vpc_settings:directory_vpc_settings ->
  region_name:string ->
  directory_id:string ->
  unit -> add_region_request

val make_add_ip_routes_result : unit
-> add_ip_routes_result

val make_add_ip_routes_request :
  ?update_security_group_for_directory_controllers:bool ->
  ip_routes:ip_route list ->
  directory_id:string ->
  unit -> add_ip_routes_request

val make_accept_shared_directory_result :
  ?shared_directory:shared_directory -> unit
-> accept_shared_directory_result

val make_accept_shared_directory_request : shared_directory_id:string -> unit
-> accept_shared_directory_request

module VerifyTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      verify_trust_request ->
        (verify_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      update_trust_request ->
        (update_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module UpdateSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_settings_request ->
        (update_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `IncompatibleSettingsException of incompatible_settings_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            | `UnsupportedSettingsException of unsupported_settings_exception
            
        ]
      ) result
end

module UpdateRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      update_radius_request ->
        (update_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module UpdateNumberOfDomainControllers : sig
  val request :
    Smaws_Lib.Context.t ->
      update_number_of_domain_controllers_request ->
        (update_number_of_domain_controllers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `DomainControllerLimitExceededException of domain_controller_limit_exceeded_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateDirectorySetup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_directory_setup_request ->
        (update_directory_setup_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryInDesiredStateException of directory_in_desired_state_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      update_conditional_forwarder_request ->
        (update_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UnshareDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      unshare_directory_request ->
        (unshare_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryNotSharedException of directory_not_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidTargetException of invalid_target_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module StartSchemaExtension : sig
  val request :
    Smaws_Lib.Context.t ->
      start_schema_extension_request ->
        (start_schema_extension_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            
        ]
      ) result
end

module ShareDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      share_directory_request ->
        (share_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTargetException of invalid_target_exception
            | `OrganizationsException of organizations_exception
            | `ServiceException of service_exception
            | `ShareLimitExceededException of share_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module RestoreFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_from_snapshot_request ->
        (restore_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ResetUserPassword : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_user_password_request ->
        (reset_user_password_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidPasswordException of invalid_password_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            | `UserDoesNotExistException of user_does_not_exist_exception
            
        ]
      ) result
end

module RemoveTagsFromResource : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_resource_request ->
        (remove_tags_from_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RemoveRegion : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_region_request ->
        (remove_region_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module RemoveIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_ip_routes_request ->
        (remove_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RejectSharedDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      reject_shared_directory_request ->
        (reject_shared_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RegisterEventTopic : sig
  val request :
    Smaws_Lib.Context.t ->
      register_event_topic_request ->
        (register_event_topic_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RegisterCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      register_certificate_request ->
        (register_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateAlreadyExistsException of certificate_already_exists_exception
            | `CertificateLimitExceededException of certificate_limit_exceeded_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidCertificateException of invalid_certificate_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListSchemaExtensions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_schema_extensions_request ->
        (list_schema_extensions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListLogSubscriptions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_log_subscriptions_request ->
        (list_log_subscriptions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ip_routes_request ->
        (list_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_certificates_request ->
        (list_certificates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module GetSnapshotLimits : sig
  val request :
    Smaws_Lib.Context.t ->
      get_snapshot_limits_request ->
        (get_snapshot_limits_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module GetDirectoryLimits : sig
  val request :
    Smaws_Lib.Context.t ->
      get_directory_limits_request ->
        (get_directory_limits_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module EnableSso : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_sso_request ->
        (enable_sso_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module EnableRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_radius_request ->
        (enable_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module EnableLDAPS : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_ldaps_request ->
        (enable_ldaps_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoAvailableCertificateException of no_available_certificate_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module EnableClientAuthentication : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_client_authentication_request ->
        (enable_client_authentication_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
            | `NoAvailableCertificateException of no_available_certificate_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DisableSso : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_sso_request ->
        (disable_sso_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DisableRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_radius_request ->
        (disable_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DisableLDAPS : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_ldaps_request ->
        (disable_ldaps_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DisableClientAuthentication : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_client_authentication_request ->
        (disable_client_authentication_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeUpdateDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_update_directory_request ->
        (describe_update_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeTrusts : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_trusts_request ->
        (describe_trusts_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_snapshots_request ->
        (describe_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeSharedDirectories : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_shared_directories_request ->
        (describe_shared_directories_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_settings_request ->
        (describe_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeRegions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_regions_request ->
        (describe_regions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeLDAPSSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_ldaps_settings_request ->
        (describe_ldaps_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeEventTopics : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_topics_request ->
        (describe_event_topics_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeDomainControllers : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_domain_controllers_request ->
        (describe_domain_controllers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeDirectories : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_directories_request ->
        (describe_directories_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeConditionalForwarders : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conditional_forwarders_request ->
        (describe_conditional_forwarders_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeClientAuthenticationSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_client_authentication_settings_request ->
        (describe_client_authentication_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_certificate_request ->
        (describe_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateDoesNotExistException of certificate_does_not_exist_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeregisterEventTopic : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_event_topic_request ->
        (deregister_event_topic_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DeregisterCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_certificate_request ->
        (deregister_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateDoesNotExistException of certificate_does_not_exist_exception
            | `CertificateInUseException of certificate_in_use_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_trust_request ->
        (delete_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_snapshot_request ->
        (delete_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DeleteLogSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_log_subscription_request ->
        (delete_log_subscription_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_directory_request ->
        (delete_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DeleteConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_conditional_forwarder_request ->
        (delete_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      create_trust_request ->
        (create_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_snapshot_request ->
        (create_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            
        ]
      ) result
end

module CreateMicrosoftAD : sig
  val request :
    Smaws_Lib.Context.t ->
      create_microsoft_ad_request ->
        (create_microsoft_ad_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateLogSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      create_log_subscription_request ->
        (create_log_subscription_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      create_directory_request ->
        (create_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module CreateConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      create_conditional_forwarder_request ->
        (create_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateComputer : sig
  val request :
    Smaws_Lib.Context.t ->
      create_computer_request ->
        (create_computer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_alias_request ->
        (create_alias_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ConnectDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      connect_directory_request ->
        (connect_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module CancelSchemaExtension : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_schema_extension_request ->
        (cancel_schema_extension_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module AddTagsToResource : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_resource_request ->
        (add_tags_to_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `TagLimitExceededException of tag_limit_exceeded_exception
            
        ]
      ) result
end

module AddRegion : sig
  val request :
    Smaws_Lib.Context.t ->
      add_region_request ->
        (add_region_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryAlreadyInRegionException of directory_already_in_region_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `RegionLimitExceededException of region_limit_exceeded_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module AddIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      add_ip_routes_request ->
        (add_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `IpRouteLimitExceededException of ip_route_limit_exceeded_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module AcceptSharedDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      accept_shared_directory_request ->
        (accept_shared_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

