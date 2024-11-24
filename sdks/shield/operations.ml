open Types 
let (let+) res map = Result.map map res
module AssociateDRTLogBucket = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "AccessDeniedForDependencyException" ->
         (`AccessDeniedForDependencyException (access_denied_for_dependency_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "LimitsExceededException" ->
         (`LimitsExceededException (limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.shield", "NoAssociatedRoleException" ->
         (`NoAssociatedRoleException (no_associated_role_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_drt_log_bucket_request) ->
    let input = Serializers.associate_drt_log_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.AssociateDRTLogBucket" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_drt_log_bucket_response_of_yojson
      ~error_deserializer
      
end

module AssociateDRTRole = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "AccessDeniedForDependencyException" ->
         (`AccessDeniedForDependencyException (access_denied_for_dependency_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_drt_role_request) ->
    let input = Serializers.associate_drt_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.AssociateDRTRole" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_drt_role_response_of_yojson
      ~error_deserializer
      
end

module AssociateHealthCheck = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.shield", "LimitsExceededException" ->
         (`LimitsExceededException (limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_health_check_request) ->
    let input = Serializers.associate_health_check_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.AssociateHealthCheck" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_health_check_response_of_yojson
      ~error_deserializer
      
end

module AssociateProactiveEngagementDetails = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_proactive_engagement_details_request) ->
    let input = Serializers.associate_proactive_engagement_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.AssociateProactiveEngagementDetails" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_proactive_engagement_details_response_of_yojson
      ~error_deserializer
      
end

module CreateProtection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.shield", "LimitsExceededException" ->
         (`LimitsExceededException (limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_protection_request) ->
    let input = Serializers.create_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.CreateProtection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_protection_response_of_yojson
      ~error_deserializer
      
end

module CreateProtectionGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "LimitsExceededException" ->
         (`LimitsExceededException (limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_protection_group_request) ->
    let input = Serializers.create_protection_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.CreateProtectionGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_protection_group_response_of_yojson
      ~error_deserializer
      
end

module CreateSubscription = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_subscription_request) ->
    let input = Serializers.create_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.CreateSubscription" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_subscription_response_of_yojson
      ~error_deserializer
      
end

module DeleteProtection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_protection_request) ->
    let input = Serializers.delete_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DeleteProtection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_protection_response_of_yojson
      ~error_deserializer
      
end

module DeleteProtectionGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_protection_group_request) ->
    let input = Serializers.delete_protection_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DeleteProtectionGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_protection_group_response_of_yojson
      ~error_deserializer
      
end

module DeleteSubscription = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "LockedSubscriptionException" ->
         (`LockedSubscriptionException (locked_subscription_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_subscription_request) ->
    let input = Serializers.delete_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DeleteSubscription" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_subscription_response_of_yojson
      ~error_deserializer
      
end

module DescribeAttack = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_attack_request) ->
    let input = Serializers.describe_attack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DescribeAttack" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_attack_response_of_yojson
      ~error_deserializer
      
end

module DescribeAttackStatistics = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_attack_statistics_request) ->
    let input = Serializers.describe_attack_statistics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DescribeAttackStatistics" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_attack_statistics_response_of_yojson
      ~error_deserializer
      
end

module DescribeDRTAccess = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_drt_access_request) ->
    let input = Serializers.describe_drt_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DescribeDRTAccess" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_drt_access_response_of_yojson
      ~error_deserializer
      
end

module DescribeEmergencyContactSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_emergency_contact_settings_request) ->
    let input = Serializers.describe_emergency_contact_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DescribeEmergencyContactSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_emergency_contact_settings_response_of_yojson
      ~error_deserializer
      
end

module DescribeProtection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_protection_request) ->
    let input = Serializers.describe_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DescribeProtection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_protection_response_of_yojson
      ~error_deserializer
      
end

module DescribeProtectionGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_protection_group_request) ->
    let input = Serializers.describe_protection_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DescribeProtectionGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_protection_group_response_of_yojson
      ~error_deserializer
      
end

module DescribeSubscription = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_subscription_request) ->
    let input = Serializers.describe_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DescribeSubscription" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_subscription_response_of_yojson
      ~error_deserializer
      
end

module DisableApplicationLayerAutomaticResponse = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_application_layer_automatic_response_request) ->
    let input = Serializers.disable_application_layer_automatic_response_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DisableApplicationLayerAutomaticResponse" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disable_application_layer_automatic_response_response_of_yojson
      ~error_deserializer
      
end

module DisableProactiveEngagement = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_proactive_engagement_request) ->
    let input = Serializers.disable_proactive_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DisableProactiveEngagement" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disable_proactive_engagement_response_of_yojson
      ~error_deserializer
      
end

module DisassociateDRTLogBucket = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "AccessDeniedForDependencyException" ->
         (`AccessDeniedForDependencyException (access_denied_for_dependency_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "NoAssociatedRoleException" ->
         (`NoAssociatedRoleException (no_associated_role_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_drt_log_bucket_request) ->
    let input = Serializers.disassociate_drt_log_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DisassociateDRTLogBucket" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_drt_log_bucket_response_of_yojson
      ~error_deserializer
      
end

module DisassociateDRTRole = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_drt_role_request) ->
    let input = Serializers.disassociate_drt_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DisassociateDRTRole" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_drt_role_response_of_yojson
      ~error_deserializer
      
end

module DisassociateHealthCheck = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_health_check_request) ->
    let input = Serializers.disassociate_health_check_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.DisassociateHealthCheck" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_health_check_response_of_yojson
      ~error_deserializer
      
end

module EnableApplicationLayerAutomaticResponse = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "LimitsExceededException" ->
         (`LimitsExceededException (limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_application_layer_automatic_response_request) ->
    let input = Serializers.enable_application_layer_automatic_response_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.EnableApplicationLayerAutomaticResponse" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.enable_application_layer_automatic_response_response_of_yojson
      ~error_deserializer
      
end

module EnableProactiveEngagement = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_proactive_engagement_request) ->
    let input = Serializers.enable_proactive_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.EnableProactiveEngagement" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.enable_proactive_engagement_response_of_yojson
      ~error_deserializer
      
end

module GetSubscriptionState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_subscription_state_request) ->
    let input = Serializers.get_subscription_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.GetSubscriptionState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_subscription_state_response_of_yojson
      ~error_deserializer
      
end

module ListAttacks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_attacks_request) ->
    let input = Serializers.list_attacks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.ListAttacks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_attacks_response_of_yojson
      ~error_deserializer
      
end

module ListProtectionGroups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidPaginationTokenException" ->
         (`InvalidPaginationTokenException (invalid_pagination_token_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_protection_groups_request) ->
    let input = Serializers.list_protection_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.ListProtectionGroups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_protection_groups_response_of_yojson
      ~error_deserializer
      
end

module ListProtections = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidPaginationTokenException" ->
         (`InvalidPaginationTokenException (invalid_pagination_token_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_protections_request) ->
    let input = Serializers.list_protections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.ListProtections" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_protections_response_of_yojson
      ~error_deserializer
      
end

module ListResourcesInProtectionGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidPaginationTokenException" ->
         (`InvalidPaginationTokenException (invalid_pagination_token_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_resources_in_protection_group_request) ->
    let input = Serializers.list_resources_in_protection_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.ListResourcesInProtectionGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_resources_in_protection_group_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidResourceException" ->
         (`InvalidResourceException (invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module UpdateApplicationLayerAutomaticResponse = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_application_layer_automatic_response_request) ->
    let input = Serializers.update_application_layer_automatic_response_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.UpdateApplicationLayerAutomaticResponse" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_application_layer_automatic_response_response_of_yojson
      ~error_deserializer
      
end

module UpdateEmergencyContactSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_emergency_contact_settings_request) ->
    let input = Serializers.update_emergency_contact_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.UpdateEmergencyContactSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_emergency_contact_settings_response_of_yojson
      ~error_deserializer
      
end

module UpdateProtectionGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_protection_group_request) ->
    let input = Serializers.update_protection_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.UpdateProtectionGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_protection_group_response_of_yojson
      ~error_deserializer
      
end

module UpdateSubscription = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.shield", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.shield", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.shield", "LockedSubscriptionException" ->
         (`LockedSubscriptionException (locked_subscription_exception_of_yojson tree path))
      | "com.amazonaws.shield", "OptimisticLockException" ->
         (`OptimisticLockException (optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.shield", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_subscription_request) ->
    let input = Serializers.update_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSShield_20160616.UpdateSubscription" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_subscription_response_of_yojson
      ~error_deserializer
      
end

