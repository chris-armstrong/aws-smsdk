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
end

