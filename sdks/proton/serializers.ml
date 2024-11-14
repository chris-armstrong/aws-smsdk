open Smaws_Lib.Json.SerializeHelpers

open Types

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson = 
  fun (x: validation_exception) -> assoc_to_yojson(
    [(
         "message",
         (Some (error_message_to_yojson x.message)));
       
  ])

let resource_name_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let template_type_to_yojson = 
  fun (x: template_type) -> match x with 
  | ENVIRONMENT -> `String "ENVIRONMENT"
    | SERVICE -> `String "SERVICE"
     

let repository_provider_to_yojson = 
  fun (x: repository_provider) -> match x with 
 
| GITHUB -> `String "GITHUB"
  | GITHUB_ENTERPRISE -> `String "GITHUB_ENTERPRISE"
  | BITBUCKET -> `String "BITBUCKET"
   

let repository_name_to_yojson = string_to_yojson

let git_branch_name_to_yojson = string_to_yojson

let subdirectory_to_yojson = string_to_yojson

let template_sync_config_to_yojson = 
  fun (x: template_sync_config) -> assoc_to_yojson(
    [(
         "subdirectory",
         (option_to_yojson subdirectory_to_yojson x.subdirectory));
       (
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "repositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       (
         "repositoryProvider",
         (Some (repository_provider_to_yojson x.repository_provider)));
       (
         "templateType",
         (Some (template_type_to_yojson x.template_type)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let update_template_sync_config_output_to_yojson = 
  fun (x: update_template_sync_config_output) -> assoc_to_yojson(
    [(
         "templateSyncConfig",
         (option_to_yojson template_sync_config_to_yojson x.template_sync_config));
       
  ])

let update_template_sync_config_input_to_yojson = 
  fun (x: update_template_sync_config_input) -> assoc_to_yojson(
    [(
         "subdirectory",
         (option_to_yojson subdirectory_to_yojson x.subdirectory));
       (
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "repositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       (
         "repositoryProvider",
         (Some (repository_provider_to_yojson x.repository_provider)));
       (
         "templateType",
         (Some (template_type_to_yojson x.template_type)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let throttling_exception_to_yojson = 
  fun (x: throttling_exception) -> assoc_to_yojson(
    [(
         "message",
         (Some (error_message_to_yojson x.message)));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (Some (error_message_to_yojson x.message)));
       
  ])

let internal_server_exception_to_yojson = 
  fun (x: internal_server_exception) -> assoc_to_yojson(
    [(
         "message",
         (Some (error_message_to_yojson x.message)));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "message",
         (Some (error_message_to_yojson x.message)));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "message",
         (Some (error_message_to_yojson x.message)));
       
  ])

let template_version_part_to_yojson = string_to_yojson

let template_version_status_to_yojson = 
  fun (x: template_version_status) -> match x with 
 
| REGISTRATION_IN_PROGRESS -> `String "REGISTRATION_IN_PROGRESS"
  | REGISTRATION_FAILED -> `String "REGISTRATION_FAILED"
  | DRAFT -> `String "DRAFT"
  | PUBLISHED -> `String "PUBLISHED"
   

let status_message_to_yojson = string_to_yojson

let description_to_yojson = string_to_yojson

let service_template_version_arn_to_yojson = string_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let compatible_environment_template_to_yojson = 
  fun (x: compatible_environment_template) -> assoc_to_yojson(
    [(
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let compatible_environment_template_list_to_yojson = 
  fun tree -> list_to_yojson compatible_environment_template_to_yojson tree

let template_schema_to_yojson = string_to_yojson

let service_template_supported_component_source_type_to_yojson = 
  fun (x: service_template_supported_component_source_type) -> match x with 
  | DIRECTLY_DEFINED -> `String "DIRECTLY_DEFINED"
     

let service_template_supported_component_source_input_list_to_yojson = 
  fun tree -> list_to_yojson service_template_supported_component_source_type_to_yojson tree

let service_template_version_to_yojson = 
  fun (x: service_template_version) -> assoc_to_yojson(
    [(
         "supportedComponentSources",
         (option_to_yojson service_template_supported_component_source_input_list_to_yojson x.supported_component_sources));
       (
         "schema",
         (option_to_yojson template_schema_to_yojson x.schema));
       (
         "compatibleEnvironmentTemplates",
         (Some (compatible_environment_template_list_to_yojson x.compatible_environment_templates)));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (service_template_version_arn_to_yojson x.arn)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "statusMessage",
         (option_to_yojson status_message_to_yojson x.status_message));
       (
         "status",
         (Some (template_version_status_to_yojson x.status)));
       (
         "recommendedMinorVersion",
         (option_to_yojson template_version_part_to_yojson x.recommended_minor_version));
       (
         "minorVersion",
         (Some (template_version_part_to_yojson x.minor_version)));
       (
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let update_service_template_version_output_to_yojson = 
  fun (x: update_service_template_version_output) -> assoc_to_yojson(
    [(
         "serviceTemplateVersion",
         (Some (service_template_version_to_yojson x.service_template_version)));
       
  ])

let compatible_environment_template_input_to_yojson = 
  fun (x: compatible_environment_template_input) -> assoc_to_yojson(
    [(
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let compatible_environment_template_input_list_to_yojson = 
  fun tree -> list_to_yojson compatible_environment_template_input_to_yojson tree

let update_service_template_version_input_to_yojson = 
  fun (x: update_service_template_version_input) -> assoc_to_yojson(
    [(
         "supportedComponentSources",
         (option_to_yojson service_template_supported_component_source_input_list_to_yojson x.supported_component_sources));
       (
         "compatibleEnvironmentTemplates",
         (option_to_yojson compatible_environment_template_input_list_to_yojson x.compatible_environment_templates));
       (
         "status",
         (option_to_yojson template_version_status_to_yojson x.status));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "minorVersion",
         (Some (template_version_part_to_yojson x.minor_version)));
       (
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let service_template_arn_to_yojson = string_to_yojson

let display_name_to_yojson = string_to_yojson

let full_template_version_number_to_yojson = string_to_yojson

let arn_to_yojson = string_to_yojson

let provisioning_to_yojson = 
  fun (x: provisioning) -> match x with 
  | CUSTOMER_MANAGED -> `String "CUSTOMER_MANAGED"
     

let service_template_to_yojson = 
  fun (x: service_template) -> assoc_to_yojson(
    [(
         "pipelineProvisioning",
         (option_to_yojson provisioning_to_yojson x.pipeline_provisioning));
       (
         "encryptionKey",
         (option_to_yojson arn_to_yojson x.encryption_key));
       (
         "recommendedVersion",
         (option_to_yojson full_template_version_number_to_yojson x.recommended_version));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "displayName",
         (option_to_yojson display_name_to_yojson x.display_name));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (service_template_arn_to_yojson x.arn)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let update_service_template_output_to_yojson = 
  fun (x: update_service_template_output) -> assoc_to_yojson(
    [(
         "serviceTemplate",
         (Some (service_template_to_yojson x.service_template)));
       
  ])

let update_service_template_input_to_yojson = 
  fun (x: update_service_template_input) -> assoc_to_yojson(
    [(
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "displayName",
         (option_to_yojson display_name_to_yojson x.display_name));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let ops_file_path_to_yojson = string_to_yojson

let service_sync_config_to_yojson = 
  fun (x: service_sync_config) -> assoc_to_yojson(
    [(
         "filePath",
         (Some (ops_file_path_to_yojson x.file_path)));
       (
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "repositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       (
         "repositoryProvider",
         (Some (repository_provider_to_yojson x.repository_provider)));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let update_service_sync_config_output_to_yojson = 
  fun (x: update_service_sync_config_output) -> assoc_to_yojson(
    [(
         "serviceSyncConfig",
         (option_to_yojson service_sync_config_to_yojson x.service_sync_config));
       
  ])

let update_service_sync_config_input_to_yojson = 
  fun (x: update_service_sync_config_input) -> assoc_to_yojson(
    [(
         "filePath",
         (Some (ops_file_path_to_yojson x.file_path)));
       (
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "repositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       (
         "repositoryProvider",
         (Some (repository_provider_to_yojson x.repository_provider)));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let base_string_to_yojson = string_to_yojson

let blocker_type_to_yojson = 
  fun (x: blocker_type) -> match x with 
  | AUTOMATED -> `String "AUTOMATED"
     

let blocker_status_to_yojson = 
  fun (x: blocker_status) -> match x with 
  | ACTIVE -> `String "ACTIVE"
    | RESOLVED -> `String "RESOLVED"
     

let sync_blocker_context_to_yojson = 
  fun (x: sync_blocker_context) -> assoc_to_yojson(
    [(
         "value",
         (Some (base_string_to_yojson x.value)));
       (
         "key",
         (Some (base_string_to_yojson x.key)));
       
  ])

let sync_blocker_contexts_to_yojson = 
  fun tree -> list_to_yojson sync_blocker_context_to_yojson tree

let sync_blocker_to_yojson = 
  fun (x: sync_blocker) -> assoc_to_yojson(
    [(
         "resolvedAt",
         (option_to_yojson base_timestamp_to_yojson x.resolved_at));
       (
         "resolvedReason",
         (option_to_yojson base_string_to_yojson x.resolved_reason));
       (
         "contexts",
         (option_to_yojson sync_blocker_contexts_to_yojson x.contexts));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "createdReason",
         (Some (base_string_to_yojson x.created_reason)));
       (
         "status",
         (Some (blocker_status_to_yojson x.status)));
       (
         "type",
         (Some (blocker_type_to_yojson x.type_)));
       (
         "id",
         (Some (base_string_to_yojson x.id)));
       
  ])

let update_service_sync_blocker_output_to_yojson = 
  fun (x: update_service_sync_blocker_output) -> assoc_to_yojson(
    [(
         "serviceSyncBlocker",
         (Some (sync_blocker_to_yojson x.service_sync_blocker)));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_to_yojson x.service_instance_name));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let update_service_sync_blocker_input_to_yojson = 
  fun (x: update_service_sync_blocker_input) -> assoc_to_yojson(
    [(
         "resolvedReason",
         (Some (base_string_to_yojson x.resolved_reason)));
       (
         "id",
         (Some (base_string_to_yojson x.id)));
       
  ])

let deployment_status_to_yojson = 
  fun (x: deployment_status) -> match x with 
 
| IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_COMPLETE -> `String "DELETE_COMPLETE"
  | CANCELLING -> `String "CANCELLING"
  | CANCELLED -> `String "CANCELLED"
   

let spec_contents_to_yojson = string_to_yojson

let deployment_id_to_yojson = string_to_yojson

let service_pipeline_to_yojson = 
  fun (x: service_pipeline) -> assoc_to_yojson(
    [(
         "lastSucceededDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id));
       (
         "lastAttemptedDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id));
       (
         "spec",
         (option_to_yojson spec_contents_to_yojson x.spec));
       (
         "deploymentStatusMessage",
         (option_to_yojson status_message_to_yojson x.deployment_status_message));
       (
         "deploymentStatus",
         (Some (deployment_status_to_yojson x.deployment_status)));
       (
         "templateMinorVersion",
         (Some (template_version_part_to_yojson x.template_minor_version)));
       (
         "templateMajorVersion",
         (Some (template_version_part_to_yojson x.template_major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "lastDeploymentSucceededAt",
         (Some (base_timestamp_to_yojson x.last_deployment_succeeded_at)));
       (
         "lastDeploymentAttemptedAt",
         (Some (base_timestamp_to_yojson x.last_deployment_attempted_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (arn_to_yojson x.arn)));
       
  ])

let update_service_pipeline_output_to_yojson = 
  fun (x: update_service_pipeline_output) -> assoc_to_yojson(
    [(
         "pipeline",
         (Some (service_pipeline_to_yojson x.pipeline)));
       
  ])

let deployment_update_type_to_yojson = 
  fun (x: deployment_update_type) -> match x with 
 
| NONE -> `String "NONE"
  | CURRENT_VERSION -> `String "CURRENT_VERSION"
  | MINOR_VERSION -> `String "MINOR_VERSION"
  | MAJOR_VERSION -> `String "MAJOR_VERSION"
   

let update_service_pipeline_input_to_yojson = 
  fun (x: update_service_pipeline_input) -> assoc_to_yojson(
    [(
         "templateMinorVersion",
         (option_to_yojson template_version_part_to_yojson x.template_minor_version));
       (
         "templateMajorVersion",
         (option_to_yojson template_version_part_to_yojson x.template_major_version));
       (
         "deploymentType",
         (Some (deployment_update_type_to_yojson x.deployment_type)));
       (
         "spec",
         (Some (spec_contents_to_yojson x.spec)));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let service_arn_to_yojson = string_to_yojson

let service_status_to_yojson = 
  fun (x: service_status) -> match x with 
 
| CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_FAILED_CLEANUP_IN_PROGRESS -> `String "CREATE_FAILED_CLEANUP_IN_PROGRESS"
  | CREATE_FAILED_CLEANUP_COMPLETE -> `String "CREATE_FAILED_CLEANUP_COMPLETE"
  | CREATE_FAILED_CLEANUP_FAILED -> `String "CREATE_FAILED_CLEANUP_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | ACTIVE -> `String "ACTIVE"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_FAILED_CLEANUP_IN_PROGRESS -> `String "UPDATE_FAILED_CLEANUP_IN_PROGRESS"
  | UPDATE_FAILED_CLEANUP_COMPLETE -> `String "UPDATE_FAILED_CLEANUP_COMPLETE"
  | UPDATE_FAILED_CLEANUP_FAILED -> `String "UPDATE_FAILED_CLEANUP_FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATE_COMPLETE_CLEANUP_FAILED -> `String "UPDATE_COMPLETE_CLEANUP_FAILED"
   

let repository_id_to_yojson = string_to_yojson

let service_to_yojson = 
  fun (x: service) -> assoc_to_yojson(
    [(
         "branchName",
         (option_to_yojson git_branch_name_to_yojson x.branch_name));
       (
         "repositoryId",
         (option_to_yojson repository_id_to_yojson x.repository_id));
       (
         "repositoryConnectionArn",
         (option_to_yojson arn_to_yojson x.repository_connection_arn));
       (
         "pipeline",
         (option_to_yojson service_pipeline_to_yojson x.pipeline));
       (
         "spec",
         (Some (spec_contents_to_yojson x.spec)));
       (
         "statusMessage",
         (option_to_yojson status_message_to_yojson x.status_message));
       (
         "status",
         (Some (service_status_to_yojson x.status)));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "arn",
         (Some (service_arn_to_yojson x.arn)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let update_service_output_to_yojson = 
  fun (x: update_service_output) -> assoc_to_yojson(
    [(
         "service",
         (Some (service_to_yojson x.service)));
       
  ])

let service_instance_arn_to_yojson = string_to_yojson

let service_instance_to_yojson = 
  fun (x: service_instance) -> assoc_to_yojson(
    [(
         "lastSucceededDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id));
       (
         "lastAttemptedDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id));
       (
         "lastClientRequestToken",
         (option_to_yojson base_string_to_yojson x.last_client_request_token));
       (
         "spec",
         (option_to_yojson spec_contents_to_yojson x.spec));
       (
         "deploymentStatusMessage",
         (option_to_yojson status_message_to_yojson x.deployment_status_message));
       (
         "deploymentStatus",
         (Some (deployment_status_to_yojson x.deployment_status)));
       (
         "templateMinorVersion",
         (Some (template_version_part_to_yojson x.template_minor_version)));
       (
         "templateMajorVersion",
         (Some (template_version_part_to_yojson x.template_major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       (
         "lastDeploymentSucceededAt",
         (Some (base_timestamp_to_yojson x.last_deployment_succeeded_at)));
       (
         "lastDeploymentAttemptedAt",
         (Some (base_timestamp_to_yojson x.last_deployment_attempted_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (service_instance_arn_to_yojson x.arn)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let update_service_instance_output_to_yojson = 
  fun (x: update_service_instance_output) -> assoc_to_yojson(
    [(
         "serviceInstance",
         (Some (service_instance_to_yojson x.service_instance)));
       
  ])

let client_token_to_yojson = string_to_yojson

let update_service_instance_input_to_yojson = 
  fun (x: update_service_instance_input) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "templateMinorVersion",
         (option_to_yojson template_version_part_to_yojson x.template_minor_version));
       (
         "templateMajorVersion",
         (option_to_yojson template_version_part_to_yojson x.template_major_version));
       (
         "spec",
         (option_to_yojson spec_contents_to_yojson x.spec));
       (
         "deploymentType",
         (Some (deployment_update_type_to_yojson x.deployment_type)));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let update_service_input_to_yojson = 
  fun (x: update_service_input) -> assoc_to_yojson(
    [(
         "spec",
         (option_to_yojson spec_contents_to_yojson x.spec));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let service_quota_exceeded_exception_to_yojson = 
  fun (x: service_quota_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (Some (error_message_to_yojson x.message)));
       
  ])

let environment_template_version_arn_to_yojson = string_to_yojson

let environment_template_version_to_yojson = 
  fun (x: environment_template_version) -> assoc_to_yojson(
    [(
         "schema",
         (option_to_yojson template_schema_to_yojson x.schema));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (environment_template_version_arn_to_yojson x.arn)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "statusMessage",
         (option_to_yojson status_message_to_yojson x.status_message));
       (
         "status",
         (Some (template_version_status_to_yojson x.status)));
       (
         "recommendedMinorVersion",
         (option_to_yojson template_version_part_to_yojson x.recommended_minor_version));
       (
         "minorVersion",
         (Some (template_version_part_to_yojson x.minor_version)));
       (
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let update_environment_template_version_output_to_yojson = 
  fun (x: update_environment_template_version_output) -> assoc_to_yojson(
    [(
         "environmentTemplateVersion",
         (Some (environment_template_version_to_yojson x.environment_template_version)));
       
  ])

let update_environment_template_version_input_to_yojson = 
  fun (x: update_environment_template_version_input) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson template_version_status_to_yojson x.status));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "minorVersion",
         (Some (template_version_part_to_yojson x.minor_version)));
       (
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let environment_template_arn_to_yojson = string_to_yojson

let environment_template_to_yojson = 
  fun (x: environment_template) -> assoc_to_yojson(
    [(
         "provisioning",
         (option_to_yojson provisioning_to_yojson x.provisioning));
       (
         "encryptionKey",
         (option_to_yojson arn_to_yojson x.encryption_key));
       (
         "recommendedVersion",
         (option_to_yojson full_template_version_number_to_yojson x.recommended_version));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "displayName",
         (option_to_yojson display_name_to_yojson x.display_name));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (environment_template_arn_to_yojson x.arn)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let update_environment_template_output_to_yojson = 
  fun (x: update_environment_template_output) -> assoc_to_yojson(
    [(
         "environmentTemplate",
         (Some (environment_template_to_yojson x.environment_template)));
       
  ])

let update_environment_template_input_to_yojson = 
  fun (x: update_environment_template_input) -> assoc_to_yojson(
    [(
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "displayName",
         (option_to_yojson display_name_to_yojson x.display_name));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let environment_arn_to_yojson = string_to_yojson

let environment_account_connection_id_to_yojson = string_to_yojson

let aws_account_id_to_yojson = string_to_yojson

let repository_arn_to_yojson = string_to_yojson

let repository_branch_to_yojson = 
  fun (x: repository_branch) -> assoc_to_yojson(
    [(
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "name",
         (Some (repository_name_to_yojson x.name)));
       (
         "provider",
         (Some (repository_provider_to_yojson x.provider)));
       (
         "arn",
         (Some (repository_arn_to_yojson x.arn)));
       
  ])

let role_arn_to_yojson = string_to_yojson

let environment_to_yojson = 
  fun (x: environment) -> assoc_to_yojson(
    [(
         "lastSucceededDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id));
       (
         "lastAttemptedDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id));
       (
         "codebuildRoleArn",
         (option_to_yojson role_arn_to_yojson x.codebuild_role_arn));
       (
         "componentRoleArn",
         (option_to_yojson role_arn_to_yojson x.component_role_arn));
       (
         "provisioningRepository",
         (option_to_yojson repository_branch_to_yojson x.provisioning_repository));
       (
         "provisioning",
         (option_to_yojson provisioning_to_yojson x.provisioning));
       (
         "spec",
         (option_to_yojson spec_contents_to_yojson x.spec));
       (
         "environmentAccountId",
         (option_to_yojson aws_account_id_to_yojson x.environment_account_id));
       (
         "environmentAccountConnectionId",
         (option_to_yojson environment_account_connection_id_to_yojson x.environment_account_connection_id));
       (
         "protonServiceRoleArn",
         (option_to_yojson arn_to_yojson x.proton_service_role_arn));
       (
         "deploymentStatusMessage",
         (option_to_yojson status_message_to_yojson x.deployment_status_message));
       (
         "deploymentStatus",
         (Some (deployment_status_to_yojson x.deployment_status)));
       (
         "templateMinorVersion",
         (Some (template_version_part_to_yojson x.template_minor_version)));
       (
         "templateMajorVersion",
         (Some (template_version_part_to_yojson x.template_major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "arn",
         (Some (environment_arn_to_yojson x.arn)));
       (
         "lastDeploymentSucceededAt",
         (Some (base_timestamp_to_yojson x.last_deployment_succeeded_at)));
       (
         "lastDeploymentAttemptedAt",
         (Some (base_timestamp_to_yojson x.last_deployment_attempted_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let update_environment_output_to_yojson = 
  fun (x: update_environment_output) -> assoc_to_yojson(
    [(
         "environment",
         (Some (environment_to_yojson x.environment)));
       
  ])

let repository_branch_input_to_yojson = 
  fun (x: repository_branch_input) -> assoc_to_yojson(
    [(
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "name",
         (Some (repository_name_to_yojson x.name)));
       (
         "provider",
         (Some (repository_provider_to_yojson x.provider)));
       
  ])

let update_environment_input_to_yojson = 
  fun (x: update_environment_input) -> assoc_to_yojson(
    [(
         "codebuildRoleArn",
         (option_to_yojson role_arn_to_yojson x.codebuild_role_arn));
       (
         "componentRoleArn",
         (option_to_yojson role_arn_to_yojson x.component_role_arn));
       (
         "provisioningRepository",
         (option_to_yojson repository_branch_input_to_yojson x.provisioning_repository));
       (
         "environmentAccountConnectionId",
         (option_to_yojson environment_account_connection_id_to_yojson x.environment_account_connection_id));
       (
         "deploymentType",
         (Some (deployment_update_type_to_yojson x.deployment_type)));
       (
         "protonServiceRoleArn",
         (option_to_yojson arn_to_yojson x.proton_service_role_arn));
       (
         "templateMinorVersion",
         (option_to_yojson template_version_part_to_yojson x.template_minor_version));
       (
         "templateMajorVersion",
         (option_to_yojson template_version_part_to_yojson x.template_major_version));
       (
         "spec",
         (option_to_yojson spec_contents_to_yojson x.spec));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let environment_account_connection_arn_to_yojson = string_to_yojson

let environment_account_connection_status_to_yojson = 
  fun (x: environment_account_connection_status) -> match x with 
 
| PENDING -> `String "PENDING"
  | CONNECTED -> `String "CONNECTED"
  | REJECTED -> `String "REJECTED"
   

let environment_account_connection_to_yojson = 
  fun (x: environment_account_connection) -> assoc_to_yojson(
    [(
         "codebuildRoleArn",
         (option_to_yojson role_arn_to_yojson x.codebuild_role_arn));
       (
         "componentRoleArn",
         (option_to_yojson role_arn_to_yojson x.component_role_arn));
       (
         "status",
         (Some (environment_account_connection_status_to_yojson x.status)));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "requestedAt",
         (Some (base_timestamp_to_yojson x.requested_at)));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       (
         "roleArn",
         (Some (arn_to_yojson x.role_arn)));
       (
         "environmentAccountId",
         (Some (aws_account_id_to_yojson x.environment_account_id)));
       (
         "managementAccountId",
         (Some (aws_account_id_to_yojson x.management_account_id)));
       (
         "arn",
         (Some (environment_account_connection_arn_to_yojson x.arn)));
       (
         "id",
         (Some (environment_account_connection_id_to_yojson x.id)));
       
  ])

let update_environment_account_connection_output_to_yojson = 
  fun (x: update_environment_account_connection_output) -> assoc_to_yojson(
    [(
         "environmentAccountConnection",
         (Some (environment_account_connection_to_yojson x.environment_account_connection)));
       
  ])

let update_environment_account_connection_input_to_yojson = 
  fun (x: update_environment_account_connection_input) -> assoc_to_yojson(
    [(
         "codebuildRoleArn",
         (option_to_yojson role_arn_to_yojson x.codebuild_role_arn));
       (
         "componentRoleArn",
         (option_to_yojson role_arn_to_yojson x.component_role_arn));
       (
         "roleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "id",
         (Some (environment_account_connection_id_to_yojson x.id)));
       
  ])

let component_arn_to_yojson = string_to_yojson

let component_to_yojson = 
  fun (x: component) -> assoc_to_yojson(
    [(
         "lastSucceededDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id));
       (
         "lastAttemptedDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id));
       (
         "lastClientRequestToken",
         (option_to_yojson base_string_to_yojson x.last_client_request_token));
       (
         "serviceSpec",
         (option_to_yojson spec_contents_to_yojson x.service_spec));
       (
         "deploymentStatusMessage",
         (option_to_yojson status_message_to_yojson x.deployment_status_message));
       (
         "deploymentStatus",
         (Some (deployment_status_to_yojson x.deployment_status)));
       (
         "lastDeploymentSucceededAt",
         (option_to_yojson base_timestamp_to_yojson x.last_deployment_succeeded_at));
       (
         "lastDeploymentAttemptedAt",
         (option_to_yojson base_timestamp_to_yojson x.last_deployment_attempted_at));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_to_yojson x.service_instance_name));
       (
         "serviceName",
         (option_to_yojson resource_name_to_yojson x.service_name));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       (
         "arn",
         (Some (component_arn_to_yojson x.arn)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let update_component_output_to_yojson = 
  fun (x: update_component_output) -> assoc_to_yojson(
    [(
         "component",
         (Some (component_to_yojson x.component)));
       
  ])

let component_deployment_update_type_to_yojson = 
  fun (x: component_deployment_update_type) -> match x with 
  | NONE -> `String "NONE"
    | CURRENT_VERSION -> `String "CURRENT_VERSION"
     

let resource_name_or_empty_to_yojson = string_to_yojson

let template_file_contents_to_yojson = string_to_yojson

let update_component_input_to_yojson = 
  fun (x: update_component_input) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "templateFile",
         (option_to_yojson template_file_contents_to_yojson x.template_file));
       (
         "serviceSpec",
         (option_to_yojson spec_contents_to_yojson x.service_spec));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_or_empty_to_yojson x.service_instance_name));
       (
         "serviceName",
         (option_to_yojson resource_name_or_empty_to_yojson x.service_name));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "deploymentType",
         (Some (component_deployment_update_type_to_yojson x.deployment_type)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let role_arn_or_empty_string_to_yojson = string_to_yojson

let account_settings_to_yojson = 
  fun (x: account_settings) -> assoc_to_yojson(
    [(
         "pipelineCodebuildRoleArn",
         (option_to_yojson role_arn_or_empty_string_to_yojson x.pipeline_codebuild_role_arn));
       (
         "pipelineProvisioningRepository",
         (option_to_yojson repository_branch_to_yojson x.pipeline_provisioning_repository));
       (
         "pipelineServiceRoleArn",
         (option_to_yojson role_arn_or_empty_string_to_yojson x.pipeline_service_role_arn));
       
  ])

let update_account_settings_output_to_yojson = 
  fun (x: update_account_settings_output) -> assoc_to_yojson(
    [(
         "accountSettings",
         (Some (account_settings_to_yojson x.account_settings)));
       
  ])

let base_boolean_to_yojson = bool_to_yojson

let update_account_settings_input_to_yojson = 
  fun (x: update_account_settings_input) -> assoc_to_yojson(
    [(
         "pipelineCodebuildRoleArn",
         (option_to_yojson role_arn_or_empty_string_to_yojson x.pipeline_codebuild_role_arn));
       (
         "deletePipelineProvisioningRepository",
         (option_to_yojson base_boolean_to_yojson x.delete_pipeline_provisioning_repository));
       (
         "pipelineProvisioningRepository",
         (option_to_yojson repository_branch_input_to_yojson x.pipeline_provisioning_repository));
       (
         "pipelineServiceRoleArn",
         (option_to_yojson role_arn_or_empty_string_to_yojson x.pipeline_service_role_arn));
       
  ])

let untag_resource_output_to_yojson = 
  fun (x: untag_resource_output) -> assoc_to_yojson(
    [
  ])

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson = 
  fun (x: untag_resource_input) -> assoc_to_yojson(
    [(
         "tagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let s3_bucket_to_yojson = string_to_yojson

let s3_key_to_yojson = string_to_yojson

let s3_object_source_to_yojson = 
  fun (x: s3_object_source) -> assoc_to_yojson(
    [(
         "key",
         (Some (s3_key_to_yojson x.key)));
       (
         "bucket",
         (Some (s3_bucket_to_yojson x.bucket)));
       
  ])

let template_version_source_input_to_yojson = 
  fun (x: template_version_source_input) -> 
  match x with 
    | S3(arg) -> assoc_to_yojson ["s3", Some (s3_object_source_to_yojson arg)]
      
      
    

let template_manifest_contents_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_resource_output_to_yojson = 
  fun (x: tag_resource_output) -> assoc_to_yojson(
    [
  ])

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "value",
         (Some (tag_value_to_yojson x.value)));
       (
         "key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson = 
  fun (x: tag_resource_input) -> assoc_to_yojson(
    [(
         "tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let sync_type_to_yojson = 
  fun (x: sync_type) -> match x with 
 
| TEMPLATE_SYNC -> `String "TEMPLATE_SYNC"
  | SERVICE_SYNC -> `String "SERVICE_SYNC"
   

let sort_order_to_yojson = 
  fun (x: sort_order) -> match x with 
  | ASCENDING -> `String "ASCENDING"
    | DESCENDING -> `String "DESCENDING"
     

let service_template_version_summary_to_yojson = 
  fun (x: service_template_version_summary) -> assoc_to_yojson(
    [(
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (service_template_version_arn_to_yojson x.arn)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "statusMessage",
         (option_to_yojson status_message_to_yojson x.status_message));
       (
         "status",
         (Some (template_version_status_to_yojson x.status)));
       (
         "recommendedMinorVersion",
         (option_to_yojson template_version_part_to_yojson x.recommended_minor_version));
       (
         "minorVersion",
         (Some (template_version_part_to_yojson x.minor_version)));
       (
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let service_template_version_summary_list_to_yojson = 
  fun tree -> list_to_yojson service_template_version_summary_to_yojson tree

let service_template_summary_to_yojson = 
  fun (x: service_template_summary) -> assoc_to_yojson(
    [(
         "pipelineProvisioning",
         (option_to_yojson provisioning_to_yojson x.pipeline_provisioning));
       (
         "recommendedVersion",
         (option_to_yojson full_template_version_number_to_yojson x.recommended_version));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "displayName",
         (option_to_yojson display_name_to_yojson x.display_name));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (service_template_arn_to_yojson x.arn)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let service_template_summary_list_to_yojson = 
  fun tree -> list_to_yojson service_template_summary_to_yojson tree

let latest_sync_blockers_to_yojson = 
  fun tree -> list_to_yojson sync_blocker_to_yojson tree

let service_sync_blocker_summary_to_yojson = 
  fun (x: service_sync_blocker_summary) -> assoc_to_yojson(
    [(
         "latestBlockers",
         (option_to_yojson latest_sync_blockers_to_yojson x.latest_blockers));
       (
         "serviceInstanceName",
         (option_to_yojson base_string_to_yojson x.service_instance_name));
       (
         "serviceName",
         (Some (base_string_to_yojson x.service_name)));
       
  ])

let service_summary_to_yojson = 
  fun (x: service_summary) -> assoc_to_yojson(
    [(
         "statusMessage",
         (option_to_yojson status_message_to_yojson x.status_message));
       (
         "status",
         (Some (service_status_to_yojson x.status)));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "arn",
         (Some (service_arn_to_yojson x.arn)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let service_summary_list_to_yojson = 
  fun tree -> list_to_yojson service_summary_to_yojson tree

let service_pipeline_state_to_yojson = 
  fun (x: service_pipeline_state) -> assoc_to_yojson(
    [(
         "templateMinorVersion",
         (Some (template_version_part_to_yojson x.template_minor_version)));
       (
         "templateMajorVersion",
         (Some (template_version_part_to_yojson x.template_major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "spec",
         (option_to_yojson spec_contents_to_yojson x.spec));
       
  ])

let service_instance_summary_to_yojson = 
  fun (x: service_instance_summary) -> assoc_to_yojson(
    [(
         "lastSucceededDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id));
       (
         "lastAttemptedDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id));
       (
         "deploymentStatusMessage",
         (option_to_yojson status_message_to_yojson x.deployment_status_message));
       (
         "deploymentStatus",
         (Some (deployment_status_to_yojson x.deployment_status)));
       (
         "templateMinorVersion",
         (Some (template_version_part_to_yojson x.template_minor_version)));
       (
         "templateMajorVersion",
         (Some (template_version_part_to_yojson x.template_major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       (
         "lastDeploymentSucceededAt",
         (Some (base_timestamp_to_yojson x.last_deployment_succeeded_at)));
       (
         "lastDeploymentAttemptedAt",
         (Some (base_timestamp_to_yojson x.last_deployment_attempted_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (service_instance_arn_to_yojson x.arn)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let service_instance_summary_list_to_yojson = 
  fun tree -> list_to_yojson service_instance_summary_to_yojson tree

let component_deployment_id_list_to_yojson = 
  fun tree -> list_to_yojson deployment_id_to_yojson tree

let service_instance_state_to_yojson = 
  fun (x: service_instance_state) -> assoc_to_yojson(
    [(
         "lastSuccessfulServicePipelineDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_successful_service_pipeline_deployment_id));
       (
         "lastSuccessfulEnvironmentDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_successful_environment_deployment_id));
       (
         "lastSuccessfulComponentDeploymentIds",
         (option_to_yojson component_deployment_id_list_to_yojson x.last_successful_component_deployment_ids));
       (
         "templateMinorVersion",
         (Some (template_version_part_to_yojson x.template_minor_version)));
       (
         "templateMajorVersion",
         (Some (template_version_part_to_yojson x.template_major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "spec",
         (Some (spec_contents_to_yojson x.spec)));
       
  ])

let sh_a_to_yojson = string_to_yojson

let revision_to_yojson = 
  fun (x: revision) -> assoc_to_yojson(
    [(
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "directory",
         (Some (base_string_to_yojson x.directory)));
       (
         "sha",
         (Some (sh_a_to_yojson x.sha)));
       (
         "repositoryProvider",
         (Some (repository_provider_to_yojson x.repository_provider)));
       (
         "repositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       
  ])

let resource_sync_status_to_yojson = 
  fun (x: resource_sync_status) -> match x with 
 
| INITIATED -> `String "INITIATED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
   

let resource_sync_event_to_yojson = 
  fun (x: resource_sync_event) -> assoc_to_yojson(
    [(
         "event",
         (Some (base_string_to_yojson x.event)));
       (
         "time",
         (Some (base_timestamp_to_yojson x.time)));
       (
         "externalId",
         (option_to_yojson base_string_to_yojson x.external_id));
       (
         "type",
         (Some (base_string_to_yojson x.type_)));
       
  ])

let resource_sync_events_to_yojson = 
  fun tree -> list_to_yojson resource_sync_event_to_yojson tree

let resource_sync_attempt_to_yojson = 
  fun (x: resource_sync_attempt) -> assoc_to_yojson(
    [(
         "events",
         (Some (resource_sync_events_to_yojson x.events)));
       (
         "status",
         (Some (resource_sync_status_to_yojson x.status)));
       (
         "startedAt",
         (Some (base_timestamp_to_yojson x.started_at)));
       (
         "target",
         (Some (base_string_to_yojson x.target)));
       (
         "targetRevision",
         (Some (revision_to_yojson x.target_revision)));
       (
         "initialRevision",
         (Some (revision_to_yojson x.initial_revision)));
       
  ])

let resource_deployment_status_to_yojson = 
  fun (x: resource_deployment_status) -> match x with 
 
| IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
   

let base_integer_to_yojson = int_to_yojson

let resource_counts_summary_to_yojson = 
  fun (x: resource_counts_summary) -> assoc_to_yojson(
    [(
         "behindMinor",
         (option_to_yojson base_integer_to_yojson x.behind_minor));
       (
         "behindMajor",
         (option_to_yojson base_integer_to_yojson x.behind_major));
       (
         "upToDate",
         (option_to_yojson base_integer_to_yojson x.up_to_date));
       (
         "failed",
         (option_to_yojson base_integer_to_yojson x.failed));
       (
         "total",
         (Some (base_integer_to_yojson x.total)));
       
  ])

let repository_sync_status_to_yojson = 
  fun (x: repository_sync_status) -> match x with 
 
| INITIATED -> `String "INITIATED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | QUEUED -> `String "QUEUED"
   

let repository_sync_event_to_yojson = 
  fun (x: repository_sync_event) -> assoc_to_yojson(
    [(
         "event",
         (Some (base_string_to_yojson x.event)));
       (
         "time",
         (Some (base_timestamp_to_yojson x.time)));
       (
         "externalId",
         (option_to_yojson base_string_to_yojson x.external_id));
       (
         "type",
         (Some (base_string_to_yojson x.type_)));
       
  ])

let repository_sync_events_to_yojson = 
  fun tree -> list_to_yojson repository_sync_event_to_yojson tree

let repository_sync_definition_to_yojson = 
  fun (x: repository_sync_definition) -> assoc_to_yojson(
    [(
         "directory",
         (Some (base_string_to_yojson x.directory)));
       (
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "parent",
         (Some (base_string_to_yojson x.parent)));
       (
         "target",
         (Some (base_string_to_yojson x.target)));
       
  ])

let repository_sync_definition_list_to_yojson = 
  fun tree -> list_to_yojson repository_sync_definition_to_yojson tree

let repository_sync_attempt_to_yojson = 
  fun (x: repository_sync_attempt) -> assoc_to_yojson(
    [(
         "events",
         (Some (repository_sync_events_to_yojson x.events)));
       (
         "status",
         (Some (repository_sync_status_to_yojson x.status)));
       (
         "startedAt",
         (Some (base_timestamp_to_yojson x.started_at)));
       
  ])

let repository_summary_to_yojson = 
  fun (x: repository_summary) -> assoc_to_yojson(
    [(
         "connectionArn",
         (Some (arn_to_yojson x.connection_arn)));
       (
         "name",
         (Some (repository_name_to_yojson x.name)));
       (
         "provider",
         (Some (repository_provider_to_yojson x.provider)));
       (
         "arn",
         (Some (repository_arn_to_yojson x.arn)));
       
  ])

let repository_summary_list_to_yojson = 
  fun tree -> list_to_yojson repository_summary_to_yojson tree

let repository_to_yojson = 
  fun (x: repository) -> assoc_to_yojson(
    [(
         "encryptionKey",
         (option_to_yojson arn_to_yojson x.encryption_key));
       (
         "connectionArn",
         (Some (arn_to_yojson x.connection_arn)));
       (
         "name",
         (Some (repository_name_to_yojson x.name)));
       (
         "provider",
         (Some (repository_provider_to_yojson x.provider)));
       (
         "arn",
         (Some (repository_arn_to_yojson x.arn)));
       
  ])

let reject_environment_account_connection_output_to_yojson = 
  fun (x: reject_environment_account_connection_output) -> assoc_to_yojson(
    [(
         "environmentAccountConnection",
         (Some (environment_account_connection_to_yojson x.environment_account_connection)));
       
  ])

let reject_environment_account_connection_input_to_yojson = 
  fun (x: reject_environment_account_connection_input) -> assoc_to_yojson(
    [(
         "id",
         (Some (environment_account_connection_id_to_yojson x.id)));
       
  ])

let provisioned_resource_name_to_yojson = string_to_yojson

let provisioned_resource_identifier_to_yojson = string_to_yojson

let provisioned_resource_engine_to_yojson = 
  fun (x: provisioned_resource_engine) -> match x with 
 
| CLOUDFORMATION -> `String "CLOUDFORMATION"
  | TERRAFORM -> `String "TERRAFORM"
   

let provisioned_resource_to_yojson = 
  fun (x: provisioned_resource) -> assoc_to_yojson(
    [(
         "provisioningEngine",
         (option_to_yojson provisioned_resource_engine_to_yojson x.provisioning_engine));
       (
         "identifier",
         (option_to_yojson provisioned_resource_identifier_to_yojson x.identifier));
       (
         "name",
         (option_to_yojson provisioned_resource_name_to_yojson x.name));
       
  ])

let provisioned_resource_list_to_yojson = 
  fun tree -> list_to_yojson provisioned_resource_to_yojson tree

let output_key_to_yojson = string_to_yojson

let output_value_string_to_yojson = string_to_yojson

let output_to_yojson = 
  fun (x: output) -> assoc_to_yojson(
    [(
         "valueString",
         (option_to_yojson output_value_string_to_yojson x.value_string));
       (
         "key",
         (option_to_yojson output_key_to_yojson x.key));
       
  ])

let outputs_list_to_yojson = 
  fun tree -> list_to_yojson output_to_yojson tree

let notify_resource_deployment_status_change_output_to_yojson = 
  fun (x: notify_resource_deployment_status_change_output) -> assoc_to_yojson(
    [
  ])

let notify_resource_deployment_status_change_input_to_yojson = 
  fun (x: notify_resource_deployment_status_change_input) -> assoc_to_yojson(
    [(
         "statusMessage",
         (option_to_yojson status_message_to_yojson x.status_message));
       (
         "deploymentId",
         (option_to_yojson deployment_id_to_yojson x.deployment_id));
       (
         "outputs",
         (option_to_yojson outputs_list_to_yojson x.outputs));
       (
         "status",
         (option_to_yojson resource_deployment_status_to_yojson x.status));
       (
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let next_token_to_yojson = string_to_yojson

let max_page_results_to_yojson = int_to_yojson

let list_tags_for_resource_output_to_yojson = 
  fun (x: list_tags_for_resource_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "tags",
         (Some (tag_list_to_yojson x.tags)));
       
  ])

let list_tags_for_resource_input_to_yojson = 
  fun (x: list_tags_for_resource_input) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let list_services_output_to_yojson = 
  fun (x: list_services_output) -> assoc_to_yojson(
    [(
         "services",
         (Some (service_summary_list_to_yojson x.services)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_services_input_to_yojson = 
  fun (x: list_services_input) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_service_templates_output_to_yojson = 
  fun (x: list_service_templates_output) -> assoc_to_yojson(
    [(
         "templates",
         (Some (service_template_summary_list_to_yojson x.templates)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_service_templates_input_to_yojson = 
  fun (x: list_service_templates_input) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_service_template_versions_output_to_yojson = 
  fun (x: list_service_template_versions_output) -> assoc_to_yojson(
    [(
         "templateVersions",
         (Some (service_template_version_summary_list_to_yojson x.template_versions)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_service_template_versions_input_to_yojson = 
  fun (x: list_service_template_versions_input) -> assoc_to_yojson(
    [(
         "majorVersion",
         (option_to_yojson template_version_part_to_yojson x.major_version));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let empty_next_token_to_yojson = string_to_yojson

let list_service_pipeline_provisioned_resources_output_to_yojson = 
  fun (x: list_service_pipeline_provisioned_resources_output) -> assoc_to_yojson(
    [(
         "provisionedResources",
         (Some (provisioned_resource_list_to_yojson x.provisioned_resources)));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       
  ])

let list_service_pipeline_provisioned_resources_input_to_yojson = 
  fun (x: list_service_pipeline_provisioned_resources_input) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let list_service_pipeline_outputs_output_to_yojson = 
  fun (x: list_service_pipeline_outputs_output) -> assoc_to_yojson(
    [(
         "outputs",
         (Some (outputs_list_to_yojson x.outputs)));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       
  ])

let list_service_pipeline_outputs_input_to_yojson = 
  fun (x: list_service_pipeline_outputs_input) -> assoc_to_yojson(
    [(
         "deploymentId",
         (option_to_yojson deployment_id_to_yojson x.deployment_id));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let list_service_instances_sort_by_to_yojson = 
  fun (x: list_service_instances_sort_by) -> match x with 
 
| NAME -> `String "name"
  | DEPLOYMENT_STATUS -> `String "deploymentStatus"
  | TEMPLATE_NAME -> `String "templateName"
  | SERVICE_NAME -> `String "serviceName"
  | ENVIRONMENT_NAME -> `String "environmentName"
  | LAST_DEPLOYMENT_ATTEMPTED_AT -> `String "lastDeploymentAttemptedAt"
  | CREATED_AT -> `String "createdAt"
   

let list_service_instances_output_to_yojson = 
  fun (x: list_service_instances_output) -> assoc_to_yojson(
    [(
         "serviceInstances",
         (Some (service_instance_summary_list_to_yojson x.service_instances)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_service_instances_filter_by_to_yojson = 
  fun (x: list_service_instances_filter_by) -> match x with 
 
| NAME -> `String "name"
  | DEPLOYMENT_STATUS -> `String "deploymentStatus"
  | TEMPLATE_NAME -> `String "templateName"
  | SERVICE_NAME -> `String "serviceName"
  | DEPLOYED_TEMPLATE_VERSION_STATUS -> `String "deployedTemplateVersionStatus"
  | ENVIRONMENT_NAME -> `String "environmentName"
  | LAST_DEPLOYMENT_ATTEMPTED_AT_BEFORE -> `String "lastDeploymentAttemptedAtBefore"
  | LAST_DEPLOYMENT_ATTEMPTED_AT_AFTER -> `String "lastDeploymentAttemptedAtAfter"
  | CREATED_AT_BEFORE -> `String "createdAtBefore"
  | CREATED_AT_AFTER -> `String "createdAtAfter"
   

let list_service_instances_filter_value_to_yojson = string_to_yojson

let list_service_instances_filter_to_yojson = 
  fun (x: list_service_instances_filter) -> assoc_to_yojson(
    [(
         "value",
         (option_to_yojson list_service_instances_filter_value_to_yojson x.value));
       (
         "key",
         (option_to_yojson list_service_instances_filter_by_to_yojson x.key));
       
  ])

let list_service_instances_filter_list_to_yojson = 
  fun tree -> list_to_yojson list_service_instances_filter_to_yojson tree

let list_service_instances_input_to_yojson = 
  fun (x: list_service_instances_input) -> assoc_to_yojson(
    [(
         "sortOrder",
         (option_to_yojson sort_order_to_yojson x.sort_order));
       (
         "sortBy",
         (option_to_yojson list_service_instances_sort_by_to_yojson x.sort_by));
       (
         "filters",
         (option_to_yojson list_service_instances_filter_list_to_yojson x.filters));
       (
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "serviceName",
         (option_to_yojson resource_name_to_yojson x.service_name));
       
  ])

let list_service_instance_provisioned_resources_output_to_yojson = 
  fun (x: list_service_instance_provisioned_resources_output) -> assoc_to_yojson(
    [(
         "provisionedResources",
         (Some (provisioned_resource_list_to_yojson x.provisioned_resources)));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       
  ])

let list_service_instance_provisioned_resources_input_to_yojson = 
  fun (x: list_service_instance_provisioned_resources_input) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       (
         "serviceInstanceName",
         (Some (resource_name_to_yojson x.service_instance_name)));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let list_service_instance_outputs_output_to_yojson = 
  fun (x: list_service_instance_outputs_output) -> assoc_to_yojson(
    [(
         "outputs",
         (Some (outputs_list_to_yojson x.outputs)));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       
  ])

let list_service_instance_outputs_input_to_yojson = 
  fun (x: list_service_instance_outputs_input) -> assoc_to_yojson(
    [(
         "deploymentId",
         (option_to_yojson deployment_id_to_yojson x.deployment_id));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       (
         "serviceInstanceName",
         (Some (resource_name_to_yojson x.service_instance_name)));
       
  ])

let list_repository_sync_definitions_output_to_yojson = 
  fun (x: list_repository_sync_definitions_output) -> assoc_to_yojson(
    [(
         "syncDefinitions",
         (Some (repository_sync_definition_list_to_yojson x.sync_definitions)));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       
  ])

let list_repository_sync_definitions_input_to_yojson = 
  fun (x: list_repository_sync_definitions_input) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       (
         "syncType",
         (Some (sync_type_to_yojson x.sync_type)));
       (
         "repositoryProvider",
         (Some (repository_provider_to_yojson x.repository_provider)));
       (
         "repositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       
  ])

let list_repositories_output_to_yojson = 
  fun (x: list_repositories_output) -> assoc_to_yojson(
    [(
         "repositories",
         (Some (repository_summary_list_to_yojson x.repositories)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_repositories_input_to_yojson = 
  fun (x: list_repositories_input) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let environment_summary_to_yojson = 
  fun (x: environment_summary) -> assoc_to_yojson(
    [(
         "lastSucceededDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id));
       (
         "lastAttemptedDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id));
       (
         "componentRoleArn",
         (option_to_yojson arn_to_yojson x.component_role_arn));
       (
         "provisioning",
         (option_to_yojson provisioning_to_yojson x.provisioning));
       (
         "environmentAccountId",
         (option_to_yojson aws_account_id_to_yojson x.environment_account_id));
       (
         "environmentAccountConnectionId",
         (option_to_yojson environment_account_connection_id_to_yojson x.environment_account_connection_id));
       (
         "protonServiceRoleArn",
         (option_to_yojson arn_to_yojson x.proton_service_role_arn));
       (
         "deploymentStatusMessage",
         (option_to_yojson status_message_to_yojson x.deployment_status_message));
       (
         "deploymentStatus",
         (Some (deployment_status_to_yojson x.deployment_status)));
       (
         "templateMinorVersion",
         (Some (template_version_part_to_yojson x.template_minor_version)));
       (
         "templateMajorVersion",
         (Some (template_version_part_to_yojson x.template_major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "arn",
         (Some (environment_arn_to_yojson x.arn)));
       (
         "lastDeploymentSucceededAt",
         (Some (base_timestamp_to_yojson x.last_deployment_succeeded_at)));
       (
         "lastDeploymentAttemptedAt",
         (Some (base_timestamp_to_yojson x.last_deployment_attempted_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let environment_summary_list_to_yojson = 
  fun tree -> list_to_yojson environment_summary_to_yojson tree

let list_environments_output_to_yojson = 
  fun (x: list_environments_output) -> assoc_to_yojson(
    [(
         "environments",
         (Some (environment_summary_list_to_yojson x.environments)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let environment_template_filter_to_yojson = 
  fun (x: environment_template_filter) -> assoc_to_yojson(
    [(
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let environment_template_filter_list_to_yojson = 
  fun tree -> list_to_yojson environment_template_filter_to_yojson tree

let list_environments_input_to_yojson = 
  fun (x: list_environments_input) -> assoc_to_yojson(
    [(
         "environmentTemplates",
         (option_to_yojson environment_template_filter_list_to_yojson x.environment_templates));
       (
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let environment_template_summary_to_yojson = 
  fun (x: environment_template_summary) -> assoc_to_yojson(
    [(
         "provisioning",
         (option_to_yojson provisioning_to_yojson x.provisioning));
       (
         "recommendedVersion",
         (option_to_yojson full_template_version_number_to_yojson x.recommended_version));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "displayName",
         (option_to_yojson display_name_to_yojson x.display_name));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (environment_template_arn_to_yojson x.arn)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let environment_template_summary_list_to_yojson = 
  fun tree -> list_to_yojson environment_template_summary_to_yojson tree

let list_environment_templates_output_to_yojson = 
  fun (x: list_environment_templates_output) -> assoc_to_yojson(
    [(
         "templates",
         (Some (environment_template_summary_list_to_yojson x.templates)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_environment_templates_input_to_yojson = 
  fun (x: list_environment_templates_input) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let environment_template_version_summary_to_yojson = 
  fun (x: environment_template_version_summary) -> assoc_to_yojson(
    [(
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "arn",
         (Some (environment_template_version_arn_to_yojson x.arn)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "statusMessage",
         (option_to_yojson status_message_to_yojson x.status_message));
       (
         "status",
         (Some (template_version_status_to_yojson x.status)));
       (
         "recommendedMinorVersion",
         (option_to_yojson template_version_part_to_yojson x.recommended_minor_version));
       (
         "minorVersion",
         (Some (template_version_part_to_yojson x.minor_version)));
       (
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let environment_template_version_summary_list_to_yojson = 
  fun tree -> list_to_yojson environment_template_version_summary_to_yojson tree

let list_environment_template_versions_output_to_yojson = 
  fun (x: list_environment_template_versions_output) -> assoc_to_yojson(
    [(
         "templateVersions",
         (Some (environment_template_version_summary_list_to_yojson x.template_versions)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_environment_template_versions_input_to_yojson = 
  fun (x: list_environment_template_versions_input) -> assoc_to_yojson(
    [(
         "majorVersion",
         (option_to_yojson template_version_part_to_yojson x.major_version));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_environment_provisioned_resources_output_to_yojson = 
  fun (x: list_environment_provisioned_resources_output) -> assoc_to_yojson(
    [(
         "provisionedResources",
         (Some (provisioned_resource_list_to_yojson x.provisioned_resources)));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       
  ])

let list_environment_provisioned_resources_input_to_yojson = 
  fun (x: list_environment_provisioned_resources_input) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       
  ])

let list_environment_outputs_output_to_yojson = 
  fun (x: list_environment_outputs_output) -> assoc_to_yojson(
    [(
         "outputs",
         (Some (outputs_list_to_yojson x.outputs)));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       
  ])

let list_environment_outputs_input_to_yojson = 
  fun (x: list_environment_outputs_input) -> assoc_to_yojson(
    [(
         "deploymentId",
         (option_to_yojson deployment_id_to_yojson x.deployment_id));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       
  ])

let environment_account_connection_summary_to_yojson = 
  fun (x: environment_account_connection_summary) -> assoc_to_yojson(
    [(
         "componentRoleArn",
         (option_to_yojson arn_to_yojson x.component_role_arn));
       (
         "status",
         (Some (environment_account_connection_status_to_yojson x.status)));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "requestedAt",
         (Some (base_timestamp_to_yojson x.requested_at)));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       (
         "roleArn",
         (Some (arn_to_yojson x.role_arn)));
       (
         "environmentAccountId",
         (Some (aws_account_id_to_yojson x.environment_account_id)));
       (
         "managementAccountId",
         (Some (aws_account_id_to_yojson x.management_account_id)));
       (
         "arn",
         (Some (environment_account_connection_arn_to_yojson x.arn)));
       (
         "id",
         (Some (environment_account_connection_id_to_yojson x.id)));
       
  ])

let environment_account_connection_summary_list_to_yojson = 
  fun tree -> list_to_yojson environment_account_connection_summary_to_yojson tree

let list_environment_account_connections_output_to_yojson = 
  fun (x: list_environment_account_connections_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "environmentAccountConnections",
         (Some (environment_account_connection_summary_list_to_yojson x.environment_account_connections)));
       
  ])

let environment_account_connection_requester_account_type_to_yojson = 
  fun (x: environment_account_connection_requester_account_type) -> match x with 
 
| MANAGEMENT_ACCOUNT -> `String "MANAGEMENT_ACCOUNT"
  | ENVIRONMENT_ACCOUNT -> `String "ENVIRONMENT_ACCOUNT"
   

let environment_account_connection_status_list_to_yojson = 
  fun tree -> list_to_yojson environment_account_connection_status_to_yojson tree

let list_environment_account_connections_input_to_yojson = 
  fun (x: list_environment_account_connections_input) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "statuses",
         (option_to_yojson environment_account_connection_status_list_to_yojson x.statuses));
       (
         "environmentName",
         (option_to_yojson resource_name_to_yojson x.environment_name));
       (
         "requestedBy",
         (Some (environment_account_connection_requester_account_type_to_yojson x.requested_by)));
       
  ])

let deployment_arn_to_yojson = string_to_yojson

let deployment_target_resource_type_to_yojson = 
  fun (x: deployment_target_resource_type) -> match x with 
 
| ENVIRONMENT -> `String "ENVIRONMENT"
  | SERVICE_PIPELINE -> `String "SERVICE_PIPELINE"
  | SERVICE_INSTANCE -> `String "SERVICE_INSTANCE"
  | COMPONENT -> `String "COMPONENT"
   

let deployment_summary_to_yojson = 
  fun (x: deployment_summary) -> assoc_to_yojson(
    [(
         "deploymentStatus",
         (Some (deployment_status_to_yojson x.deployment_status)));
       (
         "lastSucceededDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id));
       (
         "lastAttemptedDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id));
       (
         "componentName",
         (option_to_yojson resource_name_to_yojson x.component_name));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_to_yojson x.service_instance_name));
       (
         "serviceName",
         (option_to_yojson resource_name_to_yojson x.service_name));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       (
         "completedAt",
         (option_to_yojson base_timestamp_to_yojson x.completed_at));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "targetResourceType",
         (Some (deployment_target_resource_type_to_yojson x.target_resource_type)));
       (
         "targetResourceCreatedAt",
         (Some (base_timestamp_to_yojson x.target_resource_created_at)));
       (
         "targetArn",
         (Some (arn_to_yojson x.target_arn)));
       (
         "arn",
         (Some (deployment_arn_to_yojson x.arn)));
       (
         "id",
         (Some (deployment_id_to_yojson x.id)));
       
  ])

let deployment_summary_list_to_yojson = 
  fun tree -> list_to_yojson deployment_summary_to_yojson tree

let list_deployments_output_to_yojson = 
  fun (x: list_deployments_output) -> assoc_to_yojson(
    [(
         "deployments",
         (Some (deployment_summary_list_to_yojson x.deployments)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_deployments_input_to_yojson = 
  fun (x: list_deployments_input) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "componentName",
         (option_to_yojson resource_name_to_yojson x.component_name));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_to_yojson x.service_instance_name));
       (
         "serviceName",
         (option_to_yojson resource_name_to_yojson x.service_name));
       (
         "environmentName",
         (option_to_yojson resource_name_to_yojson x.environment_name));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let component_summary_to_yojson = 
  fun (x: component_summary) -> assoc_to_yojson(
    [(
         "lastSucceededDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id));
       (
         "lastAttemptedDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id));
       (
         "deploymentStatusMessage",
         (option_to_yojson status_message_to_yojson x.deployment_status_message));
       (
         "deploymentStatus",
         (Some (deployment_status_to_yojson x.deployment_status)));
       (
         "lastDeploymentSucceededAt",
         (option_to_yojson base_timestamp_to_yojson x.last_deployment_succeeded_at));
       (
         "lastDeploymentAttemptedAt",
         (option_to_yojson base_timestamp_to_yojson x.last_deployment_attempted_at));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_to_yojson x.service_instance_name));
       (
         "serviceName",
         (option_to_yojson resource_name_to_yojson x.service_name));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       (
         "arn",
         (Some (component_arn_to_yojson x.arn)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let component_summary_list_to_yojson = 
  fun tree -> list_to_yojson component_summary_to_yojson tree

let list_components_output_to_yojson = 
  fun (x: list_components_output) -> assoc_to_yojson(
    [(
         "components",
         (Some (component_summary_list_to_yojson x.components)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_components_input_to_yojson = 
  fun (x: list_components_input) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson max_page_results_to_yojson x.max_results));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_to_yojson x.service_instance_name));
       (
         "serviceName",
         (option_to_yojson resource_name_to_yojson x.service_name));
       (
         "environmentName",
         (option_to_yojson resource_name_to_yojson x.environment_name));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_component_provisioned_resources_output_to_yojson = 
  fun (x: list_component_provisioned_resources_output) -> assoc_to_yojson(
    [(
         "provisionedResources",
         (Some (provisioned_resource_list_to_yojson x.provisioned_resources)));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       
  ])

let list_component_provisioned_resources_input_to_yojson = 
  fun (x: list_component_provisioned_resources_input) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       (
         "componentName",
         (Some (resource_name_to_yojson x.component_name)));
       
  ])

let list_component_outputs_output_to_yojson = 
  fun (x: list_component_outputs_output) -> assoc_to_yojson(
    [(
         "outputs",
         (Some (outputs_list_to_yojson x.outputs)));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       
  ])

let list_component_outputs_input_to_yojson = 
  fun (x: list_component_outputs_input) -> assoc_to_yojson(
    [(
         "deploymentId",
         (option_to_yojson deployment_id_to_yojson x.deployment_id));
       (
         "nextToken",
         (option_to_yojson empty_next_token_to_yojson x.next_token));
       (
         "componentName",
         (Some (resource_name_to_yojson x.component_name)));
       
  ])

let get_template_sync_status_output_to_yojson = 
  fun (x: get_template_sync_status_output) -> assoc_to_yojson(
    [(
         "desiredState",
         (option_to_yojson revision_to_yojson x.desired_state));
       (
         "latestSuccessfulSync",
         (option_to_yojson resource_sync_attempt_to_yojson x.latest_successful_sync));
       (
         "latestSync",
         (option_to_yojson resource_sync_attempt_to_yojson x.latest_sync));
       
  ])

let get_template_sync_status_input_to_yojson = 
  fun (x: get_template_sync_status_input) -> assoc_to_yojson(
    [(
         "templateVersion",
         (Some (template_version_part_to_yojson x.template_version)));
       (
         "templateType",
         (Some (template_type_to_yojson x.template_type)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let get_template_sync_config_output_to_yojson = 
  fun (x: get_template_sync_config_output) -> assoc_to_yojson(
    [(
         "templateSyncConfig",
         (option_to_yojson template_sync_config_to_yojson x.template_sync_config));
       
  ])

let get_template_sync_config_input_to_yojson = 
  fun (x: get_template_sync_config_input) -> assoc_to_yojson(
    [(
         "templateType",
         (Some (template_type_to_yojson x.template_type)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let get_service_template_version_output_to_yojson = 
  fun (x: get_service_template_version_output) -> assoc_to_yojson(
    [(
         "serviceTemplateVersion",
         (Some (service_template_version_to_yojson x.service_template_version)));
       
  ])

let get_service_template_version_input_to_yojson = 
  fun (x: get_service_template_version_input) -> assoc_to_yojson(
    [(
         "minorVersion",
         (Some (template_version_part_to_yojson x.minor_version)));
       (
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let get_service_template_output_to_yojson = 
  fun (x: get_service_template_output) -> assoc_to_yojson(
    [(
         "serviceTemplate",
         (Some (service_template_to_yojson x.service_template)));
       
  ])

let get_service_template_input_to_yojson = 
  fun (x: get_service_template_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let get_service_sync_config_output_to_yojson = 
  fun (x: get_service_sync_config_output) -> assoc_to_yojson(
    [(
         "serviceSyncConfig",
         (option_to_yojson service_sync_config_to_yojson x.service_sync_config));
       
  ])

let get_service_sync_config_input_to_yojson = 
  fun (x: get_service_sync_config_input) -> assoc_to_yojson(
    [(
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let get_service_sync_blocker_summary_output_to_yojson = 
  fun (x: get_service_sync_blocker_summary_output) -> assoc_to_yojson(
    [(
         "serviceSyncBlockerSummary",
         (option_to_yojson service_sync_blocker_summary_to_yojson x.service_sync_blocker_summary));
       
  ])

let get_service_sync_blocker_summary_input_to_yojson = 
  fun (x: get_service_sync_blocker_summary_input) -> assoc_to_yojson(
    [(
         "serviceInstanceName",
         (option_to_yojson resource_name_to_yojson x.service_instance_name));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let get_service_output_to_yojson = 
  fun (x: get_service_output) -> assoc_to_yojson(
    [(
         "service",
         (option_to_yojson service_to_yojson x.service));
       
  ])

let get_service_instance_sync_status_output_to_yojson = 
  fun (x: get_service_instance_sync_status_output) -> assoc_to_yojson(
    [(
         "desiredState",
         (option_to_yojson revision_to_yojson x.desired_state));
       (
         "latestSuccessfulSync",
         (option_to_yojson resource_sync_attempt_to_yojson x.latest_successful_sync));
       (
         "latestSync",
         (option_to_yojson resource_sync_attempt_to_yojson x.latest_sync));
       
  ])

let get_service_instance_sync_status_input_to_yojson = 
  fun (x: get_service_instance_sync_status_input) -> assoc_to_yojson(
    [(
         "serviceInstanceName",
         (Some (resource_name_to_yojson x.service_instance_name)));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let get_service_instance_output_to_yojson = 
  fun (x: get_service_instance_output) -> assoc_to_yojson(
    [(
         "serviceInstance",
         (Some (service_instance_to_yojson x.service_instance)));
       
  ])

let get_service_instance_input_to_yojson = 
  fun (x: get_service_instance_input) -> assoc_to_yojson(
    [(
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let get_service_input_to_yojson = 
  fun (x: get_service_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let counts_summary_to_yojson = 
  fun (x: counts_summary) -> assoc_to_yojson(
    [(
         "pipelines",
         (option_to_yojson resource_counts_summary_to_yojson x.pipelines));
       (
         "serviceTemplates",
         (option_to_yojson resource_counts_summary_to_yojson x.service_templates));
       (
         "services",
         (option_to_yojson resource_counts_summary_to_yojson x.services));
       (
         "serviceInstances",
         (option_to_yojson resource_counts_summary_to_yojson x.service_instances));
       (
         "environmentTemplates",
         (option_to_yojson resource_counts_summary_to_yojson x.environment_templates));
       (
         "environments",
         (option_to_yojson resource_counts_summary_to_yojson x.environments));
       (
         "components",
         (option_to_yojson resource_counts_summary_to_yojson x.components));
       
  ])

let get_resources_summary_output_to_yojson = 
  fun (x: get_resources_summary_output) -> assoc_to_yojson(
    [(
         "counts",
         (Some (counts_summary_to_yojson x.counts)));
       
  ])

let get_resources_summary_input_to_yojson = 
  fun (x: get_resources_summary_input) -> assoc_to_yojson(
    [
  ])

let get_repository_sync_status_output_to_yojson = 
  fun (x: get_repository_sync_status_output) -> assoc_to_yojson(
    [(
         "latestSync",
         (option_to_yojson repository_sync_attempt_to_yojson x.latest_sync));
       
  ])

let get_repository_sync_status_input_to_yojson = 
  fun (x: get_repository_sync_status_input) -> assoc_to_yojson(
    [(
         "syncType",
         (Some (sync_type_to_yojson x.sync_type)));
       (
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "repositoryProvider",
         (Some (repository_provider_to_yojson x.repository_provider)));
       (
         "repositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       
  ])

let get_repository_output_to_yojson = 
  fun (x: get_repository_output) -> assoc_to_yojson(
    [(
         "repository",
         (Some (repository_to_yojson x.repository)));
       
  ])

let get_repository_input_to_yojson = 
  fun (x: get_repository_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (repository_name_to_yojson x.name)));
       (
         "provider",
         (Some (repository_provider_to_yojson x.provider)));
       
  ])

let get_environment_template_version_output_to_yojson = 
  fun (x: get_environment_template_version_output) -> assoc_to_yojson(
    [(
         "environmentTemplateVersion",
         (Some (environment_template_version_to_yojson x.environment_template_version)));
       
  ])

let get_environment_template_version_input_to_yojson = 
  fun (x: get_environment_template_version_input) -> assoc_to_yojson(
    [(
         "minorVersion",
         (Some (template_version_part_to_yojson x.minor_version)));
       (
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let get_environment_template_output_to_yojson = 
  fun (x: get_environment_template_output) -> assoc_to_yojson(
    [(
         "environmentTemplate",
         (Some (environment_template_to_yojson x.environment_template)));
       
  ])

let get_environment_template_input_to_yojson = 
  fun (x: get_environment_template_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let get_environment_output_to_yojson = 
  fun (x: get_environment_output) -> assoc_to_yojson(
    [(
         "environment",
         (Some (environment_to_yojson x.environment)));
       
  ])

let get_environment_input_to_yojson = 
  fun (x: get_environment_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let get_environment_account_connection_output_to_yojson = 
  fun (x: get_environment_account_connection_output) -> assoc_to_yojson(
    [(
         "environmentAccountConnection",
         (Some (environment_account_connection_to_yojson x.environment_account_connection)));
       
  ])

let get_environment_account_connection_input_to_yojson = 
  fun (x: get_environment_account_connection_input) -> assoc_to_yojson(
    [(
         "id",
         (Some (environment_account_connection_id_to_yojson x.id)));
       
  ])

let environment_state_to_yojson = 
  fun (x: environment_state) -> assoc_to_yojson(
    [(
         "templateMinorVersion",
         (Some (template_version_part_to_yojson x.template_minor_version)));
       (
         "templateMajorVersion",
         (Some (template_version_part_to_yojson x.template_major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "spec",
         (option_to_yojson spec_contents_to_yojson x.spec));
       
  ])

let component_state_to_yojson = 
  fun (x: component_state) -> assoc_to_yojson(
    [(
         "templateFile",
         (option_to_yojson template_file_contents_to_yojson x.template_file));
       (
         "serviceSpec",
         (option_to_yojson spec_contents_to_yojson x.service_spec));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_or_empty_to_yojson x.service_instance_name));
       (
         "serviceName",
         (option_to_yojson resource_name_or_empty_to_yojson x.service_name));
       
  ])

let deployment_state_to_yojson = 
  fun (x: deployment_state) -> 
  match x with 
    | Component(arg) -> assoc_to_yojson ["component", Some (component_state_to_yojson arg)]
      | ServicePipeline(arg) -> assoc_to_yojson ["servicePipeline", Some (service_pipeline_state_to_yojson arg)]
      | Environment(arg) -> assoc_to_yojson ["environment", Some (environment_state_to_yojson arg)]
      | ServiceInstance(arg) -> assoc_to_yojson ["serviceInstance", Some (service_instance_state_to_yojson arg)]
      
      
    

let deployment_to_yojson = 
  fun (x: deployment) -> assoc_to_yojson(
    [(
         "targetState",
         (option_to_yojson deployment_state_to_yojson x.target_state));
       (
         "initialState",
         (option_to_yojson deployment_state_to_yojson x.initial_state));
       (
         "lastSucceededDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_succeeded_deployment_id));
       (
         "lastAttemptedDeploymentId",
         (option_to_yojson deployment_id_to_yojson x.last_attempted_deployment_id));
       (
         "completedAt",
         (option_to_yojson base_timestamp_to_yojson x.completed_at));
       (
         "lastModifiedAt",
         (Some (base_timestamp_to_yojson x.last_modified_at)));
       (
         "createdAt",
         (Some (base_timestamp_to_yojson x.created_at)));
       (
         "deploymentStatusMessage",
         (option_to_yojson status_message_to_yojson x.deployment_status_message));
       (
         "deploymentStatus",
         (Some (deployment_status_to_yojson x.deployment_status)));
       (
         "componentName",
         (option_to_yojson resource_name_to_yojson x.component_name));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_to_yojson x.service_instance_name));
       (
         "serviceName",
         (option_to_yojson resource_name_to_yojson x.service_name));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       (
         "targetResourceType",
         (Some (deployment_target_resource_type_to_yojson x.target_resource_type)));
       (
         "targetResourceCreatedAt",
         (Some (base_timestamp_to_yojson x.target_resource_created_at)));
       (
         "targetArn",
         (Some (arn_to_yojson x.target_arn)));
       (
         "arn",
         (Some (deployment_arn_to_yojson x.arn)));
       (
         "id",
         (Some (deployment_id_to_yojson x.id)));
       
  ])

let get_deployment_output_to_yojson = 
  fun (x: get_deployment_output) -> assoc_to_yojson(
    [(
         "deployment",
         (option_to_yojson deployment_to_yojson x.deployment));
       
  ])

let get_deployment_input_to_yojson = 
  fun (x: get_deployment_input) -> assoc_to_yojson(
    [(
         "componentName",
         (option_to_yojson resource_name_to_yojson x.component_name));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_to_yojson x.service_instance_name));
       (
         "serviceName",
         (option_to_yojson resource_name_to_yojson x.service_name));
       (
         "environmentName",
         (option_to_yojson resource_name_to_yojson x.environment_name));
       (
         "id",
         (Some (deployment_id_to_yojson x.id)));
       
  ])

let get_component_output_to_yojson = 
  fun (x: get_component_output) -> assoc_to_yojson(
    [(
         "component",
         (option_to_yojson component_to_yojson x.component));
       
  ])

let get_component_input_to_yojson = 
  fun (x: get_component_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let get_account_settings_output_to_yojson = 
  fun (x: get_account_settings_output) -> assoc_to_yojson(
    [(
         "accountSettings",
         (option_to_yojson account_settings_to_yojson x.account_settings));
       
  ])

let get_account_settings_input_to_yojson = 
  fun (x: get_account_settings_input) -> assoc_to_yojson(
    [
  ])

let delete_template_sync_config_output_to_yojson = 
  fun (x: delete_template_sync_config_output) -> assoc_to_yojson(
    [(
         "templateSyncConfig",
         (option_to_yojson template_sync_config_to_yojson x.template_sync_config));
       
  ])

let delete_template_sync_config_input_to_yojson = 
  fun (x: delete_template_sync_config_input) -> assoc_to_yojson(
    [(
         "templateType",
         (Some (template_type_to_yojson x.template_type)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let delete_service_template_version_output_to_yojson = 
  fun (x: delete_service_template_version_output) -> assoc_to_yojson(
    [(
         "serviceTemplateVersion",
         (option_to_yojson service_template_version_to_yojson x.service_template_version));
       
  ])

let delete_service_template_version_input_to_yojson = 
  fun (x: delete_service_template_version_input) -> assoc_to_yojson(
    [(
         "minorVersion",
         (Some (template_version_part_to_yojson x.minor_version)));
       (
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let delete_service_template_output_to_yojson = 
  fun (x: delete_service_template_output) -> assoc_to_yojson(
    [(
         "serviceTemplate",
         (option_to_yojson service_template_to_yojson x.service_template));
       
  ])

let delete_service_template_input_to_yojson = 
  fun (x: delete_service_template_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let delete_service_sync_config_output_to_yojson = 
  fun (x: delete_service_sync_config_output) -> assoc_to_yojson(
    [(
         "serviceSyncConfig",
         (option_to_yojson service_sync_config_to_yojson x.service_sync_config));
       
  ])

let delete_service_sync_config_input_to_yojson = 
  fun (x: delete_service_sync_config_input) -> assoc_to_yojson(
    [(
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let delete_service_output_to_yojson = 
  fun (x: delete_service_output) -> assoc_to_yojson(
    [(
         "service",
         (option_to_yojson service_to_yojson x.service));
       
  ])

let delete_service_input_to_yojson = 
  fun (x: delete_service_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let delete_repository_output_to_yojson = 
  fun (x: delete_repository_output) -> assoc_to_yojson(
    [(
         "repository",
         (option_to_yojson repository_to_yojson x.repository));
       
  ])

let delete_repository_input_to_yojson = 
  fun (x: delete_repository_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (repository_name_to_yojson x.name)));
       (
         "provider",
         (Some (repository_provider_to_yojson x.provider)));
       
  ])

let delete_environment_template_version_output_to_yojson = 
  fun (x: delete_environment_template_version_output) -> assoc_to_yojson(
    [(
         "environmentTemplateVersion",
         (option_to_yojson environment_template_version_to_yojson x.environment_template_version));
       
  ])

let delete_environment_template_version_input_to_yojson = 
  fun (x: delete_environment_template_version_input) -> assoc_to_yojson(
    [(
         "minorVersion",
         (Some (template_version_part_to_yojson x.minor_version)));
       (
         "majorVersion",
         (Some (template_version_part_to_yojson x.major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let delete_environment_template_output_to_yojson = 
  fun (x: delete_environment_template_output) -> assoc_to_yojson(
    [(
         "environmentTemplate",
         (option_to_yojson environment_template_to_yojson x.environment_template));
       
  ])

let delete_environment_template_input_to_yojson = 
  fun (x: delete_environment_template_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let delete_environment_output_to_yojson = 
  fun (x: delete_environment_output) -> assoc_to_yojson(
    [(
         "environment",
         (option_to_yojson environment_to_yojson x.environment));
       
  ])

let delete_environment_input_to_yojson = 
  fun (x: delete_environment_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let delete_environment_account_connection_output_to_yojson = 
  fun (x: delete_environment_account_connection_output) -> assoc_to_yojson(
    [(
         "environmentAccountConnection",
         (option_to_yojson environment_account_connection_to_yojson x.environment_account_connection));
       
  ])

let delete_environment_account_connection_input_to_yojson = 
  fun (x: delete_environment_account_connection_input) -> assoc_to_yojson(
    [(
         "id",
         (Some (environment_account_connection_id_to_yojson x.id)));
       
  ])

let delete_deployment_output_to_yojson = 
  fun (x: delete_deployment_output) -> assoc_to_yojson(
    [(
         "deployment",
         (option_to_yojson deployment_to_yojson x.deployment));
       
  ])

let delete_deployment_input_to_yojson = 
  fun (x: delete_deployment_input) -> assoc_to_yojson(
    [(
         "id",
         (Some (deployment_id_to_yojson x.id)));
       
  ])

let delete_component_output_to_yojson = 
  fun (x: delete_component_output) -> assoc_to_yojson(
    [(
         "component",
         (option_to_yojson component_to_yojson x.component));
       
  ])

let delete_component_input_to_yojson = 
  fun (x: delete_component_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_template_sync_config_output_to_yojson = 
  fun (x: create_template_sync_config_output) -> assoc_to_yojson(
    [(
         "templateSyncConfig",
         (option_to_yojson template_sync_config_to_yojson x.template_sync_config));
       
  ])

let create_template_sync_config_input_to_yojson = 
  fun (x: create_template_sync_config_input) -> assoc_to_yojson(
    [(
         "subdirectory",
         (option_to_yojson subdirectory_to_yojson x.subdirectory));
       (
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "repositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       (
         "repositoryProvider",
         (Some (repository_provider_to_yojson x.repository_provider)));
       (
         "templateType",
         (Some (template_type_to_yojson x.template_type)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       
  ])

let create_service_template_version_output_to_yojson = 
  fun (x: create_service_template_version_output) -> assoc_to_yojson(
    [(
         "serviceTemplateVersion",
         (Some (service_template_version_to_yojson x.service_template_version)));
       
  ])

let create_service_template_version_input_to_yojson = 
  fun (x: create_service_template_version_input) -> assoc_to_yojson(
    [(
         "supportedComponentSources",
         (option_to_yojson service_template_supported_component_source_input_list_to_yojson x.supported_component_sources));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "compatibleEnvironmentTemplates",
         (Some (compatible_environment_template_input_list_to_yojson x.compatible_environment_templates)));
       (
         "source",
         (Some (template_version_source_input_to_yojson x.source)));
       (
         "majorVersion",
         (option_to_yojson template_version_part_to_yojson x.major_version));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       
  ])

let create_service_template_output_to_yojson = 
  fun (x: create_service_template_output) -> assoc_to_yojson(
    [(
         "serviceTemplate",
         (Some (service_template_to_yojson x.service_template)));
       
  ])

let create_service_template_input_to_yojson = 
  fun (x: create_service_template_input) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "pipelineProvisioning",
         (option_to_yojson provisioning_to_yojson x.pipeline_provisioning));
       (
         "encryptionKey",
         (option_to_yojson arn_to_yojson x.encryption_key));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "displayName",
         (option_to_yojson display_name_to_yojson x.display_name));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_service_sync_config_output_to_yojson = 
  fun (x: create_service_sync_config_output) -> assoc_to_yojson(
    [(
         "serviceSyncConfig",
         (option_to_yojson service_sync_config_to_yojson x.service_sync_config));
       
  ])

let create_service_sync_config_input_to_yojson = 
  fun (x: create_service_sync_config_input) -> assoc_to_yojson(
    [(
         "filePath",
         (Some (ops_file_path_to_yojson x.file_path)));
       (
         "branch",
         (Some (git_branch_name_to_yojson x.branch)));
       (
         "repositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       (
         "repositoryProvider",
         (Some (repository_provider_to_yojson x.repository_provider)));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let create_service_output_to_yojson = 
  fun (x: create_service_output) -> assoc_to_yojson(
    [(
         "service",
         (Some (service_to_yojson x.service)));
       
  ])

let create_service_instance_output_to_yojson = 
  fun (x: create_service_instance_output) -> assoc_to_yojson(
    [(
         "serviceInstance",
         (Some (service_instance_to_yojson x.service_instance)));
       
  ])

let create_service_instance_input_to_yojson = 
  fun (x: create_service_instance_input) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "templateMinorVersion",
         (option_to_yojson template_version_part_to_yojson x.template_minor_version));
       (
         "templateMajorVersion",
         (option_to_yojson template_version_part_to_yojson x.template_major_version));
       (
         "spec",
         (Some (spec_contents_to_yojson x.spec)));
       (
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_service_input_to_yojson = 
  fun (x: create_service_input) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "branchName",
         (option_to_yojson git_branch_name_to_yojson x.branch_name));
       (
         "repositoryId",
         (option_to_yojson repository_id_to_yojson x.repository_id));
       (
         "repositoryConnectionArn",
         (option_to_yojson arn_to_yojson x.repository_connection_arn));
       (
         "spec",
         (Some (spec_contents_to_yojson x.spec)));
       (
         "templateMinorVersion",
         (option_to_yojson template_version_part_to_yojson x.template_minor_version));
       (
         "templateMajorVersion",
         (Some (template_version_part_to_yojson x.template_major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_repository_output_to_yojson = 
  fun (x: create_repository_output) -> assoc_to_yojson(
    [(
         "repository",
         (Some (repository_to_yojson x.repository)));
       
  ])

let create_repository_input_to_yojson = 
  fun (x: create_repository_input) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "encryptionKey",
         (option_to_yojson arn_to_yojson x.encryption_key));
       (
         "connectionArn",
         (Some (arn_to_yojson x.connection_arn)));
       (
         "name",
         (Some (repository_name_to_yojson x.name)));
       (
         "provider",
         (Some (repository_provider_to_yojson x.provider)));
       
  ])

let create_environment_template_version_output_to_yojson = 
  fun (x: create_environment_template_version_output) -> assoc_to_yojson(
    [(
         "environmentTemplateVersion",
         (Some (environment_template_version_to_yojson x.environment_template_version)));
       
  ])

let create_environment_template_version_input_to_yojson = 
  fun (x: create_environment_template_version_input) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "source",
         (Some (template_version_source_input_to_yojson x.source)));
       (
         "majorVersion",
         (option_to_yojson template_version_part_to_yojson x.major_version));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       
  ])

let create_environment_template_output_to_yojson = 
  fun (x: create_environment_template_output) -> assoc_to_yojson(
    [(
         "environmentTemplate",
         (Some (environment_template_to_yojson x.environment_template)));
       
  ])

let create_environment_template_input_to_yojson = 
  fun (x: create_environment_template_input) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "provisioning",
         (option_to_yojson provisioning_to_yojson x.provisioning));
       (
         "encryptionKey",
         (option_to_yojson arn_to_yojson x.encryption_key));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "displayName",
         (option_to_yojson display_name_to_yojson x.display_name));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_environment_output_to_yojson = 
  fun (x: create_environment_output) -> assoc_to_yojson(
    [(
         "environment",
         (Some (environment_to_yojson x.environment)));
       
  ])

let create_environment_input_to_yojson = 
  fun (x: create_environment_input) -> assoc_to_yojson(
    [(
         "codebuildRoleArn",
         (option_to_yojson role_arn_to_yojson x.codebuild_role_arn));
       (
         "componentRoleArn",
         (option_to_yojson role_arn_to_yojson x.component_role_arn));
       (
         "provisioningRepository",
         (option_to_yojson repository_branch_input_to_yojson x.provisioning_repository));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "environmentAccountConnectionId",
         (option_to_yojson environment_account_connection_id_to_yojson x.environment_account_connection_id));
       (
         "protonServiceRoleArn",
         (option_to_yojson arn_to_yojson x.proton_service_role_arn));
       (
         "spec",
         (Some (spec_contents_to_yojson x.spec)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "templateMinorVersion",
         (option_to_yojson template_version_part_to_yojson x.template_minor_version));
       (
         "templateMajorVersion",
         (Some (template_version_part_to_yojson x.template_major_version)));
       (
         "templateName",
         (Some (resource_name_to_yojson x.template_name)));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_environment_account_connection_output_to_yojson = 
  fun (x: create_environment_account_connection_output) -> assoc_to_yojson(
    [(
         "environmentAccountConnection",
         (Some (environment_account_connection_to_yojson x.environment_account_connection)));
       
  ])

let create_environment_account_connection_input_to_yojson = 
  fun (x: create_environment_account_connection_input) -> assoc_to_yojson(
    [(
         "codebuildRoleArn",
         (option_to_yojson role_arn_to_yojson x.codebuild_role_arn));
       (
         "componentRoleArn",
         (option_to_yojson role_arn_to_yojson x.component_role_arn));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       (
         "roleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "managementAccountId",
         (Some (aws_account_id_to_yojson x.management_account_id)));
       (
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       
  ])

let create_component_output_to_yojson = 
  fun (x: create_component_output) -> assoc_to_yojson(
    [(
         "component",
         (Some (component_to_yojson x.component)));
       
  ])

let create_component_input_to_yojson = 
  fun (x: create_component_input) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "serviceSpec",
         (option_to_yojson spec_contents_to_yojson x.service_spec));
       (
         "manifest",
         (Some (template_manifest_contents_to_yojson x.manifest)));
       (
         "templateFile",
         (Some (template_file_contents_to_yojson x.template_file)));
       (
         "environmentName",
         (option_to_yojson resource_name_to_yojson x.environment_name));
       (
         "serviceInstanceName",
         (option_to_yojson resource_name_to_yojson x.service_instance_name));
       (
         "serviceName",
         (option_to_yojson resource_name_to_yojson x.service_name));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let cancel_service_pipeline_deployment_output_to_yojson = 
  fun (x: cancel_service_pipeline_deployment_output) -> assoc_to_yojson(
    [(
         "pipeline",
         (Some (service_pipeline_to_yojson x.pipeline)));
       
  ])

let cancel_service_pipeline_deployment_input_to_yojson = 
  fun (x: cancel_service_pipeline_deployment_input) -> assoc_to_yojson(
    [(
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       
  ])

let cancel_service_instance_deployment_output_to_yojson = 
  fun (x: cancel_service_instance_deployment_output) -> assoc_to_yojson(
    [(
         "serviceInstance",
         (Some (service_instance_to_yojson x.service_instance)));
       
  ])

let cancel_service_instance_deployment_input_to_yojson = 
  fun (x: cancel_service_instance_deployment_input) -> assoc_to_yojson(
    [(
         "serviceName",
         (Some (resource_name_to_yojson x.service_name)));
       (
         "serviceInstanceName",
         (Some (resource_name_to_yojson x.service_instance_name)));
       
  ])

let cancel_environment_deployment_output_to_yojson = 
  fun (x: cancel_environment_deployment_output) -> assoc_to_yojson(
    [(
         "environment",
         (Some (environment_to_yojson x.environment)));
       
  ])

let cancel_environment_deployment_input_to_yojson = 
  fun (x: cancel_environment_deployment_input) -> assoc_to_yojson(
    [(
         "environmentName",
         (Some (resource_name_to_yojson x.environment_name)));
       
  ])

let cancel_component_deployment_output_to_yojson = 
  fun (x: cancel_component_deployment_output) -> assoc_to_yojson(
    [(
         "component",
         (Some (component_to_yojson x.component)));
       
  ])

let cancel_component_deployment_input_to_yojson = 
  fun (x: cancel_component_deployment_input) -> assoc_to_yojson(
    [(
         "componentName",
         (Some (resource_name_to_yojson x.component_name)));
       
  ])

let accept_environment_account_connection_output_to_yojson = 
  fun (x: accept_environment_account_connection_output) -> assoc_to_yojson(
    [(
         "environmentAccountConnection",
         (Some (environment_account_connection_to_yojson x.environment_account_connection)));
       
  ])

let accept_environment_account_connection_input_to_yojson = 
  fun (x: accept_environment_account_connection_input) -> assoc_to_yojson(
    [(
         "id",
         (Some (environment_account_connection_id_to_yojson x.id)));
       
  ])

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

