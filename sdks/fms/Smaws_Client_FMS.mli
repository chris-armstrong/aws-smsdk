open Smaws_Lib
val service : Service.descriptor

type violation_reason = | InvalidNetworkAclEntry
  | FirewallSubnetMissingVPCEndpoint
  | RouteHasOutOfScopeEndpoint
  | ResourceMissingDnsFirewall
  | BlackHoleRouteDetectedInFirewallSubnet
  | BlackHoleRouteDetected
  | InternetTrafficNotInspected
  | MissingTargetGateway
  | InvalidRouteConfiguration
  | TrafficInspectionCrossesAZBoundary
  | UnexpectedTargetGatewayRoutes
  | UnexpectedFirewallRoutes
  | FirewallSubnetMissingExpectedRoute
  | InternetGatewayMissingExpectedRoute
  | FirewallSubnetIsOutOfScope
  | NetworkFirewallPolicyModified
  | MissingExpectedRouteTable
  | MissingFirewallSubnetInAZ
  | MissingFirewall
  | FMSCreatedSecurityGroupEdited
  | SecurityGroupRedundant
  | SecurityGroupUnused
  | ResourceViolatesAuditSecurityGroup
  | ResourceMissingSecurityGroup
  | ResourceMissingWebaclOrShieldProtection
  | ResourceMissingShieldProtection
  | ResourceIncorrectWebAcl
  | ResourceMissingWebAcl
  | WebAclMissingRuleGroup

type partial_match = {
  target_violation_reasons: string list option;
  reference: string option
}

type remediation_action_type = | Modify
  | Remove

type security_group_rule_description = {
  to_port: int option;
  from_port: int option;
  protocol: string option;
  prefix_list_id: string option;
  ipv6_range: string option;
  ipv4_range: string option
}

type security_group_remediation_action = {
  is_default_action: bool option;
  remediation_result: security_group_rule_description option;
  description: string option;
  remediation_action_type: remediation_action_type option
}

type aws_vpc_security_group_violation = {
  possible_security_group_remediation_actions: security_group_remediation_action list option;
  partial_matches: partial_match list option;
  violation_target_description: string option;
  violation_target: string option
}

type aws_ec2_network_interface_violation = {
  violating_security_groups: string list option;
  violation_target: string option
}

type aws_ec2_instance_violation = {
  aws_ec2_network_interface_violations: aws_ec2_network_interface_violation list option;
  violation_target: string option
}

type network_firewall_missing_firewall_violation = {
  target_violation_reason: string option;
  availability_zone: string option;
  vp_c: string option;
  violation_target: string option
}

type network_firewall_missing_subnet_violation = {
  target_violation_reason: string option;
  availability_zone: string option;
  vp_c: string option;
  violation_target: string option
}

type network_firewall_missing_expected_rt_violation = {
  expected_route_table: string option;
  current_route_table: string option;
  availability_zone: string option;
  vp_c: string option;
  violation_target: string option
}

type stateless_rule_group = {
  priority: int option;
  resource_id: string option;
  rule_group_name: string option
}

type network_firewall_override_action = | DROP_TO_ALERT

type network_firewall_stateful_rule_group_override = {
  action: network_firewall_override_action option
}

type stateful_rule_group = {
  override: network_firewall_stateful_rule_group_override option;
  priority: int option;
  resource_id: string option;
  rule_group_name: string option
}

type rule_order = | DEFAULT_ACTION_ORDER
  | STRICT_ORDER

type stream_exception_policy = | FMS_IGNORE
  | REJECT
  | CONTINUE
  | DROP

type stateful_engine_options = {
  stream_exception_policy: stream_exception_policy option;
  rule_order: rule_order option
}

type network_firewall_policy_description = {
  stateful_engine_options: stateful_engine_options option;
  stateful_default_actions: string list option;
  stateful_rule_groups: stateful_rule_group list option;
  stateless_custom_actions: string list option;
  stateless_fragment_default_actions: string list option;
  stateless_default_actions: string list option;
  stateless_rule_groups: stateless_rule_group list option
}

type network_firewall_policy_modified_violation = {
  expected_policy_description: network_firewall_policy_description option;
  current_policy_description: network_firewall_policy_description option;
  violation_target: string option
}

type destination_type = | PrefixList
  | IPV6
  | IPV4

type target_type = | TransitGateway
  | EgressOnlyInternetGateway
  | VPCPeeringConnection
  | VPCEndpoint
  | NetworkInterface
  | NatGateway
  | LocalGateway
  | Instance
  | CarrierGateway
  | Gateway

type route = {
  target: string option;
  destination: string option;
  target_type: target_type option;
  destination_type: destination_type option
}

type expected_route = {
  route_table_id: string option;
  allowed_targets: string list option;
  contributing_subnets: string list option;
  ip_v6_cidr: string option;
  prefix_list_id: string option;
  ip_v4_cidr: string option
}

type network_firewall_internet_traffic_not_inspected_violation = {
  vpc_id: string option;
  actual_internet_gateway_routes: route list option;
  expected_internet_gateway_routes: expected_route list option;
  current_internet_gateway_route_table: string option;
  internet_gateway_id: string option;
  actual_firewall_subnet_routes: route list option;
  expected_firewall_subnet_routes: expected_route list option;
  firewall_subnet_id: string option;
  expected_firewall_endpoint: string option;
  current_firewall_subnet_route_table: string option;
  is_route_table_used_in_different_a_z: bool option;
  violating_routes: route list option;
  route_table_id: string option;
  subnet_availability_zone: string option;
  subnet_id: string option
}

type network_firewall_invalid_route_configuration_violation = {
  vpc_id: string option;
  actual_internet_gateway_routes: route list option;
  expected_internet_gateway_routes: expected_route list option;
  current_internet_gateway_route_table: string option;
  internet_gateway_id: string option;
  actual_firewall_subnet_routes: route list option;
  expected_firewall_subnet_routes: expected_route list option;
  actual_firewall_subnet_id: string option;
  expected_firewall_subnet_id: string option;
  actual_firewall_endpoint: string option;
  expected_firewall_endpoint: string option;
  current_firewall_subnet_route_table: string option;
  violating_route: route option;
  is_route_table_used_in_different_a_z: bool option;
  route_table_id: string option;
  affected_subnets: string list option
}

type network_firewall_black_hole_route_detected_violation = {
  violating_routes: route list option;
  vpc_id: string option;
  route_table_id: string option;
  violation_target: string option
}

type network_firewall_unexpected_firewall_routes_violation = {
  vpc_id: string option;
  firewall_endpoint: string option;
  route_table_id: string option;
  violating_routes: route list option;
  firewall_subnet_id: string option
}

type network_firewall_unexpected_gateway_routes_violation = {
  vpc_id: string option;
  route_table_id: string option;
  violating_routes: route list option;
  gateway_id: string option
}

type network_firewall_missing_expected_routes_violation = {
  vpc_id: string option;
  expected_routes: expected_route list option;
  violation_target: string option
}

type dns_rule_group_priority_conflict_violation = {
  unavailable_priorities: int list option;
  conflicting_policy_id: string option;
  conflicting_priority: int option;
  violation_target_description: string option;
  violation_target: string option
}

type dns_duplicate_rule_group_violation = {
  violation_target_description: string option;
  violation_target: string option
}

type dns_rule_group_limit_exceeded_violation = {
  number_of_rule_groups_already_associated: int option;
  violation_target_description: string option;
  violation_target: string option
}

type firewall_subnet_is_out_of_scope_violation = {
  vpc_endpoint_id: string option;
  subnet_availability_zone_id: string option;
  subnet_availability_zone: string option;
  vpc_id: string option;
  firewall_subnet_id: string option
}

type route_has_out_of_scope_endpoint_violation = {
  internet_gateway_routes: route list option;
  current_internet_gateway_route_table: string option;
  internet_gateway_id: string option;
  firewall_subnet_routes: route list option;
  firewall_subnet_id: string option;
  current_firewall_subnet_route_table: string option;
  subnet_availability_zone_id: string option;
  subnet_availability_zone: string option;
  violating_routes: route list option;
  route_table_id: string option;
  vpc_id: string option;
  subnet_id: string option
}

type third_party_firewall_missing_firewall_violation = {
  target_violation_reason: string option;
  availability_zone: string option;
  vp_c: string option;
  violation_target: string option
}

type third_party_firewall_missing_subnet_violation = {
  target_violation_reason: string option;
  availability_zone: string option;
  vp_c: string option;
  violation_target: string option
}

type third_party_firewall_missing_expected_route_table_violation = {
  expected_route_table: string option;
  current_route_table: string option;
  availability_zone: string option;
  vp_c: string option;
  violation_target: string option
}

type firewall_subnet_missing_vpc_endpoint_violation = {
  subnet_availability_zone_id: string option;
  subnet_availability_zone: string option;
  vpc_id: string option;
  firewall_subnet_id: string option
}

type network_acl_icmp_type_code = {
  type_: int option;
  code: int option
}

type network_acl_port_range = {
  to_: int option;
  from_: int option
}

type network_acl_rule_action = | DENY
  | ALLOW

type network_acl_entry = {
  egress: bool;
  rule_action: network_acl_rule_action;
  ipv6_cidr_block: string option;
  cidr_block: string option;
  port_range: network_acl_port_range option;
  protocol: string;
  icmp_type_code: network_acl_icmp_type_code option
}

type entry_type = | CustomEntry
  | FMSManagedLastEntry
  | FMSManagedFirstEntry

type entry_description = {
  entry_type: entry_type option;
  entry_rule_number: int option;
  entry_detail: network_acl_entry option
}

type entry_violation_reason = | EntryConflict
  | IncorrectEntryOrder
  | MissingExpectedEntry

type entry_violation = {
  entry_violation_reasons: entry_violation_reason list option;
  entries_with_conflicts: entry_description list option;
  entry_at_expected_evaluation_order: entry_description option;
  actual_evaluation_order: string option;
  expected_evaluation_order: string option;
  expected_entry: entry_description option
}

type invalid_network_acl_entries_violation = {
  entry_violations: entry_violation list option;
  current_associated_network_acl: string option;
  subnet_availability_zone: string option;
  subnet: string option;
  vpc: string option
}

type action_target = {
  description: string option;
  resource_id: string option
}

type ec2_create_route_action = {
  route_table_id: action_target;
  gateway_id: action_target option;
  vpc_endpoint_id: action_target option;
  destination_ipv6_cidr_block: string option;
  destination_prefix_list_id: string option;
  destination_cidr_block: string option;
  description: string option
}

type ec2_replace_route_action = {
  route_table_id: action_target;
  gateway_id: action_target option;
  destination_ipv6_cidr_block: string option;
  destination_prefix_list_id: string option;
  destination_cidr_block: string option;
  description: string option
}

type ec2_delete_route_action = {
  route_table_id: action_target;
  destination_ipv6_cidr_block: string option;
  destination_prefix_list_id: string option;
  destination_cidr_block: string option;
  description: string option
}

type ec2_copy_route_table_action = {
  route_table_id: action_target;
  vpc_id: action_target;
  description: string option
}

type ec2_replace_route_table_association_action = {
  route_table_id: action_target;
  association_id: action_target;
  description: string option
}

type ec2_associate_route_table_action = {
  gateway_id: action_target option;
  subnet_id: action_target option;
  route_table_id: action_target;
  description: string option
}

type ec2_create_route_table_action = {
  vpc_id: action_target;
  description: string option
}

type fms_policy_update_firewall_creation_config_action = {
  firewall_creation_config: string option;
  description: string option
}

type create_network_acl_action = {
  fms_can_remediate: bool option;
  vpc: action_target option;
  description: string option
}

type replace_network_acl_association_action = {
  fms_can_remediate: bool option;
  network_acl_id: action_target option;
  association_id: action_target option;
  description: string option
}

type create_network_acl_entries_action = {
  fms_can_remediate: bool option;
  network_acl_entries_to_be_created: entry_description list option;
  network_acl_id: action_target option;
  description: string option
}

type delete_network_acl_entries_action = {
  fms_can_remediate: bool option;
  network_acl_entries_to_be_deleted: entry_description list option;
  network_acl_id: action_target option;
  description: string option
}

type remediation_action = {
  delete_network_acl_entries_action: delete_network_acl_entries_action option;
  create_network_acl_entries_action: create_network_acl_entries_action option;
  replace_network_acl_association_action: replace_network_acl_association_action option;
  create_network_acl_action: create_network_acl_action option;
  fms_policy_update_firewall_creation_config_action: fms_policy_update_firewall_creation_config_action option;
  ec2_create_route_table_action: ec2_create_route_table_action option;
  ec2_associate_route_table_action: ec2_associate_route_table_action option;
  ec2_replace_route_table_association_action: ec2_replace_route_table_association_action option;
  ec2_copy_route_table_action: ec2_copy_route_table_action option;
  ec2_delete_route_action: ec2_delete_route_action option;
  ec2_replace_route_action: ec2_replace_route_action option;
  ec2_create_route_action: ec2_create_route_action option;
  description: string option
}

type remediation_action_with_order = {
  order: int option;
  remediation_action: remediation_action option
}

type possible_remediation_action = {
  is_default_action: bool option;
  ordered_remediation_actions: remediation_action_with_order list;
  description: string option
}

type possible_remediation_actions = {
  actions: possible_remediation_action list option;
  description: string option
}

type resource_violation = {
  possible_remediation_actions: possible_remediation_actions option;
  invalid_network_acl_entries_violation: invalid_network_acl_entries_violation option;
  firewall_subnet_missing_vpc_endpoint_violation: firewall_subnet_missing_vpc_endpoint_violation option;
  third_party_firewall_missing_expected_route_table_violation: third_party_firewall_missing_expected_route_table_violation option;
  third_party_firewall_missing_subnet_violation: third_party_firewall_missing_subnet_violation option;
  third_party_firewall_missing_firewall_violation: third_party_firewall_missing_firewall_violation option;
  route_has_out_of_scope_endpoint_violation: route_has_out_of_scope_endpoint_violation option;
  firewall_subnet_is_out_of_scope_violation: firewall_subnet_is_out_of_scope_violation option;
  dns_rule_group_limit_exceeded_violation: dns_rule_group_limit_exceeded_violation option;
  dns_duplicate_rule_group_violation: dns_duplicate_rule_group_violation option;
  dns_rule_group_priority_conflict_violation: dns_rule_group_priority_conflict_violation option;
  network_firewall_missing_expected_routes_violation: network_firewall_missing_expected_routes_violation option;
  network_firewall_unexpected_gateway_routes_violation: network_firewall_unexpected_gateway_routes_violation option;
  network_firewall_unexpected_firewall_routes_violation: network_firewall_unexpected_firewall_routes_violation option;
  network_firewall_black_hole_route_detected_violation: network_firewall_black_hole_route_detected_violation option;
  network_firewall_invalid_route_configuration_violation: network_firewall_invalid_route_configuration_violation option;
  network_firewall_internet_traffic_not_inspected_violation: network_firewall_internet_traffic_not_inspected_violation option;
  network_firewall_policy_modified_violation: network_firewall_policy_modified_violation option;
  network_firewall_missing_expected_rt_violation: network_firewall_missing_expected_rt_violation option;
  network_firewall_missing_subnet_violation: network_firewall_missing_subnet_violation option;
  network_firewall_missing_firewall_violation: network_firewall_missing_firewall_violation option;
  aws_ec2_instance_violation: aws_ec2_instance_violation option;
  aws_ec2_network_interface_violation: aws_ec2_network_interface_violation option;
  aws_vpc_security_group_violation: aws_vpc_security_group_violation option
}

type tag = {
  value: string;
  key: string
}

type violation_detail = {
  resource_description: string option;
  resource_tags: tag list option;
  resource_violations: resource_violation list;
  resource_type: string;
  resource_id: string;
  member_account: string;
  policy_id: string
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_arn: string
}

type resource_not_found_exception = {
  message: string option
}

type invalid_operation_exception = {
  message: string option
}

type invalid_input_exception = {
  message: string option
}

type internal_error_exception = {
  message: string option
}

type firewall_deployment_model = | DISTRIBUTED
  | CENTRALIZED

type third_party_firewall_policy = {
  firewall_deployment_model: firewall_deployment_model option
}

type third_party_firewall_firewall_policy = {
  firewall_policy_name: string option;
  firewall_policy_id: string option
}

type third_party_firewall_association_status = | NOT_EXIST
  | OFFBOARD_COMPLETE
  | OFFBOARDING
  | ONBOARD_COMPLETE
  | ONBOARDING

type third_party_firewall = | FORTIGATE_CLOUD_NATIVE_FIREWALL
  | PALO_ALTO_NETWORKS_CLOUD_NGFW

type tag_resource_response = unit

type tag_resource_request = {
  tag_list: tag list;
  resource_arn: string
}

type limit_exceeded_exception = {
  message: string option
}

type security_service_type = | NETWORK_ACL_COMMON
  | IMPORT_NETWORK_FIREWALL
  | THIRD_PARTY_FIREWALL
  | DNS_FIREWALL
  | NETWORK_FIREWALL
  | SECURITY_GROUPS_USAGE_AUDIT
  | SECURITY_GROUPS_CONTENT_AUDIT
  | SECURITY_GROUPS_COMMON
  | SHIELD_ADVANCED
  | WAFV2
  | WAF

type network_firewall_policy = {
  firewall_deployment_model: firewall_deployment_model option
}

type network_acl_entry_set = {
  force_remediate_for_last_entries: bool;
  last_entries: network_acl_entry list option;
  force_remediate_for_first_entries: bool;
  first_entries: network_acl_entry list option
}

type network_acl_common_policy = {
  network_acl_entry_set: network_acl_entry_set
}

type policy_option = {
  network_acl_common_policy: network_acl_common_policy option;
  third_party_firewall_policy: third_party_firewall_policy option;
  network_firewall_policy: network_firewall_policy option
}

type security_service_policy_data = {
  policy_option: policy_option option;
  managed_service_data: string option;
  type_: security_service_type
}

type resource_tag = {
  value: string option;
  key: string
}

type resource_set_status = | OUT_OF_ADMIN_SCOPE
  | ACTIVE

type resource_set_summary = {
  resource_set_status: resource_set_status option;
  last_update_time: float option;
  description: string option;
  name: string option;
  id: string option
}

type resource_set = {
  resource_set_status: resource_set_status option;
  last_update_time: float option;
  resource_type_list: string list;
  update_token: string option;
  description: string option;
  name: string;
  id: string option
}

type resource = {
  account_id: string option;
  ur_i: string
}

type region_scope = {
  all_regions_enabled: bool option;
  regions: string list option
}

type put_resource_set_response = {
  resource_set_arn: string;
  resource_set: resource_set
}

type put_resource_set_request = {
  tag_list: tag list option;
  resource_set: resource_set
}

type protocols_list_data = {
  previous_protocols_list: (string * string list) list option;
  protocols_list: string list;
  last_update_time: float option;
  create_time: float option;
  list_update_token: string option;
  list_name: string;
  list_id: string option
}

type put_protocols_list_response = {
  protocols_list_arn: string option;
  protocols_list: protocols_list_data option
}

type put_protocols_list_request = {
  tag_list: tag list option;
  protocols_list: protocols_list_data
}

type customer_policy_scope_id_type = | ORG_UNIT
  | ACCOUNT

type customer_policy_status = | OUT_OF_ADMIN_SCOPE
  | ACTIVE

type policy = {
  policy_status: customer_policy_status option;
  policy_description: string option;
  resource_set_ids: string list option;
  exclude_map: (string * string list) list option;
  include_map: (string * string list) list option;
  delete_unused_fm_managed_resources: bool option;
  remediation_enabled: bool;
  exclude_resource_tags: bool;
  resource_tags: resource_tag list option;
  resource_type_list: string list option;
  resource_type: string;
  security_service_policy_data: security_service_policy_data;
  policy_update_token: string option;
  policy_name: string;
  policy_id: string option
}

type put_policy_response = {
  policy_arn: string option;
  policy: policy option
}

type put_policy_request = {
  tag_list: tag list option;
  policy: policy
}

type invalid_type_exception = {
  message: string option
}

type put_notification_channel_request = {
  sns_role_name: string;
  sns_topic_arn: string
}

type app = {
  port: int;
  protocol: string;
  app_name: string
}

type apps_list_data = {
  previous_apps_list: (string * app list) list option;
  apps_list: app list;
  last_update_time: float option;
  create_time: float option;
  list_update_token: string option;
  list_name: string;
  list_id: string option
}

type put_apps_list_response = {
  apps_list_arn: string option;
  apps_list: apps_list_data option
}

type put_apps_list_request = {
  tag_list: tag list option;
  apps_list: apps_list_data
}

type account_scope = {
  exclude_specified_accounts: bool option;
  all_accounts_enabled: bool option;
  accounts: string list option
}

type organizational_unit_scope = {
  exclude_specified_organizational_units: bool option;
  all_organizational_units_enabled: bool option;
  organizational_units: string list option
}

type policy_type_scope = {
  all_policy_types_enabled: bool option;
  policy_types: security_service_type list option
}

type admin_scope = {
  policy_type_scope: policy_type_scope option;
  region_scope: region_scope option;
  organizational_unit_scope: organizational_unit_scope option;
  account_scope: account_scope option
}

type put_admin_account_request = {
  admin_scope: admin_scope option;
  admin_account: string
}

type protocols_list_data_summary = {
  protocols_list: string list option;
  list_name: string option;
  list_id: string option;
  list_arn: string option
}

type policy_summary = {
  policy_status: customer_policy_status option;
  delete_unused_fm_managed_resources: bool option;
  remediation_enabled: bool option;
  security_service_type: security_service_type option;
  resource_type: string option;
  policy_name: string option;
  policy_id: string option;
  policy_arn: string option
}

type policy_compliance_status_type = | NonCompliant
  | Compliant

type evaluation_result = {
  evaluation_limit_exceeded: bool option;
  violator_count: int option;
  compliance_status: policy_compliance_status_type option
}

type dependent_service_name = | AWSVirtualPrivateCloud
  | AWSShieldAdvanced
  | AWSWAF
  | AWSConfig

type policy_compliance_status = {
  issue_info_map: (string * string) list option;
  last_updated: float option;
  evaluation_results: evaluation_result list option;
  member_account: string option;
  policy_name: string option;
  policy_id: string option;
  policy_owner: string option
}

type compliance_violator = {
  metadata: (string * string) list option;
  resource_type: string option;
  violation_reason: violation_reason option;
  resource_id: string option
}

type policy_compliance_detail = {
  issue_info_map: (string * string) list option;
  expired_at: float option;
  evaluation_limit_exceeded: bool option;
  violators: compliance_violator list option;
  member_account: string option;
  policy_id: string option;
  policy_owner: string option
}

type organization_status = | OffboardingComplete
  | Offboarding
  | OnboardingComplete
  | Onboarding

type marketplace_subscription_onboarding_status = | COMPLETE
  | NOT_COMPLETE
  | NO_SUBSCRIPTION

type list_third_party_firewall_firewall_policies_response = {
  next_token: string option;
  third_party_firewall_firewall_policies: third_party_firewall_firewall_policy list option
}

type list_third_party_firewall_firewall_policies_request = {
  max_results: int;
  next_token: string option;
  third_party_firewall: third_party_firewall
}

type list_tags_for_resource_response = {
  tag_list: tag list option
}

type list_tags_for_resource_request = {
  resource_arn: string
}

type list_resource_sets_response = {
  next_token: string option;
  resource_sets: resource_set_summary list option
}

type list_resource_sets_request = {
  max_results: int option;
  next_token: string option
}

type list_resource_set_resources_response = {
  next_token: string option;
  items: resource list
}

type list_resource_set_resources_request = {
  next_token: string option;
  max_results: int option;
  identifier: string
}

type list_protocols_lists_response = {
  next_token: string option;
  protocols_lists: protocols_list_data_summary list option
}

type list_protocols_lists_request = {
  max_results: int;
  next_token: string option;
  default_lists: bool option
}

type list_policies_response = {
  next_token: string option;
  policy_list: policy_summary list option
}

type list_policies_request = {
  max_results: int option;
  next_token: string option
}

type list_member_accounts_response = {
  next_token: string option;
  member_accounts: string list option
}

type list_member_accounts_request = {
  max_results: int option;
  next_token: string option
}

type discovered_resource = {
  name: string option;
  type_: string option;
  account_id: string option;
  ur_i: string option
}

type list_discovered_resources_response = {
  next_token: string option;
  items: discovered_resource list option
}

type list_discovered_resources_request = {
  next_token: string option;
  max_results: int option;
  resource_type: string;
  member_account_ids: string list
}

type list_compliance_status_response = {
  next_token: string option;
  policy_compliance_status_list: policy_compliance_status list option
}

type list_compliance_status_request = {
  max_results: int option;
  next_token: string option;
  policy_id: string
}

type apps_list_data_summary = {
  apps_list: app list option;
  list_name: string option;
  list_id: string option;
  list_arn: string option
}

type list_apps_lists_response = {
  next_token: string option;
  apps_lists: apps_list_data_summary list option
}

type list_apps_lists_request = {
  max_results: int;
  next_token: string option;
  default_lists: bool option
}

type list_admins_managing_account_response = {
  next_token: string option;
  admin_accounts: string list option
}

type list_admins_managing_account_request = {
  max_results: int option;
  next_token: string option
}

type admin_account_summary = {
  status: organization_status option;
  default_admin: bool option;
  admin_account: string option
}

type list_admin_accounts_for_organization_response = {
  next_token: string option;
  admin_accounts: admin_account_summary list option
}

type list_admin_accounts_for_organization_request = {
  max_results: int option;
  next_token: string option
}

type get_violation_details_response = {
  violation_detail: violation_detail option
}

type get_violation_details_request = {
  resource_type: string;
  resource_id: string;
  member_account: string;
  policy_id: string
}

type get_third_party_firewall_association_status_response = {
  marketplace_onboarding_status: marketplace_subscription_onboarding_status option;
  third_party_firewall_status: third_party_firewall_association_status option
}

type get_third_party_firewall_association_status_request = {
  third_party_firewall: third_party_firewall
}

type get_resource_set_response = {
  resource_set_arn: string;
  resource_set: resource_set
}

type get_resource_set_request = {
  identifier: string
}

type get_protocols_list_response = {
  protocols_list_arn: string option;
  protocols_list: protocols_list_data option
}

type get_protocols_list_request = {
  default_list: bool option;
  list_id: string
}

type get_protection_status_response = {
  next_token: string option;
  data: string option;
  service_type: security_service_type option;
  admin_account_id: string option
}

type get_protection_status_request = {
  max_results: int option;
  next_token: string option;
  end_time: float option;
  start_time: float option;
  member_account_id: string option;
  policy_id: string
}

type get_policy_response = {
  policy_arn: string option;
  policy: policy option
}

type get_policy_request = {
  policy_id: string
}

type get_notification_channel_response = {
  sns_role_name: string option;
  sns_topic_arn: string option
}

type get_notification_channel_request = unit

type get_compliance_detail_response = {
  policy_compliance_detail: policy_compliance_detail option
}

type get_compliance_detail_request = {
  member_account: string;
  policy_id: string
}

type get_apps_list_response = {
  apps_list_arn: string option;
  apps_list: apps_list_data option
}

type get_apps_list_request = {
  default_list: bool option;
  list_id: string
}

type get_admin_scope_response = {
  status: organization_status option;
  admin_scope: admin_scope option
}

type get_admin_scope_request = {
  admin_account: string
}

type account_role_status = | Deleted
  | Deleting
  | PendingDeletion
  | Creating
  | Ready

type get_admin_account_response = {
  role_status: account_role_status option;
  admin_account: string option
}

type get_admin_account_request = unit

type failed_item_reason = | NotValidAccountId
  | NotValidResourceType
  | NotValidService
  | NotValidRegion
  | NotValidPartition
  | NotValidArn

type failed_item = {
  reason: failed_item_reason option;
  ur_i: string option
}

type disassociate_third_party_firewall_response = {
  third_party_firewall_status: third_party_firewall_association_status option
}

type disassociate_third_party_firewall_request = {
  third_party_firewall: third_party_firewall
}

type disassociate_admin_account_request = unit

type delete_resource_set_request = {
  identifier: string
}

type delete_protocols_list_request = {
  list_id: string
}

type delete_policy_request = {
  delete_all_policy_resources: bool option;
  policy_id: string
}

type delete_notification_channel_request = unit

type delete_apps_list_request = {
  list_id: string
}

type batch_disassociate_resource_response = {
  failed_items: failed_item list;
  resource_set_identifier: string
}

type batch_disassociate_resource_request = {
  items: string list;
  resource_set_identifier: string
}

type batch_associate_resource_response = {
  failed_items: failed_item list;
  resource_set_identifier: string
}

type batch_associate_resource_request = {
  items: string list;
  resource_set_identifier: string
}

type associate_third_party_firewall_response = {
  third_party_firewall_status: third_party_firewall_association_status option
}

type associate_third_party_firewall_request = {
  third_party_firewall: third_party_firewall
}

type associate_admin_account_request = {
  admin_account: string
}



type base_document = Json.t

val make_partial_match :
  ?target_violation_reasons:string list -> ?reference:string -> unit
-> partial_match

val make_security_group_rule_description :
  ?to_port:int ->
  ?from_port:int ->
  ?protocol:string ->
  ?prefix_list_id:string ->
  ?ipv6_range:string ->
  ?ipv4_range:string ->
  unit
-> security_group_rule_description

val make_security_group_remediation_action :
  ?is_default_action:bool ->
  ?remediation_result:security_group_rule_description ->
  ?description:string ->
  ?remediation_action_type:remediation_action_type ->
  unit
-> security_group_remediation_action

val make_aws_vpc_security_group_violation :
  ?possible_security_group_remediation_actions:security_group_remediation_action list ->
  ?partial_matches:partial_match list ->
  ?violation_target_description:string ->
  ?violation_target:string ->
  unit
-> aws_vpc_security_group_violation

val make_aws_ec2_network_interface_violation :
  ?violating_security_groups:string list -> ?violation_target:string -> unit
-> aws_ec2_network_interface_violation

val make_aws_ec2_instance_violation :
  ?aws_ec2_network_interface_violations:aws_ec2_network_interface_violation list ->
  ?violation_target:string ->
  unit
-> aws_ec2_instance_violation

val make_network_firewall_missing_firewall_violation :
  ?target_violation_reason:string ->
  ?availability_zone:string ->
  ?vp_c:string ->
  ?violation_target:string ->
  unit
-> network_firewall_missing_firewall_violation

val make_network_firewall_missing_subnet_violation :
  ?target_violation_reason:string ->
  ?availability_zone:string ->
  ?vp_c:string ->
  ?violation_target:string ->
  unit
-> network_firewall_missing_subnet_violation

val make_network_firewall_missing_expected_rt_violation :
  ?expected_route_table:string ->
  ?current_route_table:string ->
  ?availability_zone:string ->
  ?vp_c:string ->
  ?violation_target:string ->
  unit
-> network_firewall_missing_expected_rt_violation

val make_stateless_rule_group :
  ?priority:int -> ?resource_id:string -> ?rule_group_name:string -> unit
-> stateless_rule_group

val make_network_firewall_stateful_rule_group_override :
  ?action:network_firewall_override_action -> unit
-> network_firewall_stateful_rule_group_override

val make_stateful_rule_group :
  ?override:network_firewall_stateful_rule_group_override ->
  ?priority:int ->
  ?resource_id:string ->
  ?rule_group_name:string ->
  unit -> stateful_rule_group

val make_stateful_engine_options :
  ?stream_exception_policy:stream_exception_policy ->
  ?rule_order:rule_order ->
  unit
-> stateful_engine_options

val make_network_firewall_policy_description :
  ?stateful_engine_options:stateful_engine_options ->
  ?stateful_default_actions:string list ->
  ?stateful_rule_groups:stateful_rule_group list ->
  ?stateless_custom_actions:string list ->
  ?stateless_fragment_default_actions:string list ->
  ?stateless_default_actions:string list ->
  ?stateless_rule_groups:stateless_rule_group list ->
  unit
-> network_firewall_policy_description

val make_network_firewall_policy_modified_violation :
  ?expected_policy_description:network_firewall_policy_description ->
  ?current_policy_description:network_firewall_policy_description ->
  ?violation_target:string ->
  unit -> network_firewall_policy_modified_violation

val make_route :
  ?target:string ->
  ?destination:string ->
  ?target_type:target_type ->
  ?destination_type:destination_type ->
  unit -> route

val make_expected_route :
  ?route_table_id:string ->
  ?allowed_targets:string list ->
  ?contributing_subnets:string list ->
  ?ip_v6_cidr:string ->
  ?prefix_list_id:string ->
  ?ip_v4_cidr:string ->
  unit
-> expected_route

val make_network_firewall_internet_traffic_not_inspected_violation :
  ?vpc_id:string ->
  ?actual_internet_gateway_routes:route list ->
  ?expected_internet_gateway_routes:expected_route list ->
  ?current_internet_gateway_route_table:string ->
  ?internet_gateway_id:string ->
  ?actual_firewall_subnet_routes:route list ->
  ?expected_firewall_subnet_routes:expected_route list ->
  ?firewall_subnet_id:string ->
  ?expected_firewall_endpoint:string ->
  ?current_firewall_subnet_route_table:string ->
  ?is_route_table_used_in_different_a_z:bool ->
  ?violating_routes:route list ->
  ?route_table_id:string ->
  ?subnet_availability_zone:string ->
  ?subnet_id:string ->
  unit
-> network_firewall_internet_traffic_not_inspected_violation

val make_network_firewall_invalid_route_configuration_violation :
  ?vpc_id:string ->
  ?actual_internet_gateway_routes:route list ->
  ?expected_internet_gateway_routes:expected_route list ->
  ?current_internet_gateway_route_table:string ->
  ?internet_gateway_id:string ->
  ?actual_firewall_subnet_routes:route list ->
  ?expected_firewall_subnet_routes:expected_route list ->
  ?actual_firewall_subnet_id:string ->
  ?expected_firewall_subnet_id:string ->
  ?actual_firewall_endpoint:string ->
  ?expected_firewall_endpoint:string ->
  ?current_firewall_subnet_route_table:string ->
  ?violating_route:route ->
  ?is_route_table_used_in_different_a_z:bool ->
  ?route_table_id:string ->
  ?affected_subnets:string list ->
  unit
-> network_firewall_invalid_route_configuration_violation

val make_network_firewall_black_hole_route_detected_violation :
  ?violating_routes:route list ->
  ?vpc_id:string ->
  ?route_table_id:string ->
  ?violation_target:string ->
  unit
-> network_firewall_black_hole_route_detected_violation

val make_network_firewall_unexpected_firewall_routes_violation :
  ?vpc_id:string ->
  ?firewall_endpoint:string ->
  ?route_table_id:string ->
  ?violating_routes:route list ->
  ?firewall_subnet_id:string ->
  unit
-> network_firewall_unexpected_firewall_routes_violation

val make_network_firewall_unexpected_gateway_routes_violation :
  ?vpc_id:string ->
  ?route_table_id:string ->
  ?violating_routes:route list ->
  ?gateway_id:string ->
  unit
-> network_firewall_unexpected_gateway_routes_violation

val make_network_firewall_missing_expected_routes_violation :
  ?vpc_id:string ->
  ?expected_routes:expected_route list ->
  ?violation_target:string ->
  unit
-> network_firewall_missing_expected_routes_violation

val make_dns_rule_group_priority_conflict_violation :
  ?unavailable_priorities:int list ->
  ?conflicting_policy_id:string ->
  ?conflicting_priority:int ->
  ?violation_target_description:string ->
  ?violation_target:string ->
  unit
-> dns_rule_group_priority_conflict_violation

val make_dns_duplicate_rule_group_violation :
  ?violation_target_description:string -> ?violation_target:string -> unit
-> dns_duplicate_rule_group_violation

val make_dns_rule_group_limit_exceeded_violation :
  ?number_of_rule_groups_already_associated:int ->
  ?violation_target_description:string ->
  ?violation_target:string ->
  unit
-> dns_rule_group_limit_exceeded_violation

val make_firewall_subnet_is_out_of_scope_violation :
  ?vpc_endpoint_id:string ->
  ?subnet_availability_zone_id:string ->
  ?subnet_availability_zone:string ->
  ?vpc_id:string ->
  ?firewall_subnet_id:string ->
  unit
-> firewall_subnet_is_out_of_scope_violation

val make_route_has_out_of_scope_endpoint_violation :
  ?internet_gateway_routes:route list ->
  ?current_internet_gateway_route_table:string ->
  ?internet_gateway_id:string ->
  ?firewall_subnet_routes:route list ->
  ?firewall_subnet_id:string ->
  ?current_firewall_subnet_route_table:string ->
  ?subnet_availability_zone_id:string ->
  ?subnet_availability_zone:string ->
  ?violating_routes:route list ->
  ?route_table_id:string ->
  ?vpc_id:string ->
  ?subnet_id:string ->
  unit
-> route_has_out_of_scope_endpoint_violation

val make_third_party_firewall_missing_firewall_violation :
  ?target_violation_reason:string ->
  ?availability_zone:string ->
  ?vp_c:string ->
  ?violation_target:string ->
  unit
-> third_party_firewall_missing_firewall_violation

val make_third_party_firewall_missing_subnet_violation :
  ?target_violation_reason:string ->
  ?availability_zone:string ->
  ?vp_c:string ->
  ?violation_target:string ->
  unit
-> third_party_firewall_missing_subnet_violation

val make_third_party_firewall_missing_expected_route_table_violation :
  ?expected_route_table:string ->
  ?current_route_table:string ->
  ?availability_zone:string ->
  ?vp_c:string ->
  ?violation_target:string ->
  unit
-> third_party_firewall_missing_expected_route_table_violation

val make_firewall_subnet_missing_vpc_endpoint_violation :
  ?subnet_availability_zone_id:string ->
  ?subnet_availability_zone:string ->
  ?vpc_id:string ->
  ?firewall_subnet_id:string ->
  unit
-> firewall_subnet_missing_vpc_endpoint_violation

val make_network_acl_icmp_type_code : ?type_:int -> ?code:int -> unit
-> network_acl_icmp_type_code

val make_network_acl_port_range : ?to_:int -> ?from_:int -> unit
-> network_acl_port_range

val make_network_acl_entry :
  ?ipv6_cidr_block:string ->
  ?cidr_block:string ->
  ?port_range:network_acl_port_range ->
  ?icmp_type_code:network_acl_icmp_type_code ->
  egress:bool ->
  rule_action:network_acl_rule_action ->
  protocol:string ->
  unit -> network_acl_entry

val make_entry_description :
  ?entry_type:entry_type ->
  ?entry_rule_number:int ->
  ?entry_detail:network_acl_entry ->
  unit -> entry_description

val make_entry_violation :
  ?entry_violation_reasons:entry_violation_reason list ->
  ?entries_with_conflicts:entry_description list ->
  ?entry_at_expected_evaluation_order:entry_description ->
  ?actual_evaluation_order:string ->
  ?expected_evaluation_order:string ->
  ?expected_entry:entry_description ->
  unit -> entry_violation

val make_invalid_network_acl_entries_violation :
  ?entry_violations:entry_violation list ->
  ?current_associated_network_acl:string ->
  ?subnet_availability_zone:string ->
  ?subnet:string ->
  ?vpc:string ->
  unit -> invalid_network_acl_entries_violation

val make_action_target : ?description:string -> ?resource_id:string -> unit
-> action_target

val make_ec2_create_route_action :
  ?gateway_id:action_target ->
  ?vpc_endpoint_id:action_target ->
  ?destination_ipv6_cidr_block:string ->
  ?destination_prefix_list_id:string ->
  ?destination_cidr_block:string ->
  ?description:string ->
  route_table_id:action_target ->
  unit -> ec2_create_route_action

val make_ec2_replace_route_action :
  ?gateway_id:action_target ->
  ?destination_ipv6_cidr_block:string ->
  ?destination_prefix_list_id:string ->
  ?destination_cidr_block:string ->
  ?description:string ->
  route_table_id:action_target ->
  unit -> ec2_replace_route_action

val make_ec2_delete_route_action :
  ?destination_ipv6_cidr_block:string ->
  ?destination_prefix_list_id:string ->
  ?destination_cidr_block:string ->
  ?description:string ->
  route_table_id:action_target ->
  unit -> ec2_delete_route_action

val make_ec2_copy_route_table_action :
  ?description:string ->
  route_table_id:action_target ->
  vpc_id:action_target ->
  unit
-> ec2_copy_route_table_action

val make_ec2_replace_route_table_association_action :
  ?description:string ->
  route_table_id:action_target ->
  association_id:action_target ->
  unit
-> ec2_replace_route_table_association_action

val make_ec2_associate_route_table_action :
  ?gateway_id:action_target ->
  ?subnet_id:action_target ->
  ?description:string ->
  route_table_id:action_target ->
  unit
-> ec2_associate_route_table_action

val make_ec2_create_route_table_action :
  ?description:string -> vpc_id:action_target -> unit
-> ec2_create_route_table_action

val make_fms_policy_update_firewall_creation_config_action :
  ?firewall_creation_config:string -> ?description:string -> unit
-> fms_policy_update_firewall_creation_config_action

val make_create_network_acl_action :
  ?fms_can_remediate:bool ->
  ?vpc:action_target ->
  ?description:string ->
  unit
-> create_network_acl_action

val make_replace_network_acl_association_action :
  ?fms_can_remediate:bool ->
  ?network_acl_id:action_target ->
  ?association_id:action_target ->
  ?description:string ->
  unit
-> replace_network_acl_association_action

val make_create_network_acl_entries_action :
  ?fms_can_remediate:bool ->
  ?network_acl_entries_to_be_created:entry_description list ->
  ?network_acl_id:action_target ->
  ?description:string ->
  unit
-> create_network_acl_entries_action

val make_delete_network_acl_entries_action :
  ?fms_can_remediate:bool ->
  ?network_acl_entries_to_be_deleted:entry_description list ->
  ?network_acl_id:action_target ->
  ?description:string ->
  unit -> delete_network_acl_entries_action

val make_remediation_action :
  ?delete_network_acl_entries_action:delete_network_acl_entries_action ->
  ?create_network_acl_entries_action:create_network_acl_entries_action ->
  ?replace_network_acl_association_action:replace_network_acl_association_action ->
  ?create_network_acl_action:create_network_acl_action ->
  ?fms_policy_update_firewall_creation_config_action:fms_policy_update_firewall_creation_config_action ->
  ?ec2_create_route_table_action:ec2_create_route_table_action ->
  ?ec2_associate_route_table_action:ec2_associate_route_table_action ->
  ?ec2_replace_route_table_association_action:ec2_replace_route_table_association_action ->
  ?ec2_copy_route_table_action:ec2_copy_route_table_action ->
  ?ec2_delete_route_action:ec2_delete_route_action ->
  ?ec2_replace_route_action:ec2_replace_route_action ->
  ?ec2_create_route_action:ec2_create_route_action ->
  ?description:string ->
  unit -> remediation_action

val make_remediation_action_with_order :
  ?order:int -> ?remediation_action:remediation_action -> unit
-> remediation_action_with_order

val make_possible_remediation_action :
  ?is_default_action:bool ->
  ?description:string ->
  ordered_remediation_actions:remediation_action_with_order list ->
  unit -> possible_remediation_action

val make_possible_remediation_actions :
  ?actions:possible_remediation_action list -> ?description:string -> unit
-> possible_remediation_actions

val make_resource_violation :
  ?possible_remediation_actions:possible_remediation_actions ->
  ?invalid_network_acl_entries_violation:invalid_network_acl_entries_violation ->
  ?firewall_subnet_missing_vpc_endpoint_violation:firewall_subnet_missing_vpc_endpoint_violation ->
  ?third_party_firewall_missing_expected_route_table_violation:third_party_firewall_missing_expected_route_table_violation ->
  ?third_party_firewall_missing_subnet_violation:third_party_firewall_missing_subnet_violation ->
  ?third_party_firewall_missing_firewall_violation:third_party_firewall_missing_firewall_violation ->
  ?route_has_out_of_scope_endpoint_violation:route_has_out_of_scope_endpoint_violation ->
  ?firewall_subnet_is_out_of_scope_violation:firewall_subnet_is_out_of_scope_violation ->
  ?dns_rule_group_limit_exceeded_violation:dns_rule_group_limit_exceeded_violation ->
  ?dns_duplicate_rule_group_violation:dns_duplicate_rule_group_violation ->
  ?dns_rule_group_priority_conflict_violation:dns_rule_group_priority_conflict_violation ->
  ?network_firewall_missing_expected_routes_violation:network_firewall_missing_expected_routes_violation ->
  ?network_firewall_unexpected_gateway_routes_violation:network_firewall_unexpected_gateway_routes_violation ->
  ?network_firewall_unexpected_firewall_routes_violation:network_firewall_unexpected_firewall_routes_violation ->
  ?network_firewall_black_hole_route_detected_violation:network_firewall_black_hole_route_detected_violation ->
  ?network_firewall_invalid_route_configuration_violation:network_firewall_invalid_route_configuration_violation ->
  ?network_firewall_internet_traffic_not_inspected_violation:network_firewall_internet_traffic_not_inspected_violation ->
  ?network_firewall_policy_modified_violation:network_firewall_policy_modified_violation ->
  ?network_firewall_missing_expected_rt_violation:network_firewall_missing_expected_rt_violation ->
  ?network_firewall_missing_subnet_violation:network_firewall_missing_subnet_violation ->
  ?network_firewall_missing_firewall_violation:network_firewall_missing_firewall_violation ->
  ?aws_ec2_instance_violation:aws_ec2_instance_violation ->
  ?aws_ec2_network_interface_violation:aws_ec2_network_interface_violation ->
  ?aws_vpc_security_group_violation:aws_vpc_security_group_violation ->
  unit -> resource_violation

val make_tag : value:string -> key:string -> unit
-> tag

val make_violation_detail :
  ?resource_description:string ->
  ?resource_tags:tag list ->
  resource_violations:resource_violation list ->
  resource_type:string ->
  resource_id:string ->
  member_account:string ->
  policy_id:string ->
  unit -> violation_detail

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_request

val make_third_party_firewall_policy :
  ?firewall_deployment_model:firewall_deployment_model -> unit
-> third_party_firewall_policy

val make_third_party_firewall_firewall_policy :
  ?firewall_policy_name:string -> ?firewall_policy_id:string -> unit
-> third_party_firewall_firewall_policy

val make_tag_resource_response : unit
-> tag_resource_response

val make_tag_resource_request :
  tag_list:tag list -> resource_arn:string -> unit
-> tag_resource_request

val make_network_firewall_policy :
  ?firewall_deployment_model:firewall_deployment_model -> unit
-> network_firewall_policy

val make_network_acl_entry_set :
  ?last_entries:network_acl_entry list ->
  ?first_entries:network_acl_entry list ->
  force_remediate_for_last_entries:bool ->
  force_remediate_for_first_entries:bool ->
  unit -> network_acl_entry_set

val make_network_acl_common_policy :
  network_acl_entry_set:network_acl_entry_set -> unit
-> network_acl_common_policy

val make_policy_option :
  ?network_acl_common_policy:network_acl_common_policy ->
  ?third_party_firewall_policy:third_party_firewall_policy ->
  ?network_firewall_policy:network_firewall_policy ->
  unit -> policy_option

val make_security_service_policy_data :
  ?policy_option:policy_option ->
  ?managed_service_data:string ->
  type_:security_service_type ->
  unit -> security_service_policy_data

val make_resource_tag : ?value:string -> key:string -> unit
-> resource_tag

val make_resource_set_summary :
  ?resource_set_status:resource_set_status ->
  ?last_update_time:float ->
  ?description:string ->
  ?name:string ->
  ?id:string ->
  unit -> resource_set_summary

val make_resource_set :
  ?resource_set_status:resource_set_status ->
  ?last_update_time:float ->
  ?update_token:string ->
  ?description:string ->
  ?id:string ->
  resource_type_list:string list ->
  name:string ->
  unit -> resource_set

val make_resource : ?account_id:string -> ur_i:string -> unit
-> resource

val make_region_scope :
  ?all_regions_enabled:bool -> ?regions:string list -> unit
-> region_scope

val make_put_resource_set_response :
  resource_set_arn:string -> resource_set:resource_set -> unit
-> put_resource_set_response

val make_put_resource_set_request :
  ?tag_list:tag list -> resource_set:resource_set -> unit
-> put_resource_set_request

val make_protocols_list_data :
  ?previous_protocols_list:(string * string list) list ->
  ?last_update_time:float ->
  ?create_time:float ->
  ?list_update_token:string ->
  ?list_id:string ->
  protocols_list:string list ->
  list_name:string ->
  unit -> protocols_list_data

val make_put_protocols_list_response :
  ?protocols_list_arn:string -> ?protocols_list:protocols_list_data -> unit
-> put_protocols_list_response

val make_put_protocols_list_request :
  ?tag_list:tag list -> protocols_list:protocols_list_data -> unit
-> put_protocols_list_request

val make_policy :
  ?policy_status:customer_policy_status ->
  ?policy_description:string ->
  ?resource_set_ids:string list ->
  ?exclude_map:(string * string list) list ->
  ?include_map:(string * string list) list ->
  ?delete_unused_fm_managed_resources:bool ->
  ?resource_tags:resource_tag list ->
  ?resource_type_list:string list ->
  ?policy_update_token:string ->
  ?policy_id:string ->
  remediation_enabled:bool ->
  exclude_resource_tags:bool ->
  resource_type:string ->
  security_service_policy_data:security_service_policy_data ->
  policy_name:string ->
  unit -> policy

val make_put_policy_response : ?policy_arn:string -> ?policy:policy -> unit
-> put_policy_response

val make_put_policy_request : ?tag_list:tag list -> policy:policy -> unit
-> put_policy_request

val make_put_notification_channel_request :
  sns_role_name:string -> sns_topic_arn:string -> unit
-> put_notification_channel_request

val make_app : port:int -> protocol:string -> app_name:string -> unit
-> app

val make_apps_list_data :
  ?previous_apps_list:(string * app list) list ->
  ?last_update_time:float ->
  ?create_time:float ->
  ?list_update_token:string ->
  ?list_id:string ->
  apps_list:app list ->
  list_name:string ->
  unit -> apps_list_data

val make_put_apps_list_response :
  ?apps_list_arn:string -> ?apps_list:apps_list_data -> unit
-> put_apps_list_response

val make_put_apps_list_request :
  ?tag_list:tag list -> apps_list:apps_list_data -> unit
-> put_apps_list_request

val make_account_scope :
  ?exclude_specified_accounts:bool ->
  ?all_accounts_enabled:bool ->
  ?accounts:string list ->
  unit -> account_scope

val make_organizational_unit_scope :
  ?exclude_specified_organizational_units:bool ->
  ?all_organizational_units_enabled:bool ->
  ?organizational_units:string list ->
  unit -> organizational_unit_scope

val make_policy_type_scope :
  ?all_policy_types_enabled:bool ->
  ?policy_types:security_service_type list ->
  unit -> policy_type_scope

val make_admin_scope :
  ?policy_type_scope:policy_type_scope ->
  ?region_scope:region_scope ->
  ?organizational_unit_scope:organizational_unit_scope ->
  ?account_scope:account_scope ->
  unit -> admin_scope

val make_put_admin_account_request :
  ?admin_scope:admin_scope -> admin_account:string -> unit
-> put_admin_account_request

val make_protocols_list_data_summary :
  ?protocols_list:string list ->
  ?list_name:string ->
  ?list_id:string ->
  ?list_arn:string ->
  unit -> protocols_list_data_summary

val make_policy_summary :
  ?policy_status:customer_policy_status ->
  ?delete_unused_fm_managed_resources:bool ->
  ?remediation_enabled:bool ->
  ?security_service_type:security_service_type ->
  ?resource_type:string ->
  ?policy_name:string ->
  ?policy_id:string ->
  ?policy_arn:string ->
  unit -> policy_summary

val make_evaluation_result :
  ?evaluation_limit_exceeded:bool ->
  ?violator_count:int ->
  ?compliance_status:policy_compliance_status_type ->
  unit -> evaluation_result

val make_policy_compliance_status :
  ?issue_info_map:(string * string) list ->
  ?last_updated:float ->
  ?evaluation_results:evaluation_result list ->
  ?member_account:string ->
  ?policy_name:string ->
  ?policy_id:string ->
  ?policy_owner:string ->
  unit -> policy_compliance_status

val make_compliance_violator :
  ?metadata:(string * string) list ->
  ?resource_type:string ->
  ?violation_reason:violation_reason ->
  ?resource_id:string ->
  unit -> compliance_violator

val make_policy_compliance_detail :
  ?issue_info_map:(string * string) list ->
  ?expired_at:float ->
  ?evaluation_limit_exceeded:bool ->
  ?violators:compliance_violator list ->
  ?member_account:string ->
  ?policy_id:string ->
  ?policy_owner:string ->
  unit
-> policy_compliance_detail

val make_list_third_party_firewall_firewall_policies_response :
  ?next_token:string ->
  ?third_party_firewall_firewall_policies:third_party_firewall_firewall_policy list ->
  unit
-> list_third_party_firewall_firewall_policies_response

val make_list_third_party_firewall_firewall_policies_request :
  ?next_token:string ->
  max_results:int ->
  third_party_firewall:third_party_firewall ->
  unit
-> list_third_party_firewall_firewall_policies_request

val make_list_tags_for_resource_response : ?tag_list:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:string -> unit
-> list_tags_for_resource_request

val make_list_resource_sets_response :
  ?next_token:string -> ?resource_sets:resource_set_summary list -> unit
-> list_resource_sets_response

val make_list_resource_sets_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_resource_sets_request

val make_list_resource_set_resources_response :
  ?next_token:string -> items:resource list -> unit
-> list_resource_set_resources_response

val make_list_resource_set_resources_request :
  ?next_token:string -> ?max_results:int -> identifier:string -> unit
-> list_resource_set_resources_request

val make_list_protocols_lists_response :
  ?next_token:string ->
  ?protocols_lists:protocols_list_data_summary list ->
  unit
-> list_protocols_lists_response

val make_list_protocols_lists_request :
  ?next_token:string -> ?default_lists:bool -> max_results:int -> unit
-> list_protocols_lists_request

val make_list_policies_response :
  ?next_token:string -> ?policy_list:policy_summary list -> unit
-> list_policies_response

val make_list_policies_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_policies_request

val make_list_member_accounts_response :
  ?next_token:string -> ?member_accounts:string list -> unit
-> list_member_accounts_response

val make_list_member_accounts_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_member_accounts_request

val make_discovered_resource :
  ?name:string -> ?type_:string -> ?account_id:string -> ?ur_i:string -> unit
-> discovered_resource

val make_list_discovered_resources_response :
  ?next_token:string -> ?items:discovered_resource list -> unit
-> list_discovered_resources_response

val make_list_discovered_resources_request :
  ?next_token:string ->
  ?max_results:int ->
  resource_type:string ->
  member_account_ids:string list ->
  unit
-> list_discovered_resources_request

val make_list_compliance_status_response :
  ?next_token:string ->
  ?policy_compliance_status_list:policy_compliance_status list ->
  unit
-> list_compliance_status_response

val make_list_compliance_status_request :
  ?max_results:int -> ?next_token:string -> policy_id:string -> unit
-> list_compliance_status_request

val make_apps_list_data_summary :
  ?apps_list:app list ->
  ?list_name:string ->
  ?list_id:string ->
  ?list_arn:string ->
  unit -> apps_list_data_summary

val make_list_apps_lists_response :
  ?next_token:string -> ?apps_lists:apps_list_data_summary list -> unit
-> list_apps_lists_response

val make_list_apps_lists_request :
  ?next_token:string -> ?default_lists:bool -> max_results:int -> unit
-> list_apps_lists_request

val make_list_admins_managing_account_response :
  ?next_token:string -> ?admin_accounts:string list -> unit
-> list_admins_managing_account_response

val make_list_admins_managing_account_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_admins_managing_account_request

val make_admin_account_summary :
  ?status:organization_status ->
  ?default_admin:bool ->
  ?admin_account:string ->
  unit
-> admin_account_summary

val make_list_admin_accounts_for_organization_response :
  ?next_token:string -> ?admin_accounts:admin_account_summary list -> unit
-> list_admin_accounts_for_organization_response

val make_list_admin_accounts_for_organization_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_admin_accounts_for_organization_request

val make_get_violation_details_response :
  ?violation_detail:violation_detail -> unit
-> get_violation_details_response

val make_get_violation_details_request :
  resource_type:string ->
  resource_id:string ->
  member_account:string ->
  policy_id:string ->
  unit
-> get_violation_details_request

val make_get_third_party_firewall_association_status_response :
  ?marketplace_onboarding_status:marketplace_subscription_onboarding_status ->
  ?third_party_firewall_status:third_party_firewall_association_status ->
  unit
-> get_third_party_firewall_association_status_response

val make_get_third_party_firewall_association_status_request :
  third_party_firewall:third_party_firewall -> unit
-> get_third_party_firewall_association_status_request

val make_get_resource_set_response :
  resource_set_arn:string -> resource_set:resource_set -> unit
-> get_resource_set_response

val make_get_resource_set_request : identifier:string -> unit
-> get_resource_set_request

val make_get_protocols_list_response :
  ?protocols_list_arn:string -> ?protocols_list:protocols_list_data -> unit
-> get_protocols_list_response

val make_get_protocols_list_request :
  ?default_list:bool -> list_id:string -> unit
-> get_protocols_list_request

val make_get_protection_status_response :
  ?next_token:string ->
  ?data:string ->
  ?service_type:security_service_type ->
  ?admin_account_id:string ->
  unit
-> get_protection_status_response

val make_get_protection_status_request :
  ?max_results:int ->
  ?next_token:string ->
  ?end_time:float ->
  ?start_time:float ->
  ?member_account_id:string ->
  policy_id:string ->
  unit -> get_protection_status_request

val make_get_policy_response : ?policy_arn:string -> ?policy:policy -> unit
-> get_policy_response

val make_get_policy_request : policy_id:string -> unit
-> get_policy_request

val make_get_notification_channel_response :
  ?sns_role_name:string -> ?sns_topic_arn:string -> unit
-> get_notification_channel_response

val make_get_notification_channel_request : unit
-> get_notification_channel_request

val make_get_compliance_detail_response :
  ?policy_compliance_detail:policy_compliance_detail -> unit
-> get_compliance_detail_response

val make_get_compliance_detail_request :
  member_account:string -> policy_id:string -> unit
-> get_compliance_detail_request

val make_get_apps_list_response :
  ?apps_list_arn:string -> ?apps_list:apps_list_data -> unit
-> get_apps_list_response

val make_get_apps_list_request : ?default_list:bool -> list_id:string -> unit
-> get_apps_list_request

val make_get_admin_scope_response :
  ?status:organization_status -> ?admin_scope:admin_scope -> unit
-> get_admin_scope_response

val make_get_admin_scope_request : admin_account:string -> unit
-> get_admin_scope_request

val make_get_admin_account_response :
  ?role_status:account_role_status -> ?admin_account:string -> unit
-> get_admin_account_response

val make_get_admin_account_request : unit
-> get_admin_account_request

val make_failed_item : ?reason:failed_item_reason -> ?ur_i:string -> unit
-> failed_item

val make_disassociate_third_party_firewall_response :
  ?third_party_firewall_status:third_party_firewall_association_status ->
  unit
-> disassociate_third_party_firewall_response

val make_disassociate_third_party_firewall_request :
  third_party_firewall:third_party_firewall -> unit
-> disassociate_third_party_firewall_request

val make_disassociate_admin_account_request : unit
-> disassociate_admin_account_request

val make_delete_resource_set_request : identifier:string -> unit
-> delete_resource_set_request

val make_delete_protocols_list_request : list_id:string -> unit
-> delete_protocols_list_request

val make_delete_policy_request :
  ?delete_all_policy_resources:bool -> policy_id:string -> unit
-> delete_policy_request

val make_delete_notification_channel_request : unit
-> delete_notification_channel_request

val make_delete_apps_list_request : list_id:string -> unit
-> delete_apps_list_request

val make_batch_disassociate_resource_response :
  failed_items:failed_item list -> resource_set_identifier:string -> unit
-> batch_disassociate_resource_response

val make_batch_disassociate_resource_request :
  items:string list -> resource_set_identifier:string -> unit
-> batch_disassociate_resource_request

val make_batch_associate_resource_response :
  failed_items:failed_item list -> resource_set_identifier:string -> unit
-> batch_associate_resource_response

val make_batch_associate_resource_request :
  items:string list -> resource_set_identifier:string -> unit
-> batch_associate_resource_request

val make_associate_third_party_firewall_response :
  ?third_party_firewall_status:third_party_firewall_association_status ->
  unit
-> associate_third_party_firewall_response

val make_associate_third_party_firewall_request :
  third_party_firewall:third_party_firewall -> unit
-> associate_third_party_firewall_request

val make_associate_admin_account_request : admin_account:string -> unit
-> associate_admin_account_request

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_set_request ->
        (put_resource_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module PutProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      put_protocols_list_request ->
        (put_protocols_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_policy_request ->
        (put_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidTypeException of invalid_type_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      put_notification_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      put_apps_list_request ->
        (put_apps_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      put_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListThirdPartyFirewallFirewallPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_third_party_firewall_firewall_policies_request ->
        (list_third_party_firewall_firewall_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListResourceSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_sets_request ->
        (list_resource_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            
        ]
      ) result
end

module ListResourceSetResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_set_resources_request ->
        (list_resource_set_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListProtocolsLists : sig
  val request :
    Smaws_Lib.Context.t ->
      list_protocols_lists_request ->
        (list_protocols_lists_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_policies_request ->
        (list_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListMemberAccounts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_member_accounts_request ->
        (list_member_accounts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_discovered_resources_request ->
        (list_discovered_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            
        ]
      ) result
end

module ListComplianceStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_status_request ->
        (list_compliance_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListAppsLists : sig
  val request :
    Smaws_Lib.Context.t ->
      list_apps_lists_request ->
        (list_apps_lists_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListAdminsManagingAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      list_admins_managing_account_request ->
        (list_admins_managing_account_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListAdminAccountsForOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      list_admin_accounts_for_organization_request ->
        (list_admin_accounts_for_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetViolationDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_violation_details_request ->
        (get_violation_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetThirdPartyFirewallAssociationStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_third_party_firewall_association_status_request ->
        (get_third_party_firewall_association_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_set_request ->
        (get_resource_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      get_protocols_list_request ->
        (get_protocols_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetProtectionStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_protection_status_request ->
        (get_protection_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_policy_request ->
        (get_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidTypeException of invalid_type_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      get_notification_channel_request ->
        (get_notification_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetComplianceDetail : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_detail_request ->
        (get_compliance_detail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      get_apps_list_request ->
        (get_apps_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetAdminScope : sig
  val request :
    Smaws_Lib.Context.t ->
      get_admin_scope_request ->
        (get_admin_scope_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      get_admin_account_request ->
        (get_admin_account_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateThirdPartyFirewall : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_third_party_firewall_request ->
        (disassociate_third_party_firewall_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_set_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protocols_list_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeletePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_policy_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_notification_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_apps_list_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module BatchDisassociateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_disassociate_resource_request ->
        (batch_disassociate_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module BatchAssociateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_associate_resource_request ->
        (batch_associate_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateThirdPartyFirewall : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_third_party_firewall_request ->
        (associate_third_party_firewall_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

