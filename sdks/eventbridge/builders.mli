open Types
val make_dead_letter_config : ?arn:string -> unit
-> dead_letter_config

val make_update_event_bus_response :
  ?dead_letter_config:dead_letter_config ->
  ?description:string ->
  ?kms_key_identifier:string ->
  ?name:string ->
  ?arn:string ->
  unit -> update_event_bus_response

val make_update_event_bus_request :
  ?dead_letter_config:dead_letter_config ->
  ?description:string ->
  ?kms_key_identifier:string ->
  ?name:string ->
  unit -> update_event_bus_request

val make_primary : health_check:string -> unit -> primary

val make_secondary : route:string -> unit
-> secondary

val make_failover_config : secondary:secondary -> primary:primary -> unit
-> failover_config

val make_routing_config : failover_config:failover_config -> unit
-> routing_config

val make_replication_config : ?state:replication_state -> unit
-> replication_config

val make_endpoint_event_bus : event_bus_arn:string -> unit
-> endpoint_event_bus

val make_update_endpoint_response :
  ?state:endpoint_state ->
  ?endpoint_url:string ->
  ?endpoint_id:string ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?name:string ->
  unit -> update_endpoint_response

val make_update_endpoint_request :
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?description:string ->
  name:string ->
  unit -> update_endpoint_request

val make_update_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit
-> update_connection_response

val make_update_connection_basic_auth_request_parameters :
  ?password:string -> ?username:string -> unit
-> update_connection_basic_auth_request_parameters

val make_update_connection_o_auth_client_request_parameters :
  ?client_secret:string -> ?client_i_d:string -> unit
-> update_connection_o_auth_client_request_parameters

val make_connection_header_parameter :
  ?is_value_secret:bool -> ?value:string -> ?key:string -> unit
-> connection_header_parameter

val make_connection_query_string_parameter :
  ?is_value_secret:bool -> ?value:string -> ?key:string -> unit
-> connection_query_string_parameter

val make_connection_body_parameter :
  ?is_value_secret:bool -> ?value:string -> ?key:string -> unit
-> connection_body_parameter

val make_connection_http_parameters :
  ?body_parameters:connection_body_parameter list ->
  ?query_string_parameters:connection_query_string_parameter list ->
  ?header_parameters:connection_header_parameter list ->
  unit
-> connection_http_parameters

val make_update_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  ?http_method:connection_o_auth_http_method ->
  ?authorization_endpoint:string ->
  ?client_parameters:update_connection_o_auth_client_request_parameters ->
  unit
-> update_connection_o_auth_request_parameters

val make_update_connection_api_key_auth_request_parameters :
  ?api_key_value:string -> ?api_key_name:string -> unit
-> update_connection_api_key_auth_request_parameters

val make_update_connection_auth_request_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:update_connection_api_key_auth_request_parameters ->
  ?o_auth_parameters:update_connection_o_auth_request_parameters ->
  ?basic_auth_parameters:update_connection_basic_auth_request_parameters ->
  unit
-> update_connection_auth_request_parameters

val make_update_connection_request :
  ?auth_parameters:update_connection_auth_request_parameters ->
  ?authorization_type:connection_authorization_type ->
  ?description:string ->
  name:string ->
  unit -> update_connection_request

val make_update_archive_response :
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?archive_arn:string ->
  unit -> update_archive_response

val make_update_archive_request :
  ?retention_days:int ->
  ?event_pattern:string ->
  ?description:string ->
  archive_name:string ->
  unit -> update_archive_request

val make_update_api_destination_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?api_destination_state:api_destination_state ->
  ?api_destination_arn:string ->
  unit
-> update_api_destination_response

val make_update_api_destination_request :
  ?invocation_rate_limit_per_second:int ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:string ->
  ?connection_arn:string ->
  ?description:string ->
  name:string ->
  unit -> update_api_destination_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request

val make_test_event_pattern_response : ?result:bool -> unit
-> test_event_pattern_response

val make_test_event_pattern_request :
  event:string -> event_pattern:string -> unit
-> test_event_pattern_request

val make_input_transformer :
  ?input_paths_map:(string * string) list -> input_template:string -> unit
-> input_transformer

val make_kinesis_parameters : partition_key_path:string -> unit
-> kinesis_parameters

val make_run_command_target : values:string list -> key:string -> unit
-> run_command_target

val make_run_command_parameters :
  run_command_targets:run_command_target list -> unit
-> run_command_parameters

val make_aws_vpc_configuration :
  ?assign_public_ip:assign_public_ip ->
  ?security_groups:string list ->
  subnets:string list ->
  unit -> aws_vpc_configuration

val make_network_configuration :
  ?awsvpc_configuration:aws_vpc_configuration -> unit
-> network_configuration

val make_capacity_provider_strategy_item :
  ?base:int -> ?weight:int -> capacity_provider:string -> unit
-> capacity_provider_strategy_item

val make_placement_constraint :
  ?expression:string -> ?type_:placement_constraint_type -> unit
-> placement_constraint

val make_placement_strategy :
  ?field:string -> ?type_:placement_strategy_type -> unit
-> placement_strategy

val make_tag : value:string -> key:string -> unit
-> tag

val make_ecs_parameters :
  ?tags:tag list ->
  ?reference_id:string ->
  ?propagate_tags:propagate_tags ->
  ?placement_strategy:placement_strategy list ->
  ?placement_constraints:placement_constraint list ->
  ?enable_execute_command:bool ->
  ?enable_ecs_managed_tags:bool ->
  ?capacity_provider_strategy:capacity_provider_strategy_item list ->
  ?group:string ->
  ?platform_version:string ->
  ?network_configuration:network_configuration ->
  ?launch_type:launch_type ->
  ?task_count:int ->
  task_definition_arn:string ->
  unit -> ecs_parameters

val make_batch_array_properties : ?size:int -> unit
-> batch_array_properties

val make_batch_retry_strategy : ?attempts:int -> unit
-> batch_retry_strategy

val make_batch_parameters :
  ?retry_strategy:batch_retry_strategy ->
  ?array_properties:batch_array_properties ->
  job_name:string ->
  job_definition:string ->
  unit -> batch_parameters

val make_sqs_parameters : ?message_group_id:string -> unit
-> sqs_parameters

val make_http_parameters :
  ?query_string_parameters:(string * string) list ->
  ?header_parameters:(string * string) list ->
  ?path_parameter_values:string list ->
  unit -> http_parameters

val make_redshift_data_parameters :
  ?sqls:string list ->
  ?with_event:bool ->
  ?statement_name:string ->
  ?sql:string ->
  ?db_user:string ->
  ?secret_manager_arn:string ->
  database:string ->
  unit -> redshift_data_parameters

val make_sage_maker_pipeline_parameter : value:string -> name:string -> unit
-> sage_maker_pipeline_parameter

val make_sage_maker_pipeline_parameters :
  ?pipeline_parameter_list:sage_maker_pipeline_parameter list -> unit
-> sage_maker_pipeline_parameters

val make_retry_policy :
  ?maximum_event_age_in_seconds:int -> ?maximum_retry_attempts:int -> unit
-> retry_policy

val make_app_sync_parameters : ?graph_ql_operation:string -> unit
-> app_sync_parameters

val make_target :
  ?app_sync_parameters:app_sync_parameters ->
  ?retry_policy:retry_policy ->
  ?dead_letter_config:dead_letter_config ->
  ?sage_maker_pipeline_parameters:sage_maker_pipeline_parameters ->
  ?redshift_data_parameters:redshift_data_parameters ->
  ?http_parameters:http_parameters ->
  ?sqs_parameters:sqs_parameters ->
  ?batch_parameters:batch_parameters ->
  ?ecs_parameters:ecs_parameters ->
  ?run_command_parameters:run_command_parameters ->
  ?kinesis_parameters:kinesis_parameters ->
  ?input_transformer:input_transformer ->
  ?input_path:string ->
  ?input:string ->
  ?role_arn:string ->
  arn:string ->
  id:string ->
  unit -> target

val make_tag_resource_response : unit
-> tag_resource_response

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request

val make_start_replay_response :
  ?replay_start_time:float ->
  ?state_reason:string ->
  ?state:replay_state ->
  ?replay_arn:string ->
  unit -> start_replay_response

val make_replay_destination : ?filter_arns:string list -> arn:string -> unit
-> replay_destination

val make_start_replay_request :
  ?description:string ->
  destination:replay_destination ->
  event_end_time:float ->
  event_start_time:float ->
  event_source_arn:string ->
  replay_name:string ->
  unit -> start_replay_request

val make_rule :
  ?event_bus_name:string ->
  ?managed_by:string ->
  ?role_arn:string ->
  ?schedule_expression:string ->
  ?description:string ->
  ?state:rule_state ->
  ?event_pattern:string ->
  ?arn:string ->
  ?name:string ->
  unit -> rule

val make_replay :
  ?replay_end_time:float ->
  ?replay_start_time:float ->
  ?event_last_replayed_time:float ->
  ?event_end_time:float ->
  ?event_start_time:float ->
  ?state_reason:string ->
  ?state:replay_state ->
  ?event_source_arn:string ->
  ?replay_name:string ->
  unit -> replay

val make_remove_targets_result_entry :
  ?error_message:string -> ?error_code:string -> ?target_id:string -> unit
-> remove_targets_result_entry

val make_remove_targets_response :
  ?failed_entries:remove_targets_result_entry list ->
  ?failed_entry_count:int ->
  unit -> remove_targets_response

val make_remove_targets_request :
  ?force:bool ->
  ?event_bus_name:string ->
  ids:string list ->
  rule:string ->
  unit -> remove_targets_request

val make_remove_permission_request :
  ?event_bus_name:string ->
  ?remove_all_permissions:bool ->
  ?statement_id:string ->
  unit -> remove_permission_request

val make_put_targets_result_entry :
  ?error_message:string -> ?error_code:string -> ?target_id:string -> unit
-> put_targets_result_entry

val make_put_targets_response :
  ?failed_entries:put_targets_result_entry list ->
  ?failed_entry_count:int ->
  unit -> put_targets_response

val make_put_targets_request :
  ?event_bus_name:string -> targets:target list -> rule:string -> unit
-> put_targets_request

val make_put_rule_response : ?rule_arn:string -> unit
-> put_rule_response

val make_put_rule_request :
  ?event_bus_name:string ->
  ?tags:tag list ->
  ?role_arn:string ->
  ?description:string ->
  ?state:rule_state ->
  ?event_pattern:string ->
  ?schedule_expression:string ->
  name:string ->
  unit -> put_rule_request

val make_condition : value:string -> key:string -> type_:string -> unit
-> condition

val make_put_permission_request :
  ?policy:string ->
  ?condition:condition ->
  ?statement_id:string ->
  ?principal:string ->
  ?action:string ->
  ?event_bus_name:string ->
  unit -> put_permission_request

val make_put_partner_events_result_entry :
  ?error_message:string -> ?error_code:string -> ?event_id:string -> unit
-> put_partner_events_result_entry

val make_put_partner_events_response :
  ?entries:put_partner_events_result_entry list ->
  ?failed_entry_count:int ->
  unit
-> put_partner_events_response

val make_put_partner_events_request_entry :
  ?detail:string ->
  ?detail_type:string ->
  ?resources:string list ->
  ?source:string ->
  ?time:float ->
  unit
-> put_partner_events_request_entry

val make_put_partner_events_request :
  entries:put_partner_events_request_entry list -> unit
-> put_partner_events_request

val make_put_events_result_entry :
  ?error_message:string -> ?error_code:string -> ?event_id:string -> unit
-> put_events_result_entry

val make_put_events_response :
  ?entries:put_events_result_entry list -> ?failed_entry_count:int -> unit
-> put_events_response

val make_put_events_request_entry :
  ?trace_header:string ->
  ?event_bus_name:string ->
  ?detail:string ->
  ?detail_type:string ->
  ?resources:string list ->
  ?source:string ->
  ?time:float ->
  unit -> put_events_request_entry

val make_put_events_request :
  ?endpoint_id:string -> entries:put_events_request_entry list -> unit
-> put_events_request

val make_partner_event_source : ?name:string -> ?arn:string -> unit
-> partner_event_source

val make_partner_event_source_account :
  ?state:event_source_state ->
  ?expiration_time:float ->
  ?creation_time:float ->
  ?account:string ->
  unit
-> partner_event_source_account

val make_list_targets_by_rule_response :
  ?next_token:string -> ?targets:target list -> unit
-> list_targets_by_rule_response

val make_list_targets_by_rule_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_bus_name:string ->
  rule:string ->
  unit
-> list_targets_by_rule_request

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request

val make_list_rules_response : ?next_token:string -> ?rules:rule list -> unit
-> list_rules_response

val make_list_rules_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_bus_name:string ->
  ?name_prefix:string ->
  unit -> list_rules_request

val make_list_rule_names_by_target_response :
  ?next_token:string -> ?rule_names:string list -> unit
-> list_rule_names_by_target_response

val make_list_rule_names_by_target_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_bus_name:string ->
  target_arn:string ->
  unit -> list_rule_names_by_target_request

val make_list_replays_response :
  ?next_token:string -> ?replays:replay list -> unit
-> list_replays_response

val make_list_replays_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_source_arn:string ->
  ?state:replay_state ->
  ?name_prefix:string ->
  unit -> list_replays_request

val make_list_partner_event_sources_response :
  ?next_token:string ->
  ?partner_event_sources:partner_event_source list ->
  unit
-> list_partner_event_sources_response

val make_list_partner_event_sources_request :
  ?limit:int -> ?next_token:string -> name_prefix:string -> unit
-> list_partner_event_sources_request

val make_list_partner_event_source_accounts_response :
  ?next_token:string ->
  ?partner_event_source_accounts:partner_event_source_account list ->
  unit
-> list_partner_event_source_accounts_response

val make_list_partner_event_source_accounts_request :
  ?limit:int -> ?next_token:string -> event_source_name:string -> unit
-> list_partner_event_source_accounts_request

val make_event_source :
  ?state:event_source_state ->
  ?name:string ->
  ?expiration_time:float ->
  ?creation_time:float ->
  ?created_by:string ->
  ?arn:string ->
  unit -> event_source

val make_list_event_sources_response :
  ?next_token:string -> ?event_sources:event_source list -> unit
-> list_event_sources_response

val make_list_event_sources_request :
  ?limit:int -> ?next_token:string -> ?name_prefix:string -> unit
-> list_event_sources_request

val make_event_bus :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?policy:string ->
  ?description:string ->
  ?arn:string ->
  ?name:string ->
  unit -> event_bus

val make_list_event_buses_response :
  ?next_token:string -> ?event_buses:event_bus list -> unit
-> list_event_buses_response

val make_list_event_buses_request :
  ?limit:int -> ?next_token:string -> ?name_prefix:string -> unit
-> list_event_buses_request

val make_endpoint :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:endpoint_state ->
  ?endpoint_url:string ->
  ?endpoint_id:string ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?description:string ->
  ?name:string ->
  unit -> endpoint

val make_list_endpoints_response :
  ?next_token:string -> ?endpoints:endpoint list -> unit
-> list_endpoints_response

val make_list_endpoints_request :
  ?max_results:int ->
  ?next_token:string ->
  ?home_region:string ->
  ?name_prefix:string ->
  unit -> list_endpoints_request

val make_connection :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?authorization_type:connection_authorization_type ->
  ?state_reason:string ->
  ?connection_state:connection_state ->
  ?name:string ->
  ?connection_arn:string ->
  unit -> connection

val make_list_connections_response :
  ?next_token:string -> ?connections:connection list -> unit
-> list_connections_response

val make_list_connections_request :
  ?limit:int ->
  ?next_token:string ->
  ?connection_state:connection_state ->
  ?name_prefix:string ->
  unit -> list_connections_request

val make_archive :
  ?creation_time:float ->
  ?event_count:int ->
  ?size_bytes:int ->
  ?retention_days:int ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?event_source_arn:string ->
  ?archive_name:string ->
  unit -> archive

val make_list_archives_response :
  ?next_token:string -> ?archives:archive list -> unit
-> list_archives_response

val make_list_archives_request :
  ?limit:int ->
  ?next_token:string ->
  ?state:archive_state ->
  ?event_source_arn:string ->
  ?name_prefix:string ->
  unit -> list_archives_request

val make_api_destination :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?invocation_rate_limit_per_second:int ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:string ->
  ?connection_arn:string ->
  ?api_destination_state:api_destination_state ->
  ?name:string ->
  ?api_destination_arn:string ->
  unit -> api_destination

val make_list_api_destinations_response :
  ?next_token:string -> ?api_destinations:api_destination list -> unit
-> list_api_destinations_response

val make_list_api_destinations_request :
  ?limit:int ->
  ?next_token:string ->
  ?connection_arn:string ->
  ?name_prefix:string ->
  unit -> list_api_destinations_request

val make_enable_rule_request : ?event_bus_name:string -> name:string -> unit
-> enable_rule_request

val make_disable_rule_request : ?event_bus_name:string -> name:string -> unit
-> disable_rule_request

val make_describe_rule_response :
  ?created_by:string ->
  ?event_bus_name:string ->
  ?managed_by:string ->
  ?role_arn:string ->
  ?description:string ->
  ?state:rule_state ->
  ?schedule_expression:string ->
  ?event_pattern:string ->
  ?arn:string ->
  ?name:string ->
  unit -> describe_rule_response

val make_describe_rule_request :
  ?event_bus_name:string -> name:string -> unit
-> describe_rule_request

val make_describe_replay_response :
  ?replay_end_time:float ->
  ?replay_start_time:float ->
  ?event_last_replayed_time:float ->
  ?event_end_time:float ->
  ?event_start_time:float ->
  ?destination:replay_destination ->
  ?event_source_arn:string ->
  ?state_reason:string ->
  ?state:replay_state ->
  ?description:string ->
  ?replay_arn:string ->
  ?replay_name:string ->
  unit -> describe_replay_response

val make_describe_replay_request : replay_name:string -> unit
-> describe_replay_request

val make_describe_partner_event_source_response :
  ?name:string -> ?arn:string -> unit
-> describe_partner_event_source_response

val make_describe_partner_event_source_request : name:string -> unit
-> describe_partner_event_source_request

val make_describe_event_source_response :
  ?state:event_source_state ->
  ?name:string ->
  ?expiration_time:float ->
  ?creation_time:float ->
  ?created_by:string ->
  ?arn:string ->
  unit
-> describe_event_source_response

val make_describe_event_source_request : name:string -> unit
-> describe_event_source_request

val make_describe_event_bus_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?policy:string ->
  ?dead_letter_config:dead_letter_config ->
  ?kms_key_identifier:string ->
  ?description:string ->
  ?arn:string ->
  ?name:string ->
  unit -> describe_event_bus_response

val make_describe_event_bus_request : ?name:string -> unit
-> describe_event_bus_request

val make_describe_endpoint_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:endpoint_state ->
  ?endpoint_url:string ->
  ?endpoint_id:string ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?description:string ->
  ?name:string ->
  unit -> describe_endpoint_response

val make_describe_endpoint_request :
  ?home_region:string -> name:string -> unit
-> describe_endpoint_request

val make_connection_basic_auth_response_parameters : ?username:string -> unit
-> connection_basic_auth_response_parameters

val make_connection_o_auth_client_response_parameters :
  ?client_i_d:string -> unit
-> connection_o_auth_client_response_parameters

val make_connection_o_auth_response_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  ?http_method:connection_o_auth_http_method ->
  ?authorization_endpoint:string ->
  ?client_parameters:connection_o_auth_client_response_parameters ->
  unit
-> connection_o_auth_response_parameters

val make_connection_api_key_auth_response_parameters :
  ?api_key_name:string -> unit
-> connection_api_key_auth_response_parameters

val make_connection_auth_response_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:connection_api_key_auth_response_parameters ->
  ?o_auth_parameters:connection_o_auth_response_parameters ->
  ?basic_auth_parameters:connection_basic_auth_response_parameters ->
  unit
-> connection_auth_response_parameters

val make_describe_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?auth_parameters:connection_auth_response_parameters ->
  ?secret_arn:string ->
  ?authorization_type:connection_authorization_type ->
  ?state_reason:string ->
  ?connection_state:connection_state ->
  ?description:string ->
  ?name:string ->
  ?connection_arn:string ->
  unit -> describe_connection_response

val make_describe_connection_request : name:string -> unit
-> describe_connection_request

val make_describe_archive_response :
  ?creation_time:float ->
  ?event_count:int ->
  ?size_bytes:int ->
  ?retention_days:int ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?event_pattern:string ->
  ?description:string ->
  ?event_source_arn:string ->
  ?archive_name:string ->
  ?archive_arn:string ->
  unit -> describe_archive_response

val make_describe_archive_request : archive_name:string -> unit
-> describe_archive_request

val make_describe_api_destination_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?invocation_rate_limit_per_second:int ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:string ->
  ?connection_arn:string ->
  ?api_destination_state:api_destination_state ->
  ?description:string ->
  ?name:string ->
  ?api_destination_arn:string ->
  unit
-> describe_api_destination_response

val make_describe_api_destination_request : name:string -> unit
-> describe_api_destination_request

val make_delete_rule_request :
  ?force:bool -> ?event_bus_name:string -> name:string -> unit
-> delete_rule_request

val make_delete_partner_event_source_request :
  account:string -> name:string -> unit
-> delete_partner_event_source_request

val make_delete_event_bus_request : name:string -> unit
-> delete_event_bus_request

val make_delete_endpoint_response : unit
-> delete_endpoint_response

val make_delete_endpoint_request : name:string -> unit
-> delete_endpoint_request

val make_delete_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit -> delete_connection_response

val make_delete_connection_request : name:string -> unit
-> delete_connection_request

val make_delete_archive_response : unit
-> delete_archive_response

val make_delete_archive_request : archive_name:string -> unit
-> delete_archive_request

val make_delete_api_destination_response : unit
-> delete_api_destination_response

val make_delete_api_destination_request : name:string -> unit
-> delete_api_destination_request

val make_deauthorize_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit
-> deauthorize_connection_response

val make_deauthorize_connection_request : name:string -> unit
-> deauthorize_connection_request

val make_deactivate_event_source_request : name:string -> unit
-> deactivate_event_source_request

val make_create_partner_event_source_response :
  ?event_source_arn:string -> unit
-> create_partner_event_source_response

val make_create_partner_event_source_request :
  account:string -> name:string -> unit
-> create_partner_event_source_request

val make_create_event_bus_response :
  ?dead_letter_config:dead_letter_config ->
  ?kms_key_identifier:string ->
  ?description:string ->
  ?event_bus_arn:string ->
  unit -> create_event_bus_response

val make_create_event_bus_request :
  ?tags:tag list ->
  ?dead_letter_config:dead_letter_config ->
  ?kms_key_identifier:string ->
  ?description:string ->
  ?event_source_name:string ->
  name:string ->
  unit -> create_event_bus_request

val make_create_endpoint_response :
  ?state:endpoint_state ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?name:string ->
  unit -> create_endpoint_response

val make_create_endpoint_request :
  ?role_arn:string ->
  ?replication_config:replication_config ->
  ?description:string ->
  event_buses:endpoint_event_bus list ->
  routing_config:routing_config ->
  name:string ->
  unit -> create_endpoint_request

val make_create_connection_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit
-> create_connection_response

val make_create_connection_basic_auth_request_parameters :
  password:string -> username:string -> unit
-> create_connection_basic_auth_request_parameters

val make_create_connection_o_auth_client_request_parameters :
  client_secret:string -> client_i_d:string -> unit
-> create_connection_o_auth_client_request_parameters

val make_create_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  http_method:connection_o_auth_http_method ->
  authorization_endpoint:string ->
  client_parameters:create_connection_o_auth_client_request_parameters ->
  unit
-> create_connection_o_auth_request_parameters

val make_create_connection_api_key_auth_request_parameters :
  api_key_value:string -> api_key_name:string -> unit
-> create_connection_api_key_auth_request_parameters

val make_create_connection_auth_request_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:create_connection_api_key_auth_request_parameters ->
  ?o_auth_parameters:create_connection_o_auth_request_parameters ->
  ?basic_auth_parameters:create_connection_basic_auth_request_parameters ->
  unit
-> create_connection_auth_request_parameters

val make_create_connection_request :
  ?description:string ->
  auth_parameters:create_connection_auth_request_parameters ->
  authorization_type:connection_authorization_type ->
  name:string ->
  unit -> create_connection_request

val make_create_archive_response :
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?archive_arn:string ->
  unit -> create_archive_response

val make_create_archive_request :
  ?retention_days:int ->
  ?event_pattern:string ->
  ?description:string ->
  event_source_arn:string ->
  archive_name:string ->
  unit -> create_archive_request

val make_create_api_destination_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?api_destination_state:api_destination_state ->
  ?api_destination_arn:string ->
  unit
-> create_api_destination_response

val make_create_api_destination_request :
  ?invocation_rate_limit_per_second:int ->
  ?description:string ->
  http_method:api_destination_http_method ->
  invocation_endpoint:string ->
  connection_arn:string ->
  name:string ->
  unit -> create_api_destination_request

val make_cancel_replay_response :
  ?state_reason:string -> ?state:replay_state -> ?replay_arn:string -> unit
-> cancel_replay_response

val make_cancel_replay_request : replay_name:string -> unit
-> cancel_replay_request

val make_activate_event_source_request : name:string -> unit
-> activate_event_source_request

