open Types
val make_vpc_configuration :
  ?tls_certificate:string ->
  security_group_ids:string list ->
  subnet_ids:string list ->
  vpc_id:string ->
  unit -> vpc_configuration

val make_sync_configuration :
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?publish_deployment_status:publish_deployment_status ->
  ?config_file:string ->
  sync_type:sync_configuration_type ->
  role_arn:string ->
  resource_name:string ->
  repository_name:string ->
  repository_link_id:string ->
  provider_type:provider_type ->
  owner_id:string ->
  branch:string ->
  unit -> sync_configuration

val make_update_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> update_sync_configuration_output

val make_update_sync_configuration_input :
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?publish_deployment_status:publish_deployment_status ->
  ?role_arn:string ->
  ?repository_link_id:string ->
  ?config_file:string ->
  ?branch:string ->
  sync_type:sync_configuration_type ->
  resource_name:string ->
  unit -> update_sync_configuration_input

val make_sync_blocker_context : value:string -> key:string -> unit
-> sync_blocker_context

val make_sync_blocker :
  ?resolved_at:float ->
  ?resolved_reason:string ->
  ?contexts:sync_blocker_context list ->
  created_at:float ->
  created_reason:string ->
  status:blocker_status ->
  type_:blocker_type ->
  id:string ->
  unit -> sync_blocker

val make_update_sync_blocker_output :
  ?parent_resource_name:string ->
  sync_blocker:sync_blocker ->
  resource_name:string ->
  unit -> update_sync_blocker_output

val make_update_sync_blocker_input :
  resolved_reason:string ->
  resource_name:string ->
  sync_type:sync_configuration_type ->
  id:string ->
  unit -> update_sync_blocker_input

val make_repository_link_info :
  ?encryption_key_arn:string ->
  repository_name:string ->
  repository_link_id:string ->
  repository_link_arn:string ->
  provider_type:provider_type ->
  owner_id:string ->
  connection_arn:string ->
  unit -> repository_link_info

val make_update_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> update_repository_link_output

val make_update_repository_link_input :
  ?encryption_key_arn:string ->
  ?connection_arn:string ->
  repository_link_id:string ->
  unit -> update_repository_link_input

val make_update_host_output : unit
-> update_host_output

val make_update_host_input :
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  host_arn:string ->
  unit -> update_host_input

val make_untag_resource_output : unit
-> untag_resource_output

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input

val make_tag_resource_output : unit -> tag_resource_output

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_input : tags:tag list -> resource_arn:string -> unit
-> tag_resource_input

val make_sync_blocker_summary :
  ?latest_blockers:sync_blocker list ->
  ?parent_resource_name:string ->
  resource_name:string ->
  unit -> sync_blocker_summary

val make_revision :
  sha:string ->
  provider_type:provider_type ->
  repository_name:string ->
  owner_id:string ->
  directory:string ->
  branch:string ->
  unit -> revision

val make_resource_sync_event :
  ?external_id:string -> type_:string -> time:float -> event:string -> unit
-> resource_sync_event

val make_resource_sync_attempt :
  target:string ->
  target_revision:revision ->
  status:resource_sync_status ->
  started_at:float ->
  initial_revision:revision ->
  events:resource_sync_event list ->
  unit -> resource_sync_attempt

val make_repository_sync_event :
  ?external_id:string -> type_:string -> time:float -> event:string -> unit
-> repository_sync_event

val make_repository_sync_definition :
  target:string -> parent:string -> directory:string -> branch:string -> unit
-> repository_sync_definition

val make_repository_sync_attempt :
  events:repository_sync_event list ->
  status:repository_sync_status ->
  started_at:float ->
  unit -> repository_sync_attempt

val make_list_tags_for_resource_output : ?tags:tag list -> unit
-> list_tags_for_resource_output

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input

val make_list_sync_configurations_output :
  ?next_token:string -> sync_configurations:sync_configuration list -> unit
-> list_sync_configurations_output

val make_list_sync_configurations_input :
  ?next_token:string ->
  ?max_results:int ->
  sync_type:sync_configuration_type ->
  repository_link_id:string ->
  unit
-> list_sync_configurations_input

val make_list_repository_sync_definitions_output :
  ?next_token:string ->
  repository_sync_definitions:repository_sync_definition list ->
  unit
-> list_repository_sync_definitions_output

val make_list_repository_sync_definitions_input :
  sync_type:sync_configuration_type -> repository_link_id:string -> unit
-> list_repository_sync_definitions_input

val make_list_repository_links_output :
  ?next_token:string -> repository_links:repository_link_info list -> unit
-> list_repository_links_output

val make_list_repository_links_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_repository_links_input

val make_host :
  ?status_message:string ->
  ?status:string ->
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  ?provider_type:provider_type ->
  ?host_arn:string ->
  ?name:string ->
  unit -> host

val make_list_hosts_output : ?next_token:string -> ?hosts:host list -> unit
-> list_hosts_output

val make_list_hosts_input : ?next_token:string -> ?max_results:int -> unit
-> list_hosts_input

val make_connection :
  ?host_arn:string ->
  ?connection_status:connection_status ->
  ?owner_account_id:string ->
  ?provider_type:provider_type ->
  ?connection_arn:string ->
  ?connection_name:string ->
  unit -> connection

val make_list_connections_output :
  ?next_token:string -> ?connections:connection list -> unit
-> list_connections_output

val make_list_connections_input :
  ?next_token:string ->
  ?max_results:int ->
  ?host_arn_filter:string ->
  ?provider_type_filter:provider_type ->
  unit -> list_connections_input

val make_get_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> get_sync_configuration_output

val make_get_sync_configuration_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> get_sync_configuration_input

val make_get_sync_blocker_summary_output :
  sync_blocker_summary:sync_blocker_summary -> unit
-> get_sync_blocker_summary_output

val make_get_sync_blocker_summary_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> get_sync_blocker_summary_input

val make_get_resource_sync_status_output :
  ?latest_successful_sync:resource_sync_attempt ->
  ?desired_state:revision ->
  latest_sync:resource_sync_attempt ->
  unit
-> get_resource_sync_status_output

val make_get_resource_sync_status_input :
  sync_type:sync_configuration_type -> resource_name:string -> unit
-> get_resource_sync_status_input

val make_get_repository_sync_status_output :
  latest_sync:repository_sync_attempt -> unit
-> get_repository_sync_status_output

val make_get_repository_sync_status_input :
  sync_type:sync_configuration_type ->
  repository_link_id:string ->
  branch:string ->
  unit
-> get_repository_sync_status_input

val make_get_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> get_repository_link_output

val make_get_repository_link_input : repository_link_id:string -> unit
-> get_repository_link_input

val make_get_host_output :
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  ?provider_type:provider_type ->
  ?status:string ->
  ?name:string ->
  unit -> get_host_output

val make_get_host_input : host_arn:string -> unit
-> get_host_input

val make_get_connection_output : ?connection:connection -> unit
-> get_connection_output

val make_get_connection_input : connection_arn:string -> unit
-> get_connection_input

val make_delete_sync_configuration_output : unit
-> delete_sync_configuration_output

val make_delete_sync_configuration_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> delete_sync_configuration_input

val make_delete_repository_link_output : unit
-> delete_repository_link_output

val make_delete_repository_link_input : repository_link_id:string -> unit
-> delete_repository_link_input

val make_delete_host_output : unit
-> delete_host_output

val make_delete_host_input : host_arn:string -> unit
-> delete_host_input

val make_delete_connection_output : unit
-> delete_connection_output

val make_delete_connection_input : connection_arn:string -> unit
-> delete_connection_input

val make_create_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> create_sync_configuration_output

val make_create_sync_configuration_input :
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?publish_deployment_status:publish_deployment_status ->
  sync_type:sync_configuration_type ->
  role_arn:string ->
  resource_name:string ->
  repository_link_id:string ->
  config_file:string ->
  branch:string ->
  unit
-> create_sync_configuration_input

val make_create_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> create_repository_link_output

val make_create_repository_link_input :
  ?tags:tag list ->
  ?encryption_key_arn:string ->
  repository_name:string ->
  owner_id:string ->
  connection_arn:string ->
  unit -> create_repository_link_input

val make_create_host_output : ?tags:tag list -> ?host_arn:string -> unit
-> create_host_output

val make_create_host_input :
  ?tags:tag list ->
  ?vpc_configuration:vpc_configuration ->
  provider_endpoint:string ->
  provider_type:provider_type ->
  name:string ->
  unit -> create_host_input

val make_create_connection_output :
  ?tags:tag list -> connection_arn:string -> unit
-> create_connection_output

val make_create_connection_input :
  ?host_arn:string ->
  ?tags:tag list ->
  ?provider_type:provider_type ->
  connection_name:string ->
  unit
-> create_connection_input

