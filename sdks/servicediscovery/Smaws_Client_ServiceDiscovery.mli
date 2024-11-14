open Smaws_Lib
val service : Service.descriptor

type update_service_response = {
  operation_id: string option
}

type record_type = | CNAME
  | AAAA
  | A
  | SRV

type dns_record = {
  tt_l: int;
  type_: record_type
}

type dns_config_change = {
  dns_records: dns_record list
}

type health_check_type = | TCP
  | HTTPS
  | HTTP

type health_check_config = {
  failure_threshold: int option;
  resource_path: string option;
  type_: health_check_type
}

type service_change = {
  health_check_config: health_check_config option;
  dns_config: dns_config_change option;
  description: string option
}

type update_service_request = {
  service: service_change;
  id: string
}

type service_not_found = {
  message: string option
}

type invalid_input = {
  message: string option
}

type duplicate_request = {
  duplicate_operation_id: string option;
  message: string option
}

type update_public_dns_namespace_response = {
  operation_id: string option
}

type soa_change = {
  tt_l: int
}

type public_dns_properties_mutable_change = {
  so_a: soa_change
}

type public_dns_namespace_properties_change = {
  dns_properties: public_dns_properties_mutable_change
}

type public_dns_namespace_change = {
  properties: public_dns_namespace_properties_change option;
  description: string option
}

type update_public_dns_namespace_request = {
  namespace: public_dns_namespace_change;
  updater_request_id: string option;
  id: string
}

type resource_in_use = {
  message: string option
}

type namespace_not_found = {
  message: string option
}

type update_private_dns_namespace_response = {
  operation_id: string option
}

type private_dns_properties_mutable_change = {
  so_a: soa_change
}

type private_dns_namespace_properties_change = {
  dns_properties: private_dns_properties_mutable_change
}

type private_dns_namespace_change = {
  properties: private_dns_namespace_properties_change option;
  description: string option
}

type update_private_dns_namespace_request = {
  namespace: private_dns_namespace_change;
  updater_request_id: string option;
  id: string
}

type custom_health_status = | UNHEALTHY
  | HEALTHY

type update_instance_custom_health_status_request = {
  status: custom_health_status;
  instance_id: string;
  service_id: string
}

type instance_not_found = {
  message: string option
}

type custom_health_not_found = {
  message: string option
}

type update_http_namespace_response = {
  operation_id: string option
}

type http_namespace_change = {
  description: string
}

type update_http_namespace_request = {
  namespace: http_namespace_change;
  updater_request_id: string option;
  id: string
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_ar_n: string
}

type resource_not_found_exception = {
  message: string option
}

type too_many_tags_exception = {
  resource_name: string option;
  message: string option
}

type tag_resource_response = unit

type tag = {
  value: string;
  key: string
}

type tag_resource_request = {
  tags: tag list;
  resource_ar_n: string
}

type service_type_option = | HTTP

type service_type = | DNS
  | DNS_HTTP
  | HTTP

type routing_policy = | WEIGHTED
  | MULTIVALUE

type dns_config = {
  dns_records: dns_record list;
  routing_policy: routing_policy option;
  namespace_id: string option
}

type health_check_custom_config = {
  failure_threshold: int option
}

type service_summary = {
  create_date: float option;
  health_check_custom_config: health_check_custom_config option;
  health_check_config: health_check_config option;
  dns_config: dns_config option;
  instance_count: int option;
  description: string option;
  type_: service_type option;
  name: string option;
  arn: string option;
  id: string option
}

type service_filter_name = | NAMESPACE_ID

type filter_condition = | BEGINS_WITH
  | BETWEEN
  | IN
  | EQ

type service_filter = {
  condition: filter_condition option;
  values: string list;
  name: service_filter_name
}

type service_already_exists = {
  service_id: string option;
  creator_request_id: string option;
  message: string option
}

type service = {
  creator_request_id: string option;
  create_date: float option;
  health_check_custom_config: health_check_custom_config option;
  health_check_config: health_check_config option;
  type_: service_type option;
  dns_config: dns_config option;
  instance_count: int option;
  description: string option;
  namespace_id: string option;
  name: string option;
  arn: string option;
  id: string option
}

type so_a = {
  tt_l: int
}

type resource_limit_exceeded = {
  message: string option
}

type register_instance_response = {
  operation_id: string option
}

type register_instance_request = {
  attributes: (string * string) list;
  creator_request_id: string option;
  instance_id: string;
  service_id: string
}

type list_tags_for_resource_response = {
  tags: tag list option
}

type list_tags_for_resource_request = {
  resource_ar_n: string
}

type list_services_response = {
  next_token: string option;
  services: service_summary list option
}

type list_services_request = {
  filters: service_filter list option;
  max_results: int option;
  next_token: string option
}

type operation_status = | FAIL
  | SUCCESS
  | PENDING
  | SUBMITTED

type operation_summary = {
  status: operation_status option;
  id: string option
}

type list_operations_response = {
  next_token: string option;
  operations: operation_summary list option
}

type operation_filter_name = | UPDATE_DATE
  | TYPE
  | STATUS
  | SERVICE_ID
  | NAMESPACE_ID

type operation_filter = {
  condition: filter_condition option;
  values: string list;
  name: operation_filter_name
}

type list_operations_request = {
  filters: operation_filter list option;
  max_results: int option;
  next_token: string option
}

type namespace_type = | HTTP
  | DNS_PRIVATE
  | DNS_PUBLIC

type dns_properties = {
  so_a: so_a option;
  hosted_zone_id: string option
}

type http_properties = {
  http_name: string option
}

type namespace_properties = {
  http_properties: http_properties option;
  dns_properties: dns_properties option
}

type namespace_summary = {
  create_date: float option;
  properties: namespace_properties option;
  service_count: int option;
  description: string option;
  type_: namespace_type option;
  name: string option;
  arn: string option;
  id: string option
}

type list_namespaces_response = {
  next_token: string option;
  namespaces: namespace_summary list option
}

type namespace_filter_name = | HTTP_NAME
  | NAME
  | TYPE

type namespace_filter = {
  condition: filter_condition option;
  values: string list;
  name: namespace_filter_name
}

type list_namespaces_request = {
  filters: namespace_filter list option;
  max_results: int option;
  next_token: string option
}

type instance_summary = {
  attributes: (string * string) list option;
  id: string option
}

type list_instances_response = {
  next_token: string option;
  instances: instance_summary list option
}

type list_instances_request = {
  max_results: int option;
  next_token: string option;
  service_id: string
}

type get_service_response = {
  service: service option
}

type get_service_request = {
  id: string
}

type operation_not_found = {
  message: string option
}

type operation_type = | DEREGISTER_INSTANCE
  | REGISTER_INSTANCE
  | UPDATE_SERVICE
  | UPDATE_NAMESPACE
  | DELETE_NAMESPACE
  | CREATE_NAMESPACE

type operation_target_type = | INSTANCE
  | SERVICE
  | NAMESPACE

type operation = {
  targets: (string * string) list option;
  update_date: float option;
  create_date: float option;
  error_code: string option;
  error_message: string option;
  status: operation_status option;
  type_: operation_type option;
  id: string option
}

type get_operation_response = {
  operation: operation option
}

type get_operation_request = {
  operation_id: string
}

type namespace = {
  creator_request_id: string option;
  create_date: float option;
  properties: namespace_properties option;
  service_count: int option;
  description: string option;
  type_: namespace_type option;
  name: string option;
  arn: string option;
  id: string option
}

type get_namespace_response = {
  namespace: namespace option
}

type get_namespace_request = {
  id: string
}

type health_status = | UNKNOWN
  | UNHEALTHY
  | HEALTHY

type get_instances_health_status_response = {
  next_token: string option;
  status: (string * health_status) list option
}

type get_instances_health_status_request = {
  next_token: string option;
  max_results: int option;
  instances: string list option;
  service_id: string
}

type instance = {
  attributes: (string * string) list option;
  creator_request_id: string option;
  id: string
}

type get_instance_response = {
  instance: instance option
}

type get_instance_request = {
  instance_id: string;
  service_id: string
}

type request_limit_exceeded = {
  message: string option
}

type discover_instances_revision_response = {
  instances_revision: int option
}

type discover_instances_revision_request = {
  service_name: string;
  namespace_name: string
}

type http_instance_summary = {
  attributes: (string * string) list option;
  health_status: health_status option;
  service_name: string option;
  namespace_name: string option;
  instance_id: string option
}

type discover_instances_response = {
  instances_revision: int option;
  instances: http_instance_summary list option
}

type health_status_filter = | HEALTHY_OR_ELSE_ALL
  | ALL
  | UNHEALTHY
  | HEALTHY

type discover_instances_request = {
  health_status: health_status_filter option;
  optional_parameters: (string * string) list option;
  query_parameters: (string * string) list option;
  max_results: int option;
  service_name: string;
  namespace_name: string
}

type deregister_instance_response = {
  operation_id: string option
}

type deregister_instance_request = {
  instance_id: string;
  service_id: string
}

type delete_service_response = unit

type delete_service_request = {
  id: string
}

type delete_namespace_response = {
  operation_id: string option
}

type delete_namespace_request = {
  id: string
}

type create_service_response = {
  service: service option
}

type create_service_request = {
  type_: service_type_option option;
  tags: tag list option;
  health_check_custom_config: health_check_custom_config option;
  health_check_config: health_check_config option;
  dns_config: dns_config option;
  description: string option;
  creator_request_id: string option;
  namespace_id: string option;
  name: string
}

type namespace_already_exists = {
  namespace_id: string option;
  creator_request_id: string option;
  message: string option
}

type create_public_dns_namespace_response = {
  operation_id: string option
}

type public_dns_properties_mutable = {
  so_a: so_a
}

type public_dns_namespace_properties = {
  dns_properties: public_dns_properties_mutable
}

type create_public_dns_namespace_request = {
  properties: public_dns_namespace_properties option;
  tags: tag list option;
  description: string option;
  creator_request_id: string option;
  name: string
}

type create_private_dns_namespace_response = {
  operation_id: string option
}

type private_dns_properties_mutable = {
  so_a: so_a
}

type private_dns_namespace_properties = {
  dns_properties: private_dns_properties_mutable
}

type create_private_dns_namespace_request = {
  properties: private_dns_namespace_properties option;
  tags: tag list option;
  vpc: string;
  description: string option;
  creator_request_id: string option;
  name: string
}

type create_http_namespace_response = {
  operation_id: string option
}

type create_http_namespace_request = {
  tags: tag list option;
  description: string option;
  creator_request_id: string option;
  name: string
}



type base_document = Json.t

val make_update_service_response :
  ?operation_id:string -> unit
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
  unit -> create_http_namespace_request

module UpdateService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_request ->
        (update_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module UpdatePublicDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_public_dns_namespace_request ->
        (update_public_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
end

module UpdatePrivateDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_private_dns_namespace_request ->
        (update_private_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
end

module UpdateInstanceCustomHealthStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      update_instance_custom_health_status_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CustomHealthNotFound of custom_health_not_found
            | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module UpdateHttpNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_http_namespace_request ->
        (update_http_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
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
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module RegisterInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      register_instance_request ->
        (register_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListServices : sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_request ->
        (list_services_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
end

module ListOperations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_operations_request ->
        (list_operations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
end

module ListNamespaces : sig
  val request :
    Smaws_Lib.Context.t ->
      list_namespaces_request ->
        (list_namespaces_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
end

module ListInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      list_instances_request ->
        (list_instances_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module GetService : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_request ->
        (get_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module GetOperation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operation_request ->
        (get_operation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `OperationNotFound of operation_not_found
            
        ]
      ) result
end

module GetNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      get_namespace_request ->
        (get_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            
        ]
      ) result
end

module GetInstancesHealthStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instances_health_status_request ->
        (get_instances_health_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module GetInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_request ->
        (get_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module DiscoverInstancesRevision : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_instances_revision_request ->
        (discover_instances_revision_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `RequestLimitExceeded of request_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module DiscoverInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_instances_request ->
        (discover_instances_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `RequestLimitExceeded of request_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module DeregisterInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_instance_request ->
        (deregister_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module DeleteService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_request ->
        (delete_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module DeleteNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_namespace_request ->
        (delete_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
end

module CreateService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_request ->
        (create_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `ServiceAlreadyExists of service_already_exists
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module CreatePublicDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_public_dns_namespace_request ->
        (create_public_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module CreatePrivateDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_private_dns_namespace_request ->
        (create_private_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module CreateHttpNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_http_namespace_request ->
        (create_http_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

