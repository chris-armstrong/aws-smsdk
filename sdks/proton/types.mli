open Smaws_Lib
val service : Service.descriptor

(**{|
    The input is invalid or an out-of-range value was supplied for the input
    parameter.|}*)
type validation_exception = {
  message: string;
  
}

type template_type = | ENVIRONMENT
  | SERVICE

type repository_provider = | GITHUB
  | GITHUB_ENTERPRISE
  | BITBUCKET

(**{|
    The detail data for a template sync configuration.|}*)
type template_sync_config = {
  subdirectory: string option;
   (**{|
    A subdirectory path to your template bundle version.|}*)

  branch: string;
   (**{|
    The repository branch.|}*)

  repository_name: string;
   (**{|
    The repository name (for example, [myrepos/myrepo]).|}*)

  repository_provider: repository_provider;
   (**{|
    The repository provider.|}*)

  template_type: template_type;
   (**{|
    The template type.|}*)

  template_name: string;
   (**{|
    The template name.|}*)

}

type update_template_sync_config_output = {
  template_sync_config: template_sync_config option;
   (**{|
    The template sync configuration detail data that's returned by Proton.|}*)

}

type update_template_sync_config_input = {
  subdirectory: string option;
   (**{|
    A subdirectory path to your template bundle version. When included,
    limits the template bundle search to this repository directory.|}*)

  branch: string;
   (**{|
    The repository branch for your template.|}*)

  repository_name: string;
   (**{|
    The repository name (for example, [myrepos/myrepo]).|}*)

  repository_provider: repository_provider;
   (**{|
    The repository provider.|}*)

  template_type: template_type;
   (**{|
    The synced template type.|}*)

  template_name: string;
   (**{|
    The synced template name.|}*)

}

(**{|
    The request was denied due to request throttling.|}*)
type throttling_exception = {
  message: string;
  
}

(**{|
    The requested resource {i wasn't} found.|}*)
type resource_not_found_exception = {
  message: string;
  
}

(**{|
    The request failed to register with the service.|}*)
type internal_server_exception = {
  message: string;
  
}

(**{|
    The request {i couldn't} be made due to a conflicting operation or
    resource.|}*)
type conflict_exception = {
  message: string;
  
}

(**{|
    There {i isn't} sufficient access for performing this action.|}*)
type access_denied_exception = {
  message: string;
  
}

type template_version_status = | REGISTRATION_IN_PROGRESS
  | REGISTRATION_FAILED
  | DRAFT
  | PUBLISHED

(**{|
    Compatible environment template data.|}*)
type compatible_environment_template = {
  major_version: string;
   (**{|
    The major version of the compatible environment template.|}*)

  template_name: string;
   (**{|
    The compatible environment template name.|}*)

}

type service_template_supported_component_source_type = | DIRECTLY_DEFINED

(**{|
    Detailed data of an Proton service template version resource.|}*)
type service_template_version = {
  supported_component_sources: service_template_supported_component_source_type list option;
   (**{|
    An array of supported component sources. Components with supported
    sources can be attached to service instances based on this service
    template version.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  schema: string option;
   (**{|
    The schema of the version of a service template.|}*)

  compatible_environment_templates: compatible_environment_template list;
   (**{|
    An array of compatible environment template names for the major version
    of a service template.|}*)

  last_modified_at: float;
   (**{|
    The time when the version of a service template was last modified.|}*)

  created_at: float;
   (**{|
    The time when the version of a service template was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the version of a service template.|}*)

  description: string option;
   (**{|
    A description of the version of a service template.|}*)

  status_message: string option;
   (**{|
    A service template version status message.|}*)

  status: template_version_status;
   (**{|
    The service template version status.|}*)

  recommended_minor_version: string option;
   (**{|
    The recommended minor version of the service template.|}*)

  minor_version: string;
   (**{|
    The minor version of a service template.|}*)

  major_version: string;
   (**{|
    The latest major version that's associated with the version of a service
    template.|}*)

  template_name: string;
   (**{|
    The name of the version of a service template.|}*)

}

type update_service_template_version_output = {
  service_template_version: service_template_version;
   (**{|
    The service template version detail data that's returned by Proton.|}*)

}

(**{|
    Compatible environment template data.|}*)
type compatible_environment_template_input = {
  major_version: string;
   (**{|
    The major version of the compatible environment template.|}*)

  template_name: string;
   (**{|
    The compatible environment template name.|}*)

}

type update_service_template_version_input = {
  supported_component_sources: service_template_supported_component_source_type list option;
   (**{|
    An array of supported component sources. Components with supported
    sources can be attached to service instances based on this service
    template version.
    
    A change to [supportedComponentSources] doesn't impact existing component
    attachments to instances based on this template version. A change only
    affects later associations.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  compatible_environment_templates: compatible_environment_template_input list option;
   (**{|
    An array of environment template objects that are compatible with this
    service template version. A service instance based on this service
    template version can run in environments based on compatible templates.|}*)

  status: template_version_status option;
   (**{|
    The status of the service template minor version to update.|}*)

  description: string option;
   (**{|
    A description of a service template version to update.|}*)

  minor_version: string;
   (**{|
    To update a minor version of a service template, include [minorVersion].|}*)

  major_version: string;
   (**{|
    To update a major version of a service template, include [major Version].|}*)

  template_name: string;
   (**{|
    The name of the service template.|}*)

}

type provisioning = | CUSTOMER_MANAGED

(**{|
    Detailed data of an Proton service template resource.|}*)
type service_template = {
  pipeline_provisioning: provisioning option;
   (**{|
    If [pipelineProvisioning] is [true], a service pipeline is included in
    the service template. Otherwise, a service pipeline {i isn't} included in
    the service template.|}*)

  encryption_key: string option;
   (**{|
    The customer provided service template encryption key that's used to
    encrypt data.|}*)

  recommended_version: string option;
   (**{|
    The recommended version of the service template.|}*)

  description: string option;
   (**{|
    A description of the service template.|}*)

  display_name: string option;
   (**{|
    The service template name as displayed in the developer interface.|}*)

  last_modified_at: float;
   (**{|
    The time when the service template was last modified.|}*)

  created_at: float;
   (**{|
    The time when the service template was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the service template.|}*)

  name: string;
   (**{|
    The name of the service template.|}*)

}

type update_service_template_output = {
  service_template: service_template;
   (**{|
    The service template detail data that's returned by Proton.|}*)

}

type update_service_template_input = {
  description: string option;
   (**{|
    A description of the service template update.|}*)

  display_name: string option;
   (**{|
    The name of the service template to update that's displayed in the
    developer interface.|}*)

  name: string;
   (**{|
    The name of the service template to update.|}*)

}

(**{|
    Detailed data of the service sync configuration.|}*)
type service_sync_config = {
  file_path: string;
   (**{|
    The file path to the service sync configuration file.|}*)

  branch: string;
   (**{|
    The name of the code repository branch that holds the service code Proton
    will sync with.|}*)

  repository_name: string;
   (**{|
    The name of the code repository that holds the service code Proton will
    sync with.|}*)

  repository_provider: repository_provider;
   (**{|
    The name of the repository provider that holds the repository Proton will
    sync with.|}*)

  service_name: string;
   (**{|
    The name of the service that the service instance is added to.|}*)

}

type update_service_sync_config_output = {
  service_sync_config: service_sync_config option;
   (**{|
    The detailed data of the Proton Ops file.|}*)

}

type update_service_sync_config_input = {
  file_path: string;
   (**{|
    The path to the Proton Ops file.|}*)

  branch: string;
   (**{|
    The name of the code repository branch where the Proton Ops file is found.|}*)

  repository_name: string;
   (**{|
    The name of the repository where the Proton Ops file is found.|}*)

  repository_provider: repository_provider;
   (**{|
    The name of the repository provider where the Proton Ops file is found.|}*)

  service_name: string;
   (**{|
    The name of the service the Proton Ops file is for.|}*)

}

type blocker_type = | AUTOMATED

type blocker_status = | ACTIVE
  | RESOLVED

(**{|
    Detailed data of the context of the sync blocker.|}*)
type sync_blocker_context = {
  value: string;
   (**{|
    The value of the sync blocker context.|}*)

  key: string;
   (**{|
    The key for the sync blocker context.|}*)

}

(**{|
    Detailed data of the sync blocker.|}*)
type sync_blocker = {
  resolved_at: float option;
   (**{|
    The time the sync blocker was resolved.|}*)

  resolved_reason: string option;
   (**{|
    The reason the sync blocker was resolved.|}*)

  contexts: sync_blocker_context list option;
   (**{|
    The contexts for the sync blocker.|}*)

  created_at: float;
   (**{|
    The time when the sync blocker was created.|}*)

  created_reason: string;
   (**{|
    The reason why the sync blocker was created.|}*)

  status: blocker_status;
   (**{|
    The status of the sync blocker.|}*)

  type_: blocker_type;
   (**{|
    The type of the sync blocker.|}*)

  id: string;
   (**{|
    The ID of the sync blocker.|}*)

}

type update_service_sync_blocker_output = {
  service_sync_blocker: sync_blocker;
   (**{|
    The detailed data on the service sync blocker that was updated.|}*)

  service_instance_name: string option;
   (**{|
    The name of the service instance that you want to update the service sync
    blocker for.|}*)

  service_name: string;
   (**{|
    The name of the service that you want to update the service sync blocker
    for.|}*)

}

type update_service_sync_blocker_input = {
  resolved_reason: string;
   (**{|
    The reason the service sync blocker was resolved.|}*)

  id: string;
   (**{|
    The ID of the service sync blocker.|}*)

}

type deployment_status = | IN_PROGRESS
  | FAILED
  | SUCCEEDED
  | DELETE_IN_PROGRESS
  | DELETE_FAILED
  | DELETE_COMPLETE
  | CANCELLING
  | CANCELLED

(**{|
    Detailed data of an Proton service instance pipeline resource.|}*)
type service_pipeline = {
  last_succeeded_deployment_id: string option;
   (**{|
    The ID of the last successful deployment of this service pipeline.|}*)

  last_attempted_deployment_id: string option;
   (**{|
    The ID of the last attempted deployment of this service pipeline.|}*)

  spec: string option;
   (**{|
    The service spec that was used to create the service pipeline.|}*)

  deployment_status_message: string option;
   (**{|
    A service pipeline deployment status message.|}*)

  deployment_status: deployment_status;
   (**{|
    The deployment status of the service pipeline.|}*)

  template_minor_version: string;
   (**{|
    The minor version of the service template that was used to create the
    service pipeline.|}*)

  template_major_version: string;
   (**{|
    The major version of the service template that was used to create the
    service pipeline.|}*)

  template_name: string;
   (**{|
    The name of the service template that was used to create the service
    pipeline.|}*)

  last_deployment_succeeded_at: float;
   (**{|
    The time when the service pipeline was last deployed successfully.|}*)

  last_deployment_attempted_at: float;
   (**{|
    The time when a deployment of the service pipeline was last attempted.|}*)

  created_at: float;
   (**{|
    The time when the service pipeline was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the service pipeline.|}*)

}

type update_service_pipeline_output = {
  pipeline: service_pipeline;
   (**{|
    The pipeline details that are returned by Proton.|}*)

}

type deployment_update_type = | NONE
  | CURRENT_VERSION
  | MINOR_VERSION
  | MAJOR_VERSION

type update_service_pipeline_input = {
  template_minor_version: string option;
   (**{|
    The minor version of the service template that was used to create the
    service that the pipeline is associated with.|}*)

  template_major_version: string option;
   (**{|
    The major version of the service template that was used to create the
    service that the pipeline is associated with.|}*)

  deployment_type: deployment_update_type;
   (**{|
    The deployment type.
    
    There are four modes for updating a service pipeline. The
    [deploymentType] field defines the mode.
    
    [NONE]
    
    In this mode, a deployment {i doesn't} occur. Only the requested metadata
    parameters are updated.
    
    [CURRENT_VERSION]
    
    In this mode, the service pipeline is deployed and updated with the new
    spec that you provide. Only requested parameters are updated. {i Don’t}
    include major or minor version parameters when you use this
    [deployment-type].
    
    [MINOR_VERSION]
    
    In this mode, the service pipeline is deployed and updated with the
    published, recommended (latest) minor version of the current major
    version in use, by default. You can specify a different minor version of
    the current major version in use.
    
    [MAJOR_VERSION]
    
    In this mode, the service pipeline is deployed and updated with the
    published, recommended (latest) major and minor version of the current
    template, by default. You can specify a different major version that's
    higher than the major version in use and a minor version.
    |}*)

  spec: string;
   (**{|
    The spec for the service pipeline to update.|}*)

  service_name: string;
   (**{|
    The name of the service to that the pipeline is associated with.|}*)

}

type service_status = | CREATE_IN_PROGRESS
  | CREATE_FAILED_CLEANUP_IN_PROGRESS
  | CREATE_FAILED_CLEANUP_COMPLETE
  | CREATE_FAILED_CLEANUP_FAILED
  | CREATE_FAILED
  | ACTIVE
  | DELETE_IN_PROGRESS
  | DELETE_FAILED
  | UPDATE_IN_PROGRESS
  | UPDATE_FAILED_CLEANUP_IN_PROGRESS
  | UPDATE_FAILED_CLEANUP_COMPLETE
  | UPDATE_FAILED_CLEANUP_FAILED
  | UPDATE_FAILED
  | UPDATE_COMPLETE_CLEANUP_FAILED

(**{|
    Detailed data of an Proton service resource.|}*)
type service = {
  branch_name: string option;
   (**{|
    The name of the code repository branch that holds the code that's
    deployed in Proton.|}*)

  repository_id: string option;
   (**{|
    The ID of the source code repository.|}*)

  repository_connection_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the repository connection. For more
    information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/setting-up-for-service.html#setting-up-vcontrol }Setting
    up an AWS CodeStar connection} in the {i Proton User Guide}.|}*)

  pipeline: service_pipeline option;
   (**{|
    The service pipeline detail data.|}*)

  spec: string;
   (**{|
    The formatted specification that defines the service.|}*)

  status_message: string option;
   (**{|
    A service status message.|}*)

  status: service_status;
   (**{|
    The status of the service.|}*)

  last_modified_at: float;
   (**{|
    The time when the service was last modified.|}*)

  created_at: float;
   (**{|
    The time when the service was created.|}*)

  template_name: string;
   (**{|
    The name of the service template.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the service.|}*)

  description: string option;
   (**{|
    A description of the service.|}*)

  name: string;
   (**{|
    The name of the service.|}*)

}

type update_service_output = {
  service: service;
   (**{|
    The service detail data that's returned by Proton.|}*)

}

(**{|
    Detailed data of an Proton service instance resource.|}*)
type service_instance = {
  last_succeeded_deployment_id: string option;
   (**{|
    The ID of the last successful deployment of this service instance.|}*)

  last_attempted_deployment_id: string option;
   (**{|
    The ID of the last attempted deployment of this service instance.|}*)

  last_client_request_token: string option;
   (**{|
    The last client request token received.|}*)

  spec: string option;
   (**{|
    The service spec that was used to create the service instance.|}*)

  deployment_status_message: string option;
   (**{|
    The message associated with the service instance deployment status.|}*)

  deployment_status: deployment_status;
   (**{|
    The service instance deployment status.|}*)

  template_minor_version: string;
   (**{|
    The minor version of the service template that was used to create the
    service instance.|}*)

  template_major_version: string;
   (**{|
    The major version of the service template that was used to create the
    service instance.|}*)

  template_name: string;
   (**{|
    The name of the service template that was used to create the service
    instance.|}*)

  environment_name: string;
   (**{|
    The name of the environment that the service instance was deployed into.|}*)

  service_name: string;
   (**{|
    The name of the service that the service instance belongs to.|}*)

  last_deployment_succeeded_at: float;
   (**{|
    The time when the service instance was last deployed successfully.|}*)

  last_deployment_attempted_at: float;
   (**{|
    The time when a deployment of the service instance was last attempted.|}*)

  created_at: float;
   (**{|
    The time when the service instance was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the service instance.|}*)

  name: string;
   (**{|
    The name of the service instance.|}*)

}

type update_service_instance_output = {
  service_instance: service_instance;
   (**{|
    The service instance summary data that's returned by Proton.|}*)

}

type update_service_instance_input = {
  client_token: string option;
   (**{|
    The client token of the service instance to update.|}*)

  template_minor_version: string option;
   (**{|
    The minor version of the service template to update.|}*)

  template_major_version: string option;
   (**{|
    The major version of the service template to update.|}*)

  spec: string option;
   (**{|
    The formatted specification that defines the service instance update.|}*)

  deployment_type: deployment_update_type;
   (**{|
    The deployment type. It defines the mode for updating a service instance,
    as follows:
    
    [NONE]
    
    In this mode, a deployment {i doesn't} occur. Only the requested metadata
    parameters are updated.
    
    [CURRENT_VERSION]
    
    In this mode, the service instance is deployed and updated with the new
    spec that you provide. Only requested parameters are updated. {i Don’t}
    include major or minor version parameters when you use this deployment
    type.
    
    [MINOR_VERSION]
    
    In this mode, the service instance is deployed and updated with the
    published, recommended (latest) minor version of the current major
    version in use, by default. You can also specify a different minor
    version of the current major version in use.
    
    [MAJOR_VERSION]
    
    In this mode, the service instance is deployed and updated with the
    published, recommended (latest) major and minor version of the current
    template, by default. You can specify a different major version that's
    higher than the major version in use and a minor version.
    |}*)

  service_name: string;
   (**{|
    The name of the service that the service instance belongs to.|}*)

  name: string;
   (**{|
    The name of the service instance to update.|}*)

}

type update_service_input = {
  spec: string option;
   (**{|
    Lists the service instances to add and the existing service instances to
    remain. Omit the existing service instances to delete from the list.
    {i Don't} include edits to the existing service instances or pipeline.
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-svc-update.html }Edit
    a service} in the {i Proton User Guide}.|}*)

  description: string option;
   (**{|
    The edited service description.|}*)

  name: string;
   (**{|
    The name of the service to edit.|}*)

}

(**{|
    A quota was exceeded. For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-limits.html }Proton
    Quotas} in the {i Proton User Guide}.|}*)
type service_quota_exceeded_exception = {
  message: string;
  
}

(**{|
    The environment template version data.|}*)
type environment_template_version = {
  schema: string option;
   (**{|
    The schema of the version of an environment template.|}*)

  last_modified_at: float;
   (**{|
    The time when the version of an environment template was last modified.|}*)

  created_at: float;
   (**{|
    The time when the version of an environment template was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the version of an environment template.|}*)

  description: string option;
   (**{|
    A description of the minor version of an environment template.|}*)

  status_message: string option;
   (**{|
    The status message of the version of an environment template.|}*)

  status: template_version_status;
   (**{|
    The status of the version of an environment template.|}*)

  recommended_minor_version: string option;
   (**{|
    The recommended minor version of the environment template.|}*)

  minor_version: string;
   (**{|
    The minor version of an environment template.|}*)

  major_version: string;
   (**{|
    The latest major version that's associated with the version of an
    environment template.|}*)

  template_name: string;
   (**{|
    The name of the version of an environment template.|}*)

}

type update_environment_template_version_output = {
  environment_template_version: environment_template_version;
   (**{|
    The environment template version detail data that's returned by Proton.|}*)

}

type update_environment_template_version_input = {
  status: template_version_status option;
   (**{|
    The status of the environment template minor version to update.|}*)

  description: string option;
   (**{|
    A description of environment template version to update.|}*)

  minor_version: string;
   (**{|
    To update a minor version of an environment template, include
    [minorVersion].|}*)

  major_version: string;
   (**{|
    To update a major version of an environment template, include [major
    Version].|}*)

  template_name: string;
   (**{|
    The name of the environment template.|}*)

}

(**{|
    The environment template data.|}*)
type environment_template = {
  provisioning: provisioning option;
   (**{|
    When included, indicates that the environment template is for customer
    provisioned and managed infrastructure.|}*)

  encryption_key: string option;
   (**{|
    The customer provided encryption key for the environment template.|}*)

  recommended_version: string option;
   (**{|
    The ID of the recommended version of the environment template.|}*)

  description: string option;
   (**{|
    A description of the environment template.|}*)

  display_name: string option;
   (**{|
    The name of the environment template as displayed in the developer
    interface.|}*)

  last_modified_at: float;
   (**{|
    The time when the environment template was last modified.|}*)

  created_at: float;
   (**{|
    The time when the environment template was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the environment template.|}*)

  name: string;
   (**{|
    The name of the environment template.|}*)

}

type update_environment_template_output = {
  environment_template: environment_template;
   (**{|
    The environment template detail data that's returned by Proton.|}*)

}

type update_environment_template_input = {
  description: string option;
   (**{|
    A description of the environment template update.|}*)

  display_name: string option;
   (**{|
    The name of the environment template to update as displayed in the
    developer interface.|}*)

  name: string;
   (**{|
    The name of the environment template to update.|}*)

}

(**{|
    Detail data for a linked repository branch.|}*)
type repository_branch = {
  branch: string;
   (**{|
    The repository branch.|}*)

  name: string;
   (**{|
    The repository name.|}*)

  provider: repository_provider;
   (**{|
    The repository provider.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the linked repository.|}*)

}

(**{|
    Detailed data of an Proton environment resource. An Proton environment is
    a set of resources shared across Proton services.|}*)
type environment = {
  last_succeeded_deployment_id: string option;
   (**{|
    The ID of the last successful deployment of this environment.|}*)

  last_attempted_deployment_id: string option;
   (**{|
    The ID of the last attempted deployment of this environment.|}*)

  codebuild_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that allows Proton
    to provision infrastructure using CodeBuild-based provisioning on your
    behalf.|}*)

  component_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that Proton uses
    when provisioning directly defined components in this environment. It
    determines the scope of infrastructure that a component can provision.
    
    The environment must have a [componentRoleArn] to allow directly defined
    components to be associated with the environment.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  provisioning_repository: repository_branch option;
   (**{|
    The linked repository that you use to host your rendered infrastructure
    templates for self-managed provisioning. A linked repository is a
    repository that has been registered with Proton. For more information,
    see
    {{: https://docs.aws.amazon.com/proton/latest/APIReference/API_CreateRepository.html }CreateRepository}.
    |}*)

  provisioning: provisioning option;
   (**{|
    When included, indicates that the environment template is for customer
    provisioned and managed infrastructure.|}*)

  spec: string option;
   (**{|
    The environment spec.|}*)

  environment_account_id: string option;
   (**{|
    The ID of the environment account that the environment infrastructure
    resources are provisioned in.|}*)

  environment_account_connection_id: string option;
   (**{|
    The ID of the environment account connection that's used to provision
    infrastructure resources in an environment account.|}*)

  proton_service_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the Proton service role that allows
    Proton to make calls to other services on your behalf.|}*)

  deployment_status_message: string option;
   (**{|
    An environment deployment status message.|}*)

  deployment_status: deployment_status;
   (**{|
    The environment deployment status.|}*)

  template_minor_version: string;
   (**{|
    The minor version of the environment template.|}*)

  template_major_version: string;
   (**{|
    The major version of the environment template.|}*)

  template_name: string;
   (**{|
    The Amazon Resource Name (ARN) of the environment template.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the environment.|}*)

  last_deployment_succeeded_at: float;
   (**{|
    The time when the environment was last deployed successfully.|}*)

  last_deployment_attempted_at: float;
   (**{|
    The time when a deployment of the environment was last attempted.|}*)

  created_at: float;
   (**{|
    The time when the environment was created.|}*)

  description: string option;
   (**{|
    The description of the environment.|}*)

  name: string;
   (**{|
    The name of the environment.|}*)

}

type update_environment_output = {
  environment: environment;
   (**{|
    The environment detail data that's returned by Proton.|}*)

}

(**{|
    Detail input data for a linked repository branch.|}*)
type repository_branch_input = {
  branch: string;
   (**{|
    The repository branch.|}*)

  name: string;
   (**{|
    The repository name.|}*)

  provider: repository_provider;
   (**{|
    The repository provider.|}*)

}

type update_environment_input = {
  codebuild_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that allows Proton
    to provision infrastructure using CodeBuild-based provisioning on your
    behalf.|}*)

  component_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that Proton uses
    when provisioning directly defined components in this environment. It
    determines the scope of infrastructure that a component can provision.
    
    The environment must have a [componentRoleArn] to allow directly defined
    components to be associated with the environment.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  provisioning_repository: repository_branch_input option;
   (**{|
    The linked repository that you use to host your rendered infrastructure
    templates for self-managed provisioning. A linked repository is a
    repository that has been registered with Proton. For more information,
    see {{:  }CreateRepository}.|}*)

  environment_account_connection_id: string option;
   (**{|
    The ID of the environment account connection.
    
    You can only update to a new environment account connection if it was
    created in the same environment account that the current environment
    account connection was created in and is associated with the current
    environment.|}*)

  deployment_type: deployment_update_type;
   (**{|
    There are four modes for updating an environment. The [deploymentType]
    field defines the mode.
    
    [NONE]
    
    In this mode, a deployment {i doesn't} occur. Only the requested metadata
    parameters are updated.
    
    [CURRENT_VERSION]
    
    In this mode, the environment is deployed and updated with the new spec
    that you provide. Only requested parameters are updated. {i Don’t}
    include major or minor version parameters when you use this
    [deployment-type].
    
    [MINOR_VERSION]
    
    In this mode, the environment is deployed and updated with the published,
    recommended (latest) minor version of the current major version in use,
    by default. You can also specify a different minor version of the current
    major version in use.
    
    [MAJOR_VERSION]
    
    In this mode, the environment is deployed and updated with the published,
    recommended (latest) major and minor version of the current template, by
    default. You can also specify a different major version that is higher
    than the major version in use and a minor version (optional).
    |}*)

  proton_service_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the Proton service role that allows
    Proton to make API calls to other services your behalf.|}*)

  template_minor_version: string option;
   (**{|
    The minor version of the environment to update.|}*)

  template_major_version: string option;
   (**{|
    The major version of the environment to update.|}*)

  spec: string option;
   (**{|
    The formatted specification that defines the update.|}*)

  description: string option;
   (**{|
    A description of the environment update.|}*)

  name: string;
   (**{|
    The name of the environment to update.|}*)

}

type environment_account_connection_status = | PENDING
  | CONNECTED
  | REJECTED

(**{|
    Detailed data of an Proton environment account connection resource.|}*)
type environment_account_connection = {
  codebuild_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM service role in the environment
    account. Proton uses this role to provision infrastructure resources
    using CodeBuild-based provisioning in the associated environment account.|}*)

  component_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that Proton uses
    when provisioning directly defined components in the associated
    environment account. It determines the scope of infrastructure that a
    component can provision in the account.
    
    The environment account connection must have a [componentRoleArn] to
    allow directly defined components to be associated with any environments
    running in the account.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  status: environment_account_connection_status;
   (**{|
    The status of the environment account connection.|}*)

  last_modified_at: float;
   (**{|
    The time when the environment account connection was last modified.|}*)

  requested_at: float;
   (**{|
    The time when the environment account connection request was made.|}*)

  environment_name: string;
   (**{|
    The name of the environment that's associated with the environment
    account connection.|}*)

  role_arn: string;
   (**{|
    The IAM service role that's associated with the environment account
    connection.|}*)

  environment_account_id: string;
   (**{|
    The environment account that's connected to the environment account
    connection.|}*)

  management_account_id: string;
   (**{|
    The ID of the management account that's connected to the environment
    account connection.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the environment account connection.|}*)

  id: string;
   (**{|
    The ID of the environment account connection.|}*)

}

type update_environment_account_connection_output = {
  environment_account_connection: environment_account_connection;
   (**{|
    The environment account connection detail data that's returned by Proton.|}*)

}

type update_environment_account_connection_input = {
  codebuild_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM service role in the environment
    account. Proton uses this role to provision infrastructure resources
    using CodeBuild-based provisioning in the associated environment account.|}*)

  component_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that Proton uses
    when provisioning directly defined components in the associated
    environment account. It determines the scope of infrastructure that a
    component can provision in the account.
    
    The environment account connection must have a [componentRoleArn] to
    allow directly defined components to be associated with any environments
    running in the account.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that's associated
    with the environment account connection to update.|}*)

  id: string;
   (**{|
    The ID of the environment account connection to update.|}*)

}

(**{|
    Detailed data of an Proton component resource.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)
type component = {
  last_succeeded_deployment_id: string option;
   (**{|
    The ID of the last successful deployment of this component.|}*)

  last_attempted_deployment_id: string option;
   (**{|
    The ID of the last attempted deployment of this component.|}*)

  last_client_request_token: string option;
   (**{|
    The last token the client requested.|}*)

  service_spec: string option;
   (**{|
    The service spec that the component uses to access service inputs.
    Provided when a component is attached to a service instance.|}*)

  deployment_status_message: string option;
   (**{|
    The message associated with the component deployment status.|}*)

  deployment_status: deployment_status;
   (**{|
    The component deployment status.|}*)

  last_deployment_succeeded_at: float option;
   (**{|
    The time when the component was last deployed successfully.|}*)

  last_deployment_attempted_at: float option;
   (**{|
    The time when a deployment of the component was last attempted.|}*)

  last_modified_at: float;
   (**{|
    The time when the component was last modified.|}*)

  created_at: float;
   (**{|
    The time when the component was created.|}*)

  service_instance_name: string option;
   (**{|
    The name of the service instance that this component is attached to.
    Provided when a component is attached to a service instance.|}*)

  service_name: string option;
   (**{|
    The name of the service that [serviceInstanceName] is associated with.
    Provided when a component is attached to a service instance.|}*)

  environment_name: string;
   (**{|
    The name of the Proton environment that this component is associated with.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the component.|}*)

  description: string option;
   (**{|
    A description of the component.|}*)

  name: string;
   (**{|
    The name of the component.|}*)

}

type update_component_output = {
  component: component;
   (**{|
    The detailed data of the updated component.|}*)

}

type component_deployment_update_type = | NONE
  | CURRENT_VERSION

type update_component_input = {
  client_token: string option;
   (**{|
    The client token for the updated component.|}*)

  template_file: string option;
   (**{|
    A path to the Infrastructure as Code (IaC) file describing infrastructure
    that a custom component provisions.
    
    Components support a single IaC file, even if you use Terraform as your
    template language.
    |}*)

  service_spec: string option;
   (**{|
    The service spec that you want the component to use to access service
    inputs. Set this only when the component is attached to a service
    instance.|}*)

  service_instance_name: string option;
   (**{|
    The name of the service instance that you want to attach this component
    to. Don't specify to keep the component's current service instance
    attachment. Specify an empty string to detach the component from the
    service instance it's attached to. Specify non-empty values for both
    [serviceInstanceName] and [serviceName] or for neither of them.|}*)

  service_name: string option;
   (**{|
    The name of the service that [serviceInstanceName] is associated with.
    Don't specify to keep the component's current service instance
    attachment. Specify an empty string to detach the component from the
    service instance it's attached to. Specify non-empty values for both
    [serviceInstanceName] and [serviceName] or for neither of them.|}*)

  description: string option;
   (**{|
    An optional customer-provided description of the component.|}*)

  deployment_type: component_deployment_update_type;
   (**{|
    The deployment type. It defines the mode for updating a component, as
    follows:
    
    [NONE]
    
    In this mode, a deployment {i doesn't} occur. Only the requested metadata
    parameters are updated. You can only specify [description] in this mode.
    
    [CURRENT_VERSION]
    
    In this mode, the component is deployed and updated with the new
    [serviceSpec], [templateSource], and/or [type] that you provide. Only
    requested parameters are updated.
    |}*)

  name: string;
   (**{|
    The name of the component to update.|}*)

}

(**{|
    Proton settings that are used for multiple services in the Amazon Web
    Services account.|}*)
type account_settings = {
  pipeline_codebuild_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the service role that Proton uses for
    provisioning pipelines. Proton assumes this role for CodeBuild-based
    provisioning.|}*)

  pipeline_provisioning_repository: repository_branch option;
   (**{|
    The linked repository for pipeline provisioning. Required if you have
    environments configured for self-managed provisioning with services that
    include pipelines. A linked repository is a repository that has been
    registered with Proton. For more information, see
    {{:  }CreateRepository}.|}*)

  pipeline_service_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the service role you want to use for
    provisioning pipelines. Assumed by Proton for Amazon Web Services-managed
    provisioning, and by customer-owned automation for self-managed
    provisioning.|}*)

}

type update_account_settings_output = {
  account_settings: account_settings;
   (**{|
    The Proton pipeline service role and repository data shared across the
    Amazon Web Services account.|}*)

}

type update_account_settings_input = {
  pipeline_codebuild_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the service role you want to use for
    provisioning pipelines. Proton assumes this role for CodeBuild-based
    provisioning.|}*)

  delete_pipeline_provisioning_repository: bool option;
   (**{|
    Set to [true] to remove a configured pipeline repository from the account
    settings. Don't set this field if you are updating the configured
    pipeline repository.|}*)

  pipeline_provisioning_repository: repository_branch_input option;
   (**{|
    A linked repository for pipeline provisioning. Specify it if you have
    environments configured for self-managed provisioning with services that
    include pipelines. A linked repository is a repository that has been
    registered with Proton. For more information, see
    {{:  }CreateRepository}.
    
    To remove a previously configured repository, set
    [deletePipelineProvisioningRepository] to [true], and don't set
    [pipelineProvisioningRepository].|}*)

  pipeline_service_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the service role you want to use for
    provisioning pipelines. Assumed by Proton for Amazon Web Services-managed
    provisioning, and by customer-owned automation for self-managed
    provisioning.
    
    To remove a previously configured ARN, specify an empty string.|}*)

}

type untag_resource_output = unit

type untag_resource_input = {
  tag_keys: string list;
   (**{|
    A list of customer tag keys that indicate the customer tags to be removed
    from the resource.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource to remove customer tags
    from.|}*)

}

(**{|
    Template bundle S3 bucket data.|}*)
type s3_object_source = {
  key: string;
   (**{|
    The path to the S3 bucket that contains a template bundle.|}*)

  bucket: string;
   (**{|
    The name of the S3 bucket that contains a template bundle.|}*)

}

(**{|
    Template version source data.|}*)
type template_version_source_input = S3 of s3_object_source

type tag_resource_output = unit

(**{|
    A description of a resource tag.|}*)
type tag = {
  value: string;
   (**{|
    The value of the resource tag.|}*)

  key: string;
   (**{|
    The key of the resource tag.|}*)

}

type tag_resource_input = {
  tags: tag list;
   (**{|
    A list of customer tags to apply to the Proton resource.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the Proton resource to apply customer
    tags to.|}*)

}

type sync_type = | TEMPLATE_SYNC
  | SERVICE_SYNC

type sort_order = | ASCENDING
  | DESCENDING

(**{|
    Summary data of an Proton service template version resource.|}*)
type service_template_version_summary = {
  last_modified_at: float;
   (**{|
    The time when the version of a service template was last modified.|}*)

  created_at: float;
   (**{|
    The time when the version of a service template was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the version of a service template.|}*)

  description: string option;
   (**{|
    A description of the version of a service template.|}*)

  status_message: string option;
   (**{|
    A service template minor version status message.|}*)

  status: template_version_status;
   (**{|
    The service template minor version status.|}*)

  recommended_minor_version: string option;
   (**{|
    The recommended minor version of the service template.|}*)

  minor_version: string;
   (**{|
    The minor version of a service template.|}*)

  major_version: string;
   (**{|
    The latest major version that's associated with the version of a service
    template.|}*)

  template_name: string;
   (**{|
    The name of the service template.|}*)

}

(**{|
    Summary data of an Proton service template resource.|}*)
type service_template_summary = {
  pipeline_provisioning: provisioning option;
   (**{|
    If [pipelineProvisioning] is [true], a service pipeline is included in
    the service template, otherwise a service pipeline {i isn't} included in
    the service template.|}*)

  recommended_version: string option;
   (**{|
    The recommended version of the service template.|}*)

  description: string option;
   (**{|
    A description of the service template.|}*)

  display_name: string option;
   (**{|
    The service template name as displayed in the developer interface.|}*)

  last_modified_at: float;
   (**{|
    The time when the service template was last modified.|}*)

  created_at: float;
   (**{|
    The time when the service template was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the service template.|}*)

  name: string;
   (**{|
    The name of the service template.|}*)

}

(**{|
    If a service instance is manually updated, Proton wants to prevent
    accidentally overriding a manual change.
    
    A blocker is created because of the manual update or deletion of a
    service instance. The summary describes the blocker as being active or
    resolved.|}*)
type service_sync_blocker_summary = {
  latest_blockers: sync_blocker list option;
   (**{|
    The latest active blockers for the synced service.|}*)

  service_instance_name: string option;
   (**{|
    The name of the service instance that you want sync your service
    configuration with.|}*)

  service_name: string;
   (**{|
    The name of the service that you want to get the sync blocker summary
    for. If given a service instance name and a service name, it will return
    the blockers only applying to the instance that is blocked.
    
    If given only a service name, it will return the blockers that apply to
    all of the instances. In order to get the blockers for a single instance,
    you will need to make two distinct calls, one to get the sync blocker
    summary for the service and the other to get the sync blocker for the
    service instance.|}*)

}

(**{|
    Summary data of an Proton service resource.|}*)
type service_summary = {
  status_message: string option;
   (**{|
    A service status message.|}*)

  status: service_status;
   (**{|
    The status of the service.|}*)

  last_modified_at: float;
   (**{|
    The time when the service was last modified.|}*)

  created_at: float;
   (**{|
    The time when the service was created.|}*)

  template_name: string;
   (**{|
    The name of the service template.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the service.|}*)

  description: string option;
   (**{|
    A description of the service.|}*)

  name: string;
   (**{|
    The name of the service.|}*)

}

(**{|
    The detailed data about the current state of the service pipeline.|}*)
type service_pipeline_state = {
  template_minor_version: string;
   (**{|
    The minor version of the service template that was used to create the
    service pipeline.|}*)

  template_major_version: string;
   (**{|
    The major version of the service template that was used to create the
    service pipeline.|}*)

  template_name: string;
   (**{|
    The name of the service template that was used to create the service
    pipeline.|}*)

  spec: string option;
   (**{|
    The service spec that was used to create the service pipeline.|}*)

}

(**{|
    Summary data of an Proton service instance resource.|}*)
type service_instance_summary = {
  last_succeeded_deployment_id: string option;
   (**{|
    The ID of the last successful deployment of this service instance.|}*)

  last_attempted_deployment_id: string option;
   (**{|
    The ID of the last attempted deployment of this service instance.|}*)

  deployment_status_message: string option;
   (**{|
    A service instance deployment status message.|}*)

  deployment_status: deployment_status;
   (**{|
    The service instance deployment status.|}*)

  template_minor_version: string;
   (**{|
    The service instance template minor version.|}*)

  template_major_version: string;
   (**{|
    The service instance template major version.|}*)

  template_name: string;
   (**{|
    The name of the service template.|}*)

  environment_name: string;
   (**{|
    The name of the environment that the service instance was deployed into.|}*)

  service_name: string;
   (**{|
    The name of the service that the service instance belongs to.|}*)

  last_deployment_succeeded_at: float;
   (**{|
    The time when the service was last deployed successfully.|}*)

  last_deployment_attempted_at: float;
   (**{|
    The time when a deployment of the service was last attempted.|}*)

  created_at: float;
   (**{|
    The time when the service instance was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the service instance.|}*)

  name: string;
   (**{|
    The name of the service instance.|}*)

}

(**{|
    The detailed data about the current state of this service instance.|}*)
type service_instance_state = {
  last_successful_service_pipeline_deployment_id: string option;
   (**{|
    The ID for the last successful service pipeline deployed for this service
    instance.|}*)

  last_successful_environment_deployment_id: string option;
   (**{|
    The ID for the last successful environment deployed for this service
    instance.|}*)

  last_successful_component_deployment_ids: string list option;
   (**{|
    The IDs for the last successful components deployed for this service
    instance.|}*)

  template_minor_version: string;
   (**{|
    The minor version of the service template that was used to create the
    service pipeline.|}*)

  template_major_version: string;
   (**{|
    The major version of the service template that was used to create the
    service pipeline.|}*)

  template_name: string;
   (**{|
    The name of the service template that was used to create the service
    instance.|}*)

  spec: string;
   (**{|
    The service spec that was used to create the service instance.|}*)

}

(**{|
    Revision detail data for a commit and push that activates a sync attempt|}*)
type revision = {
  branch: string;
   (**{|
    The repository branch.|}*)

  directory: string;
   (**{|
    The repository directory changed by a commit and push that activated the
    sync attempt.|}*)

  sha: string;
   (**{|
    The secure hash algorithm (SHA) hash for the revision.|}*)

  repository_provider: repository_provider;
   (**{|
    The repository provider.|}*)

  repository_name: string;
   (**{|
    The repository name.|}*)

}

type resource_sync_status = | INITIATED
  | IN_PROGRESS
  | SUCCEEDED
  | FAILED

(**{|
    Detail data for a resource sync event.|}*)
type resource_sync_event = {
  event: string;
   (**{|
    A resource sync event.|}*)

  time: float;
   (**{|
    The time when the event occurred.|}*)

  external_id: string option;
   (**{|
    The external ID for the event.|}*)

  type_: string;
   (**{|
    The type of event.|}*)

}

(**{|
    Detail data for a resource sync attempt activated by a push to a
    repository.|}*)
type resource_sync_attempt = {
  events: resource_sync_event list;
   (**{|
    An array of events with detail data.|}*)

  status: resource_sync_status;
   (**{|
    The status of the sync attempt.|}*)

  started_at: float;
   (**{|
    The time when the sync attempt started.|}*)

  target: string;
   (**{|
    The resource that is synced to.|}*)

  target_revision: revision;
   (**{|
    Detail data for the target revision.|}*)

  initial_revision: revision;
   (**{|
    Detail data for the initial repository commit, path and push.|}*)

}

type resource_deployment_status = | IN_PROGRESS
  | FAILED
  | SUCCEEDED

(**{|
    Summary counts of each Proton resource types.|}*)
type resource_counts_summary = {
  behind_minor: int option;
   (**{|
    The number of resources of this type in the Amazon Web Services account
    that need a minor template version update.|}*)

  behind_major: int option;
   (**{|
    The number of resources of this type in the Amazon Web Services account
    that need a major template version update.|}*)

  up_to_date: int option;
   (**{|
    The number of resources of this type in the Amazon Web Services account
    that are up-to-date with their template.|}*)

  failed: int option;
   (**{|
    The number of resources of this type in the Amazon Web Services account
    that failed to deploy.|}*)

  total: int;
   (**{|
    The total number of resources of this type in the Amazon Web Services
    account.|}*)

}

type repository_sync_status = | INITIATED
  | IN_PROGRESS
  | SUCCEEDED
  | FAILED
  | QUEUED

(**{|
    Repository sync event detail data for a sync attempt.|}*)
type repository_sync_event = {
  event: string;
   (**{|
    Event detail for a repository sync attempt.|}*)

  time: float;
   (**{|
    The time that the sync event occurred.|}*)

  external_id: string option;
   (**{|
    The external ID of the sync event.|}*)

  type_: string;
   (**{|
    The type of event.|}*)

}

(**{|
    A repository sync definition.|}*)
type repository_sync_definition = {
  directory: string;
   (**{|
    The directory in the repository.|}*)

  branch: string;
   (**{|
    The repository branch.|}*)

  parent: string;
   (**{|
    The resource that is synced from.|}*)

  target: string;
   (**{|
    The resource that is synced to.|}*)

}

(**{|
    Detail data for a repository sync attempt activated by a push to a
    repository.|}*)
type repository_sync_attempt = {
  events: repository_sync_event list;
   (**{|
    Detail data for sync attempt events.|}*)

  status: repository_sync_status;
   (**{|
    The sync attempt status.|}*)

  started_at: float;
   (**{|
    The time when the sync attempt started.|}*)

}

(**{|
    Summary data of a linked repository—a repository that has been
    registered with Proton.|}*)
type repository_summary = {
  connection_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the of your connection that connects
    Proton to your repository.|}*)

  name: string;
   (**{|
    The repository name.|}*)

  provider: repository_provider;
   (**{|
    The repository provider.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the linked repository.|}*)

}

(**{|
    Detailed data of a linked repository—a repository that has been
    registered with Proton.|}*)
type repository = {
  encryption_key: string option;
   (**{|
    Your customer Amazon Web Services KMS encryption key.|}*)

  connection_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of your AWS CodeStar connection that
    connects Proton to your repository provider account.|}*)

  name: string;
   (**{|
    The repository name.|}*)

  provider: repository_provider;
   (**{|
    The repository provider.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the linked repository.|}*)

}

type reject_environment_account_connection_output = {
  environment_account_connection: environment_account_connection;
   (**{|
    The environment connection account detail data that's returned by Proton.|}*)

}

type reject_environment_account_connection_input = {
  id: string;
   (**{|
    The ID of the environment account connection to reject.|}*)

}

type provisioned_resource_engine = | CLOUDFORMATION
  | TERRAFORM

(**{|
    Detail data for a provisioned resource.|}*)
type provisioned_resource = {
  provisioning_engine: provisioned_resource_engine option;
   (**{|
    The resource provisioning engine. At this time, [CLOUDFORMATION] can be
    used for Amazon Web Services-managed provisioning, and [TERRAFORM] can be
    used for self-managed provisioning.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html#ag-works-prov-methods-self }Self-managed
    provisioning} in the {i Proton User Guide}.|}*)

  identifier: string option;
   (**{|
    The provisioned resource identifier.|}*)

  name: string option;
   (**{|
    The provisioned resource name.|}*)

}

(**{|
    An infrastructure as code defined resource output.|}*)
type output = {
  value_string: string option;
   (**{|
    The output value.|}*)

  key: string option;
   (**{|
    The output key.|}*)

}

type notify_resource_deployment_status_change_output = unit

type notify_resource_deployment_status_change_input = {
  status_message: string option;
   (**{|
    The deployment status message for your provisioned resource.|}*)

  deployment_id: string option;
   (**{|
    The deployment ID for your provisioned resource.|}*)

  outputs: output list option;
   (**{|
    The provisioned resource state change detail data that's returned by
    Proton.|}*)

  status: resource_deployment_status option;
   (**{|
    The status of your provisioned resource.|}*)

  resource_arn: string;
   (**{|
    The provisioned resource Amazon Resource Name (ARN).|}*)

}

type list_tags_for_resource_output = {
  next_token: string option;
   (**{|
    A token that indicates the location of the next resource tag in the array
    of resource tags, after the current requested list of resource tags.|}*)

  tags: tag list;
   (**{|
    A list of resource tags with detail data.|}*)

}

type list_tags_for_resource_input = {
  max_results: int option;
   (**{|
    The maximum number of tags to list.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next resource tag in the array
    of resource tags, after the list of resource tags that was previously
    requested.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource for the listed tags.|}*)

}

type list_services_output = {
  services: service_summary list;
   (**{|
    An array of services with summaries of detail data.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next service in the array of
    services, after the current requested list of services.|}*)

}

type list_services_input = {
  max_results: int option;
   (**{|
    The maximum number of services to list.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next service in the array of
    services, after the list of services that was previously requested.|}*)

}

type list_service_templates_output = {
  templates: service_template_summary list;
   (**{|
    An array of service templates with detail data.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next service template in the
    array of service templates, after the current requested list of service
    templates.|}*)

}

type list_service_templates_input = {
  max_results: int option;
   (**{|
    The maximum number of service templates to list.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next service template in the
    array of service templates, after the list of service templates
    previously requested.|}*)

}

type list_service_template_versions_output = {
  template_versions: service_template_version_summary list;
   (**{|
    An array of major or minor versions of a service template with detail
    data.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next major or minor version in
    the array of major or minor versions of a service template, after the
    current requested list of service major or minor versions.|}*)

}

type list_service_template_versions_input = {
  major_version: string option;
   (**{|
    To view a list of minor of versions under a major version of a service
    template, include [major Version].
    
    To view a list of major versions of a service template, {i exclude}
    [major Version].|}*)

  template_name: string;
   (**{|
    The name of the service template.|}*)

  max_results: int option;
   (**{|
    The maximum number of major or minor versions of a service template to
    list.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next major or minor version in
    the array of major or minor versions of a service template, after the
    list of major or minor versions that was previously requested.|}*)

}

type list_service_pipeline_provisioned_resources_output = {
  provisioned_resources: provisioned_resource list;
   (**{|
    An array of provisioned resources for a service and pipeline.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next provisioned resource in
    the array of provisioned resources, after the current requested list of
    provisioned resources.|}*)

}

type list_service_pipeline_provisioned_resources_input = {
  next_token: string option;
   (**{|
    A token that indicates the location of the next provisioned resource in
    the array of provisioned resources, after the list of provisioned
    resources that was previously requested.|}*)

  service_name: string;
   (**{|
    The name of the service whose pipeline's provisioned resources you want.|}*)

}

type list_service_pipeline_outputs_output = {
  outputs: output list;
   (**{|
    An array of service pipeline Infrastructure as Code (IaC) outputs.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next output in the array of
    outputs, after the current requested list of outputs.|}*)

}

type list_service_pipeline_outputs_input = {
  deployment_id: string option;
   (**{|
    The ID of the deployment you want the outputs for.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next output in the array of
    outputs, after the list of outputs that was previously requested.|}*)

  service_name: string;
   (**{|
    The name of the service whose pipeline's outputs you want.|}*)

}

type list_service_instances_sort_by = | NAME
  | DEPLOYMENT_STATUS
  | TEMPLATE_NAME
  | SERVICE_NAME
  | ENVIRONMENT_NAME
  | LAST_DEPLOYMENT_ATTEMPTED_AT
  | CREATED_AT

type list_service_instances_output = {
  service_instances: service_instance_summary list;
   (**{|
    An array of service instances with summary data.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next service instance in the
    array of service instances, after the current requested list of service
    instances.|}*)

}

type list_service_instances_filter_by = | NAME
  | DEPLOYMENT_STATUS
  | TEMPLATE_NAME
  | SERVICE_NAME
  | DEPLOYED_TEMPLATE_VERSION_STATUS
  | ENVIRONMENT_NAME
  | LAST_DEPLOYMENT_ATTEMPTED_AT_BEFORE
  | LAST_DEPLOYMENT_ATTEMPTED_AT_AFTER
  | CREATED_AT_BEFORE
  | CREATED_AT_AFTER

(**{|
    A filtering criterion to scope down the result list of the
    {{:  }ListServiceInstances} action.|}*)
type list_service_instances_filter = {
  value: string option;
   (**{|
    A value to filter by.
    
    With the date/time keys ([*At{Before,After}]), the value is a valid
    {{: https://datatracker.ietf.org/doc/html/rfc3339.html }RFC 3339} string
    with no UTC offset and with an optional fractional precision (for
    example, [1985-04-12T23:20:50.52Z]).|}*)

  key: list_service_instances_filter_by option;
   (**{|
    The name of a filtering criterion.|}*)

}

type list_service_instances_input = {
  sort_order: sort_order option;
   (**{|
    Result list sort order.
    
    Default: [ASCENDING]|}*)

  sort_by: list_service_instances_sort_by option;
   (**{|
    The field that the result list is sorted by.
    
    When you choose to sort by [serviceName], service instances within each
    service are sorted by service instance name.
    
    Default: [serviceName]|}*)

  filters: list_service_instances_filter list option;
   (**{|
    An array of filtering criteria that scope down the result list. By
    default, all service instances in the Amazon Web Services account are
    returned.|}*)

  max_results: int option;
   (**{|
    The maximum number of service instances to list.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next service in the array of
    service instances, after the list of service instances that was
    previously requested.|}*)

  service_name: string option;
   (**{|
    The name of the service that the service instance belongs to.|}*)

}

type list_service_instance_provisioned_resources_output = {
  provisioned_resources: provisioned_resource list;
   (**{|
    An array of provisioned resources for a service instance.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next provisioned resource in
    the array of provisioned resources, after the current requested list of
    provisioned resources.|}*)

}

type list_service_instance_provisioned_resources_input = {
  next_token: string option;
   (**{|
    A token that indicates the location of the next provisioned resource in
    the array of provisioned resources, after the list of provisioned
    resources that was previously requested.|}*)

  service_instance_name: string;
   (**{|
    The name of the service instance whose provisioned resources you want.|}*)

  service_name: string;
   (**{|
    The name of the service that [serviceInstanceName] is associated to.|}*)

}

type list_service_instance_outputs_output = {
  outputs: output list;
   (**{|
    An array of service instance Infrastructure as Code (IaC) outputs.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next output in the array of
    outputs, after the current requested list of outputs.|}*)

}

type list_service_instance_outputs_input = {
  deployment_id: string option;
   (**{|
    The ID of the deployment whose outputs you want.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next output in the array of
    outputs, after the list of outputs that was previously requested.|}*)

  service_name: string;
   (**{|
    The name of the service that [serviceInstanceName] is associated to.|}*)

  service_instance_name: string;
   (**{|
    The name of the service instance whose outputs you want.|}*)

}

type list_repository_sync_definitions_output = {
  sync_definitions: repository_sync_definition list;
   (**{|
    An array of repository sync definitions.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next repository sync
    definition in the array of repository sync definitions, after the current
    requested list of repository sync definitions.|}*)

}

type list_repository_sync_definitions_input = {
  next_token: string option;
   (**{|
    A token that indicates the location of the next repository sync
    definition in the array of repository sync definitions, after the list of
    repository sync definitions previously requested.|}*)

  sync_type: sync_type;
   (**{|
    The sync type. The only supported value is [TEMPLATE_SYNC].|}*)

  repository_provider: repository_provider;
   (**{|
    The repository provider.|}*)

  repository_name: string;
   (**{|
    The repository name.|}*)

}

type list_repositories_output = {
  repositories: repository_summary list;
   (**{|
    An array of repository links.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next repository in the array
    of repositories, after the current requested list of repositories.|}*)

}

type list_repositories_input = {
  max_results: int option;
   (**{|
    The maximum number of repositories to list.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next repository in the array
    of repositories, after the list of repositories previously requested.|}*)

}

(**{|
    Summary data of an Proton environment resource. An Proton environment is
    a set of resources shared across Proton services.|}*)
type environment_summary = {
  last_succeeded_deployment_id: string option;
   (**{|
    The ID of the last successful deployment of this environment.|}*)

  last_attempted_deployment_id: string option;
   (**{|
    The ID of the last attempted deployment of this environment.|}*)

  component_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that Proton uses
    when provisioning directly defined components in this environment. It
    determines the scope of infrastructure that a component can provision.
    
    The environment must have a [componentRoleArn] to allow directly defined
    components to be associated with the environment.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  provisioning: provisioning option;
   (**{|
    When included, indicates that the environment template is for customer
    provisioned and managed infrastructure.|}*)

  environment_account_id: string option;
   (**{|
    The ID of the environment account that the environment infrastructure
    resources are provisioned in.|}*)

  environment_account_connection_id: string option;
   (**{|
    The ID of the environment account connection that the environment is
    associated with.|}*)

  proton_service_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the Proton service role that allows
    Proton to make calls to other services on your behalf.|}*)

  deployment_status_message: string option;
   (**{|
    An environment deployment status message.|}*)

  deployment_status: deployment_status;
   (**{|
    The environment deployment status.|}*)

  template_minor_version: string;
   (**{|
    The minor version of the environment template.|}*)

  template_major_version: string;
   (**{|
    The major version of the environment template.|}*)

  template_name: string;
   (**{|
    The name of the environment template.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the environment.|}*)

  last_deployment_succeeded_at: float;
   (**{|
    The time when the environment was last deployed successfully.|}*)

  last_deployment_attempted_at: float;
   (**{|
    The time when a deployment of the environment was last attempted.|}*)

  created_at: float;
   (**{|
    The time when the environment was created.|}*)

  description: string option;
   (**{|
    The description of the environment.|}*)

  name: string;
   (**{|
    The name of the environment.|}*)

}

type list_environments_output = {
  environments: environment_summary list;
   (**{|
    An array of environment detail data summaries.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next environment in the array
    of environments, after the current requested list of environments.|}*)

}

(**{|
    A search filter for environment templates.|}*)
type environment_template_filter = {
  major_version: string;
   (**{|
    Include [majorVersion] to filter search for a major version.|}*)

  template_name: string;
   (**{|
    Include [templateName] to filter search for a template name.|}*)

}

type list_environments_input = {
  environment_templates: environment_template_filter list option;
   (**{|
    An array of the versions of the environment template.|}*)

  max_results: int option;
   (**{|
    The maximum number of environments to list.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next environment in the array
    of environments, after the list of environments that was previously
    requested.|}*)

}

(**{|
    The environment template data.|}*)
type environment_template_summary = {
  provisioning: provisioning option;
   (**{|
    When included, indicates that the environment template is for customer
    provisioned and managed infrastructure.|}*)

  recommended_version: string option;
   (**{|
    The recommended version of the environment template.|}*)

  description: string option;
   (**{|
    A description of the environment template.|}*)

  display_name: string option;
   (**{|
    The name of the environment template as displayed in the developer
    interface.|}*)

  last_modified_at: float;
   (**{|
    The time when the environment template was last modified.|}*)

  created_at: float;
   (**{|
    The time when the environment template was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the environment template.|}*)

  name: string;
   (**{|
    The name of the environment template.|}*)

}

type list_environment_templates_output = {
  templates: environment_template_summary list;
   (**{|
    An array of environment templates with detail data.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next environment template in
    the array of environment templates, after the current requested list of
    environment templates.|}*)

}

type list_environment_templates_input = {
  max_results: int option;
   (**{|
    The maximum number of environment templates to list.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next environment template in
    the array of environment templates, after the list of environment
    templates that was previously requested.|}*)

}

(**{|
    A summary of the version of an environment template detail data.|}*)
type environment_template_version_summary = {
  last_modified_at: float;
   (**{|
    The time when the version of an environment template was last modified.|}*)

  created_at: float;
   (**{|
    The time when the version of an environment template was created.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the version of an environment template.|}*)

  description: string option;
   (**{|
    A description of the version of an environment template.|}*)

  status_message: string option;
   (**{|
    The status message of the version of an environment template.|}*)

  status: template_version_status;
   (**{|
    The status of the version of an environment template.|}*)

  recommended_minor_version: string option;
   (**{|
    The recommended minor version of the environment template.|}*)

  minor_version: string;
   (**{|
    The version of an environment template.|}*)

  major_version: string;
   (**{|
    The latest major version that's associated with the version of an
    environment template.|}*)

  template_name: string;
   (**{|
    The name of the environment template.|}*)

}

type list_environment_template_versions_output = {
  template_versions: environment_template_version_summary list;
   (**{|
    An array of major or minor versions of an environment template detail
    data.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next major or minor version in
    the array of major or minor versions of an environment template, after
    the list of major or minor versions that was previously requested.|}*)

}

type list_environment_template_versions_input = {
  major_version: string option;
   (**{|
    To view a list of minor of versions under a major version of an
    environment template, include [major Version].
    
    To view a list of major versions of an environment template, {i exclude}
    [major Version].|}*)

  template_name: string;
   (**{|
    The name of the environment template.|}*)

  max_results: int option;
   (**{|
    The maximum number of major or minor versions of an environment template
    to list.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next major or minor version in
    the array of major or minor versions of an environment template, after
    the list of major or minor versions that was previously requested.|}*)

}

type list_environment_provisioned_resources_output = {
  provisioned_resources: provisioned_resource list;
   (**{|
    An array of environment provisioned resources.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next environment provisioned
    resource in the array of provisioned resources, after the current
    requested list of environment provisioned resources.|}*)

}

type list_environment_provisioned_resources_input = {
  next_token: string option;
   (**{|
    A token that indicates the location of the next environment provisioned
    resource in the array of environment provisioned resources, after the
    list of environment provisioned resources that was previously requested.|}*)

  environment_name: string;
   (**{|
    The environment name.|}*)

}

type list_environment_outputs_output = {
  outputs: output list;
   (**{|
    An array of environment outputs with detail data.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next environment output in the
    array of environment outputs, after the current requested list of
    environment outputs.|}*)

}

type list_environment_outputs_input = {
  deployment_id: string option;
   (**{|
    The ID of the deployment whose outputs you want.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next environment output in the
    array of environment outputs, after the list of environment outputs that
    was previously requested.|}*)

  environment_name: string;
   (**{|
    The environment name.|}*)

}

(**{|
    Summary data of an Proton environment account connection resource.|}*)
type environment_account_connection_summary = {
  component_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that Proton uses
    when provisioning directly defined components in the associated
    environment account. It determines the scope of infrastructure that a
    component can provision in the account.
    
    The environment account connection must have a [componentRoleArn] to
    allow directly defined components to be associated with any environments
    running in the account.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  status: environment_account_connection_status;
   (**{|
    The status of the environment account connection.|}*)

  last_modified_at: float;
   (**{|
    The time when the environment account connection was last modified.|}*)

  requested_at: float;
   (**{|
    The time when the environment account connection request was made.|}*)

  environment_name: string;
   (**{|
    The name of the environment that's associated with the environment
    account connection.|}*)

  role_arn: string;
   (**{|
    The IAM service role that's associated with the environment account
    connection.|}*)

  environment_account_id: string;
   (**{|
    The ID of the environment account that's connected to the environment
    account connection.|}*)

  management_account_id: string;
   (**{|
    The ID of the management account that's connected to the environment
    account connection.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the environment account connection.|}*)

  id: string;
   (**{|
    The ID of the environment account connection.|}*)

}

type list_environment_account_connections_output = {
  next_token: string option;
   (**{|
    A token that indicates the location of the next environment account
    connection in the array of environment account connections, after the
    current requested list of environment account connections.|}*)

  environment_account_connections: environment_account_connection_summary list;
   (**{|
    An array of environment account connections with details that's returned
    by Proton.|}*)

}

type environment_account_connection_requester_account_type = | MANAGEMENT_ACCOUNT
  | ENVIRONMENT_ACCOUNT

type list_environment_account_connections_input = {
  max_results: int option;
   (**{|
    The maximum number of environment account connections to list.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next environment account
    connection in the array of environment account connections, after the
    list of environment account connections that was previously requested.|}*)

  statuses: environment_account_connection_status list option;
   (**{|
    The status details for each listed environment account connection.|}*)

  environment_name: string option;
   (**{|
    The environment name that's associated with each listed environment
    account connection.|}*)

  requested_by: environment_account_connection_requester_account_type;
   (**{|
    The type of account making the [ListEnvironmentAccountConnections]
    request.|}*)

}

type deployment_target_resource_type = | ENVIRONMENT
  | SERVICE_PIPELINE
  | SERVICE_INSTANCE
  | COMPONENT

(**{|
    Summary data of the deployment.|}*)
type deployment_summary = {
  deployment_status: deployment_status;
   (**{|
    The current status of the deployment.|}*)

  last_succeeded_deployment_id: string option;
   (**{|
    The ID of the last successful deployment.|}*)

  last_attempted_deployment_id: string option;
   (**{|
    The ID of the last attempted deployment.|}*)

  component_name: string option;
   (**{|
    The name of the component associated with the deployment.|}*)

  service_instance_name: string option;
   (**{|
    The name of the service instance associated with the deployment.|}*)

  service_name: string option;
   (**{|
    The name of the service associated with the deployment.|}*)

  environment_name: string;
   (**{|
    The name of the environment associated with the deployment.|}*)

  completed_at: float option;
   (**{|
    The date and time the deployment was completed.|}*)

  last_modified_at: float;
   (**{|
    The date and time the deployment was last modified.|}*)

  created_at: float;
   (**{|
    The date and time the deployment was created.|}*)

  target_resource_type: deployment_target_resource_type;
   (**{|
    The resource type of the deployment target. It can be an environment,
    service, service instance, or component.|}*)

  target_resource_created_at: float;
   (**{|
    The date and time the target resource was created.|}*)

  target_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the target of the deployment.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the deployment.|}*)

  id: string;
   (**{|
    The ID of the deployment.|}*)

}

type list_deployments_output = {
  deployments: deployment_summary list;
   (**{|
    An array of deployment with summary data.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next deployment in the array
    of deployment, after the current requested list of deployment.|}*)

}

type list_deployments_input = {
  max_results: int option;
   (**{|
    The maximum number of deployments to list.|}*)

  component_name: string option;
   (**{|
    The name of a component for result list filtering. Proton returns
    deployments associated with that component.|}*)

  service_instance_name: string option;
   (**{|
    The name of a service instance for result list filtering. Proton returns
    the deployments associated with the service instance.|}*)

  service_name: string option;
   (**{|
    The name of a service for result list filtering. Proton returns
    deployments associated with service instances of the service.|}*)

  environment_name: string option;
   (**{|
    The name of an environment for result list filtering. Proton returns
    deployments associated with the environment.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next deployment in the array
    of deployment, after the list of deployment that was previously
    requested.|}*)

}

(**{|
    Summary data of an Proton component resource.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)
type component_summary = {
  last_succeeded_deployment_id: string option;
   (**{|
    The ID of the last successful deployment of this component.|}*)

  last_attempted_deployment_id: string option;
   (**{|
    The ID of the last attempted deployment of this component.|}*)

  deployment_status_message: string option;
   (**{|
    The message associated with the component deployment status.|}*)

  deployment_status: deployment_status;
   (**{|
    The component deployment status.|}*)

  last_deployment_succeeded_at: float option;
   (**{|
    The time when the component was last deployed successfully.|}*)

  last_deployment_attempted_at: float option;
   (**{|
    The time when a deployment of the component was last attempted.|}*)

  last_modified_at: float;
   (**{|
    The time when the component was last modified.|}*)

  created_at: float;
   (**{|
    The time when the component was created.|}*)

  service_instance_name: string option;
   (**{|
    The name of the service instance that this component is attached to.
    Provided when a component is attached to a service instance.|}*)

  service_name: string option;
   (**{|
    The name of the service that [serviceInstanceName] is associated with.
    Provided when a component is attached to a service instance.|}*)

  environment_name: string;
   (**{|
    The name of the Proton environment that this component is associated with.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the component.|}*)

  name: string;
   (**{|
    The name of the component.|}*)

}

type list_components_output = {
  components: component_summary list;
   (**{|
    An array of components with summary data.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next component in the array of
    components, after the current requested list of components.|}*)

}

type list_components_input = {
  max_results: int option;
   (**{|
    The maximum number of components to list.|}*)

  service_instance_name: string option;
   (**{|
    The name of a service instance for result list filtering. Proton returns
    the component attached to the service instance, if any.|}*)

  service_name: string option;
   (**{|
    The name of a service for result list filtering. Proton returns
    components attached to service instances of the service.|}*)

  environment_name: string option;
   (**{|
    The name of an environment for result list filtering. Proton returns
    components associated with the environment or attached to service
    instances running in it.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next component in the array of
    components, after the list of components that was previously requested.|}*)

}

type list_component_provisioned_resources_output = {
  provisioned_resources: provisioned_resource list;
   (**{|
    An array of provisioned resources for a component.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next provisioned resource in
    the array of provisioned resources, after the current requested list of
    provisioned resources.|}*)

}

type list_component_provisioned_resources_input = {
  next_token: string option;
   (**{|
    A token that indicates the location of the next provisioned resource in
    the array of provisioned resources, after the list of provisioned
    resources that was previously requested.|}*)

  component_name: string;
   (**{|
    The name of the component whose provisioned resources you want.|}*)

}

type list_component_outputs_output = {
  outputs: output list;
   (**{|
    An array of component Infrastructure as Code (IaC) outputs.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next output in the array of
    outputs, after the list of outputs that was previously requested.|}*)

}

type list_component_outputs_input = {
  deployment_id: string option;
   (**{|
    The ID of the deployment whose outputs you want.|}*)

  next_token: string option;
   (**{|
    A token that indicates the location of the next output in the array of
    outputs, after the list of outputs that was previously requested.|}*)

  component_name: string;
   (**{|
    The name of the component whose outputs you want.|}*)

}

type get_template_sync_status_output = {
  desired_state: revision option;
   (**{|
    The template sync desired state that's returned by Proton.|}*)

  latest_successful_sync: resource_sync_attempt option;
   (**{|
    The details of the last successful sync that's returned by Proton.|}*)

  latest_sync: resource_sync_attempt option;
   (**{|
    The details of the last sync that's returned by Proton.|}*)

}

type get_template_sync_status_input = {
  template_version: string;
   (**{|
    The template major version.|}*)

  template_type: template_type;
   (**{|
    The template type.|}*)

  template_name: string;
   (**{|
    The template name.|}*)

}

type get_template_sync_config_output = {
  template_sync_config: template_sync_config option;
   (**{|
    The template sync configuration detail data that's returned by Proton.|}*)

}

type get_template_sync_config_input = {
  template_type: template_type;
   (**{|
    The template type.|}*)

  template_name: string;
   (**{|
    The template name.|}*)

}

type get_service_template_version_output = {
  service_template_version: service_template_version;
   (**{|
    The detailed data of the requested service template version.|}*)

}

type get_service_template_version_input = {
  minor_version: string;
   (**{|
    To get service template minor version detail data, include [minorVersion].|}*)

  major_version: string;
   (**{|
    To get service template major version detail data, include [major
    Version].|}*)

  template_name: string;
   (**{|
    The name of the service template a version of which you want to get
    detailed data for.|}*)

}

type get_service_template_output = {
  service_template: service_template;
   (**{|
    The detailed data of the requested service template.|}*)

}

type get_service_template_input = {
  name: string;
   (**{|
    The name of the service template that you want to get detailed data for.|}*)

}

type get_service_sync_config_output = {
  service_sync_config: service_sync_config option;
   (**{|
    The detailed data of the requested service sync configuration.|}*)

}

type get_service_sync_config_input = {
  service_name: string;
   (**{|
    The name of the service that you want to get the service sync
    configuration for.|}*)

}

type get_service_sync_blocker_summary_output = {
  service_sync_blocker_summary: service_sync_blocker_summary option;
   (**{|
    The detailed data of the requested service sync blocker summary.|}*)

}

type get_service_sync_blocker_summary_input = {
  service_instance_name: string option;
   (**{|
    The name of the service instance that you want to get the service sync
    blocker summary for. If given bothe the instance name and the service
    name, only the instance is blocked.|}*)

  service_name: string;
   (**{|
    The name of the service that you want to get the service sync blocker
    summary for. If given only the service name, all instances are blocked.|}*)

}

type get_service_output = {
  service: service option;
   (**{|
    The detailed data of the requested service.|}*)

}

type get_service_instance_sync_status_output = {
  desired_state: revision option;
   (**{|
    The service instance sync desired state that's returned by Proton|}*)

  latest_successful_sync: resource_sync_attempt option;
   (**{|
    The detailed data of the latest successful sync with the service instance.|}*)

  latest_sync: resource_sync_attempt option;
   (**{|
    The detailed data of the latest sync with the service instance.|}*)

}

type get_service_instance_sync_status_input = {
  service_instance_name: string;
   (**{|
    The name of the service instance that you want the sync status input for.|}*)

  service_name: string;
   (**{|
    The name of the service that the service instance belongs to.|}*)

}

type get_service_instance_output = {
  service_instance: service_instance;
   (**{|
    The detailed data of the requested service instance.|}*)

}

type get_service_instance_input = {
  service_name: string;
   (**{|
    The name of the service that you want the service instance input for.|}*)

  name: string;
   (**{|
    The name of a service instance that you want to get the detailed data for.|}*)

}

type get_service_input = {
  name: string;
   (**{|
    The name of the service that you want to get the detailed data for.|}*)

}

(**{|
    Summary counts of each Proton resource type.|}*)
type counts_summary = {
  pipelines: resource_counts_summary option;
   (**{|
    The staleness counts for Proton pipelines in the Amazon Web Services
    account.|}*)

  service_templates: resource_counts_summary option;
   (**{|
    The total number of service templates in the Amazon Web Services account.
    The [serviceTemplates] object will only contain [total] members.|}*)

  services: resource_counts_summary option;
   (**{|
    The staleness counts for Proton services in the Amazon Web Services
    account.|}*)

  service_instances: resource_counts_summary option;
   (**{|
    The staleness counts for Proton service instances in the Amazon Web
    Services account.|}*)

  environment_templates: resource_counts_summary option;
   (**{|
    The total number of environment templates in the Amazon Web Services
    account. The [environmentTemplates] object will only contain [total]
    members.|}*)

  environments: resource_counts_summary option;
   (**{|
    The staleness counts for Proton environments in the Amazon Web Services
    account. The [environments] object will only contain [total] members.|}*)

  components: resource_counts_summary option;
   (**{|
    The total number of components in the Amazon Web Services account.
    
    The semantics of the [components] field are different from the semantics
    of results for other infrastructure-provisioning resources. That's
    because at this time components don't have associated templates,
    therefore they don't have the concept of staleness. The [components]
    object will only contain [total] and [failed] members.|}*)

}

type get_resources_summary_output = {
  counts: counts_summary;
   (**{|
    Summary counts of each Proton resource type.|}*)

}

type get_resources_summary_input = unit

type get_repository_sync_status_output = {
  latest_sync: repository_sync_attempt option;
   (**{|
    The repository sync status detail data that's returned by Proton.|}*)

}

type get_repository_sync_status_input = {
  sync_type: sync_type;
   (**{|
    The repository sync type.|}*)

  branch: string;
   (**{|
    The repository branch.|}*)

  repository_provider: repository_provider;
   (**{|
    The repository provider.|}*)

  repository_name: string;
   (**{|
    The repository name.|}*)

}

type get_repository_output = {
  repository: repository;
   (**{|
    The repository link's detail data that's returned by Proton.|}*)

}

type get_repository_input = {
  name: string;
   (**{|
    The repository name, for example [myrepos/myrepo].|}*)

  provider: repository_provider;
   (**{|
    The repository provider.|}*)

}

type get_environment_template_version_output = {
  environment_template_version: environment_template_version;
   (**{|
    The detailed data of the requested environment template version.|}*)

}

type get_environment_template_version_input = {
  minor_version: string;
   (**{|
    To get environment template minor version detail data, include
    [minorVersion].|}*)

  major_version: string;
   (**{|
    To get environment template major version detail data, include [major
    Version].|}*)

  template_name: string;
   (**{|
    The name of the environment template a version of which you want to get
    detailed data for.|}*)

}

type get_environment_template_output = {
  environment_template: environment_template;
   (**{|
    The detailed data of the requested environment template.|}*)

}

type get_environment_template_input = {
  name: string;
   (**{|
    The name of the environment template that you want to get the detailed
    data for.|}*)

}

type get_environment_output = {
  environment: environment;
   (**{|
    The detailed data of the requested environment.|}*)

}

type get_environment_input = {
  name: string;
   (**{|
    The name of the environment that you want to get the detailed data for.|}*)

}

type get_environment_account_connection_output = {
  environment_account_connection: environment_account_connection;
   (**{|
    The detailed data of the requested environment account connection.|}*)

}

type get_environment_account_connection_input = {
  id: string;
   (**{|
    The ID of the environment account connection that you want to get the
    detailed data for.|}*)

}

(**{|
    The detailed data about the current state of the environment.|}*)
type environment_state = {
  template_minor_version: string;
   (**{|
    The minor version of the environment template that was used to create the
    environment.|}*)

  template_major_version: string;
   (**{|
    The major version of the environment template that was used to create the
    environment.|}*)

  template_name: string;
   (**{|
    The name of the environment template that was used to create the
    environment.|}*)

  spec: string option;
   (**{|
    The environment spec that was used to create the environment.|}*)

}

(**{|
    The detailed data about the current state of the component.|}*)
type component_state = {
  template_file: string option;
   (**{|
    The template file used.|}*)

  service_spec: string option;
   (**{|
    The service spec that the component uses to access service inputs.
    Provided when a component is attached to a service instance.|}*)

  service_instance_name: string option;
   (**{|
    The name of the service instance that this component is attached to.
    Provided when a component is attached to a service instance.|}*)

  service_name: string option;
   (**{|
    The name of the service that [serviceInstanceName] is associated with.
    Provided when a component is attached to a service instance.|}*)

}

(**{|
    The detailed data about the current state of the deployment.|}*)
type deployment_state = Component of component_state | ServicePipeline of service_pipeline_state | Environment of environment_state | ServiceInstance of service_instance_state

(**{|
    The detailed information about a deployment.|}*)
type deployment = {
  target_state: deployment_state option;
   (**{|
    The target state of the target resource at the time of the deployment.|}*)

  initial_state: deployment_state option;
   (**{|
    The initial state of the target resource at the time of the deployment.|}*)

  last_succeeded_deployment_id: string option;
   (**{|
    The ID of the last successful deployment.|}*)

  last_attempted_deployment_id: string option;
   (**{|
    The ID of the last attempted deployment.|}*)

  completed_at: float option;
   (**{|
    The date and time the deployment was completed.|}*)

  last_modified_at: float;
   (**{|
    The date and time the deployment was last modified.|}*)

  created_at: float;
   (**{|
    The date and time the deployment was created.|}*)

  deployment_status_message: string option;
   (**{|
    The deployment status message.|}*)

  deployment_status: deployment_status;
   (**{|
    The status of the deployment.|}*)

  component_name: string option;
   (**{|
    The name of the component associated with this deployment.|}*)

  service_instance_name: string option;
   (**{|
    The name of the deployment's service instance.|}*)

  service_name: string option;
   (**{|
    The name of the service in this deployment.|}*)

  environment_name: string;
   (**{|
    The name of the environment associated with this deployment.|}*)

  target_resource_type: deployment_target_resource_type;
   (**{|
    The resource type of the deployment target. It can be an environment,
    service, service instance, or component.|}*)

  target_resource_created_at: float;
   (**{|
    The date and time the depoyment target was created.|}*)

  target_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the target of the deployment.|}*)

  arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the deployment.|}*)

  id: string;
   (**{|
    The ID of the deployment.|}*)

}

type get_deployment_output = {
  deployment: deployment option;
   (**{|
    The detailed data of the requested deployment.|}*)

}

type get_deployment_input = {
  component_name: string option;
   (**{|
    The name of a component that you want to get the detailed data for.|}*)

  service_instance_name: string option;
   (**{|
    The name of the service instance associated with the given deployment ID.
    [serviceName] must be specified to identify the service instance.|}*)

  service_name: string option;
   (**{|
    The name of the service associated with the given deployment ID.|}*)

  environment_name: string option;
   (**{|
    The name of a environment that you want to get the detailed data for.|}*)

  id: string;
   (**{|
    The ID of the deployment that you want to get the detailed data for.|}*)

}

type get_component_output = {
  component: component option;
   (**{|
    The detailed data of the requested component.|}*)

}

type get_component_input = {
  name: string;
   (**{|
    The name of the component that you want to get the detailed data for.|}*)

}

type get_account_settings_output = {
  account_settings: account_settings option;
   (**{|
    The Proton pipeline service role detail data that's returned by Proton.|}*)

}

type get_account_settings_input = unit

type delete_template_sync_config_output = {
  template_sync_config: template_sync_config option;
   (**{|
    The template sync configuration detail data that's returned by Proton.|}*)

}

type delete_template_sync_config_input = {
  template_type: template_type;
   (**{|
    The template type.|}*)

  template_name: string;
   (**{|
    The template name.|}*)

}

type delete_service_template_version_output = {
  service_template_version: service_template_version option;
   (**{|
    The detailed data of the service template version being deleted.|}*)

}

type delete_service_template_version_input = {
  minor_version: string;
   (**{|
    The service template minor version to delete.|}*)

  major_version: string;
   (**{|
    The service template major version to delete.|}*)

  template_name: string;
   (**{|
    The name of the service template.|}*)

}

type delete_service_template_output = {
  service_template: service_template option;
   (**{|
    The detailed data of the service template being deleted.|}*)

}

type delete_service_template_input = {
  name: string;
   (**{|
    The name of the service template to delete.|}*)

}

type delete_service_sync_config_output = {
  service_sync_config: service_sync_config option;
   (**{|
    The detailed data for the service sync config.|}*)

}

type delete_service_sync_config_input = {
  service_name: string;
   (**{|
    The name of the service that you want to delete the service sync
    configuration for.|}*)

}

type delete_service_output = {
  service: service option;
   (**{|
    The detailed data of the service being deleted.|}*)

}

type delete_service_input = {
  name: string;
   (**{|
    The name of the service to delete.|}*)

}

type delete_repository_output = {
  repository: repository option;
   (**{|
    The deleted repository link's detail data that's returned by Proton.|}*)

}

type delete_repository_input = {
  name: string;
   (**{|
    The repository name.|}*)

  provider: repository_provider;
   (**{|
    The repository provider.|}*)

}

type delete_environment_template_version_output = {
  environment_template_version: environment_template_version option;
   (**{|
    The detailed data of the environment template version being deleted.|}*)

}

type delete_environment_template_version_input = {
  minor_version: string;
   (**{|
    The environment template minor version to delete.|}*)

  major_version: string;
   (**{|
    The environment template major version to delete.|}*)

  template_name: string;
   (**{|
    The name of the environment template.|}*)

}

type delete_environment_template_output = {
  environment_template: environment_template option;
   (**{|
    The detailed data of the environment template being deleted.|}*)

}

type delete_environment_template_input = {
  name: string;
   (**{|
    The name of the environment template to delete.|}*)

}

type delete_environment_output = {
  environment: environment option;
   (**{|
    The detailed data of the environment being deleted.|}*)

}

type delete_environment_input = {
  name: string;
   (**{|
    The name of the environment to delete.|}*)

}

type delete_environment_account_connection_output = {
  environment_account_connection: environment_account_connection option;
   (**{|
    The detailed data of the environment account connection being deleted.|}*)

}

type delete_environment_account_connection_input = {
  id: string;
   (**{|
    The ID of the environment account connection to delete.|}*)

}

type delete_deployment_output = {
  deployment: deployment option;
   (**{|
    The detailed data of the deployment being deleted.|}*)

}

type delete_deployment_input = {
  id: string;
   (**{|
    The ID of the deployment to delete.|}*)

}

type delete_component_output = {
  component: component option;
   (**{|
    The detailed data of the component being deleted.|}*)

}

type delete_component_input = {
  name: string;
   (**{|
    The name of the component to delete.|}*)

}

type create_template_sync_config_output = {
  template_sync_config: template_sync_config option;
   (**{|
    The template sync configuration detail data that's returned by Proton.|}*)

}

type create_template_sync_config_input = {
  subdirectory: string option;
   (**{|
    A repository subdirectory path to your template bundle directory. When
    included, Proton limits the template bundle search to this repository
    directory.|}*)

  branch: string;
   (**{|
    The repository branch for your template.|}*)

  repository_name: string;
   (**{|
    The repository name (for example, [myrepos/myrepo]).|}*)

  repository_provider: repository_provider;
   (**{|
    The provider type for your repository.|}*)

  template_type: template_type;
   (**{|
    The type of the registered template.|}*)

  template_name: string;
   (**{|
    The name of your registered template.|}*)

}

type create_service_template_version_output = {
  service_template_version: service_template_version;
   (**{|
    The service template version summary of detail data that's returned by
    Proton.|}*)

}

type create_service_template_version_input = {
  supported_component_sources: service_template_supported_component_source_type list option;
   (**{|
    An array of supported component sources. Components with supported
    sources can be attached to service instances based on this service
    template version.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the Proton
    service template version. A tag is a key-value pair.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/resources.html }Proton
    resources and tagging} in the {i Proton User Guide}.|}*)

  compatible_environment_templates: compatible_environment_template_input list;
   (**{|
    An array of environment template objects that are compatible with the new
    service template version. A service instance based on this service
    template version can run in environments based on compatible templates.|}*)

  source: template_version_source_input;
   (**{|
    An object that includes the template bundle S3 bucket path and name for
    the new version of a service template.|}*)

  major_version: string option;
   (**{|
    To create a new minor version of the service template, include a [major
    Version].
    
    To create a new major and minor version of the service template,
    {i exclude} [major Version].|}*)

  description: string option;
   (**{|
    A description of the new version of a service template.|}*)

  template_name: string;
   (**{|
    The name of the service template.|}*)

  client_token: string option;
   (**{|
    When included, if two identical requests are made with the same client
    token, Proton returns the service template version that the first request
    created.|}*)

}

type create_service_template_output = {
  service_template: service_template;
   (**{|
    The service template detail data that's returned by Proton.|}*)

}

type create_service_template_input = {
  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the Proton
    service template. A tag is a key-value pair.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/resources.html }Proton
    resources and tagging} in the {i Proton User Guide}.|}*)

  pipeline_provisioning: provisioning option;
   (**{|
    By default, Proton provides a service pipeline for your service. When
    this parameter is included, it indicates that an Proton service pipeline
    {i isn't} provided for your service. After it's included, it {i can't} be
    changed. For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-template-authoring.html#ag-template-bundles }Template
    bundles} in the {i Proton User Guide}.|}*)

  encryption_key: string option;
   (**{|
    A customer provided encryption key that's used to encrypt data.|}*)

  description: string option;
   (**{|
    A description of the service template.|}*)

  display_name: string option;
   (**{|
    The name of the service template as displayed in the developer interface.|}*)

  name: string;
   (**{|
    The name of the service template.|}*)

}

type create_service_sync_config_output = {
  service_sync_config: service_sync_config option;
   (**{|
    The detailed data of the Proton Ops file.|}*)

}

type create_service_sync_config_input = {
  file_path: string;
   (**{|
    The path to the Proton Ops file.|}*)

  branch: string;
   (**{|
    The repository branch for your Proton Ops file.|}*)

  repository_name: string;
   (**{|
    The repository name.|}*)

  repository_provider: repository_provider;
   (**{|
    The provider type for your repository.|}*)

  service_name: string;
   (**{|
    The name of the service the Proton Ops file is for.|}*)

}

type create_service_output = {
  service: service;
   (**{|
    The service detail data that's returned by Proton.|}*)

}

type create_service_instance_output = {
  service_instance: service_instance;
   (**{|
    The detailed data of the service instance being created.|}*)

}

type create_service_instance_input = {
  client_token: string option;
   (**{|
    The client token of the service instance to create.|}*)

  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the Proton
    service instance. A tag is a key-value pair.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/resources.html }Proton
    resources and tagging} in the {i Proton User Guide}.|}*)

  template_minor_version: string option;
   (**{|
    To create a new minor version of the service template, include a [major
    Version].|}*)

  template_major_version: string option;
   (**{|
    To create a new major and minor version of the service template,
    {i exclude} [major Version].|}*)

  spec: string;
   (**{|
    The spec for the service instance you want to create.|}*)

  service_name: string;
   (**{|
    The name of the service the service instance is added to.|}*)

  name: string;
   (**{|
    The name of the service instance to create.|}*)

}

type create_service_input = {
  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the Proton
    service. A tag is a key-value pair.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/resources.html }Proton
    resources and tagging} in the {i Proton User Guide}.|}*)

  branch_name: string option;
   (**{|
    The name of the code repository branch that holds the code that's
    deployed in Proton. {i Don't} include this parameter if your service
    template {i doesn't} include a service pipeline.|}*)

  repository_id: string option;
   (**{|
    The ID of the code repository. {i Don't} include this parameter if your
    service template {i doesn't} include a service pipeline.|}*)

  repository_connection_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the repository connection. For more
    information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/setting-up-for-service.html#setting-up-vcontrol }Setting
    up an AWS CodeStar connection} in the {i Proton User Guide}. {i Don't}
    include this parameter if your service template {i doesn't} include a
    service pipeline.|}*)

  spec: string;
   (**{|
    A link to a spec file that provides inputs as defined in the service
    template bundle schema file. The spec file is in YAML format. {i Don’t}
    include pipeline inputs in the spec if your service template
    {i doesn’t} include a service pipeline. For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-create-svc.html }Create
    a service} in the {i Proton User Guide}.|}*)

  template_minor_version: string option;
   (**{|
    The minor version of the service template that was used to create the
    service.|}*)

  template_major_version: string;
   (**{|
    The major version of the service template that was used to create the
    service.|}*)

  template_name: string;
   (**{|
    The name of the service template that's used to create the service.|}*)

  description: string option;
   (**{|
    A description of the Proton service.|}*)

  name: string;
   (**{|
    The service name.|}*)

}

type create_repository_output = {
  repository: repository;
   (**{|
    The repository link's detail data that's returned by Proton.|}*)

}

type create_repository_input = {
  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the Proton
    repository. A tag is a key-value pair.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/resources.html }Proton
    resources and tagging} in the {i Proton User Guide}.|}*)

  encryption_key: string option;
   (**{|
    The ARN of your customer Amazon Web Services Key Management Service
    (Amazon Web Services KMS) key.|}*)

  connection_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of your AWS CodeStar connection that
    connects Proton to your repository provider account. For more
    information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/setting-up-for-service.html }Setting
    up for Proton} in the {i Proton User Guide}.|}*)

  name: string;
   (**{|
    The repository name (for example, [myrepos/myrepo]).|}*)

  provider: repository_provider;
   (**{|
    The repository provider.|}*)

}

type create_environment_template_version_output = {
  environment_template_version: environment_template_version;
   (**{|
    The environment template detail data that's returned by Proton.|}*)

}

type create_environment_template_version_input = {
  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the Proton
    environment template version. A tag is a key-value pair.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/resources.html }Proton
    resources and tagging} in the {i Proton User Guide}.|}*)

  source: template_version_source_input;
   (**{|
    An object that includes the template bundle S3 bucket path and name for
    the new version of an template.|}*)

  major_version: string option;
   (**{|
    To create a new minor version of the environment template, include [major
    Version].
    
    To create a new major and minor version of the environment template,
    exclude [major Version].|}*)

  description: string option;
   (**{|
    A description of the new version of an environment template.|}*)

  template_name: string;
   (**{|
    The name of the environment template.|}*)

  client_token: string option;
   (**{|
    When included, if two identical requests are made with the same client
    token, Proton returns the environment template version that the first
    request created.|}*)

}

type create_environment_template_output = {
  environment_template: environment_template;
   (**{|
    The environment template detail data that's returned by Proton.|}*)

}

type create_environment_template_input = {
  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the Proton
    environment template. A tag is a key-value pair.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/resources.html }Proton
    resources and tagging} in the {i Proton User Guide}.|}*)

  provisioning: provisioning option;
   (**{|
    When included, indicates that the environment template is for customer
    provisioned and managed infrastructure.|}*)

  encryption_key: string option;
   (**{|
    A customer provided encryption key that Proton uses to encrypt data.|}*)

  description: string option;
   (**{|
    A description of the environment template.|}*)

  display_name: string option;
   (**{|
    The environment template name as displayed in the developer interface.|}*)

  name: string;
   (**{|
    The name of the environment template.|}*)

}

type create_environment_output = {
  environment: environment;
   (**{|
    The environment detail data that's returned by Proton.|}*)

}

type create_environment_input = {
  codebuild_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that allows Proton
    to provision infrastructure using CodeBuild-based provisioning on your
    behalf.
    
    To use CodeBuild-based provisioning for the environment or for any
    service instance running in the environment, specify either the
    [environmentAccountConnectionId] or [codebuildRoleArn] parameter.|}*)

  component_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that Proton uses
    when provisioning directly defined components in this environment. It
    determines the scope of infrastructure that a component can provision.
    
    You must specify [componentRoleArn] to allow directly defined components
    to be associated with this environment.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  provisioning_repository: repository_branch_input option;
   (**{|
    The linked repository that you use to host your rendered infrastructure
    templates for self-managed provisioning. A linked repository is a
    repository that has been registered with Proton. For more information,
    see {{:  }CreateRepository}.
    
    To use self-managed provisioning for the environment, specify this
    parameter and omit the [environmentAccountConnectionId] and
    [protonServiceRoleArn] parameters.|}*)

  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the Proton
    environment. A tag is a key-value pair.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/resources.html }Proton
    resources and tagging} in the {i Proton User Guide}.|}*)

  environment_account_connection_id: string option;
   (**{|
    The ID of the environment account connection that you provide if you're
    provisioning your environment infrastructure resources to an environment
    account. For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html }Environment
    account connections} in the {i Proton User guide}.
    
    To use Amazon Web Services-managed provisioning for the environment,
    specify either the [environmentAccountConnectionId] or
    [protonServiceRoleArn] parameter and omit the [provisioningRepository]
    parameter.|}*)

  proton_service_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the Proton service role that allows
    Proton to make calls to other services on your behalf.
    
    To use Amazon Web Services-managed provisioning for the environment,
    specify either the [environmentAccountConnectionId] or
    [protonServiceRoleArn] parameter and omit the [provisioningRepository]
    parameter.|}*)

  spec: string;
   (**{|
    A YAML formatted string that provides inputs as defined in the
    environment template bundle schema file. For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-environments.html }Environments}
    in the {i Proton User Guide}.|}*)

  description: string option;
   (**{|
    A description of the environment that's being created and deployed.|}*)

  template_minor_version: string option;
   (**{|
    The minor version of the environment template.|}*)

  template_major_version: string;
   (**{|
    The major version of the environment template.|}*)

  template_name: string;
   (**{|
    The name of the environment template. For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-templates.html }Environment
    Templates} in the {i Proton User Guide}.|}*)

  name: string;
   (**{|
    The name of the environment.|}*)

}

type create_environment_account_connection_output = {
  environment_account_connection: environment_account_connection;
   (**{|
    The environment account connection detail data that's returned by Proton.|}*)

}

type create_environment_account_connection_input = {
  codebuild_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM service role in the environment
    account. Proton uses this role to provision infrastructure resources
    using CodeBuild-based provisioning in the associated environment account.|}*)

  component_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that Proton uses
    when provisioning directly defined components in the associated
    environment account. It determines the scope of infrastructure that a
    component can provision in the account.
    
    You must specify [componentRoleArn] to allow directly defined components
    to be associated with any environments running in this account.
    
    For more information about components, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html }Proton
    components} in the {i Proton User Guide}.|}*)

  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the Proton
    environment account connection. A tag is a key-value pair.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/resources.html }Proton
    resources and tagging} in the {i Proton User Guide}.|}*)

  environment_name: string;
   (**{|
    The name of the Proton environment that's created in the associated
    management account.|}*)

  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM service role that's created in
    the environment account. Proton uses this role to provision
    infrastructure resources in the associated environment account.|}*)

  management_account_id: string;
   (**{|
    The ID of the management account that accepts or rejects the environment
    account connection. You create and manage the Proton environment in this
    account. If the management account accepts the environment account
    connection, Proton can use the associated IAM role to provision
    environment infrastructure resources in the associated environment
    account.|}*)

  client_token: string option;
   (**{|
    When included, if two identical requests are made with the same client
    token, Proton returns the environment account connection that the first
    request created.|}*)

}

type create_component_output = {
  component: component;
   (**{|
    The detailed data of the created component.|}*)

}

type create_component_input = {
  client_token: string option;
   (**{|
    The client token for the created component.|}*)

  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the Proton
    component. A tag is a key-value pair.
    
    For more information, see
    {{: https://docs.aws.amazon.com/proton/latest/userguide/resources.html }Proton
    resources and tagging} in the {i Proton User Guide}.|}*)

  service_spec: string option;
   (**{|
    The service spec that you want the component to use to access service
    inputs. Set this only when you attach the component to a service
    instance.|}*)

  manifest: string;
   (**{|
    A path to a manifest file that lists the Infrastructure as Code (IaC)
    file, template language, and rendering engine for infrastructure that a
    custom component provisions.|}*)

  template_file: string;
   (**{|
    A path to the Infrastructure as Code (IaC) file describing infrastructure
    that a custom component provisions.
    
    Components support a single IaC file, even if you use Terraform as your
    template language.
    |}*)

  environment_name: string option;
   (**{|
    The name of the Proton environment that you want to associate this
    component with. You must specify this when you don't specify
    [serviceInstanceName] and [serviceName].|}*)

  service_instance_name: string option;
   (**{|
    The name of the service instance that you want to attach this component
    to. If you don't specify this, the component isn't attached to any
    service instance. Specify both [serviceInstanceName] and [serviceName] or
    neither of them.|}*)

  service_name: string option;
   (**{|
    The name of the service that [serviceInstanceName] is associated with. If
    you don't specify this, the component isn't attached to any service
    instance. Specify both [serviceInstanceName] and [serviceName] or neither
    of them.|}*)

  description: string option;
   (**{|
    An optional customer-provided description of the component.|}*)

  name: string;
   (**{|
    The customer-provided name of the component.|}*)

}

type cancel_service_pipeline_deployment_output = {
  pipeline: service_pipeline;
   (**{|
    The service pipeline detail data that's returned by Proton.|}*)

}

type cancel_service_pipeline_deployment_input = {
  service_name: string;
   (**{|
    The name of the service with the service pipeline deployment to cancel.|}*)

}

type cancel_service_instance_deployment_output = {
  service_instance: service_instance;
   (**{|
    The service instance summary data that's returned by Proton.|}*)

}

type cancel_service_instance_deployment_input = {
  service_name: string;
   (**{|
    The name of the service with the service instance deployment to cancel.|}*)

  service_instance_name: string;
   (**{|
    The name of the service instance with the deployment to cancel.|}*)

}

type cancel_environment_deployment_output = {
  environment: environment;
   (**{|
    The environment summary data that's returned by Proton.|}*)

}

type cancel_environment_deployment_input = {
  environment_name: string;
   (**{|
    The name of the environment with the deployment to cancel.|}*)

}

type cancel_component_deployment_output = {
  component: component;
   (**{|
    The detailed data of the component with the deployment that is being
    canceled.|}*)

}

type cancel_component_deployment_input = {
  component_name: string;
   (**{|
    The name of the component with the deployment to cancel.|}*)

}

(**{|
    This is the Proton Service API Reference. It provides descriptions,
    syntax and usage examples for each of the
    {{: https://docs.aws.amazon.com/proton/latest/APIReference/API_Operations.html }actions}
    and
    {{: https://docs.aws.amazon.com/proton/latest/APIReference/API_Types.html }data
    types} for the Proton service.
    
    The documentation for each action shows the Query API request parameters
    and the XML response.
    
    Alternatively, you can use the Amazon Web Services CLI to access an API.
    For more information, see the
    {{: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html }Amazon
    Web Services Command Line Interface User Guide}.
    
    The Proton service is a two-pronged automation framework. Administrators
    create service templates to provide standardized infrastructure and
    deployment tooling for serverless and container based applications.
    Developers, in turn, select from the available service templates to
    automate their application or service deployments.
    
    Because administrators define the infrastructure and tooling that Proton
    deploys and manages, they need permissions to use all of the listed API
    operations.
    
    When developers select a specific infrastructure and tooling set, Proton
    deploys their applications. To monitor their applications that are
    running on Proton, developers need permissions to the service {i create},
    {i list}, {i update} and {i delete} API operations and the service
    instance {i list} and {i update} API operations.
    
    To learn more about Proton, see the
    {{: https://docs.aws.amazon.com/proton/latest/userguide/Welcome.html }Proton
    User Guide}.
    
    {b Ensuring Idempotency}
    
    When you make a mutating API request, the request typically returns a
    result before the asynchronous workflows of the operation are complete.
    Operations might also time out or encounter other server issues before
    they're complete, even if the request already returned a result. This
    might make it difficult to determine whether the request succeeded.
    Moreover, you might need to retry the request multiple times to ensure
    that the operation completes successfully. However, if the original
    request and the subsequent retries are successful, the operation occurs
    multiple times. This means that you might create more resources than you
    intended.
    
    {i Idempotency} ensures that an API request action completes no more than
    one time. With an idempotent request, if the original request action
    completes successfully, any subsequent retries complete successfully
    without performing any further actions. However, the result might contain
    updated information, such as the current creation status.
    
    The following lists of APIs are grouped according to methods that ensure
    idempotency.
    
    {b Idempotent create APIs with a client token}
    
    The API actions in this list support idempotency with the use of a
    {i client token}. The corresponding Amazon Web Services CLI commands also
    support idempotency using a client token. A client token is a unique,
    case-sensitive string of up to 64 ASCII characters. To make an idempotent
    API request using one of these actions, specify a client token in the
    request. We recommend that you {i don't} reuse the same client token for
    other API requests. If you don’t provide a client token for these APIs,
    a default client token is automatically provided by SDKs.
    
    Given a request action that has succeeded:
    
    If you retry the request using the same client token and the same
    parameters, the retry succeeds without performing any further actions
    other than returning the original resource detail data in the response.
    
    If you retry the request using the same client token, but one or more of
    the parameters are different, the retry throws a [ValidationException]
    with an [IdempotentParameterMismatch] error.
    
    Client tokens expire eight hours after a request is made. If you retry
    the request with the expired token, a new resource is created.
    
    If the original resource is deleted and you retry the request, a new
    resource is created.
    
    Idempotent create APIs with a client token:
    
    {ol 
          {- CreateEnvironmentTemplateVersion
             }
          
          {- CreateServiceTemplateVersion
             }
          
          {- CreateEnvironmentAccountConnection
             }
          
    }
    
    {b Idempotent create APIs}
    
    Given a request action that has succeeded:
    
    If you retry the request with an API from this group, and the original
    resource {i hasn't} been modified, the retry succeeds without performing
    any further actions other than returning the original resource detail
    data in the response.
    
    If the original resource has been modified, the retry throws a
    [ConflictException].
    
    If you retry with different input parameters, the retry throws a
    [ValidationException] with an [IdempotentParameterMismatch] error.
    
    Idempotent create APIs:
    
    {ol 
          {- CreateEnvironmentTemplate
             }
          
          {- CreateServiceTemplate
             }
          
          {- CreateEnvironment
             }
          
          {- CreateService
             }
          
    }
    
    {b Idempotent delete APIs}
    
    Given a request action that has succeeded:
    
    When you retry the request with an API from this group and the resource
    was deleted, its metadata is returned in the response.
    
    If you retry and the resource doesn't exist, the response is empty.
    
    In both cases, the retry succeeds.
    
    Idempotent delete APIs:
    
    {ol 
          {- DeleteEnvironmentTemplate
             }
          
          {- DeleteEnvironmentTemplateVersion
             }
          
          {- DeleteServiceTemplate
             }
          
          {- DeleteServiceTemplateVersion
             }
          
          {- DeleteEnvironmentAccountConnection
             }
          
    }
    
    {b Asynchronous idempotent delete APIs}
    
    Given a request action that has succeeded:
    
    If you retry the request with an API from this group, if the original
    request delete operation status is [DELETE_IN_PROGRESS], the retry
    returns the resource detail data in the response without performing any
    further actions.
    
    If the original request delete operation is complete, a retry returns an
    empty response.
    
    Asynchronous idempotent delete APIs:
    
    {ol 
          {- DeleteEnvironment
             }
          
          {- DeleteService
             }
          
    }
    |}*)


type accept_environment_account_connection_output = {
  environment_account_connection: environment_account_connection;
   (**{|
    The environment account connection data that's returned by Proton.|}*)

}

type accept_environment_account_connection_input = {
  id: string;
   (**{|
    The ID of the environment account connection.|}*)

}

type base_document = Json.t

