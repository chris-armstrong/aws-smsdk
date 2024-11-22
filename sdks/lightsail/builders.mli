open Types
val make_setup_request :
  ?certificate_provider:certificate_provider ->
  ?domain_names:string list ->
  ?instance_name:string ->
  unit -> setup_request

val make_resource_location :
  ?region_name:region_name -> ?availability_zone:string -> unit
-> resource_location

val make_setup_history_resource :
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?arn:string ->
  ?name:string ->
  unit -> setup_history_resource

val make_setup_execution_details :
  ?version:string ->
  ?standard_output:string ->
  ?standard_error:string ->
  ?status:setup_status ->
  ?name:string ->
  ?date_time:float ->
  ?command:string ->
  unit -> setup_execution_details

val make_setup_history :
  ?status:setup_status ->
  ?execution_details:setup_execution_details list ->
  ?resource:setup_history_resource ->
  ?request:setup_request ->
  ?operation_id:string ->
  unit -> setup_history

val make_operation :
  ?error_details:string ->
  ?error_code:string ->
  ?status_changed_at:float ->
  ?status:operation_status ->
  ?operation_type:operation_type ->
  ?operation_details:string ->
  ?is_terminal:bool ->
  ?location:resource_location ->
  ?created_at:float ->
  ?resource_type:resource_type ->
  ?resource_name:string ->
  ?id:string ->
  unit -> operation

val make_update_relational_database_result :
  ?operations:operation list -> unit
-> update_relational_database_result

val make_update_relational_database_request :
  ?relational_database_blueprint_id:string ->
  ?ca_certificate_identifier:string ->
  ?apply_immediately:bool ->
  ?publicly_accessible:bool ->
  ?disable_backup_retention:bool ->
  ?enable_backup_retention:bool ->
  ?preferred_maintenance_window:string ->
  ?preferred_backup_window:string ->
  ?rotate_master_user_password:bool ->
  ?master_user_password:string ->
  relational_database_name:string ->
  unit
-> update_relational_database_request

val make_update_relational_database_parameters_result :
  ?operations:operation list -> unit
-> update_relational_database_parameters_result

val make_relational_database_parameter :
  ?parameter_value:string ->
  ?parameter_name:string ->
  ?is_modifiable:bool ->
  ?description:string ->
  ?data_type:string ->
  ?apply_type:string ->
  ?apply_method:string ->
  ?allowed_values:string ->
  unit
-> relational_database_parameter

val make_update_relational_database_parameters_request :
  parameters:relational_database_parameter list ->
  relational_database_name:string ->
  unit
-> update_relational_database_parameters_request

val make_update_load_balancer_attribute_result :
  ?operations:operation list -> unit
-> update_load_balancer_attribute_result

val make_update_load_balancer_attribute_request :
  attribute_value:string ->
  attribute_name:load_balancer_attribute_name ->
  load_balancer_name:string ->
  unit
-> update_load_balancer_attribute_request

val make_update_instance_metadata_options_result :
  ?operation:operation -> unit
-> update_instance_metadata_options_result

val make_update_instance_metadata_options_request :
  ?http_protocol_ipv6:http_protocol_ipv6 ->
  ?http_put_response_hop_limit:int ->
  ?http_endpoint:http_endpoint ->
  ?http_tokens:http_tokens ->
  instance_name:string ->
  unit
-> update_instance_metadata_options_request

val make_update_domain_entry_result : ?operations:operation list -> unit
-> update_domain_entry_result

val make_domain_entry :
  ?options:(string * string) list ->
  ?type_:string ->
  ?is_alias:bool ->
  ?target:string ->
  ?name:string ->
  ?id:string ->
  unit -> domain_entry

val make_update_domain_entry_request :
  domain_entry:domain_entry -> domain_name:string -> unit
-> update_domain_entry_request

val make_update_distribution_result : ?operation:operation -> unit
-> update_distribution_result

val make_input_origin :
  ?response_timeout:int ->
  ?protocol_policy:origin_protocol_policy_enum ->
  ?region_name:region_name ->
  ?name:string ->
  unit -> input_origin

val make_cache_behavior : ?behavior:behavior_enum -> unit
-> cache_behavior

val make_cookie_object :
  ?cookies_allow_list:string list -> ?option_:forward_values -> unit
-> cookie_object

val make_header_object :
  ?headers_allow_list:header_enum list -> ?option_:forward_values -> unit
-> header_object

val make_query_string_object :
  ?query_strings_allow_list:string list -> ?option_:bool -> unit
-> query_string_object

val make_cache_settings :
  ?forwarded_query_strings:query_string_object ->
  ?forwarded_headers:header_object ->
  ?forwarded_cookies:cookie_object ->
  ?cached_http_methods:string ->
  ?allowed_http_methods:string ->
  ?maximum_tt_l:int ->
  ?minimum_tt_l:int ->
  ?default_tt_l:int ->
  unit -> cache_settings

val make_cache_behavior_per_path :
  ?behavior:behavior_enum -> ?path:string -> unit
-> cache_behavior_per_path

val make_update_distribution_request :
  ?use_default_certificate:bool ->
  ?certificate_name:string ->
  ?viewer_minimum_tls_protocol_version:viewer_minimum_tls_protocol_version_enum ->
  ?is_enabled:bool ->
  ?cache_behaviors:cache_behavior_per_path list ->
  ?cache_behavior_settings:cache_settings ->
  ?default_cache_behavior:cache_behavior ->
  ?origin:input_origin ->
  distribution_name:string ->
  unit
-> update_distribution_request

val make_update_distribution_bundle_result : ?operation:operation -> unit
-> update_distribution_bundle_result

val make_update_distribution_bundle_request :
  ?bundle_id:string -> ?distribution_name:string -> unit
-> update_distribution_bundle_request

val make_tag : ?value:string -> ?key:string -> unit
-> tag

val make_container_service_state_detail :
  ?message:string -> ?code:container_service_state_detail_code -> unit
-> container_service_state_detail

val make_container :
  ?ports:(string * container_service_protocol) list ->
  ?environment:(string * string) list ->
  ?command:string list ->
  ?image:string ->
  unit -> container

val make_container_service_health_check_config :
  ?success_codes:string ->
  ?path:string ->
  ?interval_seconds:int ->
  ?timeout_seconds:int ->
  ?unhealthy_threshold:int ->
  ?healthy_threshold:int ->
  unit
-> container_service_health_check_config

val make_container_service_endpoint :
  ?health_check:container_service_health_check_config ->
  ?container_port:int ->
  ?container_name:string ->
  unit -> container_service_endpoint

val make_container_service_deployment :
  ?created_at:float ->
  ?public_endpoint:container_service_endpoint ->
  ?containers:(string * container) list ->
  ?state:container_service_deployment_state ->
  ?version:int ->
  unit
-> container_service_deployment

val make_container_service_ecr_image_puller_role :
  ?principal_arn:string -> ?is_active:bool -> unit
-> container_service_ecr_image_puller_role

val make_private_registry_access :
  ?ecr_image_puller_role:container_service_ecr_image_puller_role -> unit
-> private_registry_access

val make_container_service :
  ?private_registry_access:private_registry_access ->
  ?url:string ->
  ?public_domain_names:(string * string list) list ->
  ?private_domain_name:string ->
  ?principal_arn:string ->
  ?is_disabled:bool ->
  ?next_deployment:container_service_deployment ->
  ?current_deployment:container_service_deployment ->
  ?scale:int ->
  ?state_detail:container_service_state_detail ->
  ?state:container_service_state ->
  ?power_id:string ->
  ?power:container_service_power_name ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?arn:string ->
  ?container_service_name:string ->
  unit -> container_service

val make_update_container_service_result :
  ?container_service:container_service -> unit
-> update_container_service_result

val make_container_service_ecr_image_puller_role_request :
  ?is_active:bool -> unit
-> container_service_ecr_image_puller_role_request

val make_private_registry_access_request :
  ?ecr_image_puller_role:container_service_ecr_image_puller_role_request ->
  unit
-> private_registry_access_request

val make_update_container_service_request :
  ?private_registry_access:private_registry_access_request ->
  ?public_domain_names:(string * string list) list ->
  ?is_disabled:bool ->
  ?scale:int ->
  ?power:container_service_power_name ->
  service_name:string ->
  unit -> update_container_service_request

val make_access_rules :
  ?allow_public_overrides:bool -> ?get_object:access_type -> unit
-> access_rules

val make_resource_receiving_access :
  ?resource_type:string -> ?name:string -> unit
-> resource_receiving_access

val make_bucket_state : ?message:string -> ?code:string -> unit
-> bucket_state

val make_bucket_access_log_config :
  ?prefix:string -> ?destination:string -> enabled:bool -> unit
-> bucket_access_log_config

val make_bucket :
  ?access_log_config:bucket_access_log_config ->
  ?state:bucket_state ->
  ?resources_receiving_access:resource_receiving_access list ->
  ?readonly_access_accounts:string list ->
  ?able_to_update_bundle:bool ->
  ?object_versioning:string ->
  ?tags:tag list ->
  ?support_code:string ->
  ?name:string ->
  ?location:resource_location ->
  ?url:string ->
  ?created_at:float ->
  ?bundle_id:string ->
  ?arn:string ->
  ?access_rules:access_rules ->
  ?resource_type:string ->
  unit -> bucket

val make_update_bucket_result :
  ?operations:operation list -> ?bucket:bucket -> unit
-> update_bucket_result

val make_update_bucket_request :
  ?access_log_config:bucket_access_log_config ->
  ?readonly_access_accounts:string list ->
  ?versioning:string ->
  ?access_rules:access_rules ->
  bucket_name:string ->
  unit -> update_bucket_request

val make_update_bucket_bundle_result : ?operations:operation list -> unit
-> update_bucket_bundle_result

val make_update_bucket_bundle_request :
  bundle_id:string -> bucket_name:string -> unit
-> update_bucket_bundle_request

val make_untag_resource_result : ?operations:operation list -> unit
-> untag_resource_result

val make_untag_resource_request :
  ?resource_arn:string ->
  tag_keys:string list ->
  resource_name:string ->
  unit -> untag_resource_request

val make_unpeer_vpc_result : ?operation:operation -> unit
-> unpeer_vpc_result

val make_unpeer_vpc_request : unit
-> unpeer_vpc_request

val make_time_period : ?end_:float -> ?start:float -> unit
-> time_period

val make_test_alarm_result : ?operations:operation list -> unit
-> test_alarm_result

val make_test_alarm_request : state:alarm_state -> alarm_name:string -> unit
-> test_alarm_request

val make_tag_resource_result : ?operations:operation list -> unit
-> tag_resource_result

val make_tag_resource_request :
  ?resource_arn:string -> tags:tag list -> resource_name:string -> unit
-> tag_resource_request

val make_stop_relational_database_result : ?operations:operation list -> unit
-> stop_relational_database_result

val make_stop_relational_database_request :
  ?relational_database_snapshot_name:string ->
  relational_database_name:string ->
  unit -> stop_relational_database_request

val make_stop_instance_result : ?operations:operation list -> unit
-> stop_instance_result

val make_stop_instance_request : ?force:bool -> instance_name:string -> unit
-> stop_instance_request

val make_stop_instance_on_idle_request :
  ?duration:string -> ?threshold:string -> unit
-> stop_instance_on_idle_request

val make_stop_gui_session_result : ?operations:operation list -> unit
-> stop_gui_session_result

val make_stop_gui_session_request : resource_name:string -> unit
-> stop_gui_session_request

val make_static_ip :
  ?is_attached:bool ->
  ?attached_to:string ->
  ?ip_address:string ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> static_ip

val make_start_relational_database_result :
  ?operations:operation list -> unit
-> start_relational_database_result

val make_start_relational_database_request :
  relational_database_name:string -> unit
-> start_relational_database_request

val make_start_instance_result : ?operations:operation list -> unit
-> start_instance_result

val make_start_instance_request : instance_name:string -> unit
-> start_instance_request

val make_start_gui_session_result : ?operations:operation list -> unit
-> start_gui_session_result

val make_start_gui_session_request : resource_name:string -> unit
-> start_gui_session_request

val make_setup_instance_https_result : ?operations:operation list -> unit
-> setup_instance_https_result

val make_setup_instance_https_request :
  certificate_provider:certificate_provider ->
  domain_names:string list ->
  email_address:string ->
  instance_name:string ->
  unit
-> setup_instance_https_request

val make_set_resource_access_for_bucket_result :
  ?operations:operation list -> unit
-> set_resource_access_for_bucket_result

val make_set_resource_access_for_bucket_request :
  access:resource_bucket_access ->
  bucket_name:string ->
  resource_name:string ->
  unit
-> set_resource_access_for_bucket_request

val make_set_ip_address_type_result : ?operations:operation list -> unit
-> set_ip_address_type_result

val make_set_ip_address_type_request :
  ?accept_bundle_update:bool ->
  ip_address_type:ip_address_type ->
  resource_name:string ->
  resource_type:resource_type ->
  unit -> set_ip_address_type_request

val make_session : ?is_primary:bool -> ?url:string -> ?name:string -> unit
-> session

val make_send_contact_method_verification_result :
  ?operations:operation list -> unit
-> send_contact_method_verification_result

val make_send_contact_method_verification_request :
  protocol:contact_method_verification_protocol -> unit
-> send_contact_method_verification_request

val make_estimate_by_time :
  ?time_period:time_period ->
  ?currency:currency ->
  ?unit_:float ->
  ?pricing_unit:pricing_unit ->
  ?usage_cost:float ->
  unit -> estimate_by_time

val make_cost_estimate :
  ?results_by_time:estimate_by_time list -> ?usage_type:string -> unit
-> cost_estimate

val make_resource_budget_estimate :
  ?end_time:float ->
  ?start_time:float ->
  ?cost_estimates:cost_estimate list ->
  ?resource_type:resource_type ->
  ?resource_name:string ->
  unit -> resource_budget_estimate

val make_resource_record :
  ?value:string -> ?type_:string -> ?name:string -> unit
-> resource_record

val make_reset_distribution_cache_result :
  ?operation:operation -> ?create_time:float -> ?status:string -> unit
-> reset_distribution_cache_result

val make_reset_distribution_cache_request : ?distribution_name:string -> unit
-> reset_distribution_cache_request

val make_dns_record_creation_state :
  ?message:string -> ?code:dns_record_creation_state_code -> unit
-> dns_record_creation_state

val make_domain_validation_record :
  ?validation_status:certificate_domain_validation_status ->
  ?dns_record_creation_state:dns_record_creation_state ->
  ?resource_record:resource_record ->
  ?domain_name:string ->
  unit -> domain_validation_record

val make_renewal_summary :
  ?updated_at:float ->
  ?renewal_status_reason:string ->
  ?renewal_status:renewal_status ->
  ?domain_validation_records:domain_validation_record list ->
  unit -> renewal_summary

val make_release_static_ip_result : ?operations:operation list -> unit
-> release_static_ip_result

val make_release_static_ip_request : static_ip_name:string -> unit
-> release_static_ip_request

val make_relational_database_snapshot :
  ?from_relational_database_blueprint_id:string ->
  ?from_relational_database_bundle_id:string ->
  ?from_relational_database_arn:string ->
  ?from_relational_database_name:string ->
  ?state:string ->
  ?size_in_gb:int ->
  ?engine_version:string ->
  ?engine:string ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> relational_database_snapshot

val make_relational_database_hardware :
  ?ram_size_in_gb:float -> ?disk_size_in_gb:int -> ?cpu_count:int -> unit
-> relational_database_hardware

val make_pending_modified_relational_database_values :
  ?backup_retention_enabled:bool ->
  ?engine_version:string ->
  ?master_user_password:string ->
  unit
-> pending_modified_relational_database_values

val make_relational_database_endpoint : ?address:string -> ?port:int -> unit
-> relational_database_endpoint

val make_pending_maintenance_action :
  ?current_apply_date:float -> ?description:string -> ?action:string -> unit
-> pending_maintenance_action

val make_relational_database :
  ?ca_certificate_identifier:string ->
  ?pending_maintenance_actions:pending_maintenance_action list ->
  ?master_endpoint:relational_database_endpoint ->
  ?publicly_accessible:bool ->
  ?preferred_maintenance_window:string ->
  ?preferred_backup_window:string ->
  ?parameter_apply_status:string ->
  ?master_username:string ->
  ?latest_restorable_time:float ->
  ?engine_version:string ->
  ?engine:string ->
  ?pending_modified_values:pending_modified_relational_database_values ->
  ?backup_retention_enabled:bool ->
  ?secondary_availability_zone:string ->
  ?state:string ->
  ?hardware:relational_database_hardware ->
  ?master_database_name:string ->
  ?relational_database_bundle_id:string ->
  ?relational_database_blueprint_id:string ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> relational_database

val make_relational_database_event :
  ?event_categories:string list ->
  ?message:string ->
  ?created_at:float ->
  ?resource:string ->
  unit -> relational_database_event

val make_relational_database_bundle :
  ?is_active:bool ->
  ?is_encrypted:bool ->
  ?cpu_count:int ->
  ?transfer_per_month_in_gb:int ->
  ?disk_size_in_gb:int ->
  ?ram_size_in_gb:float ->
  ?price:float ->
  ?name:string ->
  ?bundle_id:string ->
  unit -> relational_database_bundle

val make_relational_database_blueprint :
  ?is_engine_default:bool ->
  ?engine_version_description:string ->
  ?engine_description:string ->
  ?engine_version:string ->
  ?engine:relational_database_engine ->
  ?blueprint_id:string ->
  unit -> relational_database_blueprint

val make_name_servers_update_state :
  ?message:string -> ?code:name_servers_update_state_code -> unit
-> name_servers_update_state

val make_r53_hosted_zone_deletion_state :
  ?message:string -> ?code:r53_hosted_zone_deletion_state_code -> unit
-> r53_hosted_zone_deletion_state

val make_registered_domain_delegation_info :
  ?r53_hosted_zone_deletion_state:r53_hosted_zone_deletion_state ->
  ?name_servers_update_state:name_servers_update_state ->
  unit -> registered_domain_delegation_info

val make_container_image :
  ?created_at:float -> ?digest:string -> ?image:string -> unit
-> container_image

val make_register_container_image_result :
  ?container_image:container_image -> unit
-> register_container_image_result

val make_register_container_image_request :
  digest:string -> label:string -> service_name:string -> unit
-> register_container_image_request

val make_availability_zone : ?state:string -> ?zone_name:string -> unit
-> availability_zone

val make_region :
  ?relational_database_availability_zones:availability_zone list ->
  ?availability_zones:availability_zone list ->
  ?name:region_name ->
  ?display_name:string ->
  ?description:string ->
  ?continent_code:string ->
  unit -> region

val make_reboot_relational_database_result :
  ?operations:operation list -> unit
-> reboot_relational_database_result

val make_reboot_relational_database_request :
  relational_database_name:string -> unit
-> reboot_relational_database_request

val make_reboot_instance_result : ?operations:operation list -> unit
-> reboot_instance_result

val make_reboot_instance_request : instance_name:string -> unit
-> reboot_instance_request

val make_put_instance_public_ports_result : ?operation:operation -> unit
-> put_instance_public_ports_result

val make_port_info :
  ?cidr_list_aliases:string list ->
  ?ipv6_cidrs:string list ->
  ?cidrs:string list ->
  ?protocol:network_protocol ->
  ?to_port:int ->
  ?from_port:int ->
  unit -> port_info

val make_put_instance_public_ports_request :
  instance_name:string -> port_infos:port_info list -> unit
-> put_instance_public_ports_request

val make_put_alarm_result : ?operations:operation list -> unit
-> put_alarm_result

val make_put_alarm_request :
  ?notification_enabled:bool ->
  ?notification_triggers:alarm_state list ->
  ?contact_protocols:contact_protocol list ->
  ?treat_missing_data:treat_missing_data ->
  ?datapoints_to_alarm:int ->
  evaluation_periods:int ->
  threshold:float ->
  comparison_operator:comparison_operator ->
  monitored_resource_name:string ->
  metric_name:metric_name ->
  alarm_name:string ->
  unit -> put_alarm_request

val make_peer_vpc_result : ?operation:operation -> unit
-> peer_vpc_result

val make_peer_vpc_request : unit -> peer_vpc_request

val make_password_data : ?key_pair_name:string -> ?ciphertext:string -> unit
-> password_data

val make_origin :
  ?response_timeout:int ->
  ?protocol_policy:origin_protocol_policy_enum ->
  ?region_name:region_name ->
  ?resource_type:resource_type ->
  ?name:string ->
  unit -> origin

val make_open_instance_public_ports_result : ?operation:operation -> unit
-> open_instance_public_ports_result

val make_open_instance_public_ports_request :
  instance_name:string -> port_info:port_info -> unit
-> open_instance_public_ports_request

val make_monthly_transfer : ?gb_per_month_allocated:int -> unit
-> monthly_transfer

val make_monitored_resource_info :
  ?resource_type:resource_type -> ?name:string -> ?arn:string -> unit
-> monitored_resource_info

val make_metric_datapoint :
  ?unit_:metric_unit ->
  ?timestamp_:float ->
  ?sum:float ->
  ?sample_count:float ->
  ?minimum:float ->
  ?maximum:float ->
  ?average:float ->
  unit -> metric_datapoint

val make_log_event : ?message:string -> ?created_at:float -> unit
-> log_event

val make_load_balancer_tls_policy :
  ?ciphers:string list ->
  ?protocols:string list ->
  ?description:string ->
  ?is_default:bool ->
  ?name:string ->
  unit
-> load_balancer_tls_policy

val make_load_balancer_tls_certificate_summary :
  ?is_attached:bool -> ?name:string -> unit
-> load_balancer_tls_certificate_summary

val make_load_balancer_tls_certificate_domain_validation_option :
  ?validation_status:load_balancer_tls_certificate_domain_status ->
  ?domain_name:string ->
  unit
-> load_balancer_tls_certificate_domain_validation_option

val make_load_balancer_tls_certificate_renewal_summary :
  ?domain_validation_options:load_balancer_tls_certificate_domain_validation_option list ->
  ?renewal_status:load_balancer_tls_certificate_renewal_status ->
  unit
-> load_balancer_tls_certificate_renewal_summary

val make_load_balancer_tls_certificate_dns_record_creation_state :
  ?message:string ->
  ?code:load_balancer_tls_certificate_dns_record_creation_state_code ->
  unit
-> load_balancer_tls_certificate_dns_record_creation_state

val make_load_balancer_tls_certificate_domain_validation_record :
  ?dns_record_creation_state:load_balancer_tls_certificate_dns_record_creation_state ->
  ?domain_name:string ->
  ?validation_status:load_balancer_tls_certificate_domain_status ->
  ?value:string ->
  ?type_:string ->
  ?name:string ->
  unit
-> load_balancer_tls_certificate_domain_validation_record

val make_load_balancer_tls_certificate :
  ?subject_alternative_names:string list ->
  ?subject:string ->
  ?signature_algorithm:string ->
  ?serial:string ->
  ?revoked_at:float ->
  ?revocation_reason:load_balancer_tls_certificate_revocation_reason ->
  ?renewal_summary:load_balancer_tls_certificate_renewal_summary ->
  ?not_before:float ->
  ?not_after:float ->
  ?key_algorithm:string ->
  ?issuer:string ->
  ?issued_at:float ->
  ?failure_reason:load_balancer_tls_certificate_failure_reason ->
  ?domain_validation_records:load_balancer_tls_certificate_domain_validation_record list ->
  ?domain_name:string ->
  ?status:load_balancer_tls_certificate_status ->
  ?is_attached:bool ->
  ?load_balancer_name:string ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> load_balancer_tls_certificate

val make_instance_health_summary :
  ?instance_health_reason:instance_health_reason ->
  ?instance_health:instance_health_state ->
  ?instance_name:string ->
  unit -> instance_health_summary

val make_load_balancer :
  ?tls_policy_name:string ->
  ?https_redirection_enabled:bool ->
  ?ip_address_type:ip_address_type ->
  ?configuration_options:(string * string) list ->
  ?tls_certificate_summaries:load_balancer_tls_certificate_summary list ->
  ?instance_health_summary:instance_health_summary list ->
  ?instance_port:int ->
  ?health_check_path:string ->
  ?public_ports:int list ->
  ?protocol:load_balancer_protocol ->
  ?state:load_balancer_state ->
  ?dns_name:string ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> load_balancer

val make_is_vpc_peered_result : ?is_peered:bool -> unit
-> is_vpc_peered_result

val make_is_vpc_peered_request : unit
-> is_vpc_peered_request

val make_import_key_pair_result : ?operation:operation -> unit
-> import_key_pair_result

val make_import_key_pair_request :
  public_key_base64:string -> key_pair_name:string -> unit
-> import_key_pair_request

val make_get_static_ips_result :
  ?next_page_token:string -> ?static_ips:static_ip list -> unit
-> get_static_ips_result

val make_get_static_ips_request : ?page_token:string -> unit
-> get_static_ips_request

val make_get_static_ip_result : ?static_ip:static_ip -> unit
-> get_static_ip_result

val make_get_static_ip_request : static_ip_name:string -> unit
-> get_static_ip_request

val make_get_setup_history_result :
  ?next_page_token:string -> ?setup_history:setup_history list -> unit
-> get_setup_history_result

val make_get_setup_history_request :
  ?page_token:string -> resource_name:string -> unit
-> get_setup_history_request

val make_get_relational_database_snapshots_result :
  ?next_page_token:string ->
  ?relational_database_snapshots:relational_database_snapshot list ->
  unit
-> get_relational_database_snapshots_result

val make_get_relational_database_snapshots_request :
  ?page_token:string -> unit
-> get_relational_database_snapshots_request

val make_get_relational_database_snapshot_result :
  ?relational_database_snapshot:relational_database_snapshot -> unit
-> get_relational_database_snapshot_result

val make_get_relational_database_snapshot_request :
  relational_database_snapshot_name:string -> unit
-> get_relational_database_snapshot_request

val make_get_relational_databases_result :
  ?next_page_token:string ->
  ?relational_databases:relational_database list ->
  unit
-> get_relational_databases_result

val make_get_relational_databases_request : ?page_token:string -> unit
-> get_relational_databases_request

val make_get_relational_database_parameters_result :
  ?next_page_token:string ->
  ?parameters:relational_database_parameter list ->
  unit
-> get_relational_database_parameters_result

val make_get_relational_database_parameters_request :
  ?page_token:string -> relational_database_name:string -> unit
-> get_relational_database_parameters_request

val make_get_relational_database_metric_data_result :
  ?metric_data:metric_datapoint list ->
  ?metric_name:relational_database_metric_name ->
  unit
-> get_relational_database_metric_data_result

val make_get_relational_database_metric_data_request :
  statistics:metric_statistic list ->
  unit_:metric_unit ->
  end_time:float ->
  start_time:float ->
  period:int ->
  metric_name:relational_database_metric_name ->
  relational_database_name:string ->
  unit
-> get_relational_database_metric_data_request

val make_get_relational_database_master_user_password_result :
  ?created_at:float -> ?master_user_password:string -> unit
-> get_relational_database_master_user_password_result

val make_get_relational_database_master_user_password_request :
  ?password_version:relational_database_password_version ->
  relational_database_name:string ->
  unit
-> get_relational_database_master_user_password_request

val make_get_relational_database_log_streams_result :
  ?log_streams:string list -> unit
-> get_relational_database_log_streams_result

val make_get_relational_database_log_streams_request :
  relational_database_name:string -> unit
-> get_relational_database_log_streams_request

val make_get_relational_database_log_events_result :
  ?next_forward_token:string ->
  ?next_backward_token:string ->
  ?resource_log_events:log_event list ->
  unit
-> get_relational_database_log_events_result

val make_get_relational_database_log_events_request :
  ?page_token:string ->
  ?start_from_head:bool ->
  ?end_time:float ->
  ?start_time:float ->
  log_stream_name:string ->
  relational_database_name:string ->
  unit
-> get_relational_database_log_events_request

val make_get_relational_database_events_result :
  ?next_page_token:string ->
  ?relational_database_events:relational_database_event list ->
  unit
-> get_relational_database_events_result

val make_get_relational_database_events_request :
  ?page_token:string ->
  ?duration_in_minutes:int ->
  relational_database_name:string ->
  unit
-> get_relational_database_events_request

val make_get_relational_database_bundles_result :
  ?next_page_token:string -> ?bundles:relational_database_bundle list -> unit
-> get_relational_database_bundles_result

val make_get_relational_database_bundles_request :
  ?include_inactive:bool -> ?page_token:string -> unit
-> get_relational_database_bundles_request

val make_get_relational_database_blueprints_result :
  ?next_page_token:string ->
  ?blueprints:relational_database_blueprint list ->
  unit
-> get_relational_database_blueprints_result

val make_get_relational_database_blueprints_request :
  ?page_token:string -> unit
-> get_relational_database_blueprints_request

val make_get_relational_database_result :
  ?relational_database:relational_database -> unit
-> get_relational_database_result

val make_get_relational_database_request :
  relational_database_name:string -> unit
-> get_relational_database_request

val make_get_regions_result : ?regions:region list -> unit
-> get_regions_result

val make_get_regions_request :
  ?include_relational_database_availability_zones:bool ->
  ?include_availability_zones:bool ->
  unit -> get_regions_request

val make_get_operations_for_resource_result :
  ?next_page_token:string ->
  ?next_page_count:string ->
  ?operations:operation list ->
  unit
-> get_operations_for_resource_result

val make_get_operations_for_resource_request :
  ?page_token:string -> resource_name:string -> unit
-> get_operations_for_resource_request

val make_get_operations_result :
  ?next_page_token:string -> ?operations:operation list -> unit
-> get_operations_result

val make_get_operations_request : ?page_token:string -> unit
-> get_operations_request

val make_get_operation_result : ?operation:operation -> unit
-> get_operation_result

val make_get_operation_request : operation_id:string -> unit
-> get_operation_request

val make_get_load_balancer_tls_policies_result :
  ?next_page_token:string ->
  ?tls_policies:load_balancer_tls_policy list ->
  unit
-> get_load_balancer_tls_policies_result

val make_get_load_balancer_tls_policies_request : ?page_token:string -> unit
-> get_load_balancer_tls_policies_request

val make_get_load_balancer_tls_certificates_result :
  ?tls_certificates:load_balancer_tls_certificate list -> unit
-> get_load_balancer_tls_certificates_result

val make_get_load_balancer_tls_certificates_request :
  load_balancer_name:string -> unit
-> get_load_balancer_tls_certificates_request

val make_get_load_balancers_result :
  ?next_page_token:string -> ?load_balancers:load_balancer list -> unit
-> get_load_balancers_result

val make_get_load_balancers_request : ?page_token:string -> unit
-> get_load_balancers_request

val make_get_load_balancer_metric_data_result :
  ?metric_data:metric_datapoint list ->
  ?metric_name:load_balancer_metric_name ->
  unit
-> get_load_balancer_metric_data_result

val make_get_load_balancer_metric_data_request :
  statistics:metric_statistic list ->
  unit_:metric_unit ->
  end_time:float ->
  start_time:float ->
  period:int ->
  metric_name:load_balancer_metric_name ->
  load_balancer_name:string ->
  unit
-> get_load_balancer_metric_data_request

val make_get_load_balancer_result : ?load_balancer:load_balancer -> unit
-> get_load_balancer_result

val make_get_load_balancer_request : load_balancer_name:string -> unit
-> get_load_balancer_request

val make_key_pair :
  ?fingerprint:string ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> key_pair

val make_get_key_pairs_result :
  ?next_page_token:string -> ?key_pairs:key_pair list -> unit
-> get_key_pairs_result

val make_get_key_pairs_request :
  ?include_default_key_pair:bool -> ?page_token:string -> unit
-> get_key_pairs_request

val make_get_key_pair_result : ?key_pair:key_pair -> unit
-> get_key_pair_result

val make_get_key_pair_request : key_pair_name:string -> unit
-> get_key_pair_request

val make_instance_state : ?name:string -> ?code:int -> unit
-> instance_state

val make_get_instance_state_result : ?state:instance_state -> unit
-> get_instance_state_result

val make_get_instance_state_request : instance_name:string -> unit
-> get_instance_state_request

val make_add_on :
  ?duration:string ->
  ?threshold:string ->
  ?next_snapshot_time_of_day:string ->
  ?snapshot_time_of_day:string ->
  ?status:string ->
  ?name:string ->
  unit -> add_on

val make_disk :
  ?auto_mount_status:auto_mount_status ->
  ?gb_in_use:int ->
  ?attachment_state:string ->
  ?is_attached:bool ->
  ?attached_to:string ->
  ?state:disk_state ->
  ?path:string ->
  ?iops:int ->
  ?is_system_disk:bool ->
  ?size_in_gb:int ->
  ?add_ons:add_on list ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> disk

val make_instance_snapshot :
  ?size_in_gb:int ->
  ?is_from_auto_snapshot:bool ->
  ?from_bundle_id:string ->
  ?from_blueprint_id:string ->
  ?from_instance_arn:string ->
  ?from_instance_name:string ->
  ?from_attached_disks:disk list ->
  ?progress:string ->
  ?state:instance_snapshot_state ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> instance_snapshot

val make_get_instance_snapshots_result :
  ?next_page_token:string ->
  ?instance_snapshots:instance_snapshot list ->
  unit
-> get_instance_snapshots_result

val make_get_instance_snapshots_request : ?page_token:string -> unit
-> get_instance_snapshots_request

val make_get_instance_snapshot_result :
  ?instance_snapshot:instance_snapshot -> unit
-> get_instance_snapshot_result

val make_get_instance_snapshot_request :
  instance_snapshot_name:string -> unit
-> get_instance_snapshot_request

val make_instance_hardware :
  ?ram_size_in_gb:float -> ?disks:disk list -> ?cpu_count:int -> unit
-> instance_hardware

val make_instance_port_info :
  ?cidr_list_aliases:string list ->
  ?ipv6_cidrs:string list ->
  ?cidrs:string list ->
  ?access_direction:access_direction ->
  ?common_name:string ->
  ?access_type:port_access_type ->
  ?access_from:string ->
  ?protocol:network_protocol ->
  ?to_port:int ->
  ?from_port:int ->
  unit -> instance_port_info

val make_instance_networking :
  ?ports:instance_port_info list ->
  ?monthly_transfer:monthly_transfer ->
  unit -> instance_networking

val make_instance_metadata_options :
  ?http_protocol_ipv6:http_protocol_ipv6 ->
  ?http_put_response_hop_limit:int ->
  ?http_endpoint:http_endpoint ->
  ?http_tokens:http_tokens ->
  ?state:instance_metadata_state ->
  unit -> instance_metadata_options

val make_instance :
  ?metadata_options:instance_metadata_options ->
  ?ssh_key_name:string ->
  ?username:string ->
  ?state:instance_state ->
  ?networking:instance_networking ->
  ?hardware:instance_hardware ->
  ?ip_address_type:ip_address_type ->
  ?ipv6_addresses:string list ->
  ?public_ip_address:string ->
  ?private_ip_address:string ->
  ?is_static_ip:bool ->
  ?add_ons:add_on list ->
  ?bundle_id:string ->
  ?blueprint_name:string ->
  ?blueprint_id:string ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> instance

val make_get_instances_result :
  ?next_page_token:string -> ?instances:instance list -> unit
-> get_instances_result

val make_get_instances_request : ?page_token:string -> unit
-> get_instances_request

val make_instance_port_state :
  ?cidr_list_aliases:string list ->
  ?ipv6_cidrs:string list ->
  ?cidrs:string list ->
  ?state:port_state ->
  ?protocol:network_protocol ->
  ?to_port:int ->
  ?from_port:int ->
  unit -> instance_port_state

val make_get_instance_port_states_result :
  ?port_states:instance_port_state list -> unit
-> get_instance_port_states_result

val make_get_instance_port_states_request : instance_name:string -> unit
-> get_instance_port_states_request

val make_get_instance_metric_data_result :
  ?metric_data:metric_datapoint list ->
  ?metric_name:instance_metric_name ->
  unit
-> get_instance_metric_data_result

val make_get_instance_metric_data_request :
  statistics:metric_statistic list ->
  unit_:metric_unit ->
  end_time:float ->
  start_time:float ->
  period:int ->
  metric_name:instance_metric_name ->
  instance_name:string ->
  unit -> get_instance_metric_data_request

val make_host_key_attributes :
  ?not_valid_after:float ->
  ?not_valid_before:float ->
  ?fingerprint_sh_a256:string ->
  ?fingerprint_sh_a1:string ->
  ?witnessed_at:float ->
  ?public_key:string ->
  ?algorithm:string ->
  unit -> host_key_attributes

val make_instance_access_details :
  ?host_keys:host_key_attributes list ->
  ?username:string ->
  ?instance_name:string ->
  ?protocol:instance_access_protocol ->
  ?private_key:string ->
  ?password_data:password_data ->
  ?password:string ->
  ?ipv6_addresses:string list ->
  ?ip_address:string ->
  ?expires_at:float ->
  ?cert_key:string ->
  unit
-> instance_access_details

val make_get_instance_access_details_result :
  ?access_details:instance_access_details -> unit
-> get_instance_access_details_result

val make_get_instance_access_details_request :
  ?protocol:instance_access_protocol -> instance_name:string -> unit
-> get_instance_access_details_request

val make_get_instance_result : ?instance:instance -> unit
-> get_instance_result

val make_get_instance_request : instance_name:string -> unit
-> get_instance_request

val make_disk_info :
  ?is_system_disk:bool ->
  ?size_in_gb:int ->
  ?path:string ->
  ?name:string ->
  unit -> disk_info

val make_instance_snapshot_info :
  ?from_disk_info:disk_info list ->
  ?from_blueprint_id:string ->
  ?from_bundle_id:string ->
  unit -> instance_snapshot_info

val make_disk_snapshot_info : ?size_in_gb:int -> unit
-> disk_snapshot_info

val make_export_snapshot_record_source_info :
  ?disk_snapshot_info:disk_snapshot_info ->
  ?instance_snapshot_info:instance_snapshot_info ->
  ?from_resource_arn:string ->
  ?from_resource_name:string ->
  ?arn:string ->
  ?name:string ->
  ?created_at:float ->
  ?resource_type:export_snapshot_record_source_type ->
  unit -> export_snapshot_record_source_info

val make_destination_info : ?service:string -> ?id:string -> unit
-> destination_info

val make_export_snapshot_record :
  ?destination_info:destination_info ->
  ?source_info:export_snapshot_record_source_info ->
  ?state:record_state ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?arn:string ->
  ?name:string ->
  unit -> export_snapshot_record

val make_get_export_snapshot_records_result :
  ?next_page_token:string ->
  ?export_snapshot_records:export_snapshot_record list ->
  unit
-> get_export_snapshot_records_result

val make_get_export_snapshot_records_request : ?page_token:string -> unit
-> get_export_snapshot_records_request

val make_domain :
  ?registered_domain_delegation_info:registered_domain_delegation_info ->
  ?domain_entries:domain_entry list ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> domain

val make_get_domains_result :
  ?next_page_token:string -> ?domains:domain list -> unit
-> get_domains_result

val make_get_domains_request : ?page_token:string -> unit
-> get_domains_request

val make_get_domain_result : ?domain:domain -> unit
-> get_domain_result

val make_get_domain_request : domain_name:string -> unit
-> get_domain_request

val make_lightsail_distribution :
  ?viewer_minimum_tls_protocol_version:string ->
  ?tags:tag list ->
  ?ip_address_type:ip_address_type ->
  ?able_to_update_bundle:bool ->
  ?cache_behaviors:cache_behavior_per_path list ->
  ?cache_behavior_settings:cache_settings ->
  ?default_cache_behavior:cache_behavior ->
  ?origin_public_dn_s:string ->
  ?origin:origin ->
  ?certificate_name:string ->
  ?bundle_id:string ->
  ?domain_name:string ->
  ?is_enabled:bool ->
  ?status:string ->
  ?alternative_domain_names:string list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> lightsail_distribution

val make_get_distributions_result :
  ?next_page_token:string ->
  ?distributions:lightsail_distribution list ->
  unit -> get_distributions_result

val make_get_distributions_request :
  ?page_token:string -> ?distribution_name:string -> unit
-> get_distributions_request

val make_get_distribution_metric_data_result :
  ?metric_data:metric_datapoint list ->
  ?metric_name:distribution_metric_name ->
  unit
-> get_distribution_metric_data_result

val make_get_distribution_metric_data_request :
  statistics:metric_statistic list ->
  unit_:metric_unit ->
  period:int ->
  end_time:float ->
  start_time:float ->
  metric_name:distribution_metric_name ->
  distribution_name:string ->
  unit
-> get_distribution_metric_data_request

val make_get_distribution_latest_cache_reset_result :
  ?create_time:float -> ?status:string -> unit
-> get_distribution_latest_cache_reset_result

val make_get_distribution_latest_cache_reset_request :
  ?distribution_name:string -> unit
-> get_distribution_latest_cache_reset_request

val make_distribution_bundle :
  ?is_active:bool ->
  ?transfer_per_month_in_gb:int ->
  ?price:float ->
  ?name:string ->
  ?bundle_id:string ->
  unit -> distribution_bundle

val make_get_distribution_bundles_result :
  ?bundles:distribution_bundle list -> unit
-> get_distribution_bundles_result

val make_get_distribution_bundles_request : unit
-> get_distribution_bundles_request

val make_disk_snapshot :
  ?is_from_auto_snapshot:bool ->
  ?from_instance_arn:string ->
  ?from_instance_name:string ->
  ?from_disk_arn:string ->
  ?from_disk_name:string ->
  ?progress:string ->
  ?state:disk_snapshot_state ->
  ?size_in_gb:int ->
  ?tags:tag list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?support_code:string ->
  ?arn:string ->
  ?name:string ->
  unit -> disk_snapshot

val make_get_disk_snapshots_result :
  ?next_page_token:string -> ?disk_snapshots:disk_snapshot list -> unit
-> get_disk_snapshots_result

val make_get_disk_snapshots_request : ?page_token:string -> unit
-> get_disk_snapshots_request

val make_get_disk_snapshot_result : ?disk_snapshot:disk_snapshot -> unit
-> get_disk_snapshot_result

val make_get_disk_snapshot_request : disk_snapshot_name:string -> unit
-> get_disk_snapshot_request

val make_get_disks_result :
  ?next_page_token:string -> ?disks:disk list -> unit
-> get_disks_result

val make_get_disks_request : ?page_token:string -> unit
-> get_disks_request

val make_get_disk_result : ?disk:disk -> unit
-> get_disk_result

val make_get_disk_request : disk_name:string -> unit
-> get_disk_request

val make_get_cost_estimate_result :
  ?resources_budget_estimate:resource_budget_estimate list -> unit
-> get_cost_estimate_result

val make_get_cost_estimate_request :
  end_time:float -> start_time:float -> resource_name:string -> unit
-> get_cost_estimate_request

val make_container_services_list_result :
  ?container_services:container_service list -> unit
-> container_services_list_result

val make_get_container_services_request : ?service_name:string -> unit
-> get_container_services_request

val make_container_service_power :
  ?is_active:bool ->
  ?name:string ->
  ?ram_size_in_gb:float ->
  ?cpu_count:float ->
  ?price:float ->
  ?power_id:string ->
  unit
-> container_service_power

val make_get_container_service_powers_result :
  ?powers:container_service_power list -> unit
-> get_container_service_powers_result

val make_get_container_service_powers_request : unit
-> get_container_service_powers_request

val make_get_container_service_metric_data_result :
  ?metric_data:metric_datapoint list ->
  ?metric_name:container_service_metric_name ->
  unit
-> get_container_service_metric_data_result

val make_get_container_service_metric_data_request :
  statistics:metric_statistic list ->
  period:int ->
  end_time:float ->
  start_time:float ->
  metric_name:container_service_metric_name ->
  service_name:string ->
  unit
-> get_container_service_metric_data_request

val make_get_container_service_deployments_result :
  ?deployments:container_service_deployment list -> unit
-> get_container_service_deployments_result

val make_get_container_service_deployments_request :
  service_name:string -> unit
-> get_container_service_deployments_request

val make_container_service_log_event :
  ?message:string -> ?created_at:float -> unit
-> container_service_log_event

val make_get_container_log_result :
  ?next_page_token:string ->
  ?log_events:container_service_log_event list ->
  unit -> get_container_log_result

val make_get_container_log_request :
  ?page_token:string ->
  ?filter_pattern:string ->
  ?end_time:float ->
  ?start_time:float ->
  container_name:string ->
  service_name:string ->
  unit -> get_container_log_request

val make_get_container_images_result :
  ?container_images:container_image list -> unit
-> get_container_images_result

val make_get_container_images_request : service_name:string -> unit
-> get_container_images_request

val make_get_container_api_metadata_result :
  ?metadata:(string * string) list list -> unit
-> get_container_api_metadata_result

val make_get_container_api_metadata_request : unit
-> get_container_api_metadata_request

val make_contact_method :
  ?support_code:string ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?arn:string ->
  ?name:string ->
  ?protocol:contact_protocol ->
  ?status:contact_method_status ->
  ?contact_endpoint:string ->
  unit -> contact_method

val make_get_contact_methods_result :
  ?contact_methods:contact_method list -> unit
-> get_contact_methods_result

val make_get_contact_methods_request :
  ?protocols:contact_protocol list -> unit
-> get_contact_methods_request

val make_cloud_formation_stack_record_source_info :
  ?arn:string ->
  ?name:string ->
  ?resource_type:cloud_formation_stack_record_source_type ->
  unit
-> cloud_formation_stack_record_source_info

val make_cloud_formation_stack_record :
  ?destination_info:destination_info ->
  ?source_info:cloud_formation_stack_record_source_info list ->
  ?state:record_state ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?arn:string ->
  ?name:string ->
  unit
-> cloud_formation_stack_record

val make_get_cloud_formation_stack_records_result :
  ?next_page_token:string ->
  ?cloud_formation_stack_records:cloud_formation_stack_record list ->
  unit
-> get_cloud_formation_stack_records_result

val make_get_cloud_formation_stack_records_request :
  ?page_token:string -> unit
-> get_cloud_formation_stack_records_request

val make_certificate :
  ?support_code:string ->
  ?tags:tag list ->
  ?revocation_reason:string ->
  ?revoked_at:float ->
  ?renewal_summary:renewal_summary ->
  ?eligible_to_renew:string ->
  ?not_after:float ->
  ?not_before:float ->
  ?issuer_c_a:string ->
  ?issued_at:float ->
  ?created_at:float ->
  ?key_algorithm:string ->
  ?in_use_resource_count:int ->
  ?request_failure_reason:string ->
  ?domain_validation_records:domain_validation_record list ->
  ?subject_alternative_names:string list ->
  ?serial_number:string ->
  ?status:certificate_status ->
  ?domain_name:string ->
  ?name:string ->
  ?arn:string ->
  unit -> certificate

val make_certificate_summary :
  ?tags:tag list ->
  ?certificate_detail:certificate ->
  ?domain_name:string ->
  ?certificate_name:string ->
  ?certificate_arn:string ->
  unit -> certificate_summary

val make_get_certificates_result :
  ?next_page_token:string -> ?certificates:certificate_summary list -> unit
-> get_certificates_result

val make_get_certificates_request :
  ?page_token:string ->
  ?certificate_name:string ->
  ?include_certificate_details:bool ->
  ?certificate_statuses:certificate_status list ->
  unit -> get_certificates_request

val make_bundle :
  ?public_ipv4_address_count:int ->
  ?supported_app_categories:app_category list ->
  ?supported_platforms:instance_platform list ->
  ?transfer_per_month_in_gb:int ->
  ?ram_size_in_gb:float ->
  ?power:int ->
  ?name:string ->
  ?is_active:bool ->
  ?instance_type:string ->
  ?bundle_id:string ->
  ?disk_size_in_gb:int ->
  ?cpu_count:int ->
  ?price:float ->
  unit -> bundle

val make_get_bundles_result :
  ?next_page_token:string -> ?bundles:bundle list -> unit
-> get_bundles_result

val make_get_bundles_request :
  ?app_category:app_category ->
  ?page_token:string ->
  ?include_inactive:bool ->
  unit -> get_bundles_request

val make_account_level_bpa_sync :
  ?bpa_impacts_lightsail:bool ->
  ?message:bpa_status_message ->
  ?last_synced_at:float ->
  ?status:account_level_bpa_sync_status ->
  unit -> account_level_bpa_sync

val make_get_buckets_result :
  ?account_level_bpa_sync:account_level_bpa_sync ->
  ?next_page_token:string ->
  ?buckets:bucket list ->
  unit -> get_buckets_result

val make_get_buckets_request :
  ?include_connected_resources:bool ->
  ?page_token:string ->
  ?bucket_name:string ->
  unit -> get_buckets_request

val make_get_bucket_metric_data_result :
  ?metric_data:metric_datapoint list ->
  ?metric_name:bucket_metric_name ->
  unit
-> get_bucket_metric_data_result

val make_get_bucket_metric_data_request :
  unit_:metric_unit ->
  statistics:metric_statistic list ->
  period:int ->
  end_time:float ->
  start_time:float ->
  metric_name:bucket_metric_name ->
  bucket_name:string ->
  unit -> get_bucket_metric_data_request

val make_bucket_bundle :
  ?is_active:bool ->
  ?transfer_per_month_in_gb:int ->
  ?storage_per_month_in_gb:int ->
  ?price:float ->
  ?name:string ->
  ?bundle_id:string ->
  unit -> bucket_bundle

val make_get_bucket_bundles_result : ?bundles:bucket_bundle list -> unit
-> get_bucket_bundles_result

val make_get_bucket_bundles_request : ?include_inactive:bool -> unit
-> get_bucket_bundles_request

val make_access_key_last_used :
  ?service_name:string -> ?region:string -> ?last_used_date:float -> unit
-> access_key_last_used

val make_access_key :
  ?last_used:access_key_last_used ->
  ?created_at:float ->
  ?status:status_type ->
  ?secret_access_key:string ->
  ?access_key_id:string ->
  unit -> access_key

val make_get_bucket_access_keys_result : ?access_keys:access_key list -> unit
-> get_bucket_access_keys_result

val make_get_bucket_access_keys_request : bucket_name:string -> unit
-> get_bucket_access_keys_request

val make_blueprint :
  ?app_category:app_category ->
  ?platform:instance_platform ->
  ?license_url:string ->
  ?product_url:string ->
  ?version_code:string ->
  ?version:string ->
  ?min_power:int ->
  ?is_active:bool ->
  ?description:string ->
  ?type_:blueprint_type ->
  ?group:string ->
  ?name:string ->
  ?blueprint_id:string ->
  unit -> blueprint

val make_get_blueprints_result :
  ?next_page_token:string -> ?blueprints:blueprint list -> unit
-> get_blueprints_result

val make_get_blueprints_request :
  ?app_category:app_category ->
  ?page_token:string ->
  ?include_inactive:bool ->
  unit -> get_blueprints_request

val make_attached_disk : ?size_in_gb:int -> ?path:string -> unit
-> attached_disk

val make_auto_snapshot_details :
  ?from_attached_disks:attached_disk list ->
  ?status:auto_snapshot_status ->
  ?created_at:float ->
  ?date:string ->
  unit -> auto_snapshot_details

val make_get_auto_snapshots_result :
  ?auto_snapshots:auto_snapshot_details list ->
  ?resource_type:resource_type ->
  ?resource_name:string ->
  unit -> get_auto_snapshots_result

val make_get_auto_snapshots_request : resource_name:string -> unit
-> get_auto_snapshots_request

val make_alarm :
  ?notification_enabled:bool ->
  ?notification_triggers:alarm_state list ->
  ?contact_protocols:contact_protocol list ->
  ?unit_:metric_unit ->
  ?state:alarm_state ->
  ?metric_name:metric_name ->
  ?statistic:metric_statistic ->
  ?treat_missing_data:treat_missing_data ->
  ?datapoints_to_alarm:int ->
  ?threshold:float ->
  ?period:int ->
  ?evaluation_periods:int ->
  ?comparison_operator:comparison_operator ->
  ?monitored_resource_info:monitored_resource_info ->
  ?support_code:string ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:float ->
  ?arn:string ->
  ?name:string ->
  unit -> alarm

val make_get_alarms_result :
  ?next_page_token:string -> ?alarms:alarm list -> unit
-> get_alarms_result

val make_get_alarms_request :
  ?monitored_resource_name:string ->
  ?page_token:string ->
  ?alarm_name:string ->
  unit -> get_alarms_request

val make_get_active_names_result :
  ?next_page_token:string -> ?active_names:string list -> unit
-> get_active_names_result

val make_get_active_names_request : ?page_token:string -> unit
-> get_active_names_request

val make_export_snapshot_result : ?operations:operation list -> unit
-> export_snapshot_result

val make_export_snapshot_request : source_snapshot_name:string -> unit
-> export_snapshot_request

val make_enable_add_on_result : ?operations:operation list -> unit
-> enable_add_on_result

val make_auto_snapshot_add_on_request : ?snapshot_time_of_day:string -> unit
-> auto_snapshot_add_on_request

val make_add_on_request :
  ?stop_instance_on_idle_request:stop_instance_on_idle_request ->
  ?auto_snapshot_add_on_request:auto_snapshot_add_on_request ->
  add_on_type:add_on_type ->
  unit -> add_on_request

val make_enable_add_on_request :
  add_on_request:add_on_request -> resource_name:string -> unit
-> enable_add_on_request

val make_download_default_key_pair_result :
  ?created_at:float ->
  ?private_key_base64:string ->
  ?public_key_base64:string ->
  unit
-> download_default_key_pair_result

val make_download_default_key_pair_request : unit
-> download_default_key_pair_request

val make_disable_add_on_result : ?operations:operation list -> unit
-> disable_add_on_result

val make_disable_add_on_request :
  resource_name:string -> add_on_type:add_on_type -> unit
-> disable_add_on_request

val make_detach_static_ip_result : ?operations:operation list -> unit
-> detach_static_ip_result

val make_detach_static_ip_request : static_ip_name:string -> unit
-> detach_static_ip_request

val make_detach_instances_from_load_balancer_result :
  ?operations:operation list -> unit
-> detach_instances_from_load_balancer_result

val make_detach_instances_from_load_balancer_request :
  instance_names:string list -> load_balancer_name:string -> unit
-> detach_instances_from_load_balancer_request

val make_detach_disk_result : ?operations:operation list -> unit
-> detach_disk_result

val make_detach_disk_request : disk_name:string -> unit
-> detach_disk_request

val make_detach_certificate_from_distribution_result :
  ?operation:operation -> unit
-> detach_certificate_from_distribution_result

val make_detach_certificate_from_distribution_request :
  distribution_name:string -> unit
-> detach_certificate_from_distribution_request

val make_delete_relational_database_snapshot_result :
  ?operations:operation list -> unit
-> delete_relational_database_snapshot_result

val make_delete_relational_database_snapshot_request :
  relational_database_snapshot_name:string -> unit
-> delete_relational_database_snapshot_request

val make_delete_relational_database_result :
  ?operations:operation list -> unit
-> delete_relational_database_result

val make_delete_relational_database_request :
  ?final_relational_database_snapshot_name:string ->
  ?skip_final_snapshot:bool ->
  relational_database_name:string ->
  unit
-> delete_relational_database_request

val make_delete_load_balancer_tls_certificate_result :
  ?operations:operation list -> unit
-> delete_load_balancer_tls_certificate_result

val make_delete_load_balancer_tls_certificate_request :
  ?force:bool -> certificate_name:string -> load_balancer_name:string -> unit
-> delete_load_balancer_tls_certificate_request

val make_delete_load_balancer_result : ?operations:operation list -> unit
-> delete_load_balancer_result

val make_delete_load_balancer_request : load_balancer_name:string -> unit
-> delete_load_balancer_request

val make_delete_known_host_keys_result : ?operations:operation list -> unit
-> delete_known_host_keys_result

val make_delete_known_host_keys_request : instance_name:string -> unit
-> delete_known_host_keys_request

val make_delete_key_pair_result : ?operation:operation -> unit
-> delete_key_pair_result

val make_delete_key_pair_request :
  ?expected_fingerprint:string -> key_pair_name:string -> unit
-> delete_key_pair_request

val make_delete_instance_snapshot_result : ?operations:operation list -> unit
-> delete_instance_snapshot_result

val make_delete_instance_snapshot_request :
  instance_snapshot_name:string -> unit
-> delete_instance_snapshot_request

val make_delete_instance_result : ?operations:operation list -> unit
-> delete_instance_result

val make_delete_instance_request :
  ?force_delete_add_ons:bool -> instance_name:string -> unit
-> delete_instance_request

val make_delete_domain_entry_result : ?operation:operation -> unit
-> delete_domain_entry_result

val make_delete_domain_entry_request :
  domain_entry:domain_entry -> domain_name:string -> unit
-> delete_domain_entry_request

val make_delete_domain_result : ?operation:operation -> unit
-> delete_domain_result

val make_delete_domain_request : domain_name:string -> unit
-> delete_domain_request

val make_delete_distribution_result : ?operation:operation -> unit
-> delete_distribution_result

val make_delete_distribution_request : ?distribution_name:string -> unit
-> delete_distribution_request

val make_delete_disk_snapshot_result : ?operations:operation list -> unit
-> delete_disk_snapshot_result

val make_delete_disk_snapshot_request : disk_snapshot_name:string -> unit
-> delete_disk_snapshot_request

val make_delete_disk_result : ?operations:operation list -> unit
-> delete_disk_result

val make_delete_disk_request :
  ?force_delete_add_ons:bool -> disk_name:string -> unit
-> delete_disk_request

val make_delete_container_service_result : unit
-> delete_container_service_result

val make_delete_container_service_request : service_name:string -> unit
-> delete_container_service_request

val make_delete_container_image_result : unit
-> delete_container_image_result

val make_delete_container_image_request :
  image:string -> service_name:string -> unit
-> delete_container_image_request

val make_delete_contact_method_result : ?operations:operation list -> unit
-> delete_contact_method_result

val make_delete_contact_method_request : protocol:contact_protocol -> unit
-> delete_contact_method_request

val make_delete_certificate_result : ?operations:operation list -> unit
-> delete_certificate_result

val make_delete_certificate_request : certificate_name:string -> unit
-> delete_certificate_request

val make_delete_bucket_access_key_result : ?operations:operation list -> unit
-> delete_bucket_access_key_result

val make_delete_bucket_access_key_request :
  access_key_id:string -> bucket_name:string -> unit
-> delete_bucket_access_key_request

val make_delete_bucket_result : ?operations:operation list -> unit
-> delete_bucket_result

val make_delete_bucket_request :
  ?force_delete:bool -> bucket_name:string -> unit
-> delete_bucket_request

val make_delete_auto_snapshot_result : ?operations:operation list -> unit
-> delete_auto_snapshot_result

val make_delete_auto_snapshot_request :
  date:string -> resource_name:string -> unit
-> delete_auto_snapshot_request

val make_delete_alarm_result : ?operations:operation list -> unit
-> delete_alarm_result

val make_delete_alarm_request : alarm_name:string -> unit
-> delete_alarm_request

val make_create_relational_database_snapshot_result :
  ?operations:operation list -> unit
-> create_relational_database_snapshot_result

val make_create_relational_database_snapshot_request :
  ?tags:tag list ->
  relational_database_snapshot_name:string ->
  relational_database_name:string ->
  unit
-> create_relational_database_snapshot_request

val make_create_relational_database_from_snapshot_result :
  ?operations:operation list -> unit
-> create_relational_database_from_snapshot_result

val make_create_relational_database_from_snapshot_request :
  ?tags:tag list ->
  ?use_latest_restorable_time:bool ->
  ?restore_time:float ->
  ?source_relational_database_name:string ->
  ?relational_database_bundle_id:string ->
  ?relational_database_snapshot_name:string ->
  ?publicly_accessible:bool ->
  ?availability_zone:string ->
  relational_database_name:string ->
  unit
-> create_relational_database_from_snapshot_request

val make_create_relational_database_result :
  ?operations:operation list -> unit
-> create_relational_database_result

val make_create_relational_database_request :
  ?tags:tag list ->
  ?publicly_accessible:bool ->
  ?preferred_maintenance_window:string ->
  ?preferred_backup_window:string ->
  ?master_user_password:string ->
  ?availability_zone:string ->
  master_username:string ->
  master_database_name:string ->
  relational_database_bundle_id:string ->
  relational_database_blueprint_id:string ->
  relational_database_name:string ->
  unit
-> create_relational_database_request

val make_create_load_balancer_tls_certificate_result :
  ?operations:operation list -> unit
-> create_load_balancer_tls_certificate_result

val make_create_load_balancer_tls_certificate_request :
  ?tags:tag list ->
  ?certificate_alternative_names:string list ->
  certificate_domain_name:string ->
  certificate_name:string ->
  load_balancer_name:string ->
  unit
-> create_load_balancer_tls_certificate_request

val make_create_load_balancer_result : ?operations:operation list -> unit
-> create_load_balancer_result

val make_create_load_balancer_request :
  ?tls_policy_name:string ->
  ?ip_address_type:ip_address_type ->
  ?tags:tag list ->
  ?certificate_alternative_names:string list ->
  ?certificate_domain_name:string ->
  ?certificate_name:string ->
  ?health_check_path:string ->
  instance_port:int ->
  load_balancer_name:string ->
  unit -> create_load_balancer_request

val make_create_key_pair_result :
  ?operation:operation ->
  ?private_key_base64:string ->
  ?public_key_base64:string ->
  ?key_pair:key_pair ->
  unit -> create_key_pair_result

val make_create_key_pair_request :
  ?tags:tag list -> key_pair_name:string -> unit
-> create_key_pair_request

val make_create_instance_snapshot_result : ?operations:operation list -> unit
-> create_instance_snapshot_result

val make_create_instance_snapshot_request :
  ?tags:tag list ->
  instance_name:string ->
  instance_snapshot_name:string ->
  unit
-> create_instance_snapshot_request

val make_create_instances_from_snapshot_result :
  ?operations:operation list -> unit
-> create_instances_from_snapshot_result

val make_disk_map :
  ?new_disk_name:string -> ?original_disk_path:string -> unit
-> disk_map

val make_create_instances_from_snapshot_request :
  ?use_latest_restorable_auto_snapshot:bool ->
  ?restore_date:string ->
  ?source_instance_name:string ->
  ?ip_address_type:ip_address_type ->
  ?add_ons:add_on_request list ->
  ?tags:tag list ->
  ?key_pair_name:string ->
  ?user_data:string ->
  ?instance_snapshot_name:string ->
  ?attached_disk_mapping:(string * disk_map list) list ->
  bundle_id:string ->
  availability_zone:string ->
  instance_names:string list ->
  unit
-> create_instances_from_snapshot_request

val make_create_instances_result : ?operations:operation list -> unit
-> create_instances_result

val make_create_instances_request :
  ?ip_address_type:ip_address_type ->
  ?add_ons:add_on_request list ->
  ?tags:tag list ->
  ?key_pair_name:string ->
  ?user_data:string ->
  ?custom_image_name:string ->
  bundle_id:string ->
  blueprint_id:string ->
  availability_zone:string ->
  instance_names:string list ->
  unit
-> create_instances_request

val make_create_gui_session_access_details_result :
  ?sessions:session list ->
  ?failure_reason:string ->
  ?percentage_complete:int ->
  ?status:status ->
  ?resource_name:string ->
  unit
-> create_gui_session_access_details_result

val make_create_gui_session_access_details_request :
  resource_name:string -> unit
-> create_gui_session_access_details_request

val make_create_domain_entry_result : ?operation:operation -> unit
-> create_domain_entry_result

val make_create_domain_entry_request :
  domain_entry:domain_entry -> domain_name:string -> unit
-> create_domain_entry_request

val make_create_domain_result : ?operation:operation -> unit
-> create_domain_result

val make_create_domain_request : ?tags:tag list -> domain_name:string -> unit
-> create_domain_request

val make_create_distribution_result :
  ?operation:operation -> ?distribution:lightsail_distribution -> unit
-> create_distribution_result

val make_create_distribution_request :
  ?viewer_minimum_tls_protocol_version:viewer_minimum_tls_protocol_version_enum ->
  ?certificate_name:string ->
  ?tags:tag list ->
  ?ip_address_type:ip_address_type ->
  ?cache_behaviors:cache_behavior_per_path list ->
  ?cache_behavior_settings:cache_settings ->
  bundle_id:string ->
  default_cache_behavior:cache_behavior ->
  origin:input_origin ->
  distribution_name:string ->
  unit -> create_distribution_request

val make_create_disk_snapshot_result : ?operations:operation list -> unit
-> create_disk_snapshot_result

val make_create_disk_snapshot_request :
  ?tags:tag list ->
  ?instance_name:string ->
  ?disk_name:string ->
  disk_snapshot_name:string ->
  unit
-> create_disk_snapshot_request

val make_create_disk_from_snapshot_result :
  ?operations:operation list -> unit
-> create_disk_from_snapshot_result

val make_create_disk_from_snapshot_request :
  ?use_latest_restorable_auto_snapshot:bool ->
  ?restore_date:string ->
  ?source_disk_name:string ->
  ?add_ons:add_on_request list ->
  ?tags:tag list ->
  ?disk_snapshot_name:string ->
  size_in_gb:int ->
  availability_zone:string ->
  disk_name:string ->
  unit -> create_disk_from_snapshot_request

val make_create_disk_result : ?operations:operation list -> unit
-> create_disk_result

val make_create_disk_request :
  ?add_ons:add_on_request list ->
  ?tags:tag list ->
  size_in_gb:int ->
  availability_zone:string ->
  disk_name:string ->
  unit -> create_disk_request

val make_container_service_registry_login :
  ?registry:string ->
  ?expires_at:float ->
  ?password:string ->
  ?username:string ->
  unit
-> container_service_registry_login

val make_create_container_service_registry_login_result :
  ?registry_login:container_service_registry_login -> unit
-> create_container_service_registry_login_result

val make_create_container_service_registry_login_request : unit
-> create_container_service_registry_login_request

val make_create_container_service_deployment_result :
  ?container_service:container_service -> unit
-> create_container_service_deployment_result

val make_endpoint_request :
  ?health_check:container_service_health_check_config ->
  container_port:int ->
  container_name:string ->
  unit
-> endpoint_request

val make_create_container_service_deployment_request :
  ?public_endpoint:endpoint_request ->
  ?containers:(string * container) list ->
  service_name:string ->
  unit
-> create_container_service_deployment_request

val make_create_container_service_result :
  ?container_service:container_service -> unit
-> create_container_service_result

val make_container_service_deployment_request :
  ?public_endpoint:endpoint_request ->
  ?containers:(string * container) list ->
  unit
-> container_service_deployment_request

val make_create_container_service_request :
  ?private_registry_access:private_registry_access_request ->
  ?deployment:container_service_deployment_request ->
  ?public_domain_names:(string * string list) list ->
  ?tags:tag list ->
  scale:int ->
  power:container_service_power_name ->
  service_name:string ->
  unit
-> create_container_service_request

val make_create_contact_method_result : ?operations:operation list -> unit
-> create_contact_method_result

val make_create_contact_method_request :
  contact_endpoint:string -> protocol:contact_protocol -> unit
-> create_contact_method_request

val make_create_cloud_formation_stack_result :
  ?operations:operation list -> unit
-> create_cloud_formation_stack_result

val make_instance_entry :
  ?user_data:string ->
  availability_zone:string ->
  port_info_source:port_info_source_type ->
  instance_type:string ->
  source_name:string ->
  unit -> instance_entry

val make_create_cloud_formation_stack_request :
  instances:instance_entry list -> unit
-> create_cloud_formation_stack_request

val make_create_certificate_result :
  ?operations:operation list -> ?certificate:certificate_summary -> unit
-> create_certificate_result

val make_create_certificate_request :
  ?tags:tag list ->
  ?subject_alternative_names:string list ->
  domain_name:string ->
  certificate_name:string ->
  unit
-> create_certificate_request

val make_create_bucket_access_key_result :
  ?operations:operation list -> ?access_key:access_key -> unit
-> create_bucket_access_key_result

val make_create_bucket_access_key_request : bucket_name:string -> unit
-> create_bucket_access_key_request

val make_create_bucket_result :
  ?operations:operation list -> ?bucket:bucket -> unit
-> create_bucket_result

val make_create_bucket_request :
  ?enable_object_versioning:bool ->
  ?tags:tag list ->
  bundle_id:string ->
  bucket_name:string ->
  unit -> create_bucket_request

val make_copy_snapshot_result : ?operations:operation list -> unit
-> copy_snapshot_result

val make_copy_snapshot_request :
  ?use_latest_restorable_auto_snapshot:bool ->
  ?restore_date:string ->
  ?source_resource_name:string ->
  ?source_snapshot_name:string ->
  source_region:region_name ->
  target_snapshot_name:string ->
  unit -> copy_snapshot_request

val make_close_instance_public_ports_result : ?operation:operation -> unit
-> close_instance_public_ports_result

val make_close_instance_public_ports_request :
  instance_name:string -> port_info:port_info -> unit
-> close_instance_public_ports_request

val make_attach_static_ip_result : ?operations:operation list -> unit
-> attach_static_ip_result

val make_attach_static_ip_request :
  instance_name:string -> static_ip_name:string -> unit
-> attach_static_ip_request

val make_attach_load_balancer_tls_certificate_result :
  ?operations:operation list -> unit
-> attach_load_balancer_tls_certificate_result

val make_attach_load_balancer_tls_certificate_request :
  certificate_name:string -> load_balancer_name:string -> unit
-> attach_load_balancer_tls_certificate_request

val make_attach_instances_to_load_balancer_result :
  ?operations:operation list -> unit
-> attach_instances_to_load_balancer_result

val make_attach_instances_to_load_balancer_request :
  instance_names:string list -> load_balancer_name:string -> unit
-> attach_instances_to_load_balancer_request

val make_attach_disk_result : ?operations:operation list -> unit
-> attach_disk_result

val make_attach_disk_request :
  ?auto_mounting:bool ->
  disk_path:string ->
  instance_name:string ->
  disk_name:string ->
  unit
-> attach_disk_request

val make_attach_certificate_to_distribution_result :
  ?operation:operation -> unit
-> attach_certificate_to_distribution_result

val make_attach_certificate_to_distribution_request :
  certificate_name:string -> distribution_name:string -> unit
-> attach_certificate_to_distribution_request

val make_allocate_static_ip_result : ?operations:operation list -> unit
-> allocate_static_ip_result

val make_allocate_static_ip_request : static_ip_name:string -> unit
-> allocate_static_ip_request

