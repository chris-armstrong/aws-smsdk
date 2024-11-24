open Types 
module ActivateEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      activate_event_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidStateException of invalid_state_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CancelReplay : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_replay_request ->
        (cancel_replay_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `IllegalStatusException of illegal_status_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      create_api_destination_request ->
        (create_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      create_archive_request ->
        (create_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_request ->
        (create_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
end

module CreateEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      create_endpoint_request ->
        (create_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
end

module CreateEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      create_event_bus_request ->
        (create_event_bus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidStateException of invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreatePartnerEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      create_partner_event_source_request ->
        (create_partner_event_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
end

module DeactivateEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      deactivate_event_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidStateException of invalid_state_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeauthorizeConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      deauthorize_connection_request ->
        (deauthorize_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_api_destination_request ->
        (delete_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_archive_request ->
        (delete_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_request ->
        (delete_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_endpoint_request ->
        (delete_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_event_bus_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            
        ]
      ) result
end

module DeletePartnerEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_partner_event_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
end

module DeleteRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_api_destination_request ->
        (describe_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_archive_request ->
        (describe_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_connection_request ->
        (describe_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_endpoint_request ->
        (describe_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_bus_request ->
        (describe_event_bus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_source_request ->
        (describe_event_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribePartnerEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_partner_event_source_request ->
        (describe_partner_event_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeReplay : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_replay_request ->
        (describe_replay_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeRule : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_rule_request ->
        (describe_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisableRule : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module EnableRule : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListApiDestinations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_api_destinations_request ->
        (list_api_destinations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module ListArchives : sig
  val request :
    Smaws_Lib.Context.t ->
      list_archives_request ->
        (list_archives_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_request ->
        (list_connections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module ListEndpoints : sig
  val request :
    Smaws_Lib.Context.t ->
      list_endpoints_request ->
        (list_endpoints_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module ListEventBuses : sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_buses_request ->
        (list_event_buses_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module ListEventSources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_sources_request ->
        (list_event_sources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
end

module ListPartnerEventSourceAccounts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_partner_event_source_accounts_request ->
        (list_partner_event_source_accounts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListPartnerEventSources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_partner_event_sources_request ->
        (list_partner_event_sources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
end

module ListReplays : sig
  val request :
    Smaws_Lib.Context.t ->
      list_replays_request ->
        (list_replays_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module ListRuleNamesByTarget : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_names_by_target_request ->
        (list_rule_names_by_target_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rules_request ->
        (list_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListTargetsByRule : sig
  val request :
    Smaws_Lib.Context.t ->
      list_targets_by_rule_request ->
        (list_targets_by_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      put_events_request ->
        (put_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module PutPartnerEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      put_partner_events_request ->
        (put_partner_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
end

module PutPermission : sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `PolicyLengthExceededException of policy_length_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutRule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_rule_request ->
        (put_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutTargets : sig
  val request :
    Smaws_Lib.Context.t ->
      put_targets_request ->
        (put_targets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RemovePermission : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RemoveTargets : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_targets_request ->
        (remove_targets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module StartReplay : sig
  val request :
    Smaws_Lib.Context.t ->
      start_replay_request ->
        (start_replay_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TestEventPattern : sig
  val request :
    Smaws_Lib.Context.t ->
      test_event_pattern_request ->
        (test_event_pattern_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      update_api_destination_request ->
        (update_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      update_archive_request ->
        (update_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      update_connection_request ->
        (update_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      update_endpoint_request ->
        (update_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      update_event_bus_request ->
        (update_event_bus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

