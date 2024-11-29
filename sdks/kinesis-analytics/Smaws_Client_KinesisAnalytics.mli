(** 
    Kinesis Analytics client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

type update_application_response = unit

(** 
    Represents an update to the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html}InputLambdaProcessor} that is used to preprocess the records in the stream.
     *)
type input_lambda_processor_update = {
  role_arn_update: string option;
  (** 
    The ARN of the new IAM role that is used to access the AWS Lambda function.
     *)

  resource_arn_update: string option;
  (** 
    The Amazon Resource Name (ARN) of the new {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that is used to preprocess the records in the stream.
    
     To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: AWS Lambda}
     
      *)

}

(** 
    Describes updates to an {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration}.
     *)
type input_processing_configuration_update = {
  input_lambda_processor_update: input_lambda_processor_update;
  (** 
    Provides update information for an {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html}InputLambdaProcessor}.
     *)

}

(** 
    When updating application input configuration, provides information about an Amazon Kinesis stream as the streaming source.
     *)
type kinesis_streams_input_update = {
  role_arn_update: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to grant the necessary permissions to this role.
     *)

  resource_arn_update: string option;
  (** 
    Amazon Resource Name (ARN) of the input Amazon Kinesis stream to read.
     *)

}

(** 
    When updating application input configuration, provides information about an Amazon Kinesis Firehose delivery stream as the streaming source.
     *)
type kinesis_firehose_input_update = {
  role_arn_update: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to grant the necessary permissions to this role.
     *)

  resource_arn_update: string option;
  (** 
    Amazon Resource Name (ARN) of the input Amazon Kinesis Firehose delivery stream to read.
     *)

}

type record_format_type = | CSV
  | JSON

(** 
    Provides additional mapping information when JSON is the record format on the streaming source.
     *)
type json_mapping_parameters = {
  record_row_path: string;
  (** 
    Path to the top-level parent that contains the records.
     *)

}

[@@ocaml.doc {| 
    Provides additional mapping information when the record format uses delimiters, such as CSV. For example, the following sample records use CSV format, where the records use the {i '\n'} as the row delimiter and a comma (",") as the column delimiter:
    
     ["name1", "address1"]
     
      ["name2", "address2"]
       |}]
type csv_mapping_parameters = {
  record_column_delimiter: string;
  [@ocaml.doc {| 
    Column delimiter. For example, in a CSV format, a comma (",") is the typical column delimiter.
     |}]

  record_row_delimiter: string;
  (** 
    Row delimiter. For example, in a CSV format, {i '\n'} is the typical row delimiter.
     *)

}

(** 
    When configuring application input at the time of creating or updating an application, provides additional mapping information specific to the record format (such as JSON, CSV, or record fields delimited by some delimiter) on the streaming source.
     *)
type mapping_parameters = {
  csv_mapping_parameters: csv_mapping_parameters option;
  (** 
    Provides additional mapping information when the record format uses delimiters (for example, CSV).
     *)

  json_mapping_parameters: json_mapping_parameters option;
  (** 
    Provides additional mapping information when JSON is the record format on the streaming source.
     *)

}

(** 
    Describes the record format and relevant mapping information that should be applied to schematize the records on the stream.
     *)
type record_format = {
  mapping_parameters: mapping_parameters option;
  (** 
    When configuring application input at the time of creating or updating an application, provides additional mapping information specific to the record format (such as JSON, CSV, or record fields delimited by some delimiter) on the streaming source.
     *)

  record_format_type: record_format_type;
  (** 
    The type of record format.
     *)

}

(** 
    Describes the mapping of each data element in the streaming source to the corresponding column in the in-application stream.
    
     Also used to describe the format of the reference data source.
      *)
type record_column = {
  sql_type: string;
  (** 
    Type of column created in the in-application input stream or reference table.
     *)

  mapping: string option;
  (** 
    Reference to the data element in the streaming input or the reference data source. This element is required if the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_RecordFormat.html#analytics-Type-RecordFormat-RecordFormatTypel}RecordFormatType} is [JSON].
     *)

  name: string;
  (** 
    Name of the column created in the in-application input stream or reference table.
     *)

}

(** 
    Describes updates for the application's input schema.
     *)
type input_schema_update = {
  record_column_updates: record_column list option;
  (** 
    A list of [RecordColumn] objects. Each object describes the mapping of the streaming source element to the corresponding column in the in-application stream.
     *)

  record_encoding_update: string option;
  (** 
    Specifies the encoding of the records in the streaming source. For example, UTF-8.
     *)

  record_format_update: record_format option;
  (** 
    Specifies the format of the records on the streaming source.
     *)

}

(** 
    Provides updates to the parallelism count.
     *)
type input_parallelism_update = {
  count_update: int option;
  (** 
    Number of in-application streams to create for the specified streaming source.
     *)

}

(** 
    Describes updates to a specific input configuration (identified by the [InputId] of an application).
     *)
type input_update = {
  input_parallelism_update: input_parallelism_update option;
  (** 
    Describes the parallelism updates (the number in-application streams Amazon Kinesis Analytics creates for the specific streaming source).
     *)

  input_schema_update: input_schema_update option;
  (** 
    Describes the data format on the streaming source, and how record elements on the streaming source map to columns of the in-application stream that is created.
     *)

  kinesis_firehose_input_update: kinesis_firehose_input_update option;
  (** 
    If an Amazon Kinesis Firehose delivery stream is the streaming source to be updated, provides an updated stream ARN and IAM role ARN.
     *)

  kinesis_streams_input_update: kinesis_streams_input_update option;
  (** 
    If an Amazon Kinesis stream is the streaming source to be updated, provides an updated stream Amazon Resource Name (ARN) and IAM role ARN.
     *)

  input_processing_configuration_update: input_processing_configuration_update option;
  (** 
    Describes updates for an input processing configuration.
     *)

  name_prefix_update: string option;
  (** 
    Name prefix for in-application streams that Amazon Kinesis Analytics creates for the specific streaming source.
     *)

  input_id: string;
  (** 
    Input ID of the application input to be updated.
     *)

}

(** 
    When updating an output configuration using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation, provides information about an Amazon Kinesis stream configured as the destination.
     *)
type kinesis_streams_output_update = {
  role_arn_update: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to grant the necessary permissions to this role.
     *)

  resource_arn_update: string option;
  (** 
    Amazon Resource Name (ARN) of the Amazon Kinesis stream where you want to write the output.
     *)

}

(** 
    When updating an output configuration using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation, provides information about an Amazon Kinesis Firehose delivery stream configured as the destination.
     *)
type kinesis_firehose_output_update = {
  role_arn_update: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to grant the necessary permissions to this role.
     *)

  resource_arn_update: string option;
  (** 
    Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream to write to.
     *)

}

(** 
    When updating an output configuration using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation, provides information about an AWS Lambda function configured as the destination.
     *)
type lambda_output_update = {
  role_arn_update: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination function on your behalf. You need to grant the necessary permissions to this role.
     *)

  resource_arn_update: string option;
  (** 
    Amazon Resource Name (ARN) of the destination Lambda function.
    
     To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: AWS Lambda}
     
      *)

}

(** 
    Describes the data format when records are written to the destination. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Configuring Application Output}.
     *)
type destination_schema = {
  record_format_type: record_format_type;
  (** 
    Specifies the format of the records on the output stream.
     *)

}

(** 
    Describes updates to the output configuration identified by the [OutputId].
     *)
type output_update = {
  destination_schema_update: destination_schema option;
  (** 
    Describes the data format when records are written to the destination. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Configuring Application Output}.
     *)

  lambda_output_update: lambda_output_update option;
  (** 
    Describes an AWS Lambda function as the destination for the output.
     *)

  kinesis_firehose_output_update: kinesis_firehose_output_update option;
  (** 
    Describes an Amazon Kinesis Firehose delivery stream as the destination for the output.
     *)

  kinesis_streams_output_update: kinesis_streams_output_update option;
  (** 
    Describes an Amazon Kinesis stream as the destination for the output.
     *)

  name_update: string option;
  (** 
    If you want to specify a different in-application stream for this output configuration, use this field to specify the new in-application stream name.
     *)

  output_id: string;
  (** 
    Identifies the specific output configuration that you want to update.
     *)

}

(** 
    Describes the S3 bucket name, object key name, and IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object on your behalf and populate the in-application reference table.
     *)
type s3_reference_data_source_update = {
  reference_role_arn_update: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object and populate the in-application.
     *)

  file_key_update: string option;
  (** 
    Object key name.
     *)

  bucket_arn_update: string option;
  (** 
    Amazon Resource Name (ARN) of the S3 bucket.
     *)

}

(** 
    Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream.
     *)
type source_schema = {
  record_columns: record_column list;
  (** 
    A list of [RecordColumn] objects.
     *)

  record_encoding: string option;
  (** 
    Specifies the encoding of the records in the streaming source. For example, UTF-8.
     *)

  record_format: record_format;
  (** 
    Specifies the format of the records on the streaming source.
     *)

}

(** 
    When you update a reference data source configuration for an application, this object provides all the updated values (such as the source bucket name and object key name), the in-application table name that is created, and updated mapping information that maps the data in the Amazon S3 object to the in-application reference table that is created.
     *)
type reference_data_source_update = {
  reference_schema_update: source_schema option;
  (** 
    Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream.
     *)

  s3_reference_data_source_update: s3_reference_data_source_update option;
  (** 
    Describes the S3 bucket name, object key name, and IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object on your behalf and populate the in-application reference table.
     *)

  table_name_update: string option;
  (** 
    In-application table name that is created by this update.
     *)

  reference_id: string;
  (** 
    ID of the reference data source being updated. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get this value.
     *)

}

(** 
    Describes CloudWatch logging option updates.
     *)
type cloud_watch_logging_option_update = {
  role_arn_update: string option;
  (** 
    IAM ARN of the role to use to send application messages. Note: To write application messages to CloudWatch, the IAM role used must have the [PutLogEvents] policy action enabled.
     *)

  log_stream_arn_update: string option;
  (** 
    ARN of the CloudWatch log to receive application messages.
     *)

  cloud_watch_logging_option_id: string;
  (** 
    ID of the CloudWatch logging option to update
     *)

}

(** 
    Describes updates to apply to an existing Amazon Kinesis Analytics application.
     *)
type application_update = {
  cloud_watch_logging_option_updates: cloud_watch_logging_option_update list option;
  (** 
    Describes application CloudWatch logging option updates.
     *)

  reference_data_source_updates: reference_data_source_update list option;
  (** 
    Describes application reference data source updates.
     *)

  output_updates: output_update list option;
  (** 
    Describes application output configuration updates.
     *)

  application_code_update: string option;
  (** 
    Describes application code updates.
     *)

  input_updates: input_update list option;
  (** 
    Describes application input configuration updates.
     *)

}

type update_application_request = {
  application_update: application_update;
  (** 
    Describes application updates.
     *)

  current_application_version_id: int;
  (** 
    The current application version ID. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get this value.
     *)

  application_name: string;
  (** 
    Name of the Amazon Kinesis Analytics application to update.
     *)

}

(** 
    The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation.
     *)
type unsupported_operation_exception = {
  message: string option;
  
}

(** 
    Specified application can't be found.
     *)
type resource_not_found_exception = {
  message: string option;
  (** 
    
     *)

}

(** 
    Application is not available for this operation.
     *)
type resource_in_use_exception = {
  message: string option;
  (** 
    
     *)

}

(** 
    Specified input parameter value is invalid.
     *)
type invalid_argument_exception = {
  message: string option;
  (** 
    
     *)

}

(** 
    Exception thrown as a result of concurrent modification to an application. For example, two individuals attempting to edit the same application at the same time.
     *)
type concurrent_modification_exception = {
  message: string option;
  (** 
    
     *)

}

(** 
    User-provided application code (query) is invalid. This can be a simple syntax error.
     *)
type code_validation_exception = {
  message: string option;
  (** 
    Test
     *)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  (** 
    A list of keys of tags to remove from the specified application.
     *)

  resource_ar_n: string;
  (** 
    The ARN of the Kinesis Analytics application from which to remove the tags.
     *)

}

(** 
    Application created with too many tags, or too many tags added to an application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50.
     *)
type too_many_tags_exception = {
  message: string option;
  
}

(** 
    Data format is not valid. Amazon Kinesis Analytics is not able to detect schema for the given streaming source.
     *)
type unable_to_detect_schema_exception = {
  processed_input_records: string list option;
  
  raw_input_records: string list option;
  
  message: string option;
  
}

(** 
    A key-value pair (the value is optional) that you can define and assign to AWS resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.
     *)
type tag = {
  value: string option;
  (** 
    The value of the key-value tag. The value is optional.
     *)

  key: string;
  (** 
    The key of the key-value tag.
     *)

}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
  (** 
    The key-value tags to assign to the application.
     *)

  resource_ar_n: string;
  (** 
    The ARN of the application to assign the tags.
     *)

}

(** 
    
     *)
type stop_application_response = unit

(** 
    
     *)
type stop_application_request = {
  application_name: string;
  (** 
    Name of the running application to stop.
     *)

}

(** 
    
     *)
type start_application_response = unit

type input_starting_position = | LAST_STOPPED_POINT
  | TRIM_HORIZON
  | NOW

(** 
    Describes the point at which the application reads from the streaming source.
     *)
type input_starting_position_configuration = {
  input_starting_position: input_starting_position option;
  (** 
    The starting position on the stream.
    
     {ul
          {- [NOW] - Start reading just after the most recent record in the stream, start at the request time stamp that the customer issued.
             
             }
           {- [TRIM_HORIZON] - Start reading at the last untrimmed record in the stream, which is the oldest record available in the stream. This option is not available for an Amazon Kinesis Firehose delivery stream.
              
              }
           {- [LAST_STOPPED_POINT] - Resume reading from where the application last stopped reading.
              
              }
          
      }
       *)

}

(** 
    When you start your application, you provide this configuration, which identifies the input source and the point in the input source at which you want the application to start processing records.
     *)
type input_configuration = {
  input_starting_position_configuration: input_starting_position_configuration;
  (** 
    Point at which you want the application to start processing records from the streaming source.
     *)

  id: string;
  (** 
    Input source ID. You can get this ID by calling the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation.
     *)

}

(** 
    
     *)
type start_application_request = {
  input_configurations: input_configuration list;
  (** 
    Identifies the specific input, by ID, that the application starts consuming. Amazon Kinesis Analytics starts reading the streaming source associated with the input. You can also specify where in the streaming source you want Amazon Kinesis Analytics to start reading.
     *)

  application_name: string;
  (** 
    Name of the application.
     *)

}

(** 
    User-provided application configuration is not valid.
     *)
type invalid_application_configuration_exception = {
  message: string option;
  (** 
    test
     *)

}

(** 
    The service is unavailable. Back off and retry the operation.
     *)
type service_unavailable_exception = {
  message: string option;
  
}

(** 
    Provides the bucket name and object key name that stores the reference data.
     *)
type s3_reference_data_source_description = {
  reference_role_ar_n: string;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object on your behalf to populate the in-application reference table.
     *)

  file_key: string;
  (** 
    Amazon S3 object key name.
     *)

  bucket_ar_n: string;
  (** 
    Amazon Resource Name (ARN) of the S3 bucket.
     *)

}

(** 
    Identifies the S3 bucket and object that contains the reference data. Also identifies the IAM role Amazon Kinesis Analytics can assume to read this object on your behalf.
    
     An Amazon Kinesis Analytics application loads reference data only once. If the data changes, you call the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html}UpdateApplication} operation to trigger reloading of data into your application.
      *)
type s3_reference_data_source = {
  reference_role_ar_n: string;
  (** 
    ARN of the IAM role that the service can assume to read data on your behalf. This role must have permission for the [s3:GetObject] action on the object and trust policy that allows Amazon Kinesis Analytics service principal to assume this role.
     *)

  file_key: string;
  (** 
    Object key name containing reference data.
     *)

  bucket_ar_n: string;
  (** 
    Amazon Resource Name (ARN) of the S3 bucket.
     *)

}

(** 
    Provides a description of an Amazon S3 data source, including the Amazon Resource Name (ARN) of the S3 bucket, the ARN of the IAM role that is used to access the bucket, and the name of the Amazon S3 object that contains the data.
     *)
type s3_configuration = {
  file_key: string;
  (** 
    The name of the object that contains the data.
     *)

  bucket_ar_n: string;
  (** 
    ARN of the S3 bucket that contains the data.
     *)

  role_ar_n: string;
  (** 
    IAM ARN of the role used to access the data.
     *)

}

(** 
    Discovery failed to get a record from the streaming source because of the Amazon Kinesis Streams ProvisionedThroughputExceededException. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetRecords.html}GetRecords} in the Amazon Kinesis Streams API Reference.
     *)
type resource_provisioned_throughput_exceeded_exception = {
  message: string option;
  
}

(** 
    Describes the reference data source configured for an application.
     *)
type reference_data_source_description = {
  reference_schema: source_schema option;
  (** 
    Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream.
     *)

  s3_reference_data_source_description: s3_reference_data_source_description;
  (** 
    Provides the S3 bucket name, the object key name that contains the reference data. It also provides the Amazon Resource Name (ARN) of the IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object and populate the in-application reference table.
     *)

  table_name: string;
  (** 
    The in-application table name created by the specific reference data source configuration.
     *)

  reference_id: string;
  (** 
    ID of the reference data source. This is the ID that Amazon Kinesis Analytics assigns when you add the reference data source to your application using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html}AddApplicationReferenceDataSource} operation.
     *)

}

(** 
    Describes the reference data source by providing the source information (S3 bucket name and object key name), the resulting in-application table name that is created, and the necessary schema to map the data elements in the Amazon S3 object to the in-application table.
     *)
type reference_data_source = {
  reference_schema: source_schema;
  (** 
    Describes the format of the data in the streaming source, and how each data element maps to corresponding columns created in the in-application stream.
     *)

  s3_reference_data_source: s3_reference_data_source option;
  (** 
    Identifies the S3 bucket and object that contains the reference data. Also identifies the IAM role Amazon Kinesis Analytics can assume to read this object on your behalf. An Amazon Kinesis Analytics application loads reference data only once. If the data changes, you call the [UpdateApplication] operation to trigger reloading of data into your application.
     *)

  table_name: string;
  (** 
    Name of the in-application table to create.
     *)

}

(** 
    When configuring application output, identifies an Amazon Kinesis stream as the destination. You provide the stream Amazon Resource Name (ARN) and also an IAM role ARN that Amazon Kinesis Analytics can use to write to the stream on your behalf.
     *)
type kinesis_streams_output = {
  role_ar_n: string;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination stream on your behalf. You need to grant the necessary permissions to this role.
     *)

  resource_ar_n: string;
  (** 
    ARN of the destination Amazon Kinesis stream to write to.
     *)

}

(** 
    When configuring application output, identifies an Amazon Kinesis Firehose delivery stream as the destination. You provide the stream Amazon Resource Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to write to the stream on your behalf.
     *)
type kinesis_firehose_output = {
  role_ar_n: string;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination stream on your behalf. You need to grant the necessary permissions to this role.
     *)

  resource_ar_n: string;
  (** 
    ARN of the destination Amazon Kinesis Firehose delivery stream to write to.
     *)

}

(** 
    When configuring application output, identifies an AWS Lambda function as the destination. You provide the function Amazon Resource Name (ARN) and also an IAM role ARN that Amazon Kinesis Analytics can use to write to the function on your behalf.
     *)
type lambda_output = {
  role_ar_n: string;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination function on your behalf. You need to grant the necessary permissions to this role.
     *)

  resource_ar_n: string;
  (** 
    Amazon Resource Name (ARN) of the destination Lambda function to write to.
    
     To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: AWS Lambda}
     
      *)

}

(** 
    Describes application output configuration in which you identify an in-application stream and a destination where you want the in-application stream data to be written. The destination can be an Amazon Kinesis stream or an Amazon Kinesis Firehose delivery stream.
    
     
     
      For limits on how many destinations an application can write and other limitations, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html}Limits}.
       *)
type output = {
  destination_schema: destination_schema;
  (** 
    Describes the data format when records are written to the destination. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Configuring Application Output}.
     *)

  lambda_output: lambda_output option;
  (** 
    Identifies an AWS Lambda function as the destination.
     *)

  kinesis_firehose_output: kinesis_firehose_output option;
  (** 
    Identifies an Amazon Kinesis Firehose delivery stream as the destination.
     *)

  kinesis_streams_output: kinesis_streams_output option;
  (** 
    Identifies an Amazon Kinesis stream as the destination.
     *)

  name: string;
  (** 
    Name of the in-application stream.
     *)

}

(** 
    For an application output, describes the Amazon Kinesis stream configured as its destination.
     *)
type kinesis_streams_output_description = {
  role_ar_n: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream.
     *)

  resource_ar_n: string option;
  (** 
    Amazon Resource Name (ARN) of the Amazon Kinesis stream.
     *)

}

(** 
    For an application output, describes the Amazon Kinesis Firehose delivery stream configured as its destination.
     *)
type kinesis_firehose_output_description = {
  role_ar_n: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream.
     *)

  resource_ar_n: string option;
  (** 
    Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.
     *)

}

(** 
    For an application output, describes the AWS Lambda function configured as its destination.
     *)
type lambda_output_description = {
  role_ar_n: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination function.
     *)

  resource_ar_n: string option;
  (** 
    Amazon Resource Name (ARN) of the destination Lambda function.
     *)

}

(** 
    Describes the application output configuration, which includes the in-application stream name and the destination where the stream data is written. The destination can be an Amazon Kinesis stream or an Amazon Kinesis Firehose delivery stream.
     *)
type output_description = {
  destination_schema: destination_schema option;
  (** 
    Data format used for writing data to the destination.
     *)

  lambda_output_description: lambda_output_description option;
  (** 
    Describes the AWS Lambda function configured as the destination where output is written.
     *)

  kinesis_firehose_output_description: kinesis_firehose_output_description option;
  (** 
    Describes the Amazon Kinesis Firehose delivery stream configured as the destination where output is written.
     *)

  kinesis_streams_output_description: kinesis_streams_output_description option;
  (** 
    Describes Amazon Kinesis stream configured as the destination where output is written.
     *)

  name: string option;
  (** 
    Name of the in-application stream configured as output.
     *)

  output_id: string option;
  (** 
    A unique identifier for the output configuration.
     *)

}

type list_tags_for_resource_response = {
  tags: tag list option;
  (** 
    The key-value tags assigned to the application.
     *)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  (** 
    The ARN of the application for which to retrieve tags.
     *)

}

type application_status = | UPDATING
  | RUNNING
  | READY
  | STOPPING
  | STARTING
  | DELETING

(** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Provides application summary information, including the application Amazon Resource Name (ARN), name, and status.
      *)
type application_summary = {
  application_status: application_status;
  (** 
    Status of the application.
     *)

  application_ar_n: string;
  (** 
    ARN of the application.
     *)

  application_name: string;
  (** 
    Name of the application.
     *)

}

(** 
    
     *)
type list_applications_response = {
  has_more_applications: bool;
  (** 
    Returns true if there are more applications to retrieve.
     *)

  application_summaries: application_summary list;
  (** 
    List of [ApplicationSummary] objects.
     *)

}

(** 
    
     *)
type list_applications_request = {
  exclusive_start_application_name: string option;
  (** 
    Name of the application to start the list with. When using pagination to retrieve the list, you don't need to specify this parameter in the first request. However, in subsequent requests, you add the last application name from the previous response to get the next page of applications.
     *)

  limit: int option;
  (** 
    Maximum number of applications to list.
     *)

}

(** 
    Exceeded the number of applications allowed.
     *)
type limit_exceeded_exception = {
  message: string option;
  (** 
    
     *)

}

(** 
    Describes the Amazon Kinesis stream that is configured as the streaming source in the application input configuration.
     *)
type kinesis_streams_input_description = {
  role_ar_n: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream.
     *)

  resource_ar_n: string option;
  (** 
    Amazon Resource Name (ARN) of the Amazon Kinesis stream.
     *)

}

(** 
    Identifies an Amazon Kinesis stream as the streaming source. You provide the stream's Amazon Resource Name (ARN) and an IAM role ARN that enables Amazon Kinesis Analytics to access the stream on your behalf.
     *)
type kinesis_streams_input = {
  role_ar_n: string;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to grant the necessary permissions to this role.
     *)

  resource_ar_n: string;
  (** 
    ARN of the input Amazon Kinesis stream to read.
     *)

}

(** 
    Describes the Amazon Kinesis Firehose delivery stream that is configured as the streaming source in the application input configuration.
     *)
type kinesis_firehose_input_description = {
  role_ar_n: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics assumes to access the stream.
     *)

  resource_ar_n: string option;
  (** 
    Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.
     *)

}

(** 
    Identifies an Amazon Kinesis Firehose delivery stream as the streaming source. You provide the delivery stream's Amazon Resource Name (ARN) and an IAM role ARN that enables Amazon Kinesis Analytics to access the stream on your behalf.
     *)
type kinesis_firehose_input = {
  role_ar_n: string;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf. You need to make sure that the role has the necessary permissions to access the stream.
     *)

  resource_ar_n: string;
  (** 
    ARN of the input delivery stream.
     *)

}

(** 
    
     *)
type discover_input_schema_response = {
  raw_input_records: string list option;
  (** 
    Raw stream data that was sampled to infer the schema.
     *)

  processed_input_records: string list option;
  (** 
    Stream data that was modified by the processor specified in the [InputProcessingConfiguration] parameter.
     *)

  parsed_input_records: string list list option;
  (** 
    An array of elements, where each element corresponds to a row in a stream record (a stream record can have more than one row).
     *)

  input_schema: source_schema option;
  (** 
    Schema inferred from the streaming source. It identifies the format of the data in the streaming source and how each data element maps to corresponding columns in the in-application stream that you can create.
     *)

}

(** 
    An object that contains the Amazon Resource Name (ARN) of the {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that is used to preprocess records in the stream, and the ARN of the IAM role that is used to access the AWS Lambda function.
     *)
type input_lambda_processor = {
  role_ar_n: string;
  (** 
    The ARN of the IAM role that is used to access the AWS Lambda function.
     *)

  resource_ar_n: string;
  (** 
    The ARN of the {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that operates on records in the stream.
    
     To specify an earlier version of the Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see {{:/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda}Example ARNs: AWS Lambda}
     
      *)

}

(** 
    Provides a description of a processor that is used to preprocess the records in the stream before being processed by your application code. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}AWS Lambda}.
     *)
type input_processing_configuration = {
  input_lambda_processor: input_lambda_processor;
  (** 
    The {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html}InputLambdaProcessor} that is used to preprocess the records in the stream before being processed by your application code.
     *)

}

type discover_input_schema_request = {
  input_processing_configuration: input_processing_configuration option;
  (** 
    The {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration} to use to preprocess the records before discovering the schema of the records.
     *)

  s3_configuration: s3_configuration option;
  (** 
    Specify this parameter to discover a schema from data in an Amazon S3 object.
     *)

  input_starting_position_configuration: input_starting_position_configuration option;
  (** 
    Point at which you want Amazon Kinesis Analytics to start reading records from the specified streaming source discovery purposes.
     *)

  role_ar_n: string option;
  (** 
    ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf.
     *)

  resource_ar_n: string option;
  (** 
    Amazon Resource Name (ARN) of the streaming source.
     *)

}

(** 
    An object that contains the Amazon Resource Name (ARN) of the {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that is used to preprocess records in the stream, and the ARN of the IAM role that is used to access the AWS Lambda expression.
     *)
type input_lambda_processor_description = {
  role_ar_n: string option;
  (** 
    The ARN of the IAM role that is used to access the AWS Lambda function.
     *)

  resource_ar_n: string option;
  (** 
    The ARN of the {{:https://docs.aws.amazon.com/lambda/}AWS Lambda} function that is used to preprocess the records in the stream.
     *)

}

(** 
    Provides configuration information about an input processor. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}AWS Lambda}.
     *)
type input_processing_configuration_description = {
  input_lambda_processor_description: input_lambda_processor_description option;
  (** 
    Provides configuration information about the associated {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessorDescription.html}InputLambdaProcessorDescription}.
     *)

}

(** 
    Describes the number of in-application streams to create for a given streaming source. For information about parallelism, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}.
     *)
type input_parallelism = {
  count: int option;
  (** 
    Number of in-application streams to create. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html}Limits}.
     *)

}

(** 
    Describes the application input configuration. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}.
     *)
type input_description = {
  input_starting_position_configuration: input_starting_position_configuration option;
  (** 
    Point at which the application is configured to read from the input stream.
     *)

  input_parallelism: input_parallelism option;
  (** 
    Describes the configured parallelism (number of in-application streams mapped to the streaming source).
     *)

  input_schema: source_schema option;
  (** 
    Describes the format of the data in the streaming source, and how each data element maps to corresponding columns in the in-application stream that is being created.
     *)

  kinesis_firehose_input_description: kinesis_firehose_input_description option;
  (** 
    If an Amazon Kinesis Firehose delivery stream is configured as a streaming source, provides the delivery stream's ARN and an IAM role that enables Amazon Kinesis Analytics to access the stream on your behalf.
     *)

  kinesis_streams_input_description: kinesis_streams_input_description option;
  (** 
    If an Amazon Kinesis stream is configured as streaming source, provides Amazon Kinesis stream's Amazon Resource Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to access the stream on your behalf.
     *)

  input_processing_configuration_description: input_processing_configuration_description option;
  (** 
    The description of the preprocessor that executes on records in this input before the application's code is run.
     *)

  in_app_stream_names: string list option;
  (** 
    Returns the in-application stream names that are mapped to the stream source.
     *)

  name_prefix: string option;
  (** 
    In-application name prefix.
     *)

  input_id: string option;
  (** 
    Input ID associated with the application input. This is the ID that Amazon Kinesis Analytics assigns to each input configuration you add to your application.
     *)

}

(** 
    Description of the CloudWatch logging option.
     *)
type cloud_watch_logging_option_description = {
  role_ar_n: string;
  (** 
    IAM ARN of the role to use to send application messages. Note: To write application messages to CloudWatch, the IAM role used must have the [PutLogEvents] policy action enabled.
     *)

  log_stream_ar_n: string;
  (** 
    ARN of the CloudWatch log to receive application messages.
     *)

  cloud_watch_logging_option_id: string option;
  (** 
    ID of the CloudWatch logging option description.
     *)

}

(** 
    This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
    
     Provides a description of the application, including the application Amazon Resource Name (ARN), status, latest version, and input and output configuration.
      *)
type application_detail = {
  application_version_id: int;
  (** 
    Provides the current application version.
     *)

  application_code: string option;
  (** 
    Returns the application code that you provided to perform data analysis on any of the in-application streams in your application.
     *)

  cloud_watch_logging_option_descriptions: cloud_watch_logging_option_description list option;
  (** 
    Describes the CloudWatch log streams that are configured to receive application messages. For more information about using CloudWatch log streams with Amazon Kinesis Analytics applications, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html}Working with Amazon CloudWatch Logs}.
     *)

  reference_data_source_descriptions: reference_data_source_description list option;
  (** 
    Describes reference data sources configured for the application. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}.
     *)

  output_descriptions: output_description list option;
  (** 
    Describes the application output configuration. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Configuring Application Output}.
     *)

  input_descriptions: input_description list option;
  (** 
    Describes the application input configuration. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}.
     *)

  last_update_timestamp: float option;
  (** 
    Time stamp when the application was last updated.
     *)

  create_timestamp: float option;
  (** 
    Time stamp when the application version was created.
     *)

  application_status: application_status;
  (** 
    Status of the application.
     *)

  application_ar_n: string;
  (** 
    ARN of the application.
     *)

  application_description: string option;
  (** 
    Description of the application.
     *)

  application_name: string;
  (** 
    Name of the application.
     *)

}

(** 
    
     *)
type describe_application_response = {
  application_detail: application_detail;
  (** 
    Provides a description of the application, such as the application Amazon Resource Name (ARN), status, latest version, and input and output configuration details.
     *)

}

(** 
    
     *)
type describe_application_request = {
  application_name: string;
  (** 
    Name of the application.
     *)

}

type delete_application_reference_data_source_response = unit

type delete_application_reference_data_source_request = {
  reference_id: string;
  (** 
    ID of the reference data source. When you add a reference data source to your application using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html}AddApplicationReferenceDataSource}, Amazon Kinesis Analytics assigns an ID. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the reference ID.
     *)

  current_application_version_id: int;
  (** 
    Version of the application. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.
     *)

  application_name: string;
  (** 
    Name of an existing application.
     *)

}

(** 
    
     *)
type delete_application_output_response = unit

(** 
    
     *)
type delete_application_output_request = {
  output_id: string;
  (** 
    The ID of the configuration to delete. Each output configuration that is added to the application, either when the application is created or later using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationOutput.html}AddApplicationOutput} operation, has a unique ID. You need to provide the ID to uniquely identify the output configuration that you want to delete from the application configuration. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the specific [OutputId].
     *)

  current_application_version_id: int;
  (** 
    Amazon Kinesis Analytics application version. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.
     *)

  application_name: string;
  (** 
    Amazon Kinesis Analytics application name.
     *)

}

type delete_application_input_processing_configuration_response = unit

type delete_application_input_processing_configuration_request = {
  input_id: string;
  (** 
    The ID of the input configuration from which to delete the input processing configuration. You can get a list of the input IDs for an application by using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation.
     *)

  current_application_version_id: int;
  (** 
    The version ID of the Kinesis Analytics application.
     *)

  application_name: string;
  (** 
    The Kinesis Analytics application name.
     *)

}

type delete_application_cloud_watch_logging_option_response = unit

type delete_application_cloud_watch_logging_option_request = {
  cloud_watch_logging_option_id: string;
  (** 
    The [CloudWatchLoggingOptionId] of the CloudWatch logging option to delete. You can get the [CloudWatchLoggingOptionId] by using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation.
     *)

  current_application_version_id: int;
  (** 
    The version ID of the Kinesis Analytics application.
     *)

  application_name: string;
  (** 
    The Kinesis Analytics application name.
     *)

}

(** 
    
     *)
type delete_application_response = unit

(** 
    
     *)
type delete_application_request = {
  create_timestamp: float;
  (** 
    You can use the [DescribeApplication] operation to get this value.
     *)

  application_name: string;
  (** 
    Name of the Amazon Kinesis Analytics application to delete.
     *)

}

(** 
    TBD
     *)
type create_application_response = {
  application_summary: application_summary;
  (** 
    In response to your [CreateApplication] request, Amazon Kinesis Analytics returns a response with a summary of the application it created, including the application Amazon Resource Name (ARN), name, and status.
     *)

}

(** 
    When you configure the application input, you specify the streaming source, the in-application stream name that is created, and the mapping between the two. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}.
     *)
type input = {
  input_schema: source_schema;
  (** 
    Describes the format of the data in the streaming source, and how each data element maps to corresponding columns in the in-application stream that is being created.
    
     Also used to describe the format of the reference data source.
      *)

  input_parallelism: input_parallelism option;
  (** 
    Describes the number of in-application streams to create.
    
     Data from your source is routed to these in-application input streams.
     
      (see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring Application Input}.
       *)

  kinesis_firehose_input: kinesis_firehose_input option;
  (** 
    If the streaming source is an Amazon Kinesis Firehose delivery stream, identifies the delivery stream's ARN and an IAM role that enables Amazon Kinesis Analytics to access the stream on your behalf.
    
     Note: Either [KinesisStreamsInput] or [KinesisFirehoseInput] is required.
      *)

  kinesis_streams_input: kinesis_streams_input option;
  (** 
    If the streaming source is an Amazon Kinesis stream, identifies the stream's Amazon Resource Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to access the stream on your behalf.
    
     Note: Either [KinesisStreamsInput] or [KinesisFirehoseInput] is required.
      *)

  input_processing_configuration: input_processing_configuration option;
  (** 
    The {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration} for the input. An input processor transforms records as they are received from the stream, before the application's SQL code executes. Currently, the only input processing configuration available is {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html}InputLambdaProcessor}.
     *)

  name_prefix: string;
  [@ocaml.doc {| 
    Name prefix to use when creating an in-application stream. Suppose that you specify a prefix "MyInApplicationStream." Amazon Kinesis Analytics then creates one or more (as per the [InputParallelism] count you specified) in-application streams with names "MyInApplicationStream_001," "MyInApplicationStream_002," and so on.
     |}]

}

(** 
    Provides a description of CloudWatch logging options, including the log stream Amazon Resource Name (ARN) and the role ARN.
     *)
type cloud_watch_logging_option = {
  role_ar_n: string;
  (** 
    IAM ARN of the role to use to send application messages. Note: To write application messages to CloudWatch, the IAM role that is used must have the [PutLogEvents] policy action enabled.
     *)

  log_stream_ar_n: string;
  (** 
    ARN of the CloudWatch log to receive application messages.
     *)

}

(** 
    TBD
     *)
type create_application_request = {
  tags: tag list option;
  (** 
    A list of one or more tags to assign to the application. A tag is a key-value pair that identifies an application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.
     *)

  application_code: string option;
  (** 
    One or more SQL statements that read input data, transform it, and generate output. For example, you can write a SQL statement that reads data from one in-application stream, generates a running average of the number of advertisement clicks by vendor, and insert resulting rows in another in-application stream using pumps. For more information about the typical pattern, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-app-code.html}Application Code}.
    
     You can provide such series of SQL statements, where output of one statement can be used as the input for the next statement. You store intermediate results by creating in-application streams and pumps.
     
      Note that the application code must create the streams with names specified in the [Outputs]. For example, if your [Outputs] defines output streams named [ExampleOutputStream1] and [ExampleOutputStream2], then your application code must create these streams.
       *)

  cloud_watch_logging_options: cloud_watch_logging_option list option;
  (** 
    Use this parameter to configure a CloudWatch log stream to monitor application configuration errors. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html}Working with Amazon CloudWatch Logs}.
     *)

  outputs: output list option;
  (** 
    You can configure application output to write data from any of the in-application streams to up to three destinations.
    
     These destinations can be Amazon Kinesis streams, Amazon Kinesis Firehose delivery streams, AWS Lambda destinations, or any combination of the three.
     
      In the configuration, you specify the in-application stream name, the destination stream or Lambda function Amazon Resource Name (ARN), and the format to use when writing data. You must also provide an IAM role that Amazon Kinesis Analytics can assume to write to the destination stream or Lambda function on your behalf.
      
       In the output configuration, you also provide the output stream or Lambda function ARN. For stream destinations, you provide the format of data in the stream (for example, JSON, CSV). You also must provide an IAM role that Amazon Kinesis Analytics can assume to write to the stream or Lambda function on your behalf.
        *)

  inputs: input list option;
  (** 
    Use this parameter to configure the application input.
    
     You can configure your application to receive input from a single streaming source. In this configuration, you map this streaming source to an in-application stream that is created. Your application code can then query the in-application stream like a table (you can think of it as a constantly updating table).
     
      For the streaming source, you provide its Amazon Resource Name (ARN) and format of data on the stream (for example, JSON, CSV, etc.). You also must provide an IAM role that Amazon Kinesis Analytics can assume to read this stream on your behalf.
      
       To create the in-application stream, you need to specify a schema to transform your data into a schematized version used in SQL. In the schema, you provide the necessary mapping of the data elements in the streaming source to record columns in the in-app stream.
        *)

  application_description: string option;
  (** 
    Summary description of the application.
     *)

  application_name: string;
  (** 
    Name of your Amazon Kinesis Analytics application (for example, [sample-app]).
     *)

}

(** 
    
     *)
type add_application_reference_data_source_response = unit

(** 
    
     *)
type add_application_reference_data_source_request = {
  reference_data_source: reference_data_source;
  (** 
    The reference data source can be an object in your Amazon S3 bucket. Amazon Kinesis Analytics reads the object and copies the data into the in-application table that is created. You provide an S3 bucket, object key name, and the resulting in-application table that is created. You must also provide an IAM role with the necessary permissions that Amazon Kinesis Analytics can assume to read the object from your S3 bucket on your behalf.
     *)

  current_application_version_id: int;
  (** 
    Version of the application for which you are adding the reference data source. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.
     *)

  application_name: string;
  (** 
    Name of an existing application.
     *)

}

(** 
    
     *)
type add_application_output_response = unit

(** 
    
     *)
type add_application_output_request = {
  output: output;
  (** 
    An array of objects, each describing one output configuration. In the output configuration, you specify the name of an in-application stream, a destination (that is, an Amazon Kinesis stream, an Amazon Kinesis Firehose delivery stream, or an AWS Lambda function), and record the formation to use when writing to the destination.
     *)

  current_application_version_id: int;
  (** 
    Version of the application to which you want to add the output configuration. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.
     *)

  application_name: string;
  (** 
    Name of the application to which you want to add the output configuration.
     *)

}

type add_application_input_processing_configuration_response = unit

type add_application_input_processing_configuration_request = {
  input_processing_configuration: input_processing_configuration;
  (** 
    The {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration} to add to the application.
     *)

  input_id: string;
  (** 
    The ID of the input configuration to add the input processing configuration to. You can get a list of the input IDs for an application using the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation.
     *)

  current_application_version_id: int;
  (** 
    Version of the application to which you want to add the input processing configuration. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to get the current application version. If the version specified is not the current version, the [ConcurrentModificationException] is returned.
     *)

  application_name: string;
  (** 
    Name of the application to which you want to add the input processing configuration.
     *)

}

(** 
    
     *)
type add_application_input_response = unit

(** 
    
     *)
type add_application_input_request = {
  input: input;
  (** 
    The {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_Input.html}Input} to add.
     *)

  current_application_version_id: int;
  (** 
    Current version of your Amazon Kinesis Analytics application. You can use the {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} operation to find the current application version.
     *)

  application_name: string;
  (** 
    Name of your existing Amazon Kinesis Analytics application to which you want to add the streaming source.
     *)

}

type add_application_cloud_watch_logging_option_response = unit

type add_application_cloud_watch_logging_option_request = {
  cloud_watch_logging_option: cloud_watch_logging_option;
  (** 
    Provides the CloudWatch log stream Amazon Resource Name (ARN) and the IAM role ARN. Note: To write application messages to CloudWatch, the IAM role that is used must have the [PutLogEvents] policy action enabled.
     *)

  current_application_version_id: int;
  (** 
    The version ID of the Kinesis Analytics application.
     *)

  application_name: string;
  (** 
    The Kinesis Analytics application name.
     *)

}

(** 
    Amazon Kinesis Analytics {b Overview}
                             
                              This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports SQL applications. Version 2 of the API supports SQL and Java applications. For more information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis Data Analytics API V2 Documentation}.
                              
                               This is the {i Amazon Kinesis Analytics v1 API Reference}. The Amazon Kinesis Analytics Developer Guide provides additional information.
                                *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_update_application_response : unit
-> update_application_response
(** Create a {!type-update_application_response} type *)

val make_input_lambda_processor_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> input_lambda_processor_update
(** Create a {!type-input_lambda_processor_update} type *)

val make_input_processing_configuration_update :
  input_lambda_processor_update:input_lambda_processor_update -> unit
-> input_processing_configuration_update
(** Create a {!type-input_processing_configuration_update} type *)

val make_kinesis_streams_input_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> kinesis_streams_input_update
(** Create a {!type-kinesis_streams_input_update} type *)

val make_kinesis_firehose_input_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> kinesis_firehose_input_update
(** Create a {!type-kinesis_firehose_input_update} type *)

val make_json_mapping_parameters : record_row_path:string -> unit
-> json_mapping_parameters
(** Create a {!type-json_mapping_parameters} type *)

val make_csv_mapping_parameters :
  record_column_delimiter:string -> record_row_delimiter:string -> unit
-> csv_mapping_parameters
(** Create a {!type-csv_mapping_parameters} type *)

val make_mapping_parameters :
  ?csv_mapping_parameters:csv_mapping_parameters ->
  ?json_mapping_parameters:json_mapping_parameters ->
  unit
-> mapping_parameters
(** Create a {!type-mapping_parameters} type *)

val make_record_format :
  ?mapping_parameters:mapping_parameters ->
  record_format_type:record_format_type ->
  unit
-> record_format
(** Create a {!type-record_format} type *)

val make_record_column :
  ?mapping:string -> sql_type:string -> name:string -> unit
-> record_column
(** Create a {!type-record_column} type *)

val make_input_schema_update :
  ?record_column_updates:record_column list ->
  ?record_encoding_update:string ->
  ?record_format_update:record_format ->
  unit
-> input_schema_update
(** Create a {!type-input_schema_update} type *)

val make_input_parallelism_update : ?count_update:int -> unit
-> input_parallelism_update
(** Create a {!type-input_parallelism_update} type *)

val make_input_update :
  ?input_parallelism_update:input_parallelism_update ->
  ?input_schema_update:input_schema_update ->
  ?kinesis_firehose_input_update:kinesis_firehose_input_update ->
  ?kinesis_streams_input_update:kinesis_streams_input_update ->
  ?input_processing_configuration_update:input_processing_configuration_update ->
  ?name_prefix_update:string ->
  input_id:string ->
  unit
-> input_update
(** Create a {!type-input_update} type *)

val make_kinesis_streams_output_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> kinesis_streams_output_update
(** Create a {!type-kinesis_streams_output_update} type *)

val make_kinesis_firehose_output_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> kinesis_firehose_output_update
(** Create a {!type-kinesis_firehose_output_update} type *)

val make_lambda_output_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> lambda_output_update
(** Create a {!type-lambda_output_update} type *)

val make_destination_schema : record_format_type:record_format_type -> unit
-> destination_schema
(** Create a {!type-destination_schema} type *)

val make_output_update :
  ?destination_schema_update:destination_schema ->
  ?lambda_output_update:lambda_output_update ->
  ?kinesis_firehose_output_update:kinesis_firehose_output_update ->
  ?kinesis_streams_output_update:kinesis_streams_output_update ->
  ?name_update:string ->
  output_id:string ->
  unit
-> output_update
(** Create a {!type-output_update} type *)

val make_s3_reference_data_source_update :
  ?reference_role_arn_update:string ->
  ?file_key_update:string ->
  ?bucket_arn_update:string ->
  unit
-> s3_reference_data_source_update
(** Create a {!type-s3_reference_data_source_update} type *)

val make_source_schema :
  ?record_encoding:string ->
  record_columns:record_column list ->
  record_format:record_format ->
  unit
-> source_schema
(** Create a {!type-source_schema} type *)

val make_reference_data_source_update :
  ?reference_schema_update:source_schema ->
  ?s3_reference_data_source_update:s3_reference_data_source_update ->
  ?table_name_update:string ->
  reference_id:string ->
  unit
-> reference_data_source_update
(** Create a {!type-reference_data_source_update} type *)

val make_cloud_watch_logging_option_update :
  ?role_arn_update:string ->
  ?log_stream_arn_update:string ->
  cloud_watch_logging_option_id:string ->
  unit
-> cloud_watch_logging_option_update
(** Create a {!type-cloud_watch_logging_option_update} type *)

val make_application_update :
  ?cloud_watch_logging_option_updates:cloud_watch_logging_option_update list ->
  ?reference_data_source_updates:reference_data_source_update list ->
  ?output_updates:output_update list ->
  ?application_code_update:string ->
  ?input_updates:input_update list ->
  unit
-> application_update
(** Create a {!type-application_update} type *)

val make_update_application_request :
  application_update:application_update ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> update_application_request
(** Create a {!type-update_application_request} type *)

val make_untag_resource_response : unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_tag : ?value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_response : unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_stop_application_response : unit
-> stop_application_response
(** Create a {!type-stop_application_response} type *)

val make_stop_application_request : application_name:string -> unit
-> stop_application_request
(** Create a {!type-stop_application_request} type *)

val make_start_application_response : unit
-> start_application_response
(** Create a {!type-start_application_response} type *)

val make_input_starting_position_configuration :
  ?input_starting_position:input_starting_position -> unit
-> input_starting_position_configuration
(** Create a {!type-input_starting_position_configuration} type *)

val make_input_configuration :
  input_starting_position_configuration:input_starting_position_configuration ->
  id:string ->
  unit
-> input_configuration
(** Create a {!type-input_configuration} type *)

val make_start_application_request :
  input_configurations:input_configuration list ->
  application_name:string ->
  unit
-> start_application_request
(** Create a {!type-start_application_request} type *)

val make_s3_reference_data_source_description :
  reference_role_ar_n:string -> file_key:string -> bucket_ar_n:string -> unit
-> s3_reference_data_source_description
(** Create a {!type-s3_reference_data_source_description} type *)

val make_s3_reference_data_source :
  reference_role_ar_n:string -> file_key:string -> bucket_ar_n:string -> unit
-> s3_reference_data_source
(** Create a {!type-s3_reference_data_source} type *)

val make_s3_configuration :
  file_key:string -> bucket_ar_n:string -> role_ar_n:string -> unit
-> s3_configuration
(** Create a {!type-s3_configuration} type *)

val make_reference_data_source_description :
  ?reference_schema:source_schema ->
  s3_reference_data_source_description:s3_reference_data_source_description ->
  table_name:string ->
  reference_id:string ->
  unit
-> reference_data_source_description
(** Create a {!type-reference_data_source_description} type *)

val make_reference_data_source :
  ?s3_reference_data_source:s3_reference_data_source ->
  reference_schema:source_schema ->
  table_name:string ->
  unit
-> reference_data_source
(** Create a {!type-reference_data_source} type *)

val make_kinesis_streams_output :
  role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_streams_output
(** Create a {!type-kinesis_streams_output} type *)

val make_kinesis_firehose_output :
  role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_firehose_output
(** Create a {!type-kinesis_firehose_output} type *)

val make_lambda_output : role_ar_n:string -> resource_ar_n:string -> unit
-> lambda_output
(** Create a {!type-lambda_output} type *)

val make_output :
  ?lambda_output:lambda_output ->
  ?kinesis_firehose_output:kinesis_firehose_output ->
  ?kinesis_streams_output:kinesis_streams_output ->
  destination_schema:destination_schema ->
  name:string ->
  unit
-> output
(** Create a {!type-output} type *)

val make_kinesis_streams_output_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> kinesis_streams_output_description
(** Create a {!type-kinesis_streams_output_description} type *)

val make_kinesis_firehose_output_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> kinesis_firehose_output_description
(** Create a {!type-kinesis_firehose_output_description} type *)

val make_lambda_output_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> lambda_output_description
(** Create a {!type-lambda_output_description} type *)

val make_output_description :
  ?destination_schema:destination_schema ->
  ?lambda_output_description:lambda_output_description ->
  ?kinesis_firehose_output_description:kinesis_firehose_output_description ->
  ?kinesis_streams_output_description:kinesis_streams_output_description ->
  ?name:string ->
  ?output_id:string ->
  unit
-> output_description
(** Create a {!type-output_description} type *)

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_application_summary :
  application_status:application_status ->
  application_ar_n:string ->
  application_name:string ->
  unit
-> application_summary
(** Create a {!type-application_summary} type *)

val make_list_applications_response :
  has_more_applications:bool ->
  application_summaries:application_summary list ->
  unit
-> list_applications_response
(** Create a {!type-list_applications_response} type *)

val make_list_applications_request :
  ?exclusive_start_application_name:string -> ?limit:int -> unit
-> list_applications_request
(** Create a {!type-list_applications_request} type *)

val make_kinesis_streams_input_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> kinesis_streams_input_description
(** Create a {!type-kinesis_streams_input_description} type *)

val make_kinesis_streams_input :
  role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_streams_input
(** Create a {!type-kinesis_streams_input} type *)

val make_kinesis_firehose_input_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> kinesis_firehose_input_description
(** Create a {!type-kinesis_firehose_input_description} type *)

val make_kinesis_firehose_input :
  role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_firehose_input
(** Create a {!type-kinesis_firehose_input} type *)

val make_discover_input_schema_response :
  ?raw_input_records:string list ->
  ?processed_input_records:string list ->
  ?parsed_input_records:string list list ->
  ?input_schema:source_schema ->
  unit
-> discover_input_schema_response
(** Create a {!type-discover_input_schema_response} type *)

val make_input_lambda_processor :
  role_ar_n:string -> resource_ar_n:string -> unit
-> input_lambda_processor
(** Create a {!type-input_lambda_processor} type *)

val make_input_processing_configuration :
  input_lambda_processor:input_lambda_processor -> unit
-> input_processing_configuration
(** Create a {!type-input_processing_configuration} type *)

val make_discover_input_schema_request :
  ?input_processing_configuration:input_processing_configuration ->
  ?s3_configuration:s3_configuration ->
  ?input_starting_position_configuration:input_starting_position_configuration ->
  ?role_ar_n:string ->
  ?resource_ar_n:string ->
  unit
-> discover_input_schema_request
(** Create a {!type-discover_input_schema_request} type *)

val make_input_lambda_processor_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> input_lambda_processor_description
(** Create a {!type-input_lambda_processor_description} type *)

val make_input_processing_configuration_description :
  ?input_lambda_processor_description:input_lambda_processor_description ->
  unit
-> input_processing_configuration_description
(** Create a {!type-input_processing_configuration_description} type *)

val make_input_parallelism : ?count:int -> unit
-> input_parallelism
(** Create a {!type-input_parallelism} type *)

val make_input_description :
  ?input_starting_position_configuration:input_starting_position_configuration ->
  ?input_parallelism:input_parallelism ->
  ?input_schema:source_schema ->
  ?kinesis_firehose_input_description:kinesis_firehose_input_description ->
  ?kinesis_streams_input_description:kinesis_streams_input_description ->
  ?input_processing_configuration_description:input_processing_configuration_description ->
  ?in_app_stream_names:string list ->
  ?name_prefix:string ->
  ?input_id:string ->
  unit
-> input_description
(** Create a {!type-input_description} type *)

val make_cloud_watch_logging_option_description :
  ?cloud_watch_logging_option_id:string ->
  role_ar_n:string ->
  log_stream_ar_n:string ->
  unit
-> cloud_watch_logging_option_description
(** Create a {!type-cloud_watch_logging_option_description} type *)

val make_application_detail :
  ?application_code:string ->
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_description list ->
  ?reference_data_source_descriptions:reference_data_source_description list ->
  ?output_descriptions:output_description list ->
  ?input_descriptions:input_description list ->
  ?last_update_timestamp:float ->
  ?create_timestamp:float ->
  ?application_description:string ->
  application_version_id:int ->
  application_status:application_status ->
  application_ar_n:string ->
  application_name:string ->
  unit
-> application_detail
(** Create a {!type-application_detail} type *)

val make_describe_application_response :
  application_detail:application_detail -> unit
-> describe_application_response
(** Create a {!type-describe_application_response} type *)

val make_describe_application_request : application_name:string -> unit
-> describe_application_request
(** Create a {!type-describe_application_request} type *)

val make_delete_application_reference_data_source_response : unit
-> delete_application_reference_data_source_response
(** Create a {!type-delete_application_reference_data_source_response} type *)

val make_delete_application_reference_data_source_request :
  reference_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_reference_data_source_request
(** Create a {!type-delete_application_reference_data_source_request} type *)

val make_delete_application_output_response : unit
-> delete_application_output_response
(** Create a {!type-delete_application_output_response} type *)

val make_delete_application_output_request :
  output_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_output_request
(** Create a {!type-delete_application_output_request} type *)

val make_delete_application_input_processing_configuration_response : 
unit
-> delete_application_input_processing_configuration_response
(** Create a {!type-delete_application_input_processing_configuration_response} type *)

val make_delete_application_input_processing_configuration_request :
  input_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_input_processing_configuration_request
(** Create a {!type-delete_application_input_processing_configuration_request} type *)

val make_delete_application_cloud_watch_logging_option_response : unit
-> delete_application_cloud_watch_logging_option_response
(** Create a {!type-delete_application_cloud_watch_logging_option_response} type *)

val make_delete_application_cloud_watch_logging_option_request :
  cloud_watch_logging_option_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_cloud_watch_logging_option_request
(** Create a {!type-delete_application_cloud_watch_logging_option_request} type *)

val make_delete_application_response : unit
-> delete_application_response
(** Create a {!type-delete_application_response} type *)

val make_delete_application_request :
  create_timestamp:float -> application_name:string -> unit
-> delete_application_request
(** Create a {!type-delete_application_request} type *)

val make_create_application_response :
  application_summary:application_summary -> unit
-> create_application_response
(** Create a {!type-create_application_response} type *)

val make_input :
  ?input_parallelism:input_parallelism ->
  ?kinesis_firehose_input:kinesis_firehose_input ->
  ?kinesis_streams_input:kinesis_streams_input ->
  ?input_processing_configuration:input_processing_configuration ->
  input_schema:source_schema ->
  name_prefix:string ->
  unit
-> input
(** Create a {!type-input} type *)

val make_cloud_watch_logging_option :
  role_ar_n:string -> log_stream_ar_n:string -> unit
-> cloud_watch_logging_option
(** Create a {!type-cloud_watch_logging_option} type *)

val make_create_application_request :
  ?tags:tag list ->
  ?application_code:string ->
  ?cloud_watch_logging_options:cloud_watch_logging_option list ->
  ?outputs:output list ->
  ?inputs:input list ->
  ?application_description:string ->
  application_name:string ->
  unit
-> create_application_request
(** Create a {!type-create_application_request} type *)

val make_add_application_reference_data_source_response : unit
-> add_application_reference_data_source_response
(** Create a {!type-add_application_reference_data_source_response} type *)

val make_add_application_reference_data_source_request :
  reference_data_source:reference_data_source ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_reference_data_source_request
(** Create a {!type-add_application_reference_data_source_request} type *)

val make_add_application_output_response : unit
-> add_application_output_response
(** Create a {!type-add_application_output_response} type *)

val make_add_application_output_request :
  output:output ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_output_request
(** Create a {!type-add_application_output_request} type *)

val make_add_application_input_processing_configuration_response : unit
-> add_application_input_processing_configuration_response
(** Create a {!type-add_application_input_processing_configuration_response} type *)

val make_add_application_input_processing_configuration_request :
  input_processing_configuration:input_processing_configuration ->
  input_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_input_processing_configuration_request
(** Create a {!type-add_application_input_processing_configuration_request} type *)

val make_add_application_input_response : unit
-> add_application_input_response
(** Create a {!type-add_application_input_response} type *)

val make_add_application_input_request :
  input:input ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_input_request
(** Create a {!type-add_application_input_request} type *)

val make_add_application_cloud_watch_logging_option_response : unit
-> add_application_cloud_watch_logging_option_response
(** Create a {!type-add_application_cloud_watch_logging_option_response} type *)

val make_add_application_cloud_watch_logging_option_request :
  cloud_watch_logging_option:cloud_watch_logging_option ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_cloud_watch_logging_option_request
(** Create a {!type-add_application_cloud_watch_logging_option_request} type *)

(** {1:operations Operations} *)

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

