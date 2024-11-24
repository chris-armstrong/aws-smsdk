open Types 
module CancelCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_cluster_request ->
        (cancel_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module CancelJob : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_job_request ->
        (cancel_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module CreateAddress : sig
  val request :
    Smaws_Lib.Context.t ->
      create_address_request ->
        (create_address_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddressException of invalid_address_exception
            | `UnsupportedAddressException of unsupported_address_exception
            
        ]
      ) result
end

module CreateCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      create_cluster_request ->
        (create_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module CreateJob : sig
  val request :
    Smaws_Lib.Context.t ->
      create_job_request ->
        (create_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterLimitExceededException of cluster_limit_exceeded_exception
            | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module CreateLongTermPricing : sig
  val request :
    Smaws_Lib.Context.t ->
      create_long_term_pricing_request ->
        (create_long_term_pricing_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module CreateReturnShippingLabel : sig
  val request :
    Smaws_Lib.Context.t ->
      create_return_shipping_label_request ->
        (create_return_shipping_label_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ReturnShippingLabelAlreadyExistsException of return_shipping_label_already_exists_exception
            
        ]
      ) result
end

module DescribeAddress : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_address_request ->
        (describe_address_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module DescribeAddresses : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_addresses_request ->
        (describe_addresses_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module DescribeCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_cluster_request ->
        (describe_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module DescribeJob : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_job_request ->
        (describe_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module DescribeReturnShippingLabel : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_return_shipping_label_request ->
        (describe_return_shipping_label_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module GetJobManifest : sig
  val request :
    Smaws_Lib.Context.t ->
      get_job_manifest_request ->
        (get_job_manifest_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module GetJobUnlockCode : sig
  val request :
    Smaws_Lib.Context.t ->
      get_job_unlock_code_request ->
        (get_job_unlock_code_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module GetSnowballUsage : sig
  val request :
    Smaws_Lib.Context.t ->
      get_snowball_usage_request ->
        (get_snowball_usage_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
end

module GetSoftwareUpdates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_software_updates_request ->
        (get_software_updates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module ListClusterJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_cluster_jobs_request ->
        (list_cluster_jobs_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module ListClusters : sig
  val request :
    Smaws_Lib.Context.t ->
      list_clusters_request ->
        (list_clusters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
end

module ListCompatibleImages : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compatible_images_request ->
        (list_compatible_images_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
end

module ListJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_jobs_request ->
        (list_jobs_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
end

module ListLongTermPricing : sig
  val request :
    Smaws_Lib.Context.t ->
      list_long_term_pricing_request ->
        (list_long_term_pricing_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module ListPickupLocations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_pickup_locations_request ->
        (list_pickup_locations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module ListServiceVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_versions_request ->
        (list_service_versions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module UpdateCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      update_cluster_request ->
        (update_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module UpdateJob : sig
  val request :
    Smaws_Lib.Context.t ->
      update_job_request ->
        (update_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterLimitExceededException of cluster_limit_exceeded_exception
            | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module UpdateJobShipmentState : sig
  val request :
    Smaws_Lib.Context.t ->
      update_job_shipment_state_request ->
        (update_job_shipment_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module UpdateLongTermPricing : sig
  val request :
    Smaws_Lib.Context.t ->
      update_long_term_pricing_request ->
        (update_long_term_pricing_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

