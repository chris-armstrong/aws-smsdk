open Types 
let (let+) res map = Result.map map res
module UpdateLongTermPricing = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_long_term_pricing_request) ->
    let input = Serializers.update_long_term_pricing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.UpdateLongTermPricing" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_long_term_pricing_result_of_yojson
      ~error_deserializer
      
end

module UpdateJobShipmentState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidJobStateException" ->
         (`InvalidJobStateException (invalid_job_state_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_job_shipment_state_request) ->
    let input = Serializers.update_job_shipment_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.UpdateJobShipmentState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_job_shipment_state_result_of_yojson
      ~error_deserializer
      
end

module UpdateJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "ClusterLimitExceededException" ->
         (`ClusterLimitExceededException (cluster_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "Ec2RequestFailedException" ->
         (`Ec2RequestFailedException (ec2_request_failed_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidInputCombinationException" ->
         (`InvalidInputCombinationException (invalid_input_combination_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidJobStateException" ->
         (`InvalidJobStateException (invalid_job_state_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "KMSRequestFailedException" ->
         (`KMSRequestFailedException (kms_request_failed_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_job_request) ->
    let input = Serializers.update_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.UpdateJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_job_result_of_yojson
      ~error_deserializer
      
end

module UpdateCluster = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "Ec2RequestFailedException" ->
         (`Ec2RequestFailedException (ec2_request_failed_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidInputCombinationException" ->
         (`InvalidInputCombinationException (invalid_input_combination_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidJobStateException" ->
         (`InvalidJobStateException (invalid_job_state_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "KMSRequestFailedException" ->
         (`KMSRequestFailedException (kms_request_failed_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_cluster_request) ->
    let input = Serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.UpdateCluster" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_cluster_result_of_yojson
      ~error_deserializer
      
end

module ListServiceVersions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_service_versions_request) ->
    let input = Serializers.list_service_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.ListServiceVersions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_service_versions_result_of_yojson
      ~error_deserializer
      
end

module ListPickupLocations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_pickup_locations_request) ->
    let input = Serializers.list_pickup_locations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.ListPickupLocations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_pickup_locations_result_of_yojson
      ~error_deserializer
      
end

module ListLongTermPricing = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_long_term_pricing_request) ->
    let input = Serializers.list_long_term_pricing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.ListLongTermPricing" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_long_term_pricing_result_of_yojson
      ~error_deserializer
      
end

module ListJobs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_jobs_request) ->
    let input = Serializers.list_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.ListJobs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_jobs_result_of_yojson
      ~error_deserializer
      
end

module ListCompatibleImages = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "Ec2RequestFailedException" ->
         (`Ec2RequestFailedException (ec2_request_failed_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_compatible_images_request) ->
    let input = Serializers.list_compatible_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.ListCompatibleImages" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_compatible_images_result_of_yojson
      ~error_deserializer
      
end

module ListClusters = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_clusters_request) ->
    let input = Serializers.list_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.ListClusters" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_clusters_result_of_yojson
      ~error_deserializer
      
end

module ListClusterJobs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_cluster_jobs_request) ->
    let input = Serializers.list_cluster_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.ListClusterJobs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_cluster_jobs_result_of_yojson
      ~error_deserializer
      
end

module GetSoftwareUpdates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidJobStateException" ->
         (`InvalidJobStateException (invalid_job_state_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_software_updates_request) ->
    let input = Serializers.get_software_updates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.GetSoftwareUpdates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_software_updates_result_of_yojson
      ~error_deserializer
      
end

module GetSnowballUsage = struct
  let error_deserializer tree path = 
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_snowball_usage_request) ->
    let input = Serializers.get_snowball_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.GetSnowballUsage" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_snowball_usage_result_of_yojson
      ~error_deserializer
      
end

module GetJobUnlockCode = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidJobStateException" ->
         (`InvalidJobStateException (invalid_job_state_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_job_unlock_code_request) ->
    let input = Serializers.get_job_unlock_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.GetJobUnlockCode" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_job_unlock_code_result_of_yojson
      ~error_deserializer
      
end

module GetJobManifest = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidJobStateException" ->
         (`InvalidJobStateException (invalid_job_state_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_job_manifest_request) ->
    let input = Serializers.get_job_manifest_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.GetJobManifest" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_job_manifest_result_of_yojson
      ~error_deserializer
      
end

module DescribeReturnShippingLabel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidJobStateException" ->
         (`InvalidJobStateException (invalid_job_state_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_return_shipping_label_request) ->
    let input = Serializers.describe_return_shipping_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.DescribeReturnShippingLabel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_return_shipping_label_result_of_yojson
      ~error_deserializer
      
end

module DescribeJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_job_request) ->
    let input = Serializers.describe_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.DescribeJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_job_result_of_yojson
      ~error_deserializer
      
end

module DescribeCluster = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_cluster_request) ->
    let input = Serializers.describe_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.DescribeCluster" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_cluster_result_of_yojson
      ~error_deserializer
      
end

module DescribeAddresses = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_addresses_request) ->
    let input = Serializers.describe_addresses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.DescribeAddresses" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_addresses_result_of_yojson
      ~error_deserializer
      
end

module DescribeAddress = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_address_request) ->
    let input = Serializers.describe_address_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.DescribeAddress" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_address_result_of_yojson
      ~error_deserializer
      
end

module CreateReturnShippingLabel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidInputCombinationException" ->
         (`InvalidInputCombinationException (invalid_input_combination_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidJobStateException" ->
         (`InvalidJobStateException (invalid_job_state_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "ReturnShippingLabelAlreadyExistsException" ->
         (`ReturnShippingLabelAlreadyExistsException (return_shipping_label_already_exists_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_return_shipping_label_request) ->
    let input = Serializers.create_return_shipping_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.CreateReturnShippingLabel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_return_shipping_label_result_of_yojson
      ~error_deserializer
      
end

module CreateLongTermPricing = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_long_term_pricing_request) ->
    let input = Serializers.create_long_term_pricing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.CreateLongTermPricing" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_long_term_pricing_result_of_yojson
      ~error_deserializer
      
end

module CreateJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "ClusterLimitExceededException" ->
         (`ClusterLimitExceededException (cluster_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "Ec2RequestFailedException" ->
         (`Ec2RequestFailedException (ec2_request_failed_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidInputCombinationException" ->
         (`InvalidInputCombinationException (invalid_input_combination_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "KMSRequestFailedException" ->
         (`KMSRequestFailedException (kms_request_failed_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_job_request) ->
    let input = Serializers.create_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.CreateJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_job_result_of_yojson
      ~error_deserializer
      
end

module CreateCluster = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "Ec2RequestFailedException" ->
         (`Ec2RequestFailedException (ec2_request_failed_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidInputCombinationException" ->
         (`InvalidInputCombinationException (invalid_input_combination_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "KMSRequestFailedException" ->
         (`KMSRequestFailedException (kms_request_failed_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_cluster_request) ->
    let input = Serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.CreateCluster" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_cluster_result_of_yojson
      ~error_deserializer
      
end

module CreateAddress = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidAddressException" ->
         (`InvalidAddressException (invalid_address_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "UnsupportedAddressException" ->
         (`UnsupportedAddressException (unsupported_address_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_address_request) ->
    let input = Serializers.create_address_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.CreateAddress" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_address_result_of_yojson
      ~error_deserializer
      
end

module CancelJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidJobStateException" ->
         (`InvalidJobStateException (invalid_job_state_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "KMSRequestFailedException" ->
         (`KMSRequestFailedException (kms_request_failed_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_job_request) ->
    let input = Serializers.cancel_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.CancelJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_job_result_of_yojson
      ~error_deserializer
      
end

module CancelCluster = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.snowball", "InvalidJobStateException" ->
         (`InvalidJobStateException (invalid_job_state_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.snowball", "KMSRequestFailedException" ->
         (`KMSRequestFailedException (kms_request_failed_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_cluster_request) ->
    let input = Serializers.cancel_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSIESnowballJobManagementService.CancelCluster" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_cluster_result_of_yojson
      ~error_deserializer
      
end

