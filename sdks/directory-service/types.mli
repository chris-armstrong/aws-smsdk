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

