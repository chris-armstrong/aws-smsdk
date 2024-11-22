open Types
val make_update_service_response : ?operation_id:string -> unit
-> update_service_response

val make_dns_record : tt_l:int -> type_:record_type -> unit
-> dns_record

val make_dns_config_change : dns_records:dns_record list -> unit
-> dns_config_change

val make_health_check_config :
  ?failure_threshold:int ->
  ?resource_path:string ->
  type_:health_check_type ->
  unit -> health_check_config

val make_service_change :
  ?health_check_config:health_check_config ->
  ?dns_config:dns_config_change ->
  ?description:string ->
  unit -> service_change

val make_update_service_request : service:service_change -> id:string -> unit
-> update_service_request

val make_update_public_dns_namespace_response : ?operation_id:string -> unit
-> update_public_dns_namespace_response

val make_soa_change : tt_l:int -> unit
-> soa_change

val make_public_dns_properties_mutable_change : so_a:soa_change -> unit
-> public_dns_properties_mutable_change

val make_public_dns_namespace_properties_change :
  dns_properties:public_dns_properties_mutable_change -> unit
-> public_dns_namespace_properties_change

val make_public_dns_namespace_change :
  ?properties:public_dns_namespace_properties_change ->
  ?description:string ->
  unit
-> public_dns_namespace_change

val make_update_public_dns_namespace_request :
  ?updater_request_id:string ->
  namespace:public_dns_namespace_change ->
  id:string ->
  unit
-> update_public_dns_namespace_request

val make_update_private_dns_namespace_response : ?operation_id:string -> unit
-> update_private_dns_namespace_response

val make_private_dns_properties_mutable_change : so_a:soa_change -> unit
-> private_dns_properties_mutable_change

val make_private_dns_namespace_properties_change :
  dns_properties:private_dns_properties_mutable_change -> unit
-> private_dns_namespace_properties_change

val make_private_dns_namespace_change :
  ?properties:private_dns_namespace_properties_change ->
  ?description:string ->
  unit
-> private_dns_namespace_change

val make_update_private_dns_namespace_request :
  ?updater_request_id:string ->
  namespace:private_dns_namespace_change ->
  id:string ->
  unit
-> update_private_dns_namespace_request

val make_update_instance_custom_health_status_request :
  status:custom_health_status ->
  instance_id:string ->
  service_id:string ->
  unit
-> update_instance_custom_health_status_request

val make_update_http_namespace_response : ?operation_id:string -> unit
-> update_http_namespace_response

val make_http_namespace_change : description:string -> unit
-> http_namespace_change

val make_update_http_namespace_request :
  ?updater_request_id:string ->
  namespace:http_namespace_change ->
  id:string ->
  unit -> update_http_namespace_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request

val make_tag_resource_response : unit -> tag_resource_response

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request

val make_dns_config :
  ?routing_policy:routing_policy ->
  ?namespace_id:string ->
  dns_records:dns_record list ->
  unit -> dns_config

val make_health_check_custom_config : ?failure_threshold:int -> unit
-> health_check_custom_config

val make_service_summary :
  ?create_date:float ->
  ?health_check_custom_config:health_check_custom_config ->
  ?health_check_config:health_check_config ->
  ?dns_config:dns_config ->
  ?instance_count:int ->
  ?description:string ->
  ?type_:service_type ->
  ?name:string ->
  ?arn:string ->
  ?id:string ->
  unit -> service_summary

val make_service_filter :
  ?condition:filter_condition ->
  values:string list ->
  name:service_filter_name ->
  unit -> service_filter

val make_service :
  ?creator_request_id:string ->
  ?create_date:float ->
  ?health_check_custom_config:health_check_custom_config ->
  ?health_check_config:health_check_config ->
  ?type_:service_type ->
  ?dns_config:dns_config ->
  ?instance_count:int ->
  ?description:string ->
  ?namespace_id:string ->
  ?name:string ->
  ?arn:string ->
  ?id:string ->
  unit -> service

val make_so_a : tt_l:int -> unit -> so_a

val make_register_instance_response : ?operation_id:string -> unit
-> register_instance_response

val make_register_instance_request :
  ?creator_request_id:string ->
  attributes:(string * string) list ->
  instance_id:string ->
  service_id:string ->
  unit -> register_instance_request

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request

val make_list_services_response :
  ?next_token:string -> ?services:service_summary list -> unit
-> list_services_response

val make_list_services_request :
  ?filters:service_filter list ->
  ?max_results:int ->
  ?next_token:string ->
  unit -> list_services_request

val make_operation_summary : ?status:operation_status -> ?id:string -> unit
-> operation_summary

val make_list_operations_response :
  ?next_token:string -> ?operations:operation_summary list -> unit
-> list_operations_response

val make_operation_filter :
  ?condition:filter_condition ->
  values:string list ->
  name:operation_filter_name ->
  unit -> operation_filter

val make_list_operations_request :
  ?filters:operation_filter list ->
  ?max_results:int ->
  ?next_token:string ->
  unit -> list_operations_request

val make_dns_properties : ?so_a:so_a -> ?hosted_zone_id:string -> unit
-> dns_properties

val make_http_properties : ?http_name:string -> unit
-> http_properties

val make_namespace_properties :
  ?http_properties:http_properties -> ?dns_properties:dns_properties -> unit
-> namespace_properties

val make_namespace_summary :
  ?create_date:float ->
  ?properties:namespace_properties ->
  ?service_count:int ->
  ?description:string ->
  ?type_:namespace_type ->
  ?name:string ->
  ?arn:string ->
  ?id:string ->
  unit -> namespace_summary

val make_list_namespaces_response :
  ?next_token:string -> ?namespaces:namespace_summary list -> unit
-> list_namespaces_response

val make_namespace_filter :
  ?condition:filter_condition ->
  values:string list ->
  name:namespace_filter_name ->
  unit -> namespace_filter

val make_list_namespaces_request :
  ?filters:namespace_filter list ->
  ?max_results:int ->
  ?next_token:string ->
  unit -> list_namespaces_request

val make_instance_summary :
  ?attributes:(string * string) list -> ?id:string -> unit
-> instance_summary

val make_list_instances_response :
  ?next_token:string -> ?instances:instance_summary list -> unit
-> list_instances_response

val make_list_instances_request :
  ?max_results:int -> ?next_token:string -> service_id:string -> unit
-> list_instances_request

val make_get_service_response : ?service:service -> unit
-> get_service_response

val make_get_service_request : id:string -> unit
-> get_service_request

val make_operation :
  ?targets:(string * string) list ->
  ?update_date:float ->
  ?create_date:float ->
  ?error_code:string ->
  ?error_message:string ->
  ?status:operation_status ->
  ?type_:operation_type ->
  ?id:string ->
  unit -> operation

val make_get_operation_response : ?operation:operation -> unit
-> get_operation_response

val make_get_operation_request : operation_id:string -> unit
-> get_operation_request

val make_namespace :
  ?creator_request_id:string ->
  ?create_date:float ->
  ?properties:namespace_properties ->
  ?service_count:int ->
  ?description:string ->
  ?type_:namespace_type ->
  ?name:string ->
  ?arn:string ->
  ?id:string ->
  unit -> namespace

val make_get_namespace_response : ?namespace:namespace -> unit
-> get_namespace_response

val make_get_namespace_request : id:string -> unit
-> get_namespace_request

val make_get_instances_health_status_response :
  ?next_token:string -> ?status:(string * health_status) list -> unit
-> get_instances_health_status_response

val make_get_instances_health_status_request :
  ?next_token:string ->
  ?max_results:int ->
  ?instances:string list ->
  service_id:string ->
  unit -> get_instances_health_status_request

val make_instance :
  ?attributes:(string * string) list ->
  ?creator_request_id:string ->
  id:string ->
  unit -> instance

val make_get_instance_response : ?instance:instance -> unit
-> get_instance_response

val make_get_instance_request :
  instance_id:string -> service_id:string -> unit
-> get_instance_request

val make_discover_instances_revision_response :
  ?instances_revision:int -> unit
-> discover_instances_revision_response

val make_discover_instances_revision_request :
  service_name:string -> namespace_name:string -> unit
-> discover_instances_revision_request

val make_http_instance_summary :
  ?attributes:(string * string) list ->
  ?health_status:health_status ->
  ?service_name:string ->
  ?namespace_name:string ->
  ?instance_id:string ->
  unit -> http_instance_summary

val make_discover_instances_response :
  ?instances_revision:int -> ?instances:http_instance_summary list -> unit
-> discover_instances_response

val make_discover_instances_request :
  ?health_status:health_status_filter ->
  ?optional_parameters:(string * string) list ->
  ?query_parameters:(string * string) list ->
  ?max_results:int ->
  service_name:string ->
  namespace_name:string ->
  unit -> discover_instances_request

val make_deregister_instance_response : ?operation_id:string -> unit
-> deregister_instance_response

val make_deregister_instance_request :
  instance_id:string -> service_id:string -> unit
-> deregister_instance_request

val make_delete_service_response : unit
-> delete_service_response

val make_delete_service_request : id:string -> unit
-> delete_service_request

val make_delete_namespace_response : ?operation_id:string -> unit
-> delete_namespace_response

val make_delete_namespace_request : id:string -> unit
-> delete_namespace_request

val make_create_service_response : ?service:service -> unit
-> create_service_response

val make_create_service_request :
  ?type_:service_type_option ->
  ?tags:tag list ->
  ?health_check_custom_config:health_check_custom_config ->
  ?health_check_config:health_check_config ->
  ?dns_config:dns_config ->
  ?description:string ->
  ?creator_request_id:string ->
  ?namespace_id:string ->
  name:string ->
  unit
-> create_service_request

val make_create_public_dns_namespace_response : ?operation_id:string -> unit
-> create_public_dns_namespace_response

val make_public_dns_properties_mutable : so_a:so_a -> unit
-> public_dns_properties_mutable

val make_public_dns_namespace_properties :
  dns_properties:public_dns_properties_mutable -> unit
-> public_dns_namespace_properties

val make_create_public_dns_namespace_request :
  ?properties:public_dns_namespace_properties ->
  ?tags:tag list ->
  ?description:string ->
  ?creator_request_id:string ->
  name:string ->
  unit
-> create_public_dns_namespace_request

val make_create_private_dns_namespace_response : ?operation_id:string -> unit
-> create_private_dns_namespace_response

val make_private_dns_properties_mutable : so_a:so_a -> unit
-> private_dns_properties_mutable

val make_private_dns_namespace_properties :
  dns_properties:private_dns_properties_mutable -> unit
-> private_dns_namespace_properties

val make_create_private_dns_namespace_request :
  ?properties:private_dns_namespace_properties ->
  ?tags:tag list ->
  ?description:string ->
  ?creator_request_id:string ->
  vpc:string ->
  name:string ->
  unit
-> create_private_dns_namespace_request

val make_create_http_namespace_response : ?operation_id:string -> unit
-> create_http_namespace_response

val make_create_http_namespace_request :
  ?tags:tag list ->
  ?description:string ->
  ?creator_request_id:string ->
  name:string ->
  unit
-> create_http_namespace_request

