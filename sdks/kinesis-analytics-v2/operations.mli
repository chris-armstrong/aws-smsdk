open Types 
module AddApplicationCloudWatchLoggingOption : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_cloud_watch_logging_option_request ->
        (add_application_cloud_watch_logging_option_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds an Amazon CloudWatch log stream to monitor application configuration errors.
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
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds a streaming source to your SQL-based Kinesis Data Analytics application.
    
     You can add a streaming source when you create an application, or you can use this operation to add a streaming source after you create an application. For more information, see [CreateApplication].
     
      Any configuration update, including adding a streaming source using this operation, results in a new version of the application. You can use the [DescribeApplication] operation to find the current application version.
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
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds an [InputProcessingConfiguration] to a SQL-based Kinesis Data Analytics application. An input processor pre-processes records on the input stream before the application's SQL code executes. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}Amazon Lambda}.
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
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds an external destination to your SQL-based Kinesis Data Analytics application.
    
     If you want Kinesis Data Analytics to deliver data from an in-application stream within your application to an external destination (such as an Kinesis data stream, a Kinesis Data Firehose delivery stream, or an Amazon Lambda function), you add the relevant configuration to your application using this operation. You can configure one or more outputs for your application. Each output configuration maps an in-application stream and an external destination.
     
      You can use one of the output configurations to deliver data from your in-application error stream to an external destination so that you can analyze the errors.
      
       Any configuration update, including adding a streaming source using this operation, results in a new version of the application. You can use the [DescribeApplication] operation to find the current application version.
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
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds a reference data source to an existing SQL-based Kinesis Data Analytics application.
    
     Kinesis Data Analytics reads reference data (that is, an Amazon S3 object) and creates an in-application table within your application. In the request, you provide the source (S3 bucket name and object key name), name of the in-application table to create, and the necessary mapping information that describes how data in an Amazon S3 object maps to columns in the resulting in-application table.
      *)

  
end

module AddApplicationVpcConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_vpc_configuration_request ->
        (add_application_vpc_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds a Virtual Private Cloud (VPC) configuration to the application. Applications can use VPCs to store and access resources securely.
    
     Note the following about VPC configurations for Managed Service for Apache Flink applications:
     
      {ul
           {- VPC configurations are not supported for SQL applications.
              
              }
            {- When a VPC is added to a Managed Service for Apache Flink application, the application can no longer be accessed from the Internet directly. To enable Internet access to the application, add an Internet gateway to your VPC.
               
               }
           
      }
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
            | `InvalidRequestException of invalid_request_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `TooManyTagsException of too_many_tags_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Creates a Managed Service for Apache Flink application. For information about creating a Managed Service for Apache Flink application, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/getting-started.html}Creating an Application}.
     *)

  
end

module CreateApplicationPresignedUrl : sig
  val request :
    Smaws_Lib.Context.t ->
      create_application_presigned_url_request ->
        (create_application_presigned_url_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Creates and returns a URL that you can use to connect to an application's extension.
    
     The IAM role or user used to call this API defines the permissions to access the extension. After the presigned URL is created, no additional permission is required to access this URL. IAM authorization policies for this API are also enforced for every HTTP request that attempts to connect to the extension.
     
      You control the amount of time that the URL will be valid using the [SessionExpirationDurationInSeconds] parameter. If you do not provide this parameter, the returned URL is valid for twelve hours.
      
       The URL that you get from a call to CreateApplicationPresignedUrl must be used within 3 minutes to be valid. If you first try to use the URL after the 3-minute limit expires, the service returns an HTTP 403 Forbidden error.
       
        *)

  
end

module CreateApplicationSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_application_snapshot_request ->
        (create_application_snapshot_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Creates a snapshot of the application's state data.
     *)

  
end

module DeleteApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_request ->
        (delete_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes the specified application. Managed Service for Apache Flink halts application execution and deletes the application.
     *)

  
end

module DeleteApplicationCloudWatchLoggingOption : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_cloud_watch_logging_option_request ->
        (delete_application_cloud_watch_logging_option_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes an Amazon CloudWatch log stream from an SQL-based Kinesis Data Analytics application.
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
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes an [InputProcessingConfiguration] from an input.
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
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes the output destination configuration from your SQL-based Kinesis Data Analytics application's configuration. Kinesis Data Analytics will no longer write data from the corresponding in-application stream to the external output destination.
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
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes a reference data source configuration from the specified SQL-based Kinesis Data Analytics application's configuration.
    
     If the application is running, Kinesis Data Analytics immediately removes the in-application table that you created using the [AddApplicationReferenceDataSource] operation.
      *)

  
end

module DeleteApplicationSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_snapshot_request ->
        (delete_application_snapshot_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Deletes a snapshot of application state.
     *)

  
end

module DeleteApplicationVpcConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_vpc_configuration_request ->
        (delete_application_vpc_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Removes a VPC configuration from a Managed Service for Apache Flink application.
     *)

  
end

module DescribeApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_application_request ->
        (describe_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns information about a specific Managed Service for Apache Flink application.
    
     If you want to retrieve a list of all applications in your account, use the [ListApplications] operation.
      *)

  
end

module DescribeApplicationSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_application_snapshot_request ->
        (describe_application_snapshot_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information about a snapshot of application state data.
     *)

  
end

module DescribeApplicationVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_application_version_request ->
        (describe_application_version_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Provides a detailed description of a specified version of the application. To see a list of all the versions of an application, invoke the [ListApplicationVersions] operation.
    
     This operation is supported only for Managed Service for Apache Flink.
     
      *)

  
end

module DiscoverInputSchema : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_input_schema_request ->
        (discover_input_schema_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceProvisionedThroughputExceededException of resource_provisioned_throughput_exceeded_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `UnableToDetectSchemaException of unable_to_detect_schema_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Infers a schema for a SQL-based Kinesis Data Analytics application by evaluating sample records on the specified streaming source (Kinesis data stream or Kinesis Data Firehose delivery stream) or Amazon S3 object. In the response, the operation returns the inferred schema and also the sample records that the operation used to infer the schema.
    
     You can use the inferred schema when configuring a streaming source for your application. When you create an application using the Kinesis Data Analytics console, the console uses this operation to infer a schema and show it in the console user interface.
      *)

  
end

module ListApplicationSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      list_application_snapshots_request ->
        (list_application_snapshots_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lists information about the current application snapshots.
     *)

  
end

module ListApplicationVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_application_versions_request ->
        (list_application_versions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lists all the versions for the specified application, including versions that were rolled back. The response also includes a summary of the configuration associated with each version.
    
     To get the complete description of a specific application version, invoke the [DescribeApplicationVersion] operation.
     
      This operation is supported only for Managed Service for Apache Flink.
      
       *)

  
end

module ListApplications : sig
  val request :
    Smaws_Lib.Context.t ->
      list_applications_request ->
        (list_applications_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
  (** 
    Returns a list of Managed Service for Apache Flink applications in your account. For each application, the response includes the application name, Amazon Resource Name (ARN), and status.
    
     If you want detailed information about a specific application, use [DescribeApplication].
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
    Retrieves the list of key-value tags assigned to the application. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.
     *)

  
end

module RollbackApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      rollback_application_request ->
        (rollback_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Reverts the application to the previous running version. You can roll back an application if you suspect it is stuck in a transient status.
    
     You can roll back an application only if it is in the [UPDATING] or [AUTOSCALING] status.
     
      When you rollback an application, it loads state data from the last successful snapshot. If the application has no snapshots, Managed Service for Apache Flink rejects the rollback request.
      
       This action is not supported for Managed Service for Apache Flink for SQL applications.
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
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Starts the specified Managed Service for Apache Flink application. After creating an application, you must exclusively call this operation to start your application.
     *)

  
end

module StopApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_application_request ->
        (stop_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Stops the application from processing data. You can stop an application only if it is in the running status, unless you set the [Force] parameter to [true].
    
     You can use the [DescribeApplication] operation to find the application status.
     
      Managed Service for Apache Flink takes a snapshot when the application is stopped, unless [Force] is set to [true].
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
    Adds one or more key-value tags to a Managed Service for Apache Flink application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.
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
    Removes one or more tags from a Managed Service for Apache Flink application. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.
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
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates an existing Managed Service for Apache Flink application. Using this operation, you can update application code, input configuration, and output configuration.
    
     Managed Service for Apache Flink updates the [ApplicationVersionId] each time you update your application.
      *)

  
end

module UpdateApplicationMaintenanceConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_application_maintenance_configuration_request ->
        (update_application_maintenance_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Updates the maintenance configuration of the Managed Service for Apache Flink application.
    
     You can invoke this operation on an application that is in one of the two following states: [READY] or [RUNNING]. If you invoke it when the application is in a state other than these two states, it throws a [ResourceInUseException]. The service makes use of the updated configuration the next time it schedules maintenance for the application. If you invoke this operation after the service schedules maintenance, the service will apply the configuration update the next time it schedules maintenance for the application. This means that you might not see the maintenance configuration update applied to the maintenance process that follows a successful invocation of this operation, but to the following maintenance process instead.
     
      To see the current maintenance configuration of your application, invoke the [DescribeApplication] operation.
      
       For information about application maintenance, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/maintenance.html}Managed Service for Apache Flink for Apache Flink Maintenance}.
       
        This operation is supported only for Managed Service for Apache Flink.
        
         *)

  
end

