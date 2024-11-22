open Types 
let (let+) res map = Result.map map res
module UpdateApplication = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "CodeValidationException" ->
         (`CodeValidationException (code_validation_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_application_request) ->
    let input = Serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.UpdateApplication" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_application_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module StopApplication = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_application_request) ->
    let input = Serializers.stop_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.StopApplication" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.stop_application_response_of_yojson
      ~error_deserializer
      
end

module StartApplication = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "InvalidApplicationConfigurationException" ->
         (`InvalidApplicationConfigurationException (invalid_application_configuration_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_application_request) ->
    let input = Serializers.start_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.StartApplication" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_application_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListApplications = struct
  let error_deserializer tree path = 
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_applications_request) ->
    let input = Serializers.list_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.ListApplications" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_applications_response_of_yojson
      ~error_deserializer
      
end

module DiscoverInputSchema = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceProvisionedThroughputExceededException" ->
         (`ResourceProvisionedThroughputExceededException (resource_provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnableToDetectSchemaException" ->
         (`UnableToDetectSchemaException (unable_to_detect_schema_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: discover_input_schema_request) ->
    let input = Serializers.discover_input_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.DiscoverInputSchema" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.discover_input_schema_response_of_yojson
      ~error_deserializer
      
end

module DescribeApplication = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_application_request) ->
    let input = Serializers.describe_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.DescribeApplication" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_application_response_of_yojson
      ~error_deserializer
      
end

module DeleteApplicationReferenceDataSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_application_reference_data_source_request) ->
    let input = Serializers.delete_application_reference_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.DeleteApplicationReferenceDataSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_application_reference_data_source_response_of_yojson
      ~error_deserializer
      
end

module DeleteApplicationOutput = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_application_output_request) ->
    let input = Serializers.delete_application_output_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.DeleteApplicationOutput" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_application_output_response_of_yojson
      ~error_deserializer
      
end

module DeleteApplicationInputProcessingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_application_input_processing_configuration_request) ->
    let input = Serializers.delete_application_input_processing_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.DeleteApplicationInputProcessingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_application_input_processing_configuration_response_of_yojson
      ~error_deserializer
      
end

module DeleteApplicationCloudWatchLoggingOption = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_application_cloud_watch_logging_option_request) ->
    let input = Serializers.delete_application_cloud_watch_logging_option_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.DeleteApplicationCloudWatchLoggingOption" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_application_cloud_watch_logging_option_response_of_yojson
      ~error_deserializer
      
end

module DeleteApplication = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_application_request) ->
    let input = Serializers.delete_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.DeleteApplication" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_application_response_of_yojson
      ~error_deserializer
      
end

module CreateApplication = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "CodeValidationException" ->
         (`CodeValidationException (code_validation_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_application_request) ->
    let input = Serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.CreateApplication" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_application_response_of_yojson
      ~error_deserializer
      
end

module AddApplicationReferenceDataSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_application_reference_data_source_request) ->
    let input = Serializers.add_application_reference_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.AddApplicationReferenceDataSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.add_application_reference_data_source_response_of_yojson
      ~error_deserializer
      
end

module AddApplicationOutput = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_application_output_request) ->
    let input = Serializers.add_application_output_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.AddApplicationOutput" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.add_application_output_response_of_yojson
      ~error_deserializer
      
end

module AddApplicationInputProcessingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_application_input_processing_configuration_request) ->
    let input = Serializers.add_application_input_processing_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.AddApplicationInputProcessingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.add_application_input_processing_configuration_response_of_yojson
      ~error_deserializer
      
end

module AddApplicationInput = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "CodeValidationException" ->
         (`CodeValidationException (code_validation_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_application_input_request) ->
    let input = Serializers.add_application_input_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.AddApplicationInput" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.add_application_input_response_of_yojson
      ~error_deserializer
      
end

module AddApplicationCloudWatchLoggingOption = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesisanalytics", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesisanalytics", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_application_cloud_watch_logging_option_request) ->
    let input = Serializers.add_application_cloud_watch_logging_option_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KinesisAnalytics_20150814.AddApplicationCloudWatchLoggingOption" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.add_application_cloud_watch_logging_option_response_of_yojson
      ~error_deserializer
      
end

