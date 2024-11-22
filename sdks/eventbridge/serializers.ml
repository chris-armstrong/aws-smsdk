open Smaws_Lib.Json.SerializeHelpers

open Types

let string__to_yojson = string_to_yojson

let event_bus_name_to_yojson = string_to_yojson

let kms_key_identifier_to_yojson = string_to_yojson

let event_bus_description_to_yojson = string_to_yojson

let resource_arn_to_yojson = string_to_yojson

let dead_letter_config_to_yojson = 
  fun (x: dead_letter_config) -> assoc_to_yojson(
    [(
         "Arn",
         (option_to_yojson resource_arn_to_yojson x.arn));
       
  ])

let update_event_bus_response_to_yojson = 
  fun (x: update_event_bus_response) -> assoc_to_yojson(
    [(
         "DeadLetterConfig",
         (option_to_yojson dead_letter_config_to_yojson x.dead_letter_config));
       (
         "Description",
         (option_to_yojson event_bus_description_to_yojson x.description));
       (
         "KmsKeyIdentifier",
         (option_to_yojson kms_key_identifier_to_yojson x.kms_key_identifier));
       (
         "Name",
         (option_to_yojson event_bus_name_to_yojson x.name));
       (
         "Arn",
         (option_to_yojson string__to_yojson x.arn));
       
  ])

let update_event_bus_request_to_yojson = 
  fun (x: update_event_bus_request) -> assoc_to_yojson(
    [(
         "DeadLetterConfig",
         (option_to_yojson dead_letter_config_to_yojson x.dead_letter_config));
       (
         "Description",
         (option_to_yojson event_bus_description_to_yojson x.description));
       (
         "KmsKeyIdentifier",
         (option_to_yojson kms_key_identifier_to_yojson x.kms_key_identifier));
       (
         "Name",
         (option_to_yojson event_bus_name_to_yojson x.name));
       
  ])

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let operation_disabled_exception_to_yojson = 
  fun (x: operation_disabled_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let internal_exception_to_yojson = 
  fun (x: internal_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let concurrent_modification_exception_to_yojson = 
  fun (x: concurrent_modification_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let endpoint_name_to_yojson = string_to_yojson

let endpoint_arn_to_yojson = string_to_yojson

let health_check_to_yojson = string_to_yojson

let primary_to_yojson = 
  fun (x: primary) -> assoc_to_yojson(
    [(
         "HealthCheck",
         (Some (health_check_to_yojson x.health_check)));
       
  ])

let route_to_yojson = string_to_yojson

let secondary_to_yojson = 
  fun (x: secondary) -> assoc_to_yojson(
    [(
         "Route",
         (Some (route_to_yojson x.route)));
       
  ])

let failover_config_to_yojson = 
  fun (x: failover_config) -> assoc_to_yojson(
    [(
         "Secondary",
         (Some (secondary_to_yojson x.secondary)));
       (
         "Primary",
         (Some (primary_to_yojson x.primary)));
       
  ])

let routing_config_to_yojson = 
  fun (x: routing_config) -> assoc_to_yojson(
    [(
         "FailoverConfig",
         (Some (failover_config_to_yojson x.failover_config)));
       
  ])

let base_unit_to_yojson = unit_to_yojson

let replication_state_to_yojson = 
  fun (x: replication_state) -> match x with 
  | DISABLED -> `String "DISABLED"
    | ENABLED -> `String "ENABLED"
     

let replication_config_to_yojson = 
  fun (x: replication_config) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson replication_state_to_yojson x.state));
       
  ])

let non_partner_event_bus_arn_to_yojson = string_to_yojson

let endpoint_event_bus_to_yojson = 
  fun (x: endpoint_event_bus) -> assoc_to_yojson(
    [(
         "EventBusArn",
         (Some (non_partner_event_bus_arn_to_yojson x.event_bus_arn)));
       
  ])

let endpoint_event_bus_list_to_yojson = 
  fun tree -> list_to_yojson endpoint_event_bus_to_yojson tree

let iam_role_arn_to_yojson = string_to_yojson

let endpoint_id_to_yojson = string_to_yojson

let endpoint_url_to_yojson = string_to_yojson

let endpoint_state_to_yojson = 
  fun (x: endpoint_state) -> match x with 
 
| DELETE_FAILED -> `String "DELETE_FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
   

let update_endpoint_response_to_yojson = 
  fun (x: update_endpoint_response) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson endpoint_state_to_yojson x.state));
       (
         "EndpointUrl",
         (option_to_yojson endpoint_url_to_yojson x.endpoint_url));
       (
         "EndpointId",
         (option_to_yojson endpoint_id_to_yojson x.endpoint_id));
       (
         "RoleArn",
         (option_to_yojson iam_role_arn_to_yojson x.role_arn));
       (
         "EventBuses",
         (option_to_yojson endpoint_event_bus_list_to_yojson x.event_buses));
       (
         "ReplicationConfig",
         (option_to_yojson replication_config_to_yojson x.replication_config));
       (
         "RoutingConfig",
         (option_to_yojson routing_config_to_yojson x.routing_config));
       (
         "Arn",
         (option_to_yojson endpoint_arn_to_yojson x.arn));
       (
         "Name",
         (option_to_yojson endpoint_name_to_yojson x.name));
       
  ])

let endpoint_description_to_yojson = string_to_yojson

let update_endpoint_request_to_yojson = 
  fun (x: update_endpoint_request) -> assoc_to_yojson(
    [(
         "RoleArn",
         (option_to_yojson iam_role_arn_to_yojson x.role_arn));
       (
         "EventBuses",
         (option_to_yojson endpoint_event_bus_list_to_yojson x.event_buses));
       (
         "ReplicationConfig",
         (option_to_yojson replication_config_to_yojson x.replication_config));
       (
         "RoutingConfig",
         (option_to_yojson routing_config_to_yojson x.routing_config));
       (
         "Description",
         (option_to_yojson endpoint_description_to_yojson x.description));
       (
         "Name",
         (Some (endpoint_name_to_yojson x.name)));
       
  ])

let connection_arn_to_yojson = string_to_yojson

let connection_state_to_yojson = 
  fun (x: connection_state) -> match x with 
 
| DEAUTHORIZING -> `String "DEAUTHORIZING"
  | AUTHORIZING -> `String "AUTHORIZING"
  | DEAUTHORIZED -> `String "DEAUTHORIZED"
  | AUTHORIZED -> `String "AUTHORIZED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"
   

let timestamp__to_yojson = timestamp_to_yojson

let update_connection_response_to_yojson = 
  fun (x: update_connection_response) -> assoc_to_yojson(
    [(
         "LastAuthorizedTime",
         (option_to_yojson timestamp__to_yojson x.last_authorized_time));
       (
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "ConnectionState",
         (option_to_yojson connection_state_to_yojson x.connection_state));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       
  ])

let connection_name_to_yojson = string_to_yojson

let connection_description_to_yojson = string_to_yojson

let connection_authorization_type_to_yojson = 
  fun (x: connection_authorization_type) -> match x with 
 
| API_KEY -> `String "API_KEY"
  | OAUTH_CLIENT_CREDENTIALS -> `String "OAUTH_CLIENT_CREDENTIALS"
  | BASIC -> `String "BASIC"
   

let auth_header_parameters_to_yojson = string_to_yojson

let auth_header_parameters_sensitive_to_yojson = string_to_yojson

let update_connection_basic_auth_request_parameters_to_yojson = 
  fun (x: update_connection_basic_auth_request_parameters) -> assoc_to_yojson(
    [(
         "Password",
         (option_to_yojson auth_header_parameters_sensitive_to_yojson x.password));
       (
         "Username",
         (option_to_yojson auth_header_parameters_to_yojson x.username));
       
  ])

let update_connection_o_auth_client_request_parameters_to_yojson = 
  fun (x: update_connection_o_auth_client_request_parameters) -> assoc_to_yojson(
    [(
         "ClientSecret",
         (option_to_yojson auth_header_parameters_sensitive_to_yojson x.client_secret));
       (
         "ClientID",
         (option_to_yojson auth_header_parameters_to_yojson x.client_i_d));
       
  ])

let https_endpoint_to_yojson = string_to_yojson

let connection_o_auth_http_method_to_yojson = 
  fun (x: connection_o_auth_http_method) -> match x with 
  | PUT -> `String "PUT"
    | POST -> `String "POST"
    | GET -> `String "GET"
     

let header_key_to_yojson = string_to_yojson

let header_value_sensitive_to_yojson = string_to_yojson

let boolean__to_yojson = bool_to_yojson

let connection_header_parameter_to_yojson = 
  fun (x: connection_header_parameter) -> assoc_to_yojson(
    [(
         "IsValueSecret",
         (option_to_yojson boolean__to_yojson x.is_value_secret));
       (
         "Value",
         (option_to_yojson header_value_sensitive_to_yojson x.value));
       (
         "Key",
         (option_to_yojson header_key_to_yojson x.key));
       
  ])

let connection_header_parameters_list_to_yojson = 
  fun tree -> list_to_yojson connection_header_parameter_to_yojson tree

let query_string_key_to_yojson = string_to_yojson

let query_string_value_sensitive_to_yojson = string_to_yojson

let connection_query_string_parameter_to_yojson = 
  fun (x: connection_query_string_parameter) -> assoc_to_yojson(
    [(
         "IsValueSecret",
         (option_to_yojson boolean__to_yojson x.is_value_secret));
       (
         "Value",
         (option_to_yojson query_string_value_sensitive_to_yojson x.value));
       (
         "Key",
         (option_to_yojson query_string_key_to_yojson x.key));
       
  ])

let connection_query_string_parameters_list_to_yojson = 
  fun tree -> list_to_yojson connection_query_string_parameter_to_yojson tree

let sensitive_string_to_yojson = string_to_yojson

let connection_body_parameter_to_yojson = 
  fun (x: connection_body_parameter) -> assoc_to_yojson(
    [(
         "IsValueSecret",
         (option_to_yojson boolean__to_yojson x.is_value_secret));
       (
         "Value",
         (option_to_yojson sensitive_string_to_yojson x.value));
       (
         "Key",
         (option_to_yojson string__to_yojson x.key));
       
  ])

let connection_body_parameters_list_to_yojson = 
  fun tree -> list_to_yojson connection_body_parameter_to_yojson tree

let connection_http_parameters_to_yojson = 
  fun (x: connection_http_parameters) -> assoc_to_yojson(
    [(
         "BodyParameters",
         (option_to_yojson connection_body_parameters_list_to_yojson x.body_parameters));
       (
         "QueryStringParameters",
         (option_to_yojson connection_query_string_parameters_list_to_yojson x.query_string_parameters));
       (
         "HeaderParameters",
         (option_to_yojson connection_header_parameters_list_to_yojson x.header_parameters));
       
  ])

let update_connection_o_auth_request_parameters_to_yojson = 
  fun (x: update_connection_o_auth_request_parameters) -> assoc_to_yojson(
    [(
         "OAuthHttpParameters",
         (option_to_yojson connection_http_parameters_to_yojson x.o_auth_http_parameters));
       (
         "HttpMethod",
         (option_to_yojson connection_o_auth_http_method_to_yojson x.http_method));
       (
         "AuthorizationEndpoint",
         (option_to_yojson https_endpoint_to_yojson x.authorization_endpoint));
       (
         "ClientParameters",
         (option_to_yojson update_connection_o_auth_client_request_parameters_to_yojson x.client_parameters));
       
  ])

let update_connection_api_key_auth_request_parameters_to_yojson = 
  fun (x: update_connection_api_key_auth_request_parameters) -> assoc_to_yojson(
    [(
         "ApiKeyValue",
         (option_to_yojson auth_header_parameters_sensitive_to_yojson x.api_key_value));
       (
         "ApiKeyName",
         (option_to_yojson auth_header_parameters_to_yojson x.api_key_name));
       
  ])

let update_connection_auth_request_parameters_to_yojson = 
  fun (x: update_connection_auth_request_parameters) -> assoc_to_yojson(
    [(
         "InvocationHttpParameters",
         (option_to_yojson connection_http_parameters_to_yojson x.invocation_http_parameters));
       (
         "ApiKeyAuthParameters",
         (option_to_yojson update_connection_api_key_auth_request_parameters_to_yojson x.api_key_auth_parameters));
       (
         "OAuthParameters",
         (option_to_yojson update_connection_o_auth_request_parameters_to_yojson x.o_auth_parameters));
       (
         "BasicAuthParameters",
         (option_to_yojson update_connection_basic_auth_request_parameters_to_yojson x.basic_auth_parameters));
       
  ])

let update_connection_request_to_yojson = 
  fun (x: update_connection_request) -> assoc_to_yojson(
    [(
         "AuthParameters",
         (option_to_yojson update_connection_auth_request_parameters_to_yojson x.auth_parameters));
       (
         "AuthorizationType",
         (option_to_yojson connection_authorization_type_to_yojson x.authorization_type));
       (
         "Description",
         (option_to_yojson connection_description_to_yojson x.description));
       (
         "Name",
         (Some (connection_name_to_yojson x.name)));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let archive_arn_to_yojson = string_to_yojson

let archive_state_to_yojson = 
  fun (x: archive_state) -> match x with 
 
| UPDATE_FAILED -> `String "UPDATE_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
   

let archive_state_reason_to_yojson = string_to_yojson

let update_archive_response_to_yojson = 
  fun (x: update_archive_response) -> assoc_to_yojson(
    [(
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "StateReason",
         (option_to_yojson archive_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson archive_state_to_yojson x.state));
       (
         "ArchiveArn",
         (option_to_yojson archive_arn_to_yojson x.archive_arn));
       
  ])

let archive_name_to_yojson = string_to_yojson

let archive_description_to_yojson = string_to_yojson

let event_pattern_to_yojson = string_to_yojson

let retention_days_to_yojson = int_to_yojson

let update_archive_request_to_yojson = 
  fun (x: update_archive_request) -> assoc_to_yojson(
    [(
         "RetentionDays",
         (option_to_yojson retention_days_to_yojson x.retention_days));
       (
         "EventPattern",
         (option_to_yojson event_pattern_to_yojson x.event_pattern));
       (
         "Description",
         (option_to_yojson archive_description_to_yojson x.description));
       (
         "ArchiveName",
         (Some (archive_name_to_yojson x.archive_name)));
       
  ])

let invalid_event_pattern_exception_to_yojson = 
  fun (x: invalid_event_pattern_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let api_destination_arn_to_yojson = string_to_yojson

let api_destination_state_to_yojson = 
  fun (x: api_destination_state) -> match x with 
  | INACTIVE -> `String "INACTIVE"
    | ACTIVE -> `String "ACTIVE"
     

let update_api_destination_response_to_yojson = 
  fun (x: update_api_destination_response) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "ApiDestinationState",
         (option_to_yojson api_destination_state_to_yojson x.api_destination_state));
       (
         "ApiDestinationArn",
         (option_to_yojson api_destination_arn_to_yojson x.api_destination_arn));
       
  ])

let api_destination_name_to_yojson = string_to_yojson

let api_destination_description_to_yojson = string_to_yojson

let api_destination_http_method_to_yojson = 
  fun (x: api_destination_http_method) -> match x with 
 
| DELETE -> `String "DELETE"
  | PATCH -> `String "PATCH"
  | PUT -> `String "PUT"
  | OPTIONS -> `String "OPTIONS"
  | HEAD -> `String "HEAD"
  | GET -> `String "GET"
  | POST -> `String "POST"
   

let api_destination_invocation_rate_limit_per_second_to_yojson = 
  int_to_yojson

let update_api_destination_request_to_yojson = 
  fun (x: update_api_destination_request) -> assoc_to_yojson(
    [(
         "InvocationRateLimitPerSecond",
         (option_to_yojson api_destination_invocation_rate_limit_per_second_to_yojson x.invocation_rate_limit_per_second));
       (
         "HttpMethod",
         (option_to_yojson api_destination_http_method_to_yojson x.http_method));
       (
         "InvocationEndpoint",
         (option_to_yojson https_endpoint_to_yojson x.invocation_endpoint));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       (
         "Description",
         (option_to_yojson api_destination_description_to_yojson x.description));
       (
         "Name",
         (Some (api_destination_name_to_yojson x.name)));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let arn_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceARN",
         (Some (arn_to_yojson x.resource_ar_n)));
       
  ])

let managed_rule_exception_to_yojson = 
  fun (x: managed_rule_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let target_input_path_to_yojson = string_to_yojson

let input_transformer_path_key_to_yojson = string_to_yojson

let transformer_paths_to_yojson = 
  fun tree -> map_to_yojson target_input_path_to_yojson tree

let transformer_input_to_yojson = string_to_yojson

let trace_header_to_yojson = string_to_yojson

let test_event_pattern_response_to_yojson = 
  fun (x: test_event_pattern_response) -> assoc_to_yojson(
    [(
         "Result",
         (option_to_yojson boolean__to_yojson x.result));
       
  ])

let test_event_pattern_request_to_yojson = 
  fun (x: test_event_pattern_request) -> assoc_to_yojson(
    [(
         "Event",
         (Some (string__to_yojson x.event)));
       (
         "EventPattern",
         (Some (event_pattern_to_yojson x.event_pattern)));
       
  ])

let target_partition_key_path_to_yojson = string_to_yojson

let target_id_to_yojson = string_to_yojson

let target_arn_to_yojson = string_to_yojson

let role_arn_to_yojson = string_to_yojson

let target_input_to_yojson = string_to_yojson

let input_transformer_to_yojson = 
  fun (x: input_transformer) -> assoc_to_yojson(
    [(
         "InputTemplate",
         (Some (transformer_input_to_yojson x.input_template)));
       (
         "InputPathsMap",
         (option_to_yojson transformer_paths_to_yojson x.input_paths_map));
       
  ])

let kinesis_parameters_to_yojson = 
  fun (x: kinesis_parameters) -> assoc_to_yojson(
    [(
         "PartitionKeyPath",
         (Some (target_partition_key_path_to_yojson x.partition_key_path)));
       
  ])

let run_command_target_key_to_yojson = string_to_yojson

let run_command_target_value_to_yojson = string_to_yojson

let run_command_target_values_to_yojson = 
  fun tree -> list_to_yojson run_command_target_value_to_yojson tree

let run_command_target_to_yojson = 
  fun (x: run_command_target) -> assoc_to_yojson(
    [(
         "Values",
         (Some (run_command_target_values_to_yojson x.values)));
       (
         "Key",
         (Some (run_command_target_key_to_yojson x.key)));
       
  ])

let run_command_targets_to_yojson = 
  fun tree -> list_to_yojson run_command_target_to_yojson tree

let run_command_parameters_to_yojson = 
  fun (x: run_command_parameters) -> assoc_to_yojson(
    [(
         "RunCommandTargets",
         (Some (run_command_targets_to_yojson x.run_command_targets)));
       
  ])

let limit_min1_to_yojson = int_to_yojson

let launch_type_to_yojson = 
  fun (x: launch_type) -> match x with 
 
| EXTERNAL -> `String "EXTERNAL"
  | FARGATE -> `String "FARGATE"
  | EC2 -> `String "EC2"
   

let string_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let assign_public_ip_to_yojson = 
  fun (x: assign_public_ip) -> match x with 
  | DISABLED -> `String "DISABLED"
    | ENABLED -> `String "ENABLED"
     

let aws_vpc_configuration_to_yojson = 
  fun (x: aws_vpc_configuration) -> assoc_to_yojson(
    [(
         "AssignPublicIp",
         (option_to_yojson assign_public_ip_to_yojson x.assign_public_ip));
       (
         "SecurityGroups",
         (option_to_yojson string_list_to_yojson x.security_groups));
       (
         "Subnets",
         (Some (string_list_to_yojson x.subnets)));
       
  ])

let network_configuration_to_yojson = 
  fun (x: network_configuration) -> assoc_to_yojson(
    [(
         "awsvpcConfiguration",
         (option_to_yojson aws_vpc_configuration_to_yojson x.awsvpc_configuration));
       
  ])

let capacity_provider_to_yojson = string_to_yojson

let capacity_provider_strategy_item_weight_to_yojson = int_to_yojson

let capacity_provider_strategy_item_base_to_yojson = int_to_yojson

let capacity_provider_strategy_item_to_yojson = 
  fun (x: capacity_provider_strategy_item) -> assoc_to_yojson(
    [(
         "base",
         (option_to_yojson capacity_provider_strategy_item_base_to_yojson x.base));
       (
         "weight",
         (option_to_yojson capacity_provider_strategy_item_weight_to_yojson x.weight));
       (
         "capacityProvider",
         (Some (capacity_provider_to_yojson x.capacity_provider)));
       
  ])

let capacity_provider_strategy_to_yojson = 
  fun tree -> list_to_yojson capacity_provider_strategy_item_to_yojson tree

let placement_constraint_type_to_yojson = 
  fun (x: placement_constraint_type) -> match x with 
 
| MEMBER_OF -> `String "memberOf"
  | DISTINCT_INSTANCE -> `String "distinctInstance"
   

let placement_constraint_expression_to_yojson = string_to_yojson

let placement_constraint_to_yojson = 
  fun (x: placement_constraint) -> assoc_to_yojson(
    [(
         "expression",
         (option_to_yojson placement_constraint_expression_to_yojson x.expression));
       (
         "type",
         (option_to_yojson placement_constraint_type_to_yojson x.type_));
       
  ])

let placement_constraints_to_yojson = 
  fun tree -> list_to_yojson placement_constraint_to_yojson tree

let placement_strategy_type_to_yojson = 
  fun (x: placement_strategy_type) -> match x with 
 
| BINPACK -> `String "binpack"
  | SPREAD -> `String "spread"
  | RANDOM -> `String "random"
   

let placement_strategy_field_to_yojson = string_to_yojson

let placement_strategy_to_yojson = 
  fun (x: placement_strategy) -> assoc_to_yojson(
    [(
         "field",
         (option_to_yojson placement_strategy_field_to_yojson x.field));
       (
         "type",
         (option_to_yojson placement_strategy_type_to_yojson x.type_));
       
  ])

let placement_strategies_to_yojson = 
  fun tree -> list_to_yojson placement_strategy_to_yojson tree

let propagate_tags_to_yojson = 
  fun (x: propagate_tags) -> match x with 
  | TASK_DEFINITION -> `String "TASK_DEFINITION"
     

let reference_id_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (Some (tag_value_to_yojson x.value)));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let ecs_parameters_to_yojson = 
  fun (x: ecs_parameters) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ReferenceId",
         (option_to_yojson reference_id_to_yojson x.reference_id));
       (
         "PropagateTags",
         (option_to_yojson propagate_tags_to_yojson x.propagate_tags));
       (
         "PlacementStrategy",
         (option_to_yojson placement_strategies_to_yojson x.placement_strategy));
       (
         "PlacementConstraints",
         (option_to_yojson placement_constraints_to_yojson x.placement_constraints));
       (
         "EnableExecuteCommand",
         (option_to_yojson boolean__to_yojson x.enable_execute_command));
       (
         "EnableECSManagedTags",
         (option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags));
       (
         "CapacityProviderStrategy",
         (option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy));
       (
         "Group",
         (option_to_yojson string__to_yojson x.group));
       (
         "PlatformVersion",
         (option_to_yojson string__to_yojson x.platform_version));
       (
         "NetworkConfiguration",
         (option_to_yojson network_configuration_to_yojson x.network_configuration));
       (
         "LaunchType",
         (option_to_yojson launch_type_to_yojson x.launch_type));
       (
         "TaskCount",
         (option_to_yojson limit_min1_to_yojson x.task_count));
       (
         "TaskDefinitionArn",
         (Some (arn_to_yojson x.task_definition_arn)));
       
  ])

let integer__to_yojson = int_to_yojson

let batch_array_properties_to_yojson = 
  fun (x: batch_array_properties) -> assoc_to_yojson(
    [(
         "Size",
         (option_to_yojson integer__to_yojson x.size));
       
  ])

let batch_retry_strategy_to_yojson = 
  fun (x: batch_retry_strategy) -> assoc_to_yojson(
    [(
         "Attempts",
         (option_to_yojson integer__to_yojson x.attempts));
       
  ])

let batch_parameters_to_yojson = 
  fun (x: batch_parameters) -> assoc_to_yojson(
    [(
         "RetryStrategy",
         (option_to_yojson batch_retry_strategy_to_yojson x.retry_strategy));
       (
         "ArrayProperties",
         (option_to_yojson batch_array_properties_to_yojson x.array_properties));
       (
         "JobName",
         (Some (string__to_yojson x.job_name)));
       (
         "JobDefinition",
         (Some (string__to_yojson x.job_definition)));
       
  ])

let message_group_id_to_yojson = string_to_yojson

let sqs_parameters_to_yojson = 
  fun (x: sqs_parameters) -> assoc_to_yojson(
    [(
         "MessageGroupId",
         (option_to_yojson message_group_id_to_yojson x.message_group_id));
       
  ])

let path_parameter_to_yojson = string_to_yojson

let path_parameter_list_to_yojson = 
  fun tree -> list_to_yojson path_parameter_to_yojson tree

let header_value_to_yojson = string_to_yojson

let header_parameters_map_to_yojson = 
  fun tree -> map_to_yojson header_value_to_yojson tree

let query_string_value_to_yojson = string_to_yojson

let query_string_parameters_map_to_yojson = 
  fun tree -> map_to_yojson query_string_value_to_yojson tree

let http_parameters_to_yojson = 
  fun (x: http_parameters) -> assoc_to_yojson(
    [(
         "QueryStringParameters",
         (option_to_yojson query_string_parameters_map_to_yojson x.query_string_parameters));
       (
         "HeaderParameters",
         (option_to_yojson header_parameters_map_to_yojson x.header_parameters));
       (
         "PathParameterValues",
         (option_to_yojson path_parameter_list_to_yojson x.path_parameter_values));
       
  ])

let redshift_secret_manager_arn_to_yojson = string_to_yojson

let database_to_yojson = string_to_yojson

let db_user_to_yojson = string_to_yojson

let sql_to_yojson = string_to_yojson

let statement_name_to_yojson = string_to_yojson

let sqls_to_yojson = fun tree -> list_to_yojson sql_to_yojson tree

let redshift_data_parameters_to_yojson = 
  fun (x: redshift_data_parameters) -> assoc_to_yojson(
    [(
         "Sqls",
         (option_to_yojson sqls_to_yojson x.sqls));
       (
         "WithEvent",
         (option_to_yojson boolean__to_yojson x.with_event));
       (
         "StatementName",
         (option_to_yojson statement_name_to_yojson x.statement_name));
       (
         "Sql",
         (option_to_yojson sql_to_yojson x.sql));
       (
         "DbUser",
         (option_to_yojson db_user_to_yojson x.db_user));
       (
         "Database",
         (Some (database_to_yojson x.database)));
       (
         "SecretManagerArn",
         (option_to_yojson redshift_secret_manager_arn_to_yojson x.secret_manager_arn));
       
  ])

let sage_maker_pipeline_parameter_name_to_yojson = string_to_yojson

let sage_maker_pipeline_parameter_value_to_yojson = string_to_yojson

let sage_maker_pipeline_parameter_to_yojson = 
  fun (x: sage_maker_pipeline_parameter) -> assoc_to_yojson(
    [(
         "Value",
         (Some (sage_maker_pipeline_parameter_value_to_yojson x.value)));
       (
         "Name",
         (Some (sage_maker_pipeline_parameter_name_to_yojson x.name)));
       
  ])

let sage_maker_pipeline_parameter_list_to_yojson = 
  fun tree -> list_to_yojson sage_maker_pipeline_parameter_to_yojson tree

let sage_maker_pipeline_parameters_to_yojson = 
  fun (x: sage_maker_pipeline_parameters) -> assoc_to_yojson(
    [(
         "PipelineParameterList",
         (option_to_yojson sage_maker_pipeline_parameter_list_to_yojson x.pipeline_parameter_list));
       
  ])

let maximum_retry_attempts_to_yojson = int_to_yojson

let maximum_event_age_in_seconds_to_yojson = int_to_yojson

let retry_policy_to_yojson = 
  fun (x: retry_policy) -> assoc_to_yojson(
    [(
         "MaximumEventAgeInSeconds",
         (option_to_yojson maximum_event_age_in_seconds_to_yojson x.maximum_event_age_in_seconds));
       (
         "MaximumRetryAttempts",
         (option_to_yojson maximum_retry_attempts_to_yojson x.maximum_retry_attempts));
       
  ])

let graph_ql_operation_to_yojson = string_to_yojson

let app_sync_parameters_to_yojson = 
  fun (x: app_sync_parameters) -> assoc_to_yojson(
    [(
         "GraphQLOperation",
         (option_to_yojson graph_ql_operation_to_yojson x.graph_ql_operation));
       
  ])

let target_to_yojson = 
  fun (x: target) -> assoc_to_yojson(
    [(
         "AppSyncParameters",
         (option_to_yojson app_sync_parameters_to_yojson x.app_sync_parameters));
       (
         "RetryPolicy",
         (option_to_yojson retry_policy_to_yojson x.retry_policy));
       (
         "DeadLetterConfig",
         (option_to_yojson dead_letter_config_to_yojson x.dead_letter_config));
       (
         "SageMakerPipelineParameters",
         (option_to_yojson sage_maker_pipeline_parameters_to_yojson x.sage_maker_pipeline_parameters));
       (
         "RedshiftDataParameters",
         (option_to_yojson redshift_data_parameters_to_yojson x.redshift_data_parameters));
       (
         "HttpParameters",
         (option_to_yojson http_parameters_to_yojson x.http_parameters));
       (
         "SqsParameters",
         (option_to_yojson sqs_parameters_to_yojson x.sqs_parameters));
       (
         "BatchParameters",
         (option_to_yojson batch_parameters_to_yojson x.batch_parameters));
       (
         "EcsParameters",
         (option_to_yojson ecs_parameters_to_yojson x.ecs_parameters));
       (
         "RunCommandParameters",
         (option_to_yojson run_command_parameters_to_yojson x.run_command_parameters));
       (
         "KinesisParameters",
         (option_to_yojson kinesis_parameters_to_yojson x.kinesis_parameters));
       (
         "InputTransformer",
         (option_to_yojson input_transformer_to_yojson x.input_transformer));
       (
         "InputPath",
         (option_to_yojson target_input_path_to_yojson x.input_path));
       (
         "Input",
         (option_to_yojson target_input_to_yojson x.input));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Arn",
         (Some (target_arn_to_yojson x.arn)));
       (
         "Id",
         (Some (target_id_to_yojson x.id)));
       
  ])

let target_list_to_yojson = 
  fun tree -> list_to_yojson target_to_yojson tree

let target_id_list_to_yojson = 
  fun tree -> list_to_yojson target_id_to_yojson tree

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceARN",
         (Some (arn_to_yojson x.resource_ar_n)));
       
  ])

let statement_id_to_yojson = string_to_yojson

let replay_arn_to_yojson = string_to_yojson

let replay_state_to_yojson = 
  fun (x: replay_state) -> match x with 
 
| FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"
  | COMPLETED -> `String "COMPLETED"
  | CANCELLING -> `String "CANCELLING"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"
   

let replay_state_reason_to_yojson = string_to_yojson

let start_replay_response_to_yojson = 
  fun (x: start_replay_response) -> assoc_to_yojson(
    [(
         "ReplayStartTime",
         (option_to_yojson timestamp__to_yojson x.replay_start_time));
       (
         "StateReason",
         (option_to_yojson replay_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson replay_state_to_yojson x.state));
       (
         "ReplayArn",
         (option_to_yojson replay_arn_to_yojson x.replay_arn));
       
  ])

let replay_name_to_yojson = string_to_yojson

let replay_description_to_yojson = string_to_yojson

let replay_destination_filters_to_yojson = 
  fun tree -> list_to_yojson arn_to_yojson tree

let replay_destination_to_yojson = 
  fun (x: replay_destination) -> assoc_to_yojson(
    [(
         "FilterArns",
         (option_to_yojson replay_destination_filters_to_yojson x.filter_arns));
       (
         "Arn",
         (Some (arn_to_yojson x.arn)));
       
  ])

let start_replay_request_to_yojson = 
  fun (x: start_replay_request) -> assoc_to_yojson(
    [(
         "Destination",
         (Some (replay_destination_to_yojson x.destination)));
       (
         "EventEndTime",
         (Some (timestamp__to_yojson x.event_end_time)));
       (
         "EventStartTime",
         (Some (timestamp__to_yojson x.event_start_time)));
       (
         "EventSourceArn",
         (Some (arn_to_yojson x.event_source_arn)));
       (
         "Description",
         (option_to_yojson replay_description_to_yojson x.description));
       (
         "ReplayName",
         (Some (replay_name_to_yojson x.replay_name)));
       
  ])

let resource_already_exists_exception_to_yojson = 
  fun (x: resource_already_exists_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let secrets_manager_secret_arn_to_yojson = string_to_yojson

let schedule_expression_to_yojson = string_to_yojson

let rule_state_to_yojson = 
  fun (x: rule_state) -> match x with 
 
| ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS -> `String "ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS"
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
   

let rule_name_to_yojson = string_to_yojson

let rule_arn_to_yojson = string_to_yojson

let rule_description_to_yojson = string_to_yojson

let managed_by_to_yojson = string_to_yojson

let rule_to_yojson = 
  fun (x: rule) -> assoc_to_yojson(
    [(
         "EventBusName",
         (option_to_yojson event_bus_name_to_yojson x.event_bus_name));
       (
         "ManagedBy",
         (option_to_yojson managed_by_to_yojson x.managed_by));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "ScheduleExpression",
         (option_to_yojson schedule_expression_to_yojson x.schedule_expression));
       (
         "Description",
         (option_to_yojson rule_description_to_yojson x.description));
       (
         "State",
         (option_to_yojson rule_state_to_yojson x.state));
       (
         "EventPattern",
         (option_to_yojson event_pattern_to_yojson x.event_pattern));
       (
         "Arn",
         (option_to_yojson rule_arn_to_yojson x.arn));
       (
         "Name",
         (option_to_yojson rule_name_to_yojson x.name));
       
  ])

let rule_response_list_to_yojson = 
  fun tree -> list_to_yojson rule_to_yojson tree

let rule_name_list_to_yojson = 
  fun tree -> list_to_yojson rule_name_to_yojson tree

let replay_to_yojson = 
  fun (x: replay) -> assoc_to_yojson(
    [(
         "ReplayEndTime",
         (option_to_yojson timestamp__to_yojson x.replay_end_time));
       (
         "ReplayStartTime",
         (option_to_yojson timestamp__to_yojson x.replay_start_time));
       (
         "EventLastReplayedTime",
         (option_to_yojson timestamp__to_yojson x.event_last_replayed_time));
       (
         "EventEndTime",
         (option_to_yojson timestamp__to_yojson x.event_end_time));
       (
         "EventStartTime",
         (option_to_yojson timestamp__to_yojson x.event_start_time));
       (
         "StateReason",
         (option_to_yojson replay_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson replay_state_to_yojson x.state));
       (
         "EventSourceArn",
         (option_to_yojson arn_to_yojson x.event_source_arn));
       (
         "ReplayName",
         (option_to_yojson replay_name_to_yojson x.replay_name));
       
  ])

let replay_list_to_yojson = 
  fun tree -> list_to_yojson replay_to_yojson tree

let error_code_to_yojson = string_to_yojson

let remove_targets_result_entry_to_yojson = 
  fun (x: remove_targets_result_entry) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "TargetId",
         (option_to_yojson target_id_to_yojson x.target_id));
       
  ])

let remove_targets_result_entry_list_to_yojson = 
  fun tree -> list_to_yojson remove_targets_result_entry_to_yojson tree

let remove_targets_response_to_yojson = 
  fun (x: remove_targets_response) -> assoc_to_yojson(
    [(
         "FailedEntries",
         (option_to_yojson remove_targets_result_entry_list_to_yojson x.failed_entries));
       (
         "FailedEntryCount",
         (option_to_yojson integer__to_yojson x.failed_entry_count));
       
  ])

let event_bus_name_or_arn_to_yojson = string_to_yojson

let remove_targets_request_to_yojson = 
  fun (x: remove_targets_request) -> assoc_to_yojson(
    [(
         "Force",
         (option_to_yojson boolean__to_yojson x.force));
       (
         "Ids",
         (Some (target_id_list_to_yojson x.ids)));
       (
         "EventBusName",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "Rule",
         (Some (rule_name_to_yojson x.rule)));
       
  ])

let non_partner_event_bus_name_to_yojson = string_to_yojson

let remove_permission_request_to_yojson = 
  fun (x: remove_permission_request) -> assoc_to_yojson(
    [(
         "EventBusName",
         (option_to_yojson non_partner_event_bus_name_to_yojson x.event_bus_name));
       (
         "RemoveAllPermissions",
         (option_to_yojson boolean__to_yojson x.remove_all_permissions));
       (
         "StatementId",
         (option_to_yojson statement_id_to_yojson x.statement_id));
       
  ])

let put_targets_result_entry_to_yojson = 
  fun (x: put_targets_result_entry) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "TargetId",
         (option_to_yojson target_id_to_yojson x.target_id));
       
  ])

let put_targets_result_entry_list_to_yojson = 
  fun tree -> list_to_yojson put_targets_result_entry_to_yojson tree

let put_targets_response_to_yojson = 
  fun (x: put_targets_response) -> assoc_to_yojson(
    [(
         "FailedEntries",
         (option_to_yojson put_targets_result_entry_list_to_yojson x.failed_entries));
       (
         "FailedEntryCount",
         (option_to_yojson integer__to_yojson x.failed_entry_count));
       
  ])

let put_targets_request_to_yojson = 
  fun (x: put_targets_request) -> assoc_to_yojson(
    [(
         "Targets",
         (Some (target_list_to_yojson x.targets)));
       (
         "EventBusName",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "Rule",
         (Some (rule_name_to_yojson x.rule)));
       
  ])

let put_rule_response_to_yojson = 
  fun (x: put_rule_response) -> assoc_to_yojson(
    [(
         "RuleArn",
         (option_to_yojson rule_arn_to_yojson x.rule_arn));
       
  ])

let put_rule_request_to_yojson = 
  fun (x: put_rule_request) -> assoc_to_yojson(
    [(
         "EventBusName",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Description",
         (option_to_yojson rule_description_to_yojson x.description));
       (
         "State",
         (option_to_yojson rule_state_to_yojson x.state));
       (
         "EventPattern",
         (option_to_yojson event_pattern_to_yojson x.event_pattern));
       (
         "ScheduleExpression",
         (option_to_yojson schedule_expression_to_yojson x.schedule_expression));
       (
         "Name",
         (Some (rule_name_to_yojson x.name)));
       
  ])

let action_to_yojson = string_to_yojson

let principal_to_yojson = string_to_yojson

let condition_to_yojson = 
  fun (x: condition) -> assoc_to_yojson(
    [(
         "Value",
         (Some (string__to_yojson x.value)));
       (
         "Key",
         (Some (string__to_yojson x.key)));
       (
         "Type",
         (Some (string__to_yojson x.type_)));
       
  ])

let put_permission_request_to_yojson = 
  fun (x: put_permission_request) -> assoc_to_yojson(
    [(
         "Policy",
         (option_to_yojson string__to_yojson x.policy));
       (
         "Condition",
         (option_to_yojson condition_to_yojson x.condition));
       (
         "StatementId",
         (option_to_yojson statement_id_to_yojson x.statement_id));
       (
         "Principal",
         (option_to_yojson principal_to_yojson x.principal));
       (
         "Action",
         (option_to_yojson action_to_yojson x.action));
       (
         "EventBusName",
         (option_to_yojson non_partner_event_bus_name_to_yojson x.event_bus_name));
       
  ])

let policy_length_exceeded_exception_to_yojson = 
  fun (x: policy_length_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let event_id_to_yojson = string_to_yojson

let put_partner_events_result_entry_to_yojson = 
  fun (x: put_partner_events_result_entry) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "EventId",
         (option_to_yojson event_id_to_yojson x.event_id));
       
  ])

let put_partner_events_result_entry_list_to_yojson = 
  fun tree -> list_to_yojson put_partner_events_result_entry_to_yojson tree

let put_partner_events_response_to_yojson = 
  fun (x: put_partner_events_response) -> assoc_to_yojson(
    [(
         "Entries",
         (option_to_yojson put_partner_events_result_entry_list_to_yojson x.entries));
       (
         "FailedEntryCount",
         (option_to_yojson integer__to_yojson x.failed_entry_count));
       
  ])

let event_time_to_yojson = timestamp_to_yojson

let event_source_name_to_yojson = string_to_yojson

let event_resource_to_yojson = string_to_yojson

let event_resource_list_to_yojson = 
  fun tree -> list_to_yojson event_resource_to_yojson tree

let put_partner_events_request_entry_to_yojson = 
  fun (x: put_partner_events_request_entry) -> assoc_to_yojson(
    [(
         "Detail",
         (option_to_yojson string__to_yojson x.detail));
       (
         "DetailType",
         (option_to_yojson string__to_yojson x.detail_type));
       (
         "Resources",
         (option_to_yojson event_resource_list_to_yojson x.resources));
       (
         "Source",
         (option_to_yojson event_source_name_to_yojson x.source));
       (
         "Time",
         (option_to_yojson event_time_to_yojson x.time));
       
  ])

let put_partner_events_request_entry_list_to_yojson = 
  fun tree -> list_to_yojson put_partner_events_request_entry_to_yojson tree

let put_partner_events_request_to_yojson = 
  fun (x: put_partner_events_request) -> assoc_to_yojson(
    [(
         "Entries",
         (Some (put_partner_events_request_entry_list_to_yojson x.entries)));
       
  ])

let put_events_result_entry_to_yojson = 
  fun (x: put_events_result_entry) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "EventId",
         (option_to_yojson event_id_to_yojson x.event_id));
       
  ])

let put_events_result_entry_list_to_yojson = 
  fun tree -> list_to_yojson put_events_result_entry_to_yojson tree

let put_events_response_to_yojson = 
  fun (x: put_events_response) -> assoc_to_yojson(
    [(
         "Entries",
         (option_to_yojson put_events_result_entry_list_to_yojson x.entries));
       (
         "FailedEntryCount",
         (option_to_yojson integer__to_yojson x.failed_entry_count));
       
  ])

let non_partner_event_bus_name_or_arn_to_yojson = string_to_yojson

let put_events_request_entry_to_yojson = 
  fun (x: put_events_request_entry) -> assoc_to_yojson(
    [(
         "TraceHeader",
         (option_to_yojson trace_header_to_yojson x.trace_header));
       (
         "EventBusName",
         (option_to_yojson non_partner_event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "Detail",
         (option_to_yojson string__to_yojson x.detail));
       (
         "DetailType",
         (option_to_yojson string__to_yojson x.detail_type));
       (
         "Resources",
         (option_to_yojson event_resource_list_to_yojson x.resources));
       (
         "Source",
         (option_to_yojson string__to_yojson x.source));
       (
         "Time",
         (option_to_yojson event_time_to_yojson x.time));
       
  ])

let put_events_request_entry_list_to_yojson = 
  fun tree -> list_to_yojson put_events_request_entry_to_yojson tree

let put_events_request_to_yojson = 
  fun (x: put_events_request) -> assoc_to_yojson(
    [(
         "EndpointId",
         (option_to_yojson endpoint_id_to_yojson x.endpoint_id));
       (
         "Entries",
         (Some (put_events_request_entry_list_to_yojson x.entries)));
       
  ])

let partner_event_source_name_prefix_to_yojson = string_to_yojson

let partner_event_source_to_yojson = 
  fun (x: partner_event_source) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson string__to_yojson x.name));
       (
         "Arn",
         (option_to_yojson string__to_yojson x.arn));
       
  ])

let partner_event_source_list_to_yojson = 
  fun tree -> list_to_yojson partner_event_source_to_yojson tree

let account_id_to_yojson = string_to_yojson

let event_source_state_to_yojson = 
  fun (x: event_source_state) -> match x with 
 
| DELETED -> `String "DELETED"
  | ACTIVE -> `String "ACTIVE"
  | PENDING -> `String "PENDING"
   

let partner_event_source_account_to_yojson = 
  fun (x: partner_event_source_account) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson event_source_state_to_yojson x.state));
       (
         "ExpirationTime",
         (option_to_yojson timestamp__to_yojson x.expiration_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "Account",
         (option_to_yojson account_id_to_yojson x.account));
       
  ])

let partner_event_source_account_list_to_yojson = 
  fun tree -> list_to_yojson partner_event_source_account_to_yojson tree

let next_token_to_yojson = string_to_yojson

let long_to_yojson = long_to_yojson

let list_targets_by_rule_response_to_yojson = 
  fun (x: list_targets_by_rule_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Targets",
         (option_to_yojson target_list_to_yojson x.targets));
       
  ])

let limit_max100_to_yojson = int_to_yojson

let list_targets_by_rule_request_to_yojson = 
  fun (x: list_targets_by_rule_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EventBusName",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "Rule",
         (Some (rule_name_to_yojson x.rule)));
       
  ])

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (arn_to_yojson x.resource_ar_n)));
       
  ])

let list_rules_response_to_yojson = 
  fun (x: list_rules_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Rules",
         (option_to_yojson rule_response_list_to_yojson x.rules));
       
  ])

let list_rules_request_to_yojson = 
  fun (x: list_rules_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EventBusName",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "NamePrefix",
         (option_to_yojson rule_name_to_yojson x.name_prefix));
       
  ])

let list_rule_names_by_target_response_to_yojson = 
  fun (x: list_rule_names_by_target_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "RuleNames",
         (option_to_yojson rule_name_list_to_yojson x.rule_names));
       
  ])

let list_rule_names_by_target_request_to_yojson = 
  fun (x: list_rule_names_by_target_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EventBusName",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "TargetArn",
         (Some (target_arn_to_yojson x.target_arn)));
       
  ])

let list_replays_response_to_yojson = 
  fun (x: list_replays_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Replays",
         (option_to_yojson replay_list_to_yojson x.replays));
       
  ])

let list_replays_request_to_yojson = 
  fun (x: list_replays_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EventSourceArn",
         (option_to_yojson arn_to_yojson x.event_source_arn));
       (
         "State",
         (option_to_yojson replay_state_to_yojson x.state));
       (
         "NamePrefix",
         (option_to_yojson replay_name_to_yojson x.name_prefix));
       
  ])

let list_partner_event_sources_response_to_yojson = 
  fun (x: list_partner_event_sources_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "PartnerEventSources",
         (option_to_yojson partner_event_source_list_to_yojson x.partner_event_sources));
       
  ])

let list_partner_event_sources_request_to_yojson = 
  fun (x: list_partner_event_sources_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "NamePrefix",
         (Some (partner_event_source_name_prefix_to_yojson x.name_prefix)));
       
  ])

let list_partner_event_source_accounts_response_to_yojson = 
  fun (x: list_partner_event_source_accounts_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "PartnerEventSourceAccounts",
         (option_to_yojson partner_event_source_account_list_to_yojson x.partner_event_source_accounts));
       
  ])

let list_partner_event_source_accounts_request_to_yojson = 
  fun (x: list_partner_event_source_accounts_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EventSourceName",
         (Some (event_source_name_to_yojson x.event_source_name)));
       
  ])

let event_source_to_yojson = 
  fun (x: event_source) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson event_source_state_to_yojson x.state));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       (
         "ExpirationTime",
         (option_to_yojson timestamp__to_yojson x.expiration_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "CreatedBy",
         (option_to_yojson string__to_yojson x.created_by));
       (
         "Arn",
         (option_to_yojson string__to_yojson x.arn));
       
  ])

let event_source_list_to_yojson = 
  fun tree -> list_to_yojson event_source_to_yojson tree

let list_event_sources_response_to_yojson = 
  fun (x: list_event_sources_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EventSources",
         (option_to_yojson event_source_list_to_yojson x.event_sources));
       
  ])

let event_source_name_prefix_to_yojson = string_to_yojson

let list_event_sources_request_to_yojson = 
  fun (x: list_event_sources_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "NamePrefix",
         (option_to_yojson event_source_name_prefix_to_yojson x.name_prefix));
       
  ])

let event_bus_to_yojson = 
  fun (x: event_bus) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "Policy",
         (option_to_yojson string__to_yojson x.policy));
       (
         "Description",
         (option_to_yojson event_bus_description_to_yojson x.description));
       (
         "Arn",
         (option_to_yojson string__to_yojson x.arn));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let event_bus_list_to_yojson = 
  fun tree -> list_to_yojson event_bus_to_yojson tree

let list_event_buses_response_to_yojson = 
  fun (x: list_event_buses_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EventBuses",
         (option_to_yojson event_bus_list_to_yojson x.event_buses));
       
  ])

let list_event_buses_request_to_yojson = 
  fun (x: list_event_buses_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "NamePrefix",
         (option_to_yojson event_bus_name_to_yojson x.name_prefix));
       
  ])

let endpoint_state_reason_to_yojson = string_to_yojson

let endpoint_to_yojson = 
  fun (x: endpoint) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "StateReason",
         (option_to_yojson endpoint_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson endpoint_state_to_yojson x.state));
       (
         "EndpointUrl",
         (option_to_yojson endpoint_url_to_yojson x.endpoint_url));
       (
         "EndpointId",
         (option_to_yojson endpoint_id_to_yojson x.endpoint_id));
       (
         "RoleArn",
         (option_to_yojson iam_role_arn_to_yojson x.role_arn));
       (
         "EventBuses",
         (option_to_yojson endpoint_event_bus_list_to_yojson x.event_buses));
       (
         "ReplicationConfig",
         (option_to_yojson replication_config_to_yojson x.replication_config));
       (
         "RoutingConfig",
         (option_to_yojson routing_config_to_yojson x.routing_config));
       (
         "Arn",
         (option_to_yojson endpoint_arn_to_yojson x.arn));
       (
         "Description",
         (option_to_yojson endpoint_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson endpoint_name_to_yojson x.name));
       
  ])

let endpoint_list_to_yojson = 
  fun tree -> list_to_yojson endpoint_to_yojson tree

let list_endpoints_response_to_yojson = 
  fun (x: list_endpoints_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Endpoints",
         (option_to_yojson endpoint_list_to_yojson x.endpoints));
       
  ])

let home_region_to_yojson = string_to_yojson

let list_endpoints_request_to_yojson = 
  fun (x: list_endpoints_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson limit_max100_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "HomeRegion",
         (option_to_yojson home_region_to_yojson x.home_region));
       (
         "NamePrefix",
         (option_to_yojson endpoint_name_to_yojson x.name_prefix));
       
  ])

let connection_state_reason_to_yojson = string_to_yojson

let connection_to_yojson = 
  fun (x: connection) -> assoc_to_yojson(
    [(
         "LastAuthorizedTime",
         (option_to_yojson timestamp__to_yojson x.last_authorized_time));
       (
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "AuthorizationType",
         (option_to_yojson connection_authorization_type_to_yojson x.authorization_type));
       (
         "StateReason",
         (option_to_yojson connection_state_reason_to_yojson x.state_reason));
       (
         "ConnectionState",
         (option_to_yojson connection_state_to_yojson x.connection_state));
       (
         "Name",
         (option_to_yojson connection_name_to_yojson x.name));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       
  ])

let connection_response_list_to_yojson = 
  fun tree -> list_to_yojson connection_to_yojson tree

let list_connections_response_to_yojson = 
  fun (x: list_connections_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Connections",
         (option_to_yojson connection_response_list_to_yojson x.connections));
       
  ])

let list_connections_request_to_yojson = 
  fun (x: list_connections_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ConnectionState",
         (option_to_yojson connection_state_to_yojson x.connection_state));
       (
         "NamePrefix",
         (option_to_yojson connection_name_to_yojson x.name_prefix));
       
  ])

let archive_to_yojson = 
  fun (x: archive) -> assoc_to_yojson(
    [(
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "EventCount",
         (option_to_yojson long_to_yojson x.event_count));
       (
         "SizeBytes",
         (option_to_yojson long_to_yojson x.size_bytes));
       (
         "RetentionDays",
         (option_to_yojson retention_days_to_yojson x.retention_days));
       (
         "StateReason",
         (option_to_yojson archive_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson archive_state_to_yojson x.state));
       (
         "EventSourceArn",
         (option_to_yojson arn_to_yojson x.event_source_arn));
       (
         "ArchiveName",
         (option_to_yojson archive_name_to_yojson x.archive_name));
       
  ])

let archive_response_list_to_yojson = 
  fun tree -> list_to_yojson archive_to_yojson tree

let list_archives_response_to_yojson = 
  fun (x: list_archives_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Archives",
         (option_to_yojson archive_response_list_to_yojson x.archives));
       
  ])

let list_archives_request_to_yojson = 
  fun (x: list_archives_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "State",
         (option_to_yojson archive_state_to_yojson x.state));
       (
         "EventSourceArn",
         (option_to_yojson arn_to_yojson x.event_source_arn));
       (
         "NamePrefix",
         (option_to_yojson archive_name_to_yojson x.name_prefix));
       
  ])

let api_destination_to_yojson = 
  fun (x: api_destination) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "InvocationRateLimitPerSecond",
         (option_to_yojson api_destination_invocation_rate_limit_per_second_to_yojson x.invocation_rate_limit_per_second));
       (
         "HttpMethod",
         (option_to_yojson api_destination_http_method_to_yojson x.http_method));
       (
         "InvocationEndpoint",
         (option_to_yojson https_endpoint_to_yojson x.invocation_endpoint));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       (
         "ApiDestinationState",
         (option_to_yojson api_destination_state_to_yojson x.api_destination_state));
       (
         "Name",
         (option_to_yojson api_destination_name_to_yojson x.name));
       (
         "ApiDestinationArn",
         (option_to_yojson api_destination_arn_to_yojson x.api_destination_arn));
       
  ])

let api_destination_response_list_to_yojson = 
  fun tree -> list_to_yojson api_destination_to_yojson tree

let list_api_destinations_response_to_yojson = 
  fun (x: list_api_destinations_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ApiDestinations",
         (option_to_yojson api_destination_response_list_to_yojson x.api_destinations));
       
  ])

let list_api_destinations_request_to_yojson = 
  fun (x: list_api_destinations_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_max100_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       (
         "NamePrefix",
         (option_to_yojson api_destination_name_to_yojson x.name_prefix));
       
  ])

let invalid_state_exception_to_yojson = 
  fun (x: invalid_state_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let illegal_status_exception_to_yojson = 
  fun (x: illegal_status_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let enable_rule_request_to_yojson = 
  fun (x: enable_rule_request) -> assoc_to_yojson(
    [(
         "EventBusName",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "Name",
         (Some (rule_name_to_yojson x.name)));
       
  ])

let disable_rule_request_to_yojson = 
  fun (x: disable_rule_request) -> assoc_to_yojson(
    [(
         "EventBusName",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "Name",
         (Some (rule_name_to_yojson x.name)));
       
  ])

let created_by_to_yojson = string_to_yojson

let describe_rule_response_to_yojson = 
  fun (x: describe_rule_response) -> assoc_to_yojson(
    [(
         "CreatedBy",
         (option_to_yojson created_by_to_yojson x.created_by));
       (
         "EventBusName",
         (option_to_yojson event_bus_name_to_yojson x.event_bus_name));
       (
         "ManagedBy",
         (option_to_yojson managed_by_to_yojson x.managed_by));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Description",
         (option_to_yojson rule_description_to_yojson x.description));
       (
         "State",
         (option_to_yojson rule_state_to_yojson x.state));
       (
         "ScheduleExpression",
         (option_to_yojson schedule_expression_to_yojson x.schedule_expression));
       (
         "EventPattern",
         (option_to_yojson event_pattern_to_yojson x.event_pattern));
       (
         "Arn",
         (option_to_yojson rule_arn_to_yojson x.arn));
       (
         "Name",
         (option_to_yojson rule_name_to_yojson x.name));
       
  ])

let describe_rule_request_to_yojson = 
  fun (x: describe_rule_request) -> assoc_to_yojson(
    [(
         "EventBusName",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "Name",
         (Some (rule_name_to_yojson x.name)));
       
  ])

let describe_replay_response_to_yojson = 
  fun (x: describe_replay_response) -> assoc_to_yojson(
    [(
         "ReplayEndTime",
         (option_to_yojson timestamp__to_yojson x.replay_end_time));
       (
         "ReplayStartTime",
         (option_to_yojson timestamp__to_yojson x.replay_start_time));
       (
         "EventLastReplayedTime",
         (option_to_yojson timestamp__to_yojson x.event_last_replayed_time));
       (
         "EventEndTime",
         (option_to_yojson timestamp__to_yojson x.event_end_time));
       (
         "EventStartTime",
         (option_to_yojson timestamp__to_yojson x.event_start_time));
       (
         "Destination",
         (option_to_yojson replay_destination_to_yojson x.destination));
       (
         "EventSourceArn",
         (option_to_yojson arn_to_yojson x.event_source_arn));
       (
         "StateReason",
         (option_to_yojson replay_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson replay_state_to_yojson x.state));
       (
         "Description",
         (option_to_yojson replay_description_to_yojson x.description));
       (
         "ReplayArn",
         (option_to_yojson replay_arn_to_yojson x.replay_arn));
       (
         "ReplayName",
         (option_to_yojson replay_name_to_yojson x.replay_name));
       
  ])

let describe_replay_request_to_yojson = 
  fun (x: describe_replay_request) -> assoc_to_yojson(
    [(
         "ReplayName",
         (Some (replay_name_to_yojson x.replay_name)));
       
  ])

let describe_partner_event_source_response_to_yojson = 
  fun (x: describe_partner_event_source_response) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson string__to_yojson x.name));
       (
         "Arn",
         (option_to_yojson string__to_yojson x.arn));
       
  ])

let describe_partner_event_source_request_to_yojson = 
  fun (x: describe_partner_event_source_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (event_source_name_to_yojson x.name)));
       
  ])

let describe_event_source_response_to_yojson = 
  fun (x: describe_event_source_response) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson event_source_state_to_yojson x.state));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       (
         "ExpirationTime",
         (option_to_yojson timestamp__to_yojson x.expiration_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "CreatedBy",
         (option_to_yojson string__to_yojson x.created_by));
       (
         "Arn",
         (option_to_yojson string__to_yojson x.arn));
       
  ])

let describe_event_source_request_to_yojson = 
  fun (x: describe_event_source_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (event_source_name_to_yojson x.name)));
       
  ])

let describe_event_bus_response_to_yojson = 
  fun (x: describe_event_bus_response) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "Policy",
         (option_to_yojson string__to_yojson x.policy));
       (
         "DeadLetterConfig",
         (option_to_yojson dead_letter_config_to_yojson x.dead_letter_config));
       (
         "KmsKeyIdentifier",
         (option_to_yojson kms_key_identifier_to_yojson x.kms_key_identifier));
       (
         "Description",
         (option_to_yojson event_bus_description_to_yojson x.description));
       (
         "Arn",
         (option_to_yojson string__to_yojson x.arn));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let describe_event_bus_request_to_yojson = 
  fun (x: describe_event_bus_request) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.name));
       
  ])

let describe_endpoint_response_to_yojson = 
  fun (x: describe_endpoint_response) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "StateReason",
         (option_to_yojson endpoint_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson endpoint_state_to_yojson x.state));
       (
         "EndpointUrl",
         (option_to_yojson endpoint_url_to_yojson x.endpoint_url));
       (
         "EndpointId",
         (option_to_yojson endpoint_id_to_yojson x.endpoint_id));
       (
         "RoleArn",
         (option_to_yojson iam_role_arn_to_yojson x.role_arn));
       (
         "EventBuses",
         (option_to_yojson endpoint_event_bus_list_to_yojson x.event_buses));
       (
         "ReplicationConfig",
         (option_to_yojson replication_config_to_yojson x.replication_config));
       (
         "RoutingConfig",
         (option_to_yojson routing_config_to_yojson x.routing_config));
       (
         "Arn",
         (option_to_yojson endpoint_arn_to_yojson x.arn));
       (
         "Description",
         (option_to_yojson endpoint_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson endpoint_name_to_yojson x.name));
       
  ])

let describe_endpoint_request_to_yojson = 
  fun (x: describe_endpoint_request) -> assoc_to_yojson(
    [(
         "HomeRegion",
         (option_to_yojson home_region_to_yojson x.home_region));
       (
         "Name",
         (Some (endpoint_name_to_yojson x.name)));
       
  ])

let connection_basic_auth_response_parameters_to_yojson = 
  fun (x: connection_basic_auth_response_parameters) -> assoc_to_yojson(
    [(
         "Username",
         (option_to_yojson auth_header_parameters_to_yojson x.username));
       
  ])

let connection_o_auth_client_response_parameters_to_yojson = 
  fun (x: connection_o_auth_client_response_parameters) -> assoc_to_yojson(
    [(
         "ClientID",
         (option_to_yojson auth_header_parameters_to_yojson x.client_i_d));
       
  ])

let connection_o_auth_response_parameters_to_yojson = 
  fun (x: connection_o_auth_response_parameters) -> assoc_to_yojson(
    [(
         "OAuthHttpParameters",
         (option_to_yojson connection_http_parameters_to_yojson x.o_auth_http_parameters));
       (
         "HttpMethod",
         (option_to_yojson connection_o_auth_http_method_to_yojson x.http_method));
       (
         "AuthorizationEndpoint",
         (option_to_yojson https_endpoint_to_yojson x.authorization_endpoint));
       (
         "ClientParameters",
         (option_to_yojson connection_o_auth_client_response_parameters_to_yojson x.client_parameters));
       
  ])

let connection_api_key_auth_response_parameters_to_yojson = 
  fun (x: connection_api_key_auth_response_parameters) -> assoc_to_yojson(
    [(
         "ApiKeyName",
         (option_to_yojson auth_header_parameters_to_yojson x.api_key_name));
       
  ])

let connection_auth_response_parameters_to_yojson = 
  fun (x: connection_auth_response_parameters) -> assoc_to_yojson(
    [(
         "InvocationHttpParameters",
         (option_to_yojson connection_http_parameters_to_yojson x.invocation_http_parameters));
       (
         "ApiKeyAuthParameters",
         (option_to_yojson connection_api_key_auth_response_parameters_to_yojson x.api_key_auth_parameters));
       (
         "OAuthParameters",
         (option_to_yojson connection_o_auth_response_parameters_to_yojson x.o_auth_parameters));
       (
         "BasicAuthParameters",
         (option_to_yojson connection_basic_auth_response_parameters_to_yojson x.basic_auth_parameters));
       
  ])

let describe_connection_response_to_yojson = 
  fun (x: describe_connection_response) -> assoc_to_yojson(
    [(
         "LastAuthorizedTime",
         (option_to_yojson timestamp__to_yojson x.last_authorized_time));
       (
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "AuthParameters",
         (option_to_yojson connection_auth_response_parameters_to_yojson x.auth_parameters));
       (
         "SecretArn",
         (option_to_yojson secrets_manager_secret_arn_to_yojson x.secret_arn));
       (
         "AuthorizationType",
         (option_to_yojson connection_authorization_type_to_yojson x.authorization_type));
       (
         "StateReason",
         (option_to_yojson connection_state_reason_to_yojson x.state_reason));
       (
         "ConnectionState",
         (option_to_yojson connection_state_to_yojson x.connection_state));
       (
         "Description",
         (option_to_yojson connection_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson connection_name_to_yojson x.name));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       
  ])

let describe_connection_request_to_yojson = 
  fun (x: describe_connection_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (connection_name_to_yojson x.name)));
       
  ])

let describe_archive_response_to_yojson = 
  fun (x: describe_archive_response) -> assoc_to_yojson(
    [(
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "EventCount",
         (option_to_yojson long_to_yojson x.event_count));
       (
         "SizeBytes",
         (option_to_yojson long_to_yojson x.size_bytes));
       (
         "RetentionDays",
         (option_to_yojson retention_days_to_yojson x.retention_days));
       (
         "StateReason",
         (option_to_yojson archive_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson archive_state_to_yojson x.state));
       (
         "EventPattern",
         (option_to_yojson event_pattern_to_yojson x.event_pattern));
       (
         "Description",
         (option_to_yojson archive_description_to_yojson x.description));
       (
         "EventSourceArn",
         (option_to_yojson arn_to_yojson x.event_source_arn));
       (
         "ArchiveName",
         (option_to_yojson archive_name_to_yojson x.archive_name));
       (
         "ArchiveArn",
         (option_to_yojson archive_arn_to_yojson x.archive_arn));
       
  ])

let describe_archive_request_to_yojson = 
  fun (x: describe_archive_request) -> assoc_to_yojson(
    [(
         "ArchiveName",
         (Some (archive_name_to_yojson x.archive_name)));
       
  ])

let describe_api_destination_response_to_yojson = 
  fun (x: describe_api_destination_response) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "InvocationRateLimitPerSecond",
         (option_to_yojson api_destination_invocation_rate_limit_per_second_to_yojson x.invocation_rate_limit_per_second));
       (
         "HttpMethod",
         (option_to_yojson api_destination_http_method_to_yojson x.http_method));
       (
         "InvocationEndpoint",
         (option_to_yojson https_endpoint_to_yojson x.invocation_endpoint));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       (
         "ApiDestinationState",
         (option_to_yojson api_destination_state_to_yojson x.api_destination_state));
       (
         "Description",
         (option_to_yojson api_destination_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson api_destination_name_to_yojson x.name));
       (
         "ApiDestinationArn",
         (option_to_yojson api_destination_arn_to_yojson x.api_destination_arn));
       
  ])

let describe_api_destination_request_to_yojson = 
  fun (x: describe_api_destination_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (api_destination_name_to_yojson x.name)));
       
  ])

let delete_rule_request_to_yojson = 
  fun (x: delete_rule_request) -> assoc_to_yojson(
    [(
         "Force",
         (option_to_yojson boolean__to_yojson x.force));
       (
         "EventBusName",
         (option_to_yojson event_bus_name_or_arn_to_yojson x.event_bus_name));
       (
         "Name",
         (Some (rule_name_to_yojson x.name)));
       
  ])

let delete_partner_event_source_request_to_yojson = 
  fun (x: delete_partner_event_source_request) -> assoc_to_yojson(
    [(
         "Account",
         (Some (account_id_to_yojson x.account)));
       (
         "Name",
         (Some (event_source_name_to_yojson x.name)));
       
  ])

let delete_event_bus_request_to_yojson = 
  fun (x: delete_event_bus_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (event_bus_name_to_yojson x.name)));
       
  ])

let delete_endpoint_response_to_yojson = 
  fun (x: delete_endpoint_response) -> assoc_to_yojson(
    [
  ])

let delete_endpoint_request_to_yojson = 
  fun (x: delete_endpoint_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (endpoint_name_to_yojson x.name)));
       
  ])

let delete_connection_response_to_yojson = 
  fun (x: delete_connection_response) -> assoc_to_yojson(
    [(
         "LastAuthorizedTime",
         (option_to_yojson timestamp__to_yojson x.last_authorized_time));
       (
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "ConnectionState",
         (option_to_yojson connection_state_to_yojson x.connection_state));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       
  ])

let delete_connection_request_to_yojson = 
  fun (x: delete_connection_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (connection_name_to_yojson x.name)));
       
  ])

let delete_archive_response_to_yojson = 
  fun (x: delete_archive_response) -> assoc_to_yojson(
    [
  ])

let delete_archive_request_to_yojson = 
  fun (x: delete_archive_request) -> assoc_to_yojson(
    [(
         "ArchiveName",
         (Some (archive_name_to_yojson x.archive_name)));
       
  ])

let delete_api_destination_response_to_yojson = 
  fun (x: delete_api_destination_response) -> assoc_to_yojson(
    [
  ])

let delete_api_destination_request_to_yojson = 
  fun (x: delete_api_destination_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (api_destination_name_to_yojson x.name)));
       
  ])

let deauthorize_connection_response_to_yojson = 
  fun (x: deauthorize_connection_response) -> assoc_to_yojson(
    [(
         "LastAuthorizedTime",
         (option_to_yojson timestamp__to_yojson x.last_authorized_time));
       (
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "ConnectionState",
         (option_to_yojson connection_state_to_yojson x.connection_state));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       
  ])

let deauthorize_connection_request_to_yojson = 
  fun (x: deauthorize_connection_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (connection_name_to_yojson x.name)));
       
  ])

let deactivate_event_source_request_to_yojson = 
  fun (x: deactivate_event_source_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (event_source_name_to_yojson x.name)));
       
  ])

let create_partner_event_source_response_to_yojson = 
  fun (x: create_partner_event_source_response) -> assoc_to_yojson(
    [(
         "EventSourceArn",
         (option_to_yojson string__to_yojson x.event_source_arn));
       
  ])

let create_partner_event_source_request_to_yojson = 
  fun (x: create_partner_event_source_request) -> assoc_to_yojson(
    [(
         "Account",
         (Some (account_id_to_yojson x.account)));
       (
         "Name",
         (Some (event_source_name_to_yojson x.name)));
       
  ])

let create_event_bus_response_to_yojson = 
  fun (x: create_event_bus_response) -> assoc_to_yojson(
    [(
         "DeadLetterConfig",
         (option_to_yojson dead_letter_config_to_yojson x.dead_letter_config));
       (
         "KmsKeyIdentifier",
         (option_to_yojson kms_key_identifier_to_yojson x.kms_key_identifier));
       (
         "Description",
         (option_to_yojson event_bus_description_to_yojson x.description));
       (
         "EventBusArn",
         (option_to_yojson string__to_yojson x.event_bus_arn));
       
  ])

let create_event_bus_request_to_yojson = 
  fun (x: create_event_bus_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "DeadLetterConfig",
         (option_to_yojson dead_letter_config_to_yojson x.dead_letter_config));
       (
         "KmsKeyIdentifier",
         (option_to_yojson kms_key_identifier_to_yojson x.kms_key_identifier));
       (
         "Description",
         (option_to_yojson event_bus_description_to_yojson x.description));
       (
         "EventSourceName",
         (option_to_yojson event_source_name_to_yojson x.event_source_name));
       (
         "Name",
         (Some (event_bus_name_to_yojson x.name)));
       
  ])

let create_endpoint_response_to_yojson = 
  fun (x: create_endpoint_response) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson endpoint_state_to_yojson x.state));
       (
         "RoleArn",
         (option_to_yojson iam_role_arn_to_yojson x.role_arn));
       (
         "EventBuses",
         (option_to_yojson endpoint_event_bus_list_to_yojson x.event_buses));
       (
         "ReplicationConfig",
         (option_to_yojson replication_config_to_yojson x.replication_config));
       (
         "RoutingConfig",
         (option_to_yojson routing_config_to_yojson x.routing_config));
       (
         "Arn",
         (option_to_yojson endpoint_arn_to_yojson x.arn));
       (
         "Name",
         (option_to_yojson endpoint_name_to_yojson x.name));
       
  ])

let create_endpoint_request_to_yojson = 
  fun (x: create_endpoint_request) -> assoc_to_yojson(
    [(
         "RoleArn",
         (option_to_yojson iam_role_arn_to_yojson x.role_arn));
       (
         "EventBuses",
         (Some (endpoint_event_bus_list_to_yojson x.event_buses)));
       (
         "ReplicationConfig",
         (option_to_yojson replication_config_to_yojson x.replication_config));
       (
         "RoutingConfig",
         (Some (routing_config_to_yojson x.routing_config)));
       (
         "Description",
         (option_to_yojson endpoint_description_to_yojson x.description));
       (
         "Name",
         (Some (endpoint_name_to_yojson x.name)));
       
  ])

let create_connection_response_to_yojson = 
  fun (x: create_connection_response) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "ConnectionState",
         (option_to_yojson connection_state_to_yojson x.connection_state));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       
  ])

let create_connection_basic_auth_request_parameters_to_yojson = 
  fun (x: create_connection_basic_auth_request_parameters) -> assoc_to_yojson(
    [(
         "Password",
         (Some (auth_header_parameters_sensitive_to_yojson x.password)));
       (
         "Username",
         (Some (auth_header_parameters_to_yojson x.username)));
       
  ])

let create_connection_o_auth_client_request_parameters_to_yojson = 
  fun (x: create_connection_o_auth_client_request_parameters) -> assoc_to_yojson(
    [(
         "ClientSecret",
         (Some (auth_header_parameters_sensitive_to_yojson x.client_secret)));
       (
         "ClientID",
         (Some (auth_header_parameters_to_yojson x.client_i_d)));
       
  ])

let create_connection_o_auth_request_parameters_to_yojson = 
  fun (x: create_connection_o_auth_request_parameters) -> assoc_to_yojson(
    [(
         "OAuthHttpParameters",
         (option_to_yojson connection_http_parameters_to_yojson x.o_auth_http_parameters));
       (
         "HttpMethod",
         (Some (connection_o_auth_http_method_to_yojson x.http_method)));
       (
         "AuthorizationEndpoint",
         (Some (https_endpoint_to_yojson x.authorization_endpoint)));
       (
         "ClientParameters",
         (Some (create_connection_o_auth_client_request_parameters_to_yojson x.client_parameters)));
       
  ])

let create_connection_api_key_auth_request_parameters_to_yojson = 
  fun (x: create_connection_api_key_auth_request_parameters) -> assoc_to_yojson(
    [(
         "ApiKeyValue",
         (Some (auth_header_parameters_sensitive_to_yojson x.api_key_value)));
       (
         "ApiKeyName",
         (Some (auth_header_parameters_to_yojson x.api_key_name)));
       
  ])

let create_connection_auth_request_parameters_to_yojson = 
  fun (x: create_connection_auth_request_parameters) -> assoc_to_yojson(
    [(
         "InvocationHttpParameters",
         (option_to_yojson connection_http_parameters_to_yojson x.invocation_http_parameters));
       (
         "ApiKeyAuthParameters",
         (option_to_yojson create_connection_api_key_auth_request_parameters_to_yojson x.api_key_auth_parameters));
       (
         "OAuthParameters",
         (option_to_yojson create_connection_o_auth_request_parameters_to_yojson x.o_auth_parameters));
       (
         "BasicAuthParameters",
         (option_to_yojson create_connection_basic_auth_request_parameters_to_yojson x.basic_auth_parameters));
       
  ])

let create_connection_request_to_yojson = 
  fun (x: create_connection_request) -> assoc_to_yojson(
    [(
         "AuthParameters",
         (Some (create_connection_auth_request_parameters_to_yojson x.auth_parameters)));
       (
         "AuthorizationType",
         (Some (connection_authorization_type_to_yojson x.authorization_type)));
       (
         "Description",
         (option_to_yojson connection_description_to_yojson x.description));
       (
         "Name",
         (Some (connection_name_to_yojson x.name)));
       
  ])

let create_archive_response_to_yojson = 
  fun (x: create_archive_response) -> assoc_to_yojson(
    [(
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "StateReason",
         (option_to_yojson archive_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson archive_state_to_yojson x.state));
       (
         "ArchiveArn",
         (option_to_yojson archive_arn_to_yojson x.archive_arn));
       
  ])

let create_archive_request_to_yojson = 
  fun (x: create_archive_request) -> assoc_to_yojson(
    [(
         "RetentionDays",
         (option_to_yojson retention_days_to_yojson x.retention_days));
       (
         "EventPattern",
         (option_to_yojson event_pattern_to_yojson x.event_pattern));
       (
         "Description",
         (option_to_yojson archive_description_to_yojson x.description));
       (
         "EventSourceArn",
         (Some (arn_to_yojson x.event_source_arn)));
       (
         "ArchiveName",
         (Some (archive_name_to_yojson x.archive_name)));
       
  ])

let create_api_destination_response_to_yojson = 
  fun (x: create_api_destination_response) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson timestamp__to_yojson x.last_modified_time));
       (
         "CreationTime",
         (option_to_yojson timestamp__to_yojson x.creation_time));
       (
         "ApiDestinationState",
         (option_to_yojson api_destination_state_to_yojson x.api_destination_state));
       (
         "ApiDestinationArn",
         (option_to_yojson api_destination_arn_to_yojson x.api_destination_arn));
       
  ])

let create_api_destination_request_to_yojson = 
  fun (x: create_api_destination_request) -> assoc_to_yojson(
    [(
         "InvocationRateLimitPerSecond",
         (option_to_yojson api_destination_invocation_rate_limit_per_second_to_yojson x.invocation_rate_limit_per_second));
       (
         "HttpMethod",
         (Some (api_destination_http_method_to_yojson x.http_method)));
       (
         "InvocationEndpoint",
         (Some (https_endpoint_to_yojson x.invocation_endpoint)));
       (
         "ConnectionArn",
         (Some (connection_arn_to_yojson x.connection_arn)));
       (
         "Description",
         (option_to_yojson api_destination_description_to_yojson x.description));
       (
         "Name",
         (Some (api_destination_name_to_yojson x.name)));
       
  ])

let cancel_replay_response_to_yojson = 
  fun (x: cancel_replay_response) -> assoc_to_yojson(
    [(
         "StateReason",
         (option_to_yojson replay_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson replay_state_to_yojson x.state));
       (
         "ReplayArn",
         (option_to_yojson replay_arn_to_yojson x.replay_arn));
       
  ])

let cancel_replay_request_to_yojson = 
  fun (x: cancel_replay_request) -> assoc_to_yojson(
    [(
         "ReplayName",
         (Some (replay_name_to_yojson x.replay_name)));
       
  ])

let activate_event_source_request_to_yojson = 
  fun (x: activate_event_source_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (event_source_name_to_yojson x.name)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

