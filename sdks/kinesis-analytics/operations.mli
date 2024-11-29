open Types 
module AddApplicationCloudWatchLoggingOption : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_cloud_watch_logging_option_request ->
        (add_application_cloud_watch_logging_option_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Adds a CloudWatch log stream to monitor application configuration errors. For more information about using CloudWatch log streams with Amazon Kinesis Analytics applications, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html}Working with Amazon CloudWatch Logs}.
      *)

  
end

module AddApplicationInput : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_input_request ->
        (add_application_input_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CodeValidationException of code_validation_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Adds a streaming source to your Amazon Kinesis application. For conceptual information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}.
     
      You can add a streaming source either when you create an application or you can use this operation to add a streaming source after you create an application. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_CreateApplication.html}CreateApplication}.
      
       Any configuration update, including adding a streaming source using this operation, results in a new version of the application. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to find the current application version.
       
        This operation requires permissions to perform the [kinesisanalytics:AddApplicationInput] action.
         *)

  
end

module AddApplicationInputProcessingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_input_processing_configuration_request ->
        (add_application_input_processing_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Adds an {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration} to an application. An input processor preprocesses records on the input stream before the application's SQL code executes. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}AWS Lambda}.
      *)

  
end

module AddApplicationOutput : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_output_request ->
        (add_application_output_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Adds an external destination to your Amazon Kinesis Analytics application.
     
      If you want Amazon Kinesis Analytics to deliver data from an in-application stream within your application to an external destination (such as an Amazon Kinesis stream, an Amazon Kinesis Firehose delivery stream, or an AWS Lambda function), you add the relevant configuration to your application using this operation. You can configure one or more outputs for your application. Each output configuration maps an in-application stream and an external destination.
      
       You can use one of the output configurations to deliver data from your in-application error stream to an external destination so that you can analyze the errors. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Understanding Application Output (Destination)}.
       
        Any configuration update, including adding a streaming source using this operation, results in a new version of the application. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to find the current application version.
        
         For the limits on the number of application inputs and outputs you can configure, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html}Limits}.
         
          This operation requires permissions to perform the [kinesisanalytics:AddApplicationOutput] action.
           *)

  
end

module AddApplicationReferenceDataSource : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_reference_data_source_request ->
        (add_application_reference_data_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Adds a reference data source to an existing application.
     
      Amazon Kinesis Analytics reads reference data (that is, an Amazon S3 object) and creates an in-application table within your application. In the request, you provide the source (S3 bucket name and object key name), name of the in-application table to create, and the necessary mapping information that describes how data in Amazon S3 object maps to columns in the resulting in-application table.
      
       For conceptual information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}. For the limits on data sources you can add to your application, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html}Limits}.
       
        This operation requires permissions to perform the [kinesisanalytics:AddApplicationOutput] action.
         *)

  
end

module CreateApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      create_application_request ->
        (create_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CodeValidationException of code_validation_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Creates an Amazon Kinesis Analytics application. You can configure each application with one streaming source as input, application code to process the input, and up to three destinations where you want Amazon Kinesis Analytics to write the output data from your application. For an overview, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works.html}How it Works}.
     
      In the input configuration, you map the streaming source to an in-application stream, which you can think of as a constantly updating table. In the mapping, you must provide a schema for the in-application stream and map each data column in the in-application stream to a data element in the streaming source.
      
       Your application code is one or more SQL statements that read input data, transform it, and generate output. Your application code can create one or more SQL artifacts like SQL streams or pumps.
       
        In the output configuration, you can configure the application to write data from in-application streams created in your applications to up to three destinations.
        
         To read data from your source stream or write data to destination streams, Amazon Kinesis Analytics needs your permissions. You grant these permissions by creating IAM roles. This operation requires permissions to perform the [kinesisanalytics:CreateApplication] action.
         
          For introductory exercises to create an Amazon Kinesis Analytics application, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/getting-started.html}Getting Started}.
           *)

  
end

module DeleteApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_request ->
        (delete_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Deletes the specified application. Amazon Kinesis Analytics halts application execution and deletes the application, including any application artifacts (such as in-application streams, reference table, and application code).
     
      This operation requires permissions to perform the [kinesisanalytics:DeleteApplication] action.
       *)

  
end

module DeleteApplicationCloudWatchLoggingOption : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_cloud_watch_logging_option_request ->
        (delete_application_cloud_watch_logging_option_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Deletes a CloudWatch log stream from an application. For more information about using CloudWatch log streams with Amazon Kinesis Analytics applications, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html}Working with Amazon CloudWatch Logs}.
      *)

  
end

module DeleteApplicationInputProcessingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_input_processing_configuration_request ->
        (delete_application_input_processing_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Deletes an {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration} from an input.
      *)

  
end

module DeleteApplicationOutput : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_output_request ->
        (delete_application_output_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Deletes output destination configuration from your application configuration. Amazon Kinesis Analytics will no longer write data from the corresponding in-application stream to the external output destination.
     
      This operation requires permissions to perform the [kinesisanalytics:DeleteApplicationOutput] action.
       *)

  
end

module DeleteApplicationReferenceDataSource : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_reference_data_source_request ->
        (delete_application_reference_data_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Deletes a reference data source configuration from the specified application configuration.
     
      If the application is running, Amazon Kinesis Analytics immediately removes the in-application table that you created using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html}AddApplicationReferenceDataSource} operation.
      
       This operation requires permissions to perform the [kinesisanalytics.DeleteApplicationReferenceDataSource] action.
        *)

  
end

module DescribeApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_application_request ->
        (describe_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Returns information about a specific Amazon Kinesis Analytics application.
     
      If you want to retrieve a list of all applications in your account, use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_ListApplications.html}ListApplications} operation.
      
       This operation requires permissions to perform the [kinesisanalytics:DescribeApplication] action. You can use [DescribeApplication] to get the current application versionId, which you need to call other operations such as [Update].
        *)

  
end

module DiscoverInputSchema : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_input_schema_request ->
        (discover_input_schema_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `ResourceProvisionedThroughputExceededException of resource_provisioned_throughput_exceeded_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `UnableToDetectSchemaException of unable_to_detect_schema_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Infers a schema by evaluating sample records on the specified streaming source (Amazon Kinesis stream or Amazon Kinesis Firehose delivery stream) or S3 object. In the response, the operation returns the inferred schema and also the sample records that the operation used to infer the schema.
     
      You can use the inferred schema when configuring a streaming source for your application. For conceptual information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}. Note that when you create an application using the Amazon Kinesis Analytics console, the console uses this operation to infer a schema and show it in the console user interface.
      
       This operation requires permissions to perform the [kinesisanalytics:DiscoverInputSchema] action.
        *)

  
end

module ListApplications : sig
  val request :
    Smaws_Lib.Context.t ->
      list_applications_request ->
        (list_applications_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Returns a list of Amazon Kinesis Analytics applications in your account. For each application, the response includes the application name, Amazon Resource Name (ARN), and status. If the response returns the [HasMoreApplications] value as true, you can send another request by adding the [ExclusiveStartApplicationName] in the request body, and set the value of this to the last application name from the previous response.
     
      If you want detailed information about a specific application, use {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication}.
      
       This operation requires permissions to perform the [kinesisanalytics:ListApplications] action.
        *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves the list of key-value tags assigned to the application. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.
     *)

  
end

module StartApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      start_application_request ->
        (start_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Starts the specified Amazon Kinesis Analytics application. After creating an application, you must exclusively call this operation to start your application.
     
      After the application starts, it begins consuming the input data, processes it, and writes the output to the configured destination.
      
       The application status must be [READY] for you to start an application. You can get the application status in the console or using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation.
       
        After you start the application, you can stop the application from processing the input by calling the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_StopApplication.html}StopApplication} operation.
        
         This operation requires permissions to perform the [kinesisanalytics:StartApplication] action.
          *)

  
end

module StopApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_application_request ->
        (stop_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Stops the application from processing input data. You can stop an application only if it is in the running state. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to find the application state. After the application is stopped, Amazon Kinesis Analytics stops reading data from the input, the application stops processing data, and there is no output written to the destination.
     
      This operation requires permissions to perform the [kinesisanalytics:StopApplication] action.
       *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Adds one or more key-value tags to a Kinesis Analytics application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.
     *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Removes one or more tags from a Kinesis Analytics application. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.
     *)

  
end

module UpdateApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      update_application_request ->
        (update_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CodeValidationException of code_validation_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Updates an existing Amazon Kinesis Analytics application. Using this API, you can update application code, input configuration, and output configuration.
     
      Note that Amazon Kinesis Analytics updates the [CurrentApplicationVersionId] each time you update your application.
      
       This operation requires permission for the [kinesisanalytics:UpdateApplication] action.
        *)

  
end

