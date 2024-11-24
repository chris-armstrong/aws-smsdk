open Smaws_Lib
let service =
  Service.{
    namespace = "fms";
    endpointPrefix = "fms";
    version = "2018-01-01";
    protocol = AwsJson_1_1
  };

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

(**{|
    The reference rule that partially matches the [ViolationTarget] rule and
    violation reason.|}*)
type partial_match = {
  target_violation_reasons: string list option;
   (**{|
    The violation reason.|}*)

  reference: string option;
   (**{|
    The reference rule from the primary security group of the Firewall
    Manager policy.|}*)

}

type remediation_action_type = | Modify
  | Remove

(**{|
    Describes a set of permissions for a security group rule.|}*)
type security_group_rule_description = {
  to_port: int option;
   (**{|
    The end of the port range for the TCP and UDP protocols, or an
    ICMP/ICMPv6 code. A value of [-1] indicates all ICMP/ICMPv6 codes.|}*)

  from_port: int option;
   (**{|
    The start of the port range for the TCP and UDP protocols, or an
    ICMP/ICMPv6 type number. A value of [-1] indicates all ICMP/ICMPv6 types.|}*)

  protocol: string option;
   (**{|
    The IP protocol name ([tcp], [udp], [icmp], [icmpv6]) or number.|}*)

  prefix_list_id: string option;
   (**{|
    The ID of the prefix list for the security group rule.|}*)

  ipv6_range: string option;
   (**{|
    The IPv6 ranges for the security group rule.|}*)

  ipv4_range: string option;
   (**{|
    The IPv4 ranges for the security group rule.|}*)

}

(**{|
    Remediation option for the rule specified in the [ViolationTarget].|}*)
type security_group_remediation_action = {
  is_default_action: bool option;
   (**{|
    Indicates if the current action is the default action.|}*)

  remediation_result: security_group_rule_description option;
   (**{|
    The final state of the rule specified in the [ViolationTarget] after it
    is remediated.|}*)

  description: string option;
   (**{|
    Brief description of the action that will be performed.|}*)

  remediation_action_type: remediation_action_type option;
   (**{|
    The remediation action that will be performed.|}*)

}

(**{|
    Violation detail for the rule violation in a security group when compared
    to the primary security group of the Firewall Manager policy.|}*)
type aws_vpc_security_group_violation = {
  possible_security_group_remediation_actions: security_group_remediation_action list option;
   (**{|
    Remediation options for the rule specified in the [ViolationTarget].|}*)

  partial_matches: partial_match list option;
   (**{|
    List of rules specified in the security group of the Firewall Manager
    policy that partially match the [ViolationTarget] rule.|}*)

  violation_target_description: string option;
   (**{|
    A description of the security group that violates the policy.|}*)

  violation_target: string option;
   (**{|
    The security group rule that is being evaluated.|}*)

}

(**{|
    Violation detail for network interfaces associated with an EC2 instance.|}*)
type aws_ec2_network_interface_violation = {
  violating_security_groups: string list option;
   (**{|
    List of security groups that violate the rules specified in the primary
    security group of the Firewall Manager policy.|}*)

  violation_target: string option;
   (**{|
    The resource ID of the network interface.|}*)

}

(**{|
    Violation detail for an EC2 instance resource.|}*)
type aws_ec2_instance_violation = {
  aws_ec2_network_interface_violations: aws_ec2_network_interface_violation list option;
   (**{|
    Violation detail for network interfaces associated with the EC2 instance.|}*)

  violation_target: string option;
   (**{|
    The resource ID of the EC2 instance.|}*)

}

(**{|
    Violation detail for Network Firewall for a subnet that doesn't have a
    Firewall Manager managed firewall in its VPC.|}*)
type network_firewall_missing_firewall_violation = {
  target_violation_reason: string option;
   (**{|
    The reason the resource has this violation, if one is available.|}*)

  availability_zone: string option;
   (**{|
    The Availability Zone of a violating subnet.|}*)

  vp_c: string option;
   (**{|
    The resource ID of the VPC associated with a violating subnet.|}*)

  violation_target: string option;
   (**{|
    The ID of the Network Firewall or VPC resource that's in violation.|}*)

}

(**{|
    Violation detail for Network Firewall for an Availability Zone that's
    missing the expected Firewall Manager managed subnet.|}*)
type network_firewall_missing_subnet_violation = {
  target_violation_reason: string option;
   (**{|
    The reason the resource has this violation, if one is available.|}*)

  availability_zone: string option;
   (**{|
    The Availability Zone of a violating subnet.|}*)

  vp_c: string option;
   (**{|
    The resource ID of the VPC associated with a violating subnet.|}*)

  violation_target: string option;
   (**{|
    The ID of the Network Firewall or VPC resource that's in violation.|}*)

}

(**{|
    Violation detail for Network Firewall for a subnet that's not associated
    to the expected Firewall Manager managed route table.|}*)
type network_firewall_missing_expected_rt_violation = {
  expected_route_table: string option;
   (**{|
    The resource ID of the route table that should be associated with the
    subnet.|}*)

  current_route_table: string option;
   (**{|
    The resource ID of the current route table that's associated with the
    subnet, if one is available.|}*)

  availability_zone: string option;
   (**{|
    The Availability Zone of a violating subnet.|}*)

  vp_c: string option;
   (**{|
    The resource ID of the VPC associated with a violating subnet.|}*)

  violation_target: string option;
   (**{|
    The ID of the Network Firewall or VPC resource that's in violation.|}*)

}

(**{|
    Network Firewall stateless rule group, used in a
    {{:  }NetworkFirewallPolicyDescription}.|}*)
type stateless_rule_group = {
  priority: int option;
   (**{|
    The priority of the rule group. Network Firewall evaluates the stateless
    rule groups in a firewall policy starting from the lowest priority
    setting.|}*)

  resource_id: string option;
   (**{|
    The resource ID of the rule group.|}*)

  rule_group_name: string option;
   (**{|
    The name of the rule group.|}*)

}

type network_firewall_override_action = | DROP_TO_ALERT

(**{|
    The setting that allows the policy owner to change the behavior of the
    rule group within a policy.|}*)
type network_firewall_stateful_rule_group_override = {
  action: network_firewall_override_action option;
   (**{|
    The action that changes the rule group from [DROP] to [ALERT]. This only
    applies to managed rule groups.|}*)

}

(**{|
    Network Firewall stateful rule group, used in a
    {{:  }NetworkFirewallPolicyDescription}.|}*)
type stateful_rule_group = {
  override: network_firewall_stateful_rule_group_override option;
   (**{|
    The action that allows the policy owner to override the behavior of the
    rule group within a policy.|}*)

  priority: int option;
   (**{|
    An integer setting that indicates the order in which to run the stateful
    rule groups in a single Network Firewall firewall policy. This setting
    only applies to firewall policies that specify the [STRICT_ORDER] rule
    order in the stateful engine options settings.
    
    Network Firewall evalutes each stateful rule group against a packet
    starting with the group that has the lowest priority setting. You must
    ensure that the priority settings are unique within each policy. For
    information about
    
    You can change the priority settings of your rule groups at any time. To
    make it easier to insert rule groups later, number them so there's a wide
    range in between, for example use 100, 200, and so on.|}*)

  resource_id: string option;
   (**{|
    The resource ID of the rule group.|}*)

  rule_group_name: string option;
   (**{|
    The name of the rule group.|}*)

}

type rule_order = | DEFAULT_ACTION_ORDER
  | STRICT_ORDER

type stream_exception_policy = | FMS_IGNORE
  | REJECT
  | CONTINUE
  | DROP

(**{|
    Configuration settings for the handling of the stateful rule groups in a
    Network Firewall firewall policy.|}*)
type stateful_engine_options = {
  stream_exception_policy: stream_exception_policy option;
   (**{|
    Indicates how Network Firewall should handle traffic when a network
    connection breaks midstream.
    
    {ol 
          {- [DROP] - Fail closed and drop all subsequent traffic going to
             the firewall.
             }
          
          {- [CONTINUE] - Continue to apply rules to subsequent traffic
             without context from traffic before the break. This impacts the
             behavior of rules that depend on context. For example, with a
             stateful rule that drops HTTP traffic, Network Firewall won't
             match subsequent traffic because the it won't have the context
             from session initialization, which defines the application layer
             protocol as HTTP. However, a TCP-layer rule using a
             [flow:stateless] rule would still match, and so would the
             [aws:drop_strict] default action.
             }
          
          {- [REJECT] - Fail closed and drop all subsequent traffic going to
             the firewall. With this option, Network Firewall also sends a
             TCP reject packet back to the client so the client can
             immediately establish a new session. With the new session,
             Network Firewall will have context and will apply rules
             appropriately.
             
          For applications that are reliant on long-lived TCP connections
          that trigger Gateway Load Balancer idle timeouts, this is the
          recommended setting.
          }
          
          {- [FMS_IGNORE] - Firewall Manager doesn't monitor or modify the
             Network Firewall stream exception policy settings.
             }
          
    }
    
    For more information, see
    {{: https://docs.aws.amazon.com/network-firewall/latest/developerguide/stream-exception-policy.html }Stream
    exception policy in your firewall policy} in the {i Network Firewall
    Developer Guide}.
    
    Default: [FMS_IGNORE]|}*)

  rule_order: rule_order option;
   (**{|
    Indicates how to manage the order of stateful rule evaluation for the
    policy. Stateful rules are provided to the rule engine as Suricata
    compatible strings, and Suricata evaluates them based on certain
    settings. For more information, see
    {{: https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-rule-evaluation-order.html }Evaluation
    order for stateful rules} in the {i Network Firewall Developer Guide}.
    
    Default: [DEFAULT_ACTION_ORDER]|}*)

}

(**{|
    The definition of the Network Firewall firewall policy.|}*)
type network_firewall_policy_description = {
  stateful_engine_options: stateful_engine_options option;
   (**{|
    Additional options governing how Network Firewall handles stateful rules.
    The stateful rule groups that you use in your policy must have stateful
    rule options settings that are compatible with these settings.|}*)

  stateful_default_actions: string list option;
   (**{|
    The default actions to take on a packet that doesn't match any stateful
    rules. The stateful default action is optional, and is only valid when
    using the strict rule order.
    
    Valid values of the stateful default action:
    
    {ol 
          {- aws:drop_strict
             }
          
          {- aws:drop_established
             }
          
          {- aws:alert_strict
             }
          
          {- aws:alert_established
             }
          
    }
    |}*)

  stateful_rule_groups: stateful_rule_group list option;
   (**{|
    The stateful rule groups that are used in the Network Firewall firewall
    policy.|}*)

  stateless_custom_actions: string list option;
   (**{|
    Names of custom actions that are available for use in the stateless
    default actions settings.|}*)

  stateless_fragment_default_actions: string list option;
   (**{|
    The actions to take on packet fragments that don't match any of the
    stateless rule groups.|}*)

  stateless_default_actions: string list option;
   (**{|
    The actions to take on packets that don't match any of the stateless rule
    groups.|}*)

  stateless_rule_groups: stateless_rule_group list option;
   (**{|
    The stateless rule groups that are used in the Network Firewall firewall
    policy.|}*)

}

(**{|
    Violation detail for Network Firewall for a firewall policy that has a
    different {{:  }NetworkFirewallPolicyDescription} than is required by the
    Firewall Manager policy.|}*)
type network_firewall_policy_modified_violation = {
  expected_policy_description: network_firewall_policy_description option;
   (**{|
    The policy that should be in use in the individual account in order to be
    compliant.|}*)

  current_policy_description: network_firewall_policy_description option;
   (**{|
    The policy that's currently in use in the individual account.|}*)

  violation_target: string option;
   (**{|
    The ID of the Network Firewall or VPC resource that's in violation.|}*)

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

(**{|
    Describes a route in a route table.|}*)
type route = {
  target: string option;
   (**{|
    The route's target.|}*)

  destination: string option;
   (**{|
    The destination of the route.|}*)

  target_type: target_type option;
   (**{|
    The type of target for the route.|}*)

  destination_type: destination_type option;
   (**{|
    The type of destination for the route.|}*)

}

(**{|
    Information about the expected route in the route table.|}*)
type expected_route = {
  route_table_id: string option;
   (**{|
    Information about the route table ID.|}*)

  allowed_targets: string list option;
   (**{|
    Information about the allowed targets.|}*)

  contributing_subnets: string list option;
   (**{|
    Information about the contributing subnets.|}*)

  ip_v6_cidr: string option;
   (**{|
    Information about the IPv6 CIDR block.|}*)

  prefix_list_id: string option;
   (**{|
    Information about the ID of the prefix list for the route.|}*)

  ip_v4_cidr: string option;
   (**{|
    Information about the IPv4 CIDR block.|}*)

}

(**{|
    Violation detail for the subnet for which internet traffic that hasn't
    been inspected.|}*)
type network_firewall_internet_traffic_not_inspected_violation = {
  vpc_id: string option;
   (**{|
    Information about the VPC ID.|}*)

  actual_internet_gateway_routes: route list option;
   (**{|
    The actual internet gateway routes.|}*)

  expected_internet_gateway_routes: expected_route list option;
   (**{|
    The internet gateway routes that are expected.|}*)

  current_internet_gateway_route_table: string option;
   (**{|
    The current route table for the internet gateway.|}*)

  internet_gateway_id: string option;
   (**{|
    The internet gateway ID.|}*)

  actual_firewall_subnet_routes: route list option;
   (**{|
    The actual firewall subnet routes.|}*)

  expected_firewall_subnet_routes: expected_route list option;
   (**{|
    The firewall subnet routes that are expected.|}*)

  firewall_subnet_id: string option;
   (**{|
    The firewall subnet ID.|}*)

  expected_firewall_endpoint: string option;
   (**{|
    The expected endpoint for the current firewall.|}*)

  current_firewall_subnet_route_table: string option;
   (**{|
    Information about the subnet route table for the current firewall.|}*)

  is_route_table_used_in_different_a_z: bool option;
   (**{|
    Information about whether the route table is used in another Availability
    Zone.|}*)

  violating_routes: route list option;
   (**{|
    The route or routes that are in violation.|}*)

  route_table_id: string option;
   (**{|
    Information about the route table ID.|}*)

  subnet_availability_zone: string option;
   (**{|
    The subnet Availability Zone.|}*)

  subnet_id: string option;
   (**{|
    The subnet ID.|}*)

}

(**{|
    Violation detail for the improperly configured subnet route. It's
    possible there is a missing route table route, or a configuration that
    causes traffic to cross an Availability Zone boundary.|}*)
type network_firewall_invalid_route_configuration_violation = {
  vpc_id: string option;
   (**{|
    Information about the VPC ID.|}*)

  actual_internet_gateway_routes: route list option;
   (**{|
    The actual internet gateway routes.|}*)

  expected_internet_gateway_routes: expected_route list option;
   (**{|
    The expected routes for the internet gateway.|}*)

  current_internet_gateway_route_table: string option;
   (**{|
    The route table for the current internet gateway.|}*)

  internet_gateway_id: string option;
   (**{|
    The internet gateway ID.|}*)

  actual_firewall_subnet_routes: route list option;
   (**{|
    The actual firewall subnet routes that are expected.|}*)

  expected_firewall_subnet_routes: expected_route list option;
   (**{|
    The firewall subnet routes that are expected.|}*)

  actual_firewall_subnet_id: string option;
   (**{|
    The actual subnet ID for the firewall.|}*)

  expected_firewall_subnet_id: string option;
   (**{|
    The expected subnet ID for the firewall.|}*)

  actual_firewall_endpoint: string option;
   (**{|
    The actual firewall endpoint.|}*)

  expected_firewall_endpoint: string option;
   (**{|
    The firewall endpoint that's expected.|}*)

  current_firewall_subnet_route_table: string option;
   (**{|
    The subnet route table for the current firewall.|}*)

  violating_route: route option;
   (**{|
    The route that's in violation.|}*)

  is_route_table_used_in_different_a_z: bool option;
   (**{|
    Information about whether the route table is used in another Availability
    Zone.|}*)

  route_table_id: string option;
   (**{|
    The route table ID.|}*)

  affected_subnets: string list option;
   (**{|
    The subnets that are affected.|}*)

}

(**{|
    Violation detail for an internet gateway route with an inactive state in
    the customer subnet route table or Network Firewall subnet route table.|}*)
type network_firewall_black_hole_route_detected_violation = {
  violating_routes: route list option;
   (**{|
    Information about the route or routes that are in violation.|}*)

  vpc_id: string option;
   (**{|
    Information about the VPC ID.|}*)

  route_table_id: string option;
   (**{|
    Information about the route table ID.|}*)

  violation_target: string option;
   (**{|
    The subnet that has an inactive state.|}*)

}

(**{|
    Violation detail for an unexpected route that's present in a route table.|}*)
type network_firewall_unexpected_firewall_routes_violation = {
  vpc_id: string option;
   (**{|
    Information about the VPC ID.|}*)

  firewall_endpoint: string option;
   (**{|
    The endpoint of the firewall.|}*)

  route_table_id: string option;
   (**{|
    The ID of the route table.|}*)

  violating_routes: route list option;
   (**{|
    The routes that are in violation.|}*)

  firewall_subnet_id: string option;
   (**{|
    The subnet ID for the firewall.|}*)

}

(**{|
    Violation detail for an unexpected gateway route that’s present in a
    route table.|}*)
type network_firewall_unexpected_gateway_routes_violation = {
  vpc_id: string option;
   (**{|
    Information about the VPC ID.|}*)

  route_table_id: string option;
   (**{|
    Information about the route table.|}*)

  violating_routes: route list option;
   (**{|
    The routes that are in violation.|}*)

  gateway_id: string option;
   (**{|
    Information about the gateway ID.|}*)

}

(**{|
    Violation detail for an expected route missing in Network Firewall.|}*)
type network_firewall_missing_expected_routes_violation = {
  vpc_id: string option;
   (**{|
    Information about the VPC ID.|}*)

  expected_routes: expected_route list option;
   (**{|
    The expected routes.|}*)

  violation_target: string option;
   (**{|
    The target of the violation.|}*)

}

(**{|
    A rule group that Firewall Manager tried to associate with a VPC has the
    same priority as a rule group that's already associated.|}*)
type dns_rule_group_priority_conflict_violation = {
  unavailable_priorities: int list option;
   (**{|
    The priorities of rule groups that are already associated with the VPC.
    To retry your operation, choose priority settings that aren't in this
    list for the rule groups in your new DNS Firewall policy.|}*)

  conflicting_policy_id: string option;
   (**{|
    The ID of the Firewall Manager DNS Firewall policy that was already
    applied to the VPC. This policy contains the rule group that's already
    associated with the VPC.|}*)

  conflicting_priority: int option;
   (**{|
    The priority setting of the two conflicting rule groups.|}*)

  violation_target_description: string option;
   (**{|
    A description of the violation that specifies the VPC and the rule group
    that's already associated with it.|}*)

  violation_target: string option;
   (**{|
    Information about the VPC ID.|}*)

}

(**{|
    A DNS Firewall rule group that Firewall Manager tried to associate with a
    VPC is already associated with the VPC and can't be associated again.|}*)
type dns_duplicate_rule_group_violation = {
  violation_target_description: string option;
   (**{|
    A description of the violation that specifies the rule group and VPC.|}*)

  violation_target: string option;
   (**{|
    Information about the VPC ID.|}*)

}

(**{|
    The VPC that Firewall Manager was applying a DNS Fireall policy to
    reached the limit for associated DNS Firewall rule groups. Firewall
    Manager tried to associate another rule group with the VPC and failed due
    to the limit.|}*)
type dns_rule_group_limit_exceeded_violation = {
  number_of_rule_groups_already_associated: int option;
   (**{|
    The number of rule groups currently associated with the VPC.|}*)

  violation_target_description: string option;
   (**{|
    A description of the violation that specifies the rule group and VPC.|}*)

  violation_target: string option;
   (**{|
    Information about the VPC ID.|}*)

}

(**{|
    Contains details about the firewall subnet that violates the policy scope.|}*)
type firewall_subnet_is_out_of_scope_violation = {
  vpc_endpoint_id: string option;
   (**{|
    The VPC endpoint ID of the firewall subnet that violates the policy scope.|}*)

  subnet_availability_zone_id: string option;
   (**{|
    The Availability Zone ID of the firewall subnet that violates the policy
    scope.|}*)

  subnet_availability_zone: string option;
   (**{|
    The Availability Zone of the firewall subnet that violates the policy
    scope.|}*)

  vpc_id: string option;
   (**{|
    The VPC ID of the firewall subnet that violates the policy scope.|}*)

  firewall_subnet_id: string option;
   (**{|
    The ID of the firewall subnet that violates the policy scope.|}*)

}

(**{|
    Contains details about the route endpoint that violates the policy scope.|}*)
type route_has_out_of_scope_endpoint_violation = {
  internet_gateway_routes: route list option;
   (**{|
    The routes in the route table associated with the Internet Gateway.|}*)

  current_internet_gateway_route_table: string option;
   (**{|
    The current route table associated with the Internet Gateway.|}*)

  internet_gateway_id: string option;
   (**{|
    The ID of the Internet Gateway.|}*)

  firewall_subnet_routes: route list option;
   (**{|
    The list of firewall subnet routes.|}*)

  firewall_subnet_id: string option;
   (**{|
    The ID of the firewall subnet.|}*)

  current_firewall_subnet_route_table: string option;
   (**{|
    The route table associated with the current firewall subnet.|}*)

  subnet_availability_zone_id: string option;
   (**{|
    The ID of the subnet's Availability Zone.|}*)

  subnet_availability_zone: string option;
   (**{|
    The subnet's Availability Zone.|}*)

  violating_routes: route list option;
   (**{|
    The list of routes that violate the route table.|}*)

  route_table_id: string option;
   (**{|
    The ID of the route table.|}*)

  vpc_id: string option;
   (**{|
    The VPC ID of the route that violates the policy scope.|}*)

  subnet_id: string option;
   (**{|
    The ID of the subnet associated with the route that violates the policy
    scope.|}*)

}

(**{|
    The violation details about a third-party firewall's subnet that doesn't
    have a Firewall Manager managed firewall in its VPC.|}*)
type third_party_firewall_missing_firewall_violation = {
  target_violation_reason: string option;
   (**{|
    The reason the resource is causing this violation, if a reason is
    available.|}*)

  availability_zone: string option;
   (**{|
    The Availability Zone of the third-party firewall that's causing the
    violation.|}*)

  vp_c: string option;
   (**{|
    The resource ID of the VPC associated with a third-party firewall.|}*)

  violation_target: string option;
   (**{|
    The ID of the third-party firewall that's causing the violation.|}*)

}

(**{|
    The violation details for a third-party firewall for an Availability Zone
    that's missing the Firewall Manager managed subnet.|}*)
type third_party_firewall_missing_subnet_violation = {
  target_violation_reason: string option;
   (**{|
    The reason the resource is causing the violation, if a reason is
    available.|}*)

  availability_zone: string option;
   (**{|
    The Availability Zone of a subnet that's causing the violation.|}*)

  vp_c: string option;
   (**{|
    The resource ID of the VPC associated with a subnet that's causing the
    violation.|}*)

  violation_target: string option;
   (**{|
    The ID of the third-party firewall or VPC resource that's causing the
    violation.|}*)

}

(**{|
    The violation details for a third-party firewall that's not associated
    with an Firewall Manager managed route table.|}*)
type third_party_firewall_missing_expected_route_table_violation = {
  expected_route_table: string option;
   (**{|
    The resource ID of the route table that should be associated with the
    subnet.|}*)

  current_route_table: string option;
   (**{|
    The resource ID of the current route table that's associated with the
    subnet, if one is available.|}*)

  availability_zone: string option;
   (**{|
    The Availability Zone of the firewall subnet that's causing the violation.|}*)

  vp_c: string option;
   (**{|
    The resource ID of the VPC associated with a fireawll subnet that's
    causing the violation.|}*)

  violation_target: string option;
   (**{|
    The ID of the third-party firewall or VPC resource that's causing the
    violation.|}*)

}

(**{|
    The violation details for a firewall subnet's VPC endpoint that's deleted
    or missing.|}*)
type firewall_subnet_missing_vpc_endpoint_violation = {
  subnet_availability_zone_id: string option;
   (**{|
    The ID of the Availability Zone of the deleted VPC subnet.|}*)

  subnet_availability_zone: string option;
   (**{|
    The name of the Availability Zone of the deleted VPC subnet.|}*)

  vpc_id: string option;
   (**{|
    The resource ID of the VPC associated with the deleted VPC subnet.|}*)

  firewall_subnet_id: string option;
   (**{|
    The ID of the firewall that this VPC endpoint is associated with.|}*)

}

(**{|
    ICMP protocol: The ICMP type and code.|}*)
type network_acl_icmp_type_code = {
  type_: int option;
   (**{|
    ICMP type.|}*)

  code: int option;
   (**{|
    ICMP code.|}*)

}

(**{|
    TCP or UDP protocols: The range of ports the rule applies to.|}*)
type network_acl_port_range = {
  to_: int option;
   (**{|
    The ending port number of the range.|}*)

  from_: int option;
   (**{|
    The beginning port number of the range.|}*)

}

type network_acl_rule_action = | DENY
  | ALLOW

(**{|
    Describes a rule in a network ACL.
    
    Each network ACL has a set of numbered ingress rules and a separate set
    of numbered egress rules. When determining whether a packet should be
    allowed in or out of a subnet associated with the network ACL, Amazon Web
    Services processes the entries in the network ACL according to the rule
    numbers, in ascending order.
    
    When you manage an individual network ACL, you explicitly specify the
    rule numbers. When you specify the network ACL rules in a Firewall
    Manager policy, you provide the rules to run first, in the order that you
    want them to run, and the rules to run last, in the order that you want
    them to run. Firewall Manager assigns the rule numbers for you when you
    save the network ACL policy specification.|}*)
type network_acl_entry = {
  egress: bool;
   (**{|
    Indicates whether the rule is an egress, or outbound, rule (applied to
    traffic leaving the subnet). If it's not an egress rule, then it's an
    ingress, or inbound, rule.|}*)

  rule_action: network_acl_rule_action;
   (**{|
    Indicates whether to allow or deny the traffic that matches the rule.|}*)

  ipv6_cidr_block: string option;
   (**{|
    The IPv6 network range to allow or deny, in CIDR notation.|}*)

  cidr_block: string option;
   (**{|
    The IPv4 network range to allow or deny, in CIDR notation.|}*)

  port_range: network_acl_port_range option;
   (**{|
    TCP or UDP protocols: The range of ports the rule applies to.|}*)

  protocol: string;
   (**{|
    The protocol number. A value of "-1" means all protocols.|}*)

  icmp_type_code: network_acl_icmp_type_code option;
   (**{|
    ICMP protocol: The ICMP type and code.|}*)

}

type entry_type = | CustomEntry
  | FMSManagedLastEntry
  | FMSManagedFirstEntry

(**{|
    Describes a single rule in a network ACL.|}*)
type entry_description = {
  entry_type: entry_type option;
   (**{|
    Specifies whether the entry is managed by Firewall Manager or by a user,
    and, for Firewall Manager-managed entries, specifies whether the entry is
    among those that run first in the network ACL or those that run last.|}*)

  entry_rule_number: int option;
   (**{|
    The rule number for the entry. ACL entries are processed in ascending
    order by rule number. In a Firewall Manager network ACL policy, Firewall
    Manager assigns rule numbers.|}*)

  entry_detail: network_acl_entry option;
   (**{|
    Describes a rule in a network ACL.
    
    Each network ACL has a set of numbered ingress rules and a separate set
    of numbered egress rules. When determining whether a packet should be
    allowed in or out of a subnet associated with the network ACL, Amazon Web
    Services processes the entries in the network ACL according to the rule
    numbers, in ascending order.
    
    When you manage an individual network ACL, you explicitly specify the
    rule numbers. When you specify the network ACL rules in a Firewall
    Manager policy, you provide the rules to run first, in the order that you
    want them to run, and the rules to run last, in the order that you want
    them to run. Firewall Manager assigns the rule numbers for you when you
    save the network ACL policy specification.|}*)

}

type entry_violation_reason = | EntryConflict
  | IncorrectEntryOrder
  | MissingExpectedEntry

(**{|
    Detailed information about an entry violation in a network ACL. The
    violation is against the network ACL specification inside the Firewall
    Manager network ACL policy. This data object is part of
    [InvalidNetworkAclEntriesViolation].|}*)
type entry_violation = {
  entry_violation_reasons: entry_violation_reason list option;
   (**{|
    Descriptions of the violations that Firewall Manager found for these
    entries.|}*)

  entries_with_conflicts: entry_description list option;
   (**{|
    The list of entries that are in conflict with [ExpectedEntry].|}*)

  entry_at_expected_evaluation_order: entry_description option;
   (**{|
    The entry that's currently in the [ExpectedEvaluationOrder] location, in
    place of the expected entry.|}*)

  actual_evaluation_order: string option;
   (**{|
    The evaluation location within the ordered list of entries where the
    [ExpectedEntry] is currently located.|}*)

  expected_evaluation_order: string option;
   (**{|
    The evaluation location within the ordered list of entries where the
    [ExpectedEntry] should be, according to the network ACL policy
    specifications.|}*)

  expected_entry: entry_description option;
   (**{|
    The Firewall Manager-managed network ACL entry that is involved in the
    entry violation.|}*)

}

(**{|
    Violation detail for the entries in a network ACL resource.|}*)
type invalid_network_acl_entries_violation = {
  entry_violations: entry_violation list option;
   (**{|
    Detailed information about the entry violations in the network ACL.|}*)

  current_associated_network_acl: string option;
   (**{|
    The network ACL containing the entry violations.|}*)

  subnet_availability_zone: string option;
   (**{|
    The Availability Zone where the network ACL is in use.|}*)

  subnet: string option;
   (**{|
    The subnet that's associated with the network ACL.|}*)

  vpc: string option;
   (**{|
    The VPC where the violation was found.|}*)

}

(**{|
    Describes a remediation action target.|}*)
type action_target = {
  description: string option;
   (**{|
    A description of the remediation action target.|}*)

  resource_id: string option;
   (**{|
    The ID of the remediation target.|}*)

}

(**{|
    Information about the CreateRoute action in Amazon EC2.|}*)
type ec2_create_route_action = {
  route_table_id: action_target;
   (**{|
    Information about the ID of the route table for the route.|}*)

  gateway_id: action_target option;
   (**{|
    Information about the ID of an internet gateway or virtual private
    gateway attached to your VPC.|}*)

  vpc_endpoint_id: action_target option;
   (**{|
    Information about the ID of a VPC endpoint. Supported for Gateway Load
    Balancer endpoints only.|}*)

  destination_ipv6_cidr_block: string option;
   (**{|
    Information about the IPv6 CIDR block destination.|}*)

  destination_prefix_list_id: string option;
   (**{|
    Information about the ID of a prefix list used for the destination match.|}*)

  destination_cidr_block: string option;
   (**{|
    Information about the IPv4 CIDR address block used for the destination
    match.|}*)

  description: string option;
   (**{|
    A description of CreateRoute action in Amazon EC2.|}*)

}

(**{|
    Information about the ReplaceRoute action in Amazon EC2.|}*)
type ec2_replace_route_action = {
  route_table_id: action_target;
   (**{|
    Information about the ID of the route table.|}*)

  gateway_id: action_target option;
   (**{|
    Information about the ID of an internet gateway or virtual private
    gateway.|}*)

  destination_ipv6_cidr_block: string option;
   (**{|
    Information about the IPv6 CIDR address block used for the destination
    match. The value that you provide must match the CIDR of an existing
    route in the table.|}*)

  destination_prefix_list_id: string option;
   (**{|
    Information about the ID of the prefix list for the route.|}*)

  destination_cidr_block: string option;
   (**{|
    Information about the IPv4 CIDR address block used for the destination
    match. The value that you provide must match the CIDR of an existing
    route in the table.|}*)

  description: string option;
   (**{|
    A description of the ReplaceRoute action in Amazon EC2.|}*)

}

(**{|
    Information about the DeleteRoute action in Amazon EC2.|}*)
type ec2_delete_route_action = {
  route_table_id: action_target;
   (**{|
    Information about the ID of the route table.|}*)

  destination_ipv6_cidr_block: string option;
   (**{|
    Information about the IPv6 CIDR range for the route. The value you
    specify must match the CIDR for the route exactly.|}*)

  destination_prefix_list_id: string option;
   (**{|
    Information about the ID of the prefix list for the route.|}*)

  destination_cidr_block: string option;
   (**{|
    Information about the IPv4 CIDR range for the route. The value you
    specify must match the CIDR for the route exactly.|}*)

  description: string option;
   (**{|
    A description of the DeleteRoute action.|}*)

}

(**{|
    An action that copies the EC2 route table for use in remediation.|}*)
type ec2_copy_route_table_action = {
  route_table_id: action_target;
   (**{|
    The ID of the copied EC2 route table that is associated with the
    remediation action.|}*)

  vpc_id: action_target;
   (**{|
    The VPC ID of the copied EC2 route table that is associated with the
    remediation action.|}*)

  description: string option;
   (**{|
    A description of the copied EC2 route table that is associated with the
    remediation action.|}*)

}

(**{|
    Information about the ReplaceRouteTableAssociation action in Amazon EC2.|}*)
type ec2_replace_route_table_association_action = {
  route_table_id: action_target;
   (**{|
    Information about the ID of the new route table to associate with the
    subnet.|}*)

  association_id: action_target;
   (**{|
    Information about the association ID.|}*)

  description: string option;
   (**{|
    A description of the ReplaceRouteTableAssociation action in Amazon EC2.|}*)

}

(**{|
    The action of associating an EC2 resource, such as a subnet or internet
    gateway, with a route table.|}*)
type ec2_associate_route_table_action = {
  gateway_id: action_target option;
   (**{|
    The ID of the gateway to be used with the EC2 route table that is
    associated with the remediation action.|}*)

  subnet_id: action_target option;
   (**{|
    The ID of the subnet for the EC2 route table that is associated with the
    remediation action.|}*)

  route_table_id: action_target;
   (**{|
    The ID of the EC2 route table that is associated with the remediation
    action.|}*)

  description: string option;
   (**{|
    A description of the EC2 route table that is associated with the
    remediation action.|}*)

}

(**{|
    Information about the CreateRouteTable action in Amazon EC2.|}*)
type ec2_create_route_table_action = {
  vpc_id: action_target;
   (**{|
    Information about the ID of a VPC.|}*)

  description: string option;
   (**{|
    A description of the CreateRouteTable action.|}*)

}

(**{|
    Contains information about the actions that you can take to remediate
    scope violations caused by your policy's [FirewallCreationConfig].
    [FirewallCreationConfig] is an optional configuration that you can use to
    choose which Availability Zones Firewall Manager creates Network Firewall
    endpoints in.|}*)
type fms_policy_update_firewall_creation_config_action = {
  firewall_creation_config: string option;
   (**{|
    A [FirewallCreationConfig] that you can copy into your current policy's
    {{: https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_SecurityServicePolicyData.html }SecurityServiceData}
    in order to remedy scope violations.|}*)

  description: string option;
   (**{|
    Describes the remedial action.|}*)

}

(**{|
    Information about the [CreateNetworkAcl] action in Amazon EC2. This is a
    remediation option in [RemediationAction].|}*)
type create_network_acl_action = {
  fms_can_remediate: bool option;
   (**{|
    Indicates whether it is possible for Firewall Manager to perform this
    remediation action. A false value indicates that auto remediation is
    disabled or Firewall Manager is unable to perform the action due to a
    conflict of some kind.|}*)

  vpc: action_target option;
   (**{|
    The VPC that's associated with the remediation action.|}*)

  description: string option;
   (**{|
    Brief description of this remediation action.|}*)

}

(**{|
    Information about the [ReplaceNetworkAclAssociation] action in Amazon
    EC2. This is a remediation option in [RemediationAction].|}*)
type replace_network_acl_association_action = {
  fms_can_remediate: bool option;
   (**{|
    Indicates whether it is possible for Firewall Manager to perform this
    remediation action. A false value indicates that auto remediation is
    disabled or Firewall Manager is unable to perform the action due to a
    conflict of some kind.|}*)

  network_acl_id: action_target option;
   (**{|
    The network ACL that's associated with the remediation action.|}*)

  association_id: action_target option;
  
  description: string option;
   (**{|
    Brief description of this remediation action.|}*)

}

(**{|
    Information about the [CreateNetworkAclEntries] action in Amazon EC2.
    This is a remediation option in [RemediationAction].|}*)
type create_network_acl_entries_action = {
  fms_can_remediate: bool option;
   (**{|
    Indicates whether it is possible for Firewall Manager to perform this
    remediation action. A false value indicates that auto remediation is
    disabled or Firewall Manager is unable to perform the action due to a
    conflict of some kind.|}*)

  network_acl_entries_to_be_created: entry_description list option;
   (**{|
    Lists the entries that the remediation action would create.|}*)

  network_acl_id: action_target option;
   (**{|
    The network ACL that's associated with the remediation action.|}*)

  description: string option;
   (**{|
    Brief description of this remediation action.|}*)

}

(**{|
    Information about the [DeleteNetworkAclEntries] action in Amazon EC2.
    This is a remediation option in [RemediationAction].|}*)
type delete_network_acl_entries_action = {
  fms_can_remediate: bool option;
   (**{|
    Indicates whether it is possible for Firewall Manager to perform this
    remediation action. A false value indicates that auto remediation is
    disabled or Firewall Manager is unable to perform the action due to a
    conflict of some kind.|}*)

  network_acl_entries_to_be_deleted: entry_description list option;
   (**{|
    Lists the entries that the remediation action would delete.|}*)

  network_acl_id: action_target option;
   (**{|
    The network ACL that's associated with the remediation action.|}*)

  description: string option;
   (**{|
    Brief description of this remediation action.|}*)

}

(**{|
    Information about an individual action you can take to remediate a
    violation.|}*)
type remediation_action = {
  delete_network_acl_entries_action: delete_network_acl_entries_action option;
   (**{|
    Information about the [DeleteNetworkAclEntries] action in Amazon EC2.|}*)

  create_network_acl_entries_action: create_network_acl_entries_action option;
   (**{|
    Information about the [CreateNetworkAclEntries] action in Amazon EC2.|}*)

  replace_network_acl_association_action: replace_network_acl_association_action option;
   (**{|
    Information about the [ReplaceNetworkAclAssociation] action in Amazon EC2.|}*)

  create_network_acl_action: create_network_acl_action option;
   (**{|
    Information about the [CreateNetworkAcl] action in Amazon EC2.|}*)

  fms_policy_update_firewall_creation_config_action: fms_policy_update_firewall_creation_config_action option;
   (**{|
    The remedial action to take when updating a firewall configuration.|}*)

  ec2_create_route_table_action: ec2_create_route_table_action option;
   (**{|
    Information about the CreateRouteTable action in the Amazon EC2 API.|}*)

  ec2_associate_route_table_action: ec2_associate_route_table_action option;
   (**{|
    Information about the AssociateRouteTable action in the Amazon EC2 API.|}*)

  ec2_replace_route_table_association_action: ec2_replace_route_table_association_action option;
   (**{|
    Information about the ReplaceRouteTableAssociation action in the Amazon
    EC2 API.|}*)

  ec2_copy_route_table_action: ec2_copy_route_table_action option;
   (**{|
    Information about the CopyRouteTable action in the Amazon EC2 API.|}*)

  ec2_delete_route_action: ec2_delete_route_action option;
   (**{|
    Information about the DeleteRoute action in the Amazon EC2 API.|}*)

  ec2_replace_route_action: ec2_replace_route_action option;
   (**{|
    Information about the ReplaceRoute action in the Amazon EC2 API.|}*)

  ec2_create_route_action: ec2_create_route_action option;
   (**{|
    Information about the CreateRoute action in the Amazon EC2 API.|}*)

  description: string option;
   (**{|
    A description of a remediation action.|}*)

}

(**{|
    An ordered list of actions you can take to remediate a violation.|}*)
type remediation_action_with_order = {
  order: int option;
   (**{|
    The order of the remediation actions in the list.|}*)

  remediation_action: remediation_action option;
   (**{|
    Information about an action you can take to remediate a violation.|}*)

}

(**{|
    A list of remediation actions.|}*)
type possible_remediation_action = {
  is_default_action: bool option;
   (**{|
    Information about whether an action is taken by default.|}*)

  ordered_remediation_actions: remediation_action_with_order list;
   (**{|
    The ordered list of remediation actions.|}*)

  description: string option;
   (**{|
    A description of the list of remediation actions.|}*)

}

(**{|
    A list of possible remediation action lists. Each individual possible
    remediation action is a list of individual remediation actions.|}*)
type possible_remediation_actions = {
  actions: possible_remediation_action list option;
   (**{|
    Information about the actions.|}*)

  description: string option;
   (**{|
    A description of the possible remediation actions list.|}*)

}

(**{|
    Violation detail based on resource type.|}*)
type resource_violation = {
  possible_remediation_actions: possible_remediation_actions option;
   (**{|
    A list of possible remediation action lists. Each individual possible
    remediation action is a list of individual remediation actions.|}*)

  invalid_network_acl_entries_violation: invalid_network_acl_entries_violation option;
   (**{|
    Violation detail for the entries in a network ACL resource.|}*)

  firewall_subnet_missing_vpc_endpoint_violation: firewall_subnet_missing_vpc_endpoint_violation option;
   (**{|
    The violation details for a third-party firewall's VPC endpoint subnet
    that was deleted.|}*)

  third_party_firewall_missing_expected_route_table_violation: third_party_firewall_missing_expected_route_table_violation option;
   (**{|
    The violation details for a third-party firewall that has the Firewall
    Manager managed route table that was associated with the third-party
    firewall has been deleted.|}*)

  third_party_firewall_missing_subnet_violation: third_party_firewall_missing_subnet_violation option;
   (**{|
    The violation details for a third-party firewall's subnet that's been
    deleted.|}*)

  third_party_firewall_missing_firewall_violation: third_party_firewall_missing_firewall_violation option;
   (**{|
    The violation details for a third-party firewall that's been deleted.|}*)

  route_has_out_of_scope_endpoint_violation: route_has_out_of_scope_endpoint_violation option;
   (**{|
    Contains details about the route endpoint that violates the policy scope.|}*)

  firewall_subnet_is_out_of_scope_violation: firewall_subnet_is_out_of_scope_violation option;
   (**{|
    Contains details about the firewall subnet that violates the policy scope.|}*)

  dns_rule_group_limit_exceeded_violation: dns_rule_group_limit_exceeded_violation option;
   (**{|
    Violation detail for a DNS Firewall policy that indicates that the VPC
    reached the limit for associated DNS Firewall rule groups. Firewall
    Manager tried to associate another rule group with the VPC and failed.|}*)

  dns_duplicate_rule_group_violation: dns_duplicate_rule_group_violation option;
   (**{|
    Violation detail for a DNS Firewall policy that indicates that a rule
    group that Firewall Manager tried to associate with a VPC is already
    associated with the VPC and can't be associated again.|}*)

  dns_rule_group_priority_conflict_violation: dns_rule_group_priority_conflict_violation option;
   (**{|
    Violation detail for a DNS Firewall policy that indicates that a rule
    group that Firewall Manager tried to associate with a VPC has the same
    priority as a rule group that's already associated.|}*)

  network_firewall_missing_expected_routes_violation: network_firewall_missing_expected_routes_violation option;
   (**{|
    Expected routes are missing from Network Firewall.|}*)

  network_firewall_unexpected_gateway_routes_violation: network_firewall_unexpected_gateway_routes_violation option;
   (**{|
    There's an unexpected gateway route.|}*)

  network_firewall_unexpected_firewall_routes_violation: network_firewall_unexpected_firewall_routes_violation option;
   (**{|
    There's an unexpected firewall route.|}*)

  network_firewall_black_hole_route_detected_violation: network_firewall_black_hole_route_detected_violation option;
  
  network_firewall_invalid_route_configuration_violation: network_firewall_invalid_route_configuration_violation option;
   (**{|
    The route configuration is invalid.|}*)

  network_firewall_internet_traffic_not_inspected_violation: network_firewall_internet_traffic_not_inspected_violation option;
   (**{|
    Violation detail for the subnet for which internet traffic hasn't been
    inspected.|}*)

  network_firewall_policy_modified_violation: network_firewall_policy_modified_violation option;
   (**{|
    Violation detail for an Network Firewall policy that indicates that a
    firewall policy in an individual account has been modified in a way that
    makes it noncompliant. For example, the individual account owner might
    have deleted a rule group, changed the priority of a stateless rule
    group, or changed a policy default action.|}*)

  network_firewall_missing_expected_rt_violation: network_firewall_missing_expected_rt_violation option;
   (**{|
    Violation detail for an Network Firewall policy that indicates that a
    subnet is not associated with the expected Firewall Manager managed route
    table.|}*)

  network_firewall_missing_subnet_violation: network_firewall_missing_subnet_violation option;
   (**{|
    Violation detail for an Network Firewall policy that indicates that an
    Availability Zone is missing the expected Firewall Manager managed
    subnet.|}*)

  network_firewall_missing_firewall_violation: network_firewall_missing_firewall_violation option;
   (**{|
    Violation detail for an Network Firewall policy that indicates that a
    subnet has no Firewall Manager managed firewall in its VPC.|}*)

  aws_ec2_instance_violation: aws_ec2_instance_violation option;
   (**{|
    Violation detail for an EC2 instance.|}*)

  aws_ec2_network_interface_violation: aws_ec2_network_interface_violation option;
   (**{|
    Violation detail for a network interface.|}*)

  aws_vpc_security_group_violation: aws_vpc_security_group_violation option;
   (**{|
    Violation detail for security groups.|}*)

}

(**{|
    A collection of key:value pairs associated with an Amazon Web Services
    resource. The key:value pair can be anything you define. Typically, the
    tag key represents a category (such as "environment") and the tag value
    represents a specific value within that category (such as "test,"
    "development," or "production"). You can add up to 50 tags to each Amazon
    Web Services resource.|}*)
type tag = {
  value: string;
   (**{|
    Part of the key:value pair that defines a tag. You can use a tag value to
    describe a specific value within a category, such as "companyA" or
    "companyB." Tag values are case-sensitive.|}*)

  key: string;
   (**{|
    Part of the key:value pair that defines a tag. You can use a tag key to
    describe a category of information, such as "customer." Tag keys are
    case-sensitive.|}*)

}

(**{|
    Violations for a resource based on the specified Firewall Manager policy
    and Amazon Web Services account.|}*)
type violation_detail = {
  resource_description: string option;
   (**{|
    Brief description for the requested resource.|}*)

  resource_tags: tag list option;
   (**{|
    The [ResourceTag] objects associated with the resource.|}*)

  resource_violations: resource_violation list;
   (**{|
    List of violations for the requested resource.|}*)

  resource_type: string;
   (**{|
    The resource type that the violation details were requested for.|}*)

  resource_id: string;
   (**{|
    The resource ID that the violation details were requested for.|}*)

  member_account: string;
   (**{|
    The Amazon Web Services account that the violation details were requested
    for.|}*)

  policy_id: string;
   (**{|
    The ID of the Firewall Manager policy that the violation details were
    requested for.|}*)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
   (**{|
    The keys of the tags to remove from the resource.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource to return tags for. The
    Firewall Manager resources that support tagging are policies,
    applications lists, and protocols lists.|}*)

}

(**{|
    The specified resource was not found.|}*)
type resource_not_found_exception = {
  message: string option;
  
}

(**{|
    The operation failed because there was nothing to do or the operation
    wasn't possible. For example, you might have submitted an
    [AssociateAdminAccount] request for an account ID that was already set as
    the Firewall Manager administrator. Or you might have tried to access a
    Region that's disabled by default, and that you need to enable for the
    Firewall Manager administrator account and for Organizations before you
    can access it.|}*)
type invalid_operation_exception = {
  message: string option;
  
}

(**{|
    The parameters of the request were invalid.|}*)
type invalid_input_exception = {
  message: string option;
  
}

(**{|
    The operation failed because of a system problem, even though the request
    was valid. Retry your request.|}*)
type internal_error_exception = {
  message: string option;
  
}

type firewall_deployment_model = | DISTRIBUTED
  | CENTRALIZED

(**{|
    Configures the deployment model for the third-party firewall.|}*)
type third_party_firewall_policy = {
  firewall_deployment_model: firewall_deployment_model option;
   (**{|
    Defines the deployment model to use for the third-party firewall policy.|}*)

}

(**{|
    Configures the third-party firewall's firewall policy.|}*)
type third_party_firewall_firewall_policy = {
  firewall_policy_name: string option;
   (**{|
    The name of the specified firewall policy.|}*)

  firewall_policy_id: string option;
   (**{|
    The ID of the specified firewall policy.|}*)

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
   (**{|
    The tags to add to the resource.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource to return tags for. The
    Firewall Manager resources that support tagging are policies,
    applications lists, and protocols lists.|}*)

}

(**{|
    The operation exceeds a resource limit, for example, the maximum number
    of [policy] objects that you can create for an Amazon Web Services
    account. For more information, see
    {{: https://docs.aws.amazon.com/waf/latest/developerguide/fms-limits.html }Firewall
    Manager Limits} in the {i WAF Developer Guide}.|}*)
type limit_exceeded_exception = {
  message: string option;
  
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

(**{|
    Configures the firewall policy deployment model of Network Firewall. For
    information about Network Firewall deployment models, see
    {{: https://docs.aws.amazon.com/network-firewall/latest/developerguide/architectures.html }Network
    Firewall example architectures with routing} in the {i Network Firewall
    Developer Guide}.|}*)
type network_firewall_policy = {
  firewall_deployment_model: firewall_deployment_model option;
   (**{|
    Defines the deployment model to use for the firewall policy. To use a
    distributed model, set
    {{: https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html }PolicyOption}
    to [NULL].|}*)

}

(**{|
    The configuration of the first and last rules for the network ACL policy,
    and the remediation settings for each.|}*)
type network_acl_entry_set = {
  force_remediate_for_last_entries: bool;
   (**{|
    Applies only when remediation is enabled for the policy as a whole.
    Firewall Manager uses this setting when it finds policy violations that
    involve conflicts between the custom entries and the policy entries.
    
    If forced remediation is disabled, Firewall Manager marks the network ACL
    as noncompliant and does not try to remediate. For more information about
    the remediation behavior, see
    {{: https://docs.aws.amazon.com/waf/latest/developerguide/network-acl-policies.html#network-acls-remediation }Remediation
    for managed network ACLs} in the {i Firewall Manager Developer Guide}.|}*)

  last_entries: network_acl_entry list option;
   (**{|
    The rules that you want to run last in the Firewall Manager managed
    network ACLs.
    
    Provide these in the order in which you want them to run. Firewall
    Manager will assign the specific rule numbers for you, in the network
    ACLs that it creates.
    
    You must specify at least one first entry or one last entry in any
    network ACL policy.|}*)

  force_remediate_for_first_entries: bool;
   (**{|
    Applies only when remediation is enabled for the policy as a whole.
    Firewall Manager uses this setting when it finds policy violations that
    involve conflicts between the custom entries and the policy entries.
    
    If forced remediation is disabled, Firewall Manager marks the network ACL
    as noncompliant and does not try to remediate. For more information about
    the remediation behavior, see
    {{: https://docs.aws.amazon.com/waf/latest/developerguide/network-acl-policies.html#network-acls-remediation }Remediation
    for managed network ACLs} in the {i Firewall Manager Developer Guide}.|}*)

  first_entries: network_acl_entry list option;
   (**{|
    The rules that you want to run first in the Firewall Manager managed
    network ACLs.
    
    Provide these in the order in which you want them to run. Firewall
    Manager will assign the specific rule numbers for you, in the network
    ACLs that it creates.
    
    You must specify at least one first entry or one last entry in any
    network ACL policy.|}*)

}

(**{|
    Defines a Firewall Manager network ACL policy. This is used in the
    [PolicyOption] of a [SecurityServicePolicyData] for a [Policy], when the
    [SecurityServicePolicyData] type is set to [NETWORK_ACL_COMMON].
    
    For information about network ACLs, see
    {{: https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html }Control
    traffic to subnets using network ACLs} in the {i Amazon Virtual Private
    Cloud User Guide}.|}*)
type network_acl_common_policy = {
  network_acl_entry_set: network_acl_entry_set;
   (**{|
    The definition of the first and last rules for the network ACL policy.|}*)

}

(**{|
    Contains the settings to configure a network ACL policy, a Network
    Firewall firewall policy deployment model, or a third-party firewall
    policy.|}*)
type policy_option = {
  network_acl_common_policy: network_acl_common_policy option;
   (**{|
    Defines a Firewall Manager network ACL policy.|}*)

  third_party_firewall_policy: third_party_firewall_policy option;
   (**{|
    Defines the policy options for a third-party firewall policy.|}*)

  network_firewall_policy: network_firewall_policy option;
   (**{|
    Defines the deployment model to use for the firewall policy.|}*)

}

(**{|
    Details about the security service that is being used to protect the
    resources.|}*)
type security_service_policy_data = {
  policy_option: policy_option option;
   (**{|
    Contains the settings to configure a network ACL policy, a Network
    Firewall firewall policy deployment model, or a third-party firewall
    policy.|}*)

  managed_service_data: string option;
   (**{|
    Details about the service that are specific to the service type, in JSON
    format.
    
    {ol 
          {- Example: [DNS_FIREWALL]
             
          ["{\"type\":\"DNS_FIREWALL\",\"preProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-1\",\"priority\":10}],\"postProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-2\",\"priority\":9911}]}"]
          
          
          Valid values for [preProcessRuleGroups] are between 1 and 99. Valid
          values for [postProcessRuleGroups] are between 9901 and 10000.
          }
          
          {- Example: [IMPORT_NETWORK_FIREWALL]
             
          ["{\"type\":\"IMPORT_NETWORK_FIREWALL\",\"awsNetworkFirewallConfig\":{\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-west-2:000000000000:stateless-rulegroup\/rg1\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:drop\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:pass\"],\"networkFirewallStatelessCustomActions\":[],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-west-2:aws-managed:stateful-rulegroup\/ThreatSignaturesEmergingEventsStrictOrder\",\"priority\":8}],\"networkFirewallStatefulEngineOptions\":{\"ruleOrder\":\"STRICT_ORDER\"},\"networkFirewallStatefulDefaultActions\":[\"aws:drop_strict\"]}}"]
          
          
          ["{\"type\":\"DNS_FIREWALL\",\"preProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-1\",\"priority\":10}],\"postProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-2\",\"priority\":9911}]}"]
          
          
          Valid values for [preProcessRuleGroups] are between 1 and 99. Valid
          values for [postProcessRuleGroups] are between 9901 and 10000.
          }
          
          {- Example: [NETWORK_FIREWALL] - Centralized deployment model
             
          ["{\"type\":\"NETWORK_FIREWALL\",\"awsNetworkFirewallConfig\":{\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":true}},\"firewallDeploymentModel\":{\"centralizedFirewallDeploymentModel\":{\"centralizedFirewallOrchestrationConfig\":{\"inspectionVpcIds\":[{\"resourceId\":\"vpc-1234\",\"accountId\":\"123456789011\"}],\"firewallCreationConfig\":{\"endpointLocation\":{\"availabilityZoneConfigList\":[{\"availabilityZoneId\":null,\"availabilityZoneName\":\"us-east-1a\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]}]}},\"allowedIPV4CidrList\":[]}}}}"]
          
          
          To use the centralized deployment model, you must set
          {{: https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html }PolicyOption}
          to [CENTRALIZED].
          }
          
          {- Example: [NETWORK_FIREWALL] - Distributed deployment model with
             automatic Availability Zone configuration
             
          ["{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":[\"10.0.0.0/28\",\"192.168.0.0/28\"],\"routeManagementAction\":\"OFF\"},\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":true}}"]
          
          
          With automatic Availbility Zone configuration, Firewall Manager
          chooses which Availability Zones to create the endpoints in. To use
          the distributed deployment model, you must set
          {{: https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html }PolicyOption}
          to [NULL].
          }
          
          {- Example: [NETWORK_FIREWALL] - Distributed deployment model with
             automatic Availability Zone configuration and route management
             
          ["{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":[\"10.0.0.0/28\",\"192.168.0.0/28\"],\"routeManagementAction\":\"MONITOR\",\"routeManagementTargetTypes\":[\"InternetGateway\"]},\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":
          \"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":true}}"]
          
          
          To use the distributed deployment model, you must set
          {{: https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html }PolicyOption}
          to [NULL].
          }
          
          {- Example: [NETWORK_FIREWALL] - Distributed deployment model with
             custom Availability Zone configuration
             
          ["{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"fragmentcustomactionname\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",
          \"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}},{\"actionName\":\"fragmentcustomactionname\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"fragmentmetricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"firewallCreationConfig\":{
          \"endpointLocation\":{\"availabilityZoneConfigList\":[{\"availabilityZoneName\":\"us-east-1a\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]},{\"availabilityZoneName\":\"us-east-1b\",\"allowedIPV4CidrList\":[
          \"10.0.0.0/28\"]}]}
          },\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":null,\"routeManagementAction\":\"OFF\",\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":boolean}}"]
          
          
          With custom Availability Zone configuration, you define which
          specific Availability Zones to create endpoints in by configuring
          [firewallCreationConfig]. To configure the Availability Zones in
          [firewallCreationConfig], specify either the [availabilityZoneName]
          or [availabilityZoneId] parameter, not both parameters.
          
          To use the distributed deployment model, you must set
          {{: https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html }PolicyOption}
          to [NULL].
          }
          
          {- Example: [NETWORK_FIREWALL] - Distributed deployment model with
             custom Availability Zone configuration and route management
             
          ["{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"fragmentcustomactionname\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}},{\"actionName\":\"fragmentcustomactionname\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"fragmentmetricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"firewallCreationConfig\":{\"endpointLocation\":{\"availabilityZoneConfigList\":[{\"availabilityZoneName\":\"us-east-1a\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]},{\"availabilityZoneName\":\"us-east-1b\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]}]}},\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":null,\"routeManagementAction\":\"MONITOR\",\"routeManagementTargetTypes\":[\"InternetGateway\"],\"routeManagementConfig\":{\"allowCrossAZTrafficIfNoEndpoint\":true}},\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":boolean}}"]
          
          
          To use the distributed deployment model, you must set
          {{: https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html }PolicyOption}
          to [NULL].
          }
          
          {- Example: [SECURITY_GROUPS_COMMON]
             
          ["{\"type\":\"SECURITY_GROUPS_COMMON\",\"revertManualSecurityGroupChanges\":false,\"exclusiveResourceSecurityGroupManagement\":false,
          \"applyToAllEC2InstanceENIs\":false,\"securityGroups\":[{\"id\":\"
          sg-000e55995d61a06bd\"}]}"]
          }
          
          {- Example: [SECURITY_GROUPS_COMMON] - Security group tag
             distribution
             
          [""{\"type\":\"SECURITY_GROUPS_COMMON\",\"securityGroups\":[{\"id\":\"sg-000e55995d61a06bd\"}],\"revertManualSecurityGroupChanges\":true,\"exclusiveResourceSecurityGroupManagement\":false,\"applyToAllEC2InstanceENIs\":false,\"includeSharedVPC\":false,\"enableTagDistribution\":true}""]
          
          
          Firewall Manager automatically distributes tags from the primary
          group to the security groups created by this policy. To use
          security group tag distribution, you must also set
          [revertManualSecurityGroupChanges] to [true], otherwise Firewall
          Manager won't be able to create the policy. When you enable
          [revertManualSecurityGroupChanges], Firewall Manager identifies and
          reports when the security groups created by this policy become
          non-compliant.
          
          Firewall Manager won't distribute system tags added by Amazon Web
          Services services into the replica security groups. System tags
          begin with the [aws:] prefix.
          }
          
          {- Example: Shared VPCs. Apply the preceding policy to resources in
             shared VPCs as well as to those in VPCs that the account owns
             
          ["{\"type\":\"SECURITY_GROUPS_COMMON\",\"revertManualSecurityGroupChanges\":false,\"exclusiveResourceSecurityGroupManagement\":false,
          \"applyToAllEC2InstanceENIs\":false,\"includeSharedVPC\":true,\"securityGroups\":[{\"id\":\"
          sg-000e55995d61a06bd\"}]}"]
          }
          
          {- Example: [SECURITY_GROUPS_CONTENT_AUDIT]
             
          ["{\"type\":\"SECURITY_GROUPS_CONTENT_AUDIT\",\"securityGroups\":[{\"id\":\"sg-000e55995d61a06bd\"}],\"securityGroupAction\":{\"type\":\"ALLOW\"}}"]
          
          
          The security group action for content audit can be [ALLOW] or
          [DENY]. For [ALLOW], all in-scope security group rules must be
          within the allowed range of the policy's security group rules. For
          [DENY], all in-scope security group rules must not contain a value
          or a range that matches a rule value or range in the policy
          security group.
          }
          
          {- Example: [SECURITY_GROUPS_USAGE_AUDIT]
             
          ["{\"type\":\"SECURITY_GROUPS_USAGE_AUDIT\",\"deleteUnusedSecurityGroups\":true,\"coalesceRedundantSecurityGroups\":true}"]
          
          }
          
          {- Example: [SHIELD_ADVANCED] with web ACL management
             
          ["{\"type\":\"SHIELD_ADVANCED\",\"optimizeUnassociatedWebACL\":true}"]
          
          
          If you set [optimizeUnassociatedWebACL] to [true], Firewall Manager
          creates web ACLs in accounts within the policy scope if the web
          ACLs will be used by at least one resource. Firewall Manager
          creates web ACLs in the accounts within policy scope only if the
          web ACLs will be used by at least one resource. If at any time an
          account comes into policy scope, Firewall Manager automatically
          creates a web ACL in the account if at least one resource will use
          the web ACL.
          
          Upon enablement, Firewall Manager performs a one-time cleanup of
          unused web ACLs in your account. The cleanup process can take
          several hours. If a resource leaves policy scope after Firewall
          Manager creates a web ACL, Firewall Manager doesn't disassociate
          the resource from the web ACL. If you want Firewall Manager to
          clean up the web ACL, you must first manually disassociate the
          resources from the web ACL, and then enable the manage unused web
          ACLs option in your policy.
          
          If you set [optimizeUnassociatedWebACL] to [false], and Firewall
          Manager automatically creates an empty web ACL in each account
          that's within policy scope.
          }
          
          {- Specification for [SHIELD_ADVANCED] for Amazon CloudFront
             distributions
             
          ["{\"type\":\"SHIELD_ADVANCED\",\"automaticResponseConfiguration\":
          {\"automaticResponseStatus\":\"ENABLED|IGNORED|DISABLED\",
          \"automaticResponseAction\":\"BLOCK|COUNT\"},
          \"overrideCustomerWebaclClassic\":true|false,
          \"optimizeUnassociatedWebACL\":true|false}"]
          
          For example:
          ["{\"type\":\"SHIELD_ADVANCED\",\"automaticResponseConfiguration\":
          {\"automaticResponseStatus\":\"ENABLED\",
          \"automaticResponseAction\":\"COUNT\"}}"]
          
          The default value for [automaticResponseStatus] is [IGNORED]. The
          value for [automaticResponseAction] is only required when
          [automaticResponseStatus] is set to [ENABLED]. The default value
          for [overrideCustomerWebaclClassic] is [false].
          
          For other resource types that you can protect with a Shield
          Advanced policy, this [ManagedServiceData] configuration is an
          empty string.
          }
          
          {- Example: [THIRD_PARTY_FIREWALL]
             
          Replace [THIRD_PARTY_FIREWALL_NAME] with the name of the
          third-party firewall.
          
          ["{ "type":"THIRD_PARTY_FIREWALL",
          "thirdPartyFirewall":"THIRD_PARTY_FIREWALL_NAME",
          "thirdPartyFirewallConfig":{
          "thirdPartyFirewallPolicyList":["global-1"] },
          "firewallDeploymentModel":{ "distributedFirewallDeploymentModel":{
          "distributedFirewallOrchestrationConfig":{
          "firewallCreationConfig":{ "endpointLocation":{
          "availabilityZoneConfigList":[ {
          "availabilityZoneName":"${AvailabilityZone}" } ] } },
          "allowedIPV4CidrList":[ ] } } } }"]
          }
          
          {- Example: [WAFV2] - Account takeover prevention, Bot Control
             managed rule groups, optimize unassociated web ACL, and rule
             action override
             
          ["{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesATPRuleSet\",\"managedRuleGroupConfigs\":[{\"awsmanagedRulesATPRuleSet\":{\"loginPath\":\"/loginpath\",\"requestInspection\":{\"payloadType\":\"FORM_ENCODED|JSON\",\"usernameField\":{\"identifier\":\"/form/username\"},\"passwordField\":{\"identifier\":\"/form/password\"}}}}]},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],\"sampledRequestsEnabled\":true},{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesBotControlRuleSet\",\"managedRuleGroupConfigs\":[{\"awsmanagedRulesBotControlRuleSet\":{\"inspectionLevel\":\"TARGETED|COMMON\"}}]},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],\"sampledRequestsEnabled\":true,\"ruleActionOverrides\":[{\"name\":\"Rule1\",\"actionToUse\":{\"allow|block|count|captcha|challenge\":{}}},{\"name\":\"Rule2\",\"actionToUse\":{\"allow|block|count|captcha|challenge\":{}}}]}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"ALLOW\"},\"customRequestHandling\":null,\"customResponse\":null,\"overrideCustomerWebACLAssociation\":false,\"loggingConfiguration\":null,\"sampledRequestsEnabledForDefaultActions\":true,\"optimizeUnassociatedWebACL\":true}"]
          
          
          {ol 
                {- Bot Control - For information about
                   [AWSManagedRulesBotControlRuleSet] managed rule groups,
                   see
                   {{: https://docs.aws.amazon.com/waf/latest/APIReference/API_AWSManagedRulesBotControlRuleSet.html }AWSManagedRulesBotControlRuleSet}
                   in the {i WAF API Reference}.
                   }
                
                {- Fraud Control account takeover prevention (ATP) - For
                   information about the properties available for
                   [AWSManagedRulesATPRuleSet] managed rule groups, see
                   {{: https://docs.aws.amazon.com/waf/latest/APIReference/API_AWSManagedRulesATPRuleSet.html }AWSManagedRulesATPRuleSet}
                   in the {i WAF API Reference}.
                   }
                
                {- Optimize unassociated web ACL - If you set
                   [optimizeUnassociatedWebACL] to [true], Firewall Manager
                   creates web ACLs in accounts within the policy scope if
                   the web ACLs will be used by at least one resource.
                   Firewall Manager creates web ACLs in the accounts within
                   policy scope only if the web ACLs will be used by at least
                   one resource. If at any time an account comes into policy
                   scope, Firewall Manager automatically creates a web ACL in
                   the account if at least one resource will use the web ACL.
                   
                Upon enablement, Firewall Manager performs a one-time cleanup
                of unused web ACLs in your account. The cleanup process can
                take several hours. If a resource leaves policy scope after
                Firewall Manager creates a web ACL, Firewall Manager
                disassociates the resource from the web ACL, but won't clean
                up the unused web ACL. Firewall Manager only cleans up unused
                web ACLs when you first enable management of unused web ACLs
                in a policy.
                
                If you set [optimizeUnassociatedWebACL] to [false] Firewall
                Manager doesn't manage unused web ACLs, and Firewall Manager
                automatically creates an empty web ACL in each account that's
                within policy scope.
                }
                
                {- Rule action overrides - Firewall Manager supports rule
                   action overrides only for managed rule groups. To
                   configure a [RuleActionOverrides] add the [Name] of the
                   rule to override, and [ActionToUse], which is the new
                   action to use for the rule. For information about using
                   rule action override, see
                   {{: https://docs.aws.amazon.com/waf/latest/APIReference/API_RuleActionOverride.html }RuleActionOverride}
                   in the {i WAF API Reference}.
                   }
                
          }
          }
          
          {- Example: [WAFV2] - [CAPTCHA] and [Challenge] configs
             
          ["{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesAdminProtectionRuleSet\"},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],\"sampledRequestsEnabled\":true}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"ALLOW\"},\"customRequestHandling\":null,\"customResponse\":null,\"overrideCustomerWebACLAssociation\":false,\"loggingConfiguration\":null,\"sampledRequestsEnabledForDefaultActions\":true,\"captchaConfig\":{\"immunityTimeProperty\":{\"immunityTime\":500}},\"challengeConfig\":{\"immunityTimeProperty\":{\"immunityTime\":800}},\"tokenDomains\":[\"google.com\",\"amazon.com\"],\"associationConfig\":{\"requestBody\":{\"CLOUDFRONT\":{\"defaultSizeInspectionLimit\":\"KB_16\"}}}}"]
          
          
          {ol 
                {- [CAPTCHA] and [Challenge] configs - If you update the
                   policy's values for [associationConfig], [captchaConfig],
                   [challengeConfig], or [tokenDomains], Firewall Manager
                   will overwrite your local web ACLs to contain the new
                   value(s). However, if you don't update the policy's
                   [associationConfig], [captchaConfig], [challengeConfig],
                   or [tokenDomains] values, the values in your local web
                   ACLs will remain unchanged. For information about
                   association configs, see
                   {{: https://docs.aws.amazon.com/waf/latest/APIReference/API_AssociationConfig.html }AssociationConfig}.
                   For information about CAPTCHA and Challenge configs, see
                   {{: https://docs.aws.amazon.com/waf/latest/APIReference/API_CaptchaConfig.html }CaptchaConfig}
                   and
                   {{: https://docs.aws.amazon.com/waf/latest/APIReference/API_ChallengeConfig.html }ChallengeConfig}
                   in the {i WAF API Reference}.
                   }
                
                {- [defaultSizeInspectionLimit] - Specifies the maximum size
                   of the web request body component that an associated
                   Amazon CloudFront distribution should send to WAF for
                   inspection. For more information, see
                   {{: https://docs.aws.amazon.com/waf/latest/APIReference/API_RequestBodyAssociatedResourceTypeConfig.html#WAF-Type-RequestBodyAssociatedResourceTypeConfig-DefaultSizeInspectionLimit }DefaultSizeInspectionLimit}
                   in the {i WAF API Reference}.
                   }
                
          }
          }
          
          {- Example: [WAFV2] - Firewall Manager support for WAF managed rule
             group versioning
             
          ["{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":true,\"version\":\"Version_2.0\",\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesCommonRuleSet\"},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[{\"name\":\"NoUserAgent_HEADER\"}]}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"ALLOW\"},\"overrideCustomerWebACLAssociation\":false,\"loggingConfiguration\":{\"logDestinationConfigs\":[\"arn:aws:firehose:us-west-2:12345678912:deliverystream/aws-waf-logs-fms-admin-destination\"],\"redactedFields\":[{\"redactedFieldType\":\"SingleHeader\",\"redactedFieldValue\":\"Cookies\"},{\"redactedFieldType\":\"Method\"}]}}"]
          
          
          To use a specific version of a WAF managed rule group in your
          Firewall Manager policy, you must set [versionEnabled] to [true],
          and set [version] to the version you'd like to use. If you don't
          set [versionEnabled] to [true], or if you omit [versionEnabled],
          then Firewall Manager uses the default version of the WAF managed
          rule group.
          }
          
          {- Example: [WAFV2] - Logging configurations
             
          ["{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,
          \"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":
          {\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",
          \"managedRuleGroupName\":\"AWSManagedRulesAdminProtectionRuleSet\"}
          ,\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],
          \"sampledRequestsEnabled\":true}],\"postProcessRuleGroups\":[],
          \"defaultAction\":{\"type\":\"ALLOW\"},\"customRequestHandling\"
          :null,\"customResponse\":null,\"overrideCustomerWebACLAssociation\"
          :false,\"loggingConfiguration\":{\"logDestinationConfigs\":
          [\"arn:aws:s3:::aws-waf-logs-example-bucket\"]
          ,\"redactedFields\":[],\"loggingFilterConfigs\":{\"defaultBehavior\":\"KEEP\",
          \"filters\":[{\"behavior\":\"KEEP\",\"requirement\":\"MEETS_ALL\",
          \"conditions\":[{\"actionCondition\":\"CAPTCHA\"},{\"actionCondition\":
          \"CHALLENGE\"},
          {\"actionCondition\":\"EXCLUDED_AS_COUNT\"}]}]}},\"sampledRequestsEnabledForDefaultActions\":true}"]
          
          
          Firewall Manager supports Amazon Kinesis Data Firehose and Amazon
          S3 as the [logDestinationConfigs] in your [loggingConfiguration].
          For information about WAF logging configurations, see
          {{: https://docs.aws.amazon.com/waf/latest/APIReference/API_LoggingConfiguration.html }LoggingConfiguration}
          in the {i WAF API Reference}
          
          In the [loggingConfiguration], you can specify one
          [logDestinationConfigs]. Optionally provide as many as 20
          [redactedFields]. The [RedactedFieldType] must be one of [URI],
          [QUERY_STRING], [HEADER], or [METHOD].
          }
          
          {- Example: [WAF Classic]
             
          ["{\"type\": \"WAF\", \"ruleGroups\":
          [{\"id\":\"12345678-1bcd-9012-efga-0987654321ab\",
          \"overrideAction\" : {\"type\": \"COUNT\"}}], \"defaultAction\":
          {\"type\": \"BLOCK\"}}"]
          }
          
    }
    |}*)

  type_: security_service_type;
   (**{|
    The service that the policy is using to protect the resources. This
    specifies the type of policy that is created, either an WAF policy, a
    Shield Advanced policy, or a security group policy. For security group
    policies, Firewall Manager supports one security group for each common
    policy and for each content audit policy. This is an adjustable limit
    that you can increase by contacting Amazon Web Services Support.|}*)

}

(**{|
    The resource tags that Firewall Manager uses to determine if a particular
    resource should be included or excluded from the Firewall Manager policy.
    Tags enable you to categorize your Amazon Web Services resources in
    different ways, for example, by purpose, owner, or environment. Each tag
    consists of a key and an optional value. Firewall Manager combines the
    tags with "AND" so that, if you add more than one tag to a policy scope,
    a resource must have all the specified tags to be included or excluded.
    For more information, see
    {{: https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/tag-editor.html }Working
    with Tag Editor}.
    
    Every resource tag must have a string value, either a non-empty string or
    an empty string. If you don't provide a value for a resource tag,
    Firewall Manager saves the value as an empty string: "". When Firewall
    Manager compares tags, it only matches two tags if they have the same key
    and the same value. A tag with an empty string value only matches with
    tags that also have an empty string value.|}*)
type resource_tag = {
  value: string option;
   (**{|
    The resource tag value. To specify an empty string value, either don't
    provide this or specify it as "".|}*)

  key: string;
   (**{|
    The resource tag key.|}*)

}

type resource_set_status = | OUT_OF_ADMIN_SCOPE
  | ACTIVE

(**{|
    Summarizes the resource sets used in a policy.|}*)
type resource_set_summary = {
  resource_set_status: resource_set_status option;
   (**{|
    Indicates whether the resource set is in or out of an admin's Region
    scope.
    
    {ol 
          {- [ACTIVE] - The administrator can manage and delete the resource
             set.
             }
          
          {- [OUT_OF_ADMIN_SCOPE] - The administrator can view the resource
             set, but they can't edit or delete the resource set. Existing
             protections stay in place. Any new resource that come into scope
             of the resource set won't be protected.
             }
          
    }
    |}*)

  last_update_time: float option;
   (**{|
    The last time that the resource set was changed.|}*)

  description: string option;
   (**{|
    A description of the resource set.|}*)

  name: string option;
   (**{|
    The descriptive name of the resource set. You can't change the name of a
    resource set after you create it.|}*)

  id: string option;
   (**{|
    A unique identifier for the resource set. This ID is returned in the
    responses to create and list commands. You provide it to operations like
    update and delete.|}*)

}

(**{|
    A set of resources to include in a policy.|}*)
type resource_set = {
  resource_set_status: resource_set_status option;
   (**{|
    Indicates whether the resource set is in or out of an admin's Region
    scope.
    
    {ol 
          {- [ACTIVE] - The administrator can manage and delete the resource
             set.
             }
          
          {- [OUT_OF_ADMIN_SCOPE] - The administrator can view the resource
             set, but they can't edit or delete the resource set. Existing
             protections stay in place. Any new resource that come into scope
             of the resource set won't be protected.
             }
          
    }
    |}*)

  last_update_time: float option;
   (**{|
    The last time that the resource set was changed.|}*)

  resource_type_list: string list;
   (**{|
    Determines the resources that can be associated to the resource set.
    Depending on your setting for max results and the number of resource
    sets, a single call might not return the full list.|}*)

  update_token: string option;
   (**{|
    An optional token that you can use for optimistic locking. Firewall
    Manager returns a token to your requests that access the resource set.
    The token marks the state of the resource set resource at the time of the
    request. Update tokens are not allowed when creating a resource set.
    After creation, each subsequent update call to the resource set requires
    the update token.
    
    To make an unconditional change to the resource set, omit the token in
    your update request. Without the token, Firewall Manager performs your
    updates regardless of whether the resource set has changed since you last
    retrieved it.
    
    To make a conditional change to the resource set, provide the token in
    your update request. Firewall Manager uses the token to ensure that the
    resource set hasn't changed since you last retrieved it. If it has
    changed, the operation fails with an [InvalidTokenException]. If this
    happens, retrieve the resource set again to get a current copy of it with
    a new token. Reapply your changes as needed, then try the operation again
    using the new token.|}*)

  description: string option;
   (**{|
    A description of the resource set.|}*)

  name: string;
   (**{|
    The descriptive name of the resource set. You can't change the name of a
    resource set after you create it.|}*)

  id: string option;
   (**{|
    A unique identifier for the resource set. This ID is returned in the
    responses to create and list commands. You provide it to operations like
    update and delete.|}*)

}

(**{|
    Details of a resource that is associated to an Firewall Manager resource
    set.|}*)
type resource = {
  account_id: string option;
   (**{|
    The Amazon Web Services account ID that the associated resource belongs
    to.|}*)

  ur_i: string;
   (**{|
    The resource's universal resource indicator (URI).|}*)

}

(**{|
    Defines the Amazon Web Services Regions that the specified Firewall
    Manager administrator can manage.|}*)
type region_scope = {
  all_regions_enabled: bool option;
   (**{|
    Allows the specified Firewall Manager administrator to manage all Amazon
    Web Services Regions.|}*)

  regions: string list option;
   (**{|
    The Amazon Web Services Regions that the specified Firewall Manager
    administrator can perform actions in.|}*)

}

type put_resource_set_response = {
  resource_set_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource set.|}*)

  resource_set: resource_set;
   (**{|
    Details about the resource set.|}*)

}

type put_resource_set_request = {
  tag_list: tag list option;
   (**{|
    Retrieves the tags associated with the specified resource set. Tags are
    key:value pairs that you can use to categorize and manage your resources,
    for purposes like billing. For example, you might set the tag key to
    "customer" and the value to the customer name or ID. You can specify one
    or more tags to add to each Amazon Web Services resource, up to 50 tags
    for a resource.|}*)

  resource_set: resource_set;
   (**{|
    Details about the resource set to be created or updated.>|}*)

}

(**{|
    An Firewall Manager protocols list.|}*)
type protocols_list_data = {
  previous_protocols_list: (string * string list) list option;
   (**{|
    A map of previous version numbers to their corresponding protocol arrays.|}*)

  protocols_list: string list;
   (**{|
    An array of protocols in the Firewall Manager protocols list.|}*)

  last_update_time: float option;
   (**{|
    The time that the Firewall Manager protocols list was last updated.|}*)

  create_time: float option;
   (**{|
    The time that the Firewall Manager protocols list was created.|}*)

  list_update_token: string option;
   (**{|
    A unique identifier for each update to the list. When you update the
    list, the update token must match the token of the current version of the
    application list. You can retrieve the update token by getting the list.|}*)

  list_name: string;
   (**{|
    The name of the Firewall Manager protocols list.|}*)

  list_id: string option;
   (**{|
    The ID of the Firewall Manager protocols list.|}*)

}

type put_protocols_list_response = {
  protocols_list_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the protocols list.|}*)

  protocols_list: protocols_list_data option;
   (**{|
    The details of the Firewall Manager protocols list.|}*)

}

type put_protocols_list_request = {
  tag_list: tag list option;
   (**{|
    The tags associated with the resource.|}*)

  protocols_list: protocols_list_data;
   (**{|
    The details of the Firewall Manager protocols list to be created.|}*)

}

type customer_policy_scope_id_type = | ORG_UNIT
  | ACCOUNT

type customer_policy_status = | OUT_OF_ADMIN_SCOPE
  | ACTIVE

(**{|
    An Firewall Manager policy.|}*)
type policy = {
  policy_status: customer_policy_status option;
   (**{|
    Indicates whether the policy is in or out of an admin's policy or Region
    scope.
    
    {ol 
          {- [ACTIVE] - The administrator can manage and delete the policy.
             }
          
          {- [OUT_OF_ADMIN_SCOPE] - The administrator can view the policy,
             but they can't edit or delete the policy. Existing policy
             protections stay in place. Any new resources that come into
             scope of the policy won't be protected.
             }
          
    }
    |}*)

  policy_description: string option;
   (**{|
    Your description of the Firewall Manager policy.|}*)

  resource_set_ids: string list option;
   (**{|
    The unique identifiers of the resource sets used by the policy.|}*)

  exclude_map: (string * string list) list option;
   (**{|
    Specifies the Amazon Web Services account IDs and Organizations
    organizational units (OUs) to exclude from the policy. Specifying an OU
    is the equivalent of specifying all accounts in the OU and in any of its
    child OUs, including any child OUs and accounts that are added at a later
    time.
    
    You can specify inclusions or exclusions, but not both. If you specify an
    [IncludeMap], Firewall Manager applies the policy to all accounts
    specified by the [IncludeMap], and does not evaluate any [ExcludeMap]
    specifications. If you do not specify an [IncludeMap], then Firewall
    Manager applies the policy to all accounts except for those specified by
    the [ExcludeMap].
    
    You can specify account IDs, OUs, or a combination:
    
    {ol 
          {- Specify account IDs by setting the key to [ACCOUNT]. For
             example, the following is a valid map: [{“ACCOUNT” :
             [“accountID1”, “accountID2”]}].
             }
          
          {- Specify OUs by setting the key to [ORG_UNIT]. For example, the
             following is a valid map: [{“ORG_UNIT” : [“ouid111”,
             “ouid112”]}].
             }
          
          {- Specify accounts and OUs together in a single map, separated
             with a comma. For example, the following is a valid map:
             [{“ACCOUNT” : [“accountID1”, “accountID2”],
             “ORG_UNIT” : [“ouid111”, “ouid112”]}].
             }
          
    }
    |}*)

  include_map: (string * string list) list option;
   (**{|
    Specifies the Amazon Web Services account IDs and Organizations
    organizational units (OUs) to include in the policy. Specifying an OU is
    the equivalent of specifying all accounts in the OU and in any of its
    child OUs, including any child OUs and accounts that are added at a later
    time.
    
    You can specify inclusions or exclusions, but not both. If you specify an
    [IncludeMap], Firewall Manager applies the policy to all accounts
    specified by the [IncludeMap], and does not evaluate any [ExcludeMap]
    specifications. If you do not specify an [IncludeMap], then Firewall
    Manager applies the policy to all accounts except for those specified by
    the [ExcludeMap].
    
    You can specify account IDs, OUs, or a combination:
    
    {ol 
          {- Specify account IDs by setting the key to [ACCOUNT]. For
             example, the following is a valid map: [{“ACCOUNT” :
             [“accountID1”, “accountID2”]}].
             }
          
          {- Specify OUs by setting the key to [ORG_UNIT]. For example, the
             following is a valid map: [{“ORG_UNIT” : [“ouid111”,
             “ouid112”]}].
             }
          
          {- Specify accounts and OUs together in a single map, separated
             with a comma. For example, the following is a valid map:
             [{“ACCOUNT” : [“accountID1”, “accountID2”],
             “ORG_UNIT” : [“ouid111”, “ouid112”]}].
             }
          
    }
    |}*)

  delete_unused_fm_managed_resources: bool option;
   (**{|
    Indicates whether Firewall Manager should automatically remove
    protections from resources that leave the policy scope and clean up
    resources that Firewall Manager is managing for accounts when those
    accounts leave policy scope. For example, Firewall Manager will
    disassociate a Firewall Manager managed web ACL from a protected customer
    resource when the customer resource leaves policy scope.
    
    By default, Firewall Manager doesn't remove protections or delete
    Firewall Manager managed resources.
    
    This option is not available for Shield Advanced or WAF Classic policies.|}*)

  remediation_enabled: bool;
   (**{|
    Indicates if the policy should be automatically applied to new resources.|}*)

  exclude_resource_tags: bool;
   (**{|
    If set to [True], resources with the tags that are specified in the
    [ResourceTag] array are not in scope of the policy. If set to [False],
    and the [ResourceTag] array is not null, only resources with the
    specified tags are in scope of the policy.|}*)

  resource_tags: resource_tag list option;
   (**{|
    An array of [ResourceTag] objects.|}*)

  resource_type_list: string list option;
   (**{|
    An array of [ResourceType] objects. Use this only to specify multiple
    resource types. To specify a single resource type, use [ResourceType].|}*)

  resource_type: string;
   (**{|
    The type of resource protected by or in scope of the policy. This is in
    the format shown in the
    {{: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html }Amazon
    Web Services Resource Types Reference}. To apply this policy to multiple
    resource types, specify a resource type of [ResourceTypeList] and then
    specify the resource types in a [ResourceTypeList].
    
    The following are valid resource types for each Firewall Manager policy
    type:
    
    {ol 
          {- Amazon Web Services WAF Classic - [AWS::ApiGateway::Stage],
             [AWS::CloudFront::Distribution], and
             [AWS::ElasticLoadBalancingV2::LoadBalancer].
             }
          
          {- WAF - [AWS::ApiGateway::Stage],
             [AWS::ElasticLoadBalancingV2::LoadBalancer], and
             [AWS::CloudFront::Distribution].
             }
          
          {- Shield Advanced - [AWS::ElasticLoadBalancingV2::LoadBalancer],
             [AWS::ElasticLoadBalancing::LoadBalancer], [AWS::EC2::EIP], and
             [AWS::CloudFront::Distribution].
             }
          
          {- Network ACL - [AWS::EC2::Subnet].
             }
          
          {- Security group usage audit - [AWS::EC2::SecurityGroup].
             }
          
          {- Security group content audit - [AWS::EC2::SecurityGroup],
             [AWS::EC2::NetworkInterface], and [AWS::EC2::Instance].
             }
          
          {- DNS Firewall, Network Firewall, and third-party firewall -
             [AWS::EC2::VPC].
             }
          
    }
    |}*)

  security_service_policy_data: security_service_policy_data;
   (**{|
    Details about the security service that is being used to protect the
    resources.|}*)

  policy_update_token: string option;
   (**{|
    A unique identifier for each update to the policy. When issuing a
    [PutPolicy] request, the [PolicyUpdateToken] in the request must match
    the [PolicyUpdateToken] of the current policy version. To get the
    [PolicyUpdateToken] of the current policy version, use a [GetPolicy]
    request.|}*)

  policy_name: string;
   (**{|
    The name of the Firewall Manager policy.|}*)

  policy_id: string option;
   (**{|
    The ID of the Firewall Manager policy.|}*)

}

type put_policy_response = {
  policy_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the policy.|}*)

  policy: policy option;
   (**{|
    The details of the Firewall Manager policy.|}*)

}

type put_policy_request = {
  tag_list: tag list option;
   (**{|
    The tags to add to the Amazon Web Services resource.|}*)

  policy: policy;
   (**{|
    The details of the Firewall Manager policy to be created.|}*)

}

(**{|
    The value of the [Type] parameter is invalid.|}*)
type invalid_type_exception = {
  message: string option;
  
}

type put_notification_channel_request = {
  sns_role_name: string;
   (**{|
    The Amazon Resource Name (ARN) of the IAM role that allows Amazon SNS to
    record Firewall Manager activity.|}*)

  sns_topic_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the SNS topic that collects
    notifications from Firewall Manager.|}*)

}

(**{|
    An individual Firewall Manager application.|}*)
type app = {
  port: int;
   (**{|
    The application's port number, for example [80].|}*)

  protocol: string;
   (**{|
    The IP protocol name or number. The name can be one of [tcp], [udp], or
    [icmp]. For information on possible numbers, see
    {{: https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml }Protocol
    Numbers}.|}*)

  app_name: string;
   (**{|
    The application's name.|}*)

}

(**{|
    An Firewall Manager applications list.|}*)
type apps_list_data = {
  previous_apps_list: (string * app list) list option;
   (**{|
    A map of previous version numbers to their corresponding [App] object
    arrays.|}*)

  apps_list: app list;
   (**{|
    An array of applications in the Firewall Manager applications list.|}*)

  last_update_time: float option;
   (**{|
    The time that the Firewall Manager applications list was last updated.|}*)

  create_time: float option;
   (**{|
    The time that the Firewall Manager applications list was created.|}*)

  list_update_token: string option;
   (**{|
    A unique identifier for each update to the list. When you update the
    list, the update token must match the token of the current version of the
    application list. You can retrieve the update token by getting the list.|}*)

  list_name: string;
   (**{|
    The name of the Firewall Manager applications list.|}*)

  list_id: string option;
   (**{|
    The ID of the Firewall Manager applications list.|}*)

}

type put_apps_list_response = {
  apps_list_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the applications list.|}*)

  apps_list: apps_list_data option;
   (**{|
    The details of the Firewall Manager applications list.|}*)

}

type put_apps_list_request = {
  tag_list: tag list option;
   (**{|
    The tags associated with the resource.|}*)

  apps_list: apps_list_data;
   (**{|
    The details of the Firewall Manager applications list to be created.|}*)

}

(**{|
    Configures the accounts within the administrator's Organizations
    organization that the specified Firewall Manager administrator can apply
    policies to.|}*)
type account_scope = {
  exclude_specified_accounts: bool option;
   (**{|
    A boolean value that excludes the accounts in [AccountScope$Accounts]
    from the administrator's scope. If true, the Firewall Manager
    administrator can apply policies to all members of the organization
    except for the accounts listed in [AccountScope$Accounts]. You can either
    specify a list of accounts to exclude by [AccountScope$Accounts], or you
    can enable management of all accounts by
    [AccountScope$AllAccountsEnabled]. You cannot specify both.|}*)

  all_accounts_enabled: bool option;
   (**{|
    A boolean value that indicates if the administrator can apply policies to
    all accounts within an organization. If true, the administrator can apply
    policies to all accounts within the organization. You can either enable
    management of all accounts through this operation, or you can specify a
    list of accounts to manage in [AccountScope$Accounts]. You cannot specify
    both.|}*)

  accounts: string list option;
   (**{|
    The list of accounts within the organization that the specified Firewall
    Manager administrator either can or cannot apply policies to, based on
    the value of [ExcludeSpecifiedAccounts]. If [ExcludeSpecifiedAccounts] is
    set to [true], then the Firewall Manager administrator can apply policies
    to all members of the organization except for the accounts in this list.
    If [ExcludeSpecifiedAccounts] is set to [false], then the Firewall
    Manager administrator can only apply policies to the accounts in this
    list.|}*)

}

(**{|
    Defines the Organizations organizational units (OUs) that the specified
    Firewall Manager administrator can apply policies to. For more
    information about OUs in Organizations, see
    {{: https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html }Managing
    organizational units (OUs)} in the {i Organizations User Guide}.|}*)
type organizational_unit_scope = {
  exclude_specified_organizational_units: bool option;
   (**{|
    A boolean value that excludes the OUs in
    [OrganizationalUnitScope$OrganizationalUnits] from the administrator's
    scope. If true, the Firewall Manager administrator can apply policies to
    all OUs in the organization except for the OUs listed in
    [OrganizationalUnitScope$OrganizationalUnits]. You can either specify a
    list of OUs to exclude by [OrganizationalUnitScope$OrganizationalUnits],
    or you can enable management of all OUs by
    [OrganizationalUnitScope$AllOrganizationalUnitsEnabled]. You cannot
    specify both.|}*)

  all_organizational_units_enabled: bool option;
   (**{|
    A boolean value that indicates if the administrator can apply policies to
    all OUs within an organization. If true, the administrator can manage all
    OUs within the organization. You can either enable management of all OUs
    through this operation, or you can specify OUs to manage in
    [OrganizationalUnitScope$OrganizationalUnits]. You cannot specify both.|}*)

  organizational_units: string list option;
   (**{|
    The list of OUs within the organization that the specified Firewall
    Manager administrator either can or cannot apply policies to, based on
    the value of
    [OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits]. If
    [OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits] is set to
    [true], then the Firewall Manager administrator can apply policies to all
    OUs in the organization except for the OUs in this list. If
    [OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits] is set to
    [false], then the Firewall Manager administrator can only apply policies
    to the OUs in this list.|}*)

}

(**{|
    Defines the policy types that the specified Firewall Manager
    administrator can manage.|}*)
type policy_type_scope = {
  all_policy_types_enabled: bool option;
   (**{|
    Allows the specified Firewall Manager administrator to manage all
    Firewall Manager policy types, except for third-party policy types.
    Third-party policy types can only be managed by the Firewall Manager
    default administrator.|}*)

  policy_types: security_service_type list option;
   (**{|
    The list of policy types that the specified Firewall Manager
    administrator can manage.|}*)

}

(**{|
    Defines the resources that the Firewall Manager administrator can manage.
    For more information about administrative scope, see
    {{: https://docs.aws.amazon.com/waf/latest/developerguide/fms-administrators.html }Managing
    Firewall Manager administrators} in the {i Firewall Manager Developer
    Guide}.|}*)
type admin_scope = {
  policy_type_scope: policy_type_scope option;
   (**{|
    Defines the Firewall Manager policy types that the specified Firewall
    Manager administrator can create and manage.|}*)

  region_scope: region_scope option;
   (**{|
    Defines the Amazon Web Services Regions that the specified Firewall
    Manager administrator can perform actions in.|}*)

  organizational_unit_scope: organizational_unit_scope option;
   (**{|
    Defines the Organizations organizational units that the specified
    Firewall Manager administrator can apply policies to. For more
    information about OUs in Organizations, see
    {{: https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html }Managing
    organizational units (OUs)} in the {i Organizations User Guide}.|}*)

  account_scope: account_scope option;
   (**{|
    Defines the accounts that the specified Firewall Manager administrator
    can apply policies to.|}*)

}

type put_admin_account_request = {
  admin_scope: admin_scope option;
   (**{|
    Configures the resources that the specified Firewall Manager
    administrator can manage. As a best practice, set the administrative
    scope according to the principles of least privilege. Only grant the
    administrator the specific resources or permissions that they need to
    perform the duties of their role.|}*)

  admin_account: string;
   (**{|
    The Amazon Web Services account ID to add as an Firewall Manager
    administrator account. The account must be a member of the organization
    that was onboarded to Firewall Manager by {{:  }AssociateAdminAccount}.
    For more information about Organizations, see
    {{: https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html }Managing
    the Amazon Web Services Accounts in Your Organization}.|}*)

}

(**{|
    Details of the Firewall Manager protocols list.|}*)
type protocols_list_data_summary = {
  protocols_list: string list option;
   (**{|
    An array of protocols in the Firewall Manager protocols list.|}*)

  list_name: string option;
   (**{|
    The name of the specified protocols list.|}*)

  list_id: string option;
   (**{|
    The ID of the specified protocols list.|}*)

  list_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the specified protocols list.|}*)

}

(**{|
    Details of the Firewall Manager policy.|}*)
type policy_summary = {
  policy_status: customer_policy_status option;
   (**{|
    Indicates whether the policy is in or out of an admin's policy or Region
    scope.
    
    {ol 
          {- [ACTIVE] - The administrator can manage and delete the policy.
             }
          
          {- [OUT_OF_ADMIN_SCOPE] - The administrator can view the policy,
             but they can't edit or delete the policy. Existing policy
             protections stay in place. Any new resources that come into
             scope of the policy won't be protected.
             }
          
    }
    |}*)

  delete_unused_fm_managed_resources: bool option;
   (**{|
    Indicates whether Firewall Manager should automatically remove
    protections from resources that leave the policy scope and clean up
    resources that Firewall Manager is managing for accounts when those
    accounts leave policy scope. For example, Firewall Manager will
    disassociate a Firewall Manager managed web ACL from a protected customer
    resource when the customer resource leaves policy scope.
    
    By default, Firewall Manager doesn't remove protections or delete
    Firewall Manager managed resources.
    
    This option is not available for Shield Advanced or WAF Classic policies.|}*)

  remediation_enabled: bool option;
   (**{|
    Indicates if the policy should be automatically applied to new resources.|}*)

  security_service_type: security_service_type option;
   (**{|
    The service that the policy is using to protect the resources. This
    specifies the type of policy that is created, either an WAF policy, a
    Shield Advanced policy, or a security group policy.|}*)

  resource_type: string option;
   (**{|
    The type of resource protected by or in scope of the policy. This is in
    the format shown in the
    {{: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html }Amazon
    Web Services Resource Types Reference}.|}*)

  policy_name: string option;
   (**{|
    The name of the specified policy.|}*)

  policy_id: string option;
   (**{|
    The ID of the specified policy.|}*)

  policy_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the specified policy.|}*)

}

type policy_compliance_status_type = | NonCompliant
  | Compliant

(**{|
    Describes the compliance status for the account. An account is considered
    noncompliant if it includes resources that are not protected by the
    specified policy or that don't comply with the policy.|}*)
type evaluation_result = {
  evaluation_limit_exceeded: bool option;
   (**{|
    Indicates that over 100 resources are noncompliant with the Firewall
    Manager policy.|}*)

  violator_count: int option;
   (**{|
    The number of resources that are noncompliant with the specified policy.
    For WAF and Shield Advanced policies, a resource is considered
    noncompliant if it is not associated with the policy. For security group
    policies, a resource is considered noncompliant if it doesn't comply with
    the rules of the policy and remediation is disabled or not possible.|}*)

  compliance_status: policy_compliance_status_type option;
   (**{|
    Describes an Amazon Web Services account's compliance with the Firewall
    Manager policy.|}*)

}

type dependent_service_name = | AWSVirtualPrivateCloud
  | AWSShieldAdvanced
  | AWSWAF
  | AWSConfig

(**{|
    Indicates whether the account is compliant with the specified policy. An
    account is considered noncompliant if it includes resources that are not
    protected by the policy, for WAF and Shield Advanced policies, or that
    are noncompliant with the policy, for security group policies.|}*)
type policy_compliance_status = {
  issue_info_map: (string * string) list option;
   (**{|
    Details about problems with dependent services, such as WAF or Config,
    and the error message received that indicates the problem with the
    service.|}*)

  last_updated: float option;
   (**{|
    Timestamp of the last update to the [EvaluationResult] objects.|}*)

  evaluation_results: evaluation_result list option;
   (**{|
    An array of [EvaluationResult] objects.|}*)

  member_account: string option;
   (**{|
    The member account ID.|}*)

  policy_name: string option;
   (**{|
    The name of the Firewall Manager policy.|}*)

  policy_id: string option;
   (**{|
    The ID of the Firewall Manager policy.|}*)

  policy_owner: string option;
   (**{|
    The Amazon Web Services account that created the Firewall Manager policy.|}*)

}

(**{|
    Details of the resource that is not protected by the policy.|}*)
type compliance_violator = {
  metadata: (string * string) list option;
   (**{|
    Metadata about the resource that doesn't comply with the policy scope.|}*)

  resource_type: string option;
   (**{|
    The resource type. This is in the format shown in the
    {{: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html }Amazon
    Web Services Resource Types Reference}. For example:
    [AWS::ElasticLoadBalancingV2::LoadBalancer],
    [AWS::CloudFront::Distribution], or
    [AWS::NetworkFirewall::FirewallPolicy].|}*)

  violation_reason: violation_reason option;
   (**{|
    The reason that the resource is not protected by the policy.|}*)

  resource_id: string option;
   (**{|
    The resource ID.|}*)

}

(**{|
    Describes the noncompliant resources in a member account for a specific
    Firewall Manager policy. A maximum of 100 entries are displayed. If more
    than 100 resources are noncompliant, [EvaluationLimitExceeded] is set to
    [True].|}*)
type policy_compliance_detail = {
  issue_info_map: (string * string) list option;
   (**{|
    Details about problems with dependent services, such as WAF or Config,
    and the error message received that indicates the problem with the
    service.|}*)

  expired_at: float option;
   (**{|
    A timestamp that indicates when the returned information should be
    considered out of date.|}*)

  evaluation_limit_exceeded: bool option;
   (**{|
    Indicates if over 100 resources are noncompliant with the Firewall
    Manager policy.|}*)

  violators: compliance_violator list option;
   (**{|
    An array of resources that aren't protected by the WAF or Shield Advanced
    policy or that aren't in compliance with the security group policy.|}*)

  member_account: string option;
   (**{|
    The Amazon Web Services account ID.|}*)

  policy_id: string option;
   (**{|
    The ID of the Firewall Manager policy.|}*)

  policy_owner: string option;
   (**{|
    The Amazon Web Services account that created the Firewall Manager policy.|}*)

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
   (**{|
    The value that you will use for [NextToken] in the next
    [ListThirdPartyFirewallFirewallPolicies] request.|}*)

  third_party_firewall_firewall_policies: third_party_firewall_firewall_policy list option;
   (**{|
    A list that contains one [ThirdPartyFirewallFirewallPolicies] element for
    each third-party firewall policies that the specified third-party
    firewall vendor is associated with. Each
    [ThirdPartyFirewallFirewallPolicies] element contains the firewall policy
    name and ID.|}*)

}

type list_third_party_firewall_firewall_policies_request = {
  max_results: int;
   (**{|
    The maximum number of third-party firewall policies that you want
    Firewall Manager to return. If the specified third-party firewall vendor
    is associated with more than [MaxResults] firewall policies, the response
    includes a [NextToken] element. [NextToken] contains an encrypted token
    that identifies the first third-party firewall policies that Firewall
    Manager will return if you submit another request.|}*)

  next_token: string option;
   (**{|
    If the previous response included a [NextToken] element, the specified
    third-party firewall vendor is associated with more third-party firewall
    policies. To get more third-party firewall policies, submit another
    [ListThirdPartyFirewallFirewallPoliciesRequest] request.
    
    For the value of [NextToken], specify the value of [NextToken] from the
    previous response. If the previous response didn't include a [NextToken]
    element, there are no more third-party firewall policies to get.|}*)

  third_party_firewall: third_party_firewall;
   (**{|
    The name of the third-party firewall vendor.|}*)

}

type list_tags_for_resource_response = {
  tag_list: tag list option;
   (**{|
    The tags associated with the resource.|}*)

}

type list_tags_for_resource_request = {
  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource to return tags for. The
    Firewall Manager resources that support tagging are policies,
    applications lists, and protocols lists.|}*)

}

type list_resource_sets_response = {
  next_token: string option;
   (**{|
    When you request a list of objects with a [MaxResults] setting, if the
    number of objects that are still available for retrieval exceeds the
    maximum you requested, Firewall Manager returns a [NextToken] value in
    the response. To retrieve the next batch of objects, use the token
    returned from the prior request in your next request.|}*)

  resource_sets: resource_set_summary list option;
   (**{|
    An array of [ResourceSetSummary] objects.|}*)

}

type list_resource_sets_request = {
  max_results: int option;
   (**{|
    The maximum number of objects that you want Firewall Manager to return
    for this request. If more objects are available, in the response,
    Firewall Manager provides a [NextToken] value that you can use in a
    subsequent call to get the next batch of objects.|}*)

  next_token: string option;
   (**{|
    When you request a list of objects with a [MaxResults] setting, if the
    number of objects that are still available for retrieval exceeds the
    maximum you requested, Firewall Manager returns a [NextToken] value in
    the response. To retrieve the next batch of objects, use the token
    returned from the prior request in your next request.|}*)

}

type list_resource_set_resources_response = {
  next_token: string option;
   (**{|
    When you request a list of objects with a [MaxResults] setting, if the
    number of objects that are still available for retrieval exceeds the
    maximum you requested, Firewall Manager returns a [NextToken] value in
    the response. To retrieve the next batch of objects, use the token
    returned from the prior request in your next request.|}*)

  items: resource list;
   (**{|
    An array of the associated resources' uniform resource identifiers (URI).|}*)

}

type list_resource_set_resources_request = {
  next_token: string option;
   (**{|
    When you request a list of objects with a [MaxResults] setting, if the
    number of objects that are still available for retrieval exceeds the
    maximum you requested, Firewall Manager returns a [NextToken] value in
    the response. To retrieve the next batch of objects, use the token
    returned from the prior request in your next request.|}*)

  max_results: int option;
   (**{|
    The maximum number of objects that you want Firewall Manager to return
    for this request. If more objects are available, in the response,
    Firewall Manager provides a [NextToken] value that you can use in a
    subsequent call to get the next batch of objects.|}*)

  identifier: string;
   (**{|
    A unique identifier for the resource set, used in a request to refer to
    the resource set.|}*)

}

type list_protocols_lists_response = {
  next_token: string option;
   (**{|
    If you specify a value for [MaxResults] in your list request, and you
    have more objects than the maximum, Firewall Manager returns this token
    in the response. You can use this token in subsequent requests to
    retrieve the next batch of objects.|}*)

  protocols_lists: protocols_list_data_summary list option;
   (**{|
    An array of [ProtocolsListDataSummary] objects.|}*)

}

type list_protocols_lists_request = {
  max_results: int;
   (**{|
    The maximum number of objects that you want Firewall Manager to return
    for this request. If more objects are available, in the response,
    Firewall Manager provides a [NextToken] value that you can use in a
    subsequent call to get the next batch of objects.
    
    If you don't specify this, Firewall Manager returns all available
    objects.|}*)

  next_token: string option;
   (**{|
    If you specify a value for [MaxResults] in your list request, and you
    have more objects than the maximum, Firewall Manager returns this token
    in the response. For all but the first request, you provide the token
    returned by the prior request in the request parameters, to retrieve the
    next batch of objects.|}*)

  default_lists: bool option;
   (**{|
    Specifies whether the lists to retrieve are default lists owned by
    Firewall Manager.|}*)

}

type list_policies_response = {
  next_token: string option;
   (**{|
    If you have more [PolicySummary] objects than the number that you
    specified for [MaxResults] in the request, the response includes a
    [NextToken] value. To list more [PolicySummary] objects, submit another
    [ListPolicies] request, and specify the [NextToken] value from the
    response in the [NextToken] value in the next request.|}*)

  policy_list: policy_summary list option;
   (**{|
    An array of [PolicySummary] objects.|}*)

}

type list_policies_request = {
  max_results: int option;
   (**{|
    Specifies the number of [PolicySummary] objects that you want Firewall
    Manager to return for this request. If you have more [PolicySummary]
    objects than the number that you specify for [MaxResults], the response
    includes a [NextToken] value that you can use to get another batch of
    [PolicySummary] objects.|}*)

  next_token: string option;
   (**{|
    If you specify a value for [MaxResults] and you have more [PolicySummary]
    objects than the number that you specify for [MaxResults], Firewall
    Manager returns a [NextToken] value in the response that allows you to
    list another group of [PolicySummary] objects. For the second and
    subsequent [ListPolicies] requests, specify the value of [NextToken] from
    the previous response to get information about another batch of
    [PolicySummary] objects.|}*)

}

type list_member_accounts_response = {
  next_token: string option;
   (**{|
    If you have more member account IDs than the number that you specified
    for [MaxResults] in the request, the response includes a [NextToken]
    value. To list more IDs, submit another [ListMemberAccounts] request, and
    specify the [NextToken] value from the response in the [NextToken] value
    in the next request.|}*)

  member_accounts: string list option;
   (**{|
    An array of account IDs.|}*)

}

type list_member_accounts_request = {
  max_results: int option;
   (**{|
    Specifies the number of member account IDs that you want Firewall Manager
    to return for this request. If you have more IDs than the number that you
    specify for [MaxResults], the response includes a [NextToken] value that
    you can use to get another batch of member account IDs.|}*)

  next_token: string option;
   (**{|
    If you specify a value for [MaxResults] and you have more account IDs
    than the number that you specify for [MaxResults], Firewall Manager
    returns a [NextToken] value in the response that allows you to list
    another group of IDs. For the second and subsequent
    [ListMemberAccountsRequest] requests, specify the value of [NextToken]
    from the previous response to get information about another batch of
    member account IDs.|}*)

}

(**{|
    A resource in the organization that's available to be associated with a
    Firewall Manager resource set.|}*)
type discovered_resource = {
  name: string option;
   (**{|
    The name of the discovered resource.|}*)

  type_: string option;
   (**{|
    The type of the discovered resource.|}*)

  account_id: string option;
   (**{|
    The Amazon Web Services account ID associated with the discovered
    resource.|}*)

  ur_i: string option;
   (**{|
    The universal resource identifier (URI) of the discovered resource.|}*)

}

type list_discovered_resources_response = {
  next_token: string option;
   (**{|
    When you request a list of objects with a [MaxResults] setting, if the
    number of objects that are still available for retrieval exceeds the
    maximum you requested, Firewall Manager returns a [NextToken] value in
    the response. To retrieve the next batch of objects, use the token
    returned from the prior request in your next request.|}*)

  items: discovered_resource list option;
   (**{|
    Details of the resources that were discovered.|}*)

}

type list_discovered_resources_request = {
  next_token: string option;
   (**{|
    When you request a list of objects with a [MaxResults] setting, if the
    number of objects that are still available for retrieval exceeds the
    maximum you requested, Firewall Manager returns a [NextToken] value in
    the response. To retrieve the next batch of objects, use the token
    returned from the prior request in your next request.|}*)

  max_results: int option;
   (**{|
    The maximum number of objects that you want Firewall Manager to return
    for this request. If more objects are available, in the response,
    Firewall Manager provides a [NextToken] value that you can use in a
    subsequent call to get the next batch of objects.|}*)

  resource_type: string;
   (**{|
    The type of resources to discover.|}*)

  member_account_ids: string list;
   (**{|
    The Amazon Web Services account IDs to discover resources in. Only one
    account is supported per request. The account must be a member of your
    organization.|}*)

}

type list_compliance_status_response = {
  next_token: string option;
   (**{|
    If you have more [PolicyComplianceStatus] objects than the number that
    you specified for [MaxResults] in the request, the response includes a
    [NextToken] value. To list more [PolicyComplianceStatus] objects, submit
    another [ListComplianceStatus] request, and specify the [NextToken] value
    from the response in the [NextToken] value in the next request.|}*)

  policy_compliance_status_list: policy_compliance_status list option;
   (**{|
    An array of [PolicyComplianceStatus] objects.|}*)

}

type list_compliance_status_request = {
  max_results: int option;
   (**{|
    Specifies the number of [PolicyComplianceStatus] objects that you want
    Firewall Manager to return for this request. If you have more
    [PolicyComplianceStatus] objects than the number that you specify for
    [MaxResults], the response includes a [NextToken] value that you can use
    to get another batch of [PolicyComplianceStatus] objects.|}*)

  next_token: string option;
   (**{|
    If you specify a value for [MaxResults] and you have more
    [PolicyComplianceStatus] objects than the number that you specify for
    [MaxResults], Firewall Manager returns a [NextToken] value in the
    response that allows you to list another group of
    [PolicyComplianceStatus] objects. For the second and subsequent
    [ListComplianceStatus] requests, specify the value of [NextToken] from
    the previous response to get information about another batch of
    [PolicyComplianceStatus] objects.|}*)

  policy_id: string;
   (**{|
    The ID of the Firewall Manager policy that you want the details for.|}*)

}

(**{|
    Details of the Firewall Manager applications list.|}*)
type apps_list_data_summary = {
  apps_list: app list option;
   (**{|
    An array of [App] objects in the Firewall Manager applications list.|}*)

  list_name: string option;
   (**{|
    The name of the applications list.|}*)

  list_id: string option;
   (**{|
    The ID of the applications list.|}*)

  list_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the applications list.|}*)

}

type list_apps_lists_response = {
  next_token: string option;
   (**{|
    If you specify a value for [MaxResults] in your list request, and you
    have more objects than the maximum, Firewall Manager returns this token
    in the response. You can use this token in subsequent requests to
    retrieve the next batch of objects.|}*)

  apps_lists: apps_list_data_summary list option;
   (**{|
    An array of [AppsListDataSummary] objects.|}*)

}

type list_apps_lists_request = {
  max_results: int;
   (**{|
    The maximum number of objects that you want Firewall Manager to return
    for this request. If more objects are available, in the response,
    Firewall Manager provides a [NextToken] value that you can use in a
    subsequent call to get the next batch of objects.
    
    If you don't specify this, Firewall Manager returns all available
    objects.|}*)

  next_token: string option;
   (**{|
    If you specify a value for [MaxResults] in your list request, and you
    have more objects than the maximum, Firewall Manager returns this token
    in the response. For all but the first request, you provide the token
    returned by the prior request in the request parameters, to retrieve the
    next batch of objects.|}*)

  default_lists: bool option;
   (**{|
    Specifies whether the lists to retrieve are default lists owned by
    Firewall Manager.|}*)

}

type list_admins_managing_account_response = {
  next_token: string option;
   (**{|
    When you request a list of objects with a [MaxResults] setting, if the
    number of objects that are still available for retrieval exceeds the
    maximum you requested, Firewall Manager returns a [NextToken] value in
    the response. To retrieve the next batch of objects, use the token
    returned from the prior request in your next request.|}*)

  admin_accounts: string list option;
   (**{|
    The list of accounts who manage member accounts within their
    {{:  }AdminScope}.|}*)

}

type list_admins_managing_account_request = {
  max_results: int option;
   (**{|
    The maximum number of objects that you want Firewall Manager to return
    for this request. If more objects are available, in the response,
    Firewall Manager provides a [NextToken] value that you can use in a
    subsequent call to get the next batch of objects.|}*)

  next_token: string option;
   (**{|
    When you request a list of objects with a [MaxResults] setting, if the
    number of objects that are still available for retrieval exceeds the
    maximum you requested, Firewall Manager returns a [NextToken] value in
    the response. To retrieve the next batch of objects, use the token
    returned from the prior request in your next request.|}*)

}

(**{|
    Contains high level information about the Firewall Manager administrator
    account.|}*)
type admin_account_summary = {
  status: organization_status option;
   (**{|
    The current status of the request to onboard a member account as an
    Firewall Manager administrator.
    
    {ol 
          {- [ONBOARDING] - The account is onboarding to Firewall Manager as
             an administrator.
             }
          
          {- [ONBOARDING_COMPLETE] - Firewall Manager The account is
             onboarded to Firewall Manager as an administrator, and can
             perform actions on the resources defined in their
             {{:  }AdminScope}.
             }
          
          {- [OFFBOARDING] - The account is being removed as an Firewall
             Manager administrator.
             }
          
          {- [OFFBOARDING_COMPLETE] - The account has been removed as an
             Firewall Manager administrator.
             }
          
    }
    |}*)

  default_admin: bool option;
   (**{|
    A boolean value that indicates if the administrator is the default
    administrator. If true, then this is the default administrator account.
    The default administrator can manage third-party firewalls and has full
    administrative scope. There is only one default administrator account per
    organization. For information about Firewall Manager default
    administrator accounts, see
    {{: https://docs.aws.amazon.com/waf/latest/developerguide/fms-administrators.html }Managing
    Firewall Manager administrators} in the {i Firewall Manager Developer
    Guide}.|}*)

  admin_account: string option;
   (**{|
    The Amazon Web Services account ID of the Firewall Manager
    administrator's account.|}*)

}

type list_admin_accounts_for_organization_response = {
  next_token: string option;
   (**{|
    When you request a list of objects with a [MaxResults] setting, if the
    number of objects that are still available for retrieval exceeds the
    maximum you requested, Firewall Manager returns a [NextToken] value in
    the response. To retrieve the next batch of objects, use the token
    returned from the prior request in your next request.|}*)

  admin_accounts: admin_account_summary list option;
   (**{|
    A list of Firewall Manager administrator accounts within the organization
    that were onboarded as administrators by {{:  }AssociateAdminAccount} or
    {{:  }PutAdminAccount}.|}*)

}

type list_admin_accounts_for_organization_request = {
  max_results: int option;
   (**{|
    The maximum number of objects that you want Firewall Manager to return
    for this request. If more objects are available, in the response,
    Firewall Manager provides a [NextToken] value that you can use in a
    subsequent call to get the next batch of objects.|}*)

  next_token: string option;
   (**{|
    When you request a list of objects with a [MaxResults] setting, if the
    number of objects that are still available for retrieval exceeds the
    maximum you requested, Firewall Manager returns a [NextToken] value in
    the response. To retrieve the next batch of objects, use the token
    returned from the prior request in your next request.|}*)

}

type get_violation_details_response = {
  violation_detail: violation_detail option;
   (**{|
    Violation detail for a resource.|}*)

}

type get_violation_details_request = {
  resource_type: string;
   (**{|
    The resource type. This is in the format shown in the
    {{: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html }Amazon
    Web Services Resource Types Reference}. Supported resource types are:
    [AWS::EC2::Instance], [AWS::EC2::NetworkInterface],
    [AWS::EC2::SecurityGroup], [AWS::NetworkFirewall::FirewallPolicy], and
    [AWS::EC2::Subnet].|}*)

  resource_id: string;
   (**{|
    The ID of the resource that has violations.|}*)

  member_account: string;
   (**{|
    The Amazon Web Services account ID that you want the details for.|}*)

  policy_id: string;
   (**{|
    The ID of the Firewall Manager policy that you want the details for. You
    can get violation details for the following policy types:
    
    {ol 
          {- DNS Firewall
             }
          
          {- Imported Network Firewall
             }
          
          {- Network Firewall
             }
          
          {- Security group content audit
             }
          
          {- Network ACL
             }
          
          {- Third-party firewall
             }
          
    }
    |}*)

}

type get_third_party_firewall_association_status_response = {
  marketplace_onboarding_status: marketplace_subscription_onboarding_status option;
   (**{|
    The status for subscribing to the third-party firewall vendor in the
    Amazon Web Services Marketplace.
    
    {ol 
          {- [NO_SUBSCRIPTION] - The Firewall Manager policy administrator
             isn't subscribed to the third-party firewall service in the
             Amazon Web Services Marketplace.
             }
          
          {- [NOT_COMPLETE] - The Firewall Manager policy administrator is in
             the process of subscribing to the third-party firewall service
             in the Amazon Web Services Marketplace, but doesn't yet have an
             active subscription.
             }
          
          {- [COMPLETE] - The Firewall Manager policy administrator has an
             active subscription to the third-party firewall service in the
             Amazon Web Services Marketplace.
             }
          
    }
    |}*)

  third_party_firewall_status: third_party_firewall_association_status option;
   (**{|
    The current status for setting a Firewall Manager policy administrators
    account as an administrator of the third-party firewall tenant.
    
    {ol 
          {- [ONBOARDING] - The Firewall Manager policy administrator is
             being designated as a tenant administrator.
             }
          
          {- [ONBOARD_COMPLETE] - The Firewall Manager policy administrator
             is designated as a tenant administrator.
             }
          
          {- [OFFBOARDING] - The Firewall Manager policy administrator is
             being removed as a tenant administrator.
             }
          
          {- [OFFBOARD_COMPLETE] - The Firewall Manager policy administrator
             has been removed as a tenant administrator.
             }
          
          {- [NOT_EXIST] - The Firewall Manager policy administrator doesn't
             exist as a tenant administrator.
             }
          
    }
    |}*)

}

type get_third_party_firewall_association_status_request = {
  third_party_firewall: third_party_firewall;
   (**{|
    The name of the third-party firewall vendor.|}*)

}

type get_resource_set_response = {
  resource_set_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource set.|}*)

  resource_set: resource_set;
   (**{|
    Information about the specified resource set.|}*)

}

type get_resource_set_request = {
  identifier: string;
   (**{|
    A unique identifier for the resource set, used in a request to refer to
    the resource set.|}*)

}

type get_protocols_list_response = {
  protocols_list_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the specified protocols list.|}*)

  protocols_list: protocols_list_data option;
   (**{|
    Information about the specified Firewall Manager protocols list.|}*)

}

type get_protocols_list_request = {
  default_list: bool option;
   (**{|
    Specifies whether the list to retrieve is a default list owned by
    Firewall Manager.|}*)

  list_id: string;
   (**{|
    The ID of the Firewall Manager protocols list that you want the details
    for.|}*)

}

type get_protection_status_response = {
  next_token: string option;
   (**{|
    If you have more objects than the number that you specified for
    [MaxResults] in the request, the response includes a [NextToken] value.
    To list more objects, submit another [GetProtectionStatus] request, and
    specify the [NextToken] value from the response in the [NextToken] value
    in the next request.
    
    Amazon Web Services SDKs provide auto-pagination that identify
    [NextToken] in a response and make subsequent request calls automatically
    on your behalf. However, this feature is not supported by
    [GetProtectionStatus]. You must submit subsequent requests with
    [NextToken] using your own processes.|}*)

  data: string option;
   (**{|
    Details about the attack, including the following:
    
    {ol 
          {- Attack type
             }
          
          {- Account ID
             }
          
          {- ARN of the resource attacked
             }
          
          {- Start time of the attack
             }
          
          {- End time of the attack (ongoing attacks will not have an end
             time)
             }
          
    }
    
    The details are in JSON format.|}*)

  service_type: security_service_type option;
   (**{|
    The service type that is protected by the policy. Currently, this is
    always [SHIELD_ADVANCED].|}*)

  admin_account_id: string option;
   (**{|
    The ID of the Firewall Manager administrator account for this policy.|}*)

}

type get_protection_status_request = {
  max_results: int option;
   (**{|
    Specifies the number of objects that you want Firewall Manager to return
    for this request. If you have more objects than the number that you
    specify for [MaxResults], the response includes a [NextToken] value that
    you can use to get another batch of objects.|}*)

  next_token: string option;
   (**{|
    If you specify a value for [MaxResults] and you have more objects than
    the number that you specify for [MaxResults], Firewall Manager returns a
    [NextToken] value in the response, which you can use to retrieve another
    group of objects. For the second and subsequent [GetProtectionStatus]
    requests, specify the value of [NextToken] from the previous response to
    get information about another batch of objects.|}*)

  end_time: float option;
   (**{|
    The end of the time period to query for the attacks. This is a
    [timestamp] type. The request syntax listing indicates a [number] type
    because the default used by Firewall Manager is Unix time in seconds.
    However, any valid [timestamp] format is allowed.|}*)

  start_time: float option;
   (**{|
    The start of the time period to query for the attacks. This is a
    [timestamp] type. The request syntax listing indicates a [number] type
    because the default used by Firewall Manager is Unix time in seconds.
    However, any valid [timestamp] format is allowed.|}*)

  member_account_id: string option;
   (**{|
    The Amazon Web Services account that is in scope of the policy that you
    want to get the details for.|}*)

  policy_id: string;
   (**{|
    The ID of the policy for which you want to get the attack information.|}*)

}

type get_policy_response = {
  policy_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the specified policy.|}*)

  policy: policy option;
   (**{|
    Information about the specified Firewall Manager policy.|}*)

}

type get_policy_request = {
  policy_id: string;
   (**{|
    The ID of the Firewall Manager policy that you want the details for.|}*)

}

type get_notification_channel_response = {
  sns_role_name: string option;
   (**{|
    The IAM role that is used by Firewall Manager to record activity to SNS.|}*)

  sns_topic_arn: string option;
   (**{|
    The SNS topic that records Firewall Manager activity.|}*)

}

type get_notification_channel_request = unit

type get_compliance_detail_response = {
  policy_compliance_detail: policy_compliance_detail option;
   (**{|
    Information about the resources and the policy that you specified in the
    [GetComplianceDetail] request.|}*)

}

type get_compliance_detail_request = {
  member_account: string;
   (**{|
    The Amazon Web Services account that owns the resources that you want to
    get the details for.|}*)

  policy_id: string;
   (**{|
    The ID of the policy that you want to get the details for. [PolicyId] is
    returned by [PutPolicy] and by [ListPolicies].|}*)

}

type get_apps_list_response = {
  apps_list_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the applications list.|}*)

  apps_list: apps_list_data option;
   (**{|
    Information about the specified Firewall Manager applications list.|}*)

}

type get_apps_list_request = {
  default_list: bool option;
   (**{|
    Specifies whether the list to retrieve is a default list owned by
    Firewall Manager.|}*)

  list_id: string;
   (**{|
    The ID of the Firewall Manager applications list that you want the
    details for.|}*)

}

type get_admin_scope_response = {
  status: organization_status option;
   (**{|
    The current status of the request to onboard a member account as an
    Firewall Manager administrator.
    
    {ol 
          {- [ONBOARDING] - The account is onboarding to Firewall Manager as
             an administrator.
             }
          
          {- [ONBOARDING_COMPLETE] - Firewall Manager The account is
             onboarded to Firewall Manager as an administrator, and can
             perform actions on the resources defined in their
             {{:  }AdminScope}.
             }
          
          {- [OFFBOARDING] - The account is being removed as an Firewall
             Manager administrator.
             }
          
          {- [OFFBOARDING_COMPLETE] - The account has been removed as an
             Firewall Manager administrator.
             }
          
    }
    |}*)

  admin_scope: admin_scope option;
   (**{|
    Contains details about the administrative scope of the requested account.|}*)

}

type get_admin_scope_request = {
  admin_account: string;
   (**{|
    The administrator account that you want to get the details for.|}*)

}

type account_role_status = | Deleted
  | Deleting
  | PendingDeletion
  | Creating
  | Ready

type get_admin_account_response = {
  role_status: account_role_status option;
   (**{|
    The status of the account that you set as the Firewall Manager default
    administrator.|}*)

  admin_account: string option;
   (**{|
    The account that is set as the Firewall Manager default administrator.|}*)

}

type get_admin_account_request = unit

type failed_item_reason = | NotValidAccountId
  | NotValidResourceType
  | NotValidService
  | NotValidRegion
  | NotValidPartition
  | NotValidArn

(**{|
    Details of a resource that failed when trying to update it's association
    to a resource set.|}*)
type failed_item = {
  reason: failed_item_reason option;
   (**{|
    The reason the resource's association could not be updated.|}*)

  ur_i: string option;
   (**{|
    The univeral resource indicator (URI) of the resource that failed.|}*)

}

type disassociate_third_party_firewall_response = {
  third_party_firewall_status: third_party_firewall_association_status option;
   (**{|
    The current status for the disassociation of a Firewall Manager
    administrators account with a third-party firewall.|}*)

}

type disassociate_third_party_firewall_request = {
  third_party_firewall: third_party_firewall;
   (**{|
    The name of the third-party firewall vendor.|}*)

}

type disassociate_admin_account_request = unit

type delete_resource_set_request = {
  identifier: string;
   (**{|
    A unique identifier for the resource set, used in a request to refer to
    the resource set.|}*)

}

type delete_protocols_list_request = {
  list_id: string;
   (**{|
    The ID of the protocols list that you want to delete. You can retrieve
    this ID from [PutProtocolsList], [ListProtocolsLists], and
    [GetProtocolsLost].|}*)

}

type delete_policy_request = {
  delete_all_policy_resources: bool option;
   (**{|
    If [True], the request performs cleanup according to the policy type.
    
    For WAF and Shield Advanced policies, the cleanup does the following:
    
    {ol 
          {- Deletes rule groups created by Firewall Manager
             }
          
          {- Removes web ACLs from in-scope resources
             }
          
          {- Deletes web ACLs that contain no rules or rule groups
             }
          
    }
    
    For security group policies, the cleanup does the following for each
    security group in the policy:
    
    {ol 
          {- Disassociates the security group from in-scope resources
             }
          
          {- Deletes the security group if it was created through Firewall
             Manager and if it's no longer associated with any resources
             through another policy
             }
          
    }
    
    For security group common policies, even if set to [False], Firewall
    Manager deletes all security groups created by Firewall Manager that
    aren't associated with any other resources through another policy.
    
    After the cleanup, in-scope resources are no longer protected by web ACLs
    in this policy. Protection of out-of-scope resources remains unchanged.
    Scope is determined by tags that you create and accounts that you
    associate with the policy. When creating the policy, if you specify that
    only resources in specific accounts or with specific tags are in scope of
    the policy, those accounts and resources are handled by the policy. All
    others are out of scope. If you don't specify tags or accounts, all
    resources are in scope.|}*)

  policy_id: string;
   (**{|
    The ID of the policy that you want to delete. You can retrieve this ID
    from [PutPolicy] and [ListPolicies].|}*)

}

type delete_notification_channel_request = unit

type delete_apps_list_request = {
  list_id: string;
   (**{|
    The ID of the applications list that you want to delete. You can retrieve
    this ID from [PutAppsList], [ListAppsLists], and [GetAppsList].|}*)

}

type batch_disassociate_resource_response = {
  failed_items: failed_item list;
   (**{|
    The resources that failed to disassociate from the resource set.|}*)

  resource_set_identifier: string;
   (**{|
    A unique identifier for the resource set, used in a request to refer to
    the resource set.|}*)

}

type batch_disassociate_resource_request = {
  items: string list;
   (**{|
    The uniform resource identifiers (URI) of resources that should be
    disassociated from the resource set. The URIs must be Amazon Resource
    Names (ARNs).|}*)

  resource_set_identifier: string;
   (**{|
    A unique identifier for the resource set, used in a request to refer to
    the resource set.|}*)

}

type batch_associate_resource_response = {
  failed_items: failed_item list;
   (**{|
    The resources that failed to associate to the resource set.|}*)

  resource_set_identifier: string;
   (**{|
    A unique identifier for the resource set, used in a request to refer to
    the resource set.|}*)

}

type batch_associate_resource_request = {
  items: string list;
   (**{|
    The uniform resource identifiers (URIs) of resources that should be
    associated to the resource set. The URIs must be Amazon Resource Names
    (ARNs).|}*)

  resource_set_identifier: string;
   (**{|
    A unique identifier for the resource set, used in a request to refer to
    the resource set.|}*)

}

type associate_third_party_firewall_response = {
  third_party_firewall_status: third_party_firewall_association_status option;
   (**{|
    The current status for setting a Firewall Manager policy administrator's
    account as an administrator of the third-party firewall tenant.
    
    {ol 
          {- [ONBOARDING] - The Firewall Manager policy administrator is
             being designated as a tenant administrator.
             }
          
          {- [ONBOARD_COMPLETE] - The Firewall Manager policy administrator
             is designated as a tenant administrator.
             }
          
          {- [OFFBOARDING] - The Firewall Manager policy administrator is
             being removed as a tenant administrator.
             }
          
          {- [OFFBOARD_COMPLETE] - The Firewall Manager policy administrator
             has been removed as a tenant administrator.
             }
          
          {- [NOT_EXIST] - The Firewall Manager policy administrator doesn't
             exist as a tenant administrator.
             }
          
    }
    |}*)

}

type associate_third_party_firewall_request = {
  third_party_firewall: third_party_firewall;
   (**{|
    The name of the third-party firewall vendor.|}*)

}

type associate_admin_account_request = {
  admin_account: string;
   (**{|
    The Amazon Web Services account ID to associate with Firewall Manager as
    the Firewall Manager default administrator account. This account must be
    a member account of the organization in Organizations whose resources you
    want to protect. For more information about Organizations, see
    {{: https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html }Managing
    the Amazon Web Services Accounts in Your Organization}.|}*)

}

(**{|
    This is the {i Firewall Manager API Reference}. This guide is for
    developers who need detailed information about the Firewall Manager API
    actions, data types, and errors. For detailed information about Firewall
    Manager features, see the
    {{: https://docs.aws.amazon.com/waf/latest/developerguide/fms-chapter.html }Firewall
    Manager Developer Guide}.
    
    Some API actions require explicit resource permissions. For information,
    see the developer guide topic
    {{: https://docs.aws.amazon.com/waf/latest/developerguide/fms-security_iam_service-with-iam.html#fms-security_iam_service-with-iam-roles-service }Service
    roles for Firewall Manager}.|}*)


type base_document = Json.t

