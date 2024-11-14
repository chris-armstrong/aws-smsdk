open Smaws_Lib.Json.DeserializeHelpers

open Types

let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson = 
  fun tree path : validation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : validation_exception = {
    message = value_for_key (error_message_of_yojson) "message" _list path;
    
  }
  in _res

let resource_name_of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let template_type_of_yojson = 
  fun (tree: t) path : template_type -> match tree with 
    | `String "ENVIRONMENT" -> ENVIRONMENT
    | `String "SERVICE" -> SERVICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TemplateType" value)
    | _ -> raise (deserialize_wrong_type_error path "TemplateType")

let repository_provider_of_yojson = 
  fun (tree: t) path : repository_provider -> match tree with 
    | `String "GITHUB" -> GITHUB
    | `String "GITHUB_ENTERPRISE" -> GITHUB_ENTERPRISE
    | `String "BITBUCKET" -> BITBUCKET
    | `String value -> raise (deserialize_unknown_enum_value_error path "RepositoryProvider" value)
    | _ -> raise (deserialize_wrong_type_error path "RepositoryProvider")

let repository_name_of_yojson = string_of_yojson

let git_branch_name_of_yojson = string_of_yojson

let subdirectory_of_yojson = string_of_yojson

let template_sync_config_of_yojson = 
  fun tree path : template_sync_config ->
  let _list = assoc_of_yojson tree path in
  let _res : template_sync_config = {
    subdirectory = option_of_yojson (value_for_key (subdirectory_of_yojson) "subdirectory") _list path;
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "repositoryName" _list path;
    repository_provider = value_for_key (repository_provider_of_yojson) "repositoryProvider" _list path;
    template_type = value_for_key (template_type_of_yojson) "templateType" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let update_template_sync_config_output_of_yojson = 
  fun tree path : update_template_sync_config_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_template_sync_config_output = {
    template_sync_config = option_of_yojson (value_for_key (template_sync_config_of_yojson) "templateSyncConfig") _list path;
    
  }
  in _res

let update_template_sync_config_input_of_yojson = 
  fun tree path : update_template_sync_config_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_template_sync_config_input = {
    subdirectory = option_of_yojson (value_for_key (subdirectory_of_yojson) "subdirectory") _list path;
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "repositoryName" _list path;
    repository_provider = value_for_key (repository_provider_of_yojson) "repositoryProvider" _list path;
    template_type = value_for_key (template_type_of_yojson) "templateType" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let throttling_exception_of_yojson = 
  fun tree path : throttling_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : throttling_exception = {
    message = value_for_key (error_message_of_yojson) "message" _list path;
    
  }
  in _res

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = value_for_key (error_message_of_yojson) "message" _list path;
    
  }
  in _res

let internal_server_exception_of_yojson = 
  fun tree path : internal_server_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : internal_server_exception = {
    message = value_for_key (error_message_of_yojson) "message" _list path;
    
  }
  in _res

let conflict_exception_of_yojson = 
  fun tree path : conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conflict_exception = {
    message = value_for_key (error_message_of_yojson) "message" _list path;
    
  }
  in _res

let access_denied_exception_of_yojson = 
  fun tree path : access_denied_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : access_denied_exception = {
    message = value_for_key (error_message_of_yojson) "message" _list path;
    
  }
  in _res

let template_version_part_of_yojson = string_of_yojson

let template_version_status_of_yojson = 
  fun (tree: t) path : template_version_status -> match tree with 
    | `String "REGISTRATION_IN_PROGRESS" -> REGISTRATION_IN_PROGRESS
    | `String "REGISTRATION_FAILED" -> REGISTRATION_FAILED
    | `String "DRAFT" -> DRAFT
    | `String "PUBLISHED" -> PUBLISHED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TemplateVersionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TemplateVersionStatus")

let status_message_of_yojson = string_of_yojson

let description_of_yojson = string_of_yojson

let service_template_version_arn_of_yojson = string_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let compatible_environment_template_of_yojson = 
  fun tree path : compatible_environment_template ->
  let _list = assoc_of_yojson tree path in
  let _res : compatible_environment_template = {
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let compatible_environment_template_list_of_yojson = 
  fun tree path -> list_of_yojson compatible_environment_template_of_yojson tree path 

let template_schema_of_yojson = string_of_yojson

let service_template_supported_component_source_type_of_yojson = 
  fun (tree: t) path : service_template_supported_component_source_type -> match tree with 
    | `String "DIRECTLY_DEFINED" -> DIRECTLY_DEFINED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceTemplateSupportedComponentSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceTemplateSupportedComponentSourceType")

let service_template_supported_component_source_input_list_of_yojson = 
  fun tree path -> list_of_yojson service_template_supported_component_source_type_of_yojson tree path 

let service_template_version_of_yojson = 
  fun tree path : service_template_version ->
  let _list = assoc_of_yojson tree path in
  let _res : service_template_version = {
    supported_component_sources = option_of_yojson (value_for_key (service_template_supported_component_source_input_list_of_yojson) "supportedComponentSources") _list path;
    schema = option_of_yojson (value_for_key (template_schema_of_yojson) "schema") _list path;
    compatible_environment_templates = value_for_key (compatible_environment_template_list_of_yojson) "compatibleEnvironmentTemplates" _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (service_template_version_arn_of_yojson) "arn" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    status_message = option_of_yojson (value_for_key (status_message_of_yojson) "statusMessage") _list path;
    status = value_for_key (template_version_status_of_yojson) "status" _list path;
    recommended_minor_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "recommendedMinorVersion") _list path;
    minor_version = value_for_key (template_version_part_of_yojson) "minorVersion" _list path;
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let update_service_template_version_output_of_yojson = 
  fun tree path : update_service_template_version_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_template_version_output = {
    service_template_version = value_for_key (service_template_version_of_yojson) "serviceTemplateVersion" _list path;
    
  }
  in _res

let compatible_environment_template_input_of_yojson = 
  fun tree path : compatible_environment_template_input ->
  let _list = assoc_of_yojson tree path in
  let _res : compatible_environment_template_input = {
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let compatible_environment_template_input_list_of_yojson = 
  fun tree path -> list_of_yojson compatible_environment_template_input_of_yojson tree path 

let update_service_template_version_input_of_yojson = 
  fun tree path : update_service_template_version_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_template_version_input = {
    supported_component_sources = option_of_yojson (value_for_key (service_template_supported_component_source_input_list_of_yojson) "supportedComponentSources") _list path;
    compatible_environment_templates = option_of_yojson (value_for_key (compatible_environment_template_input_list_of_yojson) "compatibleEnvironmentTemplates") _list path;
    status = option_of_yojson (value_for_key (template_version_status_of_yojson) "status") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    minor_version = value_for_key (template_version_part_of_yojson) "minorVersion" _list path;
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let service_template_arn_of_yojson = string_of_yojson

let display_name_of_yojson = string_of_yojson

let full_template_version_number_of_yojson = string_of_yojson

let arn_of_yojson = string_of_yojson

let provisioning_of_yojson = 
  fun (tree: t) path : provisioning -> match tree with 
    | `String "CUSTOMER_MANAGED" -> CUSTOMER_MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Provisioning" value)
    | _ -> raise (deserialize_wrong_type_error path "Provisioning")

let service_template_of_yojson = 
  fun tree path : service_template ->
  let _list = assoc_of_yojson tree path in
  let _res : service_template = {
    pipeline_provisioning = option_of_yojson (value_for_key (provisioning_of_yojson) "pipelineProvisioning") _list path;
    encryption_key = option_of_yojson (value_for_key (arn_of_yojson) "encryptionKey") _list path;
    recommended_version = option_of_yojson (value_for_key (full_template_version_number_of_yojson) "recommendedVersion") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    display_name = option_of_yojson (value_for_key (display_name_of_yojson) "displayName") _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (service_template_arn_of_yojson) "arn" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let update_service_template_output_of_yojson = 
  fun tree path : update_service_template_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_template_output = {
    service_template = value_for_key (service_template_of_yojson) "serviceTemplate" _list path;
    
  }
  in _res

let update_service_template_input_of_yojson = 
  fun tree path : update_service_template_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_template_input = {
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    display_name = option_of_yojson (value_for_key (display_name_of_yojson) "displayName") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let ops_file_path_of_yojson = string_of_yojson

let service_sync_config_of_yojson = 
  fun tree path : service_sync_config ->
  let _list = assoc_of_yojson tree path in
  let _res : service_sync_config = {
    file_path = value_for_key (ops_file_path_of_yojson) "filePath" _list path;
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "repositoryName" _list path;
    repository_provider = value_for_key (repository_provider_of_yojson) "repositoryProvider" _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let update_service_sync_config_output_of_yojson = 
  fun tree path : update_service_sync_config_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_sync_config_output = {
    service_sync_config = option_of_yojson (value_for_key (service_sync_config_of_yojson) "serviceSyncConfig") _list path;
    
  }
  in _res

let update_service_sync_config_input_of_yojson = 
  fun tree path : update_service_sync_config_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_sync_config_input = {
    file_path = value_for_key (ops_file_path_of_yojson) "filePath" _list path;
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "repositoryName" _list path;
    repository_provider = value_for_key (repository_provider_of_yojson) "repositoryProvider" _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let blocker_type_of_yojson = 
  fun (tree: t) path : blocker_type -> match tree with 
    | `String "AUTOMATED" -> AUTOMATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockerType" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockerType")

let blocker_status_of_yojson = 
  fun (tree: t) path : blocker_status -> match tree with 
    | `String "ACTIVE" -> ACTIVE
    | `String "RESOLVED" -> RESOLVED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockerStatus")

let sync_blocker_context_of_yojson = 
  fun tree path : sync_blocker_context ->
  let _list = assoc_of_yojson tree path in
  let _res : sync_blocker_context = {
    value = value_for_key (base_string_of_yojson) "value" _list path;
    key = value_for_key (base_string_of_yojson) "key" _list path;
    
  }
  in _res

let sync_blocker_contexts_of_yojson = 
  fun tree path -> list_of_yojson sync_blocker_context_of_yojson tree path 

let sync_blocker_of_yojson = 
  fun tree path : sync_blocker ->
  let _list = assoc_of_yojson tree path in
  let _res : sync_blocker = {
    resolved_at = option_of_yojson (value_for_key (base_timestamp_of_yojson) "resolvedAt") _list path;
    resolved_reason = option_of_yojson (value_for_key (base_string_of_yojson) "resolvedReason") _list path;
    contexts = option_of_yojson (value_for_key (sync_blocker_contexts_of_yojson) "contexts") _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    created_reason = value_for_key (base_string_of_yojson) "createdReason" _list path;
    status = value_for_key (blocker_status_of_yojson) "status" _list path;
    type_ = value_for_key (blocker_type_of_yojson) "type" _list path;
    id = value_for_key (base_string_of_yojson) "id" _list path;
    
  }
  in _res

let update_service_sync_blocker_output_of_yojson = 
  fun tree path : update_service_sync_blocker_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_sync_blocker_output = {
    service_sync_blocker = value_for_key (sync_blocker_of_yojson) "serviceSyncBlocker" _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceInstanceName") _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let update_service_sync_blocker_input_of_yojson = 
  fun tree path : update_service_sync_blocker_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_sync_blocker_input = {
    resolved_reason = value_for_key (base_string_of_yojson) "resolvedReason" _list path;
    id = value_for_key (base_string_of_yojson) "id" _list path;
    
  }
  in _res

let deployment_status_of_yojson = 
  fun (tree: t) path : deployment_status -> match tree with 
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_COMPLETE" -> DELETE_COMPLETE
    | `String "CANCELLING" -> CANCELLING
    | `String "CANCELLED" -> CANCELLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentStatus")

let spec_contents_of_yojson = string_of_yojson

let deployment_id_of_yojson = string_of_yojson

let service_pipeline_of_yojson = 
  fun tree path : service_pipeline ->
  let _list = assoc_of_yojson tree path in
  let _res : service_pipeline = {
    last_succeeded_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSucceededDeploymentId") _list path;
    last_attempted_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastAttemptedDeploymentId") _list path;
    spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "spec") _list path;
    deployment_status_message = option_of_yojson (value_for_key (status_message_of_yojson) "deploymentStatusMessage") _list path;
    deployment_status = value_for_key (deployment_status_of_yojson) "deploymentStatus" _list path;
    template_minor_version = value_for_key (template_version_part_of_yojson) "templateMinorVersion" _list path;
    template_major_version = value_for_key (template_version_part_of_yojson) "templateMajorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    last_deployment_succeeded_at = value_for_key (base_timestamp_of_yojson) "lastDeploymentSucceededAt" _list path;
    last_deployment_attempted_at = value_for_key (base_timestamp_of_yojson) "lastDeploymentAttemptedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (arn_of_yojson) "arn" _list path;
    
  }
  in _res

let update_service_pipeline_output_of_yojson = 
  fun tree path : update_service_pipeline_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_pipeline_output = {
    pipeline = value_for_key (service_pipeline_of_yojson) "pipeline" _list path;
    
  }
  in _res

let deployment_update_type_of_yojson = 
  fun (tree: t) path : deployment_update_type -> match tree with 
    | `String "NONE" -> NONE
    | `String "CURRENT_VERSION" -> CURRENT_VERSION
    | `String "MINOR_VERSION" -> MINOR_VERSION
    | `String "MAJOR_VERSION" -> MAJOR_VERSION
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentUpdateType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentUpdateType")

let update_service_pipeline_input_of_yojson = 
  fun tree path : update_service_pipeline_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_pipeline_input = {
    template_minor_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "templateMinorVersion") _list path;
    template_major_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "templateMajorVersion") _list path;
    deployment_type = value_for_key (deployment_update_type_of_yojson) "deploymentType" _list path;
    spec = value_for_key (spec_contents_of_yojson) "spec" _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let service_arn_of_yojson = string_of_yojson

let service_status_of_yojson = 
  fun (tree: t) path : service_status -> match tree with 
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_FAILED_CLEANUP_IN_PROGRESS" -> CREATE_FAILED_CLEANUP_IN_PROGRESS
    | `String "CREATE_FAILED_CLEANUP_COMPLETE" -> CREATE_FAILED_CLEANUP_COMPLETE
    | `String "CREATE_FAILED_CLEANUP_FAILED" -> CREATE_FAILED_CLEANUP_FAILED
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_FAILED_CLEANUP_IN_PROGRESS" -> UPDATE_FAILED_CLEANUP_IN_PROGRESS
    | `String "UPDATE_FAILED_CLEANUP_COMPLETE" -> UPDATE_FAILED_CLEANUP_COMPLETE
    | `String "UPDATE_FAILED_CLEANUP_FAILED" -> UPDATE_FAILED_CLEANUP_FAILED
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATE_COMPLETE_CLEANUP_FAILED" -> UPDATE_COMPLETE_CLEANUP_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceStatus")

let repository_id_of_yojson = string_of_yojson

let service_of_yojson = 
  fun tree path : service ->
  let _list = assoc_of_yojson tree path in
  let _res : service = {
    branch_name = option_of_yojson (value_for_key (git_branch_name_of_yojson) "branchName") _list path;
    repository_id = option_of_yojson (value_for_key (repository_id_of_yojson) "repositoryId") _list path;
    repository_connection_arn = option_of_yojson (value_for_key (arn_of_yojson) "repositoryConnectionArn") _list path;
    pipeline = option_of_yojson (value_for_key (service_pipeline_of_yojson) "pipeline") _list path;
    spec = value_for_key (spec_contents_of_yojson) "spec" _list path;
    status_message = option_of_yojson (value_for_key (status_message_of_yojson) "statusMessage") _list path;
    status = value_for_key (service_status_of_yojson) "status" _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    arn = value_for_key (service_arn_of_yojson) "arn" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let update_service_output_of_yojson = 
  fun tree path : update_service_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_output = {
    service = value_for_key (service_of_yojson) "service" _list path;
    
  }
  in _res

let service_instance_arn_of_yojson = string_of_yojson

let service_instance_of_yojson = 
  fun tree path : service_instance ->
  let _list = assoc_of_yojson tree path in
  let _res : service_instance = {
    last_succeeded_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSucceededDeploymentId") _list path;
    last_attempted_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastAttemptedDeploymentId") _list path;
    last_client_request_token = option_of_yojson (value_for_key (base_string_of_yojson) "lastClientRequestToken") _list path;
    spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "spec") _list path;
    deployment_status_message = option_of_yojson (value_for_key (status_message_of_yojson) "deploymentStatusMessage") _list path;
    deployment_status = value_for_key (deployment_status_of_yojson) "deploymentStatus" _list path;
    template_minor_version = value_for_key (template_version_part_of_yojson) "templateMinorVersion" _list path;
    template_major_version = value_for_key (template_version_part_of_yojson) "templateMajorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    last_deployment_succeeded_at = value_for_key (base_timestamp_of_yojson) "lastDeploymentSucceededAt" _list path;
    last_deployment_attempted_at = value_for_key (base_timestamp_of_yojson) "lastDeploymentAttemptedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (service_instance_arn_of_yojson) "arn" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let update_service_instance_output_of_yojson = 
  fun tree path : update_service_instance_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_instance_output = {
    service_instance = value_for_key (service_instance_of_yojson) "serviceInstance" _list path;
    
  }
  in _res

let client_token_of_yojson = string_of_yojson

let update_service_instance_input_of_yojson = 
  fun tree path : update_service_instance_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_instance_input = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    template_minor_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "templateMinorVersion") _list path;
    template_major_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "templateMajorVersion") _list path;
    spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "spec") _list path;
    deployment_type = value_for_key (deployment_update_type_of_yojson) "deploymentType" _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let update_service_input_of_yojson = 
  fun tree path : update_service_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_input = {
    spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "spec") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let service_quota_exceeded_exception_of_yojson = 
  fun tree path : service_quota_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : service_quota_exceeded_exception = {
    message = value_for_key (error_message_of_yojson) "message" _list path;
    
  }
  in _res

let environment_template_version_arn_of_yojson = string_of_yojson

let environment_template_version_of_yojson = 
  fun tree path : environment_template_version ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_template_version = {
    schema = option_of_yojson (value_for_key (template_schema_of_yojson) "schema") _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (environment_template_version_arn_of_yojson) "arn" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    status_message = option_of_yojson (value_for_key (status_message_of_yojson) "statusMessage") _list path;
    status = value_for_key (template_version_status_of_yojson) "status" _list path;
    recommended_minor_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "recommendedMinorVersion") _list path;
    minor_version = value_for_key (template_version_part_of_yojson) "minorVersion" _list path;
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let update_environment_template_version_output_of_yojson = 
  fun tree path : update_environment_template_version_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_environment_template_version_output = {
    environment_template_version = value_for_key (environment_template_version_of_yojson) "environmentTemplateVersion" _list path;
    
  }
  in _res

let update_environment_template_version_input_of_yojson = 
  fun tree path : update_environment_template_version_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_environment_template_version_input = {
    status = option_of_yojson (value_for_key (template_version_status_of_yojson) "status") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    minor_version = value_for_key (template_version_part_of_yojson) "minorVersion" _list path;
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let environment_template_arn_of_yojson = string_of_yojson

let environment_template_of_yojson = 
  fun tree path : environment_template ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_template = {
    provisioning = option_of_yojson (value_for_key (provisioning_of_yojson) "provisioning") _list path;
    encryption_key = option_of_yojson (value_for_key (arn_of_yojson) "encryptionKey") _list path;
    recommended_version = option_of_yojson (value_for_key (full_template_version_number_of_yojson) "recommendedVersion") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    display_name = option_of_yojson (value_for_key (display_name_of_yojson) "displayName") _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (environment_template_arn_of_yojson) "arn" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let update_environment_template_output_of_yojson = 
  fun tree path : update_environment_template_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_environment_template_output = {
    environment_template = value_for_key (environment_template_of_yojson) "environmentTemplate" _list path;
    
  }
  in _res

let update_environment_template_input_of_yojson = 
  fun tree path : update_environment_template_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_environment_template_input = {
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    display_name = option_of_yojson (value_for_key (display_name_of_yojson) "displayName") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let environment_arn_of_yojson = string_of_yojson

let environment_account_connection_id_of_yojson = string_of_yojson

let aws_account_id_of_yojson = string_of_yojson

let repository_arn_of_yojson = string_of_yojson

let repository_branch_of_yojson = 
  fun tree path : repository_branch ->
  let _list = assoc_of_yojson tree path in
  let _res : repository_branch = {
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    name = value_for_key (repository_name_of_yojson) "name" _list path;
    provider = value_for_key (repository_provider_of_yojson) "provider" _list path;
    arn = value_for_key (repository_arn_of_yojson) "arn" _list path;
    
  }
  in _res

let role_arn_of_yojson = string_of_yojson

let environment_of_yojson = 
  fun tree path : environment ->
  let _list = assoc_of_yojson tree path in
  let _res : environment = {
    last_succeeded_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSucceededDeploymentId") _list path;
    last_attempted_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastAttemptedDeploymentId") _list path;
    codebuild_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "codebuildRoleArn") _list path;
    component_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "componentRoleArn") _list path;
    provisioning_repository = option_of_yojson (value_for_key (repository_branch_of_yojson) "provisioningRepository") _list path;
    provisioning = option_of_yojson (value_for_key (provisioning_of_yojson) "provisioning") _list path;
    spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "spec") _list path;
    environment_account_id = option_of_yojson (value_for_key (aws_account_id_of_yojson) "environmentAccountId") _list path;
    environment_account_connection_id = option_of_yojson (value_for_key (environment_account_connection_id_of_yojson) "environmentAccountConnectionId") _list path;
    proton_service_role_arn = option_of_yojson (value_for_key (arn_of_yojson) "protonServiceRoleArn") _list path;
    deployment_status_message = option_of_yojson (value_for_key (status_message_of_yojson) "deploymentStatusMessage") _list path;
    deployment_status = value_for_key (deployment_status_of_yojson) "deploymentStatus" _list path;
    template_minor_version = value_for_key (template_version_part_of_yojson) "templateMinorVersion" _list path;
    template_major_version = value_for_key (template_version_part_of_yojson) "templateMajorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    arn = value_for_key (environment_arn_of_yojson) "arn" _list path;
    last_deployment_succeeded_at = value_for_key (base_timestamp_of_yojson) "lastDeploymentSucceededAt" _list path;
    last_deployment_attempted_at = value_for_key (base_timestamp_of_yojson) "lastDeploymentAttemptedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let update_environment_output_of_yojson = 
  fun tree path : update_environment_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_environment_output = {
    environment = value_for_key (environment_of_yojson) "environment" _list path;
    
  }
  in _res

let repository_branch_input_of_yojson = 
  fun tree path : repository_branch_input ->
  let _list = assoc_of_yojson tree path in
  let _res : repository_branch_input = {
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    name = value_for_key (repository_name_of_yojson) "name" _list path;
    provider = value_for_key (repository_provider_of_yojson) "provider" _list path;
    
  }
  in _res

let update_environment_input_of_yojson = 
  fun tree path : update_environment_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_environment_input = {
    codebuild_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "codebuildRoleArn") _list path;
    component_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "componentRoleArn") _list path;
    provisioning_repository = option_of_yojson (value_for_key (repository_branch_input_of_yojson) "provisioningRepository") _list path;
    environment_account_connection_id = option_of_yojson (value_for_key (environment_account_connection_id_of_yojson) "environmentAccountConnectionId") _list path;
    deployment_type = value_for_key (deployment_update_type_of_yojson) "deploymentType" _list path;
    proton_service_role_arn = option_of_yojson (value_for_key (arn_of_yojson) "protonServiceRoleArn") _list path;
    template_minor_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "templateMinorVersion") _list path;
    template_major_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "templateMajorVersion") _list path;
    spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "spec") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let environment_account_connection_arn_of_yojson = string_of_yojson

let environment_account_connection_status_of_yojson = 
  fun (tree: t) path : environment_account_connection_status -> match tree with 
    | `String "PENDING" -> PENDING
    | `String "CONNECTED" -> CONNECTED
    | `String "REJECTED" -> REJECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnvironmentAccountConnectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentAccountConnectionStatus")

let environment_account_connection_of_yojson = 
  fun tree path : environment_account_connection ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_account_connection = {
    codebuild_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "codebuildRoleArn") _list path;
    component_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "componentRoleArn") _list path;
    status = value_for_key (environment_account_connection_status_of_yojson) "status" _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    requested_at = value_for_key (base_timestamp_of_yojson) "requestedAt" _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    role_arn = value_for_key (arn_of_yojson) "roleArn" _list path;
    environment_account_id = value_for_key (aws_account_id_of_yojson) "environmentAccountId" _list path;
    management_account_id = value_for_key (aws_account_id_of_yojson) "managementAccountId" _list path;
    arn = value_for_key (environment_account_connection_arn_of_yojson) "arn" _list path;
    id = value_for_key (environment_account_connection_id_of_yojson) "id" _list path;
    
  }
  in _res

let update_environment_account_connection_output_of_yojson = 
  fun tree path : update_environment_account_connection_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_environment_account_connection_output = {
    environment_account_connection = value_for_key (environment_account_connection_of_yojson) "environmentAccountConnection" _list path;
    
  }
  in _res

let update_environment_account_connection_input_of_yojson = 
  fun tree path : update_environment_account_connection_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_environment_account_connection_input = {
    codebuild_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "codebuildRoleArn") _list path;
    component_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "componentRoleArn") _list path;
    role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "roleArn") _list path;
    id = value_for_key (environment_account_connection_id_of_yojson) "id" _list path;
    
  }
  in _res

let component_arn_of_yojson = string_of_yojson

let component_of_yojson = 
  fun tree path : component ->
  let _list = assoc_of_yojson tree path in
  let _res : component = {
    last_succeeded_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSucceededDeploymentId") _list path;
    last_attempted_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastAttemptedDeploymentId") _list path;
    last_client_request_token = option_of_yojson (value_for_key (base_string_of_yojson) "lastClientRequestToken") _list path;
    service_spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "serviceSpec") _list path;
    deployment_status_message = option_of_yojson (value_for_key (status_message_of_yojson) "deploymentStatusMessage") _list path;
    deployment_status = value_for_key (deployment_status_of_yojson) "deploymentStatus" _list path;
    last_deployment_succeeded_at = option_of_yojson (value_for_key (base_timestamp_of_yojson) "lastDeploymentSucceededAt") _list path;
    last_deployment_attempted_at = option_of_yojson (value_for_key (base_timestamp_of_yojson) "lastDeploymentAttemptedAt") _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceInstanceName") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceName") _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    arn = value_for_key (component_arn_of_yojson) "arn" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let update_component_output_of_yojson = 
  fun tree path : update_component_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_component_output = {
    component = value_for_key (component_of_yojson) "component" _list path;
    
  }
  in _res

let component_deployment_update_type_of_yojson = 
  fun (tree: t) path : component_deployment_update_type -> match tree with 
    | `String "NONE" -> NONE
    | `String "CURRENT_VERSION" -> CURRENT_VERSION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComponentDeploymentUpdateType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComponentDeploymentUpdateType")

let resource_name_or_empty_of_yojson = string_of_yojson

let template_file_contents_of_yojson = string_of_yojson

let update_component_input_of_yojson = 
  fun tree path : update_component_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_component_input = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    template_file = option_of_yojson (value_for_key (template_file_contents_of_yojson) "templateFile") _list path;
    service_spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "serviceSpec") _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_or_empty_of_yojson) "serviceInstanceName") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_or_empty_of_yojson) "serviceName") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    deployment_type = value_for_key (component_deployment_update_type_of_yojson) "deploymentType" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let role_arn_or_empty_string_of_yojson = string_of_yojson

let account_settings_of_yojson = 
  fun tree path : account_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : account_settings = {
    pipeline_codebuild_role_arn = option_of_yojson (value_for_key (role_arn_or_empty_string_of_yojson) "pipelineCodebuildRoleArn") _list path;
    pipeline_provisioning_repository = option_of_yojson (value_for_key (repository_branch_of_yojson) "pipelineProvisioningRepository") _list path;
    pipeline_service_role_arn = option_of_yojson (value_for_key (role_arn_or_empty_string_of_yojson) "pipelineServiceRoleArn") _list path;
    
  }
  in _res

let update_account_settings_output_of_yojson = 
  fun tree path : update_account_settings_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_account_settings_output = {
    account_settings = value_for_key (account_settings_of_yojson) "accountSettings" _list path;
    
  }
  in _res

let base_boolean_of_yojson = bool_of_yojson

let update_account_settings_input_of_yojson = 
  fun tree path : update_account_settings_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_account_settings_input = {
    pipeline_codebuild_role_arn = option_of_yojson (value_for_key (role_arn_or_empty_string_of_yojson) "pipelineCodebuildRoleArn") _list path;
    delete_pipeline_provisioning_repository = option_of_yojson (value_for_key (base_boolean_of_yojson) "deletePipelineProvisioningRepository") _list path;
    pipeline_provisioning_repository = option_of_yojson (value_for_key (repository_branch_input_of_yojson) "pipelineProvisioningRepository") _list path;
    pipeline_service_role_arn = option_of_yojson (value_for_key (role_arn_or_empty_string_of_yojson) "pipelineServiceRoleArn") _list path;
    
  }
  in _res

let untag_resource_output_of_yojson = 
  fun tree path : untag_resource_output ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_output = ()
  in _res

let tag_key_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_input_of_yojson = 
  fun tree path : untag_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_input = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "tagKeys" _list path;
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let s3_bucket_of_yojson = string_of_yojson

let s3_key_of_yojson = string_of_yojson

let s3_object_source_of_yojson = 
  fun tree path : s3_object_source ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_object_source = {
    key = value_for_key (s3_key_of_yojson) "key" _list path;
    bucket = value_for_key (s3_bucket_of_yojson) "bucket" _list path;
    
  }
  in _res

let template_version_source_input_of_yojson = 
  fun (tree: t) path : template_version_source_input ->
  let _list = assoc_of_yojson tree path in
  let key, value_ = match _list with
    | (key, value_) :: _ -> key, value_ 
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  match key with
    | "s3" -> S3 (s3_object_source_of_yojson value_ (path))
    | _ as unknown -> raise(deserialize_unknown_enum_value_error path
                           "TemplateVersionSourceInput" unknown)
  

let template_manifest_contents_of_yojson = string_of_yojson

let tag_value_of_yojson = string_of_yojson

let tag_resource_output_of_yojson = 
  fun tree path : tag_resource_output ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_output = ()
  in _res

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = value_for_key (tag_value_of_yojson) "value" _list path;
    key = value_for_key (tag_key_of_yojson) "key" _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_resource_input_of_yojson = 
  fun tree path : tag_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_input = {
    tags = value_for_key (tag_list_of_yojson) "tags" _list path;
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let sync_type_of_yojson = 
  fun (tree: t) path : sync_type -> match tree with 
    | `String "TEMPLATE_SYNC" -> TEMPLATE_SYNC
    | `String "SERVICE_SYNC" -> SERVICE_SYNC
    | `String value -> raise (deserialize_unknown_enum_value_error path "SyncType" value)
    | _ -> raise (deserialize_wrong_type_error path "SyncType")

let sort_order_of_yojson = 
  fun (tree: t) path : sort_order -> match tree with 
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")

let service_template_version_summary_of_yojson = 
  fun tree path : service_template_version_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : service_template_version_summary = {
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (service_template_version_arn_of_yojson) "arn" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    status_message = option_of_yojson (value_for_key (status_message_of_yojson) "statusMessage") _list path;
    status = value_for_key (template_version_status_of_yojson) "status" _list path;
    recommended_minor_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "recommendedMinorVersion") _list path;
    minor_version = value_for_key (template_version_part_of_yojson) "minorVersion" _list path;
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let service_template_version_summary_list_of_yojson = 
  fun tree path -> list_of_yojson service_template_version_summary_of_yojson tree path 

let service_template_summary_of_yojson = 
  fun tree path : service_template_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : service_template_summary = {
    pipeline_provisioning = option_of_yojson (value_for_key (provisioning_of_yojson) "pipelineProvisioning") _list path;
    recommended_version = option_of_yojson (value_for_key (full_template_version_number_of_yojson) "recommendedVersion") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    display_name = option_of_yojson (value_for_key (display_name_of_yojson) "displayName") _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (service_template_arn_of_yojson) "arn" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let service_template_summary_list_of_yojson = 
  fun tree path -> list_of_yojson service_template_summary_of_yojson tree path 

let latest_sync_blockers_of_yojson = 
  fun tree path -> list_of_yojson sync_blocker_of_yojson tree path 

let service_sync_blocker_summary_of_yojson = 
  fun tree path : service_sync_blocker_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : service_sync_blocker_summary = {
    latest_blockers = option_of_yojson (value_for_key (latest_sync_blockers_of_yojson) "latestBlockers") _list path;
    service_instance_name = option_of_yojson (value_for_key (base_string_of_yojson) "serviceInstanceName") _list path;
    service_name = value_for_key (base_string_of_yojson) "serviceName" _list path;
    
  }
  in _res

let service_summary_of_yojson = 
  fun tree path : service_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : service_summary = {
    status_message = option_of_yojson (value_for_key (status_message_of_yojson) "statusMessage") _list path;
    status = value_for_key (service_status_of_yojson) "status" _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    arn = value_for_key (service_arn_of_yojson) "arn" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let service_summary_list_of_yojson = 
  fun tree path -> list_of_yojson service_summary_of_yojson tree path 

let service_pipeline_state_of_yojson = 
  fun tree path : service_pipeline_state ->
  let _list = assoc_of_yojson tree path in
  let _res : service_pipeline_state = {
    template_minor_version = value_for_key (template_version_part_of_yojson) "templateMinorVersion" _list path;
    template_major_version = value_for_key (template_version_part_of_yojson) "templateMajorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "spec") _list path;
    
  }
  in _res

let service_instance_summary_of_yojson = 
  fun tree path : service_instance_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : service_instance_summary = {
    last_succeeded_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSucceededDeploymentId") _list path;
    last_attempted_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastAttemptedDeploymentId") _list path;
    deployment_status_message = option_of_yojson (value_for_key (status_message_of_yojson) "deploymentStatusMessage") _list path;
    deployment_status = value_for_key (deployment_status_of_yojson) "deploymentStatus" _list path;
    template_minor_version = value_for_key (template_version_part_of_yojson) "templateMinorVersion" _list path;
    template_major_version = value_for_key (template_version_part_of_yojson) "templateMajorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    last_deployment_succeeded_at = value_for_key (base_timestamp_of_yojson) "lastDeploymentSucceededAt" _list path;
    last_deployment_attempted_at = value_for_key (base_timestamp_of_yojson) "lastDeploymentAttemptedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (service_instance_arn_of_yojson) "arn" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let service_instance_summary_list_of_yojson = 
  fun tree path -> list_of_yojson service_instance_summary_of_yojson tree path 

let component_deployment_id_list_of_yojson = 
  fun tree path -> list_of_yojson deployment_id_of_yojson tree path 

let service_instance_state_of_yojson = 
  fun tree path : service_instance_state ->
  let _list = assoc_of_yojson tree path in
  let _res : service_instance_state = {
    last_successful_service_pipeline_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSuccessfulServicePipelineDeploymentId") _list path;
    last_successful_environment_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSuccessfulEnvironmentDeploymentId") _list path;
    last_successful_component_deployment_ids = option_of_yojson (value_for_key (component_deployment_id_list_of_yojson) "lastSuccessfulComponentDeploymentIds") _list path;
    template_minor_version = value_for_key (template_version_part_of_yojson) "templateMinorVersion" _list path;
    template_major_version = value_for_key (template_version_part_of_yojson) "templateMajorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    spec = value_for_key (spec_contents_of_yojson) "spec" _list path;
    
  }
  in _res

let sh_a_of_yojson = string_of_yojson

let revision_of_yojson = 
  fun tree path : revision ->
  let _list = assoc_of_yojson tree path in
  let _res : revision = {
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    directory = value_for_key (base_string_of_yojson) "directory" _list path;
    sha = value_for_key (sh_a_of_yojson) "sha" _list path;
    repository_provider = value_for_key (repository_provider_of_yojson) "repositoryProvider" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "repositoryName" _list path;
    
  }
  in _res

let resource_sync_status_of_yojson = 
  fun (tree: t) path : resource_sync_status -> match tree with 
    | `String "INITIATED" -> INITIATED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceSyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceSyncStatus")

let resource_sync_event_of_yojson = 
  fun tree path : resource_sync_event ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_sync_event = {
    event = value_for_key (base_string_of_yojson) "event" _list path;
    time = value_for_key (base_timestamp_of_yojson) "time" _list path;
    external_id = option_of_yojson (value_for_key (base_string_of_yojson) "externalId") _list path;
    type_ = value_for_key (base_string_of_yojson) "type" _list path;
    
  }
  in _res

let resource_sync_events_of_yojson = 
  fun tree path -> list_of_yojson resource_sync_event_of_yojson tree path 

let resource_sync_attempt_of_yojson = 
  fun tree path : resource_sync_attempt ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_sync_attempt = {
    events = value_for_key (resource_sync_events_of_yojson) "events" _list path;
    status = value_for_key (resource_sync_status_of_yojson) "status" _list path;
    started_at = value_for_key (base_timestamp_of_yojson) "startedAt" _list path;
    target = value_for_key (base_string_of_yojson) "target" _list path;
    target_revision = value_for_key (revision_of_yojson) "targetRevision" _list path;
    initial_revision = value_for_key (revision_of_yojson) "initialRevision" _list path;
    
  }
  in _res

let resource_deployment_status_of_yojson = 
  fun (tree: t) path : resource_deployment_status -> match tree with 
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceDeploymentStatus")

let base_integer_of_yojson = int_of_yojson

let resource_counts_summary_of_yojson = 
  fun tree path : resource_counts_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_counts_summary = {
    behind_minor = option_of_yojson (value_for_key (base_integer_of_yojson) "behindMinor") _list path;
    behind_major = option_of_yojson (value_for_key (base_integer_of_yojson) "behindMajor") _list path;
    up_to_date = option_of_yojson (value_for_key (base_integer_of_yojson) "upToDate") _list path;
    failed = option_of_yojson (value_for_key (base_integer_of_yojson) "failed") _list path;
    total = value_for_key (base_integer_of_yojson) "total" _list path;
    
  }
  in _res

let repository_sync_status_of_yojson = 
  fun (tree: t) path : repository_sync_status -> match tree with 
    | `String "INITIATED" -> INITIATED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RepositorySyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RepositorySyncStatus")

let repository_sync_event_of_yojson = 
  fun tree path : repository_sync_event ->
  let _list = assoc_of_yojson tree path in
  let _res : repository_sync_event = {
    event = value_for_key (base_string_of_yojson) "event" _list path;
    time = value_for_key (base_timestamp_of_yojson) "time" _list path;
    external_id = option_of_yojson (value_for_key (base_string_of_yojson) "externalId") _list path;
    type_ = value_for_key (base_string_of_yojson) "type" _list path;
    
  }
  in _res

let repository_sync_events_of_yojson = 
  fun tree path -> list_of_yojson repository_sync_event_of_yojson tree path 

let repository_sync_definition_of_yojson = 
  fun tree path : repository_sync_definition ->
  let _list = assoc_of_yojson tree path in
  let _res : repository_sync_definition = {
    directory = value_for_key (base_string_of_yojson) "directory" _list path;
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    parent = value_for_key (base_string_of_yojson) "parent" _list path;
    target = value_for_key (base_string_of_yojson) "target" _list path;
    
  }
  in _res

let repository_sync_definition_list_of_yojson = 
  fun tree path -> list_of_yojson repository_sync_definition_of_yojson tree path 

let repository_sync_attempt_of_yojson = 
  fun tree path : repository_sync_attempt ->
  let _list = assoc_of_yojson tree path in
  let _res : repository_sync_attempt = {
    events = value_for_key (repository_sync_events_of_yojson) "events" _list path;
    status = value_for_key (repository_sync_status_of_yojson) "status" _list path;
    started_at = value_for_key (base_timestamp_of_yojson) "startedAt" _list path;
    
  }
  in _res

let repository_summary_of_yojson = 
  fun tree path : repository_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : repository_summary = {
    connection_arn = value_for_key (arn_of_yojson) "connectionArn" _list path;
    name = value_for_key (repository_name_of_yojson) "name" _list path;
    provider = value_for_key (repository_provider_of_yojson) "provider" _list path;
    arn = value_for_key (repository_arn_of_yojson) "arn" _list path;
    
  }
  in _res

let repository_summary_list_of_yojson = 
  fun tree path -> list_of_yojson repository_summary_of_yojson tree path 

let repository_of_yojson = 
  fun tree path : repository ->
  let _list = assoc_of_yojson tree path in
  let _res : repository = {
    encryption_key = option_of_yojson (value_for_key (arn_of_yojson) "encryptionKey") _list path;
    connection_arn = value_for_key (arn_of_yojson) "connectionArn" _list path;
    name = value_for_key (repository_name_of_yojson) "name" _list path;
    provider = value_for_key (repository_provider_of_yojson) "provider" _list path;
    arn = value_for_key (repository_arn_of_yojson) "arn" _list path;
    
  }
  in _res

let reject_environment_account_connection_output_of_yojson = 
  fun tree path : reject_environment_account_connection_output ->
  let _list = assoc_of_yojson tree path in
  let _res : reject_environment_account_connection_output = {
    environment_account_connection = value_for_key (environment_account_connection_of_yojson) "environmentAccountConnection" _list path;
    
  }
  in _res

let reject_environment_account_connection_input_of_yojson = 
  fun tree path : reject_environment_account_connection_input ->
  let _list = assoc_of_yojson tree path in
  let _res : reject_environment_account_connection_input = {
    id = value_for_key (environment_account_connection_id_of_yojson) "id" _list path;
    
  }
  in _res

let provisioned_resource_name_of_yojson = string_of_yojson

let provisioned_resource_identifier_of_yojson = string_of_yojson

let provisioned_resource_engine_of_yojson = 
  fun (tree: t) path : provisioned_resource_engine -> match tree with 
    | `String "CLOUDFORMATION" -> CLOUDFORMATION
    | `String "TERRAFORM" -> TERRAFORM
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProvisionedResourceEngine" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisionedResourceEngine")

let provisioned_resource_of_yojson = 
  fun tree path : provisioned_resource ->
  let _list = assoc_of_yojson tree path in
  let _res : provisioned_resource = {
    provisioning_engine = option_of_yojson (value_for_key (provisioned_resource_engine_of_yojson) "provisioningEngine") _list path;
    identifier = option_of_yojson (value_for_key (provisioned_resource_identifier_of_yojson) "identifier") _list path;
    name = option_of_yojson (value_for_key (provisioned_resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let provisioned_resource_list_of_yojson = 
  fun tree path -> list_of_yojson provisioned_resource_of_yojson tree path 

let output_key_of_yojson = string_of_yojson

let output_value_string_of_yojson = string_of_yojson

let output_of_yojson = 
  fun tree path : output ->
  let _list = assoc_of_yojson tree path in
  let _res : output = {
    value_string = option_of_yojson (value_for_key (output_value_string_of_yojson) "valueString") _list path;
    key = option_of_yojson (value_for_key (output_key_of_yojson) "key") _list path;
    
  }
  in _res

let outputs_list_of_yojson = 
  fun tree path -> list_of_yojson output_of_yojson tree path 

let notify_resource_deployment_status_change_output_of_yojson = 
  fun tree path : notify_resource_deployment_status_change_output ->
  let _list = assoc_of_yojson tree path in
  let _res : notify_resource_deployment_status_change_output = ()
  in _res

let notify_resource_deployment_status_change_input_of_yojson = 
  fun tree path : notify_resource_deployment_status_change_input ->
  let _list = assoc_of_yojson tree path in
  let _res : notify_resource_deployment_status_change_input = {
    status_message = option_of_yojson (value_for_key (status_message_of_yojson) "statusMessage") _list path;
    deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "deploymentId") _list path;
    outputs = option_of_yojson (value_for_key (outputs_list_of_yojson) "outputs") _list path;
    status = option_of_yojson (value_for_key (resource_deployment_status_of_yojson) "status") _list path;
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let next_token_of_yojson = string_of_yojson

let max_page_results_of_yojson = int_of_yojson

let list_tags_for_resource_output_of_yojson = 
  fun tree path : list_tags_for_resource_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_output = {
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    tags = value_for_key (tag_list_of_yojson) "tags" _list path;
    
  }
  in _res

let list_tags_for_resource_input_of_yojson = 
  fun tree path : list_tags_for_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_input = {
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let list_services_output_of_yojson = 
  fun tree path : list_services_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_services_output = {
    services = value_for_key (service_summary_list_of_yojson) "services" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_services_input_of_yojson = 
  fun tree path : list_services_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_services_input = {
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_service_templates_output_of_yojson = 
  fun tree path : list_service_templates_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_templates_output = {
    templates = value_for_key (service_template_summary_list_of_yojson) "templates" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_service_templates_input_of_yojson = 
  fun tree path : list_service_templates_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_templates_input = {
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_service_template_versions_output_of_yojson = 
  fun tree path : list_service_template_versions_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_template_versions_output = {
    template_versions = value_for_key (service_template_version_summary_list_of_yojson) "templateVersions" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_service_template_versions_input_of_yojson = 
  fun tree path : list_service_template_versions_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_template_versions_input = {
    major_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "majorVersion") _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let empty_next_token_of_yojson = string_of_yojson

let list_service_pipeline_provisioned_resources_output_of_yojson = 
  fun tree path : list_service_pipeline_provisioned_resources_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_pipeline_provisioned_resources_output = {
    provisioned_resources = value_for_key (provisioned_resource_list_of_yojson) "provisionedResources" _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_service_pipeline_provisioned_resources_input_of_yojson = 
  fun tree path : list_service_pipeline_provisioned_resources_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_pipeline_provisioned_resources_input = {
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let list_service_pipeline_outputs_output_of_yojson = 
  fun tree path : list_service_pipeline_outputs_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_pipeline_outputs_output = {
    outputs = value_for_key (outputs_list_of_yojson) "outputs" _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_service_pipeline_outputs_input_of_yojson = 
  fun tree path : list_service_pipeline_outputs_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_pipeline_outputs_input = {
    deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "deploymentId") _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let list_service_instances_sort_by_of_yojson = 
  fun (tree: t) path : list_service_instances_sort_by -> match tree with 
    | `String "name" -> NAME
    | `String "deploymentStatus" -> DEPLOYMENT_STATUS
    | `String "templateName" -> TEMPLATE_NAME
    | `String "serviceName" -> SERVICE_NAME
    | `String "environmentName" -> ENVIRONMENT_NAME
    | `String "lastDeploymentAttemptedAt" -> LAST_DEPLOYMENT_ATTEMPTED_AT
    | `String "createdAt" -> CREATED_AT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ListServiceInstancesSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ListServiceInstancesSortBy")

let list_service_instances_output_of_yojson = 
  fun tree path : list_service_instances_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_instances_output = {
    service_instances = value_for_key (service_instance_summary_list_of_yojson) "serviceInstances" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_service_instances_filter_by_of_yojson = 
  fun (tree: t) path : list_service_instances_filter_by -> match tree with 
    | `String "name" -> NAME
    | `String "deploymentStatus" -> DEPLOYMENT_STATUS
    | `String "templateName" -> TEMPLATE_NAME
    | `String "serviceName" -> SERVICE_NAME
    | `String "deployedTemplateVersionStatus" -> DEPLOYED_TEMPLATE_VERSION_STATUS
    | `String "environmentName" -> ENVIRONMENT_NAME
    | `String "lastDeploymentAttemptedAtBefore" -> LAST_DEPLOYMENT_ATTEMPTED_AT_BEFORE
    | `String "lastDeploymentAttemptedAtAfter" -> LAST_DEPLOYMENT_ATTEMPTED_AT_AFTER
    | `String "createdAtBefore" -> CREATED_AT_BEFORE
    | `String "createdAtAfter" -> CREATED_AT_AFTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ListServiceInstancesFilterBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ListServiceInstancesFilterBy")

let list_service_instances_filter_value_of_yojson = string_of_yojson

let list_service_instances_filter_of_yojson = 
  fun tree path : list_service_instances_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_instances_filter = {
    value = option_of_yojson (value_for_key (list_service_instances_filter_value_of_yojson) "value") _list path;
    key = option_of_yojson (value_for_key (list_service_instances_filter_by_of_yojson) "key") _list path;
    
  }
  in _res

let list_service_instances_filter_list_of_yojson = 
  fun tree path -> list_of_yojson list_service_instances_filter_of_yojson tree path 

let list_service_instances_input_of_yojson = 
  fun tree path : list_service_instances_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_instances_input = {
    sort_order = option_of_yojson (value_for_key (sort_order_of_yojson) "sortOrder") _list path;
    sort_by = option_of_yojson (value_for_key (list_service_instances_sort_by_of_yojson) "sortBy") _list path;
    filters = option_of_yojson (value_for_key (list_service_instances_filter_list_of_yojson) "filters") _list path;
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceName") _list path;
    
  }
  in _res

let list_service_instance_provisioned_resources_output_of_yojson = 
  fun tree path : list_service_instance_provisioned_resources_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_instance_provisioned_resources_output = {
    provisioned_resources = value_for_key (provisioned_resource_list_of_yojson) "provisionedResources" _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_service_instance_provisioned_resources_input_of_yojson = 
  fun tree path : list_service_instance_provisioned_resources_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_instance_provisioned_resources_input = {
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    service_instance_name = value_for_key (resource_name_of_yojson) "serviceInstanceName" _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let list_service_instance_outputs_output_of_yojson = 
  fun tree path : list_service_instance_outputs_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_instance_outputs_output = {
    outputs = value_for_key (outputs_list_of_yojson) "outputs" _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_service_instance_outputs_input_of_yojson = 
  fun tree path : list_service_instance_outputs_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_instance_outputs_input = {
    deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "deploymentId") _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    service_instance_name = value_for_key (resource_name_of_yojson) "serviceInstanceName" _list path;
    
  }
  in _res

let list_repository_sync_definitions_output_of_yojson = 
  fun tree path : list_repository_sync_definitions_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_repository_sync_definitions_output = {
    sync_definitions = value_for_key (repository_sync_definition_list_of_yojson) "syncDefinitions" _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_repository_sync_definitions_input_of_yojson = 
  fun tree path : list_repository_sync_definitions_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_repository_sync_definitions_input = {
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    sync_type = value_for_key (sync_type_of_yojson) "syncType" _list path;
    repository_provider = value_for_key (repository_provider_of_yojson) "repositoryProvider" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "repositoryName" _list path;
    
  }
  in _res

let list_repositories_output_of_yojson = 
  fun tree path : list_repositories_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_repositories_output = {
    repositories = value_for_key (repository_summary_list_of_yojson) "repositories" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_repositories_input_of_yojson = 
  fun tree path : list_repositories_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_repositories_input = {
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let environment_summary_of_yojson = 
  fun tree path : environment_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_summary = {
    last_succeeded_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSucceededDeploymentId") _list path;
    last_attempted_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastAttemptedDeploymentId") _list path;
    component_role_arn = option_of_yojson (value_for_key (arn_of_yojson) "componentRoleArn") _list path;
    provisioning = option_of_yojson (value_for_key (provisioning_of_yojson) "provisioning") _list path;
    environment_account_id = option_of_yojson (value_for_key (aws_account_id_of_yojson) "environmentAccountId") _list path;
    environment_account_connection_id = option_of_yojson (value_for_key (environment_account_connection_id_of_yojson) "environmentAccountConnectionId") _list path;
    proton_service_role_arn = option_of_yojson (value_for_key (arn_of_yojson) "protonServiceRoleArn") _list path;
    deployment_status_message = option_of_yojson (value_for_key (status_message_of_yojson) "deploymentStatusMessage") _list path;
    deployment_status = value_for_key (deployment_status_of_yojson) "deploymentStatus" _list path;
    template_minor_version = value_for_key (template_version_part_of_yojson) "templateMinorVersion" _list path;
    template_major_version = value_for_key (template_version_part_of_yojson) "templateMajorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    arn = value_for_key (environment_arn_of_yojson) "arn" _list path;
    last_deployment_succeeded_at = value_for_key (base_timestamp_of_yojson) "lastDeploymentSucceededAt" _list path;
    last_deployment_attempted_at = value_for_key (base_timestamp_of_yojson) "lastDeploymentAttemptedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let environment_summary_list_of_yojson = 
  fun tree path -> list_of_yojson environment_summary_of_yojson tree path 

let list_environments_output_of_yojson = 
  fun tree path : list_environments_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environments_output = {
    environments = value_for_key (environment_summary_list_of_yojson) "environments" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let environment_template_filter_of_yojson = 
  fun tree path : environment_template_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_template_filter = {
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let environment_template_filter_list_of_yojson = 
  fun tree path -> list_of_yojson environment_template_filter_of_yojson tree path 

let list_environments_input_of_yojson = 
  fun tree path : list_environments_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environments_input = {
    environment_templates = option_of_yojson (value_for_key (environment_template_filter_list_of_yojson) "environmentTemplates") _list path;
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let environment_template_summary_of_yojson = 
  fun tree path : environment_template_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_template_summary = {
    provisioning = option_of_yojson (value_for_key (provisioning_of_yojson) "provisioning") _list path;
    recommended_version = option_of_yojson (value_for_key (full_template_version_number_of_yojson) "recommendedVersion") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    display_name = option_of_yojson (value_for_key (display_name_of_yojson) "displayName") _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (environment_template_arn_of_yojson) "arn" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let environment_template_summary_list_of_yojson = 
  fun tree path -> list_of_yojson environment_template_summary_of_yojson tree path 

let list_environment_templates_output_of_yojson = 
  fun tree path : list_environment_templates_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environment_templates_output = {
    templates = value_for_key (environment_template_summary_list_of_yojson) "templates" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_environment_templates_input_of_yojson = 
  fun tree path : list_environment_templates_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environment_templates_input = {
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let environment_template_version_summary_of_yojson = 
  fun tree path : environment_template_version_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_template_version_summary = {
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    arn = value_for_key (environment_template_version_arn_of_yojson) "arn" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    status_message = option_of_yojson (value_for_key (status_message_of_yojson) "statusMessage") _list path;
    status = value_for_key (template_version_status_of_yojson) "status" _list path;
    recommended_minor_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "recommendedMinorVersion") _list path;
    minor_version = value_for_key (template_version_part_of_yojson) "minorVersion" _list path;
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let environment_template_version_summary_list_of_yojson = 
  fun tree path -> list_of_yojson environment_template_version_summary_of_yojson tree path 

let list_environment_template_versions_output_of_yojson = 
  fun tree path : list_environment_template_versions_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environment_template_versions_output = {
    template_versions = value_for_key (environment_template_version_summary_list_of_yojson) "templateVersions" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_environment_template_versions_input_of_yojson = 
  fun tree path : list_environment_template_versions_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environment_template_versions_input = {
    major_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "majorVersion") _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_environment_provisioned_resources_output_of_yojson = 
  fun tree path : list_environment_provisioned_resources_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environment_provisioned_resources_output = {
    provisioned_resources = value_for_key (provisioned_resource_list_of_yojson) "provisionedResources" _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_environment_provisioned_resources_input_of_yojson = 
  fun tree path : list_environment_provisioned_resources_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environment_provisioned_resources_input = {
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    
  }
  in _res

let list_environment_outputs_output_of_yojson = 
  fun tree path : list_environment_outputs_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environment_outputs_output = {
    outputs = value_for_key (outputs_list_of_yojson) "outputs" _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_environment_outputs_input_of_yojson = 
  fun tree path : list_environment_outputs_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environment_outputs_input = {
    deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "deploymentId") _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    
  }
  in _res

let environment_account_connection_summary_of_yojson = 
  fun tree path : environment_account_connection_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_account_connection_summary = {
    component_role_arn = option_of_yojson (value_for_key (arn_of_yojson) "componentRoleArn") _list path;
    status = value_for_key (environment_account_connection_status_of_yojson) "status" _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    requested_at = value_for_key (base_timestamp_of_yojson) "requestedAt" _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    role_arn = value_for_key (arn_of_yojson) "roleArn" _list path;
    environment_account_id = value_for_key (aws_account_id_of_yojson) "environmentAccountId" _list path;
    management_account_id = value_for_key (aws_account_id_of_yojson) "managementAccountId" _list path;
    arn = value_for_key (environment_account_connection_arn_of_yojson) "arn" _list path;
    id = value_for_key (environment_account_connection_id_of_yojson) "id" _list path;
    
  }
  in _res

let environment_account_connection_summary_list_of_yojson = 
  fun tree path -> list_of_yojson environment_account_connection_summary_of_yojson tree path 

let list_environment_account_connections_output_of_yojson = 
  fun tree path : list_environment_account_connections_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environment_account_connections_output = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    environment_account_connections = value_for_key (environment_account_connection_summary_list_of_yojson) "environmentAccountConnections" _list path;
    
  }
  in _res

let environment_account_connection_requester_account_type_of_yojson = 
  fun (tree: t) path : environment_account_connection_requester_account_type -> match tree with 
    | `String "MANAGEMENT_ACCOUNT" -> MANAGEMENT_ACCOUNT
    | `String "ENVIRONMENT_ACCOUNT" -> ENVIRONMENT_ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnvironmentAccountConnectionRequesterAccountType" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentAccountConnectionRequesterAccountType")

let environment_account_connection_status_list_of_yojson = 
  fun tree path -> list_of_yojson environment_account_connection_status_of_yojson tree path 

let list_environment_account_connections_input_of_yojson = 
  fun tree path : list_environment_account_connections_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_environment_account_connections_input = {
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    statuses = option_of_yojson (value_for_key (environment_account_connection_status_list_of_yojson) "statuses") _list path;
    environment_name = option_of_yojson (value_for_key (resource_name_of_yojson) "environmentName") _list path;
    requested_by = value_for_key (environment_account_connection_requester_account_type_of_yojson) "requestedBy" _list path;
    
  }
  in _res

let deployment_arn_of_yojson = string_of_yojson

let deployment_target_resource_type_of_yojson = 
  fun (tree: t) path : deployment_target_resource_type -> match tree with 
    | `String "ENVIRONMENT" -> ENVIRONMENT
    | `String "SERVICE_PIPELINE" -> SERVICE_PIPELINE
    | `String "SERVICE_INSTANCE" -> SERVICE_INSTANCE
    | `String "COMPONENT" -> COMPONENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentTargetResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentTargetResourceType")

let deployment_summary_of_yojson = 
  fun tree path : deployment_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : deployment_summary = {
    deployment_status = value_for_key (deployment_status_of_yojson) "deploymentStatus" _list path;
    last_succeeded_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSucceededDeploymentId") _list path;
    last_attempted_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastAttemptedDeploymentId") _list path;
    component_name = option_of_yojson (value_for_key (resource_name_of_yojson) "componentName") _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceInstanceName") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceName") _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    completed_at = option_of_yojson (value_for_key (base_timestamp_of_yojson) "completedAt") _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    target_resource_type = value_for_key (deployment_target_resource_type_of_yojson) "targetResourceType" _list path;
    target_resource_created_at = value_for_key (base_timestamp_of_yojson) "targetResourceCreatedAt" _list path;
    target_arn = value_for_key (arn_of_yojson) "targetArn" _list path;
    arn = value_for_key (deployment_arn_of_yojson) "arn" _list path;
    id = value_for_key (deployment_id_of_yojson) "id" _list path;
    
  }
  in _res

let deployment_summary_list_of_yojson = 
  fun tree path -> list_of_yojson deployment_summary_of_yojson tree path 

let list_deployments_output_of_yojson = 
  fun tree path : list_deployments_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_deployments_output = {
    deployments = value_for_key (deployment_summary_list_of_yojson) "deployments" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_deployments_input_of_yojson = 
  fun tree path : list_deployments_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_deployments_input = {
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    component_name = option_of_yojson (value_for_key (resource_name_of_yojson) "componentName") _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceInstanceName") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceName") _list path;
    environment_name = option_of_yojson (value_for_key (resource_name_of_yojson) "environmentName") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let component_summary_of_yojson = 
  fun tree path : component_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : component_summary = {
    last_succeeded_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSucceededDeploymentId") _list path;
    last_attempted_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastAttemptedDeploymentId") _list path;
    deployment_status_message = option_of_yojson (value_for_key (status_message_of_yojson) "deploymentStatusMessage") _list path;
    deployment_status = value_for_key (deployment_status_of_yojson) "deploymentStatus" _list path;
    last_deployment_succeeded_at = option_of_yojson (value_for_key (base_timestamp_of_yojson) "lastDeploymentSucceededAt") _list path;
    last_deployment_attempted_at = option_of_yojson (value_for_key (base_timestamp_of_yojson) "lastDeploymentAttemptedAt") _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceInstanceName") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceName") _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    arn = value_for_key (component_arn_of_yojson) "arn" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let component_summary_list_of_yojson = 
  fun tree path -> list_of_yojson component_summary_of_yojson tree path 

let list_components_output_of_yojson = 
  fun tree path : list_components_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_components_output = {
    components = value_for_key (component_summary_list_of_yojson) "components" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_components_input_of_yojson = 
  fun tree path : list_components_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_components_input = {
    max_results = option_of_yojson (value_for_key (max_page_results_of_yojson) "maxResults") _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceInstanceName") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceName") _list path;
    environment_name = option_of_yojson (value_for_key (resource_name_of_yojson) "environmentName") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_component_provisioned_resources_output_of_yojson = 
  fun tree path : list_component_provisioned_resources_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_component_provisioned_resources_output = {
    provisioned_resources = value_for_key (provisioned_resource_list_of_yojson) "provisionedResources" _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_component_provisioned_resources_input_of_yojson = 
  fun tree path : list_component_provisioned_resources_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_component_provisioned_resources_input = {
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    component_name = value_for_key (resource_name_of_yojson) "componentName" _list path;
    
  }
  in _res

let list_component_outputs_output_of_yojson = 
  fun tree path : list_component_outputs_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_component_outputs_output = {
    outputs = value_for_key (outputs_list_of_yojson) "outputs" _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    
  }
  in _res

let list_component_outputs_input_of_yojson = 
  fun tree path : list_component_outputs_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_component_outputs_input = {
    deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "deploymentId") _list path;
    next_token = option_of_yojson (value_for_key (empty_next_token_of_yojson) "nextToken") _list path;
    component_name = value_for_key (resource_name_of_yojson) "componentName" _list path;
    
  }
  in _res

let get_template_sync_status_output_of_yojson = 
  fun tree path : get_template_sync_status_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_template_sync_status_output = {
    desired_state = option_of_yojson (value_for_key (revision_of_yojson) "desiredState") _list path;
    latest_successful_sync = option_of_yojson (value_for_key (resource_sync_attempt_of_yojson) "latestSuccessfulSync") _list path;
    latest_sync = option_of_yojson (value_for_key (resource_sync_attempt_of_yojson) "latestSync") _list path;
    
  }
  in _res

let get_template_sync_status_input_of_yojson = 
  fun tree path : get_template_sync_status_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_template_sync_status_input = {
    template_version = value_for_key (template_version_part_of_yojson) "templateVersion" _list path;
    template_type = value_for_key (template_type_of_yojson) "templateType" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let get_template_sync_config_output_of_yojson = 
  fun tree path : get_template_sync_config_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_template_sync_config_output = {
    template_sync_config = option_of_yojson (value_for_key (template_sync_config_of_yojson) "templateSyncConfig") _list path;
    
  }
  in _res

let get_template_sync_config_input_of_yojson = 
  fun tree path : get_template_sync_config_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_template_sync_config_input = {
    template_type = value_for_key (template_type_of_yojson) "templateType" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let get_service_template_version_output_of_yojson = 
  fun tree path : get_service_template_version_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_template_version_output = {
    service_template_version = value_for_key (service_template_version_of_yojson) "serviceTemplateVersion" _list path;
    
  }
  in _res

let get_service_template_version_input_of_yojson = 
  fun tree path : get_service_template_version_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_template_version_input = {
    minor_version = value_for_key (template_version_part_of_yojson) "minorVersion" _list path;
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let get_service_template_output_of_yojson = 
  fun tree path : get_service_template_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_template_output = {
    service_template = value_for_key (service_template_of_yojson) "serviceTemplate" _list path;
    
  }
  in _res

let get_service_template_input_of_yojson = 
  fun tree path : get_service_template_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_template_input = {
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let get_service_sync_config_output_of_yojson = 
  fun tree path : get_service_sync_config_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_sync_config_output = {
    service_sync_config = option_of_yojson (value_for_key (service_sync_config_of_yojson) "serviceSyncConfig") _list path;
    
  }
  in _res

let get_service_sync_config_input_of_yojson = 
  fun tree path : get_service_sync_config_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_sync_config_input = {
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let get_service_sync_blocker_summary_output_of_yojson = 
  fun tree path : get_service_sync_blocker_summary_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_sync_blocker_summary_output = {
    service_sync_blocker_summary = option_of_yojson (value_for_key (service_sync_blocker_summary_of_yojson) "serviceSyncBlockerSummary") _list path;
    
  }
  in _res

let get_service_sync_blocker_summary_input_of_yojson = 
  fun tree path : get_service_sync_blocker_summary_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_sync_blocker_summary_input = {
    service_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceInstanceName") _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let get_service_output_of_yojson = 
  fun tree path : get_service_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_output = {
    service = option_of_yojson (value_for_key (service_of_yojson) "service") _list path;
    
  }
  in _res

let get_service_instance_sync_status_output_of_yojson = 
  fun tree path : get_service_instance_sync_status_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_instance_sync_status_output = {
    desired_state = option_of_yojson (value_for_key (revision_of_yojson) "desiredState") _list path;
    latest_successful_sync = option_of_yojson (value_for_key (resource_sync_attempt_of_yojson) "latestSuccessfulSync") _list path;
    latest_sync = option_of_yojson (value_for_key (resource_sync_attempt_of_yojson) "latestSync") _list path;
    
  }
  in _res

let get_service_instance_sync_status_input_of_yojson = 
  fun tree path : get_service_instance_sync_status_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_instance_sync_status_input = {
    service_instance_name = value_for_key (resource_name_of_yojson) "serviceInstanceName" _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let get_service_instance_output_of_yojson = 
  fun tree path : get_service_instance_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_instance_output = {
    service_instance = value_for_key (service_instance_of_yojson) "serviceInstance" _list path;
    
  }
  in _res

let get_service_instance_input_of_yojson = 
  fun tree path : get_service_instance_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_instance_input = {
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let get_service_input_of_yojson = 
  fun tree path : get_service_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_input = {
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let counts_summary_of_yojson = 
  fun tree path : counts_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : counts_summary = {
    pipelines = option_of_yojson (value_for_key (resource_counts_summary_of_yojson) "pipelines") _list path;
    service_templates = option_of_yojson (value_for_key (resource_counts_summary_of_yojson) "serviceTemplates") _list path;
    services = option_of_yojson (value_for_key (resource_counts_summary_of_yojson) "services") _list path;
    service_instances = option_of_yojson (value_for_key (resource_counts_summary_of_yojson) "serviceInstances") _list path;
    environment_templates = option_of_yojson (value_for_key (resource_counts_summary_of_yojson) "environmentTemplates") _list path;
    environments = option_of_yojson (value_for_key (resource_counts_summary_of_yojson) "environments") _list path;
    components = option_of_yojson (value_for_key (resource_counts_summary_of_yojson) "components") _list path;
    
  }
  in _res

let get_resources_summary_output_of_yojson = 
  fun tree path : get_resources_summary_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resources_summary_output = {
    counts = value_for_key (counts_summary_of_yojson) "counts" _list path;
    
  }
  in _res

let get_resources_summary_input_of_yojson = 
  fun tree path : get_resources_summary_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resources_summary_input = ()
  in _res

let get_repository_sync_status_output_of_yojson = 
  fun tree path : get_repository_sync_status_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_repository_sync_status_output = {
    latest_sync = option_of_yojson (value_for_key (repository_sync_attempt_of_yojson) "latestSync") _list path;
    
  }
  in _res

let get_repository_sync_status_input_of_yojson = 
  fun tree path : get_repository_sync_status_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_repository_sync_status_input = {
    sync_type = value_for_key (sync_type_of_yojson) "syncType" _list path;
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    repository_provider = value_for_key (repository_provider_of_yojson) "repositoryProvider" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "repositoryName" _list path;
    
  }
  in _res

let get_repository_output_of_yojson = 
  fun tree path : get_repository_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_repository_output = {
    repository = value_for_key (repository_of_yojson) "repository" _list path;
    
  }
  in _res

let get_repository_input_of_yojson = 
  fun tree path : get_repository_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_repository_input = {
    name = value_for_key (repository_name_of_yojson) "name" _list path;
    provider = value_for_key (repository_provider_of_yojson) "provider" _list path;
    
  }
  in _res

let get_environment_template_version_output_of_yojson = 
  fun tree path : get_environment_template_version_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_environment_template_version_output = {
    environment_template_version = value_for_key (environment_template_version_of_yojson) "environmentTemplateVersion" _list path;
    
  }
  in _res

let get_environment_template_version_input_of_yojson = 
  fun tree path : get_environment_template_version_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_environment_template_version_input = {
    minor_version = value_for_key (template_version_part_of_yojson) "minorVersion" _list path;
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let get_environment_template_output_of_yojson = 
  fun tree path : get_environment_template_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_environment_template_output = {
    environment_template = value_for_key (environment_template_of_yojson) "environmentTemplate" _list path;
    
  }
  in _res

let get_environment_template_input_of_yojson = 
  fun tree path : get_environment_template_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_environment_template_input = {
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let get_environment_output_of_yojson = 
  fun tree path : get_environment_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_environment_output = {
    environment = value_for_key (environment_of_yojson) "environment" _list path;
    
  }
  in _res

let get_environment_input_of_yojson = 
  fun tree path : get_environment_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_environment_input = {
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let get_environment_account_connection_output_of_yojson = 
  fun tree path : get_environment_account_connection_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_environment_account_connection_output = {
    environment_account_connection = value_for_key (environment_account_connection_of_yojson) "environmentAccountConnection" _list path;
    
  }
  in _res

let get_environment_account_connection_input_of_yojson = 
  fun tree path : get_environment_account_connection_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_environment_account_connection_input = {
    id = value_for_key (environment_account_connection_id_of_yojson) "id" _list path;
    
  }
  in _res

let environment_state_of_yojson = 
  fun tree path : environment_state ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_state = {
    template_minor_version = value_for_key (template_version_part_of_yojson) "templateMinorVersion" _list path;
    template_major_version = value_for_key (template_version_part_of_yojson) "templateMajorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "spec") _list path;
    
  }
  in _res

let component_state_of_yojson = 
  fun tree path : component_state ->
  let _list = assoc_of_yojson tree path in
  let _res : component_state = {
    template_file = option_of_yojson (value_for_key (template_file_contents_of_yojson) "templateFile") _list path;
    service_spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "serviceSpec") _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_or_empty_of_yojson) "serviceInstanceName") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_or_empty_of_yojson) "serviceName") _list path;
    
  }
  in _res

let deployment_state_of_yojson = 
  fun (tree: t) path : deployment_state ->
  let _list = assoc_of_yojson tree path in
  let key, value_ = match _list with
    | (key, value_) :: _ -> key, value_ 
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  match key with
    | "component" -> Component (component_state_of_yojson value_ (path))
    | "servicePipeline" -> ServicePipeline (service_pipeline_state_of_yojson value_ (path))
    | "environment" -> Environment (environment_state_of_yojson value_ (path))
    | "serviceInstance" -> ServiceInstance (service_instance_state_of_yojson value_ (path))
    | _ as unknown -> raise(deserialize_unknown_enum_value_error path
                           "DeploymentState" unknown)
  

let deployment_of_yojson = 
  fun tree path : deployment ->
  let _list = assoc_of_yojson tree path in
  let _res : deployment = {
    target_state = option_of_yojson (value_for_key (deployment_state_of_yojson) "targetState") _list path;
    initial_state = option_of_yojson (value_for_key (deployment_state_of_yojson) "initialState") _list path;
    last_succeeded_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastSucceededDeploymentId") _list path;
    last_attempted_deployment_id = option_of_yojson (value_for_key (deployment_id_of_yojson) "lastAttemptedDeploymentId") _list path;
    completed_at = option_of_yojson (value_for_key (base_timestamp_of_yojson) "completedAt") _list path;
    last_modified_at = value_for_key (base_timestamp_of_yojson) "lastModifiedAt" _list path;
    created_at = value_for_key (base_timestamp_of_yojson) "createdAt" _list path;
    deployment_status_message = option_of_yojson (value_for_key (status_message_of_yojson) "deploymentStatusMessage") _list path;
    deployment_status = value_for_key (deployment_status_of_yojson) "deploymentStatus" _list path;
    component_name = option_of_yojson (value_for_key (resource_name_of_yojson) "componentName") _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceInstanceName") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceName") _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    target_resource_type = value_for_key (deployment_target_resource_type_of_yojson) "targetResourceType" _list path;
    target_resource_created_at = value_for_key (base_timestamp_of_yojson) "targetResourceCreatedAt" _list path;
    target_arn = value_for_key (arn_of_yojson) "targetArn" _list path;
    arn = value_for_key (deployment_arn_of_yojson) "arn" _list path;
    id = value_for_key (deployment_id_of_yojson) "id" _list path;
    
  }
  in _res

let get_deployment_output_of_yojson = 
  fun tree path : get_deployment_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_deployment_output = {
    deployment = option_of_yojson (value_for_key (deployment_of_yojson) "deployment") _list path;
    
  }
  in _res

let get_deployment_input_of_yojson = 
  fun tree path : get_deployment_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_deployment_input = {
    component_name = option_of_yojson (value_for_key (resource_name_of_yojson) "componentName") _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceInstanceName") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceName") _list path;
    environment_name = option_of_yojson (value_for_key (resource_name_of_yojson) "environmentName") _list path;
    id = value_for_key (deployment_id_of_yojson) "id" _list path;
    
  }
  in _res

let get_component_output_of_yojson = 
  fun tree path : get_component_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_component_output = {
    component = option_of_yojson (value_for_key (component_of_yojson) "component") _list path;
    
  }
  in _res

let get_component_input_of_yojson = 
  fun tree path : get_component_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_component_input = {
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let get_account_settings_output_of_yojson = 
  fun tree path : get_account_settings_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_account_settings_output = {
    account_settings = option_of_yojson (value_for_key (account_settings_of_yojson) "accountSettings") _list path;
    
  }
  in _res

let get_account_settings_input_of_yojson = 
  fun tree path : get_account_settings_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_account_settings_input = ()
  in _res

let delete_template_sync_config_output_of_yojson = 
  fun tree path : delete_template_sync_config_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_template_sync_config_output = {
    template_sync_config = option_of_yojson (value_for_key (template_sync_config_of_yojson) "templateSyncConfig") _list path;
    
  }
  in _res

let delete_template_sync_config_input_of_yojson = 
  fun tree path : delete_template_sync_config_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_template_sync_config_input = {
    template_type = value_for_key (template_type_of_yojson) "templateType" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let delete_service_template_version_output_of_yojson = 
  fun tree path : delete_service_template_version_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_service_template_version_output = {
    service_template_version = option_of_yojson (value_for_key (service_template_version_of_yojson) "serviceTemplateVersion") _list path;
    
  }
  in _res

let delete_service_template_version_input_of_yojson = 
  fun tree path : delete_service_template_version_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_service_template_version_input = {
    minor_version = value_for_key (template_version_part_of_yojson) "minorVersion" _list path;
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let delete_service_template_output_of_yojson = 
  fun tree path : delete_service_template_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_service_template_output = {
    service_template = option_of_yojson (value_for_key (service_template_of_yojson) "serviceTemplate") _list path;
    
  }
  in _res

let delete_service_template_input_of_yojson = 
  fun tree path : delete_service_template_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_service_template_input = {
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let delete_service_sync_config_output_of_yojson = 
  fun tree path : delete_service_sync_config_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_service_sync_config_output = {
    service_sync_config = option_of_yojson (value_for_key (service_sync_config_of_yojson) "serviceSyncConfig") _list path;
    
  }
  in _res

let delete_service_sync_config_input_of_yojson = 
  fun tree path : delete_service_sync_config_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_service_sync_config_input = {
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let delete_service_output_of_yojson = 
  fun tree path : delete_service_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_service_output = {
    service = option_of_yojson (value_for_key (service_of_yojson) "service") _list path;
    
  }
  in _res

let delete_service_input_of_yojson = 
  fun tree path : delete_service_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_service_input = {
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let delete_repository_output_of_yojson = 
  fun tree path : delete_repository_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_repository_output = {
    repository = option_of_yojson (value_for_key (repository_of_yojson) "repository") _list path;
    
  }
  in _res

let delete_repository_input_of_yojson = 
  fun tree path : delete_repository_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_repository_input = {
    name = value_for_key (repository_name_of_yojson) "name" _list path;
    provider = value_for_key (repository_provider_of_yojson) "provider" _list path;
    
  }
  in _res

let delete_environment_template_version_output_of_yojson = 
  fun tree path : delete_environment_template_version_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_environment_template_version_output = {
    environment_template_version = option_of_yojson (value_for_key (environment_template_version_of_yojson) "environmentTemplateVersion") _list path;
    
  }
  in _res

let delete_environment_template_version_input_of_yojson = 
  fun tree path : delete_environment_template_version_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_environment_template_version_input = {
    minor_version = value_for_key (template_version_part_of_yojson) "minorVersion" _list path;
    major_version = value_for_key (template_version_part_of_yojson) "majorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let delete_environment_template_output_of_yojson = 
  fun tree path : delete_environment_template_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_environment_template_output = {
    environment_template = option_of_yojson (value_for_key (environment_template_of_yojson) "environmentTemplate") _list path;
    
  }
  in _res

let delete_environment_template_input_of_yojson = 
  fun tree path : delete_environment_template_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_environment_template_input = {
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let delete_environment_output_of_yojson = 
  fun tree path : delete_environment_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_environment_output = {
    environment = option_of_yojson (value_for_key (environment_of_yojson) "environment") _list path;
    
  }
  in _res

let delete_environment_input_of_yojson = 
  fun tree path : delete_environment_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_environment_input = {
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let delete_environment_account_connection_output_of_yojson = 
  fun tree path : delete_environment_account_connection_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_environment_account_connection_output = {
    environment_account_connection = option_of_yojson (value_for_key (environment_account_connection_of_yojson) "environmentAccountConnection") _list path;
    
  }
  in _res

let delete_environment_account_connection_input_of_yojson = 
  fun tree path : delete_environment_account_connection_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_environment_account_connection_input = {
    id = value_for_key (environment_account_connection_id_of_yojson) "id" _list path;
    
  }
  in _res

let delete_deployment_output_of_yojson = 
  fun tree path : delete_deployment_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_deployment_output = {
    deployment = option_of_yojson (value_for_key (deployment_of_yojson) "deployment") _list path;
    
  }
  in _res

let delete_deployment_input_of_yojson = 
  fun tree path : delete_deployment_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_deployment_input = {
    id = value_for_key (deployment_id_of_yojson) "id" _list path;
    
  }
  in _res

let delete_component_output_of_yojson = 
  fun tree path : delete_component_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_component_output = {
    component = option_of_yojson (value_for_key (component_of_yojson) "component") _list path;
    
  }
  in _res

let delete_component_input_of_yojson = 
  fun tree path : delete_component_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_component_input = {
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let create_template_sync_config_output_of_yojson = 
  fun tree path : create_template_sync_config_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_template_sync_config_output = {
    template_sync_config = option_of_yojson (value_for_key (template_sync_config_of_yojson) "templateSyncConfig") _list path;
    
  }
  in _res

let create_template_sync_config_input_of_yojson = 
  fun tree path : create_template_sync_config_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_template_sync_config_input = {
    subdirectory = option_of_yojson (value_for_key (subdirectory_of_yojson) "subdirectory") _list path;
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "repositoryName" _list path;
    repository_provider = value_for_key (repository_provider_of_yojson) "repositoryProvider" _list path;
    template_type = value_for_key (template_type_of_yojson) "templateType" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    
  }
  in _res

let create_service_template_version_output_of_yojson = 
  fun tree path : create_service_template_version_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_template_version_output = {
    service_template_version = value_for_key (service_template_version_of_yojson) "serviceTemplateVersion" _list path;
    
  }
  in _res

let create_service_template_version_input_of_yojson = 
  fun tree path : create_service_template_version_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_template_version_input = {
    supported_component_sources = option_of_yojson (value_for_key (service_template_supported_component_source_input_list_of_yojson) "supportedComponentSources") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    compatible_environment_templates = value_for_key (compatible_environment_template_input_list_of_yojson) "compatibleEnvironmentTemplates" _list path;
    source = value_for_key (template_version_source_input_of_yojson) "source" _list path;
    major_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "majorVersion") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    
  }
  in _res

let create_service_template_output_of_yojson = 
  fun tree path : create_service_template_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_template_output = {
    service_template = value_for_key (service_template_of_yojson) "serviceTemplate" _list path;
    
  }
  in _res

let create_service_template_input_of_yojson = 
  fun tree path : create_service_template_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_template_input = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    pipeline_provisioning = option_of_yojson (value_for_key (provisioning_of_yojson) "pipelineProvisioning") _list path;
    encryption_key = option_of_yojson (value_for_key (arn_of_yojson) "encryptionKey") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    display_name = option_of_yojson (value_for_key (display_name_of_yojson) "displayName") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let create_service_sync_config_output_of_yojson = 
  fun tree path : create_service_sync_config_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_sync_config_output = {
    service_sync_config = option_of_yojson (value_for_key (service_sync_config_of_yojson) "serviceSyncConfig") _list path;
    
  }
  in _res

let create_service_sync_config_input_of_yojson = 
  fun tree path : create_service_sync_config_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_sync_config_input = {
    file_path = value_for_key (ops_file_path_of_yojson) "filePath" _list path;
    branch = value_for_key (git_branch_name_of_yojson) "branch" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "repositoryName" _list path;
    repository_provider = value_for_key (repository_provider_of_yojson) "repositoryProvider" _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let create_service_output_of_yojson = 
  fun tree path : create_service_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_output = {
    service = value_for_key (service_of_yojson) "service" _list path;
    
  }
  in _res

let create_service_instance_output_of_yojson = 
  fun tree path : create_service_instance_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_instance_output = {
    service_instance = value_for_key (service_instance_of_yojson) "serviceInstance" _list path;
    
  }
  in _res

let create_service_instance_input_of_yojson = 
  fun tree path : create_service_instance_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_instance_input = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    template_minor_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "templateMinorVersion") _list path;
    template_major_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "templateMajorVersion") _list path;
    spec = value_for_key (spec_contents_of_yojson) "spec" _list path;
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let create_service_input_of_yojson = 
  fun tree path : create_service_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_input = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    branch_name = option_of_yojson (value_for_key (git_branch_name_of_yojson) "branchName") _list path;
    repository_id = option_of_yojson (value_for_key (repository_id_of_yojson) "repositoryId") _list path;
    repository_connection_arn = option_of_yojson (value_for_key (arn_of_yojson) "repositoryConnectionArn") _list path;
    spec = value_for_key (spec_contents_of_yojson) "spec" _list path;
    template_minor_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "templateMinorVersion") _list path;
    template_major_version = value_for_key (template_version_part_of_yojson) "templateMajorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let create_repository_output_of_yojson = 
  fun tree path : create_repository_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_repository_output = {
    repository = value_for_key (repository_of_yojson) "repository" _list path;
    
  }
  in _res

let create_repository_input_of_yojson = 
  fun tree path : create_repository_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_repository_input = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    encryption_key = option_of_yojson (value_for_key (arn_of_yojson) "encryptionKey") _list path;
    connection_arn = value_for_key (arn_of_yojson) "connectionArn" _list path;
    name = value_for_key (repository_name_of_yojson) "name" _list path;
    provider = value_for_key (repository_provider_of_yojson) "provider" _list path;
    
  }
  in _res

let create_environment_template_version_output_of_yojson = 
  fun tree path : create_environment_template_version_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_environment_template_version_output = {
    environment_template_version = value_for_key (environment_template_version_of_yojson) "environmentTemplateVersion" _list path;
    
  }
  in _res

let create_environment_template_version_input_of_yojson = 
  fun tree path : create_environment_template_version_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_environment_template_version_input = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    source = value_for_key (template_version_source_input_of_yojson) "source" _list path;
    major_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "majorVersion") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    
  }
  in _res

let create_environment_template_output_of_yojson = 
  fun tree path : create_environment_template_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_environment_template_output = {
    environment_template = value_for_key (environment_template_of_yojson) "environmentTemplate" _list path;
    
  }
  in _res

let create_environment_template_input_of_yojson = 
  fun tree path : create_environment_template_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_environment_template_input = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    provisioning = option_of_yojson (value_for_key (provisioning_of_yojson) "provisioning") _list path;
    encryption_key = option_of_yojson (value_for_key (arn_of_yojson) "encryptionKey") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    display_name = option_of_yojson (value_for_key (display_name_of_yojson) "displayName") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let create_environment_output_of_yojson = 
  fun tree path : create_environment_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_environment_output = {
    environment = value_for_key (environment_of_yojson) "environment" _list path;
    
  }
  in _res

let create_environment_input_of_yojson = 
  fun tree path : create_environment_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_environment_input = {
    codebuild_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "codebuildRoleArn") _list path;
    component_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "componentRoleArn") _list path;
    provisioning_repository = option_of_yojson (value_for_key (repository_branch_input_of_yojson) "provisioningRepository") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    environment_account_connection_id = option_of_yojson (value_for_key (environment_account_connection_id_of_yojson) "environmentAccountConnectionId") _list path;
    proton_service_role_arn = option_of_yojson (value_for_key (arn_of_yojson) "protonServiceRoleArn") _list path;
    spec = value_for_key (spec_contents_of_yojson) "spec" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    template_minor_version = option_of_yojson (value_for_key (template_version_part_of_yojson) "templateMinorVersion") _list path;
    template_major_version = value_for_key (template_version_part_of_yojson) "templateMajorVersion" _list path;
    template_name = value_for_key (resource_name_of_yojson) "templateName" _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let create_environment_account_connection_output_of_yojson = 
  fun tree path : create_environment_account_connection_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_environment_account_connection_output = {
    environment_account_connection = value_for_key (environment_account_connection_of_yojson) "environmentAccountConnection" _list path;
    
  }
  in _res

let create_environment_account_connection_input_of_yojson = 
  fun tree path : create_environment_account_connection_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_environment_account_connection_input = {
    codebuild_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "codebuildRoleArn") _list path;
    component_role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "componentRoleArn") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "roleArn") _list path;
    management_account_id = value_for_key (aws_account_id_of_yojson) "managementAccountId" _list path;
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    
  }
  in _res

let create_component_output_of_yojson = 
  fun tree path : create_component_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_component_output = {
    component = value_for_key (component_of_yojson) "component" _list path;
    
  }
  in _res

let create_component_input_of_yojson = 
  fun tree path : create_component_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_component_input = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    service_spec = option_of_yojson (value_for_key (spec_contents_of_yojson) "serviceSpec") _list path;
    manifest = value_for_key (template_manifest_contents_of_yojson) "manifest" _list path;
    template_file = value_for_key (template_file_contents_of_yojson) "templateFile" _list path;
    environment_name = option_of_yojson (value_for_key (resource_name_of_yojson) "environmentName") _list path;
    service_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceInstanceName") _list path;
    service_name = option_of_yojson (value_for_key (resource_name_of_yojson) "serviceName") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    name = value_for_key (resource_name_of_yojson) "name" _list path;
    
  }
  in _res

let cancel_service_pipeline_deployment_output_of_yojson = 
  fun tree path : cancel_service_pipeline_deployment_output ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_service_pipeline_deployment_output = {
    pipeline = value_for_key (service_pipeline_of_yojson) "pipeline" _list path;
    
  }
  in _res

let cancel_service_pipeline_deployment_input_of_yojson = 
  fun tree path : cancel_service_pipeline_deployment_input ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_service_pipeline_deployment_input = {
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let cancel_service_instance_deployment_output_of_yojson = 
  fun tree path : cancel_service_instance_deployment_output ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_service_instance_deployment_output = {
    service_instance = value_for_key (service_instance_of_yojson) "serviceInstance" _list path;
    
  }
  in _res

let cancel_service_instance_deployment_input_of_yojson = 
  fun tree path : cancel_service_instance_deployment_input ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_service_instance_deployment_input = {
    service_name = value_for_key (resource_name_of_yojson) "serviceName" _list path;
    service_instance_name = value_for_key (resource_name_of_yojson) "serviceInstanceName" _list path;
    
  }
  in _res

let cancel_environment_deployment_output_of_yojson = 
  fun tree path : cancel_environment_deployment_output ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_environment_deployment_output = {
    environment = value_for_key (environment_of_yojson) "environment" _list path;
    
  }
  in _res

let cancel_environment_deployment_input_of_yojson = 
  fun tree path : cancel_environment_deployment_input ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_environment_deployment_input = {
    environment_name = value_for_key (resource_name_of_yojson) "environmentName" _list path;
    
  }
  in _res

let cancel_component_deployment_output_of_yojson = 
  fun tree path : cancel_component_deployment_output ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_component_deployment_output = {
    component = value_for_key (component_of_yojson) "component" _list path;
    
  }
  in _res

let cancel_component_deployment_input_of_yojson = 
  fun tree path : cancel_component_deployment_input ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_component_deployment_input = {
    component_name = value_for_key (resource_name_of_yojson) "componentName" _list path;
    
  }
  in _res

let accept_environment_account_connection_output_of_yojson = 
  fun tree path : accept_environment_account_connection_output ->
  let _list = assoc_of_yojson tree path in
  let _res : accept_environment_account_connection_output = {
    environment_account_connection = value_for_key (environment_account_connection_of_yojson) "environmentAccountConnection" _list path;
    
  }
  in _res

let accept_environment_account_connection_input_of_yojson = 
  fun tree path : accept_environment_account_connection_input ->
  let _list = assoc_of_yojson tree path in
  let _res : accept_environment_account_connection_input = {
    id = value_for_key (environment_account_connection_id_of_yojson) "id" _list path;
    
  }
  in _res

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

