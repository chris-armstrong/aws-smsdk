open Types 
module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_input ->
        (create_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module CreateHost : sig
  val request :
    Smaws_Lib.Context.t ->
      create_host_input ->
        (create_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module CreateRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      create_repository_link_input ->
        (create_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module CreateSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_sync_configuration_input ->
        (create_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_input ->
        (delete_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteHost : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_host_input ->
        (delete_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module DeleteRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_repository_link_input ->
        (delete_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `SyncConfigurationStillExistsException of sync_configuration_still_exists_exception
            | `ThrottlingException of throttling_exception
            | `UnsupportedProviderTypeException of unsupported_provider_type_exception
            
        ]
      ) result
end

module DeleteSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_sync_configuration_input ->
        (delete_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      get_connection_input ->
        (get_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module GetHost : sig
  val request :
    Smaws_Lib.Context.t ->
      get_host_input ->
        (get_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module GetRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_link_input ->
        (get_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetRepositorySyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_sync_status_input ->
        (get_repository_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetResourceSyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_sync_status_input ->
        (get_resource_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetSyncBlockerSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sync_blocker_summary_input ->
        (get_sync_blocker_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sync_configuration_input ->
        (get_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_input ->
        (list_connections_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListHosts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_hosts_input ->
        (list_hosts_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
end

module ListRepositoryLinks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repository_links_input ->
        (list_repository_links_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListRepositorySyncDefinitions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repository_sync_definitions_input ->
        (list_repository_sync_definitions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListSyncConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_sync_configurations_input ->
        (list_sync_configurations_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateHost : sig
  val request :
    Smaws_Lib.Context.t ->
      update_host_input ->
        (update_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      update_repository_link_input ->
        (update_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `UpdateOutOfSyncException of update_out_of_sync_exception
            
        ]
      ) result
end

module UpdateSyncBlocker : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sync_blocker_input ->
        (update_sync_blocker_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `RetryLatestCommitFailedException of retry_latest_commit_failed_exception
            | `SyncBlockerDoesNotExistException of sync_blocker_does_not_exist_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module UpdateSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sync_configuration_input ->
        (update_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `UpdateOutOfSyncException of update_out_of_sync_exception
            
        ]
      ) result
end

