open Types 
module AddTagsToResource : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_resource_request ->
        (add_tags_to_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            | `InvalidResourceType of invalid_resource_type
            | `TooManyTagsError of too_many_tags_error
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Adds or overwrites one or more tags for the specified resource. {i Tags} are metadata that you can assign to your automations, documents, managed nodes, maintenance windows, Parameter Store parameters, and patch baselines. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define. For example, you could define a set of tags for your account's managed nodes that helps you track each node's owner and stack level. For example:
    
     {ul
          {- [Key=Owner,Value=DbAdmin]
             
             }
           {- [Key=Owner,Value=SysAdmin]
              
              }
           {- [Key=Owner,Value=Dev]
              
              }
           {- [Key=Stack,Value=Production]
              
              }
           {- [Key=Stack,Value=Pre-Production]
              
              }
           {- [Key=Stack,Value=Test]
              
              }
          
      }
       Most resources can have a maximum of 50 tags. Automations can have a maximum of 5 tags.
       
        We recommend that you devise a set of tag keys that meets your needs for each resource type. Using a consistent set of tag keys makes it easier for you to manage your resources. You can search and filter the resources based on the tags you add. Tags don't have any semantic meaning to and are interpreted strictly as a string of characters.
        
         For more information about using tags with Amazon Elastic Compute Cloud (Amazon EC2) instances, see {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html}Tag your Amazon EC2 resources} in the {i Amazon EC2 User Guide}.
          *)

  
end

module AssociateOpsItemRelatedItem : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_ops_item_related_item_request ->
        (associate_ops_item_related_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemConflictException of ops_item_conflict_exception
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
            | `OpsItemNotFoundException of ops_item_not_found_exception
            | `OpsItemRelatedItemAlreadyExistsException of ops_item_related_item_already_exists_exception
            
        ]
      ) result
  (** 
    Associates a related item to a Systems Manager OpsCenter OpsItem. For example, you can associate an Incident Manager incident or analysis with an OpsItem. Incident Manager and OpsCenter are capabilities of Amazon Web Services Systems Manager.
     *)

  
end

module CancelCommand : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_command_request ->
        (cancel_command_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateInstanceId of duplicate_instance_id
            | `InternalServerError of internal_server_error
            | `InvalidCommandId of invalid_command_id
            | `InvalidInstanceId of invalid_instance_id
            
        ]
      ) result
  (** 
    Attempts to cancel the command specified by the Command ID. There is no guarantee that the command will be terminated and the underlying process stopped.
     *)

  
end

module CancelMaintenanceWindowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_maintenance_window_execution_request ->
        (cancel_maintenance_window_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Stops a maintenance window execution that is already in progress and cancels any tasks in the window that haven't already starting running. Tasks already in progress will continue to completion.
     *)

  
end

module CreateActivation : sig
  val request :
    Smaws_Lib.Context.t ->
      create_activation_request ->
        (create_activation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidParameters of invalid_parameters
            
        ]
      ) result
  (** 
    Generates an activation code and activation ID you can use to register your on-premises servers, edge devices, or virtual machine (VM) with Amazon Web Services Systems Manager. Registering these machines with Systems Manager makes it possible to manage them using Systems Manager capabilities. You use the activation code and ID when installing SSM Agent on machines in your hybrid environment. For more information about requirements for managing on-premises machines using Systems Manager, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html}Setting up Amazon Web Services Systems Manager for hybrid and multicloud environments} in the {i Amazon Web Services Systems Manager User Guide}.
    
     Amazon Elastic Compute Cloud (Amazon EC2) instances, edge devices, and on-premises servers and VMs that are configured for Systems Manager are all called {i managed nodes}.
     
      *)

  
end

module CreateAssociation : sig
  val request :
    Smaws_Lib.Context.t ->
      create_association_request ->
        (create_association_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationAlreadyExists of association_already_exists
            | `AssociationLimitExceeded of association_limit_exceeded
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidOutputLocation of invalid_output_location
            | `InvalidParameters of invalid_parameters
            | `InvalidSchedule of invalid_schedule
            | `InvalidTag of invalid_tag
            | `InvalidTarget of invalid_target
            | `InvalidTargetMaps of invalid_target_maps
            | `UnsupportedPlatformType of unsupported_platform_type
            
        ]
      ) result
  (** 
    A State Manager association defines the state that you want to maintain on your managed nodes. For example, an association can specify that anti-virus software must be installed and running on your managed nodes, or that certain ports must be closed. For static targets, the association specifies a schedule for when the configuration is reapplied. For dynamic targets, such as an Amazon Web Services resource group or an Amazon Web Services autoscaling group, State Manager, a capability of Amazon Web Services Systems Manager applies the configuration when new managed nodes are added to the group. The association also specifies actions to take when applying the configuration. For example, an association for anti-virus software might run once a day. If the software isn't installed, then State Manager installs it. If the software is installed, but the service isn't running, then the association might instruct State Manager to start the service.
     *)

  
end

module CreateAssociationBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      create_association_batch_request ->
        (create_association_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationLimitExceeded of association_limit_exceeded
            | `DuplicateInstanceId of duplicate_instance_id
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidOutputLocation of invalid_output_location
            | `InvalidParameters of invalid_parameters
            | `InvalidSchedule of invalid_schedule
            | `InvalidTarget of invalid_target
            | `InvalidTargetMaps of invalid_target_maps
            | `UnsupportedPlatformType of unsupported_platform_type
            
        ]
      ) result
  (** 
    Associates the specified Amazon Web Services Systems Manager document (SSM document) with the specified managed nodes or targets.
    
     When you associate a document with one or more managed nodes using IDs or tags, Amazon Web Services Systems Manager Agent (SSM Agent) running on the managed node processes the document and configures the node as specified.
     
      If you associate a document with a managed node that already has an associated document, the system returns the AssociationAlreadyExists exception.
       *)

  
end

module CreateDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      create_document_request ->
        (create_document_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DocumentAlreadyExists of document_already_exists
            | `DocumentLimitExceeded of document_limit_exceeded
            | `InternalServerError of internal_server_error
            | `InvalidDocumentContent of invalid_document_content
            | `InvalidDocumentSchemaVersion of invalid_document_schema_version
            | `MaxDocumentSizeExceeded of max_document_size_exceeded
            
        ]
      ) result
  (** 
    Creates a Amazon Web Services Systems Manager (SSM document). An SSM document defines the actions that Systems Manager performs on your managed nodes. For more information about SSM documents, including information about supported schemas, features, and syntax, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html}Amazon Web Services Systems Manager Documents} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  
end

module CreateMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      create_maintenance_window_request ->
        (create_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `ResourceLimitExceededException of resource_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a new maintenance window.
    
     The value you specify for [Duration] determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for [Cutoff]. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for [Cutoff] is one hour, no maintenance window tasks can start after 5 PM.
     
      *)

  
end

module CreateOpsItem : sig
  val request :
    Smaws_Lib.Context.t ->
      create_ops_item_request ->
        (create_ops_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemAccessDeniedException of ops_item_access_denied_exception
            | `OpsItemAlreadyExistsException of ops_item_already_exists_exception
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a new OpsItem. You must have permission in Identity and Access Management (IAM) to create a new OpsItem. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
    
     Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  
end

module CreateOpsMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      create_ops_metadata_request ->
        (create_ops_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsMetadataAlreadyExistsException of ops_metadata_already_exists_exception
            | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
            | `OpsMetadataLimitExceededException of ops_metadata_limit_exceeded_exception
            | `OpsMetadataTooManyUpdatesException of ops_metadata_too_many_updates_exception
            
        ]
      ) result
  (** 
    If you create a new application in Application Manager, Amazon Web Services Systems Manager calls this API operation to specify information about the new application, including the application type.
     *)

  
end

module CreatePatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      create_patch_baseline_request ->
        (create_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `ResourceLimitExceededException of resource_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a patch baseline.
    
     For information about valid key-value pairs in [PatchFilters] for each supported operating system type, see [PatchFilter].
     
      *)

  
end

module CreateResourceDataSync : sig
  val request :
    Smaws_Lib.Context.t ->
      create_resource_data_sync_request ->
        (create_resource_data_sync_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceDataSyncAlreadyExistsException of resource_data_sync_already_exists_exception
            | `ResourceDataSyncCountExceededException of resource_data_sync_count_exceeded_exception
            | `ResourceDataSyncInvalidConfigurationException of resource_data_sync_invalid_configuration_exception
            
        ]
      ) result
  (** 
    A resource data sync helps you view data from multiple sources in a single location. Amazon Web Services Systems Manager offers two types of resource data sync: [SyncToDestination] and [SyncFromSource].
    
     You can configure Systems Manager Inventory to use the [SyncToDestination] type to synchronize Inventory data from multiple Amazon Web Services Regions to a single Amazon Simple Storage Service (Amazon S3) bucket. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html}Configuring resource data sync for Inventory} in the {i Amazon Web Services Systems Manager User Guide}.
     
      You can configure Systems Manager Explorer to use the [SyncFromSource] type to synchronize operational work items (OpsItems) and operational data (OpsData) from multiple Amazon Web Services Regions to a single Amazon S3 bucket. This type can synchronize OpsItems and OpsData from multiple Amazon Web Services accounts and Amazon Web Services Regions or [EntireOrganization] by using Organizations. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html}Setting up Systems Manager Explorer to display data from multiple accounts and Regions} in the {i Amazon Web Services Systems Manager User Guide}.
      
       A resource data sync is an asynchronous operation that returns immediately. After a successful initial sync is completed, the system continuously syncs data. To check the status of a sync, use the [ListResourceDataSync].
       
        By default, data isn't encrypted in Amazon S3. We strongly recommend that you enable encryption in Amazon S3 to ensure secure data storage. We also recommend that you secure access to the Amazon S3 bucket by creating a restrictive bucket policy.
        
         *)

  
end

module DeleteActivation : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activation_request ->
        (delete_activation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidActivation of invalid_activation
            | `InvalidActivationId of invalid_activation_id
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Deletes an activation. You aren't required to delete an activation. If you delete an activation, you can no longer use it to register additional managed nodes. Deleting an activation doesn't de-register managed nodes. You must manually de-register managed nodes.
     *)

  
end

module DeleteAssociation : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_association_request ->
        (delete_association_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidInstanceId of invalid_instance_id
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Disassociates the specified Amazon Web Services Systems Manager document (SSM document) from the specified managed node. If you created the association by using the [Targets] parameter, then you must delete the association by using the association ID.
    
     When you disassociate a document from a managed node, it doesn't change the configuration of the node. To change the configuration state of a managed node after you disassociate a document, you must create a new document with the desired configuration and associate it with the node.
      *)

  
end

module DeleteDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_document_request ->
        (delete_document_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociatedInstances of associated_instances
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentOperation of invalid_document_operation
            
        ]
      ) result
  (** 
    Deletes the Amazon Web Services Systems Manager document (SSM document) and all managed node associations to the document.
    
     Before you delete the document, we recommend that you use [DeleteAssociation] to disassociate all managed nodes that are associated with the document.
      *)

  
end

module DeleteInventory : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_inventory_request ->
        (delete_inventory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDeleteInventoryParametersException of invalid_delete_inventory_parameters_exception
            | `InvalidInventoryRequestException of invalid_inventory_request_exception
            | `InvalidOptionException of invalid_option_exception
            | `InvalidTypeNameException of invalid_type_name_exception
            
        ]
      ) result
  (** 
    Delete a custom inventory type or the data associated with a custom Inventory type. Deleting a custom inventory type is also referred to as deleting a custom inventory schema.
     *)

  
end

module DeleteMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_maintenance_window_request ->
        (delete_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Deletes a maintenance window.
     *)

  
end

module DeleteOpsItem : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ops_item_request ->
        (delete_ops_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            
        ]
      ) result
  (** 
    Delete an OpsItem. You must have permission in Identity and Access Management (IAM) to delete an OpsItem.
    
     Note the following important information about this operation.
     
      {ul
           {- Deleting an OpsItem is irreversible. You can't restore a deleted OpsItem.
              
              }
            {- This operation uses an {i eventual consistency model}, which means the system can take a few minutes to complete this operation. If you delete an OpsItem and immediately call, for example, [GetOpsItem], the deleted OpsItem might still appear in the response.
               
               }
            {- This operation is idempotent. The system doesn't throw an exception if you repeatedly call this operation for the same OpsItem. If the first call is successful, all additional calls return the same successful response as the first call.
               
               }
            {- This operation doesn't support cross-account calls. A delegated administrator or management account can't delete OpsItems in other accounts, even if OpsCenter has been set up for cross-account administration. For more information about cross-account administration, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setting-up-cross-account.html}Setting up OpsCenter to centrally manage OpsItems across accounts} in the {i Systems Manager User Guide}.
               
               }
           
      }
       *)

  
end

module DeleteOpsMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ops_metadata_request ->
        (delete_ops_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
            | `OpsMetadataNotFoundException of ops_metadata_not_found_exception
            
        ]
      ) result
  (** 
    Delete OpsMetadata related to an application.
     *)

  
end

module DeleteParameter : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_parameter_request ->
        (delete_parameter_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ParameterNotFound of parameter_not_found
            
        ]
      ) result
  (** 
    Delete a parameter from the system. After deleting a parameter, wait for at least 30 seconds to create a parameter with the same name.
     *)

  
end

module DeleteParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_parameters_request ->
        (delete_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Delete a list of parameters. After deleting a parameter, wait for at least 30 seconds to create a parameter with the same name.
     *)

  
end

module DeletePatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_patch_baseline_request ->
        (delete_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** 
    Deletes a patch baseline.
     *)

  
end

module DeleteResourceDataSync : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_data_sync_request ->
        (delete_resource_data_sync_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceDataSyncInvalidConfigurationException of resource_data_sync_invalid_configuration_exception
            | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
            
        ]
      ) result
  (** 
    Deletes a resource data sync configuration. After the configuration is deleted, changes to data on managed nodes are no longer synced to or from the target. Deleting a sync configuration doesn't delete data.
     *)

  
end

module DeleteResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_request ->
        (delete_resource_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `MalformedResourcePolicyDocumentException of malformed_resource_policy_document_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyConflictException of resource_policy_conflict_exception
            | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
            | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
            
        ]
      ) result
  (** 
    Deletes a Systems Manager resource policy. A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. The following resources support Systems Manager resource policies.
    
     {ul
          {- [OpsItemGroup] - The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).
             
             }
           {- [Parameter] - The resource policy is used to share a parameter with other accounts using Resource Access Manager (RAM). For more information about cross-account sharing of parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html}Working with shared parameters} in the {i Amazon Web Services Systems Manager User Guide}.
              
              }
          
      }
       *)

  
end

module DeregisterManagedInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_managed_instance_request ->
        (deregister_managed_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidInstanceId of invalid_instance_id
            
        ]
      ) result
  (** 
    Removes the server or virtual machine from the list of registered servers. You can reregister the node again at any time. If you don't plan to use Run Command on the server, we suggest uninstalling SSM Agent first.
     *)

  
end

module DeregisterPatchBaselineForPatchGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_patch_baseline_for_patch_group_request ->
        (deregister_patch_baseline_for_patch_group_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            
        ]
      ) result
  (** 
    Removes a patch group from a patch baseline.
     *)

  
end

module DeregisterTargetFromMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_target_from_maintenance_window_request ->
        (deregister_target_from_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            | `TargetInUseException of target_in_use_exception
            
        ]
      ) result
  (** 
    Removes a target from a maintenance window.
     *)

  
end

module DeregisterTaskFromMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_task_from_maintenance_window_request ->
        (deregister_task_from_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Removes a task from a maintenance window.
     *)

  
end

module DescribeActivations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activations_request ->
        (describe_activations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Describes details about the activation, such as the date and time the activation was created, its expiration date, the Identity and Access Management (IAM) role assigned to the managed nodes in the activation, and the number of nodes registered by using this activation.
     *)

  
end

module DescribeAssociation : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_association_request ->
        (describe_association_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidAssociationVersion of invalid_association_version
            | `InvalidDocument of invalid_document
            | `InvalidInstanceId of invalid_instance_id
            
        ]
      ) result
  (** 
    Describes the association for the specified target or managed node. If you created the association by using the [Targets] parameter, then you must retrieve the association by using the association ID.
     *)

  
end

module DescribeAssociationExecutionTargets : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_association_execution_targets_request ->
        (describe_association_execution_targets_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `AssociationExecutionDoesNotExist of association_execution_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Views information about a specific execution of a specific association.
     *)

  
end

module DescribeAssociationExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_association_executions_request ->
        (describe_association_executions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Views all executions for a specific association ID.
     *)

  
end

module DescribeAutomationExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_automation_executions_request ->
        (describe_automation_executions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidFilterValue of invalid_filter_value
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Provides details about all active and terminated Automation executions.
     *)

  
end

module DescribeAutomationStepExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_automation_step_executions_request ->
        (describe_automation_step_executions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidFilterValue of invalid_filter_value
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Information about all active and terminated step executions in an Automation workflow.
     *)

  
end

module DescribeAvailablePatches : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_available_patches_request ->
        (describe_available_patches_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists all patches eligible to be included in a patch baseline.
    
     Currently, [DescribeAvailablePatches] supports only the Amazon Linux 1, Amazon Linux 2, and Windows Server operating systems.
     
      *)

  
end

module DescribeDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_document_request ->
        (describe_document_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            
        ]
      ) result
  (** 
    Describes the specified Amazon Web Services Systems Manager document (SSM document).
     *)

  
end

module DescribeDocumentPermission : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_document_permission_request ->
        (describe_document_permission_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentOperation of invalid_document_operation
            | `InvalidNextToken of invalid_next_token
            | `InvalidPermissionType of invalid_permission_type
            
        ]
      ) result
  (** 
    Describes the permissions for a Amazon Web Services Systems Manager document (SSM document). If you created the document, you are the owner. If a document is shared, it can either be shared privately (by specifying a user's Amazon Web Services account ID) or publicly ({i All}).
     *)

  
end

module DescribeEffectiveInstanceAssociations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_effective_instance_associations_request ->
        (describe_effective_instance_associations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    All associations for the managed nodes.
     *)

  
end

module DescribeEffectivePatchesForPatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_effective_patches_for_patch_baseline_request ->
        (describe_effective_patches_for_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            | `UnsupportedOperatingSystem of unsupported_operating_system
            
        ]
      ) result
  (** 
    Retrieves the current effective patches (the patch and the approval state) for the specified patch baseline. Applies to patch baselines for Windows only.
     *)

  
end

module DescribeInstanceAssociationsStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_associations_status_request ->
        (describe_instance_associations_status_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    The status of the associations for the managed nodes.
     *)

  
end

module DescribeInstanceInformation : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_information_request ->
        (describe_instance_information_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidInstanceInformationFilterValue of invalid_instance_information_filter_value
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Provides information about one or more of your managed nodes, including the operating system platform, SSM Agent version, association status, and IP address. This operation does not return information for nodes that are either Stopped or Terminated.
    
     If you specify one or more node IDs, the operation returns information for those managed nodes. If you don't specify node IDs, it returns information for all your managed nodes. If you specify a node ID that isn't valid or a node that you don't own, you receive an error.
     
      The [IamRole] field returned for this API operation is the Identity and Access Management (IAM) role assigned to on-premises managed nodes. This operation does not return the IAM role for EC2 instances.
      
       *)

  
end

module DescribeInstancePatchStates : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_patch_states_request ->
        (describe_instance_patch_states_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieves the high-level patch state of one or more managed nodes.
     *)

  
end

module DescribeInstancePatchStatesForPatchGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_patch_states_for_patch_group_request ->
        (describe_instance_patch_states_for_patch_group_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieves the high-level patch state for the managed nodes in the specified patch group.
     *)

  
end

module DescribeInstancePatches : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_patches_request ->
        (describe_instance_patches_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieves information about the patches on the specified managed node and their state relative to the patch baseline being used for the node.
     *)

  
end

module DescribeInstanceProperties : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_properties_request ->
        (describe_instance_properties_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidActivationId of invalid_activation_id
            | `InvalidDocument of invalid_document
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidInstancePropertyFilterValue of invalid_instance_property_filter_value
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    An API operation used by the Systems Manager console to display information about Systems Manager managed nodes.
     *)

  
end

module DescribeInventoryDeletions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_inventory_deletions_request ->
        (describe_inventory_deletions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDeletionIdException of invalid_deletion_id_exception
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Describes a specific delete inventory operation.
     *)

  
end

module DescribeMaintenanceWindowExecutionTaskInvocations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_execution_task_invocations_request ->
        (describe_maintenance_window_execution_task_invocations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the individual task executions (one per target) for a particular task run as part of a maintenance window execution.
     *)

  
end

module DescribeMaintenanceWindowExecutionTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_execution_tasks_request ->
        (describe_maintenance_window_execution_tasks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    For a given maintenance window execution, lists the tasks that were run.
     *)

  
end

module DescribeMaintenanceWindowExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_executions_request ->
        (describe_maintenance_window_executions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists the executions of a maintenance window. This includes information about when the maintenance window was scheduled to be active, and information about tasks registered and run with the maintenance window.
     *)

  
end

module DescribeMaintenanceWindowSchedule : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_schedule_request ->
        (describe_maintenance_window_schedule_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves information about upcoming executions of a maintenance window.
     *)

  
end

module DescribeMaintenanceWindowTargets : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_targets_request ->
        (describe_maintenance_window_targets_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists the targets registered with the maintenance window.
     *)

  
end

module DescribeMaintenanceWindowTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_tasks_request ->
        (describe_maintenance_window_tasks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists the tasks in a maintenance window.
    
     For maintenance window tasks without a specified target, you can't supply values for [--max-errors] and [--max-concurrency]. Instead, the system inserts a placeholder value of [1], which may be reported in the response to this command. These values don't affect the running of your task and can be ignored.
     
      *)

  
end

module DescribeMaintenanceWindows : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_windows_request ->
        (describe_maintenance_windows_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the maintenance windows in an Amazon Web Services account.
     *)

  
end

module DescribeMaintenanceWindowsForTarget : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_windows_for_target_request ->
        (describe_maintenance_windows_for_target_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves information about the maintenance window targets or tasks that a managed node is associated with.
     *)

  
end

module DescribeOpsItems : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_ops_items_request ->
        (describe_ops_items_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Query a set of OpsItems. You must have permission in Identity and Access Management (IAM) to query a list of OpsItems. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
    
     Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  
end

module DescribeParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_parameters_request ->
        (describe_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidFilterOption of invalid_filter_option
            | `InvalidFilterValue of invalid_filter_value
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Lists the parameters in your Amazon Web Services account or the parameters shared with you when you enable the {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_DescribeParameters.html#systemsmanager-DescribeParameters-request-Shared}Shared} option.
    
     Request results are returned on a best-effort basis. If you specify [MaxResults] in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of [MaxResults]. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a [NextToken]. You can specify the [NextToken] in a subsequent call to get the next set of results.
     
      If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must also update the key alias the parameter uses to reference KMS. Otherwise, [DescribeParameters] retrieves whatever the original key alias was referencing.
      
       *)

  
end

module DescribePatchBaselines : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_baselines_request ->
        (describe_patch_baselines_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists the patch baselines in your Amazon Web Services account.
     *)

  
end

module DescribePatchGroupState : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_group_state_request ->
        (describe_patch_group_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Returns high-level aggregated patch compliance state information for a patch group.
     *)

  
end

module DescribePatchGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_groups_request ->
        (describe_patch_groups_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists all patch groups that have been registered with patch baselines.
     *)

  
end

module DescribePatchProperties : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_properties_request ->
        (describe_patch_properties_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists the properties of available patches organized by product, product family, classification, severity, and other properties of available patches. You can use the reported properties in the filters you specify in requests for operations such as [CreatePatchBaseline], [UpdatePatchBaseline], [DescribeAvailablePatches], and [DescribePatchBaselines].
    
     The following section lists the properties that can be used in filters for each major operating system type:
     
      AMAZON_LINUX Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
                   
                    AMAZON_LINUX_2 Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
                                   
                                    CENTOS Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
                                           
                                            DEBIAN Valid properties: [PRODUCT] | [PRIORITY]
                                                   
                                                    MACOS Valid properties: [PRODUCT] | [CLASSIFICATION]
                                                          
                                                           ORACLE_LINUX Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
                                                                        
                                                                         REDHAT_ENTERPRISE_LINUX 
    Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
    
     SUSE Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
          
           UBUNTU Valid properties: [PRODUCT] | [PRIORITY]
                  
                   WINDOWS Valid properties: [PRODUCT] | [PRODUCT_FAMILY] | [CLASSIFICATION] | [MSRC_SEVERITY]
                           
                            *)

  
end

module DescribeSessions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_sessions_request ->
        (describe_sessions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions from the past 30 days.
     *)

  
end

module DisassociateOpsItemRelatedItem : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_ops_item_related_item_request ->
        (disassociate_ops_item_related_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemConflictException of ops_item_conflict_exception
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            | `OpsItemNotFoundException of ops_item_not_found_exception
            | `OpsItemRelatedItemAssociationNotFoundException of ops_item_related_item_association_not_found_exception
            
        ]
      ) result
  (** 
    Deletes the association between an OpsItem and a related item. For example, this API operation can delete an Incident Manager incident from an OpsItem. Incident Manager is a capability of Amazon Web Services Systems Manager.
     *)

  
end

module GetAutomationExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      get_automation_execution_request ->
        (get_automation_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Get detailed information about a particular Automation execution.
     *)

  
end

module GetCalendarState : sig
  val request :
    Smaws_Lib.Context.t ->
      get_calendar_state_request ->
        (get_calendar_state_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentType of invalid_document_type
            | `UnsupportedCalendarException of unsupported_calendar_exception
            
        ]
      ) result
  (** 
    Gets the state of a Amazon Web Services Systems Manager change calendar at the current time or a specified time. If you specify a time, [GetCalendarState] returns the state of the calendar at that specific time, and returns the next time that the change calendar state will transition. If you don't specify a time, [GetCalendarState] uses the current time. Change Calendar entries have two possible states: [OPEN] or [CLOSED].
    
     If you specify more than one calendar in a request, the command returns the status of [OPEN] only if all calendars in the request are open. If one or more calendars in the request are closed, the status returned is [CLOSED].
     
      For more information about Change Calendar, a capability of Amazon Web Services Systems Manager, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html}Amazon Web Services Systems Manager Change Calendar} in the {i Amazon Web Services Systems Manager User Guide}.
       *)

  
end

module GetCommandInvocation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_command_invocation_request ->
        (get_command_invocation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidCommandId of invalid_command_id
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidPluginName of invalid_plugin_name
            | `InvocationDoesNotExist of invocation_does_not_exist
            
        ]
      ) result
  (** 
    Returns detailed information about command execution for an invocation or plugin.
    
     [GetCommandInvocation] only gives the execution status of a plugin in a document. To get the command execution status on a specific managed node, use [ListCommandInvocations]. To get the command execution status across managed nodes, use [ListCommands].
      *)

  
end

module GetConnectionStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_connection_status_request ->
        (get_connection_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the Session Manager connection status for a managed node to determine whether it is running and ready to receive Session Manager connections.
     *)

  
end

module GetDefaultPatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      get_default_patch_baseline_request ->
        (get_default_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the default patch baseline. Amazon Web Services Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.
    
     If you don't specify an operating system value, the default patch baseline for Windows is returned.
      *)

  
end

module GetDeployablePatchSnapshotForInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_deployable_patch_snapshot_for_instance_request ->
        (get_deployable_patch_snapshot_for_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `UnsupportedFeatureRequiredException of unsupported_feature_required_exception
            | `UnsupportedOperatingSystem of unsupported_operating_system
            
        ]
      ) result
  (** 
    Retrieves the current snapshot for the patch baseline the managed node uses. This API is primarily used by the [AWS-RunPatchBaseline] Systems Manager document (SSM document).
    
     If you run the command locally, such as with the Command Line Interface (CLI), the system attempts to use your local Amazon Web Services credentials and the operation fails. To avoid this, you can run the command in the Amazon Web Services Systems Manager console. Use Run Command, a capability of Amazon Web Services Systems Manager, with an SSM document that enables you to target a managed node with a script or command. For example, run the command using the [AWS-RunShellScript] document or the [AWS-RunPowerShellScript] document.
     
      *)

  
end

module GetDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      get_document_request ->
        (get_document_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            
        ]
      ) result
  (** 
    Gets the contents of the specified Amazon Web Services Systems Manager document (SSM document).
     *)

  
end

module GetInventory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_inventory_request ->
        (get_inventory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidAggregatorException of invalid_aggregator_exception
            | `InvalidFilter of invalid_filter
            | `InvalidInventoryGroupException of invalid_inventory_group_exception
            | `InvalidNextToken of invalid_next_token
            | `InvalidResultAttributeException of invalid_result_attribute_exception
            | `InvalidTypeNameException of invalid_type_name_exception
            
        ]
      ) result
  (** 
    Query inventory information. This includes managed node status, such as [Stopped] or [Terminated].
     *)

  
end

module GetInventorySchema : sig
  val request :
    Smaws_Lib.Context.t ->
      get_inventory_schema_request ->
        (get_inventory_schema_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            | `InvalidTypeNameException of invalid_type_name_exception
            
        ]
      ) result
  (** 
    Return a list of inventory type names for the account, or return a list of attribute names for a specific Inventory item type.
     *)

  
end

module GetMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_request ->
        (get_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves a maintenance window.
     *)

  
end

module GetMaintenanceWindowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_execution_request ->
        (get_maintenance_window_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves details about a specific a maintenance window execution.
     *)

  
end

module GetMaintenanceWindowExecutionTask : sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_execution_task_request ->
        (get_maintenance_window_execution_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the details about a specific task run as part of a maintenance window execution.
     *)

  
end

module GetMaintenanceWindowExecutionTaskInvocation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_execution_task_invocation_request ->
        (get_maintenance_window_execution_task_invocation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves information about a specific task running on a specific target.
     *)

  
end

module GetMaintenanceWindowTask : sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_task_request ->
        (get_maintenance_window_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the details of a maintenance window task.
    
     For maintenance window tasks without a specified target, you can't supply values for [--max-errors] and [--max-concurrency]. Instead, the system inserts a placeholder value of [1], which may be reported in the response to this command. These values don't affect the running of your task and can be ignored.
     
      To retrieve a list of tasks in a maintenance window, instead use the [DescribeMaintenanceWindowTasks] command.
       *)

  
end

module GetOpsItem : sig
  val request :
    Smaws_Lib.Context.t ->
      get_ops_item_request ->
        (get_ops_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemAccessDeniedException of ops_item_access_denied_exception
            | `OpsItemNotFoundException of ops_item_not_found_exception
            
        ]
      ) result
  (** 
    Get information about an OpsItem by using the ID. You must have permission in Identity and Access Management (IAM) to view information about an OpsItem. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
    
     Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  
end

module GetOpsMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      get_ops_metadata_request ->
        (get_ops_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
            | `OpsMetadataNotFoundException of ops_metadata_not_found_exception
            
        ]
      ) result
  (** 
    View operational metadata related to an application in Application Manager.
     *)

  
end

module GetOpsSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_ops_summary_request ->
        (get_ops_summary_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidAggregatorException of invalid_aggregator_exception
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            | `InvalidTypeNameException of invalid_type_name_exception
            | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
            
        ]
      ) result
  (** 
    View a summary of operations metadata (OpsData) based on specified filters and aggregators. OpsData can include information about Amazon Web Services Systems Manager OpsCenter operational workitems (OpsItems) as well as information about any Amazon Web Services resource or service configured to report OpsData to Amazon Web Services Systems Manager Explorer.
     *)

  
end

module GetParameter : sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameter_request ->
        (get_parameter_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidKeyId of invalid_key_id
            | `ParameterNotFound of parameter_not_found
            | `ParameterVersionNotFound of parameter_version_not_found
            
        ]
      ) result
  (** 
    Get information about a single parameter by specifying the parameter name.
    
     To get information about more than one parameter at a time, use the [GetParameters] operation.
     
      *)

  
end

module GetParameterHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameter_history_request ->
        (get_parameter_history_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidKeyId of invalid_key_id
            | `InvalidNextToken of invalid_next_token
            | `ParameterNotFound of parameter_not_found
            
        ]
      ) result
  (** 
    Retrieves the history of all changes to a parameter.
    
     If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must also update the key alias the parameter uses to reference KMS. Otherwise, [GetParameterHistory] retrieves whatever the original key alias was referencing.
     
      *)

  
end

module GetParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameters_request ->
        (get_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidKeyId of invalid_key_id
            
        ]
      ) result
  (** 
    Get information about one or more parameters by specifying multiple parameter names.
    
     To get information about a single parameter, you can use the [GetParameter] operation instead.
     
      *)

  
end

module GetParametersByPath : sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameters_by_path_request ->
        (get_parameters_by_path_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidFilterOption of invalid_filter_option
            | `InvalidFilterValue of invalid_filter_value
            | `InvalidKeyId of invalid_key_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieve information about one or more parameters in a specific hierarchy.
    
     Request results are returned on a best-effort basis. If you specify [MaxResults] in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of [MaxResults]. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a [NextToken]. You can specify the [NextToken] in a subsequent call to get the next set of results.
      *)

  
end

module GetPatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      get_patch_baseline_request ->
        (get_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            
        ]
      ) result
  (** 
    Retrieves information about a patch baseline.
     *)

  
end

module GetPatchBaselineForPatchGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      get_patch_baseline_for_patch_group_request ->
        (get_patch_baseline_for_patch_group_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the patch baseline that should be used for the specified patch group.
     *)

  
end

module GetResourcePolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_policies_request ->
        (get_resource_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
            
        ]
      ) result
  (** 
    Returns an array of the [Policy] object.
     *)

  
end

module GetServiceSetting : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_setting_request ->
        (get_service_setting_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ServiceSettingNotFound of service_setting_not_found
            
        ]
      ) result
  (** 
    [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of [false]. This means the user can't use this feature unless they change the setting to [true] and intentionally opt in for a paid feature.
    
     Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [UpdateServiceSetting] API operation to change the default setting. Or use the [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web Services service team.
     
      Query the current service setting for the Amazon Web Services account.
       *)

  
end

module LabelParameterVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      label_parameter_version_request ->
        (label_parameter_version_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ParameterNotFound of parameter_not_found
            | `ParameterVersionLabelLimitExceeded of parameter_version_label_limit_exceeded
            | `ParameterVersionNotFound of parameter_version_not_found
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  [@@ocaml.doc {| 
    A parameter label is a user-defined alias to help you manage different versions of a parameter. When you modify a parameter, Amazon Web Services Systems Manager automatically saves a new version and increments the version number by one. A label can help you remember the purpose of a parameter when there are multiple versions.
    
     Parameter labels have the following requirements and restrictions.
     
      {ul
           {- A version of a parameter can have a maximum of 10 labels.
              
              }
            {- You can't attach the same label to different versions of the same parameter. For example, if version 1 has the label Production, then you can't attach Production to version 2.
               
               }
            {- You can move a label from one version of a parameter to another.
               
               }
            {- You can't create a label when you create a new parameter. You must attach a label to a specific version of a parameter.
               
               }
            {- If you no longer want to use a parameter label, then you can either delete it or move it to a different version of a parameter.
               
               }
            {- A label can have a maximum of 100 characters.
               
               }
            {- Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores (_).
               
               }
            {- Labels can't begin with a number, "[aws]" or "[ssm]" (not case sensitive). If a label fails to meet these requirements, then the label isn't associated with a parameter and the system displays it in the list of InvalidLabels.
               
               }
           
      }
       |}]

  
end

module ListAssociationVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_association_versions_request ->
        (list_association_versions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieves all versions of an association for a specific association ID.
     *)

  
end

module ListAssociations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_associations_request ->
        (list_associations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Returns all State Manager associations in the current Amazon Web Services account and Amazon Web Services Region. You can limit the results to a specific State Manager association document or managed node by specifying a filter. State Manager is a capability of Amazon Web Services Systems Manager.
     *)

  
end

module ListCommandInvocations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_command_invocations_request ->
        (list_command_invocations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidCommandId of invalid_command_id
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    An invocation is copy of a command sent to a specific managed node. A command can apply to one or more managed nodes. A command invocation applies to one managed node. For example, if a user runs [SendCommand] against three managed nodes, then a command invocation is created for each requested managed node ID. [ListCommandInvocations] provide status about command execution.
     *)

  
end

module ListCommands : sig
  val request :
    Smaws_Lib.Context.t ->
      list_commands_request ->
        (list_commands_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidCommandId of invalid_command_id
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Lists the commands requested by users of the Amazon Web Services account.
     *)

  
end

module ListComplianceItems : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_items_request ->
        (list_compliance_items_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            | `InvalidResourceId of invalid_resource_id
            | `InvalidResourceType of invalid_resource_type
            
        ]
      ) result
  (** 
    For a specified resource ID, this API operation returns a list of compliance statuses for different resource types. Currently, you can only specify one resource ID per call. List results depend on the criteria specified in the filter.
     *)

  
end

module ListComplianceSummaries : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_summaries_request ->
        (list_compliance_summaries_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Returns a summary count of compliant and non-compliant resources for a compliance type. For example, this call can return State Manager associations, patches, or custom compliance types according to the filter criteria that you specify.
     *)

  
end

module ListDocumentMetadataHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      list_document_metadata_history_request ->
        (list_document_metadata_history_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Information about approval reviews for a version of a change template in Change Manager.
     *)

  
end

module ListDocumentVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_document_versions_request ->
        (list_document_versions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    List all versions for a document.
     *)

  
end

module ListDocuments : sig
  val request :
    Smaws_Lib.Context.t ->
      list_documents_request ->
        (list_documents_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Returns all Systems Manager (SSM) documents in the current Amazon Web Services account and Amazon Web Services Region. You can limit the results of this request by using a filter.
     *)

  
end

module ListInventoryEntries : sig
  val request :
    Smaws_Lib.Context.t ->
      list_inventory_entries_request ->
        (list_inventory_entries_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            | `InvalidTypeNameException of invalid_type_name_exception
            
        ]
      ) result
  (** 
    A list of inventory items returned by the request.
     *)

  
end

module ListOpsItemEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ops_item_events_request ->
        (list_ops_item_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
            | `OpsItemNotFoundException of ops_item_not_found_exception
            
        ]
      ) result
  (** 
    Returns a list of all OpsItem events in the current Amazon Web Services Region and Amazon Web Services account. You can limit the results to events associated with specific OpsItems by specifying a filter.
     *)

  
end

module ListOpsItemRelatedItems : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ops_item_related_items_request ->
        (list_ops_item_related_items_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            
        ]
      ) result
  (** 
    Lists all related-item resources associated with a Systems Manager OpsCenter OpsItem. OpsCenter is a capability of Amazon Web Services Systems Manager.
     *)

  
end

module ListOpsMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ops_metadata_request ->
        (list_ops_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
            
        ]
      ) result
  (** 
    Amazon Web Services Systems Manager calls this API operation when displaying all Application Manager OpsMetadata objects or blobs.
     *)

  
end

module ListResourceComplianceSummaries : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_compliance_summaries_request ->
        (list_resource_compliance_summaries_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Returns a resource-level summary count. The summary includes information about compliant and non-compliant statuses and detailed compliance-item severity counts, according to the filter criteria you specify.
     *)

  
end

module ListResourceDataSync : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_data_sync_request ->
        (list_resource_data_sync_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            | `ResourceDataSyncInvalidConfigurationException of resource_data_sync_invalid_configuration_exception
            
        ]
      ) result
  (** 
    Lists your resource data sync configurations. Includes information about the last time a sync attempted to start, the last sync status, and the last time a sync successfully completed.
    
     The number of sync configurations might be too large to return using a single call to [ListResourceDataSync]. You can limit the number of sync configurations returned by using the [MaxResults] parameter. To determine whether there are more sync configurations to list, check the value of [NextToken] in the output. If there are more sync configurations to list, you can request them by specifying the [NextToken] returned in the call to the parameter of a subsequent call.
      *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            | `InvalidResourceType of invalid_resource_type
            
        ]
      ) result
  (** 
    Returns a list of the tags assigned to the specified resource.
    
     For information about the ID format for each supported resource type, see [AddTagsToResource].
      *)

  
end

module ModifyDocumentPermission : sig
  val request :
    Smaws_Lib.Context.t ->
      modify_document_permission_request ->
        (modify_document_permission_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DocumentLimitExceeded of document_limit_exceeded
            | `DocumentPermissionLimit of document_permission_limit
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidPermissionType of invalid_permission_type
            
        ]
      ) result
  (** 
    Shares a Amazon Web Services Systems Manager document (SSM document)publicly or privately. If you share a document privately, you must specify the Amazon Web Services user IDs for those people who can use the document. If you share a document publicly, you must specify {i All} as the account ID.
     *)

  
end

module PutComplianceItems : sig
  val request :
    Smaws_Lib.Context.t ->
      put_compliance_items_request ->
        (put_compliance_items_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ComplianceTypeCountLimitExceededException of compliance_type_count_limit_exceeded_exception
            | `InternalServerError of internal_server_error
            | `InvalidItemContentException of invalid_item_content_exception
            | `InvalidResourceId of invalid_resource_id
            | `InvalidResourceType of invalid_resource_type
            | `ItemSizeLimitExceededException of item_size_limit_exceeded_exception
            | `TotalSizeLimitExceededException of total_size_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Registers a compliance type and other compliance details on a designated resource. This operation lets you register custom compliance details with a resource. This call overwrites existing compliance information on the resource, so you must provide a full list of compliance items each time that you send the request.
    
     ComplianceType can be one of the following:
     
      {ul
           {- ExecutionId: The execution ID when the patch, association, or custom compliance item was applied.
              
              }
            {- ExecutionType: Specify patch, association, or Custom:[string].
               
               }
            {- ExecutionTime. The time the patch, association, or custom compliance item was applied to the managed node.
               
               }
            {- Id: The patch, association, or custom compliance ID.
               
               }
            {- Title: A title.
               
               }
            {- Status: The status of the compliance item. For example, [approved] for patches, or [Failed] for associations.
               
               }
            {- Severity: A patch severity. For example, [Critical].
               
               }
            {- DocumentName: An SSM document name. For example, [AWS-RunPatchBaseline].
               
               }
            {- DocumentVersion: An SSM document version number. For example, 4.
               
               }
            {- Classification: A patch classification. For example, [security updates].
               
               }
            {- PatchBaselineId: A patch baseline ID.
               
               }
            {- PatchSeverity: A patch severity. For example, [Critical].
               
               }
            {- PatchState: A patch state. For example, [InstancesWithFailedPatches].
               
               }
            {- PatchGroup: The name of a patch group.
               
               }
            {- InstalledTime: The time the association, patch, or custom compliance item was applied to the resource. Specify the time by using the following format: [yyyy-MM-dd'T'HH:mm:ss'Z']
               
               }
           
      }
       *)

  
end

module PutInventory : sig
  val request :
    Smaws_Lib.Context.t ->
      put_inventory_request ->
        (put_inventory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CustomSchemaCountLimitExceededException of custom_schema_count_limit_exceeded_exception
            | `InternalServerError of internal_server_error
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidInventoryItemContextException of invalid_inventory_item_context_exception
            | `InvalidItemContentException of invalid_item_content_exception
            | `InvalidTypeNameException of invalid_type_name_exception
            | `ItemContentMismatchException of item_content_mismatch_exception
            | `ItemSizeLimitExceededException of item_size_limit_exceeded_exception
            | `SubTypeCountLimitExceededException of sub_type_count_limit_exceeded_exception
            | `TotalSizeLimitExceededException of total_size_limit_exceeded_exception
            | `UnsupportedInventoryItemContextException of unsupported_inventory_item_context_exception
            | `UnsupportedInventorySchemaVersionException of unsupported_inventory_schema_version_exception
            
        ]
      ) result
  (** 
    Bulk update custom inventory items on one or more managed nodes. The request adds an inventory item, if it doesn't already exist, or updates an inventory item, if it does exist.
     *)

  
end

module PutParameter : sig
  val request :
    Smaws_Lib.Context.t ->
      put_parameter_request ->
        (put_parameter_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `HierarchyLevelLimitExceededException of hierarchy_level_limit_exceeded_exception
            | `HierarchyTypeMismatchException of hierarchy_type_mismatch_exception
            | `IncompatiblePolicyException of incompatible_policy_exception
            | `InternalServerError of internal_server_error
            | `InvalidAllowedPatternException of invalid_allowed_pattern_exception
            | `InvalidKeyId of invalid_key_id
            | `InvalidPolicyAttributeException of invalid_policy_attribute_exception
            | `InvalidPolicyTypeException of invalid_policy_type_exception
            | `ParameterAlreadyExists of parameter_already_exists
            | `ParameterLimitExceeded of parameter_limit_exceeded
            | `ParameterMaxVersionLimitExceeded of parameter_max_version_limit_exceeded
            | `ParameterPatternMismatchException of parameter_pattern_mismatch_exception
            | `PoliciesLimitExceededException of policies_limit_exceeded_exception
            | `TooManyUpdates of too_many_updates
            | `UnsupportedParameterType of unsupported_parameter_type
            
        ]
      ) result
  (** 
    Add a parameter to the system.
     *)

  
end

module PutResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_request ->
        (put_resource_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `MalformedResourcePolicyDocumentException of malformed_resource_policy_document_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyConflictException of resource_policy_conflict_exception
            | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
            | `ResourcePolicyLimitExceededException of resource_policy_limit_exceeded_exception
            | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
            
        ]
      ) result
  (** 
    Creates or updates a Systems Manager resource policy. A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. The following resources support Systems Manager resource policies.
    
     {ul
          {- [OpsItemGroup] - The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).
             
             }
           {- [Parameter] - The resource policy is used to share a parameter with other accounts using Resource Access Manager (RAM).
              
               To share a parameter, it must be in the advanced parameter tier. For information about parameter tiers, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html}Managing parameter tiers}. For information about changing an existing standard parameter to an advanced parameter, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html#parameter-store-advanced-parameters-enabling}Changing a standard parameter to an advanced parameter}.
               
                To share a [SecureString] parameter, it must be encrypted with a customer managed key, and you must share the key separately through Key Management Service. Amazon Web Services managed keys cannot be shared. Parameters encrypted with the default Amazon Web Services managed key can be updated to use a customer managed key instead. For KMS key definitions, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html}KMS concepts} in the {i Key Management Service Developer Guide}.
                
                 While you can share a parameter using the Systems Manager [PutResourcePolicy] operation, we recommend using Resource Access Manager (RAM) instead. This is because using [PutResourcePolicy] requires the extra step of promoting the parameter to a standard RAM Resource Share using the RAM {{:https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html}PromoteResourceShareCreatedFromPolicy} API operation. Otherwise, the parameter won't be returned by the Systems Manager {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_DescribeParameters.html}DescribeParameters} API operation using the [--shared] option.
                 
                  For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html#share}Sharing a parameter} in the {i Amazon Web Services Systems Manager User Guide}
                  
                  }
          
      }
       *)

  
end

module RegisterDefaultPatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      register_default_patch_baseline_request ->
        (register_default_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            
        ]
      ) result
  (** 
    Defines the default patch baseline for the relevant operating system.
    
     To reset the Amazon Web Services-predefined patch baseline as the default, specify the full patch baseline Amazon Resource Name (ARN) as the baseline ID value. For example, for CentOS, specify [arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed] instead of [pb-0574b43a65ea646ed].
      *)

  
end

module RegisterPatchBaselineForPatchGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      register_patch_baseline_for_patch_group_request ->
        (register_patch_baseline_for_patch_group_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AlreadyExistsException of already_exists_exception
            | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            | `ResourceLimitExceededException of resource_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Registers a patch baseline for a patch group.
     *)

  
end

module RegisterTargetWithMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      register_target_with_maintenance_window_request ->
        (register_target_with_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `ResourceLimitExceededException of resource_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Registers a target with a maintenance window.
     *)

  
end

module RegisterTaskWithMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      register_task_with_maintenance_window_request ->
        (register_task_with_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `FeatureNotAvailableException of feature_not_available_exception
            | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `ResourceLimitExceededException of resource_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Adds a new task to a maintenance window.
     *)

  
end

module RemoveTagsFromResource : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_resource_request ->
        (remove_tags_from_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            | `InvalidResourceType of invalid_resource_type
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Removes tag keys from the specified resource.
     *)

  
end

module ResetServiceSetting : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_service_setting_request ->
        (reset_service_setting_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ServiceSettingNotFound of service_setting_not_found
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  [@@ocaml.doc {| 
    [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.
    
     Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [GetServiceSetting] API operation to view the current value. Use the [UpdateServiceSetting] API operation to change the default setting.
     
      Reset the service setting for the account to the default value as provisioned by the Amazon Web Services service team.
       |}]

  
end

module ResumeSession : sig
  val request :
    Smaws_Lib.Context.t ->
      resume_session_request ->
        (resume_session_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Reconnects a session to a managed node after it has been disconnected. Connections can be resumed for disconnected sessions, but not terminated sessions.
    
     This command is primarily for use by client machines to automatically reconnect during intermittent network issues. It isn't intended for any other use.
     
      *)

  
end

module SendAutomationSignal : sig
  val request :
    Smaws_Lib.Context.t ->
      send_automation_signal_request ->
        (send_automation_signal_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
            | `AutomationStepNotFoundException of automation_step_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidAutomationSignalException of invalid_automation_signal_exception
            
        ]
      ) result
  (** 
    Sends a signal to an Automation execution to change the current behavior or status of the execution.
     *)

  
end

module SendCommand : sig
  val request :
    Smaws_Lib.Context.t ->
      send_command_request ->
        (send_command_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateInstanceId of duplicate_instance_id
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNotificationConfig of invalid_notification_config
            | `InvalidOutputFolder of invalid_output_folder
            | `InvalidParameters of invalid_parameters
            | `InvalidRole of invalid_role
            | `MaxDocumentSizeExceeded of max_document_size_exceeded
            | `UnsupportedPlatformType of unsupported_platform_type
            
        ]
      ) result
  (** 
    Runs commands on one or more managed nodes.
     *)

  
end

module StartAssociationsOnce : sig
  val request :
    Smaws_Lib.Context.t ->
      start_associations_once_request ->
        (start_associations_once_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InvalidAssociation of invalid_association
            
        ]
      ) result
  (** 
    Runs an association immediately and only one time. This operation can be helpful when troubleshooting associations.
     *)

  
end

module StartAutomationExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_automation_execution_request ->
        (start_automation_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationDefinitionNotFoundException of automation_definition_not_found_exception
            | `AutomationDefinitionVersionNotFoundException of automation_definition_version_not_found_exception
            | `AutomationExecutionLimitExceededException of automation_execution_limit_exceeded_exception
            | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `InvalidAutomationExecutionParametersException of invalid_automation_execution_parameters_exception
            | `InvalidTarget of invalid_target
            
        ]
      ) result
  (** 
    Initiates execution of an Automation runbook.
     *)

  
end

module StartChangeRequestExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_change_request_execution_request ->
        (start_change_request_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationDefinitionNotApprovedException of automation_definition_not_approved_exception
            | `AutomationDefinitionNotFoundException of automation_definition_not_found_exception
            | `AutomationDefinitionVersionNotFoundException of automation_definition_version_not_found_exception
            | `AutomationExecutionLimitExceededException of automation_execution_limit_exceeded_exception
            | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `InvalidAutomationExecutionParametersException of invalid_automation_execution_parameters_exception
            
        ]
      ) result
  (** 
    Creates a change request for Change Manager. The Automation runbooks specified in the change request run only after all required approvals for the change request have been received.
     *)

  
end

module StartSession : sig
  val request :
    Smaws_Lib.Context.t ->
      start_session_request ->
        (start_session_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `TargetNotConnected of target_not_connected
            
        ]
      ) result
  (** 
    Initiates a connection to a target (for example, a managed node) for a Session Manager session. Returns a URL and token that can be used to open a WebSocket connection for sending input and receiving outputs.
    
     Amazon Web Services CLI usage: [start-session] is an interactive command that requires the Session Manager plugin to be installed on the client machine making the call. For information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html}Install the Session Manager plugin for the Amazon Web Services CLI} in the {i Amazon Web Services Systems Manager User Guide}.
     
      Amazon Web Services Tools for PowerShell usage: Start-SSMSession isn't currently supported by Amazon Web Services Tools for PowerShell on Windows local machines.
      
       *)

  
end

module StopAutomationExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_automation_execution_request ->
        (stop_automation_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidAutomationStatusUpdateException of invalid_automation_status_update_exception
            
        ]
      ) result
  (** 
    Stop an Automation that is currently running.
     *)

  
end

module TerminateSession : sig
  val request :
    Smaws_Lib.Context.t ->
      terminate_session_request ->
        (terminate_session_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Permanently ends a session and closes the data connection between the Session Manager client and SSM Agent on the managed node. A terminated session can't be resumed.
     *)

  
end

module UnlabelParameterVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      unlabel_parameter_version_request ->
        (unlabel_parameter_version_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ParameterNotFound of parameter_not_found
            | `ParameterVersionNotFound of parameter_version_not_found
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Remove a label or labels from a parameter.
     *)

  
end

module UpdateAssociation : sig
  val request :
    Smaws_Lib.Context.t ->
      update_association_request ->
        (update_association_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `AssociationVersionLimitExceeded of association_version_limit_exceeded
            | `InternalServerError of internal_server_error
            | `InvalidAssociationVersion of invalid_association_version
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            | `InvalidOutputLocation of invalid_output_location
            | `InvalidParameters of invalid_parameters
            | `InvalidSchedule of invalid_schedule
            | `InvalidTarget of invalid_target
            | `InvalidTargetMaps of invalid_target_maps
            | `InvalidUpdate of invalid_update
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Updates an association. You can update the association name and version, the document version, schedule, parameters, and Amazon Simple Storage Service (Amazon S3) output. When you call [UpdateAssociation], the system removes all optional parameters from the request and overwrites the association with null values for those parameters. This is by design. You must specify all optional parameters in the call, even if you are not changing the parameters. This includes the [Name] parameter. Before calling this API action, we recommend that you call the [DescribeAssociation] API operation and make a note of all optional parameters required for your [UpdateAssociation] call.
    
     In order to call this API operation, a user, group, or role must be granted permission to call the [DescribeAssociation] API operation. If you don't have permission to call [DescribeAssociation], then you receive the following error: 
     {[
     An error occurred (AccessDeniedException) when calling the UpdateAssociation operation: User: isn't authorized to perform: ssm:DescribeAssociation on resource: 
     ]}
     
     
      When you update an association, the association immediately runs against the specified targets. You can add the [ApplyOnlyAtCronInterval] parameter to run the association during the next schedule run.
      
       *)

  
end

module UpdateAssociationStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      update_association_status_request ->
        (update_association_status_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidInstanceId of invalid_instance_id
            | `StatusUnchanged of status_unchanged
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Updates the status of the Amazon Web Services Systems Manager document (SSM document) associated with the specified managed node.
    
     [UpdateAssociationStatus] is primarily used by the Amazon Web Services Systems Manager Agent (SSM Agent) to report status updates about your associations and is only used for associations created with the [InstanceId] legacy parameter.
      *)

  
end

module UpdateDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      update_document_request ->
        (update_document_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DocumentVersionLimitExceeded of document_version_limit_exceeded
            | `DuplicateDocumentContent of duplicate_document_content
            | `DuplicateDocumentVersionName of duplicate_document_version_name
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentContent of invalid_document_content
            | `InvalidDocumentOperation of invalid_document_operation
            | `InvalidDocumentSchemaVersion of invalid_document_schema_version
            | `InvalidDocumentVersion of invalid_document_version
            | `MaxDocumentSizeExceeded of max_document_size_exceeded
            
        ]
      ) result
  (** 
    Updates one or more values for an SSM document.
     *)

  
end

module UpdateDocumentDefaultVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      update_document_default_version_request ->
        (update_document_default_version_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentSchemaVersion of invalid_document_schema_version
            | `InvalidDocumentVersion of invalid_document_version
            
        ]
      ) result
  (** 
    Set the default version of a document.
    
     If you change a document version for a State Manager association, Systems Manager immediately runs the association unless you previously specifed the [apply-only-at-cron-interval] parameter.
     
      *)

  
end

module UpdateDocumentMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      update_document_metadata_request ->
        (update_document_metadata_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentOperation of invalid_document_operation
            | `InvalidDocumentVersion of invalid_document_version
            
        ]
      ) result
  (** 
    Updates information related to approval reviews for a specific version of a change template in Change Manager.
     *)

  
end

module UpdateMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      update_maintenance_window_request ->
        (update_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Updates an existing maintenance window. Only specified parameters are modified.
    
     The value you specify for [Duration] determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for [Cutoff]. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for [Cutoff] is one hour, no maintenance window tasks can start after 5 PM.
     
      *)

  
end

module UpdateMaintenanceWindowTarget : sig
  val request :
    Smaws_Lib.Context.t ->
      update_maintenance_window_target_request ->
        (update_maintenance_window_target_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Modifies the target of an existing maintenance window. You can change the following:
    
     {ul
          {- Name
             
             }
           {- Description
              
              }
           {- Owner
              
              }
           {- IDs for an ID target
              
              }
           {- Tags for a Tag target
              
              }
           {- From any supported tag type to another. The three supported tag types are ID target, Tag target, and resource group. For more information, see [Target].
              
              }
          
      }
       If a parameter is null, then the corresponding field isn't modified.
       
        *)

  
end

module UpdateMaintenanceWindowTask : sig
  val request :
    Smaws_Lib.Context.t ->
      update_maintenance_window_task_request ->
        (update_maintenance_window_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Modifies a task assigned to a maintenance window. You can't change the task type, but you can change the following values:
    
     {ul
          {- [TaskARN]. For example, you can change a [RUN_COMMAND] task from [AWS-RunPowerShellScript] to [AWS-RunShellScript].
             
             }
           {- [ServiceRoleArn]
              
              }
           {- [TaskInvocationParameters]
              
              }
           {- [Priority]
              
              }
           {- [MaxConcurrency]
              
              }
           {- [MaxErrors]
              
              }
          
      }
       One or more targets must be specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional for other maintenance window task types (Automation, Lambda, and Step Functions). For more information about running tasks that don't specify targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User Guide}.
       
        If the value for a parameter in [UpdateMaintenanceWindowTask] is null, then the corresponding field isn't modified. If you set [Replace] to true, then all fields required by the [RegisterTaskWithMaintenanceWindow] operation are required for this request. Optional fields that aren't specified are set to null.
        
         When you update a maintenance window task that has options specified in [TaskInvocationParameters], you must provide again all the [TaskInvocationParameters] values that you want to retain. The values you don't specify again are removed. For example, suppose that when you registered a Run Command task, you specified [TaskInvocationParameters] values for [Comment], [NotificationConfig], and [OutputS3BucketName]. If you update the maintenance window task and specify only a different [OutputS3BucketName] value, the values for [Comment] and [NotificationConfig] are removed.
         
          *)

  
end

module UpdateManagedInstanceRole : sig
  val request :
    Smaws_Lib.Context.t ->
      update_managed_instance_role_request ->
        (update_managed_instance_role_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidInstanceId of invalid_instance_id
            
        ]
      ) result
  (** 
    Changes the Identity and Access Management (IAM) role that is assigned to the on-premises server, edge device, or virtual machines (VM). IAM roles are first assigned to these hybrid nodes during the activation process. For more information, see [CreateActivation].
     *)

  
end

module UpdateOpsItem : sig
  val request :
    Smaws_Lib.Context.t ->
      update_ops_item_request ->
        (update_ops_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemAccessDeniedException of ops_item_access_denied_exception
            | `OpsItemAlreadyExistsException of ops_item_already_exists_exception
            | `OpsItemConflictException of ops_item_conflict_exception
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
            | `OpsItemNotFoundException of ops_item_not_found_exception
            
        ]
      ) result
  (** 
    Edit or change an OpsItem. You must have permission in Identity and Access Management (IAM) to update an OpsItem. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
    
     Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  
end

module UpdateOpsMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      update_ops_metadata_request ->
        (update_ops_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
            | `OpsMetadataKeyLimitExceededException of ops_metadata_key_limit_exceeded_exception
            | `OpsMetadataNotFoundException of ops_metadata_not_found_exception
            | `OpsMetadataTooManyUpdatesException of ops_metadata_too_many_updates_exception
            
        ]
      ) result
  (** 
    Amazon Web Services Systems Manager calls this API operation when you edit OpsMetadata in Application Manager.
     *)

  
end

module UpdatePatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      update_patch_baseline_request ->
        (update_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Modifies an existing patch baseline. Fields not specified in the request are left unchanged.
    
     For information about valid key-value pairs in [PatchFilters] for each supported operating system type, see [PatchFilter].
     
      *)

  
end

module UpdateResourceDataSync : sig
  val request :
    Smaws_Lib.Context.t ->
      update_resource_data_sync_request ->
        (update_resource_data_sync_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceDataSyncConflictException of resource_data_sync_conflict_exception
            | `ResourceDataSyncInvalidConfigurationException of resource_data_sync_invalid_configuration_exception
            | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
            
        ]
      ) result
  (** 
    Update a resource data sync. After you create a resource data sync for a Region, you can't change the account options for that sync. For example, if you create a sync in the us-east-2 (Ohio) Region and you choose the [Include only the current account] option, you can't edit that sync later and choose the [Include all accounts from my Organizations
    configuration] option. Instead, you must delete the first resource data sync, and create a new one.
    
     This API operation only supports a resource data sync that was created with a SyncFromSource [SyncType].
     
      *)

  
end

module UpdateServiceSetting : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_setting_request ->
        (update_service_setting_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ServiceSettingNotFound of service_setting_not_found
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  [@@ocaml.doc {| 
    [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.
    
     Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [GetServiceSetting] API operation to view the current value. Or, use the [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web Services service team.
     
      Update the service setting for the account.
       |}]

  
end

