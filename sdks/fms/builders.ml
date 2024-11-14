[@@@warning "-39"]
open Types
let make_partial_match 
  ?(target_violation_reasons : string list option)
  ?(reference : string option)
  () : partial_match = { target_violation_reasons; reference; 
}

let make_security_group_rule_description 
  ?(to_port : int option)
  ?(from_port : int option)
  ?(protocol : string option)
  ?(prefix_list_id : string option)
  ?(ipv6_range : string option)
  ?(ipv4_range : string option)
  () : security_group_rule_description = {
  to_port; from_port; protocol; prefix_list_id; ipv6_range; ipv4_range; 
}

let make_security_group_remediation_action 
  ?(is_default_action : bool option)
  ?(remediation_result : security_group_rule_description option)
  ?(description : string option)
  ?(remediation_action_type : remediation_action_type option)
  () : security_group_remediation_action = {
  is_default_action;
  remediation_result;
  description;
  remediation_action_type;
   }

let make_aws_vpc_security_group_violation 
  ?(possible_security_group_remediation_actions : security_group_remediation_action list option)
  ?(partial_matches : partial_match list option)
  ?(violation_target_description : string option)
  ?(violation_target : string option)
  () : aws_vpc_security_group_violation = {
  possible_security_group_remediation_actions;
  partial_matches;
  violation_target_description;
  violation_target;
   }

let make_aws_ec2_network_interface_violation 
  ?(violating_security_groups : string list option)
  ?(violation_target : string option)
  () : aws_ec2_network_interface_violation = {
  violating_security_groups; violation_target; 
}

let make_aws_ec2_instance_violation 
  ?(aws_ec2_network_interface_violations : aws_ec2_network_interface_violation list option)
  ?(violation_target : string option)
  () : aws_ec2_instance_violation = {
  aws_ec2_network_interface_violations; violation_target; 
}

let make_network_firewall_missing_firewall_violation 
  ?(target_violation_reason : string option)
  ?(availability_zone : string option)
  ?(vp_c : string option)
  ?(violation_target : string option)
  () : network_firewall_missing_firewall_violation = {
  target_violation_reason; availability_zone; vp_c; violation_target; 
}

let make_network_firewall_missing_subnet_violation 
  ?(target_violation_reason : string option)
  ?(availability_zone : string option)
  ?(vp_c : string option)
  ?(violation_target : string option)
  () : network_firewall_missing_subnet_violation = {
  target_violation_reason; availability_zone; vp_c; violation_target; 
}

let make_network_firewall_missing_expected_rt_violation 
  ?(expected_route_table : string option)
  ?(current_route_table : string option)
  ?(availability_zone : string option)
  ?(vp_c : string option)
  ?(violation_target : string option)
  () : network_firewall_missing_expected_rt_violation = {
  expected_route_table;
  current_route_table;
  availability_zone;
  vp_c;
  violation_target;
   }

let make_stateless_rule_group 
  ?(priority : int option)
  ?(resource_id : string option)
  ?(rule_group_name : string option)
  () : stateless_rule_group = { priority; resource_id; rule_group_name; 
}

let make_network_firewall_stateful_rule_group_override 
  ?(action : network_firewall_override_action option) ()
: network_firewall_stateful_rule_group_override = { action; 
}

let make_stateful_rule_group 
  ?(override : network_firewall_stateful_rule_group_override option)
  ?(priority : int option)
  ?(resource_id : string option)
  ?(rule_group_name : string option)
  () : stateful_rule_group = {
  override; priority; resource_id; rule_group_name; 
}

let make_stateful_engine_options 
  ?(stream_exception_policy : stream_exception_policy option)
  ?(rule_order : rule_order option)
  () : stateful_engine_options = { stream_exception_policy; rule_order; 
}

let make_network_firewall_policy_description 
  ?(stateful_engine_options : stateful_engine_options option)
  ?(stateful_default_actions : string list option)
  ?(stateful_rule_groups : stateful_rule_group list option)
  ?(stateless_custom_actions : string list option)
  ?(stateless_fragment_default_actions : string list option)
  ?(stateless_default_actions : string list option)
  ?(stateless_rule_groups : stateless_rule_group list option)
  () : network_firewall_policy_description = {
  stateful_engine_options;
  stateful_default_actions;
  stateful_rule_groups;
  stateless_custom_actions;
  stateless_fragment_default_actions;
  stateless_default_actions;
  stateless_rule_groups;
   }

let make_network_firewall_policy_modified_violation 
  ?(expected_policy_description : network_firewall_policy_description option)
  ?(current_policy_description : network_firewall_policy_description option)
  ?(violation_target : string option)
  () : network_firewall_policy_modified_violation = {
  expected_policy_description; current_policy_description; violation_target; 
}

let make_route 
  ?(target : string option)
  ?(destination : string option)
  ?(target_type : target_type option)
  ?(destination_type : destination_type option)
  () : route = { target; destination; target_type; destination_type; 
}

let make_expected_route 
  ?(route_table_id : string option)
  ?(allowed_targets : string list option)
  ?(contributing_subnets : string list option)
  ?(ip_v6_cidr : string option)
  ?(prefix_list_id : string option)
  ?(ip_v4_cidr : string option)
  () : expected_route = {
  route_table_id;
  allowed_targets;
  contributing_subnets;
  ip_v6_cidr;
  prefix_list_id;
  ip_v4_cidr;
   }

let make_network_firewall_internet_traffic_not_inspected_violation 
  ?(vpc_id : string option)
  ?(actual_internet_gateway_routes : route list option)
  ?(expected_internet_gateway_routes : expected_route list option)
  ?(current_internet_gateway_route_table : string option)
  ?(internet_gateway_id : string option)
  ?(actual_firewall_subnet_routes : route list option)
  ?(expected_firewall_subnet_routes : expected_route list option)
  ?(firewall_subnet_id : string option)
  ?(expected_firewall_endpoint : string option)
  ?(current_firewall_subnet_route_table : string option)
  ?(is_route_table_used_in_different_a_z : bool option)
  ?(violating_routes : route list option)
  ?(route_table_id : string option)
  ?(subnet_availability_zone : string option)
  ?(subnet_id : string option)
  () : network_firewall_internet_traffic_not_inspected_violation = {
  vpc_id;
  actual_internet_gateway_routes;
  expected_internet_gateway_routes;
  current_internet_gateway_route_table;
  internet_gateway_id;
  actual_firewall_subnet_routes;
  expected_firewall_subnet_routes;
  firewall_subnet_id;
  expected_firewall_endpoint;
  current_firewall_subnet_route_table;
  is_route_table_used_in_different_a_z;
  violating_routes;
  route_table_id;
  subnet_availability_zone;
  subnet_id;
   }

let make_network_firewall_invalid_route_configuration_violation 
  ?(vpc_id : string option)
  ?(actual_internet_gateway_routes : route list option)
  ?(expected_internet_gateway_routes : expected_route list option)
  ?(current_internet_gateway_route_table : string option)
  ?(internet_gateway_id : string option)
  ?(actual_firewall_subnet_routes : route list option)
  ?(expected_firewall_subnet_routes : expected_route list option)
  ?(actual_firewall_subnet_id : string option)
  ?(expected_firewall_subnet_id : string option)
  ?(actual_firewall_endpoint : string option)
  ?(expected_firewall_endpoint : string option)
  ?(current_firewall_subnet_route_table : string option)
  ?(violating_route : route option)
  ?(is_route_table_used_in_different_a_z : bool option)
  ?(route_table_id : string option)
  ?(affected_subnets : string list option)
  () : network_firewall_invalid_route_configuration_violation = {
  vpc_id;
  actual_internet_gateway_routes;
  expected_internet_gateway_routes;
  current_internet_gateway_route_table;
  internet_gateway_id;
  actual_firewall_subnet_routes;
  expected_firewall_subnet_routes;
  actual_firewall_subnet_id;
  expected_firewall_subnet_id;
  actual_firewall_endpoint;
  expected_firewall_endpoint;
  current_firewall_subnet_route_table;
  violating_route;
  is_route_table_used_in_different_a_z;
  route_table_id;
  affected_subnets;
   }

let make_network_firewall_black_hole_route_detected_violation 
  ?(violating_routes : route list option)
  ?(vpc_id : string option)
  ?(route_table_id : string option)
  ?(violation_target : string option)
  () : network_firewall_black_hole_route_detected_violation = {
  violating_routes; vpc_id; route_table_id; violation_target; 
}

let make_network_firewall_unexpected_firewall_routes_violation 
  ?(vpc_id : string option)
  ?(firewall_endpoint : string option)
  ?(route_table_id : string option)
  ?(violating_routes : route list option)
  ?(firewall_subnet_id : string option)
  () : network_firewall_unexpected_firewall_routes_violation = {
  vpc_id;
  firewall_endpoint;
  route_table_id;
  violating_routes;
  firewall_subnet_id;
   }

let make_network_firewall_unexpected_gateway_routes_violation 
  ?(vpc_id : string option)
  ?(route_table_id : string option)
  ?(violating_routes : route list option)
  ?(gateway_id : string option)
  () : network_firewall_unexpected_gateway_routes_violation = {
  vpc_id; route_table_id; violating_routes; gateway_id; 
}

let make_network_firewall_missing_expected_routes_violation 
  ?(vpc_id : string option)
  ?(expected_routes : expected_route list option)
  ?(violation_target : string option)
  () : network_firewall_missing_expected_routes_violation = {
  vpc_id; expected_routes; violation_target; 
}

let make_dns_rule_group_priority_conflict_violation 
  ?(unavailable_priorities : int list option)
  ?(conflicting_policy_id : string option)
  ?(conflicting_priority : int option)
  ?(violation_target_description : string option)
  ?(violation_target : string option)
  () : dns_rule_group_priority_conflict_violation = {
  unavailable_priorities;
  conflicting_policy_id;
  conflicting_priority;
  violation_target_description;
  violation_target;
   }

let make_dns_duplicate_rule_group_violation 
  ?(violation_target_description : string option)
  ?(violation_target : string option)
  () : dns_duplicate_rule_group_violation = {
  violation_target_description; violation_target; 
}

let make_dns_rule_group_limit_exceeded_violation 
  ?(number_of_rule_groups_already_associated : int option)
  ?(violation_target_description : string option)
  ?(violation_target : string option)
  () : dns_rule_group_limit_exceeded_violation = {
  number_of_rule_groups_already_associated;
  violation_target_description;
  violation_target;
   }

let make_firewall_subnet_is_out_of_scope_violation 
  ?(vpc_endpoint_id : string option)
  ?(subnet_availability_zone_id : string option)
  ?(subnet_availability_zone : string option)
  ?(vpc_id : string option)
  ?(firewall_subnet_id : string option)
  () : firewall_subnet_is_out_of_scope_violation = {
  vpc_endpoint_id;
  subnet_availability_zone_id;
  subnet_availability_zone;
  vpc_id;
  firewall_subnet_id;
   }

let make_route_has_out_of_scope_endpoint_violation 
  ?(internet_gateway_routes : route list option)
  ?(current_internet_gateway_route_table : string option)
  ?(internet_gateway_id : string option)
  ?(firewall_subnet_routes : route list option)
  ?(firewall_subnet_id : string option)
  ?(current_firewall_subnet_route_table : string option)
  ?(subnet_availability_zone_id : string option)
  ?(subnet_availability_zone : string option)
  ?(violating_routes : route list option)
  ?(route_table_id : string option)
  ?(vpc_id : string option)
  ?(subnet_id : string option)
  () : route_has_out_of_scope_endpoint_violation = {
  internet_gateway_routes;
  current_internet_gateway_route_table;
  internet_gateway_id;
  firewall_subnet_routes;
  firewall_subnet_id;
  current_firewall_subnet_route_table;
  subnet_availability_zone_id;
  subnet_availability_zone;
  violating_routes;
  route_table_id;
  vpc_id;
  subnet_id;
   }

let make_third_party_firewall_missing_firewall_violation 
  ?(target_violation_reason : string option)
  ?(availability_zone : string option)
  ?(vp_c : string option)
  ?(violation_target : string option)
  () : third_party_firewall_missing_firewall_violation = {
  target_violation_reason; availability_zone; vp_c; violation_target; 
}

let make_third_party_firewall_missing_subnet_violation 
  ?(target_violation_reason : string option)
  ?(availability_zone : string option)
  ?(vp_c : string option)
  ?(violation_target : string option)
  () : third_party_firewall_missing_subnet_violation = {
  target_violation_reason; availability_zone; vp_c; violation_target; 
}

let make_third_party_firewall_missing_expected_route_table_violation 
  ?(expected_route_table : string option)
  ?(current_route_table : string option)
  ?(availability_zone : string option)
  ?(vp_c : string option)
  ?(violation_target : string option)
  () : third_party_firewall_missing_expected_route_table_violation = {
  expected_route_table;
  current_route_table;
  availability_zone;
  vp_c;
  violation_target;
   }

let make_firewall_subnet_missing_vpc_endpoint_violation 
  ?(subnet_availability_zone_id : string option)
  ?(subnet_availability_zone : string option)
  ?(vpc_id : string option)
  ?(firewall_subnet_id : string option)
  () : firewall_subnet_missing_vpc_endpoint_violation = {
  subnet_availability_zone_id;
  subnet_availability_zone;
  vpc_id;
  firewall_subnet_id;
   }

let make_network_acl_icmp_type_code 
  ?(type_ : int option) ?(code : int option) () : network_acl_icmp_type_code
= { type_; code;  }

let make_network_acl_port_range  ?(to_ : int option) ?(from_ : int option) ()
: network_acl_port_range = { to_; from_;  }

let make_network_acl_entry 
  ?(ipv6_cidr_block : string option)
  ?(cidr_block : string option)
  ?(port_range : network_acl_port_range option)
  ?(icmp_type_code : network_acl_icmp_type_code option)
  ~(egress : bool)
  ~(rule_action : network_acl_rule_action)
  ~(protocol : string)
  () : network_acl_entry = {
  egress;
  rule_action;
  ipv6_cidr_block;
  cidr_block;
  port_range;
  protocol;
  icmp_type_code;
   }

let make_entry_description 
  ?(entry_type : entry_type option)
  ?(entry_rule_number : int option)
  ?(entry_detail : network_acl_entry option)
  () : entry_description = { entry_type; entry_rule_number; entry_detail; 
}

let make_entry_violation 
  ?(entry_violation_reasons : entry_violation_reason list option)
  ?(entries_with_conflicts : entry_description list option)
  ?(entry_at_expected_evaluation_order : entry_description option)
  ?(actual_evaluation_order : string option)
  ?(expected_evaluation_order : string option)
  ?(expected_entry : entry_description option)
  () : entry_violation = {
  entry_violation_reasons;
  entries_with_conflicts;
  entry_at_expected_evaluation_order;
  actual_evaluation_order;
  expected_evaluation_order;
  expected_entry;
   }

let make_invalid_network_acl_entries_violation 
  ?(entry_violations : entry_violation list option)
  ?(current_associated_network_acl : string option)
  ?(subnet_availability_zone : string option)
  ?(subnet : string option)
  ?(vpc : string option)
  () : invalid_network_acl_entries_violation = {
  entry_violations;
  current_associated_network_acl;
  subnet_availability_zone;
  subnet;
  vpc;
   }

let make_action_target 
  ?(description : string option) ?(resource_id : string option) ()
: action_target = { description; resource_id; 
}

let make_ec2_create_route_action 
  ?(gateway_id : action_target option)
  ?(vpc_endpoint_id : action_target option)
  ?(destination_ipv6_cidr_block : string option)
  ?(destination_prefix_list_id : string option)
  ?(destination_cidr_block : string option)
  ?(description : string option)
  ~(route_table_id : action_target)
  () : ec2_create_route_action = {
  route_table_id;
  gateway_id;
  vpc_endpoint_id;
  destination_ipv6_cidr_block;
  destination_prefix_list_id;
  destination_cidr_block;
  description;
   }

let make_ec2_replace_route_action 
  ?(gateway_id : action_target option)
  ?(destination_ipv6_cidr_block : string option)
  ?(destination_prefix_list_id : string option)
  ?(destination_cidr_block : string option)
  ?(description : string option)
  ~(route_table_id : action_target)
  () : ec2_replace_route_action = {
  route_table_id;
  gateway_id;
  destination_ipv6_cidr_block;
  destination_prefix_list_id;
  destination_cidr_block;
  description;
   }

let make_ec2_delete_route_action 
  ?(destination_ipv6_cidr_block : string option)
  ?(destination_prefix_list_id : string option)
  ?(destination_cidr_block : string option)
  ?(description : string option)
  ~(route_table_id : action_target)
  () : ec2_delete_route_action = {
  route_table_id;
  destination_ipv6_cidr_block;
  destination_prefix_list_id;
  destination_cidr_block;
  description;
   }

let make_ec2_copy_route_table_action 
  ?(description : string option)
  ~(route_table_id : action_target)
  ~(vpc_id : action_target)
  () : ec2_copy_route_table_action = { route_table_id; vpc_id; description; 
}

let make_ec2_replace_route_table_association_action 
  ?(description : string option)
  ~(route_table_id : action_target)
  ~(association_id : action_target)
  () : ec2_replace_route_table_association_action = {
  route_table_id; association_id; description; 
}

let make_ec2_associate_route_table_action 
  ?(gateway_id : action_target option)
  ?(subnet_id : action_target option)
  ?(description : string option)
  ~(route_table_id : action_target)
  () : ec2_associate_route_table_action = {
  gateway_id; subnet_id; route_table_id; description; 
}

let make_ec2_create_route_table_action 
  ?(description : string option) ~(vpc_id : action_target) ()
: ec2_create_route_table_action = { vpc_id; description; 
}

let make_fms_policy_update_firewall_creation_config_action 
  ?(firewall_creation_config : string option)
  ?(description : string option)
  () : fms_policy_update_firewall_creation_config_action = {
  firewall_creation_config; description; 
}

let make_create_network_acl_action 
  ?(fms_can_remediate : bool option)
  ?(vpc : action_target option)
  ?(description : string option)
  () : create_network_acl_action = { fms_can_remediate; vpc; description; 
}

let make_replace_network_acl_association_action 
  ?(fms_can_remediate : bool option)
  ?(network_acl_id : action_target option)
  ?(association_id : action_target option)
  ?(description : string option)
  () : replace_network_acl_association_action = {
  fms_can_remediate; network_acl_id; association_id; description; 
}

let make_create_network_acl_entries_action 
  ?(fms_can_remediate : bool option)
  ?(network_acl_entries_to_be_created : entry_description list option)
  ?(network_acl_id : action_target option)
  ?(description : string option)
  () : create_network_acl_entries_action = {
  fms_can_remediate;
  network_acl_entries_to_be_created;
  network_acl_id;
  description;
   }

let make_delete_network_acl_entries_action 
  ?(fms_can_remediate : bool option)
  ?(network_acl_entries_to_be_deleted : entry_description list option)
  ?(network_acl_id : action_target option)
  ?(description : string option)
  () : delete_network_acl_entries_action = {
  fms_can_remediate;
  network_acl_entries_to_be_deleted;
  network_acl_id;
  description;
   }

let make_remediation_action 
  ?(delete_network_acl_entries_action : delete_network_acl_entries_action option)
  ?(create_network_acl_entries_action : create_network_acl_entries_action option)
  ?(replace_network_acl_association_action : replace_network_acl_association_action option)
  ?(create_network_acl_action : create_network_acl_action option)
  ?(fms_policy_update_firewall_creation_config_action : fms_policy_update_firewall_creation_config_action option)
  ?(ec2_create_route_table_action : ec2_create_route_table_action option)
  ?(ec2_associate_route_table_action : ec2_associate_route_table_action option)
  ?(ec2_replace_route_table_association_action : ec2_replace_route_table_association_action option)
  ?(ec2_copy_route_table_action : ec2_copy_route_table_action option)
  ?(ec2_delete_route_action : ec2_delete_route_action option)
  ?(ec2_replace_route_action : ec2_replace_route_action option)
  ?(ec2_create_route_action : ec2_create_route_action option)
  ?(description : string option)
  () : remediation_action = {
  delete_network_acl_entries_action;
  create_network_acl_entries_action;
  replace_network_acl_association_action;
  create_network_acl_action;
  fms_policy_update_firewall_creation_config_action;
  ec2_create_route_table_action;
  ec2_associate_route_table_action;
  ec2_replace_route_table_association_action;
  ec2_copy_route_table_action;
  ec2_delete_route_action;
  ec2_replace_route_action;
  ec2_create_route_action;
  description;
   }

let make_remediation_action_with_order 
  ?(order : int option) ?(remediation_action : remediation_action option) ()
: remediation_action_with_order = { order; remediation_action; 
}

let make_possible_remediation_action 
  ?(is_default_action : bool option)
  ?(description : string option)
  ~(ordered_remediation_actions : remediation_action_with_order list)
  () : possible_remediation_action = {
  is_default_action; ordered_remediation_actions; description; 
}

let make_possible_remediation_actions 
  ?(actions : possible_remediation_action list option)
  ?(description : string option)
  () : possible_remediation_actions = { actions; description; 
}

let make_resource_violation 
  ?(possible_remediation_actions : possible_remediation_actions option)
  ?(invalid_network_acl_entries_violation : invalid_network_acl_entries_violation option)
  ?(firewall_subnet_missing_vpc_endpoint_violation : firewall_subnet_missing_vpc_endpoint_violation option)
  ?(third_party_firewall_missing_expected_route_table_violation : third_party_firewall_missing_expected_route_table_violation option)
  ?(third_party_firewall_missing_subnet_violation : third_party_firewall_missing_subnet_violation option)
  ?(third_party_firewall_missing_firewall_violation : third_party_firewall_missing_firewall_violation option)
  ?(route_has_out_of_scope_endpoint_violation : route_has_out_of_scope_endpoint_violation option)
  ?(firewall_subnet_is_out_of_scope_violation : firewall_subnet_is_out_of_scope_violation option)
  ?(dns_rule_group_limit_exceeded_violation : dns_rule_group_limit_exceeded_violation option)
  ?(dns_duplicate_rule_group_violation : dns_duplicate_rule_group_violation option)
  ?(dns_rule_group_priority_conflict_violation : dns_rule_group_priority_conflict_violation option)
  ?(network_firewall_missing_expected_routes_violation : network_firewall_missing_expected_routes_violation option)
  ?(network_firewall_unexpected_gateway_routes_violation : network_firewall_unexpected_gateway_routes_violation option)
  ?(network_firewall_unexpected_firewall_routes_violation : network_firewall_unexpected_firewall_routes_violation option)
  ?(network_firewall_black_hole_route_detected_violation : network_firewall_black_hole_route_detected_violation option)
  ?(network_firewall_invalid_route_configuration_violation : network_firewall_invalid_route_configuration_violation option)
  ?(network_firewall_internet_traffic_not_inspected_violation : network_firewall_internet_traffic_not_inspected_violation option)
  ?(network_firewall_policy_modified_violation : network_firewall_policy_modified_violation option)
  ?(network_firewall_missing_expected_rt_violation : network_firewall_missing_expected_rt_violation option)
  ?(network_firewall_missing_subnet_violation : network_firewall_missing_subnet_violation option)
  ?(network_firewall_missing_firewall_violation : network_firewall_missing_firewall_violation option)
  ?(aws_ec2_instance_violation : aws_ec2_instance_violation option)
  ?(aws_ec2_network_interface_violation : aws_ec2_network_interface_violation option)
  ?(aws_vpc_security_group_violation : aws_vpc_security_group_violation option)
  () : resource_violation = {
  possible_remediation_actions;
  invalid_network_acl_entries_violation;
  firewall_subnet_missing_vpc_endpoint_violation;
  third_party_firewall_missing_expected_route_table_violation;
  third_party_firewall_missing_subnet_violation;
  third_party_firewall_missing_firewall_violation;
  route_has_out_of_scope_endpoint_violation;
  firewall_subnet_is_out_of_scope_violation;
  dns_rule_group_limit_exceeded_violation;
  dns_duplicate_rule_group_violation;
  dns_rule_group_priority_conflict_violation;
  network_firewall_missing_expected_routes_violation;
  network_firewall_unexpected_gateway_routes_violation;
  network_firewall_unexpected_firewall_routes_violation;
  network_firewall_black_hole_route_detected_violation;
  network_firewall_invalid_route_configuration_violation;
  network_firewall_internet_traffic_not_inspected_violation;
  network_firewall_policy_modified_violation;
  network_firewall_missing_expected_rt_violation;
  network_firewall_missing_subnet_violation;
  network_firewall_missing_firewall_violation;
  aws_ec2_instance_violation;
  aws_ec2_network_interface_violation;
  aws_vpc_security_group_violation;
   }

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_violation_detail 
  ?(resource_description : string option)
  ?(resource_tags : tag list option)
  ~(resource_violations : resource_violation list)
  ~(resource_type : string)
  ~(resource_id : string)
  ~(member_account : string)
  ~(policy_id : string)
  () : violation_detail = {
  resource_description;
  resource_tags;
  resource_violations;
  resource_type;
  resource_id;
  member_account;
  policy_id;
   }

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_request = { tag_keys; resource_arn; 
}

let make_third_party_firewall_policy 
  ?(firewall_deployment_model : firewall_deployment_model option) ()
: third_party_firewall_policy = { firewall_deployment_model; 
}

let make_third_party_firewall_firewall_policy 
  ?(firewall_policy_name : string option)
  ?(firewall_policy_id : string option)
  () : third_party_firewall_firewall_policy = {
  firewall_policy_name; firewall_policy_id;  }

let make_tag_resource_response  () : tag_resource_response =
()

let make_tag_resource_request 
  ~(tag_list : tag list) ~(resource_arn : string) () : tag_resource_request =
{ tag_list; resource_arn;  }

let make_network_firewall_policy 
  ?(firewall_deployment_model : firewall_deployment_model option) ()
: network_firewall_policy = { firewall_deployment_model; 
}

let make_network_acl_entry_set 
  ?(last_entries : network_acl_entry list option)
  ?(first_entries : network_acl_entry list option)
  ~(force_remediate_for_last_entries : bool)
  ~(force_remediate_for_first_entries : bool)
  () : network_acl_entry_set = {
  force_remediate_for_last_entries;
  last_entries;
  force_remediate_for_first_entries;
  first_entries;
   }

let make_network_acl_common_policy 
  ~(network_acl_entry_set : network_acl_entry_set) ()
: network_acl_common_policy = { network_acl_entry_set; 
}

let make_policy_option 
  ?(network_acl_common_policy : network_acl_common_policy option)
  ?(third_party_firewall_policy : third_party_firewall_policy option)
  ?(network_firewall_policy : network_firewall_policy option)
  () : policy_option = {
  network_acl_common_policy;
  third_party_firewall_policy;
  network_firewall_policy;
   }

let make_security_service_policy_data 
  ?(policy_option : policy_option option)
  ?(managed_service_data : string option)
  ~(type_ : security_service_type)
  () : security_service_policy_data = {
  policy_option; managed_service_data; type_;  }

let make_resource_tag  ?(value : string option) ~(key : string) ()
: resource_tag = { value; key;  }

let make_resource_set_summary 
  ?(resource_set_status : resource_set_status option)
  ?(last_update_time : float option)
  ?(description : string option)
  ?(name : string option)
  ?(id : string option)
  () : resource_set_summary = {
  resource_set_status; last_update_time; description; name; id; 
}

let make_resource_set 
  ?(resource_set_status : resource_set_status option)
  ?(last_update_time : float option)
  ?(update_token : string option)
  ?(description : string option)
  ?(id : string option)
  ~(resource_type_list : string list)
  ~(name : string)
  () : resource_set = {
  resource_set_status;
  last_update_time;
  resource_type_list;
  update_token;
  description;
  name;
  id;
   }

let make_resource  ?(account_id : string option) ~(ur_i : string) ()
: resource = { account_id; ur_i;  }

let make_region_scope 
  ?(all_regions_enabled : bool option) ?(regions : string list option) ()
: region_scope = { all_regions_enabled; regions; 
}

let make_put_resource_set_response 
  ~(resource_set_arn : string) ~(resource_set : resource_set) ()
: put_resource_set_response = { resource_set_arn; resource_set; 
}

let make_put_resource_set_request 
  ?(tag_list : tag list option) ~(resource_set : resource_set) ()
: put_resource_set_request = { tag_list; resource_set; 
}

let make_protocols_list_data 
  ?(previous_protocols_list : (string * string list) list option)
  ?(last_update_time : float option)
  ?(create_time : float option)
  ?(list_update_token : string option)
  ?(list_id : string option)
  ~(protocols_list : string list)
  ~(list_name : string)
  () : protocols_list_data = {
  previous_protocols_list;
  protocols_list;
  last_update_time;
  create_time;
  list_update_token;
  list_name;
  list_id;
   }

let make_put_protocols_list_response 
  ?(protocols_list_arn : string option)
  ?(protocols_list : protocols_list_data option)
  () : put_protocols_list_response = { protocols_list_arn; protocols_list; 
}

let make_put_protocols_list_request 
  ?(tag_list : tag list option) ~(protocols_list : protocols_list_data) ()
: put_protocols_list_request = { tag_list; protocols_list;  }

let make_policy 
  ?(policy_status : customer_policy_status option)
  ?(policy_description : string option)
  ?(resource_set_ids : string list option)
  ?(exclude_map : (string * string list) list option)
  ?(include_map : (string * string list) list option)
  ?(delete_unused_fm_managed_resources : bool option)
  ?(resource_tags : resource_tag list option)
  ?(resource_type_list : string list option)
  ?(policy_update_token : string option)
  ?(policy_id : string option)
  ~(remediation_enabled : bool)
  ~(exclude_resource_tags : bool)
  ~(resource_type : string)
  ~(security_service_policy_data : security_service_policy_data)
  ~(policy_name : string)
  () : policy = {
  policy_status;
  policy_description;
  resource_set_ids;
  exclude_map;
  include_map;
  delete_unused_fm_managed_resources;
  remediation_enabled;
  exclude_resource_tags;
  resource_tags;
  resource_type_list;
  resource_type;
  security_service_policy_data;
  policy_update_token;
  policy_name;
  policy_id;
   }

let make_put_policy_response 
  ?(policy_arn : string option) ?(policy : policy option) ()
: put_policy_response = { policy_arn; policy;  }

let make_put_policy_request 
  ?(tag_list : tag list option) ~(policy : policy) () : put_policy_request =
{ tag_list; policy;  }

let make_put_notification_channel_request 
  ~(sns_role_name : string) ~(sns_topic_arn : string) ()
: put_notification_channel_request = { sns_role_name; sns_topic_arn; 
}

let make_app  ~(port : int) ~(protocol : string) ~(app_name : string) ()
: app = { port; protocol; app_name;  }

let make_apps_list_data 
  ?(previous_apps_list : (string * app list) list option)
  ?(last_update_time : float option)
  ?(create_time : float option)
  ?(list_update_token : string option)
  ?(list_id : string option)
  ~(apps_list : app list)
  ~(list_name : string)
  () : apps_list_data = {
  previous_apps_list;
  apps_list;
  last_update_time;
  create_time;
  list_update_token;
  list_name;
  list_id;
   }

let make_put_apps_list_response 
  ?(apps_list_arn : string option) ?(apps_list : apps_list_data option) ()
: put_apps_list_response = { apps_list_arn; apps_list; 
}

let make_put_apps_list_request 
  ?(tag_list : tag list option) ~(apps_list : apps_list_data) ()
: put_apps_list_request = { tag_list; apps_list;  }

let make_account_scope 
  ?(exclude_specified_accounts : bool option)
  ?(all_accounts_enabled : bool option)
  ?(accounts : string list option)
  () : account_scope = {
  exclude_specified_accounts; all_accounts_enabled; accounts; 
}

let make_organizational_unit_scope 
  ?(exclude_specified_organizational_units : bool option)
  ?(all_organizational_units_enabled : bool option)
  ?(organizational_units : string list option)
  () : organizational_unit_scope = {
  exclude_specified_organizational_units;
  all_organizational_units_enabled;
  organizational_units;
   }

let make_policy_type_scope 
  ?(all_policy_types_enabled : bool option)
  ?(policy_types : security_service_type list option)
  () : policy_type_scope = { all_policy_types_enabled; policy_types; 
}

let make_admin_scope 
  ?(policy_type_scope : policy_type_scope option)
  ?(region_scope : region_scope option)
  ?(organizational_unit_scope : organizational_unit_scope option)
  ?(account_scope : account_scope option)
  () : admin_scope = {
  policy_type_scope; region_scope; organizational_unit_scope; account_scope; 
}

let make_put_admin_account_request 
  ?(admin_scope : admin_scope option) ~(admin_account : string) ()
: put_admin_account_request = { admin_scope; admin_account; 
}

let make_protocols_list_data_summary 
  ?(protocols_list : string list option)
  ?(list_name : string option)
  ?(list_id : string option)
  ?(list_arn : string option)
  () : protocols_list_data_summary = {
  protocols_list; list_name; list_id; list_arn;  }

let make_policy_summary 
  ?(policy_status : customer_policy_status option)
  ?(delete_unused_fm_managed_resources : bool option)
  ?(remediation_enabled : bool option)
  ?(security_service_type : security_service_type option)
  ?(resource_type : string option)
  ?(policy_name : string option)
  ?(policy_id : string option)
  ?(policy_arn : string option)
  () : policy_summary = {
  policy_status;
  delete_unused_fm_managed_resources;
  remediation_enabled;
  security_service_type;
  resource_type;
  policy_name;
  policy_id;
  policy_arn;
   }

let make_evaluation_result 
  ?(evaluation_limit_exceeded : bool option)
  ?(violator_count : int option)
  ?(compliance_status : policy_compliance_status_type option)
  () : evaluation_result = {
  evaluation_limit_exceeded; violator_count; compliance_status; 
}

let make_policy_compliance_status 
  ?(issue_info_map : (string * string) list option)
  ?(last_updated : float option)
  ?(evaluation_results : evaluation_result list option)
  ?(member_account : string option)
  ?(policy_name : string option)
  ?(policy_id : string option)
  ?(policy_owner : string option)
  () : policy_compliance_status = {
  issue_info_map;
  last_updated;
  evaluation_results;
  member_account;
  policy_name;
  policy_id;
  policy_owner;
   }

let make_compliance_violator 
  ?(metadata : (string * string) list option)
  ?(resource_type : string option)
  ?(violation_reason : violation_reason option)
  ?(resource_id : string option)
  () : compliance_violator = {
  metadata; resource_type; violation_reason; resource_id; 
}

let make_policy_compliance_detail 
  ?(issue_info_map : (string * string) list option)
  ?(expired_at : float option)
  ?(evaluation_limit_exceeded : bool option)
  ?(violators : compliance_violator list option)
  ?(member_account : string option)
  ?(policy_id : string option)
  ?(policy_owner : string option)
  () : policy_compliance_detail = {
  issue_info_map;
  expired_at;
  evaluation_limit_exceeded;
  violators;
  member_account;
  policy_id;
  policy_owner;
   }

let make_list_third_party_firewall_firewall_policies_response 
  ?(next_token : string option)
  ?(third_party_firewall_firewall_policies : third_party_firewall_firewall_policy list option)
  () : list_third_party_firewall_firewall_policies_response = {
  next_token; third_party_firewall_firewall_policies; 
}

let make_list_third_party_firewall_firewall_policies_request 
  ?(next_token : string option)
  ~(max_results : int)
  ~(third_party_firewall : third_party_firewall)
  () : list_third_party_firewall_firewall_policies_request = {
  max_results; next_token; third_party_firewall; 
}

let make_list_tags_for_resource_response  ?(tag_list : tag list option) ()
: list_tags_for_resource_response = { tag_list; 
}

let make_list_tags_for_resource_request  ~(resource_arn : string) ()
: list_tags_for_resource_request = { resource_arn; 
}

let make_list_resource_sets_response 
  ?(next_token : string option)
  ?(resource_sets : resource_set_summary list option)
  () : list_resource_sets_response = { next_token; resource_sets; 
}

let make_list_resource_sets_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_resource_sets_request = { max_results; next_token; 
}

let make_list_resource_set_resources_response 
  ?(next_token : string option) ~(items : resource list) ()
: list_resource_set_resources_response = { next_token; items; 
}

let make_list_resource_set_resources_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(identifier : string)
  () : list_resource_set_resources_request = {
  next_token; max_results; identifier; 
}

let make_list_protocols_lists_response 
  ?(next_token : string option)
  ?(protocols_lists : protocols_list_data_summary list option)
  () : list_protocols_lists_response = { next_token; protocols_lists; 
}

let make_list_protocols_lists_request 
  ?(next_token : string option)
  ?(default_lists : bool option)
  ~(max_results : int)
  () : list_protocols_lists_request = {
  max_results; next_token; default_lists;  }

let make_list_policies_response 
  ?(next_token : string option)
  ?(policy_list : policy_summary list option)
  () : list_policies_response = { next_token; policy_list; 
}

let make_list_policies_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_policies_request = { max_results; next_token; 
}

let make_list_member_accounts_response 
  ?(next_token : string option) ?(member_accounts : string list option) ()
: list_member_accounts_response = { next_token; member_accounts; 
}

let make_list_member_accounts_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_member_accounts_request = { max_results; next_token; 
}

let make_discovered_resource 
  ?(name : string option)
  ?(type_ : string option)
  ?(account_id : string option)
  ?(ur_i : string option)
  () : discovered_resource = { name; type_; account_id; ur_i; 
}

let make_list_discovered_resources_response 
  ?(next_token : string option) ?(items : discovered_resource list option) ()
: list_discovered_resources_response = { next_token; items; 
}

let make_list_discovered_resources_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(resource_type : string)
  ~(member_account_ids : string list)
  () : list_discovered_resources_request = {
  next_token; max_results; resource_type; member_account_ids; 
}

let make_list_compliance_status_response 
  ?(next_token : string option)
  ?(policy_compliance_status_list : policy_compliance_status list option)
  () : list_compliance_status_response = {
  next_token; policy_compliance_status_list; 
}

let make_list_compliance_status_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(policy_id : string)
  () : list_compliance_status_request = {
  max_results; next_token; policy_id;  }

let make_apps_list_data_summary 
  ?(apps_list : app list option)
  ?(list_name : string option)
  ?(list_id : string option)
  ?(list_arn : string option)
  () : apps_list_data_summary = { apps_list; list_name; list_id; list_arn; 
}

let make_list_apps_lists_response 
  ?(next_token : string option)
  ?(apps_lists : apps_list_data_summary list option)
  () : list_apps_lists_response = { next_token; apps_lists; 
}

let make_list_apps_lists_request 
  ?(next_token : string option)
  ?(default_lists : bool option)
  ~(max_results : int)
  () : list_apps_lists_request = { max_results; next_token; default_lists; 
}

let make_list_admins_managing_account_response 
  ?(next_token : string option) ?(admin_accounts : string list option) ()
: list_admins_managing_account_response = { next_token; admin_accounts; 
}

let make_list_admins_managing_account_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_admins_managing_account_request = { max_results; next_token; 
}

let make_admin_account_summary 
  ?(status : organization_status option)
  ?(default_admin : bool option)
  ?(admin_account : string option)
  () : admin_account_summary = { status; default_admin; admin_account; 
}

let make_list_admin_accounts_for_organization_response 
  ?(next_token : string option)
  ?(admin_accounts : admin_account_summary list option)
  () : list_admin_accounts_for_organization_response = {
  next_token; admin_accounts; 
}

let make_list_admin_accounts_for_organization_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_admin_accounts_for_organization_request = { max_results; next_token; 
}

let make_get_violation_details_response 
  ?(violation_detail : violation_detail option) ()
: get_violation_details_response = { violation_detail; 
}

let make_get_violation_details_request 
  ~(resource_type : string)
  ~(resource_id : string)
  ~(member_account : string)
  ~(policy_id : string)
  () : get_violation_details_request = {
  resource_type; resource_id; member_account; policy_id; 
}

let make_get_third_party_firewall_association_status_response 
  ?(marketplace_onboarding_status : marketplace_subscription_onboarding_status option)
  ?(third_party_firewall_status : third_party_firewall_association_status option)
  () : get_third_party_firewall_association_status_response = {
  marketplace_onboarding_status; third_party_firewall_status; 
}

let make_get_third_party_firewall_association_status_request 
  ~(third_party_firewall : third_party_firewall) ()
: get_third_party_firewall_association_status_request = {
  third_party_firewall;  }

let make_get_resource_set_response 
  ~(resource_set_arn : string) ~(resource_set : resource_set) ()
: get_resource_set_response = { resource_set_arn; resource_set; 
}

let make_get_resource_set_request  ~(identifier : string) ()
: get_resource_set_request = { identifier; 
}

let make_get_protocols_list_response 
  ?(protocols_list_arn : string option)
  ?(protocols_list : protocols_list_data option)
  () : get_protocols_list_response = { protocols_list_arn; protocols_list; 
}

let make_get_protocols_list_request 
  ?(default_list : bool option) ~(list_id : string) ()
: get_protocols_list_request = { default_list; list_id; 
}

let make_get_protection_status_response 
  ?(next_token : string option)
  ?(data : string option)
  ?(service_type : security_service_type option)
  ?(admin_account_id : string option)
  () : get_protection_status_response = {
  next_token; data; service_type; admin_account_id; 
}

let make_get_protection_status_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(member_account_id : string option)
  ~(policy_id : string)
  () : get_protection_status_request = {
  max_results;
  next_token;
  end_time;
  start_time;
  member_account_id;
  policy_id;
   }

let make_get_policy_response 
  ?(policy_arn : string option) ?(policy : policy option) ()
: get_policy_response = { policy_arn; policy;  }

let make_get_policy_request  ~(policy_id : string) () : get_policy_request =
{ policy_id;  }

let make_get_notification_channel_response 
  ?(sns_role_name : string option) ?(sns_topic_arn : string option) ()
: get_notification_channel_response = { sns_role_name; sns_topic_arn; 
}

let make_get_notification_channel_request  ()
: get_notification_channel_request =
()

let make_get_compliance_detail_response 
  ?(policy_compliance_detail : policy_compliance_detail option) ()
: get_compliance_detail_response = { policy_compliance_detail; 
}

let make_get_compliance_detail_request 
  ~(member_account : string) ~(policy_id : string) ()
: get_compliance_detail_request = { member_account; policy_id; 
}

let make_get_apps_list_response 
  ?(apps_list_arn : string option) ?(apps_list : apps_list_data option) ()
: get_apps_list_response = { apps_list_arn; apps_list; 
}

let make_get_apps_list_request 
  ?(default_list : bool option) ~(list_id : string) ()
: get_apps_list_request = { default_list; list_id; 
}

let make_get_admin_scope_response 
  ?(status : organization_status option)
  ?(admin_scope : admin_scope option)
  () : get_admin_scope_response = { status; admin_scope; 
}

let make_get_admin_scope_request  ~(admin_account : string) ()
: get_admin_scope_request = { admin_account; 
}

let make_get_admin_account_response 
  ?(role_status : account_role_status option)
  ?(admin_account : string option)
  () : get_admin_account_response = { role_status; admin_account; 
}

let make_get_admin_account_request  () : get_admin_account_request =
()

let make_failed_item 
  ?(reason : failed_item_reason option) ?(ur_i : string option) ()
: failed_item = { reason; ur_i; 
}

let make_disassociate_third_party_firewall_response 
  ?(third_party_firewall_status : third_party_firewall_association_status option)
  () : disassociate_third_party_firewall_response = {
  third_party_firewall_status; 
}

let make_disassociate_third_party_firewall_request 
  ~(third_party_firewall : third_party_firewall) ()
: disassociate_third_party_firewall_request = { third_party_firewall; 
}

let make_disassociate_admin_account_request  ()
: disassociate_admin_account_request =
()

let make_delete_resource_set_request  ~(identifier : string) ()
: delete_resource_set_request = { identifier; 
}

let make_delete_protocols_list_request  ~(list_id : string) ()
: delete_protocols_list_request = { list_id; 
}

let make_delete_policy_request 
  ?(delete_all_policy_resources : bool option) ~(policy_id : string) ()
: delete_policy_request = { delete_all_policy_resources; policy_id; 
}

let make_delete_notification_channel_request  ()
: delete_notification_channel_request = ()

let make_delete_apps_list_request  ~(list_id : string) ()
: delete_apps_list_request = { list_id; 
}

let make_batch_disassociate_resource_response 
  ~(failed_items : failed_item list) ~(resource_set_identifier : string) ()
: batch_disassociate_resource_response = {
  failed_items; resource_set_identifier; 
}

let make_batch_disassociate_resource_request 
  ~(items : string list) ~(resource_set_identifier : string) ()
: batch_disassociate_resource_request = { items; resource_set_identifier; 
}

let make_batch_associate_resource_response 
  ~(failed_items : failed_item list) ~(resource_set_identifier : string) ()
: batch_associate_resource_response = {
  failed_items; resource_set_identifier; 
}

let make_batch_associate_resource_request 
  ~(items : string list) ~(resource_set_identifier : string) ()
: batch_associate_resource_request = { items; resource_set_identifier; 
}

let make_associate_third_party_firewall_response 
  ?(third_party_firewall_status : third_party_firewall_association_status option)
  () : associate_third_party_firewall_response = {
  third_party_firewall_status; 
}

let make_associate_third_party_firewall_request 
  ~(third_party_firewall : third_party_firewall) ()
: associate_third_party_firewall_request = { third_party_firewall; 
}

let make_associate_admin_account_request  ~(admin_account : string) ()
: associate_admin_account_request = { admin_account; 
}

