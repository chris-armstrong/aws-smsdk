open Types 
module AcceptEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      accept_environment_account_connection_input ->
        (accept_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    In a management account, an environment account connection request is accepted. When the environment account connection request is accepted, Proton can use the associated IAM role to provision environment infrastructure resources in the associated environment account.
    
     For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment account connections} in the {i Proton User guide}.
      *)

  
end

module CancelComponentDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_component_deployment_input ->
        (cancel_component_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Attempts to cancel a component deployment (for a component that is in the [IN_PROGRESS] deployment status).
    
     For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
      *)

  
end

module CancelEnvironmentDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_environment_deployment_input ->
        (cancel_environment_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Attempts to cancel an environment deployment on an [UpdateEnvironment] action, if the deployment is [IN_PROGRESS]. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-update.html}Update an environment} in the {i Proton User guide}.
    
     The following list includes potential cancellation scenarios.
     
      {ul
           {- If the cancellation attempt succeeds, the resulting deployment state is [CANCELLED].
              
              }
            {- If the cancellation attempt fails, the resulting deployment state is [FAILED].
               
               }
            {- If the current [UpdateEnvironment] action succeeds before the cancellation attempt starts, the resulting deployment state is [SUCCEEDED] and the cancellation attempt has no effect.
               
               }
           
      }
       *)

  
end

module CancelServiceInstanceDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_service_instance_deployment_input ->
        (cancel_service_instance_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Attempts to cancel a service instance deployment on an [UpdateServiceInstance] action, if the deployment is [IN_PROGRESS]. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-svc-instance-update.html}Update a service instance} in the {i Proton User guide}.
    
     The following list includes potential cancellation scenarios.
     
      {ul
           {- If the cancellation attempt succeeds, the resulting deployment state is [CANCELLED].
              
              }
            {- If the cancellation attempt fails, the resulting deployment state is [FAILED].
               
               }
            {- If the current [UpdateServiceInstance] action succeeds before the cancellation attempt starts, the resulting deployment state is [SUCCEEDED] and the cancellation attempt has no effect.
               
               }
           
      }
       *)

  
end

module CancelServicePipelineDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_service_pipeline_deployment_input ->
        (cancel_service_pipeline_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Attempts to cancel a service pipeline deployment on an [UpdateServicePipeline] action, if the deployment is [IN_PROGRESS]. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-svc-pipeline-update.html}Update a service pipeline} in the {i Proton User guide}.
    
     The following list includes potential cancellation scenarios.
     
      {ul
           {- If the cancellation attempt succeeds, the resulting deployment state is [CANCELLED].
              
              }
            {- If the cancellation attempt fails, the resulting deployment state is [FAILED].
               
               }
            {- If the current [UpdateServicePipeline] action succeeds before the cancellation attempt starts, the resulting deployment state is [SUCCEEDED] and the cancellation attempt has no effect.
               
               }
           
      }
       *)

  
end

module CreateComponent : sig
  val request :
    Smaws_Lib.Context.t ->
      create_component_input ->
        (create_component_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Create an Proton component. A component is an infrastructure extension for a service instance.
    
     For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
      *)

  
end

module CreateEnvironment : sig
  val request :
    Smaws_Lib.Context.t ->
      create_environment_input ->
        (create_environment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Deploy a new environment. An Proton environment is created from an environment template that defines infrastructure and resources that can be shared across services.
    
     {b You can provision environments using the following methods:}
     
      {ul
           {- Amazon Web Services-managed provisioning: Proton makes direct calls to provision your resources.
              
              }
            {- Self-managed provisioning: Proton makes pull requests on your repository to provide compiled infrastructure as code (IaC) files that your IaC engine uses to provision resources.
               
               }
           
      }
       For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-environments.html}Environments} and {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html}Provisioning methods} in the {i Proton User Guide}.
        *)

  
end

module CreateEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_environment_account_connection_input ->
        (create_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Create an environment account connection in an environment account so that environment infrastructure resources can be provisioned in the environment account from a management account.
    
     An environment account connection is a secure bi-directional connection between a {i management account} and an {i environment account} that maintains authorization and permissions. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment account connections} in the {i Proton User guide}.
      *)

  
end

module CreateEnvironmentTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      create_environment_template_input ->
        (create_environment_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Create an environment template for Proton. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-templates.html}Environment Templates} in the {i Proton User Guide}.
    
     You can create an environment template in one of the two following ways:
     
      {ul
           {- Register and publish a {i standard} environment template that instructs Proton to deploy and manage environment infrastructure.
              
              }
            {- Register and publish a {i customer managed} environment template that connects Proton to your existing provisioned infrastructure that you manage. Proton {i doesn't} manage your existing provisioned infrastructure. To create an environment template for customer provisioned and managed infrastructure, include the [provisioning] parameter and set the value to [CUSTOMER_MANAGED]. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/template-create.html}Register and publish an environment template} in the {i Proton User Guide}.
               
               }
           
      }
       *)

  
end

module CreateEnvironmentTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      create_environment_template_version_input ->
        (create_environment_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Create a new major or minor version of an environment template. A major version of an environment template is a version that {i isn't} backwards compatible. A minor version of an environment template is a version that's backwards compatible within its major version.
     *)

  
end

module CreateRepository : sig
  val request :
    Smaws_Lib.Context.t ->
      create_repository_input ->
        (create_repository_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Create and register a link to a repository. Proton uses the link to repeatedly access the repository, to either push to it (self-managed provisioning) or pull from it (template sync). You can share a linked repository across multiple resources (like environments using self-managed provisioning, or synced templates). When you create a repository link, Proton creates a {{:https://docs.aws.amazon.com/proton/latest/userguide/using-service-linked-roles.html}service-linked role} for you.
    
     For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html#ag-works-prov-methods-self}Self-managed provisioning}, {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-template-authoring.html#ag-template-bundles}Template bundles}, and {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-template-sync-configs.html}Template sync configurations} in the {i Proton User Guide}.
      *)

  
end

module CreateService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_input ->
        (create_service_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Create an Proton service. An Proton service is an instantiation of a service template and often includes several service instances and pipeline. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-services.html}Services} in the {i Proton User Guide}.
     *)

  
end

module CreateServiceInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_instance_input ->
        (create_service_instance_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Create a service instance.
     *)

  
end

module CreateServiceSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_sync_config_input ->
        (create_service_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Create the Proton Ops configuration file.
     *)

  
end

module CreateServiceTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_template_input ->
        (create_service_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Create a service template. The administrator creates a service template to define standardized infrastructure and an optional CI/CD service pipeline. Developers, in turn, select the service template from Proton. If the selected service template includes a service pipeline definition, they provide a link to their source code repository. Proton then deploys and manages the infrastructure defined by the selected service template. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-templates.html}Proton templates} in the {i Proton User Guide}.
     *)

  
end

module CreateServiceTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_template_version_input ->
        (create_service_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Create a new major or minor version of a service template. A major version of a service template is a version that {i isn't} backward compatible. A minor version of a service template is a version that's backward compatible within its major version.
     *)

  
end

module CreateTemplateSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      create_template_sync_config_input ->
        (create_template_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Set up a template to create new template versions automatically by tracking a linked repository. A linked repository is a repository that has been registered with Proton. For more information, see [CreateRepository].
    
     When a commit is pushed to your linked repository, Proton checks for changes to your repository template bundles. If it detects a template bundle change, a new major or minor version of its template is created, if the version doesn’t already exist. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-template-sync-configs.html}Template sync configurations} in the {i Proton User Guide}.
      *)

  
end

module DeleteComponent : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_component_input ->
        (delete_component_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Delete an Proton component resource.
    
     For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
      *)

  
end

module DeleteDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_deployment_input ->
        (delete_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Delete the deployment.
     *)

  
end

module DeleteEnvironment : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_environment_input ->
        (delete_environment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Delete an environment.
     *)

  
end

module DeleteEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_environment_account_connection_input ->
        (delete_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    In an environment account, delete an environment account connection.
    
     After you delete an environment account connection that’s in use by an Proton environment, Proton {i can’t} manage the environment infrastructure resources until a new environment account connection is accepted for the environment account and associated environment. You're responsible for cleaning up provisioned resources that remain without an environment connection.
     
      For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment account connections} in the {i Proton User guide}.
       *)

  
end

module DeleteEnvironmentTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_environment_template_input ->
        (delete_environment_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    If no other major or minor versions of an environment template exist, delete the environment template.
     *)

  
end

module DeleteEnvironmentTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_environment_template_version_input ->
        (delete_environment_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    If no other minor versions of an environment template exist, delete a major version of the environment template if it's not the [Recommended] version. Delete the [Recommended] version of the environment template if no other major versions or minor versions of the environment template exist. A major version of an environment template is a version that's not backward compatible.
    
     Delete a minor version of an environment template if it {i isn't} the [Recommended] version. Delete a [Recommended] minor version of the environment template if no other minor versions of the environment template exist. A minor version of an environment template is a version that's backward compatible.
      *)

  
end

module DeleteRepository : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_repository_input ->
        (delete_repository_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    De-register and unlink your repository.
     *)

  
end

module DeleteService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_input ->
        (delete_service_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Delete a service, with its instances and pipeline.
    
     You can't delete a service if it has any service instances that have components attached to them.
     
      For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
      
       *)

  
end

module DeleteServiceSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_sync_config_input ->
        (delete_service_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Delete the Proton Ops file.
     *)

  
end

module DeleteServiceTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_template_input ->
        (delete_service_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    If no other major or minor versions of the service template exist, delete the service template.
     *)

  
end

module DeleteServiceTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_template_version_input ->
        (delete_service_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    If no other minor versions of a service template exist, delete a major version of the service template if it's not the [Recommended] version. Delete the [Recommended] version of the service template if no other major versions or minor versions of the service template exist. A major version of a service template is a version that {i isn't} backwards compatible.
    
     Delete a minor version of a service template if it's not the [Recommended] version. Delete a [Recommended] minor version of the service template if no other minor versions of the service template exist. A minor version of a service template is a version that's backwards compatible.
      *)

  
end

module DeleteTemplateSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_template_sync_config_input ->
        (delete_template_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Delete a template sync configuration.
     *)

  
end

module GetAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      get_account_settings_input ->
        (get_account_settings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detail data for Proton account-wide settings.
     *)

  
end

module GetComponent : sig
  val request :
    Smaws_Lib.Context.t ->
      get_component_input ->
        (get_component_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed data for a component.
    
     For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
      *)

  
end

module GetDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      get_deployment_input ->
        (get_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed data for a deployment.
     *)

  
end

module GetEnvironment : sig
  val request :
    Smaws_Lib.Context.t ->
      get_environment_input ->
        (get_environment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed data for an environment.
     *)

  
end

module GetEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      get_environment_account_connection_input ->
        (get_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    In an environment account, get the detailed data for an environment account connection.
    
     For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment account connections} in the {i Proton User guide}.
      *)

  
end

module GetEnvironmentTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_environment_template_input ->
        (get_environment_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed data for an environment template.
     *)

  
end

module GetEnvironmentTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      get_environment_template_version_input ->
        (get_environment_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed data for a major or minor version of an environment template.
     *)

  
end

module GetRepository : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_input ->
        (get_repository_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detail data for a linked repository.
     *)

  
end

module GetRepositorySyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_sync_status_input ->
        (get_repository_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get the sync status of a repository used for Proton template sync. For more information about template sync, see .
    
     A repository sync status isn't tied to the Proton Repository resource (or any other Proton resource). Therefore, tags on an Proton Repository resource have no effect on this action. Specifically, you can't use these tags to control access to this action using Attribute-based access control (ABAC).
     
      For more information about ABAC, see {{:https://docs.aws.amazon.com/proton/latest/userguide/security_iam_service-with-iam.html#security_iam_service-with-iam-tags}ABAC} in the {i Proton User Guide}.
      
       *)

  
end

module GetResourcesSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resources_summary_input ->
        (get_resources_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get counts of Proton resources.
    
     For infrastructure-provisioning resources (environments, services, service instances, pipelines), the action returns staleness counts. A resource is stale when it's behind the recommended version of the Proton template that it uses and it needs an update to become current.
     
      The action returns staleness counts (counts of resources that are up-to-date, behind a template major version, or behind a template minor version), the total number of resources, and the number of resources that are in a failed state, grouped by resource type. Components, environments, and service templates return less information - see the [components], [environments], and [serviceTemplates] field descriptions.
      
       For context, the action also returns the total number of each type of Proton template in the Amazon Web Services account.
       
        For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/monitoring-dashboard.html}Proton dashboard} in the {i Proton User Guide}.
         *)

  
end

module GetService : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_input ->
        (get_service_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed data for a service.
     *)

  
end

module GetServiceInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_instance_input ->
        (get_service_instance_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed data for a service instance. A service instance is an instantiation of service template and it runs in a specific environment.
     *)

  
end

module GetServiceInstanceSyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_instance_sync_status_input ->
        (get_service_instance_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get the status of the synced service instance.
     *)

  
end

module GetServiceSyncBlockerSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_sync_blocker_summary_input ->
        (get_service_sync_blocker_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed data for the service sync blocker summary.
     *)

  
end

module GetServiceSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_sync_config_input ->
        (get_service_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed information for the service sync configuration.
     *)

  
end

module GetServiceTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_template_input ->
        (get_service_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed data for a service template.
     *)

  
end

module GetServiceTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_template_version_input ->
        (get_service_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detailed data for a major or minor version of a service template.
     *)

  
end

module GetTemplateSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      get_template_sync_config_input ->
        (get_template_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get detail data for a template sync configuration.
     *)

  
end

module GetTemplateSyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_template_sync_status_input ->
        (get_template_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get the status of a template sync.
     *)

  
end

module ListComponentOutputs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_component_outputs_input ->
        (list_component_outputs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get a list of component Infrastructure as Code (IaC) outputs.
    
     For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
      *)

  
end

module ListComponentProvisionedResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_component_provisioned_resources_input ->
        (list_component_provisioned_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List provisioned resources for a component with details.
    
     For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
      *)

  
end

module ListComponents : sig
  val request :
    Smaws_Lib.Context.t ->
      list_components_input ->
        (list_components_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List components with summary data. You can filter the result list by environment, service, or a single service instance.
    
     For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
      *)

  
end

module ListDeployments : sig
  val request :
    Smaws_Lib.Context.t ->
      list_deployments_input ->
        (list_deployments_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List deployments. You can filter the result list by environment, service, or a single service instance.
     *)

  
end

module ListEnvironmentAccountConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environment_account_connections_input ->
        (list_environment_account_connections_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    View a list of environment account connections.
    
     For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment account connections} in the {i Proton User guide}.
      *)

  
end

module ListEnvironmentOutputs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environment_outputs_input ->
        (list_environment_outputs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List the infrastructure as code outputs for your environment.
     *)

  
end

module ListEnvironmentProvisionedResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environment_provisioned_resources_input ->
        (list_environment_provisioned_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List the provisioned resources for your environment.
     *)

  
end

module ListEnvironmentTemplateVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environment_template_versions_input ->
        (list_environment_template_versions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List major or minor versions of an environment template with detail data.
     *)

  
end

module ListEnvironmentTemplates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environment_templates_input ->
        (list_environment_templates_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List environment templates.
     *)

  
end

module ListEnvironments : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environments_input ->
        (list_environments_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List environments with detail data summaries.
     *)

  
end

module ListRepositories : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repositories_input ->
        (list_repositories_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List linked repositories with detail data.
     *)

  
end

module ListRepositorySyncDefinitions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repository_sync_definitions_input ->
        (list_repository_sync_definitions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List repository sync definitions with detail data.
     *)

  
end

module ListServiceInstanceOutputs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_instance_outputs_input ->
        (list_service_instance_outputs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get a list service of instance Infrastructure as Code (IaC) outputs.
     *)

  
end

module ListServiceInstanceProvisionedResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_instance_provisioned_resources_input ->
        (list_service_instance_provisioned_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List provisioned resources for a service instance with details.
     *)

  
end

module ListServiceInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_instances_input ->
        (list_service_instances_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List service instances with summary data. This action lists service instances of all services in the Amazon Web Services account.
     *)

  
end

module ListServicePipelineOutputs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_pipeline_outputs_input ->
        (list_service_pipeline_outputs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Get a list of service pipeline Infrastructure as Code (IaC) outputs.
     *)

  
end

module ListServicePipelineProvisionedResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_pipeline_provisioned_resources_input ->
        (list_service_pipeline_provisioned_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List provisioned resources for a service and pipeline with details.
     *)

  
end

module ListServiceTemplateVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_template_versions_input ->
        (list_service_template_versions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List major or minor versions of a service template with detail data.
     *)

  
end

module ListServiceTemplates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_templates_input ->
        (list_service_templates_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List service templates with detail data.
     *)

  
end

module ListServices : sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_input ->
        (list_services_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List services with summaries of detail data.
     *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List tags for a resource. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.
     *)

  
end

module NotifyResourceDeploymentStatusChange : sig
  val request :
    Smaws_Lib.Context.t ->
      notify_resource_deployment_status_change_input ->
        (notify_resource_deployment_status_change_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Notify Proton of status changes to a provisioned resource when you use self-managed provisioning.
    
     For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html#ag-works-prov-methods-self}Self-managed provisioning} in the {i Proton User Guide}.
      *)

  
end

module RejectEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      reject_environment_account_connection_input ->
        (reject_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    In a management account, reject an environment account connection from another environment account.
    
     After you reject an environment account connection request, you {i can't} accept or use the rejected environment account connection.
     
      You {i can’t} reject an environment account connection that's connected to an environment.
      
       For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment account connections} in the {i Proton User guide}.
        *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Tag a resource. A tag is a key-value pair of metadata that you associate with an Proton resource.
    
     For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.
      *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Remove a customer tag from a resource. A tag is a key-value pair of metadata associated with an Proton resource.
    
     For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.
      *)

  
end

module UpdateAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_account_settings_input ->
        (update_account_settings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update Proton settings that are used for multiple services in the Amazon Web Services account.
     *)

  
end

module UpdateComponent : sig
  val request :
    Smaws_Lib.Context.t ->
      update_component_input ->
        (update_component_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update a component.
    
     There are a few modes for updating a component. The [deploymentType] field defines the mode.
     
      You can't update a component while its deployment status, or the deployment status of a service instance attached to it, is [IN_PROGRESS].
      
       For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
        *)

  
end

module UpdateEnvironment : sig
  val request :
    Smaws_Lib.Context.t ->
      update_environment_input ->
        (update_environment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update an environment.
    
     If the environment is associated with an environment account connection, {i don't} update or include the [protonServiceRoleArn] and [provisioningRepository] parameter to update or connect to an environment account connection.
     
      You can only update to a new environment account connection if that connection was created in the same environment account that the current environment account connection was created in. The account connection must also be associated with the current environment.
      
       If the environment {i isn't} associated with an environment account connection, {i don't} update or include the [environmentAccountConnectionId] parameter. You {i can't} update or connect the environment to an environment account connection if it {i isn't} already associated with an environment connection.
       
        You can update either the [environmentAccountConnectionId] or [protonServiceRoleArn] parameter and value. You can’t update both.
        
         If the environment was configured for Amazon Web Services-managed provisioning, omit the [provisioningRepository] parameter.
         
          If the environment was configured for self-managed provisioning, specify the [provisioningRepository] parameter and omit the [protonServiceRoleArn] and [environmentAccountConnectionId] parameters.
          
           For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-environments.html}Environments} and {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html}Provisioning methods} in the {i Proton User Guide}.
           
            There are four modes for updating an environment. The [deploymentType] field defines the mode.
            
             [NONE]
             
              In this mode, a deployment {i doesn't} occur. Only the requested metadata parameters are updated.
              
               [CURRENT_VERSION]
               
                In this mode, the environment is deployed and updated with the new spec that you provide. Only requested parameters are updated. {i Don’t} include minor or major version parameters when you use this [deployment-type].
                
                 [MINOR_VERSION]
                 
                  In this mode, the environment is deployed and updated with the published, recommended (latest) minor version of the current major version in use, by default. You can also specify a different minor version of the current major version in use.
                  
                   [MAJOR_VERSION]
                   
                    In this mode, the environment is deployed and updated with the published, recommended (latest) major and minor version of the current template, by default. You can also specify a different major version that's higher than the major version in use and a minor version.
                    
                     *)

  
end

module UpdateEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      update_environment_account_connection_input ->
        (update_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    In an environment account, update an environment account connection to use a new IAM role.
    
     For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment account connections} in the {i Proton User guide}.
      *)

  
end

module UpdateEnvironmentTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      update_environment_template_input ->
        (update_environment_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update an environment template.
     *)

  
end

module UpdateEnvironmentTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      update_environment_template_version_input ->
        (update_environment_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update a major or minor version of an environment template.
     *)

  
end

module UpdateService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_input ->
        (update_service_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Edit a service description or use a spec to add and delete service instances.
    
     Existing service instances and the service pipeline {i can't} be edited using this API. They can only be deleted.
     
      Use the [description] parameter to modify the description.
      
       Edit the [spec] parameter to add or delete instances.
       
        You can't delete a service instance (remove it from the spec) if it has an attached component.
        
         For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
         
          *)

  
end

module UpdateServiceInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_instance_input ->
        (update_service_instance_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update a service instance.
    
     There are a few modes for updating a service instance. The [deploymentType] field defines the mode.
     
      You can't update a service instance while its deployment status, or the deployment status of a component attached to it, is [IN_PROGRESS].
      
       For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.
       
        *)

  
end

module UpdateServicePipeline : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_pipeline_input ->
        (update_service_pipeline_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update the service pipeline.
    
     There are four modes for updating a service pipeline. The [deploymentType] field defines the mode.
     
      [NONE]
      
       In this mode, a deployment {i doesn't} occur. Only the requested metadata parameters are updated.
       
        [CURRENT_VERSION]
        
         In this mode, the service pipeline is deployed and updated with the new spec that you provide. Only requested parameters are updated. {i Don’t} include major or minor version parameters when you use this [deployment-type].
         
          [MINOR_VERSION]
          
           In this mode, the service pipeline is deployed and updated with the published, recommended (latest) minor version of the current major version in use, by default. You can specify a different minor version of the current major version in use.
           
            [MAJOR_VERSION]
            
             In this mode, the service pipeline is deployed and updated with the published, recommended (latest) major and minor version of the current template by default. You can specify a different major version that's higher than the major version in use and a minor version.
             
              *)

  
end

module UpdateServiceSyncBlocker : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_sync_blocker_input ->
        (update_service_sync_blocker_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update the service sync blocker by resolving it.
     *)

  
end

module UpdateServiceSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_sync_config_input ->
        (update_service_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update the Proton Ops config file.
     *)

  
end

module UpdateServiceTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_template_input ->
        (update_service_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update a service template.
     *)

  
end

module UpdateServiceTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_template_version_input ->
        (update_service_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update a major or minor version of a service template.
     *)

  
end

module UpdateTemplateSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      update_template_sync_config_input ->
        (update_template_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Update template sync configuration parameters, except for the [templateName] and [templateType]. Repository details (branch, name, and provider) should be of a linked repository. A linked repository is a repository that has been registered with Proton. For more information, see [CreateRepository].
     *)

  
end

