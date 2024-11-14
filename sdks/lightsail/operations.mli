open Types 
module UpdateRelationalDatabaseParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      update_relational_database_parameters_request ->
        (update_relational_database_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UpdateRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      update_relational_database_request ->
        (update_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UpdateLoadBalancerAttribute : sig
  val request :
    Smaws_Lib.Context.t ->
      update_load_balancer_attribute_request ->
        (update_load_balancer_attribute_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UpdateInstanceMetadataOptions : sig
  val request :
    Smaws_Lib.Context.t ->
      update_instance_metadata_options_request ->
        (update_instance_metadata_options_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UpdateDomainEntry : sig
  val request :
    Smaws_Lib.Context.t ->
      update_domain_entry_request ->
        (update_domain_entry_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UpdateDistributionBundle : sig
  val request :
    Smaws_Lib.Context.t ->
      update_distribution_bundle_request ->
        (update_distribution_bundle_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UpdateDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      update_distribution_request ->
        (update_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UpdateContainerService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_container_service_request ->
        (update_container_service_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UpdateBucketBundle : sig
  val request :
    Smaws_Lib.Context.t ->
      update_bucket_bundle_request ->
        (update_bucket_bundle_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UpdateBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      update_bucket_request ->
        (update_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module UnpeerVpc : sig
  val request :
    Smaws_Lib.Context.t ->
      unpeer_vpc_request ->
        (unpeer_vpc_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module TestAlarm : sig
  val request :
    Smaws_Lib.Context.t ->
      test_alarm_request ->
        (test_alarm_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module StopRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_relational_database_request ->
        (stop_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module StopInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_instance_request ->
        (stop_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module StopGUISession : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_gui_session_request ->
        (stop_gui_session_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module StartRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      start_relational_database_request ->
        (start_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module StartInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      start_instance_request ->
        (start_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module StartGUISession : sig
  val request :
    Smaws_Lib.Context.t ->
      start_gui_session_request ->
        (start_gui_session_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module SetupInstanceHttps : sig
  val request :
    Smaws_Lib.Context.t ->
      setup_instance_https_request ->
        (setup_instance_https_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module SetResourceAccessForBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      set_resource_access_for_bucket_request ->
        (set_resource_access_for_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module SetIpAddressType : sig
  val request :
    Smaws_Lib.Context.t ->
      set_ip_address_type_request ->
        (set_ip_address_type_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module SendContactMethodVerification : sig
  val request :
    Smaws_Lib.Context.t ->
      send_contact_method_verification_request ->
        (send_contact_method_verification_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module ResetDistributionCache : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_distribution_cache_request ->
        (reset_distribution_cache_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module ReleaseStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      release_static_ip_request ->
        (release_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module RegisterContainerImage : sig
  val request :
    Smaws_Lib.Context.t ->
      register_container_image_request ->
        (register_container_image_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module RebootRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      reboot_relational_database_request ->
        (reboot_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module RebootInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      reboot_instance_request ->
        (reboot_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module PutInstancePublicPorts : sig
  val request :
    Smaws_Lib.Context.t ->
      put_instance_public_ports_request ->
        (put_instance_public_ports_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module PutAlarm : sig
  val request :
    Smaws_Lib.Context.t ->
      put_alarm_request ->
        (put_alarm_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module PeerVpc : sig
  val request :
    Smaws_Lib.Context.t ->
      peer_vpc_request ->
        (peer_vpc_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module OpenInstancePublicPorts : sig
  val request :
    Smaws_Lib.Context.t ->
      open_instance_public_ports_request ->
        (open_instance_public_ports_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module IsVpcPeered : sig
  val request :
    Smaws_Lib.Context.t ->
      is_vpc_peered_request ->
        (is_vpc_peered_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module ImportKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      import_key_pair_request ->
        (import_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetStaticIps : sig
  val request :
    Smaws_Lib.Context.t ->
      get_static_ips_request ->
        (get_static_ips_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      get_static_ip_request ->
        (get_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetSetupHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_setup_history_request ->
        (get_setup_history_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabaseSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_snapshots_request ->
        (get_relational_database_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabaseSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_snapshot_request ->
        (get_relational_database_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabases : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_databases_request ->
        (get_relational_databases_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabaseParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_parameters_request ->
        (get_relational_database_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabaseMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_metric_data_request ->
        (get_relational_database_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabaseMasterUserPassword : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_master_user_password_request ->
        (get_relational_database_master_user_password_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabaseLogStreams : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_log_streams_request ->
        (get_relational_database_log_streams_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabaseLogEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_log_events_request ->
        (get_relational_database_log_events_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabaseEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_events_request ->
        (get_relational_database_events_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabaseBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_bundles_request ->
        (get_relational_database_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabaseBlueprints : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_blueprints_request ->
        (get_relational_database_blueprints_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_request ->
        (get_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetRegions : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regions_request ->
        (get_regions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetOperationsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operations_for_resource_request ->
        (get_operations_for_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetOperations : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operations_request ->
        (get_operations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetOperation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operation_request ->
        (get_operation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetLoadBalancerTlsPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_tls_policies_request ->
        (get_load_balancer_tls_policies_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetLoadBalancerTlsCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_tls_certificates_request ->
        (get_load_balancer_tls_certificates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetLoadBalancers : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancers_request ->
        (get_load_balancers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetLoadBalancerMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_metric_data_request ->
        (get_load_balancer_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_request ->
        (get_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetKeyPairs : sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_pairs_request ->
        (get_key_pairs_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_pair_request ->
        (get_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetInstanceState : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_state_request ->
        (get_instance_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetInstanceSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_snapshots_request ->
        (get_instance_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetInstanceSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_snapshot_request ->
        (get_instance_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instances_request ->
        (get_instances_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetInstancePortStates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_port_states_request ->
        (get_instance_port_states_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetInstanceMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_metric_data_request ->
        (get_instance_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetInstanceAccessDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_access_details_request ->
        (get_instance_access_details_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_request ->
        (get_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetExportSnapshotRecords : sig
  val request :
    Smaws_Lib.Context.t ->
      get_export_snapshot_records_request ->
        (get_export_snapshot_records_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetDomains : sig
  val request :
    Smaws_Lib.Context.t ->
      get_domains_request ->
        (get_domains_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      get_domain_request ->
        (get_domain_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetDistributions : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distributions_request ->
        (get_distributions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetDistributionMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_metric_data_request ->
        (get_distribution_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetDistributionLatestCacheReset : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_latest_cache_reset_request ->
        (get_distribution_latest_cache_reset_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetDistributionBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_bundles_request ->
        (get_distribution_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetDiskSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_snapshots_request ->
        (get_disk_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetDiskSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_snapshot_request ->
        (get_disk_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetDisks : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disks_request ->
        (get_disks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_request ->
        (get_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetCostEstimate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_cost_estimate_request ->
        (get_cost_estimate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetContainerServices : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_services_request ->
        (container_services_list_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetContainerServicePowers : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_powers_request ->
        (get_container_service_powers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetContainerServiceMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_metric_data_request ->
        (get_container_service_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetContainerServiceDeployments : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_deployments_request ->
        (get_container_service_deployments_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetContainerLog : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_log_request ->
        (get_container_log_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetContainerImages : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_images_request ->
        (get_container_images_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetContainerAPIMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_api_metadata_request ->
        (get_container_api_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetContactMethods : sig
  val request :
    Smaws_Lib.Context.t ->
      get_contact_methods_request ->
        (get_contact_methods_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetCloudFormationStackRecords : sig
  val request :
    Smaws_Lib.Context.t ->
      get_cloud_formation_stack_records_request ->
        (get_cloud_formation_stack_records_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_certificates_request ->
        (get_certificates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bundles_request ->
        (get_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetBuckets : sig
  val request :
    Smaws_Lib.Context.t ->
      get_buckets_request ->
        (get_buckets_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetBucketMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_metric_data_request ->
        (get_bucket_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetBucketBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_bundles_request ->
        (get_bucket_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetBucketAccessKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_access_keys_request ->
        (get_bucket_access_keys_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetBlueprints : sig
  val request :
    Smaws_Lib.Context.t ->
      get_blueprints_request ->
        (get_blueprints_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetAutoSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_auto_snapshots_request ->
        (get_auto_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetAlarms : sig
  val request :
    Smaws_Lib.Context.t ->
      get_alarms_request ->
        (get_alarms_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module GetActiveNames : sig
  val request :
    Smaws_Lib.Context.t ->
      get_active_names_request ->
        (get_active_names_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module ExportSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      export_snapshot_request ->
        (export_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module EnableAddOn : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_add_on_request ->
        (enable_add_on_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DownloadDefaultKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      download_default_key_pair_request ->
        (download_default_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DisableAddOn : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_add_on_request ->
        (disable_add_on_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DetachStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_static_ip_request ->
        (detach_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DetachInstancesFromLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_instances_from_load_balancer_request ->
        (detach_instances_from_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DetachDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_disk_request ->
        (detach_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DetachCertificateFromDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_certificate_from_distribution_request ->
        (detach_certificate_from_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteRelationalDatabaseSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_relational_database_snapshot_request ->
        (delete_relational_database_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_relational_database_request ->
        (delete_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteLoadBalancerTlsCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_load_balancer_tls_certificate_request ->
        (delete_load_balancer_tls_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_load_balancer_request ->
        (delete_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteKnownHostKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_known_host_keys_request ->
        (delete_known_host_keys_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_key_pair_request ->
        (delete_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteInstanceSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_instance_snapshot_request ->
        (delete_instance_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_instance_request ->
        (delete_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteDomainEntry : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_domain_entry_request ->
        (delete_domain_entry_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_domain_request ->
        (delete_domain_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_distribution_request ->
        (delete_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteDiskSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_disk_snapshot_request ->
        (delete_disk_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_disk_request ->
        (delete_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteContainerService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_container_service_request ->
        (delete_container_service_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteContainerImage : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_container_image_request ->
        (delete_container_image_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteContactMethod : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_contact_method_request ->
        (delete_contact_method_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_certificate_request ->
        (delete_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteBucketAccessKey : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_bucket_access_key_request ->
        (delete_bucket_access_key_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_bucket_request ->
        (delete_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteAutoSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_auto_snapshot_request ->
        (delete_auto_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module DeleteAlarm : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_alarm_request ->
        (delete_alarm_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateRelationalDatabaseSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_snapshot_request ->
        (create_relational_database_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateRelationalDatabaseFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_from_snapshot_request ->
        (create_relational_database_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_request ->
        (create_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateLoadBalancerTlsCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      create_load_balancer_tls_certificate_request ->
        (create_load_balancer_tls_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      create_load_balancer_request ->
        (create_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      create_key_pair_request ->
        (create_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateInstanceSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_instance_snapshot_request ->
        (create_instance_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateInstancesFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_instances_from_snapshot_request ->
        (create_instances_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      create_instances_request ->
        (create_instances_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateGUISessionAccessDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      create_gui_session_access_details_request ->
        (create_gui_session_access_details_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateDomainEntry : sig
  val request :
    Smaws_Lib.Context.t ->
      create_domain_entry_request ->
        (create_domain_entry_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      create_domain_request ->
        (create_domain_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      create_distribution_request ->
        (create_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateDiskSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_snapshot_request ->
        (create_disk_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateDiskFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_from_snapshot_request ->
        (create_disk_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_request ->
        (create_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateContainerServiceRegistryLogin : sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_registry_login_request ->
        (create_container_service_registry_login_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateContainerServiceDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_deployment_request ->
        (create_container_service_deployment_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateContainerService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_request ->
        (create_container_service_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateContactMethod : sig
  val request :
    Smaws_Lib.Context.t ->
      create_contact_method_request ->
        (create_contact_method_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateCloudFormationStack : sig
  val request :
    Smaws_Lib.Context.t ->
      create_cloud_formation_stack_request ->
        (create_cloud_formation_stack_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      create_certificate_request ->
        (create_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateBucketAccessKey : sig
  val request :
    Smaws_Lib.Context.t ->
      create_bucket_access_key_request ->
        (create_bucket_access_key_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CreateBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      create_bucket_request ->
        (create_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CopySnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      copy_snapshot_request ->
        (copy_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module CloseInstancePublicPorts : sig
  val request :
    Smaws_Lib.Context.t ->
      close_instance_public_ports_request ->
        (close_instance_public_ports_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module AttachStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_static_ip_request ->
        (attach_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module AttachLoadBalancerTlsCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_load_balancer_tls_certificate_request ->
        (attach_load_balancer_tls_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module AttachInstancesToLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_instances_to_load_balancer_request ->
        (attach_instances_to_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module AttachDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_disk_request ->
        (attach_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module AttachCertificateToDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_certificate_to_distribution_request ->
        (attach_certificate_to_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

module AllocateStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      allocate_static_ip_request ->
        (allocate_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
end

