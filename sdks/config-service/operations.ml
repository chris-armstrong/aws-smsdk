open Types 
let (let+) res map = Result.map map res
module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module StopConfigurationRecorder = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConfigurationRecorderException" ->
         (`NoSuchConfigurationRecorderException (no_such_configuration_recorder_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_configuration_recorder_request) ->
    let input = Serializers.stop_configuration_recorder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.StopConfigurationRecorder" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module StartResourceEvaluation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "IdempotentParameterMismatch" ->
         (`IdempotentParameterMismatch (idempotent_parameter_mismatch_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_resource_evaluation_request) ->
    let input = Serializers.start_resource_evaluation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.StartResourceEvaluation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_resource_evaluation_response_of_yojson
      ~error_deserializer
      
end

module StartRemediationExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchRemediationConfigurationException" ->
         (`NoSuchRemediationConfigurationException (no_such_remediation_configuration_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_remediation_execution_request) ->
    let input = Serializers.start_remediation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.StartRemediationExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_remediation_execution_response_of_yojson
      ~error_deserializer
      
end

module StartConfigurationRecorder = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoAvailableDeliveryChannelException" ->
         (`NoAvailableDeliveryChannelException (no_available_delivery_channel_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationRecorderException" ->
         (`NoSuchConfigurationRecorderException (no_such_configuration_recorder_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_configuration_recorder_request) ->
    let input = Serializers.start_configuration_recorder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.StartConfigurationRecorder" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module StartConfigRulesEvaluation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigRuleException" ->
         (`NoSuchConfigRuleException (no_such_config_rule_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_config_rules_evaluation_request) ->
    let input = Serializers.start_config_rules_evaluation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.StartConfigRulesEvaluation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_config_rules_evaluation_response_of_yojson
      ~error_deserializer
      
end

module SelectResourceConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidExpressionException" ->
         (`InvalidExpressionException (invalid_expression_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: select_resource_config_request) ->
    let input = Serializers.select_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.SelectResourceConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.select_resource_config_response_of_yojson
      ~error_deserializer
      
end

module SelectAggregateResourceConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidExpressionException" ->
         (`InvalidExpressionException (invalid_expression_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: select_aggregate_resource_config_request) ->
    let input = Serializers.select_aggregate_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.SelectAggregateResourceConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.select_aggregate_resource_config_response_of_yojson
      ~error_deserializer
      
end

module PutStoredQuery = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "ResourceConcurrentModificationException" ->
         (`ResourceConcurrentModificationException (resource_concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_stored_query_request) ->
    let input = Serializers.put_stored_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutStoredQuery" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_stored_query_response_of_yojson
      ~error_deserializer
      
end

module PutRetentionConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "MaxNumberOfRetentionConfigurationsExceededException" ->
         (`MaxNumberOfRetentionConfigurationsExceededException (max_number_of_retention_configurations_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_retention_configuration_request) ->
    let input = Serializers.put_retention_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutRetentionConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_retention_configuration_response_of_yojson
      ~error_deserializer
      
end

module PutResourceConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "MaxActiveResourcesExceededException" ->
         (`MaxActiveResourcesExceededException (max_active_resources_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoRunningConfigurationRecorderException" ->
         (`NoRunningConfigurationRecorderException (no_running_configuration_recorder_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_resource_config_request) ->
    let input = Serializers.put_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutResourceConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module PutRemediationExceptions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_remediation_exceptions_request) ->
    let input = Serializers.put_remediation_exceptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutRemediationExceptions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_remediation_exceptions_response_of_yojson
      ~error_deserializer
      
end

module PutRemediationConfigurations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_remediation_configurations_request) ->
    let input = Serializers.put_remediation_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutRemediationConfigurations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_remediation_configurations_response_of_yojson
      ~error_deserializer
      
end

module PutOrganizationConformancePack = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "MaxNumberOfOrganizationConformancePacksExceededException" ->
         (`MaxNumberOfOrganizationConformancePacksExceededException (max_number_of_organization_conformance_packs_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoAvailableOrganizationException" ->
         (`NoAvailableOrganizationException (no_available_organization_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAllFeaturesNotEnabledException" ->
         (`OrganizationAllFeaturesNotEnabledException (organization_all_features_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationConformancePackTemplateValidationException" ->
         (`OrganizationConformancePackTemplateValidationException (organization_conformance_pack_template_validation_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_organization_conformance_pack_request) ->
    let input = Serializers.put_organization_conformance_pack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutOrganizationConformancePack" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_organization_conformance_pack_response_of_yojson
      ~error_deserializer
      
end

module PutOrganizationConfigRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "MaxNumberOfOrganizationConfigRulesExceededException" ->
         (`MaxNumberOfOrganizationConfigRulesExceededException (max_number_of_organization_config_rules_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoAvailableOrganizationException" ->
         (`NoAvailableOrganizationException (no_available_organization_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAllFeaturesNotEnabledException" ->
         (`OrganizationAllFeaturesNotEnabledException (organization_all_features_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_organization_config_rule_request) ->
    let input = Serializers.put_organization_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutOrganizationConfigRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_organization_config_rule_response_of_yojson
      ~error_deserializer
      
end

module PutExternalEvaluation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigRuleException" ->
         (`NoSuchConfigRuleException (no_such_config_rule_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_external_evaluation_request) ->
    let input = Serializers.put_external_evaluation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutExternalEvaluation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_external_evaluation_response_of_yojson
      ~error_deserializer
      
end

module PutEvaluations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidResultTokenException" ->
         (`InvalidResultTokenException (invalid_result_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigRuleException" ->
         (`NoSuchConfigRuleException (no_such_config_rule_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_evaluations_request) ->
    let input = Serializers.put_evaluations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutEvaluations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_evaluations_response_of_yojson
      ~error_deserializer
      
end

module PutDeliveryChannel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InsufficientDeliveryPolicyException" ->
         (`InsufficientDeliveryPolicyException (insufficient_delivery_policy_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidDeliveryChannelNameException" ->
         (`InvalidDeliveryChannelNameException (invalid_delivery_channel_name_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidS3KeyPrefixException" ->
         (`InvalidS3KeyPrefixException (invalid_s3_key_prefix_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidS3KmsKeyArnException" ->
         (`InvalidS3KmsKeyArnException (invalid_s3_kms_key_arn_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidSNSTopicARNException" ->
         (`InvalidSNSTopicARNException (invalid_sns_topic_arn_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "MaxNumberOfDeliveryChannelsExceededException" ->
         (`MaxNumberOfDeliveryChannelsExceededException (max_number_of_delivery_channels_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoAvailableConfigurationRecorderException" ->
         (`NoAvailableConfigurationRecorderException (no_available_configuration_recorder_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchBucketException" ->
         (`NoSuchBucketException (no_such_bucket_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_delivery_channel_request) ->
    let input = Serializers.put_delivery_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutDeliveryChannel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module PutConformancePack = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "ConformancePackTemplateValidationException" ->
         (`ConformancePackTemplateValidationException (conformance_pack_template_validation_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "MaxNumberOfConformancePacksExceededException" ->
         (`MaxNumberOfConformancePacksExceededException (max_number_of_conformance_packs_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_conformance_pack_request) ->
    let input = Serializers.put_conformance_pack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutConformancePack" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_conformance_pack_response_of_yojson
      ~error_deserializer
      
end

module PutConfigurationRecorder = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidConfigurationRecorderNameException" ->
         (`InvalidConfigurationRecorderNameException (invalid_configuration_recorder_name_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidRecordingGroupException" ->
         (`InvalidRecordingGroupException (invalid_recording_group_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidRoleException" ->
         (`InvalidRoleException (invalid_role_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "MaxNumberOfConfigurationRecordersExceededException" ->
         (`MaxNumberOfConfigurationRecordersExceededException (max_number_of_configuration_recorders_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_configuration_recorder_request) ->
    let input = Serializers.put_configuration_recorder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutConfigurationRecorder" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module PutConfigurationAggregator = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidRoleException" ->
         (`InvalidRoleException (invalid_role_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoAvailableOrganizationException" ->
         (`NoAvailableOrganizationException (no_available_organization_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAllFeaturesNotEnabledException" ->
         (`OrganizationAllFeaturesNotEnabledException (organization_all_features_not_enabled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_configuration_aggregator_request) ->
    let input = Serializers.put_configuration_aggregator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutConfigurationAggregator" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_configuration_aggregator_response_of_yojson
      ~error_deserializer
      
end

module PutConfigRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "MaxNumberOfConfigRulesExceededException" ->
         (`MaxNumberOfConfigRulesExceededException (max_number_of_config_rules_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoAvailableConfigurationRecorderException" ->
         (`NoAvailableConfigurationRecorderException (no_available_configuration_recorder_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_config_rule_request) ->
    let input = Serializers.put_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutConfigRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module PutAggregationAuthorization = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_aggregation_authorization_request) ->
    let input = Serializers.put_aggregation_authorization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.PutAggregationAuthorization" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_aggregation_authorization_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListStoredQueries = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_stored_queries_request) ->
    let input = Serializers.list_stored_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.ListStoredQueries" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_stored_queries_response_of_yojson
      ~error_deserializer
      
end

module ListResourceEvaluations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidTimeRangeException" ->
         (`InvalidTimeRangeException (invalid_time_range_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_resource_evaluations_request) ->
    let input = Serializers.list_resource_evaluations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.ListResourceEvaluations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_resource_evaluations_response_of_yojson
      ~error_deserializer
      
end

module ListDiscoveredResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoAvailableConfigurationRecorderException" ->
         (`NoAvailableConfigurationRecorderException (no_available_configuration_recorder_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_discovered_resources_request) ->
    let input = Serializers.list_discovered_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.ListDiscoveredResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_discovered_resources_response_of_yojson
      ~error_deserializer
      
end

module ListConformancePackComplianceScores = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_conformance_pack_compliance_scores_request) ->
    let input = Serializers.list_conformance_pack_compliance_scores_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.ListConformancePackComplianceScores" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_conformance_pack_compliance_scores_response_of_yojson
      ~error_deserializer
      
end

module ListAggregateDiscoveredResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_aggregate_discovered_resources_request) ->
    let input = Serializers.list_aggregate_discovered_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.ListAggregateDiscoveredResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_aggregate_discovered_resources_response_of_yojson
      ~error_deserializer
      
end

module GetStoredQuery = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_stored_query_request) ->
    let input = Serializers.get_stored_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetStoredQuery" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_stored_query_response_of_yojson
      ~error_deserializer
      
end

module GetResourceEvaluationSummary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resource_evaluation_summary_request) ->
    let input = Serializers.get_resource_evaluation_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetResourceEvaluationSummary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resource_evaluation_summary_response_of_yojson
      ~error_deserializer
      
end

module GetResourceConfigHistory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidTimeRangeException" ->
         (`InvalidTimeRangeException (invalid_time_range_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoAvailableConfigurationRecorderException" ->
         (`NoAvailableConfigurationRecorderException (no_available_configuration_recorder_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceNotDiscoveredException" ->
         (`ResourceNotDiscoveredException (resource_not_discovered_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resource_config_history_request) ->
    let input = Serializers.get_resource_config_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetResourceConfigHistory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resource_config_history_response_of_yojson
      ~error_deserializer
      
end

module GetOrganizationCustomRulePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchOrganizationConfigRuleException" ->
         (`NoSuchOrganizationConfigRuleException (no_such_organization_config_rule_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_organization_custom_rule_policy_request) ->
    let input = Serializers.get_organization_custom_rule_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetOrganizationCustomRulePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_organization_custom_rule_policy_response_of_yojson
      ~error_deserializer
      
end

module GetOrganizationConformancePackDetailedStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchOrganizationConformancePackException" ->
         (`NoSuchOrganizationConformancePackException (no_such_organization_conformance_pack_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_organization_conformance_pack_detailed_status_request) ->
    let input = Serializers.get_organization_conformance_pack_detailed_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetOrganizationConformancePackDetailedStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_organization_conformance_pack_detailed_status_response_of_yojson
      ~error_deserializer
      
end

module GetOrganizationConfigRuleDetailedStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchOrganizationConfigRuleException" ->
         (`NoSuchOrganizationConfigRuleException (no_such_organization_config_rule_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_organization_config_rule_detailed_status_request) ->
    let input = Serializers.get_organization_config_rule_detailed_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetOrganizationConfigRuleDetailedStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_organization_config_rule_detailed_status_response_of_yojson
      ~error_deserializer
      
end

module GetDiscoveredResourceCounts = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_discovered_resource_counts_request) ->
    let input = Serializers.get_discovered_resource_counts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetDiscoveredResourceCounts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_discovered_resource_counts_response_of_yojson
      ~error_deserializer
      
end

module GetCustomRulePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConfigRuleException" ->
         (`NoSuchConfigRuleException (no_such_config_rule_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_custom_rule_policy_request) ->
    let input = Serializers.get_custom_rule_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetCustomRulePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_custom_rule_policy_response_of_yojson
      ~error_deserializer
      
end

module GetConformancePackComplianceSummary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConformancePackException" ->
         (`NoSuchConformancePackException (no_such_conformance_pack_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_conformance_pack_compliance_summary_request) ->
    let input = Serializers.get_conformance_pack_compliance_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetConformancePackComplianceSummary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_conformance_pack_compliance_summary_response_of_yojson
      ~error_deserializer
      
end

module GetConformancePackComplianceDetails = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigRuleInConformancePackException" ->
         (`NoSuchConfigRuleInConformancePackException (no_such_config_rule_in_conformance_pack_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConformancePackException" ->
         (`NoSuchConformancePackException (no_such_conformance_pack_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_conformance_pack_compliance_details_request) ->
    let input = Serializers.get_conformance_pack_compliance_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetConformancePackComplianceDetails" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_conformance_pack_compliance_details_response_of_yojson
      ~error_deserializer
      
end

module GetComplianceSummaryByResourceType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_compliance_summary_by_resource_type_request) ->
    let input = Serializers.get_compliance_summary_by_resource_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetComplianceSummaryByResourceType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_compliance_summary_by_resource_type_response_of_yojson
      ~error_deserializer
      
end

module GetComplianceSummaryByConfigRule = struct
  let error_deserializer tree path = 
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: unit) ->
    let input = Serializers.base_unit_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetComplianceSummaryByConfigRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_compliance_summary_by_config_rule_response_of_yojson
      ~error_deserializer
      
end

module GetComplianceDetailsByResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_compliance_details_by_resource_request) ->
    let input = Serializers.get_compliance_details_by_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetComplianceDetailsByResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_compliance_details_by_resource_response_of_yojson
      ~error_deserializer
      
end

module GetComplianceDetailsByConfigRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigRuleException" ->
         (`NoSuchConfigRuleException (no_such_config_rule_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_compliance_details_by_config_rule_request) ->
    let input = Serializers.get_compliance_details_by_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetComplianceDetailsByConfigRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_compliance_details_by_config_rule_response_of_yojson
      ~error_deserializer
      
end

module GetAggregateResourceConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OversizedConfigurationItemException" ->
         (`OversizedConfigurationItemException (oversized_configuration_item_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceNotDiscoveredException" ->
         (`ResourceNotDiscoveredException (resource_not_discovered_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_aggregate_resource_config_request) ->
    let input = Serializers.get_aggregate_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetAggregateResourceConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_aggregate_resource_config_response_of_yojson
      ~error_deserializer
      
end

module GetAggregateDiscoveredResourceCounts = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_aggregate_discovered_resource_counts_request) ->
    let input = Serializers.get_aggregate_discovered_resource_counts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetAggregateDiscoveredResourceCounts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_aggregate_discovered_resource_counts_response_of_yojson
      ~error_deserializer
      
end

module GetAggregateConformancePackComplianceSummary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_aggregate_conformance_pack_compliance_summary_request) ->
    let input = Serializers.get_aggregate_conformance_pack_compliance_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetAggregateConformancePackComplianceSummary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_aggregate_conformance_pack_compliance_summary_response_of_yojson
      ~error_deserializer
      
end

module GetAggregateConfigRuleComplianceSummary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_aggregate_config_rule_compliance_summary_request) ->
    let input = Serializers.get_aggregate_config_rule_compliance_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetAggregateConfigRuleComplianceSummary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_aggregate_config_rule_compliance_summary_response_of_yojson
      ~error_deserializer
      
end

module GetAggregateComplianceDetailsByConfigRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_aggregate_compliance_details_by_config_rule_request) ->
    let input = Serializers.get_aggregate_compliance_details_by_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.GetAggregateComplianceDetailsByConfigRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_aggregate_compliance_details_by_config_rule_response_of_yojson
      ~error_deserializer
      
end

module DescribeRetentionConfigurations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchRetentionConfigurationException" ->
         (`NoSuchRetentionConfigurationException (no_such_retention_configuration_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_retention_configurations_request) ->
    let input = Serializers.describe_retention_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeRetentionConfigurations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_retention_configurations_response_of_yojson
      ~error_deserializer
      
end

module DescribeRemediationExecutionStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchRemediationConfigurationException" ->
         (`NoSuchRemediationConfigurationException (no_such_remediation_configuration_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_remediation_execution_status_request) ->
    let input = Serializers.describe_remediation_execution_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeRemediationExecutionStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_remediation_execution_status_response_of_yojson
      ~error_deserializer
      
end

module DescribeRemediationExceptions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_remediation_exceptions_request) ->
    let input = Serializers.describe_remediation_exceptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeRemediationExceptions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_remediation_exceptions_response_of_yojson
      ~error_deserializer
      
end

module DescribeRemediationConfigurations = struct
  let error_deserializer tree path = 
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_remediation_configurations_request) ->
    let input = Serializers.describe_remediation_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeRemediationConfigurations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_remediation_configurations_response_of_yojson
      ~error_deserializer
      
end

module DescribePendingAggregationRequests = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_pending_aggregation_requests_request) ->
    let input = Serializers.describe_pending_aggregation_requests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribePendingAggregationRequests" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_pending_aggregation_requests_response_of_yojson
      ~error_deserializer
      
end

module DescribeOrganizationConformancePackStatuses = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchOrganizationConformancePackException" ->
         (`NoSuchOrganizationConformancePackException (no_such_organization_conformance_pack_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_organization_conformance_pack_statuses_request) ->
    let input = Serializers.describe_organization_conformance_pack_statuses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeOrganizationConformancePackStatuses" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_organization_conformance_pack_statuses_response_of_yojson
      ~error_deserializer
      
end

module DescribeOrganizationConformancePacks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchOrganizationConformancePackException" ->
         (`NoSuchOrganizationConformancePackException (no_such_organization_conformance_pack_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_organization_conformance_packs_request) ->
    let input = Serializers.describe_organization_conformance_packs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeOrganizationConformancePacks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_organization_conformance_packs_response_of_yojson
      ~error_deserializer
      
end

module DescribeOrganizationConfigRuleStatuses = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchOrganizationConfigRuleException" ->
         (`NoSuchOrganizationConfigRuleException (no_such_organization_config_rule_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_organization_config_rule_statuses_request) ->
    let input = Serializers.describe_organization_config_rule_statuses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeOrganizationConfigRuleStatuses" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_organization_config_rule_statuses_response_of_yojson
      ~error_deserializer
      
end

module DescribeOrganizationConfigRules = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchOrganizationConfigRuleException" ->
         (`NoSuchOrganizationConfigRuleException (no_such_organization_config_rule_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_organization_config_rules_request) ->
    let input = Serializers.describe_organization_config_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeOrganizationConfigRules" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_organization_config_rules_response_of_yojson
      ~error_deserializer
      
end

module DescribeDeliveryChannelStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchDeliveryChannelException" ->
         (`NoSuchDeliveryChannelException (no_such_delivery_channel_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_delivery_channel_status_request) ->
    let input = Serializers.describe_delivery_channel_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeDeliveryChannelStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_delivery_channel_status_response_of_yojson
      ~error_deserializer
      
end

module DescribeDeliveryChannels = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchDeliveryChannelException" ->
         (`NoSuchDeliveryChannelException (no_such_delivery_channel_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_delivery_channels_request) ->
    let input = Serializers.describe_delivery_channels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeDeliveryChannels" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_delivery_channels_response_of_yojson
      ~error_deserializer
      
end

module DescribeConformancePackStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_conformance_pack_status_request) ->
    let input = Serializers.describe_conformance_pack_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeConformancePackStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_conformance_pack_status_response_of_yojson
      ~error_deserializer
      
end

module DescribeConformancePacks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConformancePackException" ->
         (`NoSuchConformancePackException (no_such_conformance_pack_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_conformance_packs_request) ->
    let input = Serializers.describe_conformance_packs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeConformancePacks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_conformance_packs_response_of_yojson
      ~error_deserializer
      
end

module DescribeConformancePackCompliance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigRuleInConformancePackException" ->
         (`NoSuchConfigRuleInConformancePackException (no_such_config_rule_in_conformance_pack_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConformancePackException" ->
         (`NoSuchConformancePackException (no_such_conformance_pack_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_conformance_pack_compliance_request) ->
    let input = Serializers.describe_conformance_pack_compliance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeConformancePackCompliance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_conformance_pack_compliance_response_of_yojson
      ~error_deserializer
      
end

module DescribeConfigurationRecorderStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConfigurationRecorderException" ->
         (`NoSuchConfigurationRecorderException (no_such_configuration_recorder_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_configuration_recorder_status_request) ->
    let input = Serializers.describe_configuration_recorder_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeConfigurationRecorderStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_configuration_recorder_status_response_of_yojson
      ~error_deserializer
      
end

module DescribeConfigurationRecorders = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConfigurationRecorderException" ->
         (`NoSuchConfigurationRecorderException (no_such_configuration_recorder_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_configuration_recorders_request) ->
    let input = Serializers.describe_configuration_recorders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeConfigurationRecorders" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_configuration_recorders_response_of_yojson
      ~error_deserializer
      
end

module DescribeConfigurationAggregatorSourcesStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_configuration_aggregator_sources_status_request) ->
    let input = Serializers.describe_configuration_aggregator_sources_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeConfigurationAggregatorSourcesStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_configuration_aggregator_sources_status_response_of_yojson
      ~error_deserializer
      
end

module DescribeConfigurationAggregators = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_configuration_aggregators_request) ->
    let input = Serializers.describe_configuration_aggregators_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeConfigurationAggregators" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_configuration_aggregators_response_of_yojson
      ~error_deserializer
      
end

module DescribeConfigRules = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigRuleException" ->
         (`NoSuchConfigRuleException (no_such_config_rule_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_config_rules_request) ->
    let input = Serializers.describe_config_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeConfigRules" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_config_rules_response_of_yojson
      ~error_deserializer
      
end

module DescribeConfigRuleEvaluationStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigRuleException" ->
         (`NoSuchConfigRuleException (no_such_config_rule_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_config_rule_evaluation_status_request) ->
    let input = Serializers.describe_config_rule_evaluation_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeConfigRuleEvaluationStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_config_rule_evaluation_status_response_of_yojson
      ~error_deserializer
      
end

module DescribeComplianceByResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_compliance_by_resource_request) ->
    let input = Serializers.describe_compliance_by_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeComplianceByResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_compliance_by_resource_response_of_yojson
      ~error_deserializer
      
end

module DescribeComplianceByConfigRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigRuleException" ->
         (`NoSuchConfigRuleException (no_such_config_rule_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_compliance_by_config_rule_request) ->
    let input = Serializers.describe_compliance_by_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeComplianceByConfigRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_compliance_by_config_rule_response_of_yojson
      ~error_deserializer
      
end

module DescribeAggregationAuthorizations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_aggregation_authorizations_request) ->
    let input = Serializers.describe_aggregation_authorizations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeAggregationAuthorizations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_aggregation_authorizations_response_of_yojson
      ~error_deserializer
      
end

module DescribeAggregateComplianceByConformancePacks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_aggregate_compliance_by_conformance_packs_request) ->
    let input = Serializers.describe_aggregate_compliance_by_conformance_packs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeAggregateComplianceByConformancePacks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_aggregate_compliance_by_conformance_packs_response_of_yojson
      ~error_deserializer
      
end

module DescribeAggregateComplianceByConfigRules = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidLimitException" ->
         (`InvalidLimitException (invalid_limit_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_aggregate_compliance_by_config_rules_request) ->
    let input = Serializers.describe_aggregate_compliance_by_config_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DescribeAggregateComplianceByConfigRules" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_aggregate_compliance_by_config_rules_response_of_yojson
      ~error_deserializer
      
end

module DeliverConfigSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoAvailableConfigurationRecorderException" ->
         (`NoAvailableConfigurationRecorderException (no_available_configuration_recorder_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoRunningConfigurationRecorderException" ->
         (`NoRunningConfigurationRecorderException (no_running_configuration_recorder_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchDeliveryChannelException" ->
         (`NoSuchDeliveryChannelException (no_such_delivery_channel_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deliver_config_snapshot_request) ->
    let input = Serializers.deliver_config_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeliverConfigSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deliver_config_snapshot_response_of_yojson
      ~error_deserializer
      
end

module DeleteStoredQuery = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_stored_query_request) ->
    let input = Serializers.delete_stored_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteStoredQuery" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_stored_query_response_of_yojson
      ~error_deserializer
      
end

module DeleteRetentionConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchRetentionConfigurationException" ->
         (`NoSuchRetentionConfigurationException (no_such_retention_configuration_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_retention_configuration_request) ->
    let input = Serializers.delete_retention_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteRetentionConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteResourceConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoRunningConfigurationRecorderException" ->
         (`NoRunningConfigurationRecorderException (no_running_configuration_recorder_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_resource_config_request) ->
    let input = Serializers.delete_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteResourceConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteRemediationExceptions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchRemediationExceptionException" ->
         (`NoSuchRemediationExceptionException (no_such_remediation_exception_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_remediation_exceptions_request) ->
    let input = Serializers.delete_remediation_exceptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteRemediationExceptions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_remediation_exceptions_response_of_yojson
      ~error_deserializer
      
end

module DeleteRemediationConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchRemediationConfigurationException" ->
         (`NoSuchRemediationConfigurationException (no_such_remediation_configuration_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "RemediationInProgressException" ->
         (`RemediationInProgressException (remediation_in_progress_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_remediation_configuration_request) ->
    let input = Serializers.delete_remediation_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteRemediationConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_remediation_configuration_response_of_yojson
      ~error_deserializer
      
end

module DeletePendingAggregationRequest = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_pending_aggregation_request_request) ->
    let input = Serializers.delete_pending_aggregation_request_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeletePendingAggregationRequest" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteOrganizationConformancePack = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchOrganizationConformancePackException" ->
         (`NoSuchOrganizationConformancePackException (no_such_organization_conformance_pack_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_organization_conformance_pack_request) ->
    let input = Serializers.delete_organization_conformance_pack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteOrganizationConformancePack" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteOrganizationConfigRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchOrganizationConfigRuleException" ->
         (`NoSuchOrganizationConfigRuleException (no_such_organization_config_rule_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "OrganizationAccessDeniedException" ->
         (`OrganizationAccessDeniedException (organization_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_organization_config_rule_request) ->
    let input = Serializers.delete_organization_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteOrganizationConfigRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteEvaluationResults = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConfigRuleException" ->
         (`NoSuchConfigRuleException (no_such_config_rule_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_evaluation_results_request) ->
    let input = Serializers.delete_evaluation_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteEvaluationResults" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_evaluation_results_response_of_yojson
      ~error_deserializer
      
end

module DeleteDeliveryChannel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "LastDeliveryChannelDeleteFailedException" ->
         (`LastDeliveryChannelDeleteFailedException (last_delivery_channel_delete_failed_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "NoSuchDeliveryChannelException" ->
         (`NoSuchDeliveryChannelException (no_such_delivery_channel_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_delivery_channel_request) ->
    let input = Serializers.delete_delivery_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteDeliveryChannel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteConformancePack = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConformancePackException" ->
         (`NoSuchConformancePackException (no_such_conformance_pack_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_conformance_pack_request) ->
    let input = Serializers.delete_conformance_pack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteConformancePack" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteConfigurationRecorder = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConfigurationRecorderException" ->
         (`NoSuchConfigurationRecorderException (no_such_configuration_recorder_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_configuration_recorder_request) ->
    let input = Serializers.delete_configuration_recorder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteConfigurationRecorder" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteConfigurationAggregator = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_configuration_aggregator_request) ->
    let input = Serializers.delete_configuration_aggregator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteConfigurationAggregator" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteConfigRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConfigRuleException" ->
         (`NoSuchConfigRuleException (no_such_config_rule_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_config_rule_request) ->
    let input = Serializers.delete_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteConfigRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteAggregationAuthorization = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_aggregation_authorization_request) ->
    let input = Serializers.delete_aggregation_authorization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.DeleteAggregationAuthorization" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module BatchGetResourceConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoAvailableConfigurationRecorderException" ->
         (`NoAvailableConfigurationRecorderException (no_available_configuration_recorder_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_get_resource_config_request) ->
    let input = Serializers.batch_get_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.BatchGetResourceConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_get_resource_config_response_of_yojson
      ~error_deserializer
      
end

module BatchGetAggregateResourceConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.configservice", "NoSuchConfigurationAggregatorException" ->
         (`NoSuchConfigurationAggregatorException (no_such_configuration_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.configservice", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_get_aggregate_resource_config_request) ->
    let input = Serializers.batch_get_aggregate_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"StarlingDoveService.BatchGetAggregateResourceConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_get_aggregate_resource_config_response_of_yojson
      ~error_deserializer
      
end

