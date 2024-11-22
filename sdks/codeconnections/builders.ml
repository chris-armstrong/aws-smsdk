[@@@warning "-39"]
open Types
let make_vpc_configuration 
  ?(tls_certificate : string option)
  ~(security_group_ids : string list)
  ~(subnet_ids : string list)
  ~(vpc_id : string)
  () : vpc_configuration = {
  tls_certificate; security_group_ids; subnet_ids; vpc_id; 
}

let make_sync_configuration 
  ?(trigger_resource_update_on : trigger_resource_update_on option)
  ?(publish_deployment_status : publish_deployment_status option)
  ?(config_file : string option)
  ~(sync_type : sync_configuration_type)
  ~(role_arn : string)
  ~(resource_name : string)
  ~(repository_name : string)
  ~(repository_link_id : string)
  ~(provider_type : provider_type)
  ~(owner_id : string)
  ~(branch : string)
  () : sync_configuration = {
  trigger_resource_update_on;
  publish_deployment_status;
  sync_type;
  role_arn;
  resource_name;
  repository_name;
  repository_link_id;
  provider_type;
  owner_id;
  config_file;
  branch;
   }

let make_update_sync_configuration_output 
  ~(sync_configuration : sync_configuration) ()
: update_sync_configuration_output = { sync_configuration; 
}

let make_update_sync_configuration_input 
  ?(trigger_resource_update_on : trigger_resource_update_on option)
  ?(publish_deployment_status : publish_deployment_status option)
  ?(role_arn : string option)
  ?(repository_link_id : string option)
  ?(config_file : string option)
  ?(branch : string option)
  ~(sync_type : sync_configuration_type)
  ~(resource_name : string)
  () : update_sync_configuration_input = {
  trigger_resource_update_on;
  publish_deployment_status;
  sync_type;
  role_arn;
  resource_name;
  repository_link_id;
  config_file;
  branch;
   }

let make_sync_blocker_context  ~(value : string) ~(key : string) ()
: sync_blocker_context = { value; key;  }

let make_sync_blocker 
  ?(resolved_at : float option)
  ?(resolved_reason : string option)
  ?(contexts : sync_blocker_context list option)
  ~(created_at : float)
  ~(created_reason : string)
  ~(status : blocker_status)
  ~(type_ : blocker_type)
  ~(id : string)
  () : sync_blocker = {
  resolved_at;
  resolved_reason;
  contexts;
  created_at;
  created_reason;
  status;
  type_;
  id;
   }

let make_update_sync_blocker_output 
  ?(parent_resource_name : string option)
  ~(sync_blocker : sync_blocker)
  ~(resource_name : string)
  () : update_sync_blocker_output = {
  sync_blocker; parent_resource_name; resource_name; 
}

let make_update_sync_blocker_input 
  ~(resolved_reason : string)
  ~(resource_name : string)
  ~(sync_type : sync_configuration_type)
  ~(id : string)
  () : update_sync_blocker_input = {
  resolved_reason; resource_name; sync_type; id; 
}

let make_repository_link_info 
  ?(encryption_key_arn : string option)
  ~(repository_name : string)
  ~(repository_link_id : string)
  ~(repository_link_arn : string)
  ~(provider_type : provider_type)
  ~(owner_id : string)
  ~(connection_arn : string)
  () : repository_link_info = {
  repository_name;
  repository_link_id;
  repository_link_arn;
  provider_type;
  owner_id;
  encryption_key_arn;
  connection_arn;
   }

let make_update_repository_link_output 
  ~(repository_link_info : repository_link_info) ()
: update_repository_link_output = { repository_link_info; 
}

let make_update_repository_link_input 
  ?(encryption_key_arn : string option)
  ?(connection_arn : string option)
  ~(repository_link_id : string)
  () : update_repository_link_input = {
  repository_link_id; encryption_key_arn; connection_arn; 
}

let make_update_host_output  () : update_host_output =
()

let make_update_host_input 
  ?(vpc_configuration : vpc_configuration option)
  ?(provider_endpoint : string option)
  ~(host_arn : string)
  () : update_host_input = { vpc_configuration; provider_endpoint; host_arn; 
}

let make_untag_resource_output  () : untag_resource_output =
()

let make_untag_resource_input 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_input = { tag_keys; resource_arn; 
}

let make_tag_resource_output  () : tag_resource_output = ()

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_resource_input  ~(tags : tag list) ~(resource_arn : string) ()
: tag_resource_input = { tags; resource_arn;  }

let make_sync_blocker_summary 
  ?(latest_blockers : sync_blocker list option)
  ?(parent_resource_name : string option)
  ~(resource_name : string)
  () : sync_blocker_summary = {
  latest_blockers; parent_resource_name; resource_name;  }

let make_revision 
  ~(sha : string)
  ~(provider_type : provider_type)
  ~(repository_name : string)
  ~(owner_id : string)
  ~(directory : string)
  ~(branch : string)
  () : revision = {
  sha; provider_type; repository_name; owner_id; directory; branch; 
}

let make_resource_sync_event 
  ?(external_id : string option)
  ~(type_ : string)
  ~(time : float)
  ~(event : string)
  () : resource_sync_event = { type_; time; external_id; event; 
}

let make_resource_sync_attempt 
  ~(target : string)
  ~(target_revision : revision)
  ~(status : resource_sync_status)
  ~(started_at : float)
  ~(initial_revision : revision)
  ~(events : resource_sync_event list)
  () : resource_sync_attempt = {
  target; target_revision; status; started_at; initial_revision; events; 
}

let make_repository_sync_event 
  ?(external_id : string option)
  ~(type_ : string)
  ~(time : float)
  ~(event : string)
  () : repository_sync_event = { type_; time; external_id; event; 
}

let make_repository_sync_definition 
  ~(target : string)
  ~(parent : string)
  ~(directory : string)
  ~(branch : string)
  () : repository_sync_definition = { target; parent; directory; branch; 
}

let make_repository_sync_attempt 
  ~(events : repository_sync_event list)
  ~(status : repository_sync_status)
  ~(started_at : float)
  () : repository_sync_attempt = { events; status; started_at; 
}

let make_list_tags_for_resource_output  ?(tags : tag list option) ()
: list_tags_for_resource_output = { tags; 
}

let make_list_tags_for_resource_input  ~(resource_arn : string) ()
: list_tags_for_resource_input = { resource_arn; 
}

let make_list_sync_configurations_output 
  ?(next_token : string option)
  ~(sync_configurations : sync_configuration list)
  () : list_sync_configurations_output = { next_token; sync_configurations; 
}

let make_list_sync_configurations_input 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(sync_type : sync_configuration_type)
  ~(repository_link_id : string)
  () : list_sync_configurations_input = {
  sync_type; repository_link_id; next_token; max_results; 
}

let make_list_repository_sync_definitions_output 
  ?(next_token : string option)
  ~(repository_sync_definitions : repository_sync_definition list)
  () : list_repository_sync_definitions_output = {
  next_token; repository_sync_definitions; 
}

let make_list_repository_sync_definitions_input 
  ~(sync_type : sync_configuration_type) ~(repository_link_id : string) ()
: list_repository_sync_definitions_input = { sync_type; repository_link_id; 
}

let make_list_repository_links_output 
  ?(next_token : string option)
  ~(repository_links : repository_link_info list)
  () : list_repository_links_output = { next_token; repository_links; 
}

let make_list_repository_links_input 
  ?(next_token : string option) ?(max_results : int option) ()
: list_repository_links_input = { next_token; max_results;  }

let make_host 
  ?(status_message : string option)
  ?(status : string option)
  ?(vpc_configuration : vpc_configuration option)
  ?(provider_endpoint : string option)
  ?(provider_type : provider_type option)
  ?(host_arn : string option)
  ?(name : string option)
  () : host = {
  status_message;
  status;
  vpc_configuration;
  provider_endpoint;
  provider_type;
  host_arn;
  name;
   }

let make_list_hosts_output 
  ?(next_token : string option) ?(hosts : host list option) ()
: list_hosts_output = { next_token; hosts;  }

let make_list_hosts_input 
  ?(next_token : string option) ?(max_results : int option) ()
: list_hosts_input = { next_token; max_results;  }

let make_connection 
  ?(host_arn : string option)
  ?(connection_status : connection_status option)
  ?(owner_account_id : string option)
  ?(provider_type : provider_type option)
  ?(connection_arn : string option)
  ?(connection_name : string option)
  () : connection = {
  host_arn;
  connection_status;
  owner_account_id;
  provider_type;
  connection_arn;
  connection_name;
   }

let make_list_connections_output 
  ?(next_token : string option) ?(connections : connection list option) ()
: list_connections_output = { next_token; connections; 
}

let make_list_connections_input 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(host_arn_filter : string option)
  ?(provider_type_filter : provider_type option)
  () : list_connections_input = {
  next_token; max_results; host_arn_filter; provider_type_filter; 
}

let make_get_sync_configuration_output 
  ~(sync_configuration : sync_configuration) ()
: get_sync_configuration_output = { sync_configuration; 
}

let make_get_sync_configuration_input 
  ~(resource_name : string) ~(sync_type : sync_configuration_type) ()
: get_sync_configuration_input = { resource_name; sync_type; 
}

let make_get_sync_blocker_summary_output 
  ~(sync_blocker_summary : sync_blocker_summary) ()
: get_sync_blocker_summary_output = { sync_blocker_summary; 
}

let make_get_sync_blocker_summary_input 
  ~(resource_name : string) ~(sync_type : sync_configuration_type) ()
: get_sync_blocker_summary_input = { resource_name; sync_type; 
}

let make_get_resource_sync_status_output 
  ?(latest_successful_sync : resource_sync_attempt option)
  ?(desired_state : revision option)
  ~(latest_sync : resource_sync_attempt)
  () : get_resource_sync_status_output = {
  latest_sync; latest_successful_sync; desired_state; 
}

let make_get_resource_sync_status_input 
  ~(sync_type : sync_configuration_type) ~(resource_name : string) ()
: get_resource_sync_status_input = { sync_type; resource_name; 
}

let make_get_repository_sync_status_output 
  ~(latest_sync : repository_sync_attempt) ()
: get_repository_sync_status_output = { latest_sync; 
}

let make_get_repository_sync_status_input 
  ~(sync_type : sync_configuration_type)
  ~(repository_link_id : string)
  ~(branch : string)
  () : get_repository_sync_status_input = {
  sync_type; repository_link_id; branch; 
}

let make_get_repository_link_output 
  ~(repository_link_info : repository_link_info) ()
: get_repository_link_output = { repository_link_info; 
}

let make_get_repository_link_input  ~(repository_link_id : string) ()
: get_repository_link_input = { repository_link_id; 
}

let make_get_host_output 
  ?(vpc_configuration : vpc_configuration option)
  ?(provider_endpoint : string option)
  ?(provider_type : provider_type option)
  ?(status : string option)
  ?(name : string option)
  () : get_host_output = {
  vpc_configuration; provider_endpoint; provider_type; status; name; 
}

let make_get_host_input  ~(host_arn : string) () : get_host_input = {
  host_arn;  }

let make_get_connection_output  ?(connection : connection option) ()
: get_connection_output = { connection;  }

let make_get_connection_input  ~(connection_arn : string) ()
: get_connection_input = { connection_arn; 
}

let make_delete_sync_configuration_output  ()
: delete_sync_configuration_output =
()

let make_delete_sync_configuration_input 
  ~(resource_name : string) ~(sync_type : sync_configuration_type) ()
: delete_sync_configuration_input = { resource_name; sync_type; 
}

let make_delete_repository_link_output  () : delete_repository_link_output =
()

let make_delete_repository_link_input  ~(repository_link_id : string) ()
: delete_repository_link_input = { repository_link_id; 
}

let make_delete_host_output  () : delete_host_output =
()

let make_delete_host_input  ~(host_arn : string) () : delete_host_input = {
  host_arn;  }

let make_delete_connection_output  () : delete_connection_output =
()

let make_delete_connection_input  ~(connection_arn : string) ()
: delete_connection_input = { connection_arn; 
}

let make_create_sync_configuration_output 
  ~(sync_configuration : sync_configuration) ()
: create_sync_configuration_output = { sync_configuration; 
}

let make_create_sync_configuration_input 
  ?(trigger_resource_update_on : trigger_resource_update_on option)
  ?(publish_deployment_status : publish_deployment_status option)
  ~(sync_type : sync_configuration_type)
  ~(role_arn : string)
  ~(resource_name : string)
  ~(repository_link_id : string)
  ~(config_file : string)
  ~(branch : string)
  () : create_sync_configuration_input = {
  trigger_resource_update_on;
  publish_deployment_status;
  sync_type;
  role_arn;
  resource_name;
  repository_link_id;
  config_file;
  branch;
   }

let make_create_repository_link_output 
  ~(repository_link_info : repository_link_info) ()
: create_repository_link_output = { repository_link_info; 
}

let make_create_repository_link_input 
  ?(tags : tag list option)
  ?(encryption_key_arn : string option)
  ~(repository_name : string)
  ~(owner_id : string)
  ~(connection_arn : string)
  () : create_repository_link_input = {
  tags; encryption_key_arn; repository_name; owner_id; connection_arn; 
}

let make_create_host_output 
  ?(tags : tag list option) ?(host_arn : string option) ()
: create_host_output = { tags; host_arn;  }

let make_create_host_input 
  ?(tags : tag list option)
  ?(vpc_configuration : vpc_configuration option)
  ~(provider_endpoint : string)
  ~(provider_type : provider_type)
  ~(name : string)
  () : create_host_input = {
  tags; vpc_configuration; provider_endpoint; provider_type; name; 
}

let make_create_connection_output 
  ?(tags : tag list option) ~(connection_arn : string) ()
: create_connection_output = { tags; connection_arn; 
}

let make_create_connection_input 
  ?(host_arn : string option)
  ?(tags : tag list option)
  ?(provider_type : provider_type option)
  ~(connection_name : string)
  () : create_connection_input = {
  host_arn; tags; connection_name; provider_type; 
}

