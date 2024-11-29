open Types
val make_vpc_ingress_connection_summary :
  ?service_arn:string -> ?vpc_ingress_connection_arn:string -> unit
-> vpc_ingress_connection_summary
(** Create a {!type-vpc_ingress_connection_summary} type *)

val make_ingress_vpc_configuration :
  ?vpc_endpoint_id:string -> ?vpc_id:string -> unit
-> ingress_vpc_configuration
(** Create a {!type-ingress_vpc_configuration} type *)

val make_vpc_ingress_connection :
  ?deleted_at:float ->
  ?created_at:float ->
  ?ingress_vpc_configuration:ingress_vpc_configuration ->
  ?domain_name:string ->
  ?account_id:string ->
  ?status:vpc_ingress_connection_status ->
  ?service_arn:string ->
  ?vpc_ingress_connection_name:string ->
  ?vpc_ingress_connection_arn:string ->
  unit
-> vpc_ingress_connection
(** Create a {!type-vpc_ingress_connection} type *)

val make_vpc_dns_target :
  ?domain_name:string ->
  ?vpc_id:string ->
  ?vpc_ingress_connection_arn:string ->
  unit
-> vpc_dns_target
(** Create a {!type-vpc_dns_target} type *)

val make_vpc_connector :
  ?deleted_at:float ->
  ?created_at:float ->
  ?status:vpc_connector_status ->
  ?security_groups:string list ->
  ?subnets:string list ->
  ?vpc_connector_revision:int ->
  ?vpc_connector_arn:string ->
  ?vpc_connector_name:string ->
  unit
-> vpc_connector
(** Create a {!type-vpc_connector} type *)

val make_update_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection -> unit
-> update_vpc_ingress_connection_response
(** Create a {!type-update_vpc_ingress_connection_response} type *)

val make_update_vpc_ingress_connection_request :
  ingress_vpc_configuration:ingress_vpc_configuration ->
  vpc_ingress_connection_arn:string ->
  unit
-> update_vpc_ingress_connection_request
(** Create a {!type-update_vpc_ingress_connection_request} type *)

val make_source_code_version :
  value:string -> type_:source_code_version_type -> unit
-> source_code_version
(** Create a {!type-source_code_version} type *)

val make_code_configuration_values :
  ?runtime_environment_secrets:(string * string) list ->
  ?runtime_environment_variables:(string * string) list ->
  ?port:string ->
  ?start_command:string ->
  ?build_command:string ->
  runtime:runtime ->
  unit
-> code_configuration_values
(** Create a {!type-code_configuration_values} type *)

val make_code_configuration :
  ?code_configuration_values:code_configuration_values ->
  configuration_source:configuration_source ->
  unit
-> code_configuration
(** Create a {!type-code_configuration} type *)

val make_code_repository :
  ?source_directory:string ->
  ?code_configuration:code_configuration ->
  source_code_version:source_code_version ->
  repository_url:string ->
  unit
-> code_repository
(** Create a {!type-code_repository} type *)

val make_image_configuration :
  ?runtime_environment_secrets:(string * string) list ->
  ?port:string ->
  ?start_command:string ->
  ?runtime_environment_variables:(string * string) list ->
  unit
-> image_configuration
(** Create a {!type-image_configuration} type *)

val make_image_repository :
  ?image_configuration:image_configuration ->
  image_repository_type:image_repository_type ->
  image_identifier:string ->
  unit
-> image_repository
(** Create a {!type-image_repository} type *)

val make_authentication_configuration :
  ?access_role_arn:string -> ?connection_arn:string -> unit
-> authentication_configuration
(** Create a {!type-authentication_configuration} type *)

val make_source_configuration :
  ?authentication_configuration:authentication_configuration ->
  ?auto_deployments_enabled:bool ->
  ?image_repository:image_repository ->
  ?code_repository:code_repository ->
  unit
-> source_configuration
(** Create a {!type-source_configuration} type *)

val make_instance_configuration :
  ?instance_role_arn:string -> ?memory:string -> ?cpu:string -> unit
-> instance_configuration
(** Create a {!type-instance_configuration} type *)

val make_encryption_configuration : kms_key:string -> unit
-> encryption_configuration
(** Create a {!type-encryption_configuration} type *)

val make_health_check_configuration :
  ?unhealthy_threshold:int ->
  ?healthy_threshold:int ->
  ?timeout:int ->
  ?interval:int ->
  ?path:string ->
  ?protocol:health_check_protocol ->
  unit
-> health_check_configuration
(** Create a {!type-health_check_configuration} type *)

val make_auto_scaling_configuration_summary :
  ?is_default:bool ->
  ?has_associated_service:bool ->
  ?created_at:float ->
  ?status:auto_scaling_configuration_status ->
  ?auto_scaling_configuration_revision:int ->
  ?auto_scaling_configuration_name:string ->
  ?auto_scaling_configuration_arn:string ->
  unit
-> auto_scaling_configuration_summary
(** Create a {!type-auto_scaling_configuration_summary} type *)

val make_egress_configuration :
  ?vpc_connector_arn:string -> ?egress_type:egress_type -> unit
-> egress_configuration
(** Create a {!type-egress_configuration} type *)

val make_ingress_configuration : ?is_publicly_accessible:bool -> unit
-> ingress_configuration
(** Create a {!type-ingress_configuration} type *)

val make_network_configuration :
  ?ip_address_type:ip_address_type ->
  ?ingress_configuration:ingress_configuration ->
  ?egress_configuration:egress_configuration ->
  unit
-> network_configuration
(** Create a {!type-network_configuration} type *)

val make_service_observability_configuration :
  ?observability_configuration_arn:string ->
  observability_enabled:bool ->
  unit
-> service_observability_configuration
(** Create a {!type-service_observability_configuration} type *)

val make_service :
  ?observability_configuration:service_observability_configuration ->
  ?health_check_configuration:health_check_configuration ->
  ?encryption_configuration:encryption_configuration ->
  ?deleted_at:float ->
  ?service_url:string ->
  network_configuration:network_configuration ->
  auto_scaling_configuration_summary:auto_scaling_configuration_summary ->
  instance_configuration:instance_configuration ->
  source_configuration:source_configuration ->
  status:service_status ->
  updated_at:float ->
  created_at:float ->
  service_arn:string ->
  service_id:string ->
  service_name:string ->
  unit
-> service
(** Create a {!type-service} type *)

val make_update_service_response :
  operation_id:string -> service:service -> unit
-> update_service_response
(** Create a {!type-update_service_response} type *)

val make_update_service_request :
  ?observability_configuration:service_observability_configuration ->
  ?network_configuration:network_configuration ->
  ?health_check_configuration:health_check_configuration ->
  ?auto_scaling_configuration_arn:string ->
  ?instance_configuration:instance_configuration ->
  ?source_configuration:source_configuration ->
  service_arn:string ->
  unit
-> update_service_request
(** Create a {!type-update_service_request} type *)

val make_auto_scaling_configuration :
  ?is_default:bool ->
  ?has_associated_service:bool ->
  ?deleted_at:float ->
  ?created_at:float ->
  ?max_size:int ->
  ?min_size:int ->
  ?max_concurrency:int ->
  ?status:auto_scaling_configuration_status ->
  ?latest:bool ->
  ?auto_scaling_configuration_revision:int ->
  ?auto_scaling_configuration_name:string ->
  ?auto_scaling_configuration_arn:string ->
  unit
-> auto_scaling_configuration
(** Create a {!type-auto_scaling_configuration} type *)

val make_update_default_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration -> unit
-> update_default_auto_scaling_configuration_response
(** Create a {!type-update_default_auto_scaling_configuration_response} type *)

val make_update_default_auto_scaling_configuration_request :
  auto_scaling_configuration_arn:string -> unit
-> update_default_auto_scaling_configuration_request
(** Create a {!type-update_default_auto_scaling_configuration_request} type *)

val make_untag_resource_response : unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_trace_configuration : vendor:tracing_vendor -> unit
-> trace_configuration
(** Create a {!type-trace_configuration} type *)

val make_tag_resource_response : unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag : ?value:string -> ?key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_request : tags:tag list -> resource_arn:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_start_deployment_response : operation_id:string -> unit
-> start_deployment_response
(** Create a {!type-start_deployment_response} type *)

val make_start_deployment_request : service_arn:string -> unit
-> start_deployment_request
(** Create a {!type-start_deployment_request} type *)

val make_service_summary :
  ?status:service_status ->
  ?updated_at:float ->
  ?created_at:float ->
  ?service_url:string ->
  ?service_arn:string ->
  ?service_id:string ->
  ?service_name:string ->
  unit
-> service_summary
(** Create a {!type-service_summary} type *)

val make_resume_service_response :
  ?operation_id:string -> service:service -> unit
-> resume_service_response
(** Create a {!type-resume_service_response} type *)

val make_resume_service_request : service_arn:string -> unit
-> resume_service_request
(** Create a {!type-resume_service_request} type *)

val make_pause_service_response :
  ?operation_id:string -> service:service -> unit
-> pause_service_response
(** Create a {!type-pause_service_response} type *)

val make_pause_service_request : service_arn:string -> unit
-> pause_service_request
(** Create a {!type-pause_service_request} type *)

val make_operation_summary :
  ?updated_at:float ->
  ?ended_at:float ->
  ?started_at:float ->
  ?target_arn:string ->
  ?status:operation_status ->
  ?type_:operation_type ->
  ?id:string ->
  unit
-> operation_summary
(** Create a {!type-operation_summary} type *)

val make_observability_configuration_summary :
  ?observability_configuration_revision:int ->
  ?observability_configuration_name:string ->
  ?observability_configuration_arn:string ->
  unit
-> observability_configuration_summary
(** Create a {!type-observability_configuration_summary} type *)

val make_observability_configuration :
  ?deleted_at:float ->
  ?created_at:float ->
  ?status:observability_configuration_status ->
  ?latest:bool ->
  ?observability_configuration_revision:int ->
  ?trace_configuration:trace_configuration ->
  ?observability_configuration_name:string ->
  ?observability_configuration_arn:string ->
  unit
-> observability_configuration
(** Create a {!type-observability_configuration} type *)

val make_list_vpc_ingress_connections_response :
  ?next_token:string ->
  vpc_ingress_connection_summary_list:vpc_ingress_connection_summary list ->
  unit
-> list_vpc_ingress_connections_response
(** Create a {!type-list_vpc_ingress_connections_response} type *)

val make_list_vpc_ingress_connections_filter :
  ?vpc_endpoint_id:string -> ?service_arn:string -> unit
-> list_vpc_ingress_connections_filter
(** Create a {!type-list_vpc_ingress_connections_filter} type *)

val make_list_vpc_ingress_connections_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filter:list_vpc_ingress_connections_filter ->
  unit
-> list_vpc_ingress_connections_request
(** Create a {!type-list_vpc_ingress_connections_request} type *)

val make_list_vpc_connectors_response :
  ?next_token:string -> vpc_connectors:vpc_connector list -> unit
-> list_vpc_connectors_response
(** Create a {!type-list_vpc_connectors_response} type *)

val make_list_vpc_connectors_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_vpc_connectors_request
(** Create a {!type-list_vpc_connectors_request} type *)

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request : resource_arn:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_list_services_response :
  ?next_token:string -> service_summary_list:service_summary list -> unit
-> list_services_response
(** Create a {!type-list_services_response} type *)

val make_list_services_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_services_request
(** Create a {!type-list_services_request} type *)

val make_list_services_for_auto_scaling_configuration_response :
  ?next_token:string -> service_arn_list:string list -> unit
-> list_services_for_auto_scaling_configuration_response
(** Create a {!type-list_services_for_auto_scaling_configuration_response} type *)

val make_list_services_for_auto_scaling_configuration_request :
  ?next_token:string ->
  ?max_results:int ->
  auto_scaling_configuration_arn:string ->
  unit
-> list_services_for_auto_scaling_configuration_request
(** Create a {!type-list_services_for_auto_scaling_configuration_request} type *)

val make_list_operations_response :
  ?next_token:string ->
  ?operation_summary_list:operation_summary list ->
  unit
-> list_operations_response
(** Create a {!type-list_operations_response} type *)

val make_list_operations_request :
  ?max_results:int -> ?next_token:string -> service_arn:string -> unit
-> list_operations_request
(** Create a {!type-list_operations_request} type *)

val make_list_observability_configurations_response :
  ?next_token:string ->
  observability_configuration_summary_list:observability_configuration_summary list ->
  unit
-> list_observability_configurations_response
(** Create a {!type-list_observability_configurations_response} type *)

val make_list_observability_configurations_request :
  ?next_token:string ->
  ?max_results:int ->
  ?latest_only:bool ->
  ?observability_configuration_name:string ->
  unit
-> list_observability_configurations_request
(** Create a {!type-list_observability_configurations_request} type *)

val make_connection_summary :
  ?created_at:float ->
  ?status:connection_status ->
  ?provider_type:provider_type ->
  ?connection_arn:string ->
  ?connection_name:string ->
  unit
-> connection_summary
(** Create a {!type-connection_summary} type *)

val make_list_connections_response :
  ?next_token:string ->
  connection_summary_list:connection_summary list ->
  unit
-> list_connections_response
(** Create a {!type-list_connections_response} type *)

val make_list_connections_request :
  ?next_token:string -> ?max_results:int -> ?connection_name:string -> unit
-> list_connections_request
(** Create a {!type-list_connections_request} type *)

val make_list_auto_scaling_configurations_response :
  ?next_token:string ->
  auto_scaling_configuration_summary_list:auto_scaling_configuration_summary list ->
  unit
-> list_auto_scaling_configurations_response
(** Create a {!type-list_auto_scaling_configurations_response} type *)

val make_list_auto_scaling_configurations_request :
  ?next_token:string ->
  ?max_results:int ->
  ?latest_only:bool ->
  ?auto_scaling_configuration_name:string ->
  unit
-> list_auto_scaling_configurations_request
(** Create a {!type-list_auto_scaling_configurations_request} type *)

val make_certificate_validation_record :
  ?status:certificate_validation_record_status ->
  ?value:string ->
  ?type_:string ->
  ?name:string ->
  unit
-> certificate_validation_record
(** Create a {!type-certificate_validation_record} type *)

val make_custom_domain :
  ?certificate_validation_records:certificate_validation_record list ->
  status:custom_domain_association_status ->
  enable_www_subdomain:bool ->
  domain_name:string ->
  unit
-> custom_domain
(** Create a {!type-custom_domain} type *)

val make_disassociate_custom_domain_response :
  vpc_dns_targets:vpc_dns_target list ->
  custom_domain:custom_domain ->
  service_arn:string ->
  dns_target:string ->
  unit
-> disassociate_custom_domain_response
(** Create a {!type-disassociate_custom_domain_response} type *)

val make_disassociate_custom_domain_request :
  domain_name:string -> service_arn:string -> unit
-> disassociate_custom_domain_request
(** Create a {!type-disassociate_custom_domain_request} type *)

val make_describe_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection -> unit
-> describe_vpc_ingress_connection_response
(** Create a {!type-describe_vpc_ingress_connection_response} type *)

val make_describe_vpc_ingress_connection_request :
  vpc_ingress_connection_arn:string -> unit
-> describe_vpc_ingress_connection_request
(** Create a {!type-describe_vpc_ingress_connection_request} type *)

val make_describe_vpc_connector_response :
  vpc_connector:vpc_connector -> unit
-> describe_vpc_connector_response
(** Create a {!type-describe_vpc_connector_response} type *)

val make_describe_vpc_connector_request : vpc_connector_arn:string -> unit
-> describe_vpc_connector_request
(** Create a {!type-describe_vpc_connector_request} type *)

val make_describe_service_response : service:service -> unit
-> describe_service_response
(** Create a {!type-describe_service_response} type *)

val make_describe_service_request : service_arn:string -> unit
-> describe_service_request
(** Create a {!type-describe_service_request} type *)

val make_describe_observability_configuration_response :
  observability_configuration:observability_configuration -> unit
-> describe_observability_configuration_response
(** Create a {!type-describe_observability_configuration_response} type *)

val make_describe_observability_configuration_request :
  observability_configuration_arn:string -> unit
-> describe_observability_configuration_request
(** Create a {!type-describe_observability_configuration_request} type *)

val make_describe_custom_domains_response :
  ?next_token:string ->
  vpc_dns_targets:vpc_dns_target list ->
  custom_domains:custom_domain list ->
  service_arn:string ->
  dns_target:string ->
  unit
-> describe_custom_domains_response
(** Create a {!type-describe_custom_domains_response} type *)

val make_describe_custom_domains_request :
  ?max_results:int -> ?next_token:string -> service_arn:string -> unit
-> describe_custom_domains_request
(** Create a {!type-describe_custom_domains_request} type *)

val make_describe_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration -> unit
-> describe_auto_scaling_configuration_response
(** Create a {!type-describe_auto_scaling_configuration_response} type *)

val make_describe_auto_scaling_configuration_request :
  auto_scaling_configuration_arn:string -> unit
-> describe_auto_scaling_configuration_request
(** Create a {!type-describe_auto_scaling_configuration_request} type *)

val make_delete_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection -> unit
-> delete_vpc_ingress_connection_response
(** Create a {!type-delete_vpc_ingress_connection_response} type *)

val make_delete_vpc_ingress_connection_request :
  vpc_ingress_connection_arn:string -> unit
-> delete_vpc_ingress_connection_request
(** Create a {!type-delete_vpc_ingress_connection_request} type *)

val make_delete_vpc_connector_response : vpc_connector:vpc_connector -> unit
-> delete_vpc_connector_response
(** Create a {!type-delete_vpc_connector_response} type *)

val make_delete_vpc_connector_request : vpc_connector_arn:string -> unit
-> delete_vpc_connector_request
(** Create a {!type-delete_vpc_connector_request} type *)

val make_delete_service_response :
  operation_id:string -> service:service -> unit
-> delete_service_response
(** Create a {!type-delete_service_response} type *)

val make_delete_service_request : service_arn:string -> unit
-> delete_service_request
(** Create a {!type-delete_service_request} type *)

val make_delete_observability_configuration_response :
  observability_configuration:observability_configuration -> unit
-> delete_observability_configuration_response
(** Create a {!type-delete_observability_configuration_response} type *)

val make_delete_observability_configuration_request :
  observability_configuration_arn:string -> unit
-> delete_observability_configuration_request
(** Create a {!type-delete_observability_configuration_request} type *)

val make_connection :
  ?created_at:float ->
  ?status:connection_status ->
  ?provider_type:provider_type ->
  ?connection_arn:string ->
  ?connection_name:string ->
  unit
-> connection
(** Create a {!type-connection} type *)

val make_delete_connection_response : ?connection:connection -> unit
-> delete_connection_response
(** Create a {!type-delete_connection_response} type *)

val make_delete_connection_request : connection_arn:string -> unit
-> delete_connection_request
(** Create a {!type-delete_connection_request} type *)

val make_delete_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration -> unit
-> delete_auto_scaling_configuration_response
(** Create a {!type-delete_auto_scaling_configuration_response} type *)

val make_delete_auto_scaling_configuration_request :
  ?delete_all_revisions:bool -> auto_scaling_configuration_arn:string -> unit
-> delete_auto_scaling_configuration_request
(** Create a {!type-delete_auto_scaling_configuration_request} type *)

val make_create_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection -> unit
-> create_vpc_ingress_connection_response
(** Create a {!type-create_vpc_ingress_connection_response} type *)

val make_create_vpc_ingress_connection_request :
  ?tags:tag list ->
  ingress_vpc_configuration:ingress_vpc_configuration ->
  vpc_ingress_connection_name:string ->
  service_arn:string ->
  unit
-> create_vpc_ingress_connection_request
(** Create a {!type-create_vpc_ingress_connection_request} type *)

val make_create_vpc_connector_response : vpc_connector:vpc_connector -> unit
-> create_vpc_connector_response
(** Create a {!type-create_vpc_connector_response} type *)

val make_create_vpc_connector_request :
  ?tags:tag list ->
  ?security_groups:string list ->
  subnets:string list ->
  vpc_connector_name:string ->
  unit
-> create_vpc_connector_request
(** Create a {!type-create_vpc_connector_request} type *)

val make_create_service_response :
  operation_id:string -> service:service -> unit
-> create_service_response
(** Create a {!type-create_service_response} type *)

val make_create_service_request :
  ?observability_configuration:service_observability_configuration ->
  ?network_configuration:network_configuration ->
  ?auto_scaling_configuration_arn:string ->
  ?health_check_configuration:health_check_configuration ->
  ?encryption_configuration:encryption_configuration ->
  ?tags:tag list ->
  ?instance_configuration:instance_configuration ->
  source_configuration:source_configuration ->
  service_name:string ->
  unit
-> create_service_request
(** Create a {!type-create_service_request} type *)

val make_create_observability_configuration_response :
  observability_configuration:observability_configuration -> unit
-> create_observability_configuration_response
(** Create a {!type-create_observability_configuration_response} type *)

val make_create_observability_configuration_request :
  ?tags:tag list ->
  ?trace_configuration:trace_configuration ->
  observability_configuration_name:string ->
  unit
-> create_observability_configuration_request
(** Create a {!type-create_observability_configuration_request} type *)

val make_create_connection_response : connection:connection -> unit
-> create_connection_response
(** Create a {!type-create_connection_response} type *)

val make_create_connection_request :
  ?tags:tag list ->
  provider_type:provider_type ->
  connection_name:string ->
  unit
-> create_connection_request
(** Create a {!type-create_connection_request} type *)

val make_create_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration -> unit
-> create_auto_scaling_configuration_response
(** Create a {!type-create_auto_scaling_configuration_response} type *)

val make_create_auto_scaling_configuration_request :
  ?tags:tag list ->
  ?max_size:int ->
  ?min_size:int ->
  ?max_concurrency:int ->
  auto_scaling_configuration_name:string ->
  unit
-> create_auto_scaling_configuration_request
(** Create a {!type-create_auto_scaling_configuration_request} type *)

val make_associate_custom_domain_response :
  vpc_dns_targets:vpc_dns_target list ->
  custom_domain:custom_domain ->
  service_arn:string ->
  dns_target:string ->
  unit
-> associate_custom_domain_response
(** Create a {!type-associate_custom_domain_response} type *)

val make_associate_custom_domain_request :
  ?enable_www_subdomain:bool ->
  domain_name:string ->
  service_arn:string ->
  unit
-> associate_custom_domain_request
(** Create a {!type-associate_custom_domain_request} type *)

