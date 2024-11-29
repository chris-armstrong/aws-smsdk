open Types
val make_vpc_configuration :
  ?tls_certificate:string ->
  security_group_ids:string list ->
  subnet_ids:string list ->
  vpc_id:string ->
  unit
-> vpc_configuration
(** Create a {!type-vpc_configuration} type *)

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
  unit
-> sync_configuration
(** Create a {!type-sync_configuration} type *)

val make_update_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> update_sync_configuration_output
(** Create a {!type-update_sync_configuration_output} type *)

val make_update_sync_configuration_input :
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?publish_deployment_status:publish_deployment_status ->
  ?role_arn:string ->
  ?repository_link_id:string ->
  ?config_file:string ->
  ?branch:string ->
  sync_type:sync_configuration_type ->
  resource_name:string ->
  unit
-> update_sync_configuration_input
(** Create a {!type-update_sync_configuration_input} type *)

val make_sync_blocker_context : value:string -> key:string -> unit
-> sync_blocker_context
(** Create a {!type-sync_blocker_context} type *)

val make_sync_blocker :
  ?resolved_at:float ->
  ?resolved_reason:string ->
  ?contexts:sync_blocker_context list ->
  created_at:float ->
  created_reason:string ->
  status:blocker_status ->
  type_:blocker_type ->
  id:string ->
  unit
-> sync_blocker
(** Create a {!type-sync_blocker} type *)

val make_update_sync_blocker_output :
  ?parent_resource_name:string ->
  sync_blocker:sync_blocker ->
  resource_name:string ->
  unit
-> update_sync_blocker_output
(** Create a {!type-update_sync_blocker_output} type *)

val make_update_sync_blocker_input :
  resolved_reason:string ->
  resource_name:string ->
  sync_type:sync_configuration_type ->
  id:string ->
  unit
-> update_sync_blocker_input
(** Create a {!type-update_sync_blocker_input} type *)

val make_repository_link_info :
  ?encryption_key_arn:string ->
  repository_name:string ->
  repository_link_id:string ->
  repository_link_arn:string ->
  provider_type:provider_type ->
  owner_id:string ->
  connection_arn:string ->
  unit
-> repository_link_info
(** Create a {!type-repository_link_info} type *)

val make_update_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> update_repository_link_output
(** Create a {!type-update_repository_link_output} type *)

val make_update_repository_link_input :
  ?encryption_key_arn:string ->
  ?connection_arn:string ->
  repository_link_id:string ->
  unit
-> update_repository_link_input
(** Create a {!type-update_repository_link_input} type *)

val make_update_host_output : unit
-> update_host_output
(** Create a {!type-update_host_output} type *)

val make_update_host_input :
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  host_arn:string ->
  unit
-> update_host_input
(** Create a {!type-update_host_input} type *)

val make_untag_resource_output : unit
-> untag_resource_output
(** Create a {!type-untag_resource_output} type *)

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input
(** Create a {!type-untag_resource_input} type *)

val make_tag_resource_output : unit
-> tag_resource_output
(** Create a {!type-tag_resource_output} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_input : tags:tag list -> resource_arn:string -> unit
-> tag_resource_input
(** Create a {!type-tag_resource_input} type *)

val make_sync_blocker_summary :
  ?latest_blockers:sync_blocker list ->
  ?parent_resource_name:string ->
  resource_name:string ->
  unit
-> sync_blocker_summary
(** Create a {!type-sync_blocker_summary} type *)

val make_revision :
  sha:string ->
  provider_type:provider_type ->
  repository_name:string ->
  owner_id:string ->
  directory:string ->
  branch:string ->
  unit
-> revision
(** Create a {!type-revision} type *)

val make_resource_sync_event :
  ?external_id:string -> type_:string -> time:float -> event:string -> unit
-> resource_sync_event
(** Create a {!type-resource_sync_event} type *)

val make_resource_sync_attempt :
  target:string ->
  target_revision:revision ->
  status:resource_sync_status ->
  started_at:float ->
  initial_revision:revision ->
  events:resource_sync_event list ->
  unit
-> resource_sync_attempt
(** Create a {!type-resource_sync_attempt} type *)

val make_repository_sync_event :
  ?external_id:string -> type_:string -> time:float -> event:string -> unit
-> repository_sync_event
(** Create a {!type-repository_sync_event} type *)

val make_repository_sync_definition :
  target:string -> parent:string -> directory:string -> branch:string -> unit
-> repository_sync_definition
(** Create a {!type-repository_sync_definition} type *)

val make_repository_sync_attempt :
  events:repository_sync_event list ->
  status:repository_sync_status ->
  started_at:float ->
  unit
-> repository_sync_attempt
(** Create a {!type-repository_sync_attempt} type *)

val make_list_tags_for_resource_output : ?tags:tag list -> unit
-> list_tags_for_resource_output
(** Create a {!type-list_tags_for_resource_output} type *)

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input
(** Create a {!type-list_tags_for_resource_input} type *)

val make_list_sync_configurations_output :
  ?next_token:string -> sync_configurations:sync_configuration list -> unit
-> list_sync_configurations_output
(** Create a {!type-list_sync_configurations_output} type *)

val make_list_sync_configurations_input :
  ?next_token:string ->
  ?max_results:int ->
  sync_type:sync_configuration_type ->
  repository_link_id:string ->
  unit
-> list_sync_configurations_input
(** Create a {!type-list_sync_configurations_input} type *)

val make_list_repository_sync_definitions_output :
  ?next_token:string ->
  repository_sync_definitions:repository_sync_definition list ->
  unit
-> list_repository_sync_definitions_output
(** Create a {!type-list_repository_sync_definitions_output} type *)

val make_list_repository_sync_definitions_input :
  sync_type:sync_configuration_type -> repository_link_id:string -> unit
-> list_repository_sync_definitions_input
(** Create a {!type-list_repository_sync_definitions_input} type *)

val make_list_repository_links_output :
  ?next_token:string -> repository_links:repository_link_info list -> unit
-> list_repository_links_output
(** Create a {!type-list_repository_links_output} type *)

val make_list_repository_links_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_repository_links_input
(** Create a {!type-list_repository_links_input} type *)

val make_host :
  ?status_message:string ->
  ?status:string ->
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  ?provider_type:provider_type ->
  ?host_arn:string ->
  ?name:string ->
  unit -> host
(** Create a {!type-host} type *)

val make_list_hosts_output : ?next_token:string -> ?hosts:host list -> unit
-> list_hosts_output
(** Create a {!type-list_hosts_output} type *)

val make_list_hosts_input : ?next_token:string -> ?max_results:int -> unit
-> list_hosts_input
(** Create a {!type-list_hosts_input} type *)

val make_connection :
  ?host_arn:string ->
  ?connection_status:connection_status ->
  ?owner_account_id:string ->
  ?provider_type:provider_type ->
  ?connection_arn:string ->
  ?connection_name:string ->
  unit
-> connection
(** Create a {!type-connection} type *)

val make_list_connections_output :
  ?next_token:string -> ?connections:connection list -> unit
-> list_connections_output
(** Create a {!type-list_connections_output} type *)

val make_list_connections_input :
  ?next_token:string ->
  ?max_results:int ->
  ?host_arn_filter:string ->
  ?provider_type_filter:provider_type ->
  unit
-> list_connections_input
(** Create a {!type-list_connections_input} type *)

val make_get_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> get_sync_configuration_output
(** Create a {!type-get_sync_configuration_output} type *)

val make_get_sync_configuration_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> get_sync_configuration_input
(** Create a {!type-get_sync_configuration_input} type *)

val make_get_sync_blocker_summary_output :
  sync_blocker_summary:sync_blocker_summary -> unit
-> get_sync_blocker_summary_output
(** Create a {!type-get_sync_blocker_summary_output} type *)

val make_get_sync_blocker_summary_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> get_sync_blocker_summary_input
(** Create a {!type-get_sync_blocker_summary_input} type *)

val make_get_resource_sync_status_output :
  ?latest_successful_sync:resource_sync_attempt ->
  ?desired_state:revision ->
  latest_sync:resource_sync_attempt ->
  unit
-> get_resource_sync_status_output
(** Create a {!type-get_resource_sync_status_output} type *)

val make_get_resource_sync_status_input :
  sync_type:sync_configuration_type -> resource_name:string -> unit
-> get_resource_sync_status_input
(** Create a {!type-get_resource_sync_status_input} type *)

val make_get_repository_sync_status_output :
  latest_sync:repository_sync_attempt -> unit
-> get_repository_sync_status_output
(** Create a {!type-get_repository_sync_status_output} type *)

val make_get_repository_sync_status_input :
  sync_type:sync_configuration_type ->
  repository_link_id:string ->
  branch:string ->
  unit
-> get_repository_sync_status_input
(** Create a {!type-get_repository_sync_status_input} type *)

val make_get_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> get_repository_link_output
(** Create a {!type-get_repository_link_output} type *)

val make_get_repository_link_input : repository_link_id:string -> unit
-> get_repository_link_input
(** Create a {!type-get_repository_link_input} type *)

val make_get_host_output :
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  ?provider_type:provider_type ->
  ?status:string ->
  ?name:string ->
  unit
-> get_host_output
(** Create a {!type-get_host_output} type *)

val make_get_host_input : host_arn:string -> unit
-> get_host_input
(** Create a {!type-get_host_input} type *)

val make_get_connection_output : ?connection:connection -> unit
-> get_connection_output
(** Create a {!type-get_connection_output} type *)

val make_get_connection_input : connection_arn:string -> unit
-> get_connection_input
(** Create a {!type-get_connection_input} type *)

val make_delete_sync_configuration_output : unit
-> delete_sync_configuration_output
(** Create a {!type-delete_sync_configuration_output} type *)

val make_delete_sync_configuration_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> delete_sync_configuration_input
(** Create a {!type-delete_sync_configuration_input} type *)

val make_delete_repository_link_output : unit
-> delete_repository_link_output
(** Create a {!type-delete_repository_link_output} type *)

val make_delete_repository_link_input : repository_link_id:string -> unit
-> delete_repository_link_input
(** Create a {!type-delete_repository_link_input} type *)

val make_delete_host_output : unit
-> delete_host_output
(** Create a {!type-delete_host_output} type *)

val make_delete_host_input : host_arn:string -> unit
-> delete_host_input
(** Create a {!type-delete_host_input} type *)

val make_delete_connection_output : unit
-> delete_connection_output
(** Create a {!type-delete_connection_output} type *)

val make_delete_connection_input : connection_arn:string -> unit
-> delete_connection_input
(** Create a {!type-delete_connection_input} type *)

val make_create_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> create_sync_configuration_output
(** Create a {!type-create_sync_configuration_output} type *)

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
(** Create a {!type-create_sync_configuration_input} type *)

val make_create_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> create_repository_link_output
(** Create a {!type-create_repository_link_output} type *)

val make_create_repository_link_input :
  ?tags:tag list ->
  ?encryption_key_arn:string ->
  repository_name:string ->
  owner_id:string ->
  connection_arn:string ->
  unit
-> create_repository_link_input
(** Create a {!type-create_repository_link_input} type *)

val make_create_host_output : ?tags:tag list -> ?host_arn:string -> unit
-> create_host_output
(** Create a {!type-create_host_output} type *)

val make_create_host_input :
  ?tags:tag list ->
  ?vpc_configuration:vpc_configuration ->
  provider_endpoint:string ->
  provider_type:provider_type ->
  name:string ->
  unit
-> create_host_input
(** Create a {!type-create_host_input} type *)

val make_create_connection_output :
  ?tags:tag list -> connection_arn:string -> unit
-> create_connection_output
(** Create a {!type-create_connection_output} type *)

val make_create_connection_input :
  ?host_arn:string ->
  ?tags:tag list ->
  ?provider_type:provider_type ->
  connection_name:string ->
  unit
-> create_connection_input
(** Create a {!type-create_connection_input} type *)

