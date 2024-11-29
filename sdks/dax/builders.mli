open Types
val make_subnet :
  ?subnet_availability_zone:string -> ?subnet_identifier:string -> unit
-> subnet
(** Create a {!type-subnet} type *)

val make_subnet_group :
  ?subnets:subnet list ->
  ?vpc_id:string ->
  ?description:string ->
  ?subnet_group_name:string ->
  unit
-> subnet_group
(** Create a {!type-subnet_group} type *)

val make_update_subnet_group_response : ?subnet_group:subnet_group -> unit
-> update_subnet_group_response
(** Create a {!type-update_subnet_group_response} type *)

val make_update_subnet_group_request :
  ?subnet_ids:string list ->
  ?description:string ->
  subnet_group_name:string ->
  unit
-> update_subnet_group_request
(** Create a {!type-update_subnet_group_request} type *)

val make_parameter_group :
  ?description:string -> ?parameter_group_name:string -> unit
-> parameter_group
(** Create a {!type-parameter_group} type *)

val make_update_parameter_group_response :
  ?parameter_group:parameter_group -> unit
-> update_parameter_group_response
(** Create a {!type-update_parameter_group_response} type *)

val make_parameter_name_value :
  ?parameter_value:string -> ?parameter_name:string -> unit
-> parameter_name_value
(** Create a {!type-parameter_name_value} type *)

val make_update_parameter_group_request :
  parameter_name_values:parameter_name_value list ->
  parameter_group_name:string ->
  unit
-> update_parameter_group_request
(** Create a {!type-update_parameter_group_request} type *)

val make_endpoint : ?ur_l:string -> ?port:int -> ?address:string -> unit
-> endpoint
(** Create a {!type-endpoint} type *)

val make_node :
  ?parameter_group_status:string ->
  ?node_status:string ->
  ?availability_zone:string ->
  ?node_create_time:float ->
  ?endpoint:endpoint ->
  ?node_id:string ->
  unit
-> node
(** Create a {!type-node} type *)

val make_notification_configuration :
  ?topic_status:string -> ?topic_arn:string -> unit
-> notification_configuration
(** Create a {!type-notification_configuration} type *)

val make_security_group_membership :
  ?status:string -> ?security_group_identifier:string -> unit
-> security_group_membership
(** Create a {!type-security_group_membership} type *)

val make_parameter_group_status :
  ?node_ids_to_reboot:string list ->
  ?parameter_apply_status:string ->
  ?parameter_group_name:string ->
  unit
-> parameter_group_status
(** Create a {!type-parameter_group_status} type *)

val make_sse_description : ?status:sse_status -> unit
-> sse_description
(** Create a {!type-sse_description} type *)

val make_cluster :
  ?cluster_endpoint_encryption_type:cluster_endpoint_encryption_type ->
  ?sse_description:sse_description ->
  ?parameter_group:parameter_group_status ->
  ?iam_role_arn:string ->
  ?security_groups:security_group_membership list ->
  ?subnet_group:string ->
  ?notification_configuration:notification_configuration ->
  ?preferred_maintenance_window:string ->
  ?nodes:node list ->
  ?node_ids_to_remove:string list ->
  ?cluster_discovery_endpoint:endpoint ->
  ?status:string ->
  ?node_type:string ->
  ?active_nodes:int ->
  ?total_nodes:int ->
  ?cluster_arn:string ->
  ?description:string ->
  ?cluster_name:string ->
  unit
-> cluster
(** Create a {!type-cluster} type *)

val make_update_cluster_response : ?cluster:cluster -> unit
-> update_cluster_response
(** Create a {!type-update_cluster_response} type *)

val make_update_cluster_request :
  ?security_group_ids:string list ->
  ?parameter_group_name:string ->
  ?notification_topic_status:string ->
  ?notification_topic_arn:string ->
  ?preferred_maintenance_window:string ->
  ?description:string ->
  cluster_name:string ->
  unit
-> update_cluster_request
(** Create a {!type-update_cluster_request} type *)

val make_tag : ?value:string -> ?key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_untag_resource_response : ?tags:tag list -> unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_name:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_tag_resource_response : ?tags:tag list -> unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag_resource_request : tags:tag list -> resource_name:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_sse_specification : enabled:bool -> unit
-> sse_specification
(** Create a {!type-sse_specification} type *)

val make_reboot_node_response : ?cluster:cluster -> unit
-> reboot_node_response
(** Create a {!type-reboot_node_response} type *)

val make_reboot_node_request : node_id:string -> cluster_name:string -> unit
-> reboot_node_request
(** Create a {!type-reboot_node_request} type *)

val make_node_type_specific_value :
  ?value:string -> ?node_type:string -> unit
-> node_type_specific_value
(** Create a {!type-node_type_specific_value} type *)

val make_parameter :
  ?change_type:change_type ->
  ?is_modifiable:is_modifiable ->
  ?allowed_values:string ->
  ?data_type:string ->
  ?source:string ->
  ?description:string ->
  ?node_type_specific_values:node_type_specific_value list ->
  ?parameter_value:string ->
  ?parameter_type:parameter_type ->
  ?parameter_name:string ->
  unit
-> parameter
(** Create a {!type-parameter} type *)

val make_list_tags_response : ?next_token:string -> ?tags:tag list -> unit
-> list_tags_response
(** Create a {!type-list_tags_response} type *)

val make_list_tags_request :
  ?next_token:string -> resource_name:string -> unit
-> list_tags_request
(** Create a {!type-list_tags_request} type *)

val make_increase_replication_factor_response : ?cluster:cluster -> unit
-> increase_replication_factor_response
(** Create a {!type-increase_replication_factor_response} type *)

val make_increase_replication_factor_request :
  ?availability_zones:string list ->
  new_replication_factor:int ->
  cluster_name:string ->
  unit
-> increase_replication_factor_request
(** Create a {!type-increase_replication_factor_request} type *)

val make_event :
  ?date:float ->
  ?message:string ->
  ?source_type:source_type ->
  ?source_name:string ->
  unit
-> event
(** Create a {!type-event} type *)

val make_describe_subnet_groups_response :
  ?subnet_groups:subnet_group list -> ?next_token:string -> unit
-> describe_subnet_groups_response
(** Create a {!type-describe_subnet_groups_response} type *)

val make_describe_subnet_groups_request :
  ?next_token:string ->
  ?max_results:int ->
  ?subnet_group_names:string list ->
  unit
-> describe_subnet_groups_request
(** Create a {!type-describe_subnet_groups_request} type *)

val make_describe_parameters_response :
  ?parameters:parameter list -> ?next_token:string -> unit
-> describe_parameters_response
(** Create a {!type-describe_parameters_response} type *)

val make_describe_parameters_request :
  ?next_token:string ->
  ?max_results:int ->
  ?source:string ->
  parameter_group_name:string ->
  unit
-> describe_parameters_request
(** Create a {!type-describe_parameters_request} type *)

val make_describe_parameter_groups_response :
  ?parameter_groups:parameter_group list -> ?next_token:string -> unit
-> describe_parameter_groups_response
(** Create a {!type-describe_parameter_groups_response} type *)

val make_describe_parameter_groups_request :
  ?next_token:string ->
  ?max_results:int ->
  ?parameter_group_names:string list ->
  unit
-> describe_parameter_groups_request
(** Create a {!type-describe_parameter_groups_request} type *)

val make_describe_events_response :
  ?events:event list -> ?next_token:string -> unit
-> describe_events_response
(** Create a {!type-describe_events_response} type *)

val make_describe_events_request :
  ?next_token:string ->
  ?max_results:int ->
  ?duration:int ->
  ?end_time:float ->
  ?start_time:float ->
  ?source_type:source_type ->
  ?source_name:string ->
  unit
-> describe_events_request
(** Create a {!type-describe_events_request} type *)

val make_describe_default_parameters_response :
  ?parameters:parameter list -> ?next_token:string -> unit
-> describe_default_parameters_response
(** Create a {!type-describe_default_parameters_response} type *)

val make_describe_default_parameters_request :
  ?next_token:string -> ?max_results:int -> unit
-> describe_default_parameters_request
(** Create a {!type-describe_default_parameters_request} type *)

val make_describe_clusters_response :
  ?clusters:cluster list -> ?next_token:string -> unit
-> describe_clusters_response
(** Create a {!type-describe_clusters_response} type *)

val make_describe_clusters_request :
  ?next_token:string ->
  ?max_results:int ->
  ?cluster_names:string list ->
  unit
-> describe_clusters_request
(** Create a {!type-describe_clusters_request} type *)

val make_delete_subnet_group_response : ?deletion_message:string -> unit
-> delete_subnet_group_response
(** Create a {!type-delete_subnet_group_response} type *)

val make_delete_subnet_group_request : subnet_group_name:string -> unit
-> delete_subnet_group_request
(** Create a {!type-delete_subnet_group_request} type *)

val make_delete_parameter_group_response : ?deletion_message:string -> unit
-> delete_parameter_group_response
(** Create a {!type-delete_parameter_group_response} type *)

val make_delete_parameter_group_request : parameter_group_name:string -> unit
-> delete_parameter_group_request
(** Create a {!type-delete_parameter_group_request} type *)

val make_delete_cluster_response : ?cluster:cluster -> unit
-> delete_cluster_response
(** Create a {!type-delete_cluster_response} type *)

val make_delete_cluster_request : cluster_name:string -> unit
-> delete_cluster_request
(** Create a {!type-delete_cluster_request} type *)

val make_decrease_replication_factor_response : ?cluster:cluster -> unit
-> decrease_replication_factor_response
(** Create a {!type-decrease_replication_factor_response} type *)

val make_decrease_replication_factor_request :
  ?node_ids_to_remove:string list ->
  ?availability_zones:string list ->
  new_replication_factor:int ->
  cluster_name:string ->
  unit
-> decrease_replication_factor_request
(** Create a {!type-decrease_replication_factor_request} type *)

val make_create_subnet_group_response : ?subnet_group:subnet_group -> unit
-> create_subnet_group_response
(** Create a {!type-create_subnet_group_response} type *)

val make_create_subnet_group_request :
  ?description:string ->
  subnet_ids:string list ->
  subnet_group_name:string ->
  unit
-> create_subnet_group_request
(** Create a {!type-create_subnet_group_request} type *)

val make_create_parameter_group_response :
  ?parameter_group:parameter_group -> unit
-> create_parameter_group_response
(** Create a {!type-create_parameter_group_response} type *)

val make_create_parameter_group_request :
  ?description:string -> parameter_group_name:string -> unit
-> create_parameter_group_request
(** Create a {!type-create_parameter_group_request} type *)

val make_create_cluster_response : ?cluster:cluster -> unit
-> create_cluster_response
(** Create a {!type-create_cluster_response} type *)

val make_create_cluster_request :
  ?cluster_endpoint_encryption_type:cluster_endpoint_encryption_type ->
  ?sse_specification:sse_specification ->
  ?tags:tag list ->
  ?parameter_group_name:string ->
  ?notification_topic_arn:string ->
  ?preferred_maintenance_window:string ->
  ?security_group_ids:string list ->
  ?subnet_group_name:string ->
  ?availability_zones:string list ->
  ?description:string ->
  iam_role_arn:string ->
  replication_factor:int ->
  node_type:string ->
  cluster_name:string ->
  unit
-> create_cluster_request
(** Create a {!type-create_cluster_request} type *)

