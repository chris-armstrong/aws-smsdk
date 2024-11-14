[@@@warning "-39"]
open Types
let make_subnet 
  ?(subnet_availability_zone : string option)
  ?(subnet_identifier : string option)
  () : subnet = { subnet_availability_zone; subnet_identifier; 
}

let make_subnet_group 
  ?(subnets : subnet list option)
  ?(vpc_id : string option)
  ?(description : string option)
  ?(subnet_group_name : string option)
  () : subnet_group = { subnets; vpc_id; description; subnet_group_name; 
}

let make_update_subnet_group_response 
  ?(subnet_group : subnet_group option) () : update_subnet_group_response = {
  subnet_group;  }

let make_update_subnet_group_request 
  ?(subnet_ids : string list option)
  ?(description : string option)
  ~(subnet_group_name : string)
  () : update_subnet_group_request = {
  subnet_ids; description; subnet_group_name;  }

let make_parameter_group 
  ?(description : string option) ?(parameter_group_name : string option) ()
: parameter_group = { description; parameter_group_name; 
}

let make_update_parameter_group_response 
  ?(parameter_group : parameter_group option) ()
: update_parameter_group_response = { parameter_group; 
}

let make_parameter_name_value 
  ?(parameter_value : string option) ?(parameter_name : string option) ()
: parameter_name_value = { parameter_value; parameter_name; 
}

let make_update_parameter_group_request 
  ~(parameter_name_values : parameter_name_value list)
  ~(parameter_group_name : string)
  () : update_parameter_group_request = {
  parameter_name_values; parameter_group_name;  }

let make_endpoint 
  ?(ur_l : string option) ?(port : int option) ?(address : string option) ()
: endpoint = { ur_l; port; address;  }

let make_node 
  ?(parameter_group_status : string option)
  ?(node_status : string option)
  ?(availability_zone : string option)
  ?(node_create_time : float option)
  ?(endpoint : endpoint option)
  ?(node_id : string option)
  () : node = {
  parameter_group_status;
  node_status;
  availability_zone;
  node_create_time;
  endpoint;
  node_id;
   }

let make_notification_configuration 
  ?(topic_status : string option) ?(topic_arn : string option) ()
: notification_configuration = { topic_status; topic_arn; 
}

let make_security_group_membership 
  ?(status : string option) ?(security_group_identifier : string option) ()
: security_group_membership = { status; security_group_identifier; 
}

let make_parameter_group_status 
  ?(node_ids_to_reboot : string list option)
  ?(parameter_apply_status : string option)
  ?(parameter_group_name : string option)
  () : parameter_group_status = {
  node_ids_to_reboot; parameter_apply_status; parameter_group_name; 
}

let make_sse_description  ?(status : sse_status option) () : sse_description
= { status;  }

let make_cluster 
  ?(cluster_endpoint_encryption_type : cluster_endpoint_encryption_type option)
  ?(sse_description : sse_description option)
  ?(parameter_group : parameter_group_status option)
  ?(iam_role_arn : string option)
  ?(security_groups : security_group_membership list option)
  ?(subnet_group : string option)
  ?(notification_configuration : notification_configuration option)
  ?(preferred_maintenance_window : string option)
  ?(nodes : node list option)
  ?(node_ids_to_remove : string list option)
  ?(cluster_discovery_endpoint : endpoint option)
  ?(status : string option)
  ?(node_type : string option)
  ?(active_nodes : int option)
  ?(total_nodes : int option)
  ?(cluster_arn : string option)
  ?(description : string option)
  ?(cluster_name : string option)
  () : cluster = {
  cluster_endpoint_encryption_type;
  sse_description;
  parameter_group;
  iam_role_arn;
  security_groups;
  subnet_group;
  notification_configuration;
  preferred_maintenance_window;
  nodes;
  node_ids_to_remove;
  cluster_discovery_endpoint;
  status;
  node_type;
  active_nodes;
  total_nodes;
  cluster_arn;
  description;
  cluster_name;
   }

let make_update_cluster_response  ?(cluster : cluster option) ()
: update_cluster_response = { cluster;  }

let make_update_cluster_request 
  ?(security_group_ids : string list option)
  ?(parameter_group_name : string option)
  ?(notification_topic_status : string option)
  ?(notification_topic_arn : string option)
  ?(preferred_maintenance_window : string option)
  ?(description : string option)
  ~(cluster_name : string)
  () : update_cluster_request = {
  security_group_ids;
  parameter_group_name;
  notification_topic_status;
  notification_topic_arn;
  preferred_maintenance_window;
  description;
  cluster_name;
   }

let make_tag  ?(value : string option) ?(key : string option) () : tag = {
  value; key;  }

let make_untag_resource_response  ?(tags : tag list option) ()
: untag_resource_response = { tags;  }

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_name : string) ()
: untag_resource_request = { tag_keys; resource_name; 
}

let make_tag_resource_response  ?(tags : tag list option) ()
: tag_resource_response = { tags;  }

let make_tag_resource_request 
  ~(tags : tag list) ~(resource_name : string) () : tag_resource_request = {
  tags; resource_name;  }

let make_sse_specification  ~(enabled : bool) () : sse_specification = {
  enabled;  }

let make_reboot_node_response  ?(cluster : cluster option) ()
: reboot_node_response = { cluster;  }

let make_reboot_node_request  ~(node_id : string) ~(cluster_name : string) ()
: reboot_node_request = { node_id; cluster_name; 
}

let make_node_type_specific_value 
  ?(value : string option) ?(node_type : string option) ()
: node_type_specific_value = { value; node_type;  }

let make_parameter 
  ?(change_type : change_type option)
  ?(is_modifiable : is_modifiable option)
  ?(allowed_values : string option)
  ?(data_type : string option)
  ?(source : string option)
  ?(description : string option)
  ?(node_type_specific_values : node_type_specific_value list option)
  ?(parameter_value : string option)
  ?(parameter_type : parameter_type option)
  ?(parameter_name : string option)
  () : parameter = {
  change_type;
  is_modifiable;
  allowed_values;
  data_type;
  source;
  description;
  node_type_specific_values;
  parameter_value;
  parameter_type;
  parameter_name;
   }

let make_list_tags_response 
  ?(next_token : string option) ?(tags : tag list option) ()
: list_tags_response = { next_token; tags;  }

let make_list_tags_request 
  ?(next_token : string option) ~(resource_name : string) ()
: list_tags_request = { next_token; resource_name; 
}

let make_increase_replication_factor_response  ?(cluster : cluster option) ()
: increase_replication_factor_response = { cluster; 
}

let make_increase_replication_factor_request 
  ?(availability_zones : string list option)
  ~(new_replication_factor : int)
  ~(cluster_name : string)
  () : increase_replication_factor_request = {
  availability_zones; new_replication_factor; cluster_name;  }

let make_event 
  ?(date : float option)
  ?(message : string option)
  ?(source_type : source_type option)
  ?(source_name : string option)
  () : event = { date; message; source_type; source_name; 
}

let make_describe_subnet_groups_response 
  ?(subnet_groups : subnet_group list option)
  ?(next_token : string option)
  () : describe_subnet_groups_response = { subnet_groups; next_token; 
}

let make_describe_subnet_groups_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(subnet_group_names : string list option)
  () : describe_subnet_groups_request = {
  next_token; max_results; subnet_group_names; 
}

let make_describe_parameters_response 
  ?(parameters : parameter list option) ?(next_token : string option) ()
: describe_parameters_response = { parameters; next_token; 
}

let make_describe_parameters_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(source : string option)
  ~(parameter_group_name : string)
  () : describe_parameters_request = {
  next_token; max_results; source; parameter_group_name; 
}

let make_describe_parameter_groups_response 
  ?(parameter_groups : parameter_group list option)
  ?(next_token : string option)
  () : describe_parameter_groups_response = { parameter_groups; next_token; 
}

let make_describe_parameter_groups_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(parameter_group_names : string list option)
  () : describe_parameter_groups_request = {
  next_token; max_results; parameter_group_names; 
}

let make_describe_events_response 
  ?(events : event list option) ?(next_token : string option) ()
: describe_events_response = { events; next_token; 
}

let make_describe_events_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(duration : int option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(source_type : source_type option)
  ?(source_name : string option)
  () : describe_events_request = {
  next_token;
  max_results;
  duration;
  end_time;
  start_time;
  source_type;
  source_name;
   }

let make_describe_default_parameters_response 
  ?(parameters : parameter list option) ?(next_token : string option) ()
: describe_default_parameters_response = { parameters; next_token; 
}

let make_describe_default_parameters_request 
  ?(next_token : string option) ?(max_results : int option) ()
: describe_default_parameters_request = { next_token; max_results; 
}

let make_describe_clusters_response 
  ?(clusters : cluster list option) ?(next_token : string option) ()
: describe_clusters_response = { clusters; next_token; 
}

let make_describe_clusters_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(cluster_names : string list option)
  () : describe_clusters_request = { next_token; max_results; cluster_names; 
}

let make_delete_subnet_group_response  ?(deletion_message : string option) ()
: delete_subnet_group_response = { deletion_message; 
}

let make_delete_subnet_group_request  ~(subnet_group_name : string) ()
: delete_subnet_group_request = { subnet_group_name; 
}

let make_delete_parameter_group_response 
  ?(deletion_message : string option) () : delete_parameter_group_response =
{ deletion_message;  }

let make_delete_parameter_group_request  ~(parameter_group_name : string) ()
: delete_parameter_group_request = { parameter_group_name; 
}

let make_delete_cluster_response  ?(cluster : cluster option) ()
: delete_cluster_response = { cluster;  }

let make_delete_cluster_request  ~(cluster_name : string) ()
: delete_cluster_request = { cluster_name; 
}

let make_decrease_replication_factor_response  ?(cluster : cluster option) ()
: decrease_replication_factor_response = { cluster; 
}

let make_decrease_replication_factor_request 
  ?(node_ids_to_remove : string list option)
  ?(availability_zones : string list option)
  ~(new_replication_factor : int)
  ~(cluster_name : string)
  () : decrease_replication_factor_request = {
  node_ids_to_remove;
  availability_zones;
  new_replication_factor;
  cluster_name;
   }

let make_create_subnet_group_response 
  ?(subnet_group : subnet_group option) () : create_subnet_group_response = {
  subnet_group;  }

let make_create_subnet_group_request 
  ?(description : string option)
  ~(subnet_ids : string list)
  ~(subnet_group_name : string)
  () : create_subnet_group_request = {
  subnet_ids; description; subnet_group_name; 
}

let make_create_parameter_group_response 
  ?(parameter_group : parameter_group option) ()
: create_parameter_group_response = { parameter_group; 
}

let make_create_parameter_group_request 
  ?(description : string option) ~(parameter_group_name : string) ()
: create_parameter_group_request = { description; parameter_group_name; 
}

let make_create_cluster_response  ?(cluster : cluster option) ()
: create_cluster_response = { cluster;  }

let make_create_cluster_request 
  ?(cluster_endpoint_encryption_type : cluster_endpoint_encryption_type option)
  ?(sse_specification : sse_specification option)
  ?(tags : tag list option)
  ?(parameter_group_name : string option)
  ?(notification_topic_arn : string option)
  ?(preferred_maintenance_window : string option)
  ?(security_group_ids : string list option)
  ?(subnet_group_name : string option)
  ?(availability_zones : string list option)
  ?(description : string option)
  ~(iam_role_arn : string)
  ~(replication_factor : int)
  ~(node_type : string)
  ~(cluster_name : string)
  () : create_cluster_request = {
  cluster_endpoint_encryption_type;
  sse_specification;
  tags;
  parameter_group_name;
  iam_role_arn;
  notification_topic_arn;
  preferred_maintenance_window;
  security_group_ids;
  subnet_group_name;
  availability_zones;
  replication_factor;
  description;
  node_type;
  cluster_name;
  
}

