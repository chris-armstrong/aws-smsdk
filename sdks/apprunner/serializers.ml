open Smaws_Lib.Json.SerializeHelpers

open Types

let app_runner_resource_arn_to_yojson = string_to_yojson

let vpc_ingress_connection_summary_to_yojson = 
  fun (x: vpc_ingress_connection_summary) -> assoc_to_yojson(
    [(
         "ServiceArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.service_arn));
       (
         "VpcIngressConnectionArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn));
       
  ])

let vpc_ingress_connection_summary_list_to_yojson = 
  fun tree -> list_to_yojson vpc_ingress_connection_summary_to_yojson tree

let base_unit_to_yojson = unit_to_yojson

let vpc_ingress_connection_status_to_yojson = 
  fun (x: vpc_ingress_connection_status) -> match x with 
 
| DELETED -> `String "DELETED"
  | FAILED_DELETION -> `String "FAILED_DELETION"
  | FAILED_UPDATE -> `String "FAILED_UPDATE"
  | FAILED_CREATION -> `String "FAILED_CREATION"
  | PENDING_DELETION -> `String "PENDING_DELETION"
  | PENDING_UPDATE -> `String "PENDING_UPDATE"
  | PENDING_CREATION -> `String "PENDING_CREATION"
  | AVAILABLE -> `String "AVAILABLE"
   

let vpc_ingress_connection_name_to_yojson = string_to_yojson

let customer_account_id_to_yojson = string_to_yojson

let domain_name_to_yojson = string_to_yojson

let string__to_yojson = string_to_yojson

let ingress_vpc_configuration_to_yojson = 
  fun (x: ingress_vpc_configuration) -> assoc_to_yojson(
    [(
         "VpcEndpointId",
         (option_to_yojson string__to_yojson x.vpc_endpoint_id));
       (
         "VpcId",
         (option_to_yojson string__to_yojson x.vpc_id));
       
  ])

let timestamp__to_yojson = timestamp_to_yojson

let vpc_ingress_connection_to_yojson = 
  fun (x: vpc_ingress_connection) -> assoc_to_yojson(
    [(
         "DeletedAt",
         (option_to_yojson timestamp__to_yojson x.deleted_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "IngressVpcConfiguration",
         (option_to_yojson ingress_vpc_configuration_to_yojson x.ingress_vpc_configuration));
       (
         "DomainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       (
         "AccountId",
         (option_to_yojson customer_account_id_to_yojson x.account_id));
       (
         "Status",
         (option_to_yojson vpc_ingress_connection_status_to_yojson x.status));
       (
         "ServiceArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.service_arn));
       (
         "VpcIngressConnectionName",
         (option_to_yojson vpc_ingress_connection_name_to_yojson x.vpc_ingress_connection_name));
       (
         "VpcIngressConnectionArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn));
       
  ])

let vpc_dns_target_to_yojson = 
  fun (x: vpc_dns_target) -> assoc_to_yojson(
    [(
         "DomainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       (
         "VpcId",
         (option_to_yojson string__to_yojson x.vpc_id));
       (
         "VpcIngressConnectionArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn));
       
  ])

let vpc_dns_target_list_to_yojson = 
  fun tree -> list_to_yojson vpc_dns_target_to_yojson tree

let vpc_connector_name_to_yojson = string_to_yojson

let integer__to_yojson = int_to_yojson

let string_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let vpc_connector_status_to_yojson = 
  fun (x: vpc_connector_status) -> match x with 
  | INACTIVE -> `String "INACTIVE"
    | ACTIVE -> `String "ACTIVE"
     

let vpc_connector_to_yojson = 
  fun (x: vpc_connector) -> assoc_to_yojson(
    [(
         "DeletedAt",
         (option_to_yojson timestamp__to_yojson x.deleted_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Status",
         (option_to_yojson vpc_connector_status_to_yojson x.status));
       (
         "SecurityGroups",
         (option_to_yojson string_list_to_yojson x.security_groups));
       (
         "Subnets",
         (option_to_yojson string_list_to_yojson x.subnets));
       (
         "VpcConnectorRevision",
         (option_to_yojson integer__to_yojson x.vpc_connector_revision));
       (
         "VpcConnectorArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.vpc_connector_arn));
       (
         "VpcConnectorName",
         (option_to_yojson vpc_connector_name_to_yojson x.vpc_connector_name));
       
  ])

let vpc_connectors_to_yojson = 
  fun tree -> list_to_yojson vpc_connector_to_yojson tree

let update_vpc_ingress_connection_response_to_yojson = 
  fun (x: update_vpc_ingress_connection_response) -> assoc_to_yojson(
    [(
         "VpcIngressConnection",
         (Some (vpc_ingress_connection_to_yojson x.vpc_ingress_connection)));
       
  ])

let update_vpc_ingress_connection_request_to_yojson = 
  fun (x: update_vpc_ingress_connection_request) -> assoc_to_yojson(
    [(
         "IngressVpcConfiguration",
         (Some (ingress_vpc_configuration_to_yojson x.ingress_vpc_configuration)));
       (
         "VpcIngressConnectionArn",
         (Some (app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn)));
       
  ])

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_state_exception_to_yojson = 
  fun (x: invalid_state_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_request_exception_to_yojson = 
  fun (x: invalid_request_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let internal_service_error_exception_to_yojson = 
  fun (x: internal_service_error_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let service_name_to_yojson = string_to_yojson

let service_id_to_yojson = string_to_yojson

let service_status_to_yojson = 
  fun (x: service_status) -> match x with 
 
| OPERATION_IN_PROGRESS -> `String "OPERATION_IN_PROGRESS"
  | PAUSED -> `String "PAUSED"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETED -> `String "DELETED"
  | RUNNING -> `String "RUNNING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
   

let source_code_version_type_to_yojson = 
  fun (x: source_code_version_type) -> match x with 
  | BRANCH -> `String "BRANCH"
     

let source_code_version_to_yojson = 
  fun (x: source_code_version) -> assoc_to_yojson(
    [(
         "Value",
         (Some (string__to_yojson x.value)));
       (
         "Type",
         (Some (source_code_version_type_to_yojson x.type_)));
       
  ])

let configuration_source_to_yojson = 
  fun (x: configuration_source) -> match x with 
  | API -> `String "API"
    | REPOSITORY -> `String "REPOSITORY"
     

let runtime_to_yojson = 
  fun (x: runtime) -> match x with 
 
| NODEJS_18 -> `String "NODEJS_18"
  | PYTHON_311 -> `String "PYTHON_311"
  | RUBY_31 -> `String "RUBY_31"
  | PHP_81 -> `String "PHP_81"
  | DOTNET_6 -> `String "DOTNET_6"
  | GO_1 -> `String "GO_1"
  | NODEJS_16 -> `String "NODEJS_16"
  | CORRETTO_11 -> `String "CORRETTO_11"
  | CORRETTO_8 -> `String "CORRETTO_8"
  | NODEJS_14 -> `String "NODEJS_14"
  | NODEJS_12 -> `String "NODEJS_12"
  | PYTHON_3 -> `String "PYTHON_3"
   

let build_command_to_yojson = string_to_yojson

let start_command_to_yojson = string_to_yojson

let runtime_environment_variables_value_to_yojson = string_to_yojson

let runtime_environment_variables_key_to_yojson = string_to_yojson

let runtime_environment_variables_to_yojson = 
  fun tree -> map_to_yojson runtime_environment_variables_value_to_yojson tree

let runtime_environment_secrets_value_to_yojson = string_to_yojson

let runtime_environment_secrets_name_to_yojson = string_to_yojson

let runtime_environment_secrets_to_yojson = 
  fun tree -> map_to_yojson runtime_environment_secrets_value_to_yojson tree

let code_configuration_values_to_yojson = 
  fun (x: code_configuration_values) -> assoc_to_yojson(
    [(
         "RuntimeEnvironmentSecrets",
         (option_to_yojson runtime_environment_secrets_to_yojson x.runtime_environment_secrets));
       (
         "RuntimeEnvironmentVariables",
         (option_to_yojson runtime_environment_variables_to_yojson x.runtime_environment_variables));
       (
         "Port",
         (option_to_yojson string__to_yojson x.port));
       (
         "StartCommand",
         (option_to_yojson start_command_to_yojson x.start_command));
       (
         "BuildCommand",
         (option_to_yojson build_command_to_yojson x.build_command));
       (
         "Runtime",
         (Some (runtime_to_yojson x.runtime)));
       
  ])

let code_configuration_to_yojson = 
  fun (x: code_configuration) -> assoc_to_yojson(
    [(
         "CodeConfigurationValues",
         (option_to_yojson code_configuration_values_to_yojson x.code_configuration_values));
       (
         "ConfigurationSource",
         (Some (configuration_source_to_yojson x.configuration_source)));
       
  ])

let source_directory_to_yojson = string_to_yojson

let code_repository_to_yojson = 
  fun (x: code_repository) -> assoc_to_yojson(
    [(
         "SourceDirectory",
         (option_to_yojson source_directory_to_yojson x.source_directory));
       (
         "CodeConfiguration",
         (option_to_yojson code_configuration_to_yojson x.code_configuration));
       (
         "SourceCodeVersion",
         (Some (source_code_version_to_yojson x.source_code_version)));
       (
         "RepositoryUrl",
         (Some (string__to_yojson x.repository_url)));
       
  ])

let image_identifier_to_yojson = string_to_yojson

let image_configuration_to_yojson = 
  fun (x: image_configuration) -> assoc_to_yojson(
    [(
         "RuntimeEnvironmentSecrets",
         (option_to_yojson runtime_environment_secrets_to_yojson x.runtime_environment_secrets));
       (
         "Port",
         (option_to_yojson string__to_yojson x.port));
       (
         "StartCommand",
         (option_to_yojson start_command_to_yojson x.start_command));
       (
         "RuntimeEnvironmentVariables",
         (option_to_yojson runtime_environment_variables_to_yojson x.runtime_environment_variables));
       
  ])

let image_repository_type_to_yojson = 
  fun (x: image_repository_type) -> match x with 
  | ECR_PUBLIC -> `String "ECR_PUBLIC"
    | ECR -> `String "ECR"
     

let image_repository_to_yojson = 
  fun (x: image_repository) -> assoc_to_yojson(
    [(
         "ImageRepositoryType",
         (Some (image_repository_type_to_yojson x.image_repository_type)));
       (
         "ImageConfiguration",
         (option_to_yojson image_configuration_to_yojson x.image_configuration));
       (
         "ImageIdentifier",
         (Some (image_identifier_to_yojson x.image_identifier)));
       
  ])

let nullable_boolean_to_yojson = bool_to_yojson

let role_arn_to_yojson = string_to_yojson

let authentication_configuration_to_yojson = 
  fun (x: authentication_configuration) -> assoc_to_yojson(
    [(
         "AccessRoleArn",
         (option_to_yojson role_arn_to_yojson x.access_role_arn));
       (
         "ConnectionArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.connection_arn));
       
  ])

let source_configuration_to_yojson = 
  fun (x: source_configuration) -> assoc_to_yojson(
    [(
         "AuthenticationConfiguration",
         (option_to_yojson authentication_configuration_to_yojson x.authentication_configuration));
       (
         "AutoDeploymentsEnabled",
         (option_to_yojson nullable_boolean_to_yojson x.auto_deployments_enabled));
       (
         "ImageRepository",
         (option_to_yojson image_repository_to_yojson x.image_repository));
       (
         "CodeRepository",
         (option_to_yojson code_repository_to_yojson x.code_repository));
       
  ])

let cpu_to_yojson = string_to_yojson

let memory_to_yojson = string_to_yojson

let instance_configuration_to_yojson = 
  fun (x: instance_configuration) -> assoc_to_yojson(
    [(
         "InstanceRoleArn",
         (option_to_yojson role_arn_to_yojson x.instance_role_arn));
       (
         "Memory",
         (option_to_yojson memory_to_yojson x.memory));
       (
         "Cpu",
         (option_to_yojson cpu_to_yojson x.cpu));
       
  ])

let kms_key_arn_to_yojson = string_to_yojson

let encryption_configuration_to_yojson = 
  fun (x: encryption_configuration) -> assoc_to_yojson(
    [(
         "KmsKey",
         (Some (kms_key_arn_to_yojson x.kms_key)));
       
  ])

let health_check_protocol_to_yojson = 
  fun (x: health_check_protocol) -> match x with 
  | HTTP -> `String "HTTP"
    | TCP -> `String "TCP"
     

let health_check_path_to_yojson = string_to_yojson

let health_check_interval_to_yojson = int_to_yojson

let health_check_timeout_to_yojson = int_to_yojson

let health_check_healthy_threshold_to_yojson = int_to_yojson

let health_check_unhealthy_threshold_to_yojson = int_to_yojson

let health_check_configuration_to_yojson = 
  fun (x: health_check_configuration) -> assoc_to_yojson(
    [(
         "UnhealthyThreshold",
         (option_to_yojson health_check_unhealthy_threshold_to_yojson x.unhealthy_threshold));
       (
         "HealthyThreshold",
         (option_to_yojson health_check_healthy_threshold_to_yojson x.healthy_threshold));
       (
         "Timeout",
         (option_to_yojson health_check_timeout_to_yojson x.timeout));
       (
         "Interval",
         (option_to_yojson health_check_interval_to_yojson x.interval));
       (
         "Path",
         (option_to_yojson health_check_path_to_yojson x.path));
       (
         "Protocol",
         (option_to_yojson health_check_protocol_to_yojson x.protocol));
       
  ])

let auto_scaling_configuration_name_to_yojson = string_to_yojson

let auto_scaling_configuration_status_to_yojson = 
  fun (x: auto_scaling_configuration_status) -> match x with 
  | INACTIVE -> `String "INACTIVE"
    | ACTIVE -> `String "ACTIVE"
     

let has_associated_service_to_yojson = bool_to_yojson

let is_default_to_yojson = bool_to_yojson

let auto_scaling_configuration_summary_to_yojson = 
  fun (x: auto_scaling_configuration_summary) -> assoc_to_yojson(
    [(
         "IsDefault",
         (option_to_yojson is_default_to_yojson x.is_default));
       (
         "HasAssociatedService",
         (option_to_yojson has_associated_service_to_yojson x.has_associated_service));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Status",
         (option_to_yojson auto_scaling_configuration_status_to_yojson x.status));
       (
         "AutoScalingConfigurationRevision",
         (option_to_yojson integer__to_yojson x.auto_scaling_configuration_revision));
       (
         "AutoScalingConfigurationName",
         (option_to_yojson auto_scaling_configuration_name_to_yojson x.auto_scaling_configuration_name));
       (
         "AutoScalingConfigurationArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn));
       
  ])

let egress_type_to_yojson = 
  fun (x: egress_type) -> match x with 
  | VPC -> `String "VPC"
    | DEFAULT -> `String "DEFAULT"
     

let egress_configuration_to_yojson = 
  fun (x: egress_configuration) -> assoc_to_yojson(
    [(
         "VpcConnectorArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.vpc_connector_arn));
       (
         "EgressType",
         (option_to_yojson egress_type_to_yojson x.egress_type));
       
  ])

let boolean__to_yojson = bool_to_yojson

let ingress_configuration_to_yojson = 
  fun (x: ingress_configuration) -> assoc_to_yojson(
    [(
         "IsPubliclyAccessible",
         (option_to_yojson boolean__to_yojson x.is_publicly_accessible));
       
  ])

let ip_address_type_to_yojson = 
  fun (x: ip_address_type) -> match x with 
  | DUAL_STACK -> `String "DUAL_STACK"
    | IPV4 -> `String "IPV4"
     

let network_configuration_to_yojson = 
  fun (x: network_configuration) -> assoc_to_yojson(
    [(
         "IpAddressType",
         (option_to_yojson ip_address_type_to_yojson x.ip_address_type));
       (
         "IngressConfiguration",
         (option_to_yojson ingress_configuration_to_yojson x.ingress_configuration));
       (
         "EgressConfiguration",
         (option_to_yojson egress_configuration_to_yojson x.egress_configuration));
       
  ])

let service_observability_configuration_to_yojson = 
  fun (x: service_observability_configuration) -> assoc_to_yojson(
    [(
         "ObservabilityConfigurationArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.observability_configuration_arn));
       (
         "ObservabilityEnabled",
         (Some (boolean__to_yojson x.observability_enabled)));
       
  ])

let service_to_yojson = 
  fun (x: service) -> assoc_to_yojson(
    [(
         "ObservabilityConfiguration",
         (option_to_yojson service_observability_configuration_to_yojson x.observability_configuration));
       (
         "NetworkConfiguration",
         (Some (network_configuration_to_yojson x.network_configuration)));
       (
         "AutoScalingConfigurationSummary",
         (Some (auto_scaling_configuration_summary_to_yojson x.auto_scaling_configuration_summary)));
       (
         "HealthCheckConfiguration",
         (option_to_yojson health_check_configuration_to_yojson x.health_check_configuration));
       (
         "EncryptionConfiguration",
         (option_to_yojson encryption_configuration_to_yojson x.encryption_configuration));
       (
         "InstanceConfiguration",
         (Some (instance_configuration_to_yojson x.instance_configuration)));
       (
         "SourceConfiguration",
         (Some (source_configuration_to_yojson x.source_configuration)));
       (
         "Status",
         (Some (service_status_to_yojson x.status)));
       (
         "DeletedAt",
         (option_to_yojson timestamp__to_yojson x.deleted_at));
       (
         "UpdatedAt",
         (Some (timestamp__to_yojson x.updated_at)));
       (
         "CreatedAt",
         (Some (timestamp__to_yojson x.created_at)));
       (
         "ServiceUrl",
         (option_to_yojson string__to_yojson x.service_url));
       (
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       (
         "ServiceId",
         (Some (service_id_to_yojson x.service_id)));
       (
         "ServiceName",
         (Some (service_name_to_yojson x.service_name)));
       
  ])

let uui_d_to_yojson = string_to_yojson

let update_service_response_to_yojson = 
  fun (x: update_service_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (Some (uui_d_to_yojson x.operation_id)));
       (
         "Service",
         (Some (service_to_yojson x.service)));
       
  ])

let update_service_request_to_yojson = 
  fun (x: update_service_request) -> assoc_to_yojson(
    [(
         "ObservabilityConfiguration",
         (option_to_yojson service_observability_configuration_to_yojson x.observability_configuration));
       (
         "NetworkConfiguration",
         (option_to_yojson network_configuration_to_yojson x.network_configuration));
       (
         "HealthCheckConfiguration",
         (option_to_yojson health_check_configuration_to_yojson x.health_check_configuration));
       (
         "AutoScalingConfigurationArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn));
       (
         "InstanceConfiguration",
         (option_to_yojson instance_configuration_to_yojson x.instance_configuration));
       (
         "SourceConfiguration",
         (option_to_yojson source_configuration_to_yojson x.source_configuration));
       (
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let auto_scaling_configuration_revision_to_yojson = int_to_yojson

let latest_to_yojson = bool_to_yojson

let max_concurrency_to_yojson = int_to_yojson

let min_size_to_yojson = int_to_yojson

let max_size_to_yojson = int_to_yojson

let auto_scaling_configuration_to_yojson = 
  fun (x: auto_scaling_configuration) -> assoc_to_yojson(
    [(
         "IsDefault",
         (option_to_yojson is_default_to_yojson x.is_default));
       (
         "HasAssociatedService",
         (option_to_yojson has_associated_service_to_yojson x.has_associated_service));
       (
         "DeletedAt",
         (option_to_yojson timestamp__to_yojson x.deleted_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "MaxSize",
         (option_to_yojson max_size_to_yojson x.max_size));
       (
         "MinSize",
         (option_to_yojson min_size_to_yojson x.min_size));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "Status",
         (option_to_yojson auto_scaling_configuration_status_to_yojson x.status));
       (
         "Latest",
         (option_to_yojson latest_to_yojson x.latest));
       (
         "AutoScalingConfigurationRevision",
         (option_to_yojson auto_scaling_configuration_revision_to_yojson x.auto_scaling_configuration_revision));
       (
         "AutoScalingConfigurationName",
         (option_to_yojson auto_scaling_configuration_name_to_yojson x.auto_scaling_configuration_name));
       (
         "AutoScalingConfigurationArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn));
       
  ])

let update_default_auto_scaling_configuration_response_to_yojson = 
  fun (x: update_default_auto_scaling_configuration_response) -> assoc_to_yojson(
    [(
         "AutoScalingConfiguration",
         (Some (auto_scaling_configuration_to_yojson x.auto_scaling_configuration)));
       
  ])

let update_default_auto_scaling_configuration_request_to_yojson = 
  fun (x: update_default_auto_scaling_configuration_request) -> assoc_to_yojson(
    [(
         "AutoScalingConfigurationArn",
         (Some (app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn)));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceArn",
         (Some (app_runner_resource_arn_to_yojson x.resource_arn)));
       
  ])

let tracing_vendor_to_yojson = 
  fun (x: tracing_vendor) -> match x with 
  | AWSXRAY -> `String "AWSXRAY"
     

let trace_configuration_to_yojson = 
  fun (x: trace_configuration) -> assoc_to_yojson(
    [(
         "Vendor",
         (Some (tracing_vendor_to_yojson x.vendor)));
       
  ])

let tag_value_to_yojson = string_to_yojson

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson tag_value_to_yojson x.value));
       (
         "Key",
         (option_to_yojson tag_key_to_yojson x.key));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceArn",
         (Some (app_runner_resource_arn_to_yojson x.resource_arn)));
       
  ])

let start_deployment_response_to_yojson = 
  fun (x: start_deployment_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (Some (uui_d_to_yojson x.operation_id)));
       
  ])

let start_deployment_request_to_yojson = 
  fun (x: start_deployment_request) -> assoc_to_yojson(
    [(
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let service_summary_to_yojson = 
  fun (x: service_summary) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson service_status_to_yojson x.status));
       (
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "ServiceUrl",
         (option_to_yojson string__to_yojson x.service_url));
       (
         "ServiceArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.service_arn));
       (
         "ServiceId",
         (option_to_yojson service_id_to_yojson x.service_id));
       (
         "ServiceName",
         (option_to_yojson service_name_to_yojson x.service_name));
       
  ])

let service_summary_list_to_yojson = 
  fun tree -> list_to_yojson service_summary_to_yojson tree

let service_quota_exceeded_exception_to_yojson = 
  fun (x: service_quota_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let service_max_results_to_yojson = int_to_yojson

let service_arn_list_to_yojson = 
  fun tree -> list_to_yojson app_runner_resource_arn_to_yojson tree

let resume_service_response_to_yojson = 
  fun (x: resume_service_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson uui_d_to_yojson x.operation_id));
       (
         "Service",
         (Some (service_to_yojson x.service)));
       
  ])

let resume_service_request_to_yojson = 
  fun (x: resume_service_request) -> assoc_to_yojson(
    [(
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let provider_type_to_yojson = 
  fun (x: provider_type) -> match x with 
  | BITBUCKET -> `String "BITBUCKET"
    | GITHUB -> `String "GITHUB"
     

let pause_service_response_to_yojson = 
  fun (x: pause_service_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson uui_d_to_yojson x.operation_id));
       (
         "Service",
         (Some (service_to_yojson x.service)));
       
  ])

let pause_service_request_to_yojson = 
  fun (x: pause_service_request) -> assoc_to_yojson(
    [(
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let operation_type_to_yojson = 
  fun (x: operation_type) -> match x with 
 
| UPDATE_SERVICE -> `String "UPDATE_SERVICE"
  | DELETE_SERVICE -> `String "DELETE_SERVICE"
  | RESUME_SERVICE -> `String "RESUME_SERVICE"
  | PAUSE_SERVICE -> `String "PAUSE_SERVICE"
  | CREATE_SERVICE -> `String "CREATE_SERVICE"
  | START_DEPLOYMENT -> `String "START_DEPLOYMENT"
   

let operation_status_to_yojson = 
  fun (x: operation_status) -> match x with 
 
| ROLLBACK_SUCCEEDED -> `String "ROLLBACK_SUCCEEDED"
  | ROLLBACK_FAILED -> `String "ROLLBACK_FAILED"
  | ROLLBACK_IN_PROGRESS -> `String "ROLLBACK_IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | PENDING -> `String "PENDING"
   

let operation_summary_to_yojson = 
  fun (x: operation_summary) -> assoc_to_yojson(
    [(
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "EndedAt",
         (option_to_yojson timestamp__to_yojson x.ended_at));
       (
         "StartedAt",
         (option_to_yojson timestamp__to_yojson x.started_at));
       (
         "TargetArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.target_arn));
       (
         "Status",
         (option_to_yojson operation_status_to_yojson x.status));
       (
         "Type",
         (option_to_yojson operation_type_to_yojson x.type_));
       (
         "Id",
         (option_to_yojson uui_d_to_yojson x.id));
       
  ])

let operation_summary_list_to_yojson = 
  fun tree -> list_to_yojson operation_summary_to_yojson tree

let observability_configuration_name_to_yojson = string_to_yojson

let observability_configuration_summary_to_yojson = 
  fun (x: observability_configuration_summary) -> assoc_to_yojson(
    [(
         "ObservabilityConfigurationRevision",
         (option_to_yojson integer__to_yojson x.observability_configuration_revision));
       (
         "ObservabilityConfigurationName",
         (option_to_yojson observability_configuration_name_to_yojson x.observability_configuration_name));
       (
         "ObservabilityConfigurationArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.observability_configuration_arn));
       
  ])

let observability_configuration_summary_list_to_yojson = 
  fun tree -> list_to_yojson observability_configuration_summary_to_yojson tree

let observability_configuration_status_to_yojson = 
  fun (x: observability_configuration_status) -> match x with 
  | INACTIVE -> `String "INACTIVE"
    | ACTIVE -> `String "ACTIVE"
     

let observability_configuration_to_yojson = 
  fun (x: observability_configuration) -> assoc_to_yojson(
    [(
         "DeletedAt",
         (option_to_yojson timestamp__to_yojson x.deleted_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Status",
         (option_to_yojson observability_configuration_status_to_yojson x.status));
       (
         "Latest",
         (option_to_yojson boolean__to_yojson x.latest));
       (
         "ObservabilityConfigurationRevision",
         (option_to_yojson integer__to_yojson x.observability_configuration_revision));
       (
         "TraceConfiguration",
         (option_to_yojson trace_configuration_to_yojson x.trace_configuration));
       (
         "ObservabilityConfigurationName",
         (option_to_yojson observability_configuration_name_to_yojson x.observability_configuration_name));
       (
         "ObservabilityConfigurationArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.observability_configuration_arn));
       
  ])

let next_token_to_yojson = string_to_yojson

let max_results_to_yojson = int_to_yojson

let list_vpc_ingress_connections_response_to_yojson = 
  fun (x: list_vpc_ingress_connections_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "VpcIngressConnectionSummaryList",
         (Some (vpc_ingress_connection_summary_list_to_yojson x.vpc_ingress_connection_summary_list)));
       
  ])

let list_vpc_ingress_connections_filter_to_yojson = 
  fun (x: list_vpc_ingress_connections_filter) -> assoc_to_yojson(
    [(
         "VpcEndpointId",
         (option_to_yojson string__to_yojson x.vpc_endpoint_id));
       (
         "ServiceArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.service_arn));
       
  ])

let list_vpc_ingress_connections_request_to_yojson = 
  fun (x: list_vpc_ingress_connections_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "Filter",
         (option_to_yojson list_vpc_ingress_connections_filter_to_yojson x.filter));
       
  ])

let list_vpc_connectors_response_to_yojson = 
  fun (x: list_vpc_connectors_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "VpcConnectors",
         (Some (vpc_connectors_to_yojson x.vpc_connectors)));
       
  ])

let list_vpc_connectors_request_to_yojson = 
  fun (x: list_vpc_connectors_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       
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
         "ResourceArn",
         (Some (app_runner_resource_arn_to_yojson x.resource_arn)));
       
  ])

let list_services_response_to_yojson = 
  fun (x: list_services_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ServiceSummaryList",
         (Some (service_summary_list_to_yojson x.service_summary_list)));
       
  ])

let list_services_request_to_yojson = 
  fun (x: list_services_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson service_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let list_services_for_auto_scaling_configuration_response_to_yojson = 
  fun (x: list_services_for_auto_scaling_configuration_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ServiceArnList",
         (Some (service_arn_list_to_yojson x.service_arn_list)));
       
  ])

let list_services_for_auto_scaling_configuration_request_to_yojson = 
  fun (x: list_services_for_auto_scaling_configuration_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "AutoScalingConfigurationArn",
         (Some (app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn)));
       
  ])

let list_operations_response_to_yojson = 
  fun (x: list_operations_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "OperationSummaryList",
         (option_to_yojson operation_summary_list_to_yojson x.operation_summary_list));
       
  ])

let list_operations_max_results_to_yojson = int_to_yojson

let list_operations_request_to_yojson = 
  fun (x: list_operations_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson list_operations_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let list_observability_configurations_response_to_yojson = 
  fun (x: list_observability_configurations_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ObservabilityConfigurationSummaryList",
         (Some (observability_configuration_summary_list_to_yojson x.observability_configuration_summary_list)));
       
  ])

let list_observability_configurations_request_to_yojson = 
  fun (x: list_observability_configurations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "LatestOnly",
         (option_to_yojson boolean__to_yojson x.latest_only));
       (
         "ObservabilityConfigurationName",
         (option_to_yojson observability_configuration_name_to_yojson x.observability_configuration_name));
       
  ])

let connection_name_to_yojson = string_to_yojson

let connection_status_to_yojson = 
  fun (x: connection_status) -> match x with 
 
| DELETED -> `String "DELETED"
  | ERROR -> `String "ERROR"
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING_HANDSHAKE -> `String "PENDING_HANDSHAKE"
   

let connection_summary_to_yojson = 
  fun (x: connection_summary) -> assoc_to_yojson(
    [(
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Status",
         (option_to_yojson connection_status_to_yojson x.status));
       (
         "ProviderType",
         (option_to_yojson provider_type_to_yojson x.provider_type));
       (
         "ConnectionArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.connection_arn));
       (
         "ConnectionName",
         (option_to_yojson connection_name_to_yojson x.connection_name));
       
  ])

let connection_summary_list_to_yojson = 
  fun tree -> list_to_yojson connection_summary_to_yojson tree

let list_connections_response_to_yojson = 
  fun (x: list_connections_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ConnectionSummaryList",
         (Some (connection_summary_list_to_yojson x.connection_summary_list)));
       
  ])

let list_connections_request_to_yojson = 
  fun (x: list_connections_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "ConnectionName",
         (option_to_yojson connection_name_to_yojson x.connection_name));
       
  ])

let auto_scaling_configuration_summary_list_to_yojson = 
  fun tree -> list_to_yojson auto_scaling_configuration_summary_to_yojson tree

let list_auto_scaling_configurations_response_to_yojson = 
  fun (x: list_auto_scaling_configurations_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AutoScalingConfigurationSummaryList",
         (Some (auto_scaling_configuration_summary_list_to_yojson x.auto_scaling_configuration_summary_list)));
       
  ])

let list_auto_scaling_configurations_request_to_yojson = 
  fun (x: list_auto_scaling_configurations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "LatestOnly",
         (option_to_yojson boolean__to_yojson x.latest_only));
       (
         "AutoScalingConfigurationName",
         (option_to_yojson auto_scaling_configuration_name_to_yojson x.auto_scaling_configuration_name));
       
  ])

let certificate_validation_record_status_to_yojson = 
  fun (x: certificate_validation_record_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"
   

let certificate_validation_record_to_yojson = 
  fun (x: certificate_validation_record) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson certificate_validation_record_status_to_yojson x.status));
       (
         "Value",
         (option_to_yojson string__to_yojson x.value));
       (
         "Type",
         (option_to_yojson string__to_yojson x.type_));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let certificate_validation_record_list_to_yojson = 
  fun tree -> list_to_yojson certificate_validation_record_to_yojson tree

let custom_domain_association_status_to_yojson = 
  fun (x: custom_domain_association_status) -> match x with 
 
| BINDING_CERTIFICATE -> `String "BINDING_CERTIFICATE"
  | PENDING_CERTIFICATE_DNS_VALIDATION -> `String "PENDING_CERTIFICATE_DNS_VALIDATION"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATING -> `String "CREATING"
   

let custom_domain_to_yojson = 
  fun (x: custom_domain) -> assoc_to_yojson(
    [(
         "Status",
         (Some (custom_domain_association_status_to_yojson x.status)));
       (
         "CertificateValidationRecords",
         (option_to_yojson certificate_validation_record_list_to_yojson x.certificate_validation_records));
       (
         "EnableWWWSubdomain",
         (Some (nullable_boolean_to_yojson x.enable_www_subdomain)));
       (
         "DomainName",
         (Some (domain_name_to_yojson x.domain_name)));
       
  ])

let disassociate_custom_domain_response_to_yojson = 
  fun (x: disassociate_custom_domain_response) -> assoc_to_yojson(
    [(
         "VpcDNSTargets",
         (Some (vpc_dns_target_list_to_yojson x.vpc_dns_targets)));
       (
         "CustomDomain",
         (Some (custom_domain_to_yojson x.custom_domain)));
       (
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       (
         "DNSTarget",
         (Some (string__to_yojson x.dns_target)));
       
  ])

let disassociate_custom_domain_request_to_yojson = 
  fun (x: disassociate_custom_domain_request) -> assoc_to_yojson(
    [(
         "DomainName",
         (Some (domain_name_to_yojson x.domain_name)));
       (
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let describe_vpc_ingress_connection_response_to_yojson = 
  fun (x: describe_vpc_ingress_connection_response) -> assoc_to_yojson(
    [(
         "VpcIngressConnection",
         (Some (vpc_ingress_connection_to_yojson x.vpc_ingress_connection)));
       
  ])

let describe_vpc_ingress_connection_request_to_yojson = 
  fun (x: describe_vpc_ingress_connection_request) -> assoc_to_yojson(
    [(
         "VpcIngressConnectionArn",
         (Some (app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn)));
       
  ])

let describe_vpc_connector_response_to_yojson = 
  fun (x: describe_vpc_connector_response) -> assoc_to_yojson(
    [(
         "VpcConnector",
         (Some (vpc_connector_to_yojson x.vpc_connector)));
       
  ])

let describe_vpc_connector_request_to_yojson = 
  fun (x: describe_vpc_connector_request) -> assoc_to_yojson(
    [(
         "VpcConnectorArn",
         (Some (app_runner_resource_arn_to_yojson x.vpc_connector_arn)));
       
  ])

let describe_service_response_to_yojson = 
  fun (x: describe_service_response) -> assoc_to_yojson(
    [(
         "Service",
         (Some (service_to_yojson x.service)));
       
  ])

let describe_service_request_to_yojson = 
  fun (x: describe_service_request) -> assoc_to_yojson(
    [(
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let describe_observability_configuration_response_to_yojson = 
  fun (x: describe_observability_configuration_response) -> assoc_to_yojson(
    [(
         "ObservabilityConfiguration",
         (Some (observability_configuration_to_yojson x.observability_configuration)));
       
  ])

let describe_observability_configuration_request_to_yojson = 
  fun (x: describe_observability_configuration_request) -> assoc_to_yojson(
    [(
         "ObservabilityConfigurationArn",
         (Some (app_runner_resource_arn_to_yojson x.observability_configuration_arn)));
       
  ])

let custom_domain_list_to_yojson = 
  fun tree -> list_to_yojson custom_domain_to_yojson tree

let describe_custom_domains_response_to_yojson = 
  fun (x: describe_custom_domains_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "VpcDNSTargets",
         (Some (vpc_dns_target_list_to_yojson x.vpc_dns_targets)));
       (
         "CustomDomains",
         (Some (custom_domain_list_to_yojson x.custom_domains)));
       (
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       (
         "DNSTarget",
         (Some (string__to_yojson x.dns_target)));
       
  ])

let describe_custom_domains_max_results_to_yojson = int_to_yojson

let describe_custom_domains_request_to_yojson = 
  fun (x: describe_custom_domains_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson describe_custom_domains_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let describe_auto_scaling_configuration_response_to_yojson = 
  fun (x: describe_auto_scaling_configuration_response) -> assoc_to_yojson(
    [(
         "AutoScalingConfiguration",
         (Some (auto_scaling_configuration_to_yojson x.auto_scaling_configuration)));
       
  ])

let describe_auto_scaling_configuration_request_to_yojson = 
  fun (x: describe_auto_scaling_configuration_request) -> assoc_to_yojson(
    [(
         "AutoScalingConfigurationArn",
         (Some (app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn)));
       
  ])

let delete_vpc_ingress_connection_response_to_yojson = 
  fun (x: delete_vpc_ingress_connection_response) -> assoc_to_yojson(
    [(
         "VpcIngressConnection",
         (Some (vpc_ingress_connection_to_yojson x.vpc_ingress_connection)));
       
  ])

let delete_vpc_ingress_connection_request_to_yojson = 
  fun (x: delete_vpc_ingress_connection_request) -> assoc_to_yojson(
    [(
         "VpcIngressConnectionArn",
         (Some (app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn)));
       
  ])

let delete_vpc_connector_response_to_yojson = 
  fun (x: delete_vpc_connector_response) -> assoc_to_yojson(
    [(
         "VpcConnector",
         (Some (vpc_connector_to_yojson x.vpc_connector)));
       
  ])

let delete_vpc_connector_request_to_yojson = 
  fun (x: delete_vpc_connector_request) -> assoc_to_yojson(
    [(
         "VpcConnectorArn",
         (Some (app_runner_resource_arn_to_yojson x.vpc_connector_arn)));
       
  ])

let delete_service_response_to_yojson = 
  fun (x: delete_service_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (Some (uui_d_to_yojson x.operation_id)));
       (
         "Service",
         (Some (service_to_yojson x.service)));
       
  ])

let delete_service_request_to_yojson = 
  fun (x: delete_service_request) -> assoc_to_yojson(
    [(
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let delete_observability_configuration_response_to_yojson = 
  fun (x: delete_observability_configuration_response) -> assoc_to_yojson(
    [(
         "ObservabilityConfiguration",
         (Some (observability_configuration_to_yojson x.observability_configuration)));
       
  ])

let delete_observability_configuration_request_to_yojson = 
  fun (x: delete_observability_configuration_request) -> assoc_to_yojson(
    [(
         "ObservabilityConfigurationArn",
         (Some (app_runner_resource_arn_to_yojson x.observability_configuration_arn)));
       
  ])

let connection_to_yojson = 
  fun (x: connection) -> assoc_to_yojson(
    [(
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Status",
         (option_to_yojson connection_status_to_yojson x.status));
       (
         "ProviderType",
         (option_to_yojson provider_type_to_yojson x.provider_type));
       (
         "ConnectionArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.connection_arn));
       (
         "ConnectionName",
         (option_to_yojson connection_name_to_yojson x.connection_name));
       
  ])

let delete_connection_response_to_yojson = 
  fun (x: delete_connection_response) -> assoc_to_yojson(
    [(
         "Connection",
         (option_to_yojson connection_to_yojson x.connection));
       
  ])

let delete_connection_request_to_yojson = 
  fun (x: delete_connection_request) -> assoc_to_yojson(
    [(
         "ConnectionArn",
         (Some (app_runner_resource_arn_to_yojson x.connection_arn)));
       
  ])

let delete_auto_scaling_configuration_response_to_yojson = 
  fun (x: delete_auto_scaling_configuration_response) -> assoc_to_yojson(
    [(
         "AutoScalingConfiguration",
         (Some (auto_scaling_configuration_to_yojson x.auto_scaling_configuration)));
       
  ])

let delete_auto_scaling_configuration_request_to_yojson = 
  fun (x: delete_auto_scaling_configuration_request) -> assoc_to_yojson(
    [(
         "DeleteAllRevisions",
         (option_to_yojson boolean__to_yojson x.delete_all_revisions));
       (
         "AutoScalingConfigurationArn",
         (Some (app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn)));
       
  ])

let create_vpc_ingress_connection_response_to_yojson = 
  fun (x: create_vpc_ingress_connection_response) -> assoc_to_yojson(
    [(
         "VpcIngressConnection",
         (Some (vpc_ingress_connection_to_yojson x.vpc_ingress_connection)));
       
  ])

let create_vpc_ingress_connection_request_to_yojson = 
  fun (x: create_vpc_ingress_connection_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "IngressVpcConfiguration",
         (Some (ingress_vpc_configuration_to_yojson x.ingress_vpc_configuration)));
       (
         "VpcIngressConnectionName",
         (Some (vpc_ingress_connection_name_to_yojson x.vpc_ingress_connection_name)));
       (
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let create_vpc_connector_response_to_yojson = 
  fun (x: create_vpc_connector_response) -> assoc_to_yojson(
    [(
         "VpcConnector",
         (Some (vpc_connector_to_yojson x.vpc_connector)));
       
  ])

let create_vpc_connector_request_to_yojson = 
  fun (x: create_vpc_connector_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "SecurityGroups",
         (option_to_yojson string_list_to_yojson x.security_groups));
       (
         "Subnets",
         (Some (string_list_to_yojson x.subnets)));
       (
         "VpcConnectorName",
         (Some (vpc_connector_name_to_yojson x.vpc_connector_name)));
       
  ])

let create_service_response_to_yojson = 
  fun (x: create_service_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (Some (uui_d_to_yojson x.operation_id)));
       (
         "Service",
         (Some (service_to_yojson x.service)));
       
  ])

let create_service_request_to_yojson = 
  fun (x: create_service_request) -> assoc_to_yojson(
    [(
         "ObservabilityConfiguration",
         (option_to_yojson service_observability_configuration_to_yojson x.observability_configuration));
       (
         "NetworkConfiguration",
         (option_to_yojson network_configuration_to_yojson x.network_configuration));
       (
         "AutoScalingConfigurationArn",
         (option_to_yojson app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn));
       (
         "HealthCheckConfiguration",
         (option_to_yojson health_check_configuration_to_yojson x.health_check_configuration));
       (
         "EncryptionConfiguration",
         (option_to_yojson encryption_configuration_to_yojson x.encryption_configuration));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "InstanceConfiguration",
         (option_to_yojson instance_configuration_to_yojson x.instance_configuration));
       (
         "SourceConfiguration",
         (Some (source_configuration_to_yojson x.source_configuration)));
       (
         "ServiceName",
         (Some (service_name_to_yojson x.service_name)));
       
  ])

let create_observability_configuration_response_to_yojson = 
  fun (x: create_observability_configuration_response) -> assoc_to_yojson(
    [(
         "ObservabilityConfiguration",
         (Some (observability_configuration_to_yojson x.observability_configuration)));
       
  ])

let create_observability_configuration_request_to_yojson = 
  fun (x: create_observability_configuration_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "TraceConfiguration",
         (option_to_yojson trace_configuration_to_yojson x.trace_configuration));
       (
         "ObservabilityConfigurationName",
         (Some (observability_configuration_name_to_yojson x.observability_configuration_name)));
       
  ])

let create_connection_response_to_yojson = 
  fun (x: create_connection_response) -> assoc_to_yojson(
    [(
         "Connection",
         (Some (connection_to_yojson x.connection)));
       
  ])

let create_connection_request_to_yojson = 
  fun (x: create_connection_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ProviderType",
         (Some (provider_type_to_yojson x.provider_type)));
       (
         "ConnectionName",
         (Some (connection_name_to_yojson x.connection_name)));
       
  ])

let create_auto_scaling_configuration_response_to_yojson = 
  fun (x: create_auto_scaling_configuration_response) -> assoc_to_yojson(
    [(
         "AutoScalingConfiguration",
         (Some (auto_scaling_configuration_to_yojson x.auto_scaling_configuration)));
       
  ])

let as_config_max_concurrency_to_yojson = int_to_yojson

let as_config_min_size_to_yojson = int_to_yojson

let as_config_max_size_to_yojson = int_to_yojson

let create_auto_scaling_configuration_request_to_yojson = 
  fun (x: create_auto_scaling_configuration_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "MaxSize",
         (option_to_yojson as_config_max_size_to_yojson x.max_size));
       (
         "MinSize",
         (option_to_yojson as_config_min_size_to_yojson x.min_size));
       (
         "MaxConcurrency",
         (option_to_yojson as_config_max_concurrency_to_yojson x.max_concurrency));
       (
         "AutoScalingConfigurationName",
         (Some (auto_scaling_configuration_name_to_yojson x.auto_scaling_configuration_name)));
       
  ])

let associate_custom_domain_response_to_yojson = 
  fun (x: associate_custom_domain_response) -> assoc_to_yojson(
    [(
         "VpcDNSTargets",
         (Some (vpc_dns_target_list_to_yojson x.vpc_dns_targets)));
       (
         "CustomDomain",
         (Some (custom_domain_to_yojson x.custom_domain)));
       (
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       (
         "DNSTarget",
         (Some (string__to_yojson x.dns_target)));
       
  ])

let associate_custom_domain_request_to_yojson = 
  fun (x: associate_custom_domain_request) -> assoc_to_yojson(
    [(
         "EnableWWWSubdomain",
         (option_to_yojson nullable_boolean_to_yojson x.enable_www_subdomain));
       (
         "DomainName",
         (Some (domain_name_to_yojson x.domain_name)));
       (
         "ServiceArn",
         (Some (app_runner_resource_arn_to_yojson x.service_arn)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

