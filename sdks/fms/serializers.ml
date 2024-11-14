open Smaws_Lib.Json.SerializeHelpers

open Types

let violation_target_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let violation_reason_to_yojson = 
  fun (x: violation_reason) -> match x with 
 
| InvalidNetworkAclEntry -> `String "INVALID_NETWORK_ACL_ENTRY"
  | FirewallSubnetMissingVPCEndpoint -> `String "FIREWALL_SUBNET_MISSING_VPCE_ENDPOINT"
  | RouteHasOutOfScopeEndpoint -> `String "ROUTE_HAS_OUT_OF_SCOPE_ENDPOINT"
  | ResourceMissingDnsFirewall -> `String "RESOURCE_MISSING_DNS_FIREWALL"
  | BlackHoleRouteDetectedInFirewallSubnet -> `String "BLACK_HOLE_ROUTE_DETECTED_IN_FIREWALL_SUBNET"
  | BlackHoleRouteDetected -> `String "BLACK_HOLE_ROUTE_DETECTED"
  | InternetTrafficNotInspected -> `String "INTERNET_TRAFFIC_NOT_INSPECTED"
  | MissingTargetGateway -> `String "MISSING_TARGET_GATEWAY"
  | InvalidRouteConfiguration -> `String "INVALID_ROUTE_CONFIGURATION"
  | TrafficInspectionCrossesAZBoundary -> `String "TRAFFIC_INSPECTION_CROSSES_AZ_BOUNDARY"
  | UnexpectedTargetGatewayRoutes -> `String "UNEXPECTED_TARGET_GATEWAY_ROUTES"
  | UnexpectedFirewallRoutes -> `String "UNEXPECTED_FIREWALL_ROUTES"
  | FirewallSubnetMissingExpectedRoute -> `String "FIREWALL_SUBNET_MISSING_EXPECTED_ROUTE"
  | InternetGatewayMissingExpectedRoute -> `String "INTERNET_GATEWAY_MISSING_EXPECTED_ROUTE"
  | FirewallSubnetIsOutOfScope -> `String "FIREWALL_SUBNET_IS_OUT_OF_SCOPE"
  | NetworkFirewallPolicyModified -> `String "NETWORK_FIREWALL_POLICY_MODIFIED"
  | MissingExpectedRouteTable -> `String "MISSING_EXPECTED_ROUTE_TABLE"
  | MissingFirewallSubnetInAZ -> `String "MISSING_FIREWALL_SUBNET_IN_AZ"
  | MissingFirewall -> `String "MISSING_FIREWALL"
  | FMSCreatedSecurityGroupEdited -> `String "FMS_CREATED_SECURITY_GROUP_EDITED"
  | SecurityGroupRedundant -> `String "SECURITY_GROUP_REDUNDANT"
  | SecurityGroupUnused -> `String "SECURITY_GROUP_UNUSED"
  | ResourceViolatesAuditSecurityGroup -> `String "RESOURCE_VIOLATES_AUDIT_SECURITY_GROUP"
  | ResourceMissingSecurityGroup -> `String "RESOURCE_MISSING_SECURITY_GROUP"
  | ResourceMissingWebaclOrShieldProtection -> `String "RESOURCE_MISSING_WEB_ACL_OR_SHIELD_PROTECTION"
  | ResourceMissingShieldProtection -> `String "RESOURCE_MISSING_SHIELD_PROTECTION"
  | ResourceIncorrectWebAcl -> `String "RESOURCE_INCORRECT_WEB_ACL"
  | ResourceMissingWebAcl -> `String "RESOURCE_MISSING_WEB_ACL"
  | WebAclMissingRuleGroup -> `String "WEB_ACL_MISSING_RULE_GROUP"
   

let policy_id_to_yojson = string_to_yojson

let aws_account_id_to_yojson = string_to_yojson

let resource_id_to_yojson = string_to_yojson

let resource_type_to_yojson = string_to_yojson

let length_bounded_string_to_yojson = string_to_yojson

let reference_rule_to_yojson = string_to_yojson

let target_violation_reason_to_yojson = string_to_yojson

let target_violation_reasons_to_yojson = 
  fun tree -> list_to_yojson target_violation_reason_to_yojson tree

let partial_match_to_yojson = 
  fun (x: partial_match) -> assoc_to_yojson(
    [(
         "TargetViolationReasons",
         (option_to_yojson target_violation_reasons_to_yojson x.target_violation_reasons));
       (
         "Reference",
         (option_to_yojson reference_rule_to_yojson x.reference));
       
  ])

let partial_matches_to_yojson = 
  fun tree -> list_to_yojson partial_match_to_yojson tree

let remediation_action_type_to_yojson = 
  fun (x: remediation_action_type) -> match x with 
  | Modify -> `String "MODIFY"
    | Remove -> `String "REMOVE"
     

let remediation_action_description_to_yojson = string_to_yojson

let cid_r_to_yojson = string_to_yojson

let ip_port_number_to_yojson = long_to_yojson

let security_group_rule_description_to_yojson = 
  fun (x: security_group_rule_description) -> assoc_to_yojson(
    [(
         "ToPort",
         (option_to_yojson ip_port_number_to_yojson x.to_port));
       (
         "FromPort",
         (option_to_yojson ip_port_number_to_yojson x.from_port));
       (
         "Protocol",
         (option_to_yojson length_bounded_string_to_yojson x.protocol));
       (
         "PrefixListId",
         (option_to_yojson resource_id_to_yojson x.prefix_list_id));
       (
         "IPV6Range",
         (option_to_yojson cid_r_to_yojson x.ipv6_range));
       (
         "IPV4Range",
         (option_to_yojson cid_r_to_yojson x.ipv4_range));
       
  ])

let boolean__to_yojson = bool_to_yojson

let security_group_remediation_action_to_yojson = 
  fun (x: security_group_remediation_action) -> assoc_to_yojson(
    [(
         "IsDefaultAction",
         (option_to_yojson boolean__to_yojson x.is_default_action));
       (
         "RemediationResult",
         (option_to_yojson security_group_rule_description_to_yojson x.remediation_result));
       (
         "Description",
         (option_to_yojson remediation_action_description_to_yojson x.description));
       (
         "RemediationActionType",
         (option_to_yojson remediation_action_type_to_yojson x.remediation_action_type));
       
  ])

let security_group_remediation_actions_to_yojson = 
  fun tree -> list_to_yojson security_group_remediation_action_to_yojson tree

let aws_vpc_security_group_violation_to_yojson = 
  fun (x: aws_vpc_security_group_violation) -> assoc_to_yojson(
    [(
         "PossibleSecurityGroupRemediationActions",
         (option_to_yojson security_group_remediation_actions_to_yojson x.possible_security_group_remediation_actions));
       (
         "PartialMatches",
         (option_to_yojson partial_matches_to_yojson x.partial_matches));
       (
         "ViolationTargetDescription",
         (option_to_yojson length_bounded_string_to_yojson x.violation_target_description));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let resource_id_list_to_yojson = 
  fun tree -> list_to_yojson resource_id_to_yojson tree

let aws_ec2_network_interface_violation_to_yojson = 
  fun (x: aws_ec2_network_interface_violation) -> assoc_to_yojson(
    [(
         "ViolatingSecurityGroups",
         (option_to_yojson resource_id_list_to_yojson x.violating_security_groups));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let aws_ec2_network_interface_violations_to_yojson = 
  fun tree -> list_to_yojson aws_ec2_network_interface_violation_to_yojson tree

let aws_ec2_instance_violation_to_yojson = 
  fun (x: aws_ec2_instance_violation) -> assoc_to_yojson(
    [(
         "AwsEc2NetworkInterfaceViolations",
         (option_to_yojson aws_ec2_network_interface_violations_to_yojson x.aws_ec2_network_interface_violations));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let network_firewall_missing_firewall_violation_to_yojson = 
  fun (x: network_firewall_missing_firewall_violation) -> assoc_to_yojson(
    [(
         "TargetViolationReason",
         (option_to_yojson target_violation_reason_to_yojson x.target_violation_reason));
       (
         "AvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.availability_zone));
       (
         "VPC",
         (option_to_yojson resource_id_to_yojson x.vp_c));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let network_firewall_missing_subnet_violation_to_yojson = 
  fun (x: network_firewall_missing_subnet_violation) -> assoc_to_yojson(
    [(
         "TargetViolationReason",
         (option_to_yojson target_violation_reason_to_yojson x.target_violation_reason));
       (
         "AvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.availability_zone));
       (
         "VPC",
         (option_to_yojson resource_id_to_yojson x.vp_c));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let network_firewall_missing_expected_rt_violation_to_yojson = 
  fun (x: network_firewall_missing_expected_rt_violation) -> assoc_to_yojson(
    [(
         "ExpectedRouteTable",
         (option_to_yojson resource_id_to_yojson x.expected_route_table));
       (
         "CurrentRouteTable",
         (option_to_yojson resource_id_to_yojson x.current_route_table));
       (
         "AvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.availability_zone));
       (
         "VPC",
         (option_to_yojson resource_id_to_yojson x.vp_c));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let network_firewall_resource_name_to_yojson = string_to_yojson

let stateless_rule_group_priority_to_yojson = int_to_yojson

let stateless_rule_group_to_yojson = 
  fun (x: stateless_rule_group) -> assoc_to_yojson(
    [(
         "Priority",
         (option_to_yojson stateless_rule_group_priority_to_yojson x.priority));
       (
         "ResourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       (
         "RuleGroupName",
         (option_to_yojson network_firewall_resource_name_to_yojson x.rule_group_name));
       
  ])

let stateless_rule_group_list_to_yojson = 
  fun tree -> list_to_yojson stateless_rule_group_to_yojson tree

let network_firewall_action_to_yojson = string_to_yojson

let network_firewall_action_list_to_yojson = 
  fun tree -> list_to_yojson network_firewall_action_to_yojson tree

let priority_number_to_yojson = int_to_yojson

let network_firewall_override_action_to_yojson = 
  fun (x: network_firewall_override_action) -> match x with 
  | DROP_TO_ALERT -> `String "DROP_TO_ALERT"
     

let network_firewall_stateful_rule_group_override_to_yojson = 
  fun (x: network_firewall_stateful_rule_group_override) -> assoc_to_yojson(
    [(
         "Action",
         (option_to_yojson network_firewall_override_action_to_yojson x.action));
       
  ])

let stateful_rule_group_to_yojson = 
  fun (x: stateful_rule_group) -> assoc_to_yojson(
    [(
         "Override",
         (option_to_yojson network_firewall_stateful_rule_group_override_to_yojson x.override));
       (
         "Priority",
         (option_to_yojson priority_number_to_yojson x.priority));
       (
         "ResourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       (
         "RuleGroupName",
         (option_to_yojson network_firewall_resource_name_to_yojson x.rule_group_name));
       
  ])

let stateful_rule_group_list_to_yojson = 
  fun tree -> list_to_yojson stateful_rule_group_to_yojson tree

let rule_order_to_yojson = 
  fun (x: rule_order) -> match x with 
 
| DEFAULT_ACTION_ORDER -> `String "DEFAULT_ACTION_ORDER"
  | STRICT_ORDER -> `String "STRICT_ORDER"
   

let stream_exception_policy_to_yojson = 
  fun (x: stream_exception_policy) -> match x with 
 
| FMS_IGNORE -> `String "FMS_IGNORE"
  | REJECT -> `String "REJECT"
  | CONTINUE -> `String "CONTINUE"
  | DROP -> `String "DROP"
   

let stateful_engine_options_to_yojson = 
  fun (x: stateful_engine_options) -> assoc_to_yojson(
    [(
         "StreamExceptionPolicy",
         (option_to_yojson stream_exception_policy_to_yojson x.stream_exception_policy));
       (
         "RuleOrder",
         (option_to_yojson rule_order_to_yojson x.rule_order));
       
  ])

let network_firewall_policy_description_to_yojson = 
  fun (x: network_firewall_policy_description) -> assoc_to_yojson(
    [(
         "StatefulEngineOptions",
         (option_to_yojson stateful_engine_options_to_yojson x.stateful_engine_options));
       (
         "StatefulDefaultActions",
         (option_to_yojson network_firewall_action_list_to_yojson x.stateful_default_actions));
       (
         "StatefulRuleGroups",
         (option_to_yojson stateful_rule_group_list_to_yojson x.stateful_rule_groups));
       (
         "StatelessCustomActions",
         (option_to_yojson network_firewall_action_list_to_yojson x.stateless_custom_actions));
       (
         "StatelessFragmentDefaultActions",
         (option_to_yojson network_firewall_action_list_to_yojson x.stateless_fragment_default_actions));
       (
         "StatelessDefaultActions",
         (option_to_yojson network_firewall_action_list_to_yojson x.stateless_default_actions));
       (
         "StatelessRuleGroups",
         (option_to_yojson stateless_rule_group_list_to_yojson x.stateless_rule_groups));
       
  ])

let network_firewall_policy_modified_violation_to_yojson = 
  fun (x: network_firewall_policy_modified_violation) -> assoc_to_yojson(
    [(
         "ExpectedPolicyDescription",
         (option_to_yojson network_firewall_policy_description_to_yojson x.expected_policy_description));
       (
         "CurrentPolicyDescription",
         (option_to_yojson network_firewall_policy_description_to_yojson x.current_policy_description));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let destination_type_to_yojson = 
  fun (x: destination_type) -> match x with 
 
| PrefixList -> `String "PREFIX_LIST"
  | IPV6 -> `String "IPV6"
  | IPV4 -> `String "IPV4"
   

let target_type_to_yojson = 
  fun (x: target_type) -> match x with 
 
| TransitGateway -> `String "TRANSIT_GATEWAY"
  | EgressOnlyInternetGateway -> `String "EGRESS_ONLY_INTERNET_GATEWAY"
  | VPCPeeringConnection -> `String "VPC_PEERING_CONNECTION"
  | VPCEndpoint -> `String "VPC_ENDPOINT"
  | NetworkInterface -> `String "NETWORK_INTERFACE"
  | NatGateway -> `String "NAT_GATEWAY"
  | LocalGateway -> `String "LOCAL_GATEWAY"
  | Instance -> `String "INSTANCE"
  | CarrierGateway -> `String "CARRIER_GATEWAY"
  | Gateway -> `String "GATEWAY"
   

let route_to_yojson = 
  fun (x: route) -> assoc_to_yojson(
    [(
         "Target",
         (option_to_yojson length_bounded_string_to_yojson x.target));
       (
         "Destination",
         (option_to_yojson length_bounded_string_to_yojson x.destination));
       (
         "TargetType",
         (option_to_yojson target_type_to_yojson x.target_type));
       (
         "DestinationType",
         (option_to_yojson destination_type_to_yojson x.destination_type));
       
  ])

let routes_to_yojson = fun tree -> list_to_yojson route_to_yojson tree

let length_bounded_string_list_to_yojson = 
  fun tree -> list_to_yojson length_bounded_string_to_yojson tree

let expected_route_to_yojson = 
  fun (x: expected_route) -> assoc_to_yojson(
    [(
         "RouteTableId",
         (option_to_yojson resource_id_to_yojson x.route_table_id));
       (
         "AllowedTargets",
         (option_to_yojson length_bounded_string_list_to_yojson x.allowed_targets));
       (
         "ContributingSubnets",
         (option_to_yojson resource_id_list_to_yojson x.contributing_subnets));
       (
         "IpV6Cidr",
         (option_to_yojson cid_r_to_yojson x.ip_v6_cidr));
       (
         "PrefixListId",
         (option_to_yojson cid_r_to_yojson x.prefix_list_id));
       (
         "IpV4Cidr",
         (option_to_yojson cid_r_to_yojson x.ip_v4_cidr));
       
  ])

let expected_routes_to_yojson = 
  fun tree -> list_to_yojson expected_route_to_yojson tree

let network_firewall_internet_traffic_not_inspected_violation_to_yojson = 
  fun (x: network_firewall_internet_traffic_not_inspected_violation) -> assoc_to_yojson(
    [(
         "VpcId",
         (option_to_yojson resource_id_to_yojson x.vpc_id));
       (
         "ActualInternetGatewayRoutes",
         (option_to_yojson routes_to_yojson x.actual_internet_gateway_routes));
       (
         "ExpectedInternetGatewayRoutes",
         (option_to_yojson expected_routes_to_yojson x.expected_internet_gateway_routes));
       (
         "CurrentInternetGatewayRouteTable",
         (option_to_yojson resource_id_to_yojson x.current_internet_gateway_route_table));
       (
         "InternetGatewayId",
         (option_to_yojson resource_id_to_yojson x.internet_gateway_id));
       (
         "ActualFirewallSubnetRoutes",
         (option_to_yojson routes_to_yojson x.actual_firewall_subnet_routes));
       (
         "ExpectedFirewallSubnetRoutes",
         (option_to_yojson expected_routes_to_yojson x.expected_firewall_subnet_routes));
       (
         "FirewallSubnetId",
         (option_to_yojson resource_id_to_yojson x.firewall_subnet_id));
       (
         "ExpectedFirewallEndpoint",
         (option_to_yojson resource_id_to_yojson x.expected_firewall_endpoint));
       (
         "CurrentFirewallSubnetRouteTable",
         (option_to_yojson resource_id_to_yojson x.current_firewall_subnet_route_table));
       (
         "IsRouteTableUsedInDifferentAZ",
         (option_to_yojson boolean__to_yojson x.is_route_table_used_in_different_a_z));
       (
         "ViolatingRoutes",
         (option_to_yojson routes_to_yojson x.violating_routes));
       (
         "RouteTableId",
         (option_to_yojson resource_id_to_yojson x.route_table_id));
       (
         "SubnetAvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone));
       (
         "SubnetId",
         (option_to_yojson resource_id_to_yojson x.subnet_id));
       
  ])

let network_firewall_invalid_route_configuration_violation_to_yojson = 
  fun (x: network_firewall_invalid_route_configuration_violation) -> assoc_to_yojson(
    [(
         "VpcId",
         (option_to_yojson resource_id_to_yojson x.vpc_id));
       (
         "ActualInternetGatewayRoutes",
         (option_to_yojson routes_to_yojson x.actual_internet_gateway_routes));
       (
         "ExpectedInternetGatewayRoutes",
         (option_to_yojson expected_routes_to_yojson x.expected_internet_gateway_routes));
       (
         "CurrentInternetGatewayRouteTable",
         (option_to_yojson resource_id_to_yojson x.current_internet_gateway_route_table));
       (
         "InternetGatewayId",
         (option_to_yojson resource_id_to_yojson x.internet_gateway_id));
       (
         "ActualFirewallSubnetRoutes",
         (option_to_yojson routes_to_yojson x.actual_firewall_subnet_routes));
       (
         "ExpectedFirewallSubnetRoutes",
         (option_to_yojson expected_routes_to_yojson x.expected_firewall_subnet_routes));
       (
         "ActualFirewallSubnetId",
         (option_to_yojson resource_id_to_yojson x.actual_firewall_subnet_id));
       (
         "ExpectedFirewallSubnetId",
         (option_to_yojson resource_id_to_yojson x.expected_firewall_subnet_id));
       (
         "ActualFirewallEndpoint",
         (option_to_yojson resource_id_to_yojson x.actual_firewall_endpoint));
       (
         "ExpectedFirewallEndpoint",
         (option_to_yojson resource_id_to_yojson x.expected_firewall_endpoint));
       (
         "CurrentFirewallSubnetRouteTable",
         (option_to_yojson resource_id_to_yojson x.current_firewall_subnet_route_table));
       (
         "ViolatingRoute",
         (option_to_yojson route_to_yojson x.violating_route));
       (
         "IsRouteTableUsedInDifferentAZ",
         (option_to_yojson boolean__to_yojson x.is_route_table_used_in_different_a_z));
       (
         "RouteTableId",
         (option_to_yojson resource_id_to_yojson x.route_table_id));
       (
         "AffectedSubnets",
         (option_to_yojson resource_id_list_to_yojson x.affected_subnets));
       
  ])

let network_firewall_black_hole_route_detected_violation_to_yojson = 
  fun (x: network_firewall_black_hole_route_detected_violation) -> assoc_to_yojson(
    [(
         "ViolatingRoutes",
         (option_to_yojson routes_to_yojson x.violating_routes));
       (
         "VpcId",
         (option_to_yojson resource_id_to_yojson x.vpc_id));
       (
         "RouteTableId",
         (option_to_yojson resource_id_to_yojson x.route_table_id));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let network_firewall_unexpected_firewall_routes_violation_to_yojson = 
  fun (x: network_firewall_unexpected_firewall_routes_violation) -> assoc_to_yojson(
    [(
         "VpcId",
         (option_to_yojson resource_id_to_yojson x.vpc_id));
       (
         "FirewallEndpoint",
         (option_to_yojson resource_id_to_yojson x.firewall_endpoint));
       (
         "RouteTableId",
         (option_to_yojson resource_id_to_yojson x.route_table_id));
       (
         "ViolatingRoutes",
         (option_to_yojson routes_to_yojson x.violating_routes));
       (
         "FirewallSubnetId",
         (option_to_yojson resource_id_to_yojson x.firewall_subnet_id));
       
  ])

let network_firewall_unexpected_gateway_routes_violation_to_yojson = 
  fun (x: network_firewall_unexpected_gateway_routes_violation) -> assoc_to_yojson(
    [(
         "VpcId",
         (option_to_yojson resource_id_to_yojson x.vpc_id));
       (
         "RouteTableId",
         (option_to_yojson resource_id_to_yojson x.route_table_id));
       (
         "ViolatingRoutes",
         (option_to_yojson routes_to_yojson x.violating_routes));
       (
         "GatewayId",
         (option_to_yojson resource_id_to_yojson x.gateway_id));
       
  ])

let network_firewall_missing_expected_routes_violation_to_yojson = 
  fun (x: network_firewall_missing_expected_routes_violation) -> assoc_to_yojson(
    [(
         "VpcId",
         (option_to_yojson resource_id_to_yojson x.vpc_id));
       (
         "ExpectedRoutes",
         (option_to_yojson expected_routes_to_yojson x.expected_routes));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let dns_rule_group_priority_to_yojson = int_to_yojson

let dns_rule_group_priorities_to_yojson = 
  fun tree -> list_to_yojson dns_rule_group_priority_to_yojson tree

let dns_rule_group_priority_conflict_violation_to_yojson = 
  fun (x: dns_rule_group_priority_conflict_violation) -> assoc_to_yojson(
    [(
         "UnavailablePriorities",
         (option_to_yojson dns_rule_group_priorities_to_yojson x.unavailable_priorities));
       (
         "ConflictingPolicyId",
         (option_to_yojson policy_id_to_yojson x.conflicting_policy_id));
       (
         "ConflictingPriority",
         (option_to_yojson dns_rule_group_priority_to_yojson x.conflicting_priority));
       (
         "ViolationTargetDescription",
         (option_to_yojson length_bounded_string_to_yojson x.violation_target_description));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let dns_duplicate_rule_group_violation_to_yojson = 
  fun (x: dns_duplicate_rule_group_violation) -> assoc_to_yojson(
    [(
         "ViolationTargetDescription",
         (option_to_yojson length_bounded_string_to_yojson x.violation_target_description));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let basic_integer_to_yojson = int_to_yojson

let dns_rule_group_limit_exceeded_violation_to_yojson = 
  fun (x: dns_rule_group_limit_exceeded_violation) -> assoc_to_yojson(
    [(
         "NumberOfRuleGroupsAlreadyAssociated",
         (option_to_yojson basic_integer_to_yojson x.number_of_rule_groups_already_associated));
       (
         "ViolationTargetDescription",
         (option_to_yojson length_bounded_string_to_yojson x.violation_target_description));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let firewall_subnet_is_out_of_scope_violation_to_yojson = 
  fun (x: firewall_subnet_is_out_of_scope_violation) -> assoc_to_yojson(
    [(
         "VpcEndpointId",
         (option_to_yojson resource_id_to_yojson x.vpc_endpoint_id));
       (
         "SubnetAvailabilityZoneId",
         (option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone_id));
       (
         "SubnetAvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone));
       (
         "VpcId",
         (option_to_yojson resource_id_to_yojson x.vpc_id));
       (
         "FirewallSubnetId",
         (option_to_yojson resource_id_to_yojson x.firewall_subnet_id));
       
  ])

let route_has_out_of_scope_endpoint_violation_to_yojson = 
  fun (x: route_has_out_of_scope_endpoint_violation) -> assoc_to_yojson(
    [(
         "InternetGatewayRoutes",
         (option_to_yojson routes_to_yojson x.internet_gateway_routes));
       (
         "CurrentInternetGatewayRouteTable",
         (option_to_yojson resource_id_to_yojson x.current_internet_gateway_route_table));
       (
         "InternetGatewayId",
         (option_to_yojson resource_id_to_yojson x.internet_gateway_id));
       (
         "FirewallSubnetRoutes",
         (option_to_yojson routes_to_yojson x.firewall_subnet_routes));
       (
         "FirewallSubnetId",
         (option_to_yojson resource_id_to_yojson x.firewall_subnet_id));
       (
         "CurrentFirewallSubnetRouteTable",
         (option_to_yojson resource_id_to_yojson x.current_firewall_subnet_route_table));
       (
         "SubnetAvailabilityZoneId",
         (option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone_id));
       (
         "SubnetAvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone));
       (
         "ViolatingRoutes",
         (option_to_yojson routes_to_yojson x.violating_routes));
       (
         "RouteTableId",
         (option_to_yojson resource_id_to_yojson x.route_table_id));
       (
         "VpcId",
         (option_to_yojson resource_id_to_yojson x.vpc_id));
       (
         "SubnetId",
         (option_to_yojson resource_id_to_yojson x.subnet_id));
       
  ])

let third_party_firewall_missing_firewall_violation_to_yojson = 
  fun (x: third_party_firewall_missing_firewall_violation) -> assoc_to_yojson(
    [(
         "TargetViolationReason",
         (option_to_yojson target_violation_reason_to_yojson x.target_violation_reason));
       (
         "AvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.availability_zone));
       (
         "VPC",
         (option_to_yojson resource_id_to_yojson x.vp_c));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let third_party_firewall_missing_subnet_violation_to_yojson = 
  fun (x: third_party_firewall_missing_subnet_violation) -> assoc_to_yojson(
    [(
         "TargetViolationReason",
         (option_to_yojson target_violation_reason_to_yojson x.target_violation_reason));
       (
         "AvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.availability_zone));
       (
         "VPC",
         (option_to_yojson resource_id_to_yojson x.vp_c));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let third_party_firewall_missing_expected_route_table_violation_to_yojson = 
  fun (x: third_party_firewall_missing_expected_route_table_violation) -> assoc_to_yojson(
    [(
         "ExpectedRouteTable",
         (option_to_yojson resource_id_to_yojson x.expected_route_table));
       (
         "CurrentRouteTable",
         (option_to_yojson resource_id_to_yojson x.current_route_table));
       (
         "AvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.availability_zone));
       (
         "VPC",
         (option_to_yojson resource_id_to_yojson x.vp_c));
       (
         "ViolationTarget",
         (option_to_yojson violation_target_to_yojson x.violation_target));
       
  ])

let firewall_subnet_missing_vpc_endpoint_violation_to_yojson = 
  fun (x: firewall_subnet_missing_vpc_endpoint_violation) -> assoc_to_yojson(
    [(
         "SubnetAvailabilityZoneId",
         (option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone_id));
       (
         "SubnetAvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone));
       (
         "VpcId",
         (option_to_yojson resource_id_to_yojson x.vpc_id));
       (
         "FirewallSubnetId",
         (option_to_yojson resource_id_to_yojson x.firewall_subnet_id));
       
  ])

let integer_object_to_yojson = int_to_yojson

let network_acl_icmp_type_code_to_yojson = 
  fun (x: network_acl_icmp_type_code) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson integer_object_to_yojson x.type_));
       (
         "Code",
         (option_to_yojson integer_object_to_yojson x.code));
       
  ])

let ip_port_number_integer_to_yojson = int_to_yojson

let network_acl_port_range_to_yojson = 
  fun (x: network_acl_port_range) -> assoc_to_yojson(
    [(
         "To",
         (option_to_yojson ip_port_number_integer_to_yojson x.to_));
       (
         "From",
         (option_to_yojson ip_port_number_integer_to_yojson x.from_));
       
  ])

let length_bounded_non_empty_string_to_yojson = string_to_yojson

let network_acl_rule_action_to_yojson = 
  fun (x: network_acl_rule_action) -> match x with 
  | DENY -> `String "deny"
    | ALLOW -> `String "allow"
     

let boolean_object_to_yojson = bool_to_yojson

let network_acl_entry_to_yojson = 
  fun (x: network_acl_entry) -> assoc_to_yojson(
    [(
         "Egress",
         (Some (boolean_object_to_yojson x.egress)));
       (
         "RuleAction",
         (Some (network_acl_rule_action_to_yojson x.rule_action)));
       (
         "Ipv6CidrBlock",
         (option_to_yojson length_bounded_non_empty_string_to_yojson x.ipv6_cidr_block));
       (
         "CidrBlock",
         (option_to_yojson length_bounded_non_empty_string_to_yojson x.cidr_block));
       (
         "PortRange",
         (option_to_yojson network_acl_port_range_to_yojson x.port_range));
       (
         "Protocol",
         (Some (length_bounded_string_to_yojson x.protocol)));
       (
         "IcmpTypeCode",
         (option_to_yojson network_acl_icmp_type_code_to_yojson x.icmp_type_code));
       
  ])

let integer_object_minimum0_to_yojson = int_to_yojson

let entry_type_to_yojson = 
  fun (x: entry_type) -> match x with 
 
| CustomEntry -> `String "CUSTOM_ENTRY"
  | FMSManagedLastEntry -> `String "FMS_MANAGED_LAST_ENTRY"
  | FMSManagedFirstEntry -> `String "FMS_MANAGED_FIRST_ENTRY"
   

let entry_description_to_yojson = 
  fun (x: entry_description) -> assoc_to_yojson(
    [(
         "EntryType",
         (option_to_yojson entry_type_to_yojson x.entry_type));
       (
         "EntryRuleNumber",
         (option_to_yojson integer_object_minimum0_to_yojson x.entry_rule_number));
       (
         "EntryDetail",
         (option_to_yojson network_acl_entry_to_yojson x.entry_detail));
       
  ])

let entries_with_conflicts_to_yojson = 
  fun tree -> list_to_yojson entry_description_to_yojson tree

let entry_violation_reason_to_yojson = 
  fun (x: entry_violation_reason) -> match x with 
 
| EntryConflict -> `String "ENTRY_CONFLICT"
  | IncorrectEntryOrder -> `String "INCORRECT_ENTRY_ORDER"
  | MissingExpectedEntry -> `String "MISSING_EXPECTED_ENTRY"
   

let entry_violation_reasons_to_yojson = 
  fun tree -> list_to_yojson entry_violation_reason_to_yojson tree

let entry_violation_to_yojson = 
  fun (x: entry_violation) -> assoc_to_yojson(
    [(
         "EntryViolationReasons",
         (option_to_yojson entry_violation_reasons_to_yojson x.entry_violation_reasons));
       (
         "EntriesWithConflicts",
         (option_to_yojson entries_with_conflicts_to_yojson x.entries_with_conflicts));
       (
         "EntryAtExpectedEvaluationOrder",
         (option_to_yojson entry_description_to_yojson x.entry_at_expected_evaluation_order));
       (
         "ActualEvaluationOrder",
         (option_to_yojson length_bounded_string_to_yojson x.actual_evaluation_order));
       (
         "ExpectedEvaluationOrder",
         (option_to_yojson length_bounded_string_to_yojson x.expected_evaluation_order));
       (
         "ExpectedEntry",
         (option_to_yojson entry_description_to_yojson x.expected_entry));
       
  ])

let entry_violations_to_yojson = 
  fun tree -> list_to_yojson entry_violation_to_yojson tree

let invalid_network_acl_entries_violation_to_yojson = 
  fun (x: invalid_network_acl_entries_violation) -> assoc_to_yojson(
    [(
         "EntryViolations",
         (option_to_yojson entry_violations_to_yojson x.entry_violations));
       (
         "CurrentAssociatedNetworkAcl",
         (option_to_yojson resource_id_to_yojson x.current_associated_network_acl));
       (
         "SubnetAvailabilityZone",
         (option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone));
       (
         "Subnet",
         (option_to_yojson resource_id_to_yojson x.subnet));
       (
         "Vpc",
         (option_to_yojson resource_id_to_yojson x.vpc));
       
  ])

let action_target_to_yojson = 
  fun (x: action_target) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       (
         "ResourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       
  ])

let ec2_create_route_action_to_yojson = 
  fun (x: ec2_create_route_action) -> assoc_to_yojson(
    [(
         "RouteTableId",
         (Some (action_target_to_yojson x.route_table_id)));
       (
         "GatewayId",
         (option_to_yojson action_target_to_yojson x.gateway_id));
       (
         "VpcEndpointId",
         (option_to_yojson action_target_to_yojson x.vpc_endpoint_id));
       (
         "DestinationIpv6CidrBlock",
         (option_to_yojson cid_r_to_yojson x.destination_ipv6_cidr_block));
       (
         "DestinationPrefixListId",
         (option_to_yojson resource_id_to_yojson x.destination_prefix_list_id));
       (
         "DestinationCidrBlock",
         (option_to_yojson cid_r_to_yojson x.destination_cidr_block));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let ec2_replace_route_action_to_yojson = 
  fun (x: ec2_replace_route_action) -> assoc_to_yojson(
    [(
         "RouteTableId",
         (Some (action_target_to_yojson x.route_table_id)));
       (
         "GatewayId",
         (option_to_yojson action_target_to_yojson x.gateway_id));
       (
         "DestinationIpv6CidrBlock",
         (option_to_yojson cid_r_to_yojson x.destination_ipv6_cidr_block));
       (
         "DestinationPrefixListId",
         (option_to_yojson resource_id_to_yojson x.destination_prefix_list_id));
       (
         "DestinationCidrBlock",
         (option_to_yojson cid_r_to_yojson x.destination_cidr_block));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let ec2_delete_route_action_to_yojson = 
  fun (x: ec2_delete_route_action) -> assoc_to_yojson(
    [(
         "RouteTableId",
         (Some (action_target_to_yojson x.route_table_id)));
       (
         "DestinationIpv6CidrBlock",
         (option_to_yojson cid_r_to_yojson x.destination_ipv6_cidr_block));
       (
         "DestinationPrefixListId",
         (option_to_yojson resource_id_to_yojson x.destination_prefix_list_id));
       (
         "DestinationCidrBlock",
         (option_to_yojson cid_r_to_yojson x.destination_cidr_block));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let ec2_copy_route_table_action_to_yojson = 
  fun (x: ec2_copy_route_table_action) -> assoc_to_yojson(
    [(
         "RouteTableId",
         (Some (action_target_to_yojson x.route_table_id)));
       (
         "VpcId",
         (Some (action_target_to_yojson x.vpc_id)));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let ec2_replace_route_table_association_action_to_yojson = 
  fun (x: ec2_replace_route_table_association_action) -> assoc_to_yojson(
    [(
         "RouteTableId",
         (Some (action_target_to_yojson x.route_table_id)));
       (
         "AssociationId",
         (Some (action_target_to_yojson x.association_id)));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let ec2_associate_route_table_action_to_yojson = 
  fun (x: ec2_associate_route_table_action) -> assoc_to_yojson(
    [(
         "GatewayId",
         (option_to_yojson action_target_to_yojson x.gateway_id));
       (
         "SubnetId",
         (option_to_yojson action_target_to_yojson x.subnet_id));
       (
         "RouteTableId",
         (Some (action_target_to_yojson x.route_table_id)));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let ec2_create_route_table_action_to_yojson = 
  fun (x: ec2_create_route_table_action) -> assoc_to_yojson(
    [(
         "VpcId",
         (Some (action_target_to_yojson x.vpc_id)));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let managed_service_data_to_yojson = string_to_yojson

let fms_policy_update_firewall_creation_config_action_to_yojson = 
  fun (x: fms_policy_update_firewall_creation_config_action) -> assoc_to_yojson(
    [(
         "FirewallCreationConfig",
         (option_to_yojson managed_service_data_to_yojson x.firewall_creation_config));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let create_network_acl_action_to_yojson = 
  fun (x: create_network_acl_action) -> assoc_to_yojson(
    [(
         "FMSCanRemediate",
         (option_to_yojson boolean__to_yojson x.fms_can_remediate));
       (
         "Vpc",
         (option_to_yojson action_target_to_yojson x.vpc));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let replace_network_acl_association_action_to_yojson = 
  fun (x: replace_network_acl_association_action) -> assoc_to_yojson(
    [(
         "FMSCanRemediate",
         (option_to_yojson boolean__to_yojson x.fms_can_remediate));
       (
         "NetworkAclId",
         (option_to_yojson action_target_to_yojson x.network_acl_id));
       (
         "AssociationId",
         (option_to_yojson action_target_to_yojson x.association_id));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let entries_description_to_yojson = 
  fun tree -> list_to_yojson entry_description_to_yojson tree

let create_network_acl_entries_action_to_yojson = 
  fun (x: create_network_acl_entries_action) -> assoc_to_yojson(
    [(
         "FMSCanRemediate",
         (option_to_yojson boolean__to_yojson x.fms_can_remediate));
       (
         "NetworkAclEntriesToBeCreated",
         (option_to_yojson entries_description_to_yojson x.network_acl_entries_to_be_created));
       (
         "NetworkAclId",
         (option_to_yojson action_target_to_yojson x.network_acl_id));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let delete_network_acl_entries_action_to_yojson = 
  fun (x: delete_network_acl_entries_action) -> assoc_to_yojson(
    [(
         "FMSCanRemediate",
         (option_to_yojson boolean__to_yojson x.fms_can_remediate));
       (
         "NetworkAclEntriesToBeDeleted",
         (option_to_yojson entries_description_to_yojson x.network_acl_entries_to_be_deleted));
       (
         "NetworkAclId",
         (option_to_yojson action_target_to_yojson x.network_acl_id));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let remediation_action_to_yojson = 
  fun (x: remediation_action) -> assoc_to_yojson(
    [(
         "DeleteNetworkAclEntriesAction",
         (option_to_yojson delete_network_acl_entries_action_to_yojson x.delete_network_acl_entries_action));
       (
         "CreateNetworkAclEntriesAction",
         (option_to_yojson create_network_acl_entries_action_to_yojson x.create_network_acl_entries_action));
       (
         "ReplaceNetworkAclAssociationAction",
         (option_to_yojson replace_network_acl_association_action_to_yojson x.replace_network_acl_association_action));
       (
         "CreateNetworkAclAction",
         (option_to_yojson create_network_acl_action_to_yojson x.create_network_acl_action));
       (
         "FMSPolicyUpdateFirewallCreationConfigAction",
         (option_to_yojson fms_policy_update_firewall_creation_config_action_to_yojson x.fms_policy_update_firewall_creation_config_action));
       (
         "EC2CreateRouteTableAction",
         (option_to_yojson ec2_create_route_table_action_to_yojson x.ec2_create_route_table_action));
       (
         "EC2AssociateRouteTableAction",
         (option_to_yojson ec2_associate_route_table_action_to_yojson x.ec2_associate_route_table_action));
       (
         "EC2ReplaceRouteTableAssociationAction",
         (option_to_yojson ec2_replace_route_table_association_action_to_yojson x.ec2_replace_route_table_association_action));
       (
         "EC2CopyRouteTableAction",
         (option_to_yojson ec2_copy_route_table_action_to_yojson x.ec2_copy_route_table_action));
       (
         "EC2DeleteRouteAction",
         (option_to_yojson ec2_delete_route_action_to_yojson x.ec2_delete_route_action));
       (
         "EC2ReplaceRouteAction",
         (option_to_yojson ec2_replace_route_action_to_yojson x.ec2_replace_route_action));
       (
         "EC2CreateRouteAction",
         (option_to_yojson ec2_create_route_action_to_yojson x.ec2_create_route_action));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let remediation_action_with_order_to_yojson = 
  fun (x: remediation_action_with_order) -> assoc_to_yojson(
    [(
         "Order",
         (option_to_yojson basic_integer_to_yojson x.order));
       (
         "RemediationAction",
         (option_to_yojson remediation_action_to_yojson x.remediation_action));
       
  ])

let ordered_remediation_actions_to_yojson = 
  fun tree -> list_to_yojson remediation_action_with_order_to_yojson tree

let possible_remediation_action_to_yojson = 
  fun (x: possible_remediation_action) -> assoc_to_yojson(
    [(
         "IsDefaultAction",
         (option_to_yojson boolean__to_yojson x.is_default_action));
       (
         "OrderedRemediationActions",
         (Some (ordered_remediation_actions_to_yojson x.ordered_remediation_actions)));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let possible_remediation_action_list_to_yojson = 
  fun tree -> list_to_yojson possible_remediation_action_to_yojson tree

let possible_remediation_actions_to_yojson = 
  fun (x: possible_remediation_actions) -> assoc_to_yojson(
    [(
         "Actions",
         (option_to_yojson possible_remediation_action_list_to_yojson x.actions));
       (
         "Description",
         (option_to_yojson length_bounded_string_to_yojson x.description));
       
  ])

let resource_violation_to_yojson = 
  fun (x: resource_violation) -> assoc_to_yojson(
    [(
         "PossibleRemediationActions",
         (option_to_yojson possible_remediation_actions_to_yojson x.possible_remediation_actions));
       (
         "InvalidNetworkAclEntriesViolation",
         (option_to_yojson invalid_network_acl_entries_violation_to_yojson x.invalid_network_acl_entries_violation));
       (
         "FirewallSubnetMissingVPCEndpointViolation",
         (option_to_yojson firewall_subnet_missing_vpc_endpoint_violation_to_yojson x.firewall_subnet_missing_vpc_endpoint_violation));
       (
         "ThirdPartyFirewallMissingExpectedRouteTableViolation",
         (option_to_yojson third_party_firewall_missing_expected_route_table_violation_to_yojson x.third_party_firewall_missing_expected_route_table_violation));
       (
         "ThirdPartyFirewallMissingSubnetViolation",
         (option_to_yojson third_party_firewall_missing_subnet_violation_to_yojson x.third_party_firewall_missing_subnet_violation));
       (
         "ThirdPartyFirewallMissingFirewallViolation",
         (option_to_yojson third_party_firewall_missing_firewall_violation_to_yojson x.third_party_firewall_missing_firewall_violation));
       (
         "RouteHasOutOfScopeEndpointViolation",
         (option_to_yojson route_has_out_of_scope_endpoint_violation_to_yojson x.route_has_out_of_scope_endpoint_violation));
       (
         "FirewallSubnetIsOutOfScopeViolation",
         (option_to_yojson firewall_subnet_is_out_of_scope_violation_to_yojson x.firewall_subnet_is_out_of_scope_violation));
       (
         "DnsRuleGroupLimitExceededViolation",
         (option_to_yojson dns_rule_group_limit_exceeded_violation_to_yojson x.dns_rule_group_limit_exceeded_violation));
       (
         "DnsDuplicateRuleGroupViolation",
         (option_to_yojson dns_duplicate_rule_group_violation_to_yojson x.dns_duplicate_rule_group_violation));
       (
         "DnsRuleGroupPriorityConflictViolation",
         (option_to_yojson dns_rule_group_priority_conflict_violation_to_yojson x.dns_rule_group_priority_conflict_violation));
       (
         "NetworkFirewallMissingExpectedRoutesViolation",
         (option_to_yojson network_firewall_missing_expected_routes_violation_to_yojson x.network_firewall_missing_expected_routes_violation));
       (
         "NetworkFirewallUnexpectedGatewayRoutesViolation",
         (option_to_yojson network_firewall_unexpected_gateway_routes_violation_to_yojson x.network_firewall_unexpected_gateway_routes_violation));
       (
         "NetworkFirewallUnexpectedFirewallRoutesViolation",
         (option_to_yojson network_firewall_unexpected_firewall_routes_violation_to_yojson x.network_firewall_unexpected_firewall_routes_violation));
       (
         "NetworkFirewallBlackHoleRouteDetectedViolation",
         (option_to_yojson network_firewall_black_hole_route_detected_violation_to_yojson x.network_firewall_black_hole_route_detected_violation));
       (
         "NetworkFirewallInvalidRouteConfigurationViolation",
         (option_to_yojson network_firewall_invalid_route_configuration_violation_to_yojson x.network_firewall_invalid_route_configuration_violation));
       (
         "NetworkFirewallInternetTrafficNotInspectedViolation",
         (option_to_yojson network_firewall_internet_traffic_not_inspected_violation_to_yojson x.network_firewall_internet_traffic_not_inspected_violation));
       (
         "NetworkFirewallPolicyModifiedViolation",
         (option_to_yojson network_firewall_policy_modified_violation_to_yojson x.network_firewall_policy_modified_violation));
       (
         "NetworkFirewallMissingExpectedRTViolation",
         (option_to_yojson network_firewall_missing_expected_rt_violation_to_yojson x.network_firewall_missing_expected_rt_violation));
       (
         "NetworkFirewallMissingSubnetViolation",
         (option_to_yojson network_firewall_missing_subnet_violation_to_yojson x.network_firewall_missing_subnet_violation));
       (
         "NetworkFirewallMissingFirewallViolation",
         (option_to_yojson network_firewall_missing_firewall_violation_to_yojson x.network_firewall_missing_firewall_violation));
       (
         "AwsEc2InstanceViolation",
         (option_to_yojson aws_ec2_instance_violation_to_yojson x.aws_ec2_instance_violation));
       (
         "AwsEc2NetworkInterfaceViolation",
         (option_to_yojson aws_ec2_network_interface_violation_to_yojson x.aws_ec2_network_interface_violation));
       (
         "AwsVPCSecurityGroupViolation",
         (option_to_yojson aws_vpc_security_group_violation_to_yojson x.aws_vpc_security_group_violation));
       
  ])

let resource_violations_to_yojson = 
  fun tree -> list_to_yojson resource_violation_to_yojson tree

let tag_key_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (Some (tag_value_to_yojson x.value)));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let violation_detail_to_yojson = 
  fun (x: violation_detail) -> assoc_to_yojson(
    [(
         "ResourceDescription",
         (option_to_yojson length_bounded_string_to_yojson x.resource_description));
       (
         "ResourceTags",
         (option_to_yojson tag_list_to_yojson x.resource_tags));
       (
         "ResourceViolations",
         (Some (resource_violations_to_yojson x.resource_violations)));
       (
         "ResourceType",
         (Some (resource_type_to_yojson x.resource_type)));
       (
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       (
         "MemberAccount",
         (Some (aws_account_id_to_yojson x.member_account)));
       (
         "PolicyId",
         (Some (policy_id_to_yojson x.policy_id)));
       
  ])

let update_token_to_yojson = string_to_yojson

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let resource_arn_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_operation_exception_to_yojson = 
  fun (x: invalid_operation_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_input_exception_to_yojson = 
  fun (x: invalid_input_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let internal_error_exception_to_yojson = 
  fun (x: internal_error_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let time_stamp_to_yojson = timestamp_to_yojson

let firewall_deployment_model_to_yojson = 
  fun (x: firewall_deployment_model) -> match x with 
 
| DISTRIBUTED -> `String "DISTRIBUTED"
  | CENTRALIZED -> `String "CENTRALIZED"
   

let third_party_firewall_policy_to_yojson = 
  fun (x: third_party_firewall_policy) -> assoc_to_yojson(
    [(
         "FirewallDeploymentModel",
         (option_to_yojson firewall_deployment_model_to_yojson x.firewall_deployment_model));
       
  ])

let firewall_policy_id_to_yojson = string_to_yojson

let firewall_policy_name_to_yojson = string_to_yojson

let third_party_firewall_firewall_policy_to_yojson = 
  fun (x: third_party_firewall_firewall_policy) -> assoc_to_yojson(
    [(
         "FirewallPolicyName",
         (option_to_yojson firewall_policy_name_to_yojson x.firewall_policy_name));
       (
         "FirewallPolicyId",
         (option_to_yojson firewall_policy_id_to_yojson x.firewall_policy_id));
       
  ])

let third_party_firewall_firewall_policies_to_yojson = 
  fun tree -> list_to_yojson third_party_firewall_firewall_policy_to_yojson tree

let third_party_firewall_association_status_to_yojson = 
  fun (x: third_party_firewall_association_status) -> match x with 
 
| NOT_EXIST -> `String "NOT_EXIST"
  | OFFBOARD_COMPLETE -> `String "OFFBOARD_COMPLETE"
  | OFFBOARDING -> `String "OFFBOARDING"
  | ONBOARD_COMPLETE -> `String "ONBOARD_COMPLETE"
  | ONBOARDING -> `String "ONBOARDING"
   

let third_party_firewall_to_yojson = 
  fun (x: third_party_firewall) -> match x with 
 
| FORTIGATE_CLOUD_NATIVE_FIREWALL -> `String "FORTIGATE_CLOUD_NATIVE_FIREWALL"
  | PALO_ALTO_NETWORKS_CLOUD_NGFW -> `String "PALO_ALTO_NETWORKS_CLOUD_NGFW"
   

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "TagList",
         (Some (tag_list_to_yojson x.tag_list)));
       (
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let security_service_type_to_yojson = 
  fun (x: security_service_type) -> match x with 
 
| NETWORK_ACL_COMMON -> `String "NETWORK_ACL_COMMON"
  | IMPORT_NETWORK_FIREWALL -> `String "IMPORT_NETWORK_FIREWALL"
  | THIRD_PARTY_FIREWALL -> `String "THIRD_PARTY_FIREWALL"
  | DNS_FIREWALL -> `String "DNS_FIREWALL"
  | NETWORK_FIREWALL -> `String "NETWORK_FIREWALL"
  | SECURITY_GROUPS_USAGE_AUDIT -> `String "SECURITY_GROUPS_USAGE_AUDIT"
  | SECURITY_GROUPS_CONTENT_AUDIT -> `String "SECURITY_GROUPS_CONTENT_AUDIT"
  | SECURITY_GROUPS_COMMON -> `String "SECURITY_GROUPS_COMMON"
  | SHIELD_ADVANCED -> `String "SHIELD_ADVANCED"
  | WAFV2 -> `String "WAFV2"
  | WAF -> `String "WAF"
   

let security_service_type_list_to_yojson = 
  fun tree -> list_to_yojson security_service_type_to_yojson tree

let network_firewall_policy_to_yojson = 
  fun (x: network_firewall_policy) -> assoc_to_yojson(
    [(
         "FirewallDeploymentModel",
         (option_to_yojson firewall_deployment_model_to_yojson x.firewall_deployment_model));
       
  ])

let network_acl_entries_to_yojson = 
  fun tree -> list_to_yojson network_acl_entry_to_yojson tree

let network_acl_entry_set_to_yojson = 
  fun (x: network_acl_entry_set) -> assoc_to_yojson(
    [(
         "ForceRemediateForLastEntries",
         (Some (boolean_object_to_yojson x.force_remediate_for_last_entries)));
       (
         "LastEntries",
         (option_to_yojson network_acl_entries_to_yojson x.last_entries));
       (
         "ForceRemediateForFirstEntries",
         (Some (boolean_object_to_yojson x.force_remediate_for_first_entries)));
       (
         "FirstEntries",
         (option_to_yojson network_acl_entries_to_yojson x.first_entries));
       
  ])

let network_acl_common_policy_to_yojson = 
  fun (x: network_acl_common_policy) -> assoc_to_yojson(
    [(
         "NetworkAclEntrySet",
         (Some (network_acl_entry_set_to_yojson x.network_acl_entry_set)));
       
  ])

let policy_option_to_yojson = 
  fun (x: policy_option) -> assoc_to_yojson(
    [(
         "NetworkAclCommonPolicy",
         (option_to_yojson network_acl_common_policy_to_yojson x.network_acl_common_policy));
       (
         "ThirdPartyFirewallPolicy",
         (option_to_yojson third_party_firewall_policy_to_yojson x.third_party_firewall_policy));
       (
         "NetworkFirewallPolicy",
         (option_to_yojson network_firewall_policy_to_yojson x.network_firewall_policy));
       
  ])

let security_service_policy_data_to_yojson = 
  fun (x: security_service_policy_data) -> assoc_to_yojson(
    [(
         "PolicyOption",
         (option_to_yojson policy_option_to_yojson x.policy_option));
       (
         "ManagedServiceData",
         (option_to_yojson managed_service_data_to_yojson x.managed_service_data));
       (
         "Type",
         (Some (security_service_type_to_yojson x.type_)));
       
  ])

let resource_type_list_to_yojson = 
  fun tree -> list_to_yojson resource_type_to_yojson tree

let resource_tag_key_to_yojson = string_to_yojson

let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson = 
  fun (x: resource_tag) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson resource_tag_value_to_yojson x.value));
       (
         "Key",
         (Some (resource_tag_key_to_yojson x.key)));
       
  ])

let resource_tags_to_yojson = 
  fun tree -> list_to_yojson resource_tag_to_yojson tree

let base62_id_to_yojson = string_to_yojson

let name_to_yojson = string_to_yojson

let description_to_yojson = string_to_yojson

let resource_set_status_to_yojson = 
  fun (x: resource_set_status) -> match x with 
 
| OUT_OF_ADMIN_SCOPE -> `String "OUT_OF_ADMIN_SCOPE"
  | ACTIVE -> `String "ACTIVE"
   

let resource_set_summary_to_yojson = 
  fun (x: resource_set_summary) -> assoc_to_yojson(
    [(
         "ResourceSetStatus",
         (option_to_yojson resource_set_status_to_yojson x.resource_set_status));
       (
         "LastUpdateTime",
         (option_to_yojson time_stamp_to_yojson x.last_update_time));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson name_to_yojson x.name));
       (
         "Id",
         (option_to_yojson base62_id_to_yojson x.id));
       
  ])

let resource_set_summary_list_to_yojson = 
  fun tree -> list_to_yojson resource_set_summary_to_yojson tree

let resource_set_ids_to_yojson = 
  fun tree -> list_to_yojson base62_id_to_yojson tree

let resource_set_to_yojson = 
  fun (x: resource_set) -> assoc_to_yojson(
    [(
         "ResourceSetStatus",
         (option_to_yojson resource_set_status_to_yojson x.resource_set_status));
       (
         "LastUpdateTime",
         (option_to_yojson time_stamp_to_yojson x.last_update_time));
       (
         "ResourceTypeList",
         (Some (resource_type_list_to_yojson x.resource_type_list)));
       (
         "UpdateToken",
         (option_to_yojson update_token_to_yojson x.update_token));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (Some (name_to_yojson x.name)));
       (
         "Id",
         (option_to_yojson base62_id_to_yojson x.id));
       
  ])

let resource_name_to_yojson = string_to_yojson

let identifier_to_yojson = string_to_yojson

let resource_to_yojson = 
  fun (x: resource) -> assoc_to_yojson(
    [(
         "AccountId",
         (option_to_yojson aws_account_id_to_yojson x.account_id));
       (
         "URI",
         (Some (identifier_to_yojson x.ur_i)));
       
  ])

let resource_list_to_yojson = 
  fun tree -> list_to_yojson resource_to_yojson tree

let resource_description_to_yojson = string_to_yojson

let resource_count_to_yojson = long_to_yojson

let aws_region_to_yojson = string_to_yojson

let aws_region_list_to_yojson = 
  fun tree -> list_to_yojson aws_region_to_yojson tree

let region_scope_to_yojson = 
  fun (x: region_scope) -> assoc_to_yojson(
    [(
         "AllRegionsEnabled",
         (option_to_yojson boolean__to_yojson x.all_regions_enabled));
       (
         "Regions",
         (option_to_yojson aws_region_list_to_yojson x.regions));
       
  ])

let put_resource_set_response_to_yojson = 
  fun (x: put_resource_set_response) -> assoc_to_yojson(
    [(
         "ResourceSetArn",
         (Some (resource_arn_to_yojson x.resource_set_arn)));
       (
         "ResourceSet",
         (Some (resource_set_to_yojson x.resource_set)));
       
  ])

let put_resource_set_request_to_yojson = 
  fun (x: put_resource_set_request) -> assoc_to_yojson(
    [(
         "TagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "ResourceSet",
         (Some (resource_set_to_yojson x.resource_set)));
       
  ])

let list_id_to_yojson = string_to_yojson

let protocol_to_yojson = string_to_yojson

let protocols_list_to_yojson = 
  fun tree -> list_to_yojson protocol_to_yojson tree

let previous_list_version_to_yojson = string_to_yojson

let previous_protocols_list_to_yojson = 
  fun tree -> map_to_yojson protocols_list_to_yojson tree

let protocols_list_data_to_yojson = 
  fun (x: protocols_list_data) -> assoc_to_yojson(
    [(
         "PreviousProtocolsList",
         (option_to_yojson previous_protocols_list_to_yojson x.previous_protocols_list));
       (
         "ProtocolsList",
         (Some (protocols_list_to_yojson x.protocols_list)));
       (
         "LastUpdateTime",
         (option_to_yojson time_stamp_to_yojson x.last_update_time));
       (
         "CreateTime",
         (option_to_yojson time_stamp_to_yojson x.create_time));
       (
         "ListUpdateToken",
         (option_to_yojson update_token_to_yojson x.list_update_token));
       (
         "ListName",
         (Some (resource_name_to_yojson x.list_name)));
       (
         "ListId",
         (option_to_yojson list_id_to_yojson x.list_id));
       
  ])

let put_protocols_list_response_to_yojson = 
  fun (x: put_protocols_list_response) -> assoc_to_yojson(
    [(
         "ProtocolsListArn",
         (option_to_yojson resource_arn_to_yojson x.protocols_list_arn));
       (
         "ProtocolsList",
         (option_to_yojson protocols_list_data_to_yojson x.protocols_list));
       
  ])

let put_protocols_list_request_to_yojson = 
  fun (x: put_protocols_list_request) -> assoc_to_yojson(
    [(
         "TagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "ProtocolsList",
         (Some (protocols_list_data_to_yojson x.protocols_list)));
       
  ])

let policy_update_token_to_yojson = string_to_yojson

let customer_policy_scope_id_to_yojson = string_to_yojson

let customer_policy_scope_id_list_to_yojson = 
  fun tree -> list_to_yojson customer_policy_scope_id_to_yojson tree

let customer_policy_scope_id_type_to_yojson = 
  fun (x: customer_policy_scope_id_type) -> match x with 
  | ORG_UNIT -> `String "ORG_UNIT"
    | ACCOUNT -> `String "ACCOUNT"
     

let customer_policy_scope_map_to_yojson = 
  fun tree -> map_to_yojson customer_policy_scope_id_list_to_yojson tree

let customer_policy_status_to_yojson = 
  fun (x: customer_policy_status) -> match x with 
 
| OUT_OF_ADMIN_SCOPE -> `String "OUT_OF_ADMIN_SCOPE"
  | ACTIVE -> `String "ACTIVE"
   

let policy_to_yojson = 
  fun (x: policy) -> assoc_to_yojson(
    [(
         "PolicyStatus",
         (option_to_yojson customer_policy_status_to_yojson x.policy_status));
       (
         "PolicyDescription",
         (option_to_yojson resource_description_to_yojson x.policy_description));
       (
         "ResourceSetIds",
         (option_to_yojson resource_set_ids_to_yojson x.resource_set_ids));
       (
         "ExcludeMap",
         (option_to_yojson customer_policy_scope_map_to_yojson x.exclude_map));
       (
         "IncludeMap",
         (option_to_yojson customer_policy_scope_map_to_yojson x.include_map));
       (
         "DeleteUnusedFMManagedResources",
         (option_to_yojson boolean__to_yojson x.delete_unused_fm_managed_resources));
       (
         "RemediationEnabled",
         (Some (boolean__to_yojson x.remediation_enabled)));
       (
         "ExcludeResourceTags",
         (Some (boolean__to_yojson x.exclude_resource_tags)));
       (
         "ResourceTags",
         (option_to_yojson resource_tags_to_yojson x.resource_tags));
       (
         "ResourceTypeList",
         (option_to_yojson resource_type_list_to_yojson x.resource_type_list));
       (
         "ResourceType",
         (Some (resource_type_to_yojson x.resource_type)));
       (
         "SecurityServicePolicyData",
         (Some (security_service_policy_data_to_yojson x.security_service_policy_data)));
       (
         "PolicyUpdateToken",
         (option_to_yojson policy_update_token_to_yojson x.policy_update_token));
       (
         "PolicyName",
         (Some (resource_name_to_yojson x.policy_name)));
       (
         "PolicyId",
         (option_to_yojson policy_id_to_yojson x.policy_id));
       
  ])

let put_policy_response_to_yojson = 
  fun (x: put_policy_response) -> assoc_to_yojson(
    [(
         "PolicyArn",
         (option_to_yojson resource_arn_to_yojson x.policy_arn));
       (
         "Policy",
         (option_to_yojson policy_to_yojson x.policy));
       
  ])

let put_policy_request_to_yojson = 
  fun (x: put_policy_request) -> assoc_to_yojson(
    [(
         "TagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "Policy",
         (Some (policy_to_yojson x.policy)));
       
  ])

let invalid_type_exception_to_yojson = 
  fun (x: invalid_type_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let put_notification_channel_request_to_yojson = 
  fun (x: put_notification_channel_request) -> assoc_to_yojson(
    [(
         "SnsRoleName",
         (Some (resource_arn_to_yojson x.sns_role_name)));
       (
         "SnsTopicArn",
         (Some (resource_arn_to_yojson x.sns_topic_arn)));
       
  ])

let app_to_yojson = 
  fun (x: app) -> assoc_to_yojson(
    [(
         "Port",
         (Some (ip_port_number_to_yojson x.port)));
       (
         "Protocol",
         (Some (protocol_to_yojson x.protocol)));
       (
         "AppName",
         (Some (resource_name_to_yojson x.app_name)));
       
  ])

let apps_list_to_yojson = fun tree -> list_to_yojson app_to_yojson tree

let previous_apps_list_to_yojson = 
  fun tree -> map_to_yojson apps_list_to_yojson tree

let apps_list_data_to_yojson = 
  fun (x: apps_list_data) -> assoc_to_yojson(
    [(
         "PreviousAppsList",
         (option_to_yojson previous_apps_list_to_yojson x.previous_apps_list));
       (
         "AppsList",
         (Some (apps_list_to_yojson x.apps_list)));
       (
         "LastUpdateTime",
         (option_to_yojson time_stamp_to_yojson x.last_update_time));
       (
         "CreateTime",
         (option_to_yojson time_stamp_to_yojson x.create_time));
       (
         "ListUpdateToken",
         (option_to_yojson update_token_to_yojson x.list_update_token));
       (
         "ListName",
         (Some (resource_name_to_yojson x.list_name)));
       (
         "ListId",
         (option_to_yojson list_id_to_yojson x.list_id));
       
  ])

let put_apps_list_response_to_yojson = 
  fun (x: put_apps_list_response) -> assoc_to_yojson(
    [(
         "AppsListArn",
         (option_to_yojson resource_arn_to_yojson x.apps_list_arn));
       (
         "AppsList",
         (option_to_yojson apps_list_data_to_yojson x.apps_list));
       
  ])

let put_apps_list_request_to_yojson = 
  fun (x: put_apps_list_request) -> assoc_to_yojson(
    [(
         "TagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "AppsList",
         (Some (apps_list_data_to_yojson x.apps_list)));
       
  ])

let account_id_list_to_yojson = 
  fun tree -> list_to_yojson aws_account_id_to_yojson tree

let account_scope_to_yojson = 
  fun (x: account_scope) -> assoc_to_yojson(
    [(
         "ExcludeSpecifiedAccounts",
         (option_to_yojson boolean__to_yojson x.exclude_specified_accounts));
       (
         "AllAccountsEnabled",
         (option_to_yojson boolean__to_yojson x.all_accounts_enabled));
       (
         "Accounts",
         (option_to_yojson account_id_list_to_yojson x.accounts));
       
  ])

let organizational_unit_id_to_yojson = string_to_yojson

let organizational_unit_id_list_to_yojson = 
  fun tree -> list_to_yojson organizational_unit_id_to_yojson tree

let organizational_unit_scope_to_yojson = 
  fun (x: organizational_unit_scope) -> assoc_to_yojson(
    [(
         "ExcludeSpecifiedOrganizationalUnits",
         (option_to_yojson boolean__to_yojson x.exclude_specified_organizational_units));
       (
         "AllOrganizationalUnitsEnabled",
         (option_to_yojson boolean__to_yojson x.all_organizational_units_enabled));
       (
         "OrganizationalUnits",
         (option_to_yojson organizational_unit_id_list_to_yojson x.organizational_units));
       
  ])

let policy_type_scope_to_yojson = 
  fun (x: policy_type_scope) -> assoc_to_yojson(
    [(
         "AllPolicyTypesEnabled",
         (option_to_yojson boolean__to_yojson x.all_policy_types_enabled));
       (
         "PolicyTypes",
         (option_to_yojson security_service_type_list_to_yojson x.policy_types));
       
  ])

let admin_scope_to_yojson = 
  fun (x: admin_scope) -> assoc_to_yojson(
    [(
         "PolicyTypeScope",
         (option_to_yojson policy_type_scope_to_yojson x.policy_type_scope));
       (
         "RegionScope",
         (option_to_yojson region_scope_to_yojson x.region_scope));
       (
         "OrganizationalUnitScope",
         (option_to_yojson organizational_unit_scope_to_yojson x.organizational_unit_scope));
       (
         "AccountScope",
         (option_to_yojson account_scope_to_yojson x.account_scope));
       
  ])

let put_admin_account_request_to_yojson = 
  fun (x: put_admin_account_request) -> assoc_to_yojson(
    [(
         "AdminScope",
         (option_to_yojson admin_scope_to_yojson x.admin_scope));
       (
         "AdminAccount",
         (Some (aws_account_id_to_yojson x.admin_account)));
       
  ])

let protocols_list_data_summary_to_yojson = 
  fun (x: protocols_list_data_summary) -> assoc_to_yojson(
    [(
         "ProtocolsList",
         (option_to_yojson protocols_list_to_yojson x.protocols_list));
       (
         "ListName",
         (option_to_yojson resource_name_to_yojson x.list_name));
       (
         "ListId",
         (option_to_yojson list_id_to_yojson x.list_id));
       (
         "ListArn",
         (option_to_yojson resource_arn_to_yojson x.list_arn));
       
  ])

let protocols_lists_data_to_yojson = 
  fun tree -> list_to_yojson protocols_list_data_summary_to_yojson tree

let protection_data_to_yojson = string_to_yojson

let policy_summary_to_yojson = 
  fun (x: policy_summary) -> assoc_to_yojson(
    [(
         "PolicyStatus",
         (option_to_yojson customer_policy_status_to_yojson x.policy_status));
       (
         "DeleteUnusedFMManagedResources",
         (option_to_yojson boolean__to_yojson x.delete_unused_fm_managed_resources));
       (
         "RemediationEnabled",
         (option_to_yojson boolean__to_yojson x.remediation_enabled));
       (
         "SecurityServiceType",
         (option_to_yojson security_service_type_to_yojson x.security_service_type));
       (
         "ResourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "PolicyName",
         (option_to_yojson resource_name_to_yojson x.policy_name));
       (
         "PolicyId",
         (option_to_yojson policy_id_to_yojson x.policy_id));
       (
         "PolicyArn",
         (option_to_yojson resource_arn_to_yojson x.policy_arn));
       
  ])

let policy_summary_list_to_yojson = 
  fun tree -> list_to_yojson policy_summary_to_yojson tree

let policy_compliance_status_type_to_yojson = 
  fun (x: policy_compliance_status_type) -> match x with 
 
| NonCompliant -> `String "NON_COMPLIANT"
  | Compliant -> `String "COMPLIANT"
   

let evaluation_result_to_yojson = 
  fun (x: evaluation_result) -> assoc_to_yojson(
    [(
         "EvaluationLimitExceeded",
         (option_to_yojson boolean__to_yojson x.evaluation_limit_exceeded));
       (
         "ViolatorCount",
         (option_to_yojson resource_count_to_yojson x.violator_count));
       (
         "ComplianceStatus",
         (option_to_yojson policy_compliance_status_type_to_yojson x.compliance_status));
       
  ])

let evaluation_results_to_yojson = 
  fun tree -> list_to_yojson evaluation_result_to_yojson tree

let detailed_info_to_yojson = string_to_yojson

let dependent_service_name_to_yojson = 
  fun (x: dependent_service_name) -> match x with 
 
| AWSVirtualPrivateCloud -> `String "AWSVPC"
  | AWSShieldAdvanced -> `String "AWSSHIELD_ADVANCED"
  | AWSWAF -> `String "AWSWAF"
  | AWSConfig -> `String "AWSCONFIG"
   

let issue_info_map_to_yojson = 
  fun tree -> map_to_yojson detailed_info_to_yojson tree

let policy_compliance_status_to_yojson = 
  fun (x: policy_compliance_status) -> assoc_to_yojson(
    [(
         "IssueInfoMap",
         (option_to_yojson issue_info_map_to_yojson x.issue_info_map));
       (
         "LastUpdated",
         (option_to_yojson time_stamp_to_yojson x.last_updated));
       (
         "EvaluationResults",
         (option_to_yojson evaluation_results_to_yojson x.evaluation_results));
       (
         "MemberAccount",
         (option_to_yojson aws_account_id_to_yojson x.member_account));
       (
         "PolicyName",
         (option_to_yojson resource_name_to_yojson x.policy_name));
       (
         "PolicyId",
         (option_to_yojson policy_id_to_yojson x.policy_id));
       (
         "PolicyOwner",
         (option_to_yojson aws_account_id_to_yojson x.policy_owner));
       
  ])

let policy_compliance_status_list_to_yojson = 
  fun tree -> list_to_yojson policy_compliance_status_to_yojson tree

let compliance_violator_metadata_to_yojson = 
  fun tree -> map_to_yojson length_bounded_string_to_yojson tree

let compliance_violator_to_yojson = 
  fun (x: compliance_violator) -> assoc_to_yojson(
    [(
         "Metadata",
         (option_to_yojson compliance_violator_metadata_to_yojson x.metadata));
       (
         "ResourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "ViolationReason",
         (option_to_yojson violation_reason_to_yojson x.violation_reason));
       (
         "ResourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       
  ])

let compliance_violators_to_yojson = 
  fun tree -> list_to_yojson compliance_violator_to_yojson tree

let policy_compliance_detail_to_yojson = 
  fun (x: policy_compliance_detail) -> assoc_to_yojson(
    [(
         "IssueInfoMap",
         (option_to_yojson issue_info_map_to_yojson x.issue_info_map));
       (
         "ExpiredAt",
         (option_to_yojson time_stamp_to_yojson x.expired_at));
       (
         "EvaluationLimitExceeded",
         (option_to_yojson boolean__to_yojson x.evaluation_limit_exceeded));
       (
         "Violators",
         (option_to_yojson compliance_violators_to_yojson x.violators));
       (
         "MemberAccount",
         (option_to_yojson aws_account_id_to_yojson x.member_account));
       (
         "PolicyId",
         (option_to_yojson policy_id_to_yojson x.policy_id));
       (
         "PolicyOwner",
         (option_to_yojson aws_account_id_to_yojson x.policy_owner));
       
  ])

let pagination_token_to_yojson = string_to_yojson

let pagination_max_results_to_yojson = int_to_yojson

let organization_status_to_yojson = 
  fun (x: organization_status) -> match x with 
 
| OffboardingComplete -> `String "OFFBOARDING_COMPLETE"
  | Offboarding -> `String "OFFBOARDING"
  | OnboardingComplete -> `String "ONBOARDING_COMPLETE"
  | Onboarding -> `String "ONBOARDING"
   

let member_accounts_to_yojson = 
  fun tree -> list_to_yojson aws_account_id_to_yojson tree

let marketplace_subscription_onboarding_status_to_yojson = 
  fun (x: marketplace_subscription_onboarding_status) -> match x with 
 
| COMPLETE -> `String "COMPLETE"
  | NOT_COMPLETE -> `String "NOT_COMPLETE"
  | NO_SUBSCRIPTION -> `String "NO_SUBSCRIPTION"
   

let list_third_party_firewall_firewall_policies_response_to_yojson = 
  fun (x: list_third_party_firewall_firewall_policies_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "ThirdPartyFirewallFirewallPolicies",
         (option_to_yojson third_party_firewall_firewall_policies_to_yojson x.third_party_firewall_firewall_policies));
       
  ])

let list_third_party_firewall_firewall_policies_request_to_yojson = 
  fun (x: list_third_party_firewall_firewall_policies_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (Some (pagination_max_results_to_yojson x.max_results)));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "ThirdPartyFirewall",
         (Some (third_party_firewall_to_yojson x.third_party_firewall)));
       
  ])

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "TagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let list_resource_sets_response_to_yojson = 
  fun (x: list_resource_sets_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "ResourceSets",
         (option_to_yojson resource_set_summary_list_to_yojson x.resource_sets));
       
  ])

let list_resource_sets_request_to_yojson = 
  fun (x: list_resource_sets_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson pagination_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       
  ])

let list_resource_set_resources_response_to_yojson = 
  fun (x: list_resource_set_resources_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "Items",
         (Some (resource_list_to_yojson x.items)));
       
  ])

let list_resource_set_resources_request_to_yojson = 
  fun (x: list_resource_set_resources_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson pagination_max_results_to_yojson x.max_results));
       (
         "Identifier",
         (Some (resource_id_to_yojson x.identifier)));
       
  ])

let list_protocols_lists_response_to_yojson = 
  fun (x: list_protocols_lists_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "ProtocolsLists",
         (option_to_yojson protocols_lists_data_to_yojson x.protocols_lists));
       
  ])

let list_protocols_lists_request_to_yojson = 
  fun (x: list_protocols_lists_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (Some (pagination_max_results_to_yojson x.max_results)));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "DefaultLists",
         (option_to_yojson boolean__to_yojson x.default_lists));
       
  ])

let list_policies_response_to_yojson = 
  fun (x: list_policies_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "PolicyList",
         (option_to_yojson policy_summary_list_to_yojson x.policy_list));
       
  ])

let list_policies_request_to_yojson = 
  fun (x: list_policies_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson pagination_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       
  ])

let list_member_accounts_response_to_yojson = 
  fun (x: list_member_accounts_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "MemberAccounts",
         (option_to_yojson member_accounts_to_yojson x.member_accounts));
       
  ])

let list_member_accounts_request_to_yojson = 
  fun (x: list_member_accounts_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson pagination_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       
  ])

let discovered_resource_to_yojson = 
  fun (x: discovered_resource) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "Type",
         (option_to_yojson resource_type_to_yojson x.type_));
       (
         "AccountId",
         (option_to_yojson aws_account_id_to_yojson x.account_id));
       (
         "URI",
         (option_to_yojson identifier_to_yojson x.ur_i));
       
  ])

let discovered_resource_list_to_yojson = 
  fun tree -> list_to_yojson discovered_resource_to_yojson tree

let list_discovered_resources_response_to_yojson = 
  fun (x: list_discovered_resources_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "Items",
         (option_to_yojson discovered_resource_list_to_yojson x.items));
       
  ])

let aws_account_id_list_to_yojson = 
  fun tree -> list_to_yojson aws_account_id_to_yojson tree

let list_discovered_resources_request_to_yojson = 
  fun (x: list_discovered_resources_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson pagination_max_results_to_yojson x.max_results));
       (
         "ResourceType",
         (Some (resource_type_to_yojson x.resource_type)));
       (
         "MemberAccountIds",
         (Some (aws_account_id_list_to_yojson x.member_account_ids)));
       
  ])

let list_compliance_status_response_to_yojson = 
  fun (x: list_compliance_status_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "PolicyComplianceStatusList",
         (option_to_yojson policy_compliance_status_list_to_yojson x.policy_compliance_status_list));
       
  ])

let list_compliance_status_request_to_yojson = 
  fun (x: list_compliance_status_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson pagination_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "PolicyId",
         (Some (policy_id_to_yojson x.policy_id)));
       
  ])

let apps_list_data_summary_to_yojson = 
  fun (x: apps_list_data_summary) -> assoc_to_yojson(
    [(
         "AppsList",
         (option_to_yojson apps_list_to_yojson x.apps_list));
       (
         "ListName",
         (option_to_yojson resource_name_to_yojson x.list_name));
       (
         "ListId",
         (option_to_yojson list_id_to_yojson x.list_id));
       (
         "ListArn",
         (option_to_yojson resource_arn_to_yojson x.list_arn));
       
  ])

let apps_lists_data_to_yojson = 
  fun tree -> list_to_yojson apps_list_data_summary_to_yojson tree

let list_apps_lists_response_to_yojson = 
  fun (x: list_apps_lists_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "AppsLists",
         (option_to_yojson apps_lists_data_to_yojson x.apps_lists));
       
  ])

let list_apps_lists_request_to_yojson = 
  fun (x: list_apps_lists_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (Some (pagination_max_results_to_yojson x.max_results)));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "DefaultLists",
         (option_to_yojson boolean__to_yojson x.default_lists));
       
  ])

let list_admins_managing_account_response_to_yojson = 
  fun (x: list_admins_managing_account_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "AdminAccounts",
         (option_to_yojson account_id_list_to_yojson x.admin_accounts));
       
  ])

let list_admins_managing_account_request_to_yojson = 
  fun (x: list_admins_managing_account_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson pagination_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       
  ])

let admin_account_summary_to_yojson = 
  fun (x: admin_account_summary) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson organization_status_to_yojson x.status));
       (
         "DefaultAdmin",
         (option_to_yojson boolean__to_yojson x.default_admin));
       (
         "AdminAccount",
         (option_to_yojson aws_account_id_to_yojson x.admin_account));
       
  ])

let admin_account_summary_list_to_yojson = 
  fun tree -> list_to_yojson admin_account_summary_to_yojson tree

let list_admin_accounts_for_organization_response_to_yojson = 
  fun (x: list_admin_accounts_for_organization_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "AdminAccounts",
         (option_to_yojson admin_account_summary_list_to_yojson x.admin_accounts));
       
  ])

let list_admin_accounts_for_organization_request_to_yojson = 
  fun (x: list_admin_accounts_for_organization_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson pagination_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       
  ])

let identifier_list_to_yojson = 
  fun tree -> list_to_yojson identifier_to_yojson tree

let get_violation_details_response_to_yojson = 
  fun (x: get_violation_details_response) -> assoc_to_yojson(
    [(
         "ViolationDetail",
         (option_to_yojson violation_detail_to_yojson x.violation_detail));
       
  ])

let get_violation_details_request_to_yojson = 
  fun (x: get_violation_details_request) -> assoc_to_yojson(
    [(
         "ResourceType",
         (Some (resource_type_to_yojson x.resource_type)));
       (
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       (
         "MemberAccount",
         (Some (aws_account_id_to_yojson x.member_account)));
       (
         "PolicyId",
         (Some (policy_id_to_yojson x.policy_id)));
       
  ])

let get_third_party_firewall_association_status_response_to_yojson = 
  fun (x: get_third_party_firewall_association_status_response) -> assoc_to_yojson(
    [(
         "MarketplaceOnboardingStatus",
         (option_to_yojson marketplace_subscription_onboarding_status_to_yojson x.marketplace_onboarding_status));
       (
         "ThirdPartyFirewallStatus",
         (option_to_yojson third_party_firewall_association_status_to_yojson x.third_party_firewall_status));
       
  ])

let get_third_party_firewall_association_status_request_to_yojson = 
  fun (x: get_third_party_firewall_association_status_request) -> assoc_to_yojson(
    [(
         "ThirdPartyFirewall",
         (Some (third_party_firewall_to_yojson x.third_party_firewall)));
       
  ])

let get_resource_set_response_to_yojson = 
  fun (x: get_resource_set_response) -> assoc_to_yojson(
    [(
         "ResourceSetArn",
         (Some (resource_arn_to_yojson x.resource_set_arn)));
       (
         "ResourceSet",
         (Some (resource_set_to_yojson x.resource_set)));
       
  ])

let get_resource_set_request_to_yojson = 
  fun (x: get_resource_set_request) -> assoc_to_yojson(
    [(
         "Identifier",
         (Some (base62_id_to_yojson x.identifier)));
       
  ])

let get_protocols_list_response_to_yojson = 
  fun (x: get_protocols_list_response) -> assoc_to_yojson(
    [(
         "ProtocolsListArn",
         (option_to_yojson resource_arn_to_yojson x.protocols_list_arn));
       (
         "ProtocolsList",
         (option_to_yojson protocols_list_data_to_yojson x.protocols_list));
       
  ])

let get_protocols_list_request_to_yojson = 
  fun (x: get_protocols_list_request) -> assoc_to_yojson(
    [(
         "DefaultList",
         (option_to_yojson boolean__to_yojson x.default_list));
       (
         "ListId",
         (Some (list_id_to_yojson x.list_id)));
       
  ])

let get_protection_status_response_to_yojson = 
  fun (x: get_protection_status_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "Data",
         (option_to_yojson protection_data_to_yojson x.data));
       (
         "ServiceType",
         (option_to_yojson security_service_type_to_yojson x.service_type));
       (
         "AdminAccountId",
         (option_to_yojson aws_account_id_to_yojson x.admin_account_id));
       
  ])

let get_protection_status_request_to_yojson = 
  fun (x: get_protection_status_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson pagination_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "EndTime",
         (option_to_yojson time_stamp_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson time_stamp_to_yojson x.start_time));
       (
         "MemberAccountId",
         (option_to_yojson aws_account_id_to_yojson x.member_account_id));
       (
         "PolicyId",
         (Some (policy_id_to_yojson x.policy_id)));
       
  ])

let get_policy_response_to_yojson = 
  fun (x: get_policy_response) -> assoc_to_yojson(
    [(
         "PolicyArn",
         (option_to_yojson resource_arn_to_yojson x.policy_arn));
       (
         "Policy",
         (option_to_yojson policy_to_yojson x.policy));
       
  ])

let get_policy_request_to_yojson = 
  fun (x: get_policy_request) -> assoc_to_yojson(
    [(
         "PolicyId",
         (Some (policy_id_to_yojson x.policy_id)));
       
  ])

let get_notification_channel_response_to_yojson = 
  fun (x: get_notification_channel_response) -> assoc_to_yojson(
    [(
         "SnsRoleName",
         (option_to_yojson resource_arn_to_yojson x.sns_role_name));
       (
         "SnsTopicArn",
         (option_to_yojson resource_arn_to_yojson x.sns_topic_arn));
       
  ])

let get_notification_channel_request_to_yojson = 
  fun (x: get_notification_channel_request) -> assoc_to_yojson(
    [
  ])

let get_compliance_detail_response_to_yojson = 
  fun (x: get_compliance_detail_response) -> assoc_to_yojson(
    [(
         "PolicyComplianceDetail",
         (option_to_yojson policy_compliance_detail_to_yojson x.policy_compliance_detail));
       
  ])

let get_compliance_detail_request_to_yojson = 
  fun (x: get_compliance_detail_request) -> assoc_to_yojson(
    [(
         "MemberAccount",
         (Some (aws_account_id_to_yojson x.member_account)));
       (
         "PolicyId",
         (Some (policy_id_to_yojson x.policy_id)));
       
  ])

let get_apps_list_response_to_yojson = 
  fun (x: get_apps_list_response) -> assoc_to_yojson(
    [(
         "AppsListArn",
         (option_to_yojson resource_arn_to_yojson x.apps_list_arn));
       (
         "AppsList",
         (option_to_yojson apps_list_data_to_yojson x.apps_list));
       
  ])

let get_apps_list_request_to_yojson = 
  fun (x: get_apps_list_request) -> assoc_to_yojson(
    [(
         "DefaultList",
         (option_to_yojson boolean__to_yojson x.default_list));
       (
         "ListId",
         (Some (list_id_to_yojson x.list_id)));
       
  ])

let get_admin_scope_response_to_yojson = 
  fun (x: get_admin_scope_response) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson organization_status_to_yojson x.status));
       (
         "AdminScope",
         (option_to_yojson admin_scope_to_yojson x.admin_scope));
       
  ])

let get_admin_scope_request_to_yojson = 
  fun (x: get_admin_scope_request) -> assoc_to_yojson(
    [(
         "AdminAccount",
         (Some (aws_account_id_to_yojson x.admin_account)));
       
  ])

let account_role_status_to_yojson = 
  fun (x: account_role_status) -> match x with 
 
| Deleted -> `String "DELETED"
  | Deleting -> `String "DELETING"
  | PendingDeletion -> `String "PENDING_DELETION"
  | Creating -> `String "CREATING"
  | Ready -> `String "READY"
   

let get_admin_account_response_to_yojson = 
  fun (x: get_admin_account_response) -> assoc_to_yojson(
    [(
         "RoleStatus",
         (option_to_yojson account_role_status_to_yojson x.role_status));
       (
         "AdminAccount",
         (option_to_yojson aws_account_id_to_yojson x.admin_account));
       
  ])

let get_admin_account_request_to_yojson = 
  fun (x: get_admin_account_request) -> assoc_to_yojson(
    [
  ])

let failed_item_reason_to_yojson = 
  fun (x: failed_item_reason) -> match x with 
 
| NotValidAccountId -> `String "NOT_VALID_ACCOUNT_ID"
  | NotValidResourceType -> `String "NOT_VALID_RESOURCE_TYPE"
  | NotValidService -> `String "NOT_VALID_SERVICE"
  | NotValidRegion -> `String "NOT_VALID_REGION"
  | NotValidPartition -> `String "NOT_VALID_PARTITION"
  | NotValidArn -> `String "NOT_VALID_ARN"
   

let failed_item_to_yojson = 
  fun (x: failed_item) -> assoc_to_yojson(
    [(
         "Reason",
         (option_to_yojson failed_item_reason_to_yojson x.reason));
       (
         "URI",
         (option_to_yojson identifier_to_yojson x.ur_i));
       
  ])

let failed_item_list_to_yojson = 
  fun tree -> list_to_yojson failed_item_to_yojson tree

let disassociate_third_party_firewall_response_to_yojson = 
  fun (x: disassociate_third_party_firewall_response) -> assoc_to_yojson(
    [(
         "ThirdPartyFirewallStatus",
         (option_to_yojson third_party_firewall_association_status_to_yojson x.third_party_firewall_status));
       
  ])

let disassociate_third_party_firewall_request_to_yojson = 
  fun (x: disassociate_third_party_firewall_request) -> assoc_to_yojson(
    [(
         "ThirdPartyFirewall",
         (Some (third_party_firewall_to_yojson x.third_party_firewall)));
       
  ])

let disassociate_admin_account_request_to_yojson = 
  fun (x: disassociate_admin_account_request) -> assoc_to_yojson(
    [
  ])

let delete_resource_set_request_to_yojson = 
  fun (x: delete_resource_set_request) -> assoc_to_yojson(
    [(
         "Identifier",
         (Some (base62_id_to_yojson x.identifier)));
       
  ])

let delete_protocols_list_request_to_yojson = 
  fun (x: delete_protocols_list_request) -> assoc_to_yojson(
    [(
         "ListId",
         (Some (list_id_to_yojson x.list_id)));
       
  ])

let delete_policy_request_to_yojson = 
  fun (x: delete_policy_request) -> assoc_to_yojson(
    [(
         "DeleteAllPolicyResources",
         (option_to_yojson boolean__to_yojson x.delete_all_policy_resources));
       (
         "PolicyId",
         (Some (policy_id_to_yojson x.policy_id)));
       
  ])

let delete_notification_channel_request_to_yojson = 
  fun (x: delete_notification_channel_request) -> assoc_to_yojson(
    [
  ])

let delete_apps_list_request_to_yojson = 
  fun (x: delete_apps_list_request) -> assoc_to_yojson(
    [(
         "ListId",
         (Some (list_id_to_yojson x.list_id)));
       
  ])

let batch_disassociate_resource_response_to_yojson = 
  fun (x: batch_disassociate_resource_response) -> assoc_to_yojson(
    [(
         "FailedItems",
         (Some (failed_item_list_to_yojson x.failed_items)));
       (
         "ResourceSetIdentifier",
         (Some (identifier_to_yojson x.resource_set_identifier)));
       
  ])

let batch_disassociate_resource_request_to_yojson = 
  fun (x: batch_disassociate_resource_request) -> assoc_to_yojson(
    [(
         "Items",
         (Some (identifier_list_to_yojson x.items)));
       (
         "ResourceSetIdentifier",
         (Some (identifier_to_yojson x.resource_set_identifier)));
       
  ])

let batch_associate_resource_response_to_yojson = 
  fun (x: batch_associate_resource_response) -> assoc_to_yojson(
    [(
         "FailedItems",
         (Some (failed_item_list_to_yojson x.failed_items)));
       (
         "ResourceSetIdentifier",
         (Some (identifier_to_yojson x.resource_set_identifier)));
       
  ])

let batch_associate_resource_request_to_yojson = 
  fun (x: batch_associate_resource_request) -> assoc_to_yojson(
    [(
         "Items",
         (Some (identifier_list_to_yojson x.items)));
       (
         "ResourceSetIdentifier",
         (Some (identifier_to_yojson x.resource_set_identifier)));
       
  ])

let associate_third_party_firewall_response_to_yojson = 
  fun (x: associate_third_party_firewall_response) -> assoc_to_yojson(
    [(
         "ThirdPartyFirewallStatus",
         (option_to_yojson third_party_firewall_association_status_to_yojson x.third_party_firewall_status));
       
  ])

let associate_third_party_firewall_request_to_yojson = 
  fun (x: associate_third_party_firewall_request) -> assoc_to_yojson(
    [(
         "ThirdPartyFirewall",
         (Some (third_party_firewall_to_yojson x.third_party_firewall)));
       
  ])

let associate_admin_account_request_to_yojson = 
  fun (x: associate_admin_account_request) -> assoc_to_yojson(
    [(
         "AdminAccount",
         (Some (aws_account_id_to_yojson x.admin_account)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

