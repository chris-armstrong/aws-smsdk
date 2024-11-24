open Smaws_Lib
let service =
  Service.{
    namespace = "kinesisanalytics";
    endpointPrefix = "kinesisanalytics";
    version = "2018-05-23";
    protocol = AwsJson_1_1
  };

type log_level = | DEBUG
  | ERROR
  | WARN
  | INFO

(**{|
    Updates to the monitoring configuration for Apache Zeppelin within a
    Managed Service for Apache Flink Studio notebook.|}*)
type zeppelin_monitoring_configuration_update = {
  log_level_update: log_level;
   (**{|
    Updates to the logging level for Apache Zeppelin within a Managed Service
    for Apache Flink Studio notebook.|}*)

}

(**{|
    The monitoring configuration for Apache Zeppelin within a Managed Service
    for Apache Flink Studio notebook.|}*)
type zeppelin_monitoring_configuration_description = {
  log_level: log_level option;
   (**{|
    Describes the verbosity of the CloudWatch Logs for an application.|}*)

}

(**{|
    Describes configuration parameters for Amazon CloudWatch logging for a
    Managed Service for Apache Flink Studio notebook. For more information
    about CloudWatch logging, see
    {{: https://docs.aws.amazon.com/kinesisanalytics/latest/java/monitoring-overview.html }Monitoring}.
    |}*)
type zeppelin_monitoring_configuration = {
  log_level: log_level;
   (**{|
    The verbosity of the CloudWatch Logs for an application.|}*)

}

(**{|
    Updates to the configuration of the Glue Data Catalog that you use for
    SQL queries that you write in a Managed Service for Apache Flink Studio
    notebook.|}*)
type glue_data_catalog_configuration_update = {
  database_arn_update: string;
   (**{|
    The updated Amazon Resource Name (ARN) of the database.|}*)

}

(**{|
    Updates to the configuration parameters for the default Amazon Glue
    database. You use this database for SQL queries that you write in a
    Managed Service for Apache Flink Studio notebook.|}*)
type catalog_configuration_update = {
  glue_data_catalog_configuration_update: glue_data_catalog_configuration_update;
   (**{|
    Updates to the configuration parameters for the default Amazon Glue
    database. You use this database for SQL queries that you write in a
    Managed Service for Apache Flink Studio notebook.|}*)

}

(**{|
    The information required to update the S3 base location that holds the
    application.|}*)
type s3_content_base_location_update = {
  base_path_update: string option;
   (**{|
    The updated S3 bucket path.|}*)

  bucket_arn_update: string option;
   (**{|
    The updated Amazon Resource Name (ARN) of the S3 bucket.|}*)

}

(**{|
    Updates to the configuration information required to deploy an Amazon
    Data Analytics Studio notebook as an application with durable state.|}*)
type deploy_as_application_configuration_update = {
  s3_content_location_update: s3_content_base_location_update option;
   (**{|
    Updates to the location that holds the data required to specify an Amazon
    Data Analytics application.|}*)

}

type artifact_type = | DEPENDENCY_JAR
  | UDF

(**{|
    For a Managed Service for Apache Flink application provides a description
    of an Amazon S3 object, including the Amazon Resource Name (ARN) of the
    S3 bucket, the name of the Amazon S3 object that contains the data, and
    the version number of the Amazon S3 object that contains the data.|}*)
type s3_content_location = {
  object_version: string option;
   (**{|
    The version of the object containing the application code.|}*)

  file_key: string;
   (**{|
    The file key for the object containing the application code.|}*)

  bucket_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) for the S3 bucket containing the
    application code.|}*)

}

(**{|
    The information required to specify a Maven reference. You can use Maven
    references to specify dependency JAR files.|}*)
type maven_reference = {
  version: string;
   (**{|
    The version of the Maven reference.|}*)

  artifact_id: string;
   (**{|
    The artifact ID of the Maven reference.|}*)

  group_id: string;
   (**{|
    The group ID of the Maven reference.|}*)

}

(**{|
    Specifies dependency JARs, as well as JAR files that contain user-defined
    functions (UDF).|}*)
type custom_artifact_configuration = {
  maven_reference: maven_reference option;
   (**{|
    The parameters required to fully specify a Maven reference.|}*)

  s3_content_location: s3_content_location option;
  
  artifact_type: artifact_type;
   (**{|
    [UDF] stands for user-defined functions. This type of artifact must be in
    an S3 bucket. A [DEPENDENCY_JAR] can be in either Maven or an S3 bucket.|}*)

}

(**{|
    Updates to the configuration of Managed Service for Apache Flink Studio
    notebook.|}*)
type zeppelin_application_configuration_update = {
  custom_artifacts_configuration_update: custom_artifact_configuration list option;
   (**{|
    Updates to the customer artifacts. Custom artifacts are dependency JAR
    files and user-defined functions (UDF).|}*)

  deploy_as_application_configuration_update: deploy_as_application_configuration_update option;
  
  catalog_configuration_update: catalog_configuration_update option;
   (**{|
    Updates to the configuration of the Amazon Glue Data Catalog that is
    associated with the Managed Service for Apache Flink Studio notebook.|}*)

  monitoring_configuration_update: zeppelin_monitoring_configuration_update option;
   (**{|
    Updates to the monitoring configuration of a Managed Service for Apache
    Flink Studio notebook.|}*)

}

(**{|
    The configuration of the Glue Data Catalog that you use for Apache Flink
    SQL queries and table API transforms that you write in an application.|}*)
type glue_data_catalog_configuration_description = {
  database_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the database.|}*)

}

(**{|
    The configuration parameters for the default Amazon Glue database. You
    use this database for Apache Flink SQL queries and table API transforms
    that you write in a Managed Service for Apache Flink Studio notebook.|}*)
type catalog_configuration_description = {
  glue_data_catalog_configuration_description: glue_data_catalog_configuration_description;
   (**{|
    The configuration parameters for the default Amazon Glue database. You
    use this database for SQL queries that you write in a Managed Service for
    Apache Flink Studio notebook.|}*)

}

(**{|
    The description of the S3 base location that holds the application.|}*)
type s3_content_base_location_description = {
  base_path: string option;
   (**{|
    The base path for the S3 bucket.|}*)

  bucket_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the S3 bucket.|}*)

}

(**{|
    The configuration information required to deploy an Amazon Data Analytics
    Studio notebook as an application with durable state.|}*)
type deploy_as_application_configuration_description = {
  s3_content_location_description: s3_content_base_location_description;
   (**{|
    The location that holds the data required to specify an Amazon Data
    Analytics application.|}*)

}

(**{|
    Specifies a dependency JAR or a JAR of user-defined functions.|}*)
type custom_artifact_configuration_description = {
  maven_reference_description: maven_reference option;
   (**{|
    The parameters that are required to specify a Maven dependency.|}*)

  s3_content_location_description: s3_content_location option;
  
  artifact_type: artifact_type option;
   (**{|
    [UDF] stands for user-defined functions. This type of artifact must be in
    an S3 bucket. A [DEPENDENCY_JAR] can be in either Maven or an S3 bucket.|}*)

}

(**{|
    The configuration of a Managed Service for Apache Flink Studio notebook.|}*)
type zeppelin_application_configuration_description = {
  custom_artifacts_configuration_description: custom_artifact_configuration_description list option;
   (**{|
    Custom artifacts are dependency JARs and user-defined functions (UDF).|}*)

  deploy_as_application_configuration_description: deploy_as_application_configuration_description option;
   (**{|
    The parameters required to deploy a Managed Service for Apache Flink
    Studio notebook as an application with durable state.|}*)

  catalog_configuration_description: catalog_configuration_description option;
   (**{|
    The Amazon Glue Data Catalog that is associated with the Managed Service
    for Apache Flink Studio notebook.|}*)

  monitoring_configuration_description: zeppelin_monitoring_configuration_description;
   (**{|
    The monitoring configuration of a Managed Service for Apache Flink Studio
    notebook.|}*)

}

(**{|
    The configuration of the Glue Data Catalog that you use for Apache Flink
    SQL queries and table API transforms that you write in an application.|}*)
type glue_data_catalog_configuration = {
  database_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the database.|}*)

}

(**{|
    The configuration parameters for the default Amazon Glue database. You
    use this database for SQL queries that you write in a Managed Service for
    Apache Flink Studio notebook.|}*)
type catalog_configuration = {
  glue_data_catalog_configuration: glue_data_catalog_configuration;
   (**{|
    The configuration parameters for the default Amazon Glue database. You
    use this database for Apache Flink SQL queries and table API transforms
    that you write in a Managed Service for Apache Flink Studio notebook.|}*)

}

(**{|
    The S3 bucket that holds the application information.|}*)
type s3_content_base_location = {
  base_path: string option;
   (**{|
    The base path for the S3 bucket.|}*)

  bucket_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the S3 bucket.|}*)

}

(**{|
    The information required to deploy a Managed Service for Apache Flink
    Studio notebook as an application with durable state.|}*)
type deploy_as_application_configuration = {
  s3_content_location: s3_content_base_location;
   (**{|
    The description of an Amazon S3 object that contains the Amazon Data
    Analytics application, including the Amazon Resource Name (ARN) of the S3
    bucket, the name of the Amazon S3 object that contains the data, and the
    version number of the Amazon S3 object that contains the data.|}*)

}

(**{|
    The configuration of a Managed Service for Apache Flink Studio notebook.|}*)
type zeppelin_application_configuration = {
  custom_artifacts_configuration: custom_artifact_configuration list option;
   (**{|
    Custom artifacts are dependency JARs and user-defined functions (UDF).|}*)

  deploy_as_application_configuration: deploy_as_application_configuration option;
   (**{|
    The information required to deploy a Managed Service for Apache Flink
    Studio notebook as an application with durable state.|}*)

  catalog_configuration: catalog_configuration option;
   (**{|
    The Amazon Glue Data Catalog that you use in queries in a Managed Service
    for Apache Flink Studio notebook.|}*)

  monitoring_configuration: zeppelin_monitoring_configuration option;
   (**{|
    The monitoring configuration of a Managed Service for Apache Flink Studio
    notebook.|}*)

}

(**{|
    Describes the parameters of a VPC used by the application.|}*)
type vpc_configuration = {
  security_group_ids: string list;
   (**{|
    The array of
    {{: https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html }SecurityGroup}
    IDs used by the VPC configuration.|}*)

  subnet_ids: string list;
   (**{|
    The array of
    {{: https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html }Subnet}
    IDs used by the VPC configuration.|}*)

}

(**{|
    Describes updates to the VPC configuration used by the application.|}*)
type vpc_configuration_update = {
  security_group_id_updates: string list option;
   (**{|
    Describes updates to the array of
    {{: https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html }SecurityGroup}
    IDs used by the VPC configuration.|}*)

  subnet_id_updates: string list option;
   (**{|
    Describes updates to the array of
    {{: https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html }Subnet}
    IDs used by the VPC configuration.|}*)

  vpc_configuration_id: string;
   (**{|
    Describes an update to the ID of the VPC configuration.|}*)

}

(**{|
    Describes the parameters of a VPC used by the application.|}*)
type vpc_configuration_description = {
  security_group_ids: string list;
   (**{|
    The array of
    {{: https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html }SecurityGroup}
    IDs used by the VPC configuration.|}*)

  subnet_ids: string list;
   (**{|
    The array of
    {{: https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html }Subnet}
    IDs used by the VPC configuration.|}*)

  vpc_id: string;
   (**{|
    The ID of the associated VPC.|}*)

  vpc_configuration_id: string;
   (**{|
    The ID of the VPC configuration.|}*)

}

type url_type = | ZEPPELIN_UI_URL
  | FLINK_DASHBOARD_URL

type runtime_environment = | FLINK_1_18
  | ZEPPELIN_FLINK_3_0
  | FLINK_1_15
  | ZEPPELIN_FLINK_2_0
  | FLINK_1_13
  | FLINK_1_11
  | ZEPPELIN_FLINK_1_0
  | FLINK_1_8
  | FLINK_1_6
  | SQL_1_0

type application_status = | ROLLED_BACK
  | MAINTENANCE
  | ROLLING_BACK
  | FORCE_STOPPING
  | AUTOSCALING
  | UPDATING
  | RUNNING
  | READY
  | STOPPING
  | STARTING
  | DELETING

(**{|
    For a SQL-based Kinesis Data Analytics application, an object that
    contains the Amazon Resource Name (ARN) of the Amazon Lambda function
    that is used to preprocess records in the stream.|}*)
type input_lambda_processor_description = {
  role_ar_n: string option;
   (**{|
    The ARN of the IAM role that is used to access the Amazon Lambda function.
    
    Provided for backward compatibility. Applications that are created with
    the current API version have an application-level service execution role
    rather than a resource-level role.
    |}*)

  resource_ar_n: string;
   (**{|
    The ARN of the Amazon Lambda function that is used to preprocess the
    records in the stream.
    
    To specify an earlier version of the Lambda function than the latest,
    include the Lambda function version in the Lambda function ARN. For more
    information about Lambda ARNs, see
    {{: https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda }Example
    ARNs: Amazon Lambda}
    |}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, provides the
    configuration information about an input processor. Currently, the only
    input processor available is
    {{: https://docs.aws.amazon.com/lambda/ }Amazon Lambda}.|}*)
type input_processing_configuration_description = {
  input_lambda_processor_description: input_lambda_processor_description option;
   (**{|
    Provides configuration information about the associated
    {{:  }InputLambdaProcessorDescription}|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes the Kinesis
    data stream that is configured as the streaming source in the application
    input configuration.|}*)
type kinesis_streams_input_description = {
  role_ar_n: string option;
   (**{|
    The ARN of the IAM role that Kinesis Data Analytics can assume to access
    the stream.
    
    Provided for backward compatibility. Applications that are created with
    the current API version have an application-level service execution role
    rather than a resource-level role.
    |}*)

  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the Kinesis data stream.|}*)

}

(**{|
    Describes the Amazon Kinesis Data Firehose delivery stream that is
    configured as the streaming source in the application input
    configuration.|}*)
type kinesis_firehose_input_description = {
  role_ar_n: string option;
   (**{|
    The ARN of the IAM role that Kinesis Data Analytics assumes to access the
    stream.
    
    Provided for backward compatibility. Applications that are created with
    the current API version have an application-level service execution role
    rather than a resource-level role.
    |}*)

  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the delivery stream.|}*)

}

type record_format_type = | CSV
  | JSON

(**{|
    For a SQL-based Kinesis Data Analytics application, provides additional
    mapping information when JSON is the record format on the streaming
    source.|}*)
type json_mapping_parameters = {
  record_row_path: string;
   (**{|
    The path to the top-level parent that contains the records.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, provides additional
    mapping information when the record format uses delimiters, such as CSV.
    For example, the following sample records use CSV format, where the
    records use the {i '\n'} as the row delimiter and a comma (",") as the
    column delimiter:
    
    ["name1", "address1"]
    
    ["name2", "address2"]|}*)
type csv_mapping_parameters = {
  record_column_delimiter: string;
   (**{|
    The column delimiter. For example, in a CSV format, a comma (",") is the
    typical column delimiter.|}*)

  record_row_delimiter: string;
   (**{|
    The row delimiter. For example, in a CSV format, {i '\n'} is the typical
    row delimiter.|}*)

}

(**{|
    When you configure a SQL-based Kinesis Data Analytics application's input
    at the time of creating or updating an application, provides additional
    mapping information specific to the record format (such as JSON, CSV, or
    record fields delimited by some delimiter) on the streaming source.|}*)
type mapping_parameters = {
  csv_mapping_parameters: csv_mapping_parameters option;
   (**{|
    Provides additional mapping information when the record format uses
    delimiters (for example, CSV).|}*)

  json_mapping_parameters: json_mapping_parameters option;
   (**{|
    Provides additional mapping information when JSON is the record format on
    the streaming source.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes the record
    format and relevant mapping information that should be applied to
    schematize the records on the stream.|}*)
type record_format = {
  mapping_parameters: mapping_parameters option;
   (**{|
    When you configure application input at the time of creating or updating
    an application, provides additional mapping information specific to the
    record format (such as JSON, CSV, or record fields delimited by some
    delimiter) on the streaming source.|}*)

  record_format_type: record_format_type;
   (**{|
    The type of record format.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes the mapping
    of each data element in the streaming source to the corresponding column
    in the in-application stream.
    
    Also used to describe the format of the reference data source.|}*)
type record_column = {
  sql_type: string;
   (**{|
    The type of column created in the in-application input stream or
    reference table.|}*)

  mapping: string option;
   (**{|
    A reference to the data element in the streaming input or the reference
    data source.|}*)

  name: string;
   (**{|
    The name of the column that is created in the in-application input stream
    or reference table.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes the format
    of the data in the streaming source, and how each data element maps to
    corresponding columns created in the in-application stream.|}*)
type source_schema = {
  record_columns: record_column list;
   (**{|
    A list of [RecordColumn] objects.|}*)

  record_encoding: string option;
   (**{|
    Specifies the encoding of the records in the streaming source. For
    example, UTF-8.|}*)

  record_format: record_format;
   (**{|
    Specifies the format of the records on the streaming source.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes the number
    of in-application streams to create for a given streaming source.|}*)
type input_parallelism = {
  count: int option;
   (**{|
    The number of in-application streams to create.|}*)

}

type input_starting_position = | LAST_STOPPED_POINT
  | TRIM_HORIZON
  | NOW

(**{|
    Describes the point at which the application reads from the streaming
    source.|}*)
type input_starting_position_configuration = {
  input_starting_position: input_starting_position option;
   (**{|
    The starting position on the stream.
    
    {ol 
          {- [NOW] - Start reading just after the most recent record in the
             stream, and start at the request timestamp that the customer
             issued.
             }
          
          {- [TRIM_HORIZON] - Start reading at the last untrimmed record in
             the stream, which is the oldest record available in the stream.
             This option is not available for an Amazon Kinesis Data Firehose
             delivery stream.
             }
          
          {- [LAST_STOPPED_POINT] - Resume reading from where the application
             last stopped reading.
             }
          
    }
    |}*)

}

(**{|
    Describes the application input configuration for a SQL-based Kinesis
    Data Analytics application.|}*)
type input_description = {
  input_starting_position_configuration: input_starting_position_configuration option;
   (**{|
    The point at which the application is configured to read from the input
    stream.|}*)

  input_parallelism: input_parallelism option;
   (**{|
    Describes the configured parallelism (number of in-application streams
    mapped to the streaming source).|}*)

  input_schema: source_schema option;
   (**{|
    Describes the format of the data in the streaming source, and how each
    data element maps to corresponding columns in the in-application stream
    that is being created.|}*)

  kinesis_firehose_input_description: kinesis_firehose_input_description option;
   (**{|
    If a Kinesis Data Firehose delivery stream is configured as a streaming
    source, provides the delivery stream's ARN.|}*)

  kinesis_streams_input_description: kinesis_streams_input_description option;
   (**{|
    If a Kinesis data stream is configured as a streaming source, provides
    the Kinesis data stream's Amazon Resource Name (ARN).|}*)

  input_processing_configuration_description: input_processing_configuration_description option;
   (**{|
    The description of the preprocessor that executes on records in this
    input before the application's code is run.|}*)

  in_app_stream_names: string list option;
   (**{|
    Returns the in-application stream names that are mapped to the stream
    source.|}*)

  name_prefix: string option;
   (**{|
    The in-application name prefix.|}*)

  input_id: string option;
   (**{|
    The input ID that is associated with the application input. This is the
    ID that Kinesis Data Analytics assigns to each input configuration that
    you add to your application.|}*)

}

(**{|
    For an SQL-based Kinesis Data Analytics application's output, describes
    the Kinesis data stream that is configured as its destination.|}*)
type kinesis_streams_output_description = {
  role_ar_n: string option;
   (**{|
    The ARN of the IAM role that Kinesis Data Analytics can assume to access
    the stream.
    
    Provided for backward compatibility. Applications that are created with
    the current API version have an application-level service execution role
    rather than a resource-level role.
    |}*)

  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the Kinesis data stream.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application's output, describes
    the Kinesis Data Firehose delivery stream that is configured as its
    destination.|}*)
type kinesis_firehose_output_description = {
  role_ar_n: string option;
   (**{|
    The ARN of the IAM role that Kinesis Data Analytics can assume to access
    the stream.
    
    Provided for backward compatibility. Applications that are created with
    the current API version have an application-level service execution role
    rather than a resource-level role.
    |}*)

  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the delivery stream.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application's output, describes
    the Amazon Lambda function that is configured as its destination.|}*)
type lambda_output_description = {
  role_ar_n: string option;
   (**{|
    The ARN of the IAM role that Kinesis Data Analytics can assume to write
    to the destination function.
    
    Provided for backward compatibility. Applications that are created with
    the current API version have an application-level service execution role
    rather than a resource-level role.
    |}*)

  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the destination Lambda function.|}*)

}

(**{|
    Describes the data format when records are written to the destination in
    a SQL-based Kinesis Data Analytics application.|}*)
type destination_schema = {
  record_format_type: record_format_type;
   (**{|
    Specifies the format of the records on the output stream.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes the
    application output configuration, which includes the in-application
    stream name and the destination where the stream data is written. The
    destination can be a Kinesis data stream or a Kinesis Data Firehose
    delivery stream.|}*)
type output_description = {
  destination_schema: destination_schema option;
   (**{|
    The data format used for writing data to the destination.|}*)

  lambda_output_description: lambda_output_description option;
   (**{|
    Describes the Lambda function that is configured as the destination where
    output is written.|}*)

  kinesis_firehose_output_description: kinesis_firehose_output_description option;
   (**{|
    Describes the Kinesis Data Firehose delivery stream that is configured as
    the destination where output is written.|}*)

  kinesis_streams_output_description: kinesis_streams_output_description option;
   (**{|
    Describes the Kinesis data stream that is configured as the destination
    where output is written.|}*)

  name: string option;
   (**{|
    The name of the in-application stream that is configured as output.|}*)

  output_id: string option;
   (**{|
    A unique identifier for the output configuration.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, provides the bucket
    name and object key name that stores the reference data.|}*)
type s3_reference_data_source_description = {
  reference_role_ar_n: string option;
   (**{|
    The ARN of the IAM role that Kinesis Data Analytics can assume to read
    the Amazon S3 object on your behalf to populate the in-application
    reference table.
    
    Provided for backward compatibility. Applications that are created with
    the current API version have an application-level service execution role
    rather than a resource-level role.
    |}*)

  file_key: string;
   (**{|
    Amazon S3 object key name.|}*)

  bucket_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the S3 bucket.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes the
    reference data source configured for an application.|}*)
type reference_data_source_description = {
  reference_schema: source_schema option;
   (**{|
    Describes the format of the data in the streaming source, and how each
    data element maps to corresponding columns created in the in-application
    stream.|}*)

  s3_reference_data_source_description: s3_reference_data_source_description;
   (**{|
    Provides the Amazon S3 bucket name, the object key name that contains the
    reference data.|}*)

  table_name: string;
   (**{|
    The in-application table name created by the specific reference data
    source configuration.|}*)

  reference_id: string;
   (**{|
    The ID of the reference data source. This is the ID that Kinesis Data
    Analytics assigns when you add the reference data source to your
    application using the {{:  }CreateApplication} or
    {{:  }UpdateApplication} operation.|}*)

}

(**{|
    Describes the inputs, outputs, and reference data sources for a SQL-based
    Kinesis Data Analytics application.|}*)
type sql_application_configuration_description = {
  reference_data_source_descriptions: reference_data_source_description list option;
   (**{|
    The array of {{:  }ReferenceDataSourceDescription} objects describing the
    reference data sources used by the application.|}*)

  output_descriptions: output_description list option;
   (**{|
    The array of {{:  }OutputDescription} objects describing the destination
    streams used by the application.|}*)

  input_descriptions: input_description list option;
   (**{|
    The array of {{:  }InputDescription} objects describing the input streams
    used by the application.|}*)

}

type code_content_type = | ZIPFILE
  | PLAINTEXT

(**{|
    Describes the location of an application's code stored in an S3 bucket.|}*)
type s3_application_code_location_description = {
  object_version: string option;
   (**{|
    The version of the object containing the application code.|}*)

  file_key: string;
   (**{|
    The file key for the object containing the application code.|}*)

  bucket_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) for the S3 bucket containing the
    application code.|}*)

}

(**{|
    Describes details about the code of a Managed Service for Apache Flink
    application.|}*)
type code_content_description = {
  s3_application_code_location_description: s3_application_code_location_description option;
   (**{|
    The S3 bucket Amazon Resource Name (ARN), file key, and object version of
    the application code stored in Amazon S3.|}*)

  code_size: int option;
   (**{|
    The size in bytes of the application code. Can be used to validate
    zip-format code.|}*)

  code_m_d5: string option;
   (**{|
    The checksum that can be used to validate zip-format code.|}*)

  text_content: string option;
   (**{|
    The text-format code|}*)

}

(**{|
    Describes code configuration for an application.|}*)
type application_code_configuration_description = {
  code_content_description: code_content_description option;
   (**{|
    Describes details about the location and format of the application code.|}*)

  code_content_type: code_content_type;
   (**{|
    Specifies whether the code content is in text or zip format.|}*)

}

type application_restore_type = | RESTORE_FROM_CUSTOM_SNAPSHOT
  | RESTORE_FROM_LATEST_SNAPSHOT
  | SKIP_RESTORE_FROM_SNAPSHOT

(**{|
    Specifies the method and snapshot to use when restarting an application
    using previously saved application state.|}*)
type application_restore_configuration = {
  snapshot_name: string option;
   (**{|
    The identifier of an existing snapshot of application state to use to
    restart an application. The application uses this value if
    [RESTORE_FROM_CUSTOM_SNAPSHOT] is specified for the
    [ApplicationRestoreType].|}*)

  application_restore_type: application_restore_type;
   (**{|
    Specifies how the application should be restored.|}*)

}

(**{|
    Describes the starting parameters for a Managed Service for Apache Flink
    application.|}*)
type flink_run_configuration = {
  allow_non_restored_state: bool option;
   (**{|
    When restoring from a snapshot, specifies whether the runtime is allowed
    to skip a state that cannot be mapped to the new program. This will
    happen if the program is updated between snapshots to remove stateful
    parameters, and state data in the snapshot no longer corresponds to valid
    application data. For more information, see
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/docs/ops/state/savepoints/#allowing-non-restored-state }Allowing
    Non-Restored State} in the
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/ }Apache
    Flink documentation}.
    
    This value defaults to [false]. If you update your application without
    specifying this parameter, [AllowNonRestoredState] will be set to
    [false], even if it was previously set to [true].
    |}*)

}

(**{|
    Describes the starting properties for a Managed Service for Apache Flink
    application.|}*)
type run_configuration_description = {
  flink_run_configuration_description: flink_run_configuration option;
  
  application_restore_configuration_description: application_restore_configuration option;
   (**{|
    Describes the restore behavior of a restarting application.|}*)

}

type configuration_type = | CUSTOM
  | DEFAULT

(**{|
    Describes checkpointing parameters for a Managed Service for Apache Flink
    application.|}*)
type checkpoint_configuration_description = {
  min_pause_between_checkpoints: int option;
   (**{|
    Describes the minimum time in milliseconds after a checkpoint operation
    completes that a new checkpoint operation can start.
    
    If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the
    application will use a [MinPauseBetweenCheckpoints] value of 5000, even
    if this value is set using this API or in application code.
    |}*)

  checkpoint_interval: int option;
   (**{|
    Describes the interval in milliseconds between checkpoint operations.
    
    If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the
    application will use a [CheckpointInterval] value of 60000, even if this
    value is set to another value using this API or in application code.
    |}*)

  checkpointing_enabled: bool option;
   (**{|
    Describes whether checkpointing is enabled for a Managed Service for
    Apache Flink application.
    
    If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the
    application will use a [CheckpointingEnabled] value of [true], even if
    this value is set to another value using this API or in application code.
    |}*)

  configuration_type: configuration_type option;
   (**{|
    Describes whether the application uses the default checkpointing behavior
    in Managed Service for Apache Flink.
    
    If this value is set to [DEFAULT], the application will use the following
    values, even if they are set to other values using APIs or application
    code:
    
    {ol 
          {- {b CheckpointingEnabled:} true
             }
          
          {- {b CheckpointInterval:} 60000
             }
          
          {- {b MinPauseBetweenCheckpoints:} 5000
             }
          
    }
    |}*)

}

type metrics_level = | PARALLELISM
  | OPERATOR
  | TASK
  | APPLICATION

(**{|
    Describes configuration parameters for CloudWatch logging for an
    application.|}*)
type monitoring_configuration_description = {
  log_level: log_level option;
   (**{|
    Describes the verbosity of the CloudWatch Logs for an application.|}*)

  metrics_level: metrics_level option;
   (**{|
    Describes the granularity of the CloudWatch Logs for an application.|}*)

  configuration_type: configuration_type option;
   (**{|
    Describes whether to use the default CloudWatch logging configuration for
    an application.|}*)

}

(**{|
    Describes parameters for how a Managed Service for Apache Flink
    application executes multiple tasks simultaneously.|}*)
type parallelism_configuration_description = {
  auto_scaling_enabled: bool option;
   (**{|
    Describes whether the Managed Service for Apache Flink service can
    increase the parallelism of the application in response to increased
    throughput.|}*)

  current_parallelism: int option;
   (**{|
    Describes the current number of parallel tasks that a Managed Service for
    Apache Flink application can perform. If [AutoScalingEnabled] is set to
    True, Managed Service for Apache Flink can increase this value in
    response to application load. The service can increase this value up to
    the maximum parallelism, which is [ParalellismPerKPU] times the maximum
    KPUs for the application. The maximum KPUs for an application is 32 by
    default, and can be increased by requesting a limit increase. If
    application load is reduced, the service can reduce the
    [CurrentParallelism] value down to the [Parallelism] setting.|}*)

  parallelism_per_kp_u: int option;
   (**{|
    Describes the number of parallel tasks that a Managed Service for Apache
    Flink application can perform per Kinesis Processing Unit (KPU) used by
    the application.|}*)

  parallelism: int option;
   (**{|
    Describes the initial number of parallel tasks that a Managed Service for
    Apache Flink application can perform. If [AutoScalingEnabled] is set to
    True, then Managed Service for Apache Flink can increase the
    [CurrentParallelism] value in response to application load. The service
    can increase [CurrentParallelism] up to the maximum parallelism, which is
    [ParalellismPerKPU] times the maximum KPUs for the application. The
    maximum KPUs for an application is 32 by default, and can be increased by
    requesting a limit increase. If application load is reduced, the service
    can reduce the [CurrentParallelism] value down to the [Parallelism]
    setting.|}*)

  configuration_type: configuration_type option;
   (**{|
    Describes whether the application uses the default parallelism for the
    Managed Service for Apache Flink service.|}*)

}

(**{|
    Describes configuration parameters for a Managed Service for Apache Flink
    application.|}*)
type flink_application_configuration_description = {
  job_plan_description: string option;
   (**{|
    The job plan for an application. For more information about the job plan,
    see
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/internals/job_scheduling.html }Jobs
    and Scheduling} in the
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/ }Apache
    Flink Documentation}. To retrieve the job plan for the application, use
    the {{:  }DescribeApplicationRequest$IncludeAdditionalDetails} parameter
    of the {{:  }DescribeApplication} operation.|}*)

  parallelism_configuration_description: parallelism_configuration_description option;
   (**{|
    Describes parameters for how an application executes multiple tasks
    simultaneously.|}*)

  monitoring_configuration_description: monitoring_configuration_description option;
   (**{|
    Describes configuration parameters for Amazon CloudWatch logging for an
    application.|}*)

  checkpoint_configuration_description: checkpoint_configuration_description option;
   (**{|
    Describes an application's checkpointing configuration. Checkpointing is
    the process of persisting application state for fault tolerance.|}*)

}

(**{|
    Property key-value pairs passed into an application.|}*)
type property_group = {
  property_map: (string * string) list;
   (**{|
    Describes the value of an application execution property key-value pair.|}*)

  property_group_id: string;
   (**{|
    Describes the key of an application execution property key-value pair.|}*)

}

(**{|
    Describes the execution properties for an Apache Flink runtime.|}*)
type environment_property_descriptions = {
  property_group_descriptions: property_group list option;
   (**{|
    Describes the execution property groups.|}*)

}

(**{|
    Describes whether snapshots are enabled for a Managed Service for Apache
    Flink application.|}*)
type application_snapshot_configuration_description = {
  snapshots_enabled: bool;
   (**{|
    Describes whether snapshots are enabled for a Managed Service for Apache
    Flink application.|}*)

}

(**{|
    Describes details about the application code and starting parameters for
    a Managed Service for Apache Flink application.|}*)
type application_configuration_description = {
  zeppelin_application_configuration_description: zeppelin_application_configuration_description option;
   (**{|
    The configuration parameters for a Managed Service for Apache Flink
    Studio notebook.|}*)

  vpc_configuration_descriptions: vpc_configuration_description list option;
   (**{|
    The array of descriptions of VPC configurations available to the
    application.|}*)

  application_snapshot_configuration_description: application_snapshot_configuration_description option;
   (**{|
    Describes whether snapshots are enabled for a Managed Service for Apache
    Flink application.|}*)

  environment_property_descriptions: environment_property_descriptions option;
   (**{|
    Describes execution properties for a Managed Service for Apache Flink
    application.|}*)

  flink_application_configuration_description: flink_application_configuration_description option;
   (**{|
    The details about a Managed Service for Apache Flink application.|}*)

  run_configuration_description: run_configuration_description option;
   (**{|
    The details about the starting properties for a Managed Service for
    Apache Flink application.|}*)

  application_code_configuration_description: application_code_configuration_description option;
   (**{|
    The details about the application code for a Managed Service for Apache
    Flink application.|}*)

  sql_application_configuration_description: sql_application_configuration_description option;
   (**{|
    The details about inputs, outputs, and reference data sources for a
    SQL-based Kinesis Data Analytics application.|}*)

}

(**{|
    Describes the Amazon CloudWatch logging option.|}*)
type cloud_watch_logging_option_description = {
  role_ar_n: string option;
   (**{|
    The IAM ARN of the role to use to send application messages.
    
    Provided for backward compatibility. Applications created with the
    current API version have an application-level service execution role
    rather than a resource-level role.
    |}*)

  log_stream_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the CloudWatch log to receive
    application messages.|}*)

  cloud_watch_logging_option_id: string option;
   (**{|
    The ID of the CloudWatch logging option description.|}*)

}

(**{|
    The details of the maintenance configuration for the application.|}*)
type application_maintenance_configuration_description = {
  application_maintenance_window_end_time: string;
   (**{|
    The end time for the maintenance window.|}*)

  application_maintenance_window_start_time: string;
   (**{|
    The start time for the maintenance window.|}*)

}

type application_mode = | INTERACTIVE
  | STREAMING

(**{|
    Describes the application, including the application Amazon Resource Name
    (ARN), status, latest version, and input and output configurations.|}*)
type application_detail = {
  application_mode: application_mode option;
   (**{|
    To create a Managed Service for Apache Flink Studio notebook, you must
    set the mode to [INTERACTIVE]. However, for a Managed Service for Apache
    Flink application, the mode is optional.|}*)

  application_version_rolled_back_to: int option;
   (**{|
    The version to which you want to roll back the application.|}*)

  conditional_token: string option;
   (**{|
    A value you use to implement strong concurrency for application updates.|}*)

  application_version_rolled_back_from: int option;
   (**{|
    If you reverted the application using {{:  }RollbackApplication}, the
    application version when [RollbackApplication] was called.|}*)

  application_version_updated_from: int option;
   (**{|
    The previous application version before the latest application update.
    {{:  }RollbackApplication} reverts the application to this version.|}*)

  application_maintenance_configuration_description: application_maintenance_configuration_description option;
   (**{|
    The details of the maintenance configuration for the application.|}*)

  cloud_watch_logging_option_descriptions: cloud_watch_logging_option_description list option;
   (**{|
    Describes the application Amazon CloudWatch logging options.|}*)

  application_configuration_description: application_configuration_description option;
   (**{|
    Describes details about the application code and starting parameters for
    a Managed Service for Apache Flink application.|}*)

  last_update_timestamp: float option;
   (**{|
    The current timestamp when the application was last updated.|}*)

  create_timestamp: float option;
   (**{|
    The current timestamp when the application was created.|}*)

  application_version_id: int;
   (**{|
    Provides the current application version. Managed Service for Apache
    Flink updates the [ApplicationVersionId] each time you update the
    application.|}*)

  application_status: application_status;
   (**{|
    The status of the application.|}*)

  service_execution_role: string option;
   (**{|
    Specifies the IAM role that the application uses to access external
    resources.|}*)

  runtime_environment: runtime_environment;
   (**{|
    The runtime environment for the application.|}*)

  application_name: string;
   (**{|
    The name of the application.|}*)

  application_description: string option;
   (**{|
    The description of the application.|}*)

  application_ar_n: string;
   (**{|
    The ARN of the application.|}*)

}

type update_application_response = {
  application_detail: application_detail;
   (**{|
    Describes application updates.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, represents an update
    to the {{:  }InputLambdaProcessor} that is used to preprocess the records
    in the stream.|}*)
type input_lambda_processor_update = {
  resource_arn_update: string;
   (**{|
    The Amazon Resource Name (ARN) of the new Amazon Lambda function that is
    used to preprocess the records in the stream.
    
    To specify an earlier version of the Lambda function than the latest,
    include the Lambda function version in the Lambda function ARN. For more
    information about Lambda ARNs, see
    {{: https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda }Example
    ARNs: Amazon Lambda}
    |}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes updates to
    an {{:  }InputProcessingConfiguration}.|}*)
type input_processing_configuration_update = {
  input_lambda_processor_update: input_lambda_processor_update;
   (**{|
    Provides update information for an {{:  }InputLambdaProcessor}.|}*)

}

(**{|
    When you update the input configuration for a SQL-based Kinesis Data
    Analytics application, provides information about a Kinesis stream as the
    streaming source.|}*)
type kinesis_streams_input_update = {
  resource_arn_update: string;
   (**{|
    The Amazon Resource Name (ARN) of the input Kinesis data stream to read.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, when updating
    application input configuration, provides information about a Kinesis
    Data Firehose delivery stream as the streaming source.|}*)
type kinesis_firehose_input_update = {
  resource_arn_update: string;
   (**{|
    The Amazon Resource Name (ARN) of the input delivery stream to read.|}*)

}

(**{|
    Describes updates for an SQL-based Kinesis Data Analytics application's
    input schema.|}*)
type input_schema_update = {
  record_column_updates: record_column list option;
   (**{|
    A list of [RecordColumn] objects. Each object describes the mapping of
    the streaming source element to the corresponding column in the
    in-application stream.|}*)

  record_encoding_update: string option;
   (**{|
    Specifies the encoding of the records in the streaming source; for
    example, UTF-8.|}*)

  record_format_update: record_format option;
   (**{|
    Specifies the format of the records on the streaming source.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, provides updates to
    the parallelism count.|}*)
type input_parallelism_update = {
  count_update: int;
   (**{|
    The number of in-application streams to create for the specified
    streaming source.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes updates to
    a specific input configuration (identified by the [InputId] of an
    application).|}*)
type input_update = {
  input_parallelism_update: input_parallelism_update option;
   (**{|
    Describes the parallelism updates (the number of in-application streams
    Kinesis Data Analytics creates for the specific streaming source).|}*)

  input_schema_update: input_schema_update option;
   (**{|
    Describes the data format on the streaming source, and how record
    elements on the streaming source map to columns of the in-application
    stream that is created.|}*)

  kinesis_firehose_input_update: kinesis_firehose_input_update option;
   (**{|
    If a Kinesis Data Firehose delivery stream is the streaming source to be
    updated, provides an updated stream ARN.|}*)

  kinesis_streams_input_update: kinesis_streams_input_update option;
   (**{|
    If a Kinesis data stream is the streaming source to be updated, provides
    an updated stream Amazon Resource Name (ARN).|}*)

  input_processing_configuration_update: input_processing_configuration_update option;
   (**{|
    Describes updates to an {{:  }InputProcessingConfiguration}.|}*)

  name_prefix_update: string option;
   (**{|
    The name prefix for in-application streams that Kinesis Data Analytics
    creates for the specific streaming source.|}*)

  input_id: string;
   (**{|
    The input ID of the application input to be updated.|}*)

}

(**{|
    When you update a SQL-based Kinesis Data Analytics application's output
    configuration using the {{:  }UpdateApplication} operation, provides
    information about a Kinesis data stream that is configured as the
    destination.|}*)
type kinesis_streams_output_update = {
  resource_arn_update: string;
   (**{|
    The Amazon Resource Name (ARN) of the Kinesis data stream where you want
    to write the output.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, when updating an
    output configuration using the {{:  }UpdateApplication} operation,
    provides information about a Kinesis Data Firehose delivery stream that
    is configured as the destination.|}*)
type kinesis_firehose_output_update = {
  resource_arn_update: string;
   (**{|
    The Amazon Resource Name (ARN) of the delivery stream to write to.|}*)

}

(**{|
    When you update an SQL-based Kinesis Data Analytics application's output
    configuration using the {{:  }UpdateApplication} operation, provides
    information about an Amazon Lambda function that is configured as the
    destination.|}*)
type lambda_output_update = {
  resource_arn_update: string;
   (**{|
    The Amazon Resource Name (ARN) of the destination Amazon Lambda function.
    
    To specify an earlier version of the Lambda function than the latest,
    include the Lambda function version in the Lambda function ARN. For more
    information about Lambda ARNs, see
    {{: https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda }Example
    ARNs: Amazon Lambda}
    |}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes updates to
    the output configuration identified by the [OutputId].|}*)
type output_update = {
  destination_schema_update: destination_schema option;
   (**{|
    Describes the data format when records are written to the destination.|}*)

  lambda_output_update: lambda_output_update option;
   (**{|
    Describes an Amazon Lambda function as the destination for the output.|}*)

  kinesis_firehose_output_update: kinesis_firehose_output_update option;
   (**{|
    Describes a Kinesis Data Firehose delivery stream as the destination for
    the output.|}*)

  kinesis_streams_output_update: kinesis_streams_output_update option;
   (**{|
    Describes a Kinesis data stream as the destination for the output.|}*)

  name_update: string option;
   (**{|
    If you want to specify a different in-application stream for this output
    configuration, use this field to specify the new in-application stream
    name.|}*)

  output_id: string;
   (**{|
    Identifies the specific output configuration that you want to update.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes the Amazon
    S3 bucket name and object key name for an in-application reference table.|}*)
type s3_reference_data_source_update = {
  file_key_update: string option;
   (**{|
    The object key name.|}*)

  bucket_arn_update: string option;
   (**{|
    The Amazon Resource Name (ARN) of the S3 bucket.|}*)

}

(**{|
    When you update a reference data source configuration for a SQL-based
    Kinesis Data Analytics application, this object provides all the updated
    values (such as the source bucket name and object key name), the
    in-application table name that is created, and updated mapping
    information that maps the data in the Amazon S3 object to the
    in-application reference table that is created.|}*)
type reference_data_source_update = {
  reference_schema_update: source_schema option;
   (**{|
    Describes the format of the data in the streaming source, and how each
    data element maps to corresponding columns created in the in-application
    stream.|}*)

  s3_reference_data_source_update: s3_reference_data_source_update option;
   (**{|
    Describes the S3 bucket name, object key name, and IAM role that Kinesis
    Data Analytics can assume to read the Amazon S3 object on your behalf and
    populate the in-application reference table.|}*)

  table_name_update: string option;
   (**{|
    The in-application table name that is created by this update.|}*)

  reference_id: string;
   (**{|
    The ID of the reference data source that is being updated. You can use
    the {{:  }DescribeApplication} operation to get this value.|}*)

}

(**{|
    Describes updates to the input streams, destination streams, and
    reference data sources for a SQL-based Kinesis Data Analytics
    application.|}*)
type sql_application_configuration_update = {
  reference_data_source_updates: reference_data_source_update list option;
   (**{|
    The array of {{:  }ReferenceDataSourceUpdate} objects describing the new
    reference data sources used by the application.|}*)

  output_updates: output_update list option;
   (**{|
    The array of {{:  }OutputUpdate} objects describing the new destination
    streams used by the application.|}*)

  input_updates: input_update list option;
   (**{|
    The array of {{:  }InputUpdate} objects describing the new input streams
    used by the application.|}*)

}

(**{|
    Describes an update for the Amazon S3 code content location for an
    application.|}*)
type s3_content_location_update = {
  object_version_update: string option;
   (**{|
    The new version of the object containing the application code.|}*)

  file_key_update: string option;
   (**{|
    The new file key for the object containing the application code.|}*)

  bucket_arn_update: string option;
   (**{|
    The new Amazon Resource Name (ARN) for the S3 bucket containing the
    application code.|}*)

}

(**{|
    Describes an update to the code of an application. Not supported for
    Apache Zeppelin.|}*)
type code_content_update = {
  s3_content_location_update: s3_content_location_update option;
   (**{|
    Describes an update to the location of code for an application.|}*)

  zip_file_content_update: bytes option;
   (**{|
    Describes an update to the zipped code for an application.|}*)

  text_content_update: string option;
   (**{|
    Describes an update to the text code for an application.|}*)

}

(**{|
    Describes code configuration updates for an application. This is
    supported for a Managed Service for Apache Flink application or a
    SQL-based Kinesis Data Analytics application.|}*)
type application_code_configuration_update = {
  code_content_update: code_content_update option;
   (**{|
    Describes updates to the code content of an application.|}*)

  code_content_type_update: code_content_type option;
   (**{|
    Describes updates to the code content type.|}*)

}

(**{|
    Describes updates to the checkpointing parameters for a Managed Service
    for Apache Flink application.|}*)
type checkpoint_configuration_update = {
  min_pause_between_checkpoints_update: int option;
   (**{|
    Describes updates to the minimum time in milliseconds after a checkpoint
    operation completes that a new checkpoint operation can start.
    
    If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the
    application will use a [MinPauseBetweenCheckpoints] value of 5000, even
    if this value is set using this API or in application code.
    |}*)

  checkpoint_interval_update: int option;
   (**{|
    Describes updates to the interval in milliseconds between checkpoint
    operations.
    
    If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the
    application will use a [CheckpointInterval] value of 60000, even if this
    value is set to another value using this API or in application code.
    |}*)

  checkpointing_enabled_update: bool option;
   (**{|
    Describes updates to whether checkpointing is enabled for an application.
    
    If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the
    application will use a [CheckpointingEnabled] value of [true], even if
    this value is set to another value using this API or in application code.
    |}*)

  configuration_type_update: configuration_type option;
   (**{|
    Describes updates to whether the application uses the default
    checkpointing behavior of Managed Service for Apache Flink. You must set
    this property to [CUSTOM] in order to set the [CheckpointingEnabled],
    [CheckpointInterval], or [MinPauseBetweenCheckpoints] parameters.
    
    If this value is set to [DEFAULT], the application will use the following
    values, even if they are set to other values using APIs or application
    code:
    
    {ol 
          {- {b CheckpointingEnabled:} true
             }
          
          {- {b CheckpointInterval:} 60000
             }
          
          {- {b MinPauseBetweenCheckpoints:} 5000
             }
          
    }
    |}*)

}

(**{|
    Describes updates to configuration parameters for Amazon CloudWatch
    logging for an application.|}*)
type monitoring_configuration_update = {
  log_level_update: log_level option;
   (**{|
    Describes updates to the verbosity of the CloudWatch Logs for an
    application.|}*)

  metrics_level_update: metrics_level option;
   (**{|
    Describes updates to the granularity of the CloudWatch Logs for an
    application. The [Parallelism] level is not recommended for applications
    with a Parallelism over 64 due to excessive costs.|}*)

  configuration_type_update: configuration_type option;
   (**{|
    Describes updates to whether to use the default CloudWatch logging
    configuration for an application. You must set this property to [CUSTOM]
    in order to set the [LogLevel] or [MetricsLevel] parameters.|}*)

}

(**{|
    Describes updates to parameters for how an application executes multiple
    tasks simultaneously.|}*)
type parallelism_configuration_update = {
  auto_scaling_enabled_update: bool option;
   (**{|
    Describes updates to whether the Managed Service for Apache Flink service
    can increase the parallelism of a Managed Service for Apache Flink
    application in response to increased throughput.|}*)

  parallelism_per_kpu_update: int option;
   (**{|
    Describes updates to the number of parallel tasks an application can
    perform per Kinesis Processing Unit (KPU) used by the application.|}*)

  parallelism_update: int option;
   (**{|
    Describes updates to the initial number of parallel tasks an application
    can perform. If [AutoScalingEnabled] is set to True, then Managed Service
    for Apache Flink can increase the [CurrentParallelism] value in response
    to application load. The service can increase [CurrentParallelism] up to
    the maximum parallelism, which is [ParalellismPerKPU] times the maximum
    KPUs for the application. The maximum KPUs for an application is 32 by
    default, and can be increased by requesting a limit increase. If
    application load is reduced, the service will reduce [CurrentParallelism]
    down to the [Parallelism] setting.|}*)

  configuration_type_update: configuration_type option;
   (**{|
    Describes updates to whether the application uses the default parallelism
    for the Managed Service for Apache Flink service, or if a custom
    parallelism is used. You must set this property to [CUSTOM] in order to
    change your application's [AutoScalingEnabled], [Parallelism], or
    [ParallelismPerKPU] properties.|}*)

}

(**{|
    Describes updates to the configuration parameters for a Managed Service
    for Apache Flink application.|}*)
type flink_application_configuration_update = {
  parallelism_configuration_update: parallelism_configuration_update option;
   (**{|
    Describes updates to the parameters for how an application executes
    multiple tasks simultaneously.|}*)

  monitoring_configuration_update: monitoring_configuration_update option;
   (**{|
    Describes updates to the configuration parameters for Amazon CloudWatch
    logging for an application.|}*)

  checkpoint_configuration_update: checkpoint_configuration_update option;
   (**{|
    Describes updates to an application's checkpointing configuration.
    Checkpointing is the process of persisting application state for fault
    tolerance.|}*)

}

(**{|
    Describes updates to the execution property groups for a Managed Service
    for Apache Flink application or a Studio notebook.|}*)
type environment_property_updates = {
  property_groups: property_group list;
   (**{|
    Describes updates to the execution property groups.|}*)

}

(**{|
    Describes updates to whether snapshots are enabled for a Managed Service
    for Apache Flink application.|}*)
type application_snapshot_configuration_update = {
  snapshots_enabled_update: bool;
   (**{|
    Describes updates to whether snapshots are enabled for an application.|}*)

}

(**{|
    Describes updates to an application's configuration.|}*)
type application_configuration_update = {
  zeppelin_application_configuration_update: zeppelin_application_configuration_update option;
   (**{|
    Updates to the configuration of a Managed Service for Apache Flink Studio
    notebook.|}*)

  vpc_configuration_updates: vpc_configuration_update list option;
   (**{|
    Updates to the array of descriptions of VPC configurations available to
    the application.|}*)

  application_snapshot_configuration_update: application_snapshot_configuration_update option;
   (**{|
    Describes whether snapshots are enabled for a Managed Service for Apache
    Flink application.|}*)

  environment_property_updates: environment_property_updates option;
   (**{|
    Describes updates to the environment properties for a Managed Service for
    Apache Flink application.|}*)

  flink_application_configuration_update: flink_application_configuration_update option;
   (**{|
    Describes updates to a Managed Service for Apache Flink application's
    configuration.|}*)

  application_code_configuration_update: application_code_configuration_update option;
   (**{|
    Describes updates to an application's code configuration.|}*)

  sql_application_configuration_update: sql_application_configuration_update option;
   (**{|
    Describes updates to a SQL-based Kinesis Data Analytics application's
    configuration.|}*)

}

(**{|
    Describes the updates to the starting parameters for a Managed Service
    for Apache Flink application.|}*)
type run_configuration_update = {
  application_restore_configuration: application_restore_configuration option;
   (**{|
    Describes updates to the restore behavior of a restarting application.|}*)

  flink_run_configuration: flink_run_configuration option;
   (**{|
    Describes the starting parameters for a Managed Service for Apache Flink
    application.|}*)

}

(**{|
    Describes the Amazon CloudWatch logging option updates.|}*)
type cloud_watch_logging_option_update = {
  log_stream_arn_update: string option;
   (**{|
    The Amazon Resource Name (ARN) of the CloudWatch log to receive
    application messages.|}*)

  cloud_watch_logging_option_id: string;
   (**{|
    The ID of the CloudWatch logging option to update|}*)

}

type update_application_request = {
  runtime_environment_update: runtime_environment option;
   (**{|
    Updates the Managed Service for Apache Flink runtime environment used to
    run your code. To avoid issues you must:
    
    {ol 
          {- Ensure your new jar and dependencies are compatible with the new
             runtime selected.
             }
          
          {- Ensure your new code's state is compatible with the snapshot
             from which your application will start
             }
          
    }
    |}*)

  conditional_token: string option;
   (**{|
    A value you use to implement strong concurrency for application updates.
    You must provide the [CurrentApplicationVersionId] or the
    [ConditionalToken]. You get the application's current [ConditionalToken]
    using {{:  }DescribeApplication}. For better concurrency support, use the
    [ConditionalToken] parameter instead of [CurrentApplicationVersionId].|}*)

  cloud_watch_logging_option_updates: cloud_watch_logging_option_update list option;
   (**{|
    Describes application Amazon CloudWatch logging option updates. You can
    only update existing CloudWatch logging options with this action. To add
    a new CloudWatch logging option, use
    {{:  }AddApplicationCloudWatchLoggingOption}.|}*)

  run_configuration_update: run_configuration_update option;
   (**{|
    Describes updates to the application's starting parameters.|}*)

  service_execution_role_update: string option;
   (**{|
    Describes updates to the service execution role.|}*)

  application_configuration_update: application_configuration_update option;
   (**{|
    Describes application configuration updates.|}*)

  current_application_version_id: int option;
   (**{|
    The current application version ID. You must provide the
    [CurrentApplicationVersionId] or the [ConditionalToken].You can retrieve
    the application version ID using {{:  }DescribeApplication}. For better
    concurrency support, use the [ConditionalToken] parameter instead of
    [CurrentApplicationVersionId].|}*)

  application_name: string;
   (**{|
    The name of the application to update.|}*)

}

type update_application_maintenance_configuration_response = {
  application_maintenance_configuration_description: application_maintenance_configuration_description option;
   (**{|
    The application maintenance configuration description after the update.|}*)

  application_ar_n: string option;
   (**{|
    The Amazon Resource Name (ARN) of the application.|}*)

}

(**{|
    Describes the updated maintenance configuration for the application.|}*)
type application_maintenance_configuration_update = {
  application_maintenance_window_start_time_update: string;
   (**{|
    The updated start time for the maintenance window.|}*)

}

type update_application_maintenance_configuration_request = {
  application_maintenance_configuration_update: application_maintenance_configuration_update;
   (**{|
    Describes the application maintenance configuration update.|}*)

  application_name: string;
   (**{|
    The name of the application for which you want to update the maintenance
    configuration.|}*)

}

(**{|
    The request was rejected because a specified parameter is not supported
    or a specified resource is not valid for this operation.|}*)
type unsupported_operation_exception = {
  message: string option;
  
}

(**{|
    Specified application can't be found.|}*)
type resource_not_found_exception = {
  message: string option;
  
}

(**{|
    The application is not available for this operation.|}*)
type resource_in_use_exception = {
  message: string option;
  
}

(**{|
    The specified input parameter value is not valid.|}*)
type invalid_argument_exception = {
  message: string option;
  
}

(**{|
    Exception thrown as a result of concurrent modifications to an
    application. This error can be the result of attempting to modify an
    application without using the current application ID.|}*)
type concurrent_modification_exception = {
  message: string option;
  
}

(**{|
    The number of allowed resources has been exceeded.|}*)
type limit_exceeded_exception = {
  message: string option;
  
}

(**{|
    The request JSON is not valid for the operation.|}*)
type invalid_request_exception = {
  message: string option;
  
}

(**{|
    The user-provided application configuration is not valid.|}*)
type invalid_application_configuration_exception = {
  message: string option;
  
}

(**{|
    The user-provided application code (query) is not valid. This can be a
    simple syntax error.|}*)
type code_validation_exception = {
  message: string option;
  
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
   (**{|
    A list of keys of tags to remove from the specified application.|}*)

  resource_ar_n: string;
   (**{|
    The ARN of the Managed Service for Apache Flink application from which to
    remove the tags.|}*)

}

(**{|
    Application created with too many tags, or too many tags added to an
    application. Note that the maximum number of application tags includes
    system tags. The maximum number of user-defined application tags is 50.|}*)
type too_many_tags_exception = {
  message: string option;
  
}

(**{|
    The data format is not valid. Kinesis Data Analytics cannot detect the
    schema for the given streaming source.|}*)
type unable_to_detect_schema_exception = {
  processed_input_records: string list option;
   (**{|
    Stream data that was modified by the processor specified in the
    [InputProcessingConfiguration] parameter.|}*)

  raw_input_records: string list option;
   (**{|
    Raw stream data that was sampled to infer the schema.|}*)

  message: string option;
  
}

(**{|
    A key-value pair (the value is optional) that you can define and assign
    to Amazon resources. If you specify a tag that already exists, the tag
    value is replaced with the value that you specify in the request. Note
    that the maximum number of application tags includes system tags. The
    maximum number of user-defined application tags is 50. For more
    information, see
    {{: https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html }Using
    Tagging}.|}*)
type tag = {
  value: string option;
   (**{|
    The value of the key-value tag. The value is optional.|}*)

  key: string;
   (**{|
    The key of the key-value tag.|}*)

}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
   (**{|
    The key-value tags to assign to the application.|}*)

  resource_ar_n: string;
   (**{|
    The ARN of the application to assign the tags.|}*)

}

type stop_application_response = unit

type stop_application_request = {
  force: bool option;
   (**{|
    Set to [true] to force the application to stop. If you set [Force] to
    [true], Managed Service for Apache Flink stops the application without
    taking a snapshot.
    
    Force-stopping your application may lead to data loss or duplication. To
    prevent data loss or duplicate processing of data during application
    restarts, we recommend you to take frequent snapshots of your
    application.
    
    You can only force stop a Managed Service for Apache Flink application.
    You can't force stop a SQL-based Kinesis Data Analytics application.
    
    The application must be in the [STARTING], [UPDATING], [STOPPING],
    [AUTOSCALING], or [RUNNING] status.|}*)

  application_name: string;
   (**{|
    The name of the running application to stop.|}*)

}

type start_application_response = unit

(**{|
    Describes the starting parameters for a SQL-based Kinesis Data Analytics
    application.|}*)
type sql_run_configuration = {
  input_starting_position_configuration: input_starting_position_configuration;
   (**{|
    The point at which you want the application to start processing records
    from the streaming source.|}*)

  input_id: string;
   (**{|
    The input source ID. You can get this ID by calling the
    {{:  }DescribeApplication} operation.|}*)

}

(**{|
    Describes the starting parameters for an Managed Service for Apache Flink
    application.|}*)
type run_configuration = {
  application_restore_configuration: application_restore_configuration option;
   (**{|
    Describes the restore behavior of a restarting application.|}*)

  sql_run_configurations: sql_run_configuration list option;
   (**{|
    Describes the starting parameters for a SQL-based Kinesis Data Analytics
    application application.|}*)

  flink_run_configuration: flink_run_configuration option;
   (**{|
    Describes the starting parameters for a Managed Service for Apache Flink
    application.|}*)

}

type start_application_request = {
  run_configuration: run_configuration option;
   (**{|
    Identifies the run configuration (start parameters) of a Managed Service
    for Apache Flink application.|}*)

  application_name: string;
   (**{|
    The name of the application.|}*)

}

(**{|
    An object that contains the Amazon Resource Name (ARN) of the Amazon
    Lambda function that is used to preprocess records in the stream in a
    SQL-based Kinesis Data Analytics application.|}*)
type input_lambda_processor = {
  resource_ar_n: string;
   (**{|
    The ARN of the Amazon Lambda function that operates on records in the
    stream.
    
    To specify an earlier version of the Lambda function than the latest,
    include the Lambda function version in the Lambda function ARN. For more
    information about Lambda ARNs, see
    {{: https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda }Example
    ARNs: Amazon Lambda}
    |}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes a processor
    that is used to preprocess the records in the stream before being
    processed by your application code. Currently, the only input processor
    available is {{: https://docs.aws.amazon.com/lambda/ }Amazon Lambda}.|}*)
type input_processing_configuration = {
  input_lambda_processor: input_lambda_processor;
   (**{|
    The {{:  }InputLambdaProcessor} that is used to preprocess the records in
    the stream before being processed by your application code.|}*)

}

(**{|
    Identifies a Kinesis data stream as the streaming source. You provide the
    stream's Amazon Resource Name (ARN).|}*)
type kinesis_streams_input = {
  resource_ar_n: string;
   (**{|
    The ARN of the input Kinesis data stream to read.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, identifies a Kinesis
    Data Firehose delivery stream as the streaming source. You provide the
    delivery stream's Amazon Resource Name (ARN).|}*)
type kinesis_firehose_input = {
  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the delivery stream.|}*)

}

(**{|
    When you configure the application input for a SQL-based Kinesis Data
    Analytics application, you specify the streaming source, the
    in-application stream name that is created, and the mapping between the
    two.|}*)
type input = {
  input_schema: source_schema;
   (**{|
    Describes the format of the data in the streaming source, and how each
    data element maps to corresponding columns in the in-application stream
    that is being created.
    
    Also used to describe the format of the reference data source.|}*)

  input_parallelism: input_parallelism option;
   (**{|
    Describes the number of in-application streams to create.|}*)

  kinesis_firehose_input: kinesis_firehose_input option;
   (**{|
    If the streaming source is an Amazon Kinesis Data Firehose delivery
    stream, identifies the delivery stream's ARN.|}*)

  kinesis_streams_input: kinesis_streams_input option;
   (**{|
    If the streaming source is an Amazon Kinesis data stream, identifies the
    stream's Amazon Resource Name (ARN).|}*)

  input_processing_configuration: input_processing_configuration option;
   (**{|
    The {{:  }InputProcessingConfiguration} for the input. An input processor
    transforms records as they are received from the stream, before the
    application's SQL code executes. Currently, the only input processing
    configuration available is {{:  }InputLambdaProcessor}.|}*)

  name_prefix: string;
   (**{|
    The name prefix to use when creating an in-application stream. Suppose
    that you specify a prefix "[MyInApplicationStream]." Kinesis Data
    Analytics then creates one or more (as per the [InputParallelism] count
    you specified) in-application streams with the names
    "[MyInApplicationStream_001]," "[MyInApplicationStream_002]," and so on.|}*)

}

(**{|
    When you configure a SQL-based Kinesis Data Analytics application's
    output, identifies a Kinesis data stream as the destination. You provide
    the stream Amazon Resource Name (ARN).|}*)
type kinesis_streams_output = {
  resource_ar_n: string;
   (**{|
    The ARN of the destination Kinesis data stream to write to.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, when configuring
    application output, identifies a Kinesis Data Firehose delivery stream as
    the destination. You provide the stream Amazon Resource Name (ARN) of the
    delivery stream.|}*)
type kinesis_firehose_output = {
  resource_ar_n: string;
   (**{|
    The ARN of the destination delivery stream to write to.|}*)

}

(**{|
    When you configure a SQL-based Kinesis Data Analytics application's
    output, identifies an Amazon Lambda function as the destination. You
    provide the function Amazon Resource Name (ARN) of the Lambda function.|}*)
type lambda_output = {
  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the destination Lambda function to
    write to.
    
    To specify an earlier version of the Lambda function than the latest,
    include the Lambda function version in the Lambda function ARN. For more
    information about Lambda ARNs, see
    {{: https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda }Example
    ARNs: Amazon Lambda}
    |}*)

}

(**{|
    Describes a SQL-based Kinesis Data Analytics application's output
    configuration, in which you identify an in-application stream and a
    destination where you want the in-application stream data to be written.
    The destination can be a Kinesis data stream or a Kinesis Data Firehose
    delivery stream.
    
    |}*)
type output = {
  destination_schema: destination_schema;
   (**{|
    Describes the data format when records are written to the destination.|}*)

  lambda_output: lambda_output option;
   (**{|
    Identifies an Amazon Lambda function as the destination.|}*)

  kinesis_firehose_output: kinesis_firehose_output option;
   (**{|
    Identifies a Kinesis Data Firehose delivery stream as the destination.|}*)

  kinesis_streams_output: kinesis_streams_output option;
   (**{|
    Identifies a Kinesis data stream as the destination.|}*)

  name: string;
   (**{|
    The name of the in-application stream.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, identifies the Amazon
    S3 bucket and object that contains the reference data.
    
    A SQL-based Kinesis Data Analytics application loads reference data only
    once. If the data changes, you call the {{:  }UpdateApplication}
    operation to trigger reloading of data into your application.|}*)
type s3_reference_data_source = {
  file_key: string option;
   (**{|
    The object key name containing the reference data.|}*)

  bucket_ar_n: string option;
   (**{|
    The Amazon Resource Name (ARN) of the S3 bucket.|}*)

}

(**{|
    For a SQL-based Kinesis Data Analytics application, describes the
    reference data source by providing the source information (Amazon S3
    bucket name and object key name), the resulting in-application table name
    that is created, and the necessary schema to map the data elements in the
    Amazon S3 object to the in-application table.|}*)
type reference_data_source = {
  reference_schema: source_schema;
   (**{|
    Describes the format of the data in the streaming source, and how each
    data element maps to corresponding columns created in the in-application
    stream.|}*)

  s3_reference_data_source: s3_reference_data_source option;
   (**{|
    Identifies the S3 bucket and object that contains the reference data. A
    SQL-based Kinesis Data Analytics application loads reference data only
    once. If the data changes, you call the {{:  }UpdateApplication}
    operation to trigger reloading of data into your application.|}*)

  table_name: string;
   (**{|
    The name of the in-application table to create.|}*)

}

(**{|
    Describes the inputs, outputs, and reference data sources for a SQL-based
    Kinesis Data Analytics application.|}*)
type sql_application_configuration = {
  reference_data_sources: reference_data_source list option;
   (**{|
    The array of {{:  }ReferenceDataSource} objects describing the reference
    data sources used by the application.|}*)

  outputs: output list option;
   (**{|
    The array of {{:  }Output} objects describing the destination streams
    used by the application.|}*)

  inputs: input list option;
   (**{|
    The array of {{:  }Input} objects describing the input streams used by
    the application.|}*)

}

type snapshot_status = | FAILED
  | DELETING
  | READY
  | CREATING

(**{|
    Provides details about a snapshot of application state.|}*)
type snapshot_details = {
  runtime_environment: runtime_environment option;
   (**{|
    The Flink Runtime for the application snapshot.|}*)

  snapshot_creation_timestamp: float option;
   (**{|
    The timestamp of the application snapshot.|}*)

  application_version_id: int;
   (**{|
    The current application version ID when the snapshot was created.|}*)

  snapshot_status: snapshot_status;
   (**{|
    The status of the application snapshot.|}*)

  snapshot_name: string;
   (**{|
    The identifier for the application snapshot.|}*)

}

(**{|
    The service cannot complete the request.|}*)
type service_unavailable_exception = {
  message: string option;
  
}

(**{|
    For a SQL-based Kinesis Data Analytics application, provides a
    description of an Amazon S3 data source, including the Amazon Resource
    Name (ARN) of the S3 bucket and the name of the Amazon S3 object that
    contains the data.|}*)
type s3_configuration = {
  file_key: string;
   (**{|
    The name of the object that contains the data.|}*)

  bucket_ar_n: string;
   (**{|
    The ARN of the S3 bucket that contains the data.|}*)

}

type rollback_application_response = {
  application_detail: application_detail;
  
}

type rollback_application_request = {
  current_application_version_id: int;
   (**{|
    The current application version ID. You can retrieve the application
    version ID using {{:  }DescribeApplication}.|}*)

  application_name: string;
   (**{|
    The name of the application.|}*)

}

(**{|
    Discovery failed to get a record from the streaming source because of the
    Kinesis Streams [ProvisionedThroughputExceededException]. For more
    information, see
    {{: http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetRecords.html }GetRecords}
    in the Amazon Kinesis Streams API Reference.|}*)
type resource_provisioned_throughput_exceeded_exception = {
  message: string option;
  
}

(**{|
    Describes parameters for how a Managed Service for Apache Flink
    application executes multiple tasks simultaneously. For more information
    about parallelism, see
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/dev/parallel.html }Parallel
    Execution} in the
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/ }Apache
    Flink Documentation}.|}*)
type parallelism_configuration = {
  auto_scaling_enabled: bool option;
   (**{|
    Describes whether the Managed Service for Apache Flink service can
    increase the parallelism of the application in response to increased
    throughput.|}*)

  parallelism_per_kp_u: int option;
   (**{|
    Describes the number of parallel tasks that a Managed Service for Apache
    Flink application can perform per Kinesis Processing Unit (KPU) used by
    the application. For more information about KPUs, see
    {{: http://aws.amazon.com/kinesis/data-analytics/pricing/ }Amazon Managed
    Service for Apache Flink Pricing}.|}*)

  parallelism: int option;
   (**{|
    Describes the initial number of parallel tasks that a Managed Service for
    Apache Flink application can perform. If [AutoScalingEnabled] is set to
    True, Managed Service for Apache Flink increases the [CurrentParallelism]
    value in response to application load. The service can increase the
    [CurrentParallelism] value up to the maximum parallelism, which is
    [ParalellismPerKPU] times the maximum KPUs for the application. The
    maximum KPUs for an application is 32 by default, and can be increased by
    requesting a limit increase. If application load is reduced, the service
    can reduce the [CurrentParallelism] value down to the [Parallelism]
    setting.|}*)

  configuration_type: configuration_type;
   (**{|
    Describes whether the application uses the default parallelism for the
    Managed Service for Apache Flink service. You must set this property to
    [CUSTOM] in order to change your application's [AutoScalingEnabled],
    [Parallelism], or [ParallelismPerKPU] properties.|}*)

}

(**{|
    Describes configuration parameters for Amazon CloudWatch logging for an
    application. For more information about CloudWatch logging, see
    {{: https://docs.aws.amazon.com/kinesisanalytics/latest/java/monitoring-overview.html }Monitoring}.
    |}*)
type monitoring_configuration = {
  log_level: log_level option;
   (**{|
    Describes the verbosity of the CloudWatch Logs for an application.|}*)

  metrics_level: metrics_level option;
   (**{|
    Describes the granularity of the CloudWatch Logs for an application. The
    [Parallelism] level is not recommended for applications with a
    Parallelism over 64 due to excessive costs.|}*)

  configuration_type: configuration_type;
   (**{|
    Describes whether to use the default CloudWatch logging configuration for
    an application. You must set this property to [CUSTOM] in order to set
    the [LogLevel] or [MetricsLevel] parameters.|}*)

}

type list_tags_for_resource_response = {
  tags: tag list option;
   (**{|
    The key-value tags assigned to the application.|}*)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
   (**{|
    The ARN of the application for which to retrieve tags.|}*)

}

(**{|
    Provides application summary information, including the application
    Amazon Resource Name (ARN), name, and status.|}*)
type application_summary = {
  application_mode: application_mode option;
   (**{|
    For a Managed Service for Apache Flink application, the mode is
    [STREAMING]. For a Managed Service for Apache Flink Studio notebook, it
    is [INTERACTIVE].|}*)

  runtime_environment: runtime_environment;
   (**{|
    The runtime environment for the application.|}*)

  application_version_id: int;
   (**{|
    Provides the current application version.|}*)

  application_status: application_status;
   (**{|
    The status of the application.|}*)

  application_ar_n: string;
   (**{|
    The ARN of the application.|}*)

  application_name: string;
   (**{|
    The name of the application.|}*)

}

type list_applications_response = {
  next_token: string option;
   (**{|
    The pagination token for the next set of results, or [null] if there are
    no additional results. Pass this token into a subsequent command to
    retrieve the next set of items For more information about pagination, see
    {{: https://docs.aws.amazon.com/cli/latest/userguide/pagination.html }Using
    the Amazon Command Line Interface's Pagination Options}.|}*)

  application_summaries: application_summary list;
   (**{|
    A list of [ApplicationSummary] objects.|}*)

}

type list_applications_request = {
  next_token: string option;
   (**{|
    If a previous command returned a pagination token, pass it into this
    value to retrieve the next set of results. For more information about
    pagination, see
    {{: https://docs.aws.amazon.com/cli/latest/userguide/pagination.html }Using
    the Amazon Command Line Interface's Pagination Options}.|}*)

  limit: int option;
   (**{|
    The maximum number of applications to list.|}*)

}

(**{|
    The summary of the application version.|}*)
type application_version_summary = {
  application_status: application_status;
   (**{|
    The status of the application.|}*)

  application_version_id: int;
   (**{|
    The ID of the application version. Managed Service for Apache Flink
    updates the [ApplicationVersionId] each time you update the application.|}*)

}

type list_application_versions_response = {
  next_token: string option;
   (**{|
    The pagination token for the next set of results, or [null] if there are
    no additional results. To retrieve the next set of items, pass this token
    into a subsequent invocation of this operation. For more information
    about pagination, see
    {{: https://docs.aws.amazon.com/cli/latest/userguide/pagination.html }Using
    the Amazon Command Line Interface's Pagination Options}.|}*)

  application_version_summaries: application_version_summary list option;
   (**{|
    A list of the application versions and the associated configuration
    summaries. The list includes application versions that were rolled back.
    
    To get the complete description of a specific application version, invoke
    the {{:  }DescribeApplicationVersion} operation.|}*)

}

type list_application_versions_request = {
  next_token: string option;
   (**{|
    If a previous invocation of this operation returned a pagination token,
    pass it into this value to retrieve the next set of results. For more
    information about pagination, see
    {{: https://docs.aws.amazon.com/cli/latest/userguide/pagination.html }Using
    the Amazon Command Line Interface's Pagination Options}.|}*)

  limit: int option;
   (**{|
    The maximum number of versions to list in this invocation of the
    operation.|}*)

  application_name: string;
   (**{|
    The name of the application for which you want to list all versions.|}*)

}

type list_application_snapshots_response = {
  next_token: string option;
   (**{|
    The token for the next set of results, or [null] if there are no
    additional results.|}*)

  snapshot_summaries: snapshot_details list option;
   (**{|
    A collection of objects containing information about the application
    snapshots.|}*)

}

type list_application_snapshots_request = {
  next_token: string option;
   (**{|
    Use this parameter if you receive a [NextToken] response in a previous
    request that indicates that there is more output available. Set it to the
    value of the previous call's [NextToken] response to indicate where the
    output should continue from.|}*)

  limit: int option;
   (**{|
    The maximum number of application snapshots to list.|}*)

  application_name: string;
   (**{|
    The name of an existing application.|}*)

}

type discover_input_schema_response = {
  raw_input_records: string list option;
   (**{|
    The raw stream data that was sampled to infer the schema.|}*)

  processed_input_records: string list option;
   (**{|
    The stream data that was modified by the processor specified in the
    [InputProcessingConfiguration] parameter.|}*)

  parsed_input_records: string list list option;
   (**{|
    An array of elements, where each element corresponds to a row in a stream
    record (a stream record can have more than one row).|}*)

  input_schema: source_schema option;
   (**{|
    The schema inferred from the streaming source. It identifies the format
    of the data in the streaming source and how each data element maps to
    corresponding columns in the in-application stream that you can create.|}*)

}

type discover_input_schema_request = {
  input_processing_configuration: input_processing_configuration option;
   (**{|
    The {{:  }InputProcessingConfiguration} to use to preprocess the records
    before discovering the schema of the records.|}*)

  s3_configuration: s3_configuration option;
   (**{|
    Specify this parameter to discover a schema from data in an Amazon S3
    object.|}*)

  input_starting_position_configuration: input_starting_position_configuration option;
   (**{|
    The point at which you want Kinesis Data Analytics to start reading
    records from the specified streaming source for discovery purposes.|}*)

  service_execution_role: string;
   (**{|
    The ARN of the role that is used to access the streaming source.|}*)

  resource_ar_n: string option;
   (**{|
    The Amazon Resource Name (ARN) of the streaming source.|}*)

}

type describe_application_version_response = {
  application_version_detail: application_detail option;
  
}

type describe_application_version_request = {
  application_version_id: int;
   (**{|
    The ID of the application version for which you want to get the
    description.|}*)

  application_name: string;
   (**{|
    The name of the application for which you want to get the version
    description.|}*)

}

type describe_application_snapshot_response = {
  snapshot_details: snapshot_details;
   (**{|
    An object containing information about the application snapshot.|}*)

}

type describe_application_snapshot_request = {
  snapshot_name: string;
   (**{|
    The identifier of an application snapshot. You can retrieve this value
    using .|}*)

  application_name: string;
   (**{|
    The name of an existing application.|}*)

}

type describe_application_response = {
  application_detail: application_detail;
   (**{|
    Provides a description of the application, such as the application's
    Amazon Resource Name (ARN), status, and latest version.|}*)

}

type describe_application_request = {
  include_additional_details: bool option;
   (**{|
    Displays verbose information about a Managed Service for Apache Flink
    application, including the application's job plan.|}*)

  application_name: string;
   (**{|
    The name of the application.|}*)

}

type delete_application_vpc_configuration_response = {
  application_version_id: int option;
   (**{|
    The updated version ID of the application.|}*)

  application_ar_n: string option;
   (**{|
    The ARN of the Managed Service for Apache Flink application.|}*)

}

type delete_application_vpc_configuration_request = {
  conditional_token: string option;
   (**{|
    A value you use to implement strong concurrency for application updates.
    You must provide the [CurrentApplicationVersionId] or the
    [ConditionalToken]. You get the application's current [ConditionalToken]
    using {{:  }DescribeApplication}. For better concurrency support, use the
    [ConditionalToken] parameter instead of [CurrentApplicationVersionId].|}*)

  vpc_configuration_id: string;
   (**{|
    The ID of the VPC configuration to delete.|}*)

  current_application_version_id: int option;
   (**{|
    The current application version ID. You must provide the
    [CurrentApplicationVersionId] or the [ConditionalToken]. You can retrieve
    the application version ID using {{:  }DescribeApplication}. For better
    concurrency support, use the [ConditionalToken] parameter instead of
    [CurrentApplicationVersionId].|}*)

  application_name: string;
   (**{|
    The name of an existing application.|}*)

}

type delete_application_snapshot_response = unit

type delete_application_snapshot_request = {
  snapshot_creation_timestamp: float;
   (**{|
    The creation timestamp of the application snapshot to delete. You can
    retrieve this value using or .|}*)

  snapshot_name: string;
   (**{|
    The identifier for the snapshot delete.|}*)

  application_name: string;
   (**{|
    The name of an existing application.|}*)

}

type delete_application_reference_data_source_response = {
  application_version_id: int option;
   (**{|
    The updated version ID of the application.|}*)

  application_ar_n: string option;
   (**{|
    The application Amazon Resource Name (ARN).|}*)

}

type delete_application_reference_data_source_request = {
  reference_id: string;
   (**{|
    The ID of the reference data source. When you add a reference data source
    to your application using the {{:  }AddApplicationReferenceDataSource},
    Kinesis Data Analytics assigns an ID. You can use the
    {{:  }DescribeApplication} operation to get the reference ID.|}*)

  current_application_version_id: int;
   (**{|
    The current application version. You can use the
    {{:  }DescribeApplication} operation to get the current application
    version. If the version specified is not the current version, the
    [ConcurrentModificationException] is returned.|}*)

  application_name: string;
   (**{|
    The name of an existing application.|}*)

}

type delete_application_output_response = {
  application_version_id: int option;
   (**{|
    The current application version ID.|}*)

  application_ar_n: string option;
   (**{|
    The application Amazon Resource Name (ARN).|}*)

}

type delete_application_output_request = {
  output_id: string;
   (**{|
    The ID of the configuration to delete. Each output configuration that is
    added to the application (either when the application is created or
    later) using the {{:  }AddApplicationOutput} operation has a unique ID.
    You need to provide the ID to uniquely identify the output configuration
    that you want to delete from the application configuration. You can use
    the {{:  }DescribeApplication} operation to get the specific [OutputId].|}*)

  current_application_version_id: int;
   (**{|
    The application version. You can use the {{:  }DescribeApplication}
    operation to get the current application version. If the version
    specified is not the current version, the
    [ConcurrentModificationException] is returned.|}*)

  application_name: string;
   (**{|
    The application name.|}*)

}

type delete_application_input_processing_configuration_response = {
  application_version_id: int option;
   (**{|
    The current application version ID.|}*)

  application_ar_n: string option;
   (**{|
    The Amazon Resource Name (ARN) of the application.|}*)

}

type delete_application_input_processing_configuration_request = {
  input_id: string;
   (**{|
    The ID of the input configuration from which to delete the input
    processing configuration. You can get a list of the input IDs for an
    application by using the {{:  }DescribeApplication} operation.|}*)

  current_application_version_id: int;
   (**{|
    The application version. You can use the {{:  }DescribeApplication}
    operation to get the current application version. If the version
    specified is not the current version, the
    [ConcurrentModificationException] is returned.|}*)

  application_name: string;
   (**{|
    The name of the application.|}*)

}

type delete_application_cloud_watch_logging_option_response = {
  cloud_watch_logging_option_descriptions: cloud_watch_logging_option_description list option;
   (**{|
    The descriptions of the remaining CloudWatch logging options for the
    application.|}*)

  application_version_id: int option;
   (**{|
    The version ID of the application. Kinesis Data Analytics updates the
    [ApplicationVersionId] each time you change the CloudWatch logging
    options.|}*)

  application_ar_n: string option;
   (**{|
    The application's Amazon Resource Name (ARN).|}*)

}

type delete_application_cloud_watch_logging_option_request = {
  conditional_token: string option;
   (**{|
    A value you use to implement strong concurrency for application updates.
    You must provide the [CurrentApplicationVersionId] or the
    [ConditionalToken]. You get the application's current [ConditionalToken]
    using {{:  }DescribeApplication}. For better concurrency support, use the
    [ConditionalToken] parameter instead of [CurrentApplicationVersionId].|}*)

  cloud_watch_logging_option_id: string;
   (**{|
    The [CloudWatchLoggingOptionId] of the Amazon CloudWatch logging option
    to delete. You can get the [CloudWatchLoggingOptionId] by using the
    {{:  }DescribeApplication} operation.|}*)

  current_application_version_id: int option;
   (**{|
    The version ID of the application. You must provide the
    [CurrentApplicationVersionId] or the [ConditionalToken]. You can retrieve
    the application version ID using {{:  }DescribeApplication}. For better
    concurrency support, use the [ConditionalToken] parameter instead of
    [CurrentApplicationVersionId].|}*)

  application_name: string;
   (**{|
    The application name.|}*)

}

type delete_application_response = unit

type delete_application_request = {
  create_timestamp: float;
   (**{|
    Use the [DescribeApplication] operation to get this value.|}*)

  application_name: string;
   (**{|
    The name of the application to delete.|}*)

}

type create_application_snapshot_response = unit

type create_application_snapshot_request = {
  snapshot_name: string;
   (**{|
    An identifier for the application snapshot.|}*)

  application_name: string;
   (**{|
    The name of an existing application|}*)

}

type create_application_presigned_url_response = {
  authorized_url: string option;
   (**{|
    The URL of the extension.|}*)

}

type create_application_presigned_url_request = {
  session_expiration_duration_in_seconds: int option;
   (**{|
    The duration in seconds for which the returned URL will be valid.|}*)

  url_type: url_type;
   (**{|
    The type of the extension for which to create and return a URL.
    Currently, the only valid extension URL type is [FLINK_DASHBOARD_URL].|}*)

  application_name: string;
   (**{|
    The name of the application.|}*)

}

type create_application_response = {
  application_detail: application_detail;
   (**{|
    In response to your [CreateApplication] request, Managed Service for
    Apache Flink returns a response with details of the application it
    created.|}*)

}

(**{|
    Describes an application's checkpointing configuration. Checkpointing is
    the process of persisting application state for fault tolerance. For more
    information, see
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/docs/dev/datastream/fault-tolerance/checkpointing/#enabling-and-configuring-checkpointing }Checkpoints
    for Fault Tolerance} in the
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/ }Apache
    Flink Documentation}.|}*)
type checkpoint_configuration = {
  min_pause_between_checkpoints: int option;
   (**{|
    Describes the minimum time in milliseconds after a checkpoint operation
    completes that a new checkpoint operation can start. If a checkpoint
    operation takes longer than the [CheckpointInterval], the application
    otherwise performs continual checkpoint operations. For more information,
    see
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/docs/ops/state/large_state_tuning/#tuning-checkpointing }Tuning
    Checkpointing} in the
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/ }Apache
    Flink Documentation}.
    
    If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the
    application will use a [MinPauseBetweenCheckpoints] value of 5000, even
    if this value is set using this API or in application code.
    |}*)

  checkpoint_interval: int option;
   (**{|
    Describes the interval in milliseconds between checkpoint operations.
    
    If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the
    application will use a [CheckpointInterval] value of 60000, even if this
    value is set to another value using this API or in application code.
    |}*)

  checkpointing_enabled: bool option;
   (**{|
    Describes whether checkpointing is enabled for a Managed Service for
    Apache Flink application.
    
    If [CheckpointConfiguration.ConfigurationType] is [DEFAULT], the
    application will use a [CheckpointingEnabled] value of [true], even if
    this value is set to another value using this API or in application code.
    |}*)

  configuration_type: configuration_type;
   (**{|
    Describes whether the application uses Managed Service for Apache Flink'
    default checkpointing behavior. You must set this property to [CUSTOM] in
    order to set the [CheckpointingEnabled], [CheckpointInterval], or
    [MinPauseBetweenCheckpoints] parameters.
    
    If this value is set to [DEFAULT], the application will use the following
    values, even if they are set to other values using APIs or application
    code:
    
    {ol 
          {- {b CheckpointingEnabled:} true
             }
          
          {- {b CheckpointInterval:} 60000
             }
          
          {- {b MinPauseBetweenCheckpoints:} 5000
             }
          
    }
    |}*)

}

(**{|
    Describes configuration parameters for a Managed Service for Apache Flink
    application or a Studio notebook.|}*)
type flink_application_configuration = {
  parallelism_configuration: parallelism_configuration option;
   (**{|
    Describes parameters for how an application executes multiple tasks
    simultaneously.|}*)

  monitoring_configuration: monitoring_configuration option;
   (**{|
    Describes configuration parameters for Amazon CloudWatch logging for an
    application.|}*)

  checkpoint_configuration: checkpoint_configuration option;
   (**{|
    Describes an application's checkpointing configuration. Checkpointing is
    the process of persisting application state for fault tolerance. For more
    information, see
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/docs/dev/datastream/fault-tolerance/checkpointing/#enabling-and-configuring-checkpointing }Checkpoints
    for Fault Tolerance} in the
    {{: https://nightlies.apache.org/flink/flink-docs-release-1.18/ }Apache
    Flink Documentation}.|}*)

}

(**{|
    Describes execution properties for a Managed Service for Apache Flink
    application.|}*)
type environment_properties = {
  property_groups: property_group list;
   (**{|
    Describes the execution property groups.|}*)

}

(**{|
    Specifies either the application code, or the location of the application
    code, for a Managed Service for Apache Flink application.|}*)
type code_content = {
  s3_content_location: s3_content_location option;
   (**{|
    Information about the Amazon S3 bucket that contains the application code.|}*)

  zip_file_content: bytes option;
   (**{|
    The zip-format code for a Managed Service for Apache Flink application.|}*)

  text_content: string option;
   (**{|
    The text-format code for a Managed Service for Apache Flink application.|}*)

}

(**{|
    Describes code configuration for an application.|}*)
type application_code_configuration = {
  code_content_type: code_content_type;
   (**{|
    Specifies whether the code content is in text or zip format.|}*)

  code_content: code_content option;
   (**{|
    The location and type of the application code.|}*)

}

(**{|
    Describes whether snapshots are enabled for a Managed Service for Apache
    Flink application.|}*)
type application_snapshot_configuration = {
  snapshots_enabled: bool;
   (**{|
    Describes whether snapshots are enabled for a Managed Service for Apache
    Flink application.|}*)

}

(**{|
    Specifies the creation parameters for a Managed Service for Apache Flink
    application.|}*)
type application_configuration = {
  zeppelin_application_configuration: zeppelin_application_configuration option;
   (**{|
    The configuration parameters for a Managed Service for Apache Flink
    Studio notebook.|}*)

  vpc_configurations: vpc_configuration list option;
   (**{|
    The array of descriptions of VPC configurations available to the
    application.|}*)

  application_snapshot_configuration: application_snapshot_configuration option;
   (**{|
    Describes whether snapshots are enabled for a Managed Service for Apache
    Flink application.|}*)

  application_code_configuration: application_code_configuration option;
   (**{|
    The code location and type parameters for a Managed Service for Apache
    Flink application.|}*)

  environment_properties: environment_properties option;
   (**{|
    Describes execution properties for a Managed Service for Apache Flink
    application.|}*)

  flink_application_configuration: flink_application_configuration option;
   (**{|
    The creation and update parameters for a Managed Service for Apache Flink
    application.|}*)

  sql_application_configuration: sql_application_configuration option;
   (**{|
    The creation and update parameters for a SQL-based Kinesis Data Analytics
    application.|}*)

}

(**{|
    Provides a description of Amazon CloudWatch logging options, including
    the log stream Amazon Resource Name (ARN).|}*)
type cloud_watch_logging_option = {
  log_stream_ar_n: string;
   (**{|
    The ARN of the CloudWatch log to receive application messages.|}*)

}

type create_application_request = {
  application_mode: application_mode option;
   (**{|
    Use the [STREAMING] mode to create a Managed Service for Apache Flink
    application. To create a Managed Service for Apache Flink Studio
    notebook, use the [INTERACTIVE] mode.|}*)

  tags: tag list option;
   (**{|
    A list of one or more tags to assign to the application. A tag is a
    key-value pair that identifies an application. Note that the maximum
    number of application tags includes system tags. The maximum number of
    user-defined application tags is 50. For more information, see
    {{: https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html }Using
    Tagging}.|}*)

  cloud_watch_logging_options: cloud_watch_logging_option list option;
   (**{|
    Use this parameter to configure an Amazon CloudWatch log stream to
    monitor application configuration errors.|}*)

  application_configuration: application_configuration option;
   (**{|
    Use this parameter to configure the application.|}*)

  service_execution_role: string;
   (**{|
    The IAM role used by the application to access Kinesis data streams,
    Kinesis Data Firehose delivery streams, Amazon S3 objects, and other
    external resources.|}*)

  runtime_environment: runtime_environment;
   (**{|
    The runtime environment for the application.|}*)

  application_description: string option;
   (**{|
    A summary description of the application.|}*)

  application_name: string;
   (**{|
    The name of your application (for example, [sample-app]).|}*)

}

type add_application_vpc_configuration_response = {
  vpc_configuration_description: vpc_configuration_description option;
   (**{|
    The parameters of the new VPC configuration.|}*)

  application_version_id: int option;
   (**{|
    Provides the current application version. Managed Service for Apache
    Flink updates the ApplicationVersionId each time you update the
    application.|}*)

  application_ar_n: string option;
   (**{|
    The ARN of the application.|}*)

}

type add_application_vpc_configuration_request = {
  conditional_token: string option;
   (**{|
    A value you use to implement strong concurrency for application updates.
    You must provide the [ApplicationVersionID] or the [ConditionalToken].
    You get the application's current [ConditionalToken] using
    {{:  }DescribeApplication}. For better concurrency support, use the
    [ConditionalToken] parameter instead of [CurrentApplicationVersionId].|}*)

  vpc_configuration: vpc_configuration;
   (**{|
    Description of the VPC to add to the application.|}*)

  current_application_version_id: int option;
   (**{|
    The version of the application to which you want to add the VPC
    configuration. You must provide the [CurrentApplicationVersionId] or the
    [ConditionalToken]. You can use the {{:  }DescribeApplication} operation
    to get the current application version. If the version specified is not
    the current version, the [ConcurrentModificationException] is returned.
    For better concurrency support, use the [ConditionalToken] parameter
    instead of [CurrentApplicationVersionId].|}*)

  application_name: string;
   (**{|
    The name of an existing application.|}*)

}

type add_application_reference_data_source_response = {
  reference_data_source_descriptions: reference_data_source_description list option;
   (**{|
    Describes reference data sources configured for the application.|}*)

  application_version_id: int option;
   (**{|
    The updated application version ID. Kinesis Data Analytics increments
    this ID when the application is updated.|}*)

  application_ar_n: string option;
   (**{|
    The application Amazon Resource Name (ARN).|}*)

}

type add_application_reference_data_source_request = {
  reference_data_source: reference_data_source;
   (**{|
    The reference data source can be an object in your Amazon S3 bucket.
    Kinesis Data Analytics reads the object and copies the data into the
    in-application table that is created. You provide an S3 bucket, object
    key name, and the resulting in-application table that is created.|}*)

  current_application_version_id: int;
   (**{|
    The version of the application for which you are adding the reference
    data source. You can use the {{:  }DescribeApplication} operation to get
    the current application version. If the version specified is not the
    current version, the [ConcurrentModificationException] is returned.|}*)

  application_name: string;
   (**{|
    The name of an existing application.|}*)

}

type add_application_output_response = {
  output_descriptions: output_description list option;
   (**{|
    Describes the application output configuration. For more information, see
    {{: https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html }Configuring
    Application Output}.|}*)

  application_version_id: int option;
   (**{|
    The updated application version ID. Kinesis Data Analytics increments
    this ID when the application is updated.|}*)

  application_ar_n: string option;
   (**{|
    The application Amazon Resource Name (ARN).|}*)

}

type add_application_output_request = {
  output: output;
   (**{|
    An array of objects, each describing one output configuration. In the
    output configuration, you specify the name of an in-application stream, a
    destination (that is, a Kinesis data stream, a Kinesis Data Firehose
    delivery stream, or an Amazon Lambda function), and record the formation
    to use when writing to the destination.|}*)

  current_application_version_id: int;
   (**{|
    The version of the application to which you want to add the output
    configuration. You can use the {{:  }DescribeApplication} operation to
    get the current application version. If the version specified is not the
    current version, the [ConcurrentModificationException] is returned.|}*)

  application_name: string;
   (**{|
    The name of the application to which you want to add the output
    configuration.|}*)

}

type add_application_input_processing_configuration_response = {
  input_processing_configuration_description: input_processing_configuration_description option;
   (**{|
    The description of the preprocessor that executes on records in this
    input before the application's code is run.|}*)

  input_id: string option;
   (**{|
    The input ID that is associated with the application input. This is the
    ID that Kinesis Data Analytics assigns to each input configuration that
    you add to your application.|}*)

  application_version_id: int option;
   (**{|
    Provides the current application version.|}*)

  application_ar_n: string option;
   (**{|
    The Amazon Resource Name (ARN) of the application.|}*)

}

type add_application_input_processing_configuration_request = {
  input_processing_configuration: input_processing_configuration;
   (**{|
    The {{:  }InputProcessingConfiguration} to add to the application.|}*)

  input_id: string;
   (**{|
    The ID of the input configuration to add the input processing
    configuration to. You can get a list of the input IDs for an application
    using the {{:  }DescribeApplication} operation.|}*)

  current_application_version_id: int;
   (**{|
    The version of the application to which you want to add the input
    processing configuration. You can use the {{:  }DescribeApplication}
    operation to get the current application version. If the version
    specified is not the current version, the
    [ConcurrentModificationException] is returned.|}*)

  application_name: string;
   (**{|
    The name of the application to which you want to add the input processing
    configuration.|}*)

}

type add_application_input_response = {
  input_descriptions: input_description list option;
   (**{|
    Describes the application input configuration.|}*)

  application_version_id: int option;
   (**{|
    Provides the current application version.|}*)

  application_ar_n: string option;
   (**{|
    The Amazon Resource Name (ARN) of the application.|}*)

}

type add_application_input_request = {
  input: input;
   (**{|
    The {{:  }Input} to add.|}*)

  current_application_version_id: int;
   (**{|
    The current version of your application. You must provide the
    [ApplicationVersionID] or the [ConditionalToken].You can use the
    {{:  }DescribeApplication} operation to find the current application
    version.|}*)

  application_name: string;
   (**{|
    The name of your existing application to which you want to add the
    streaming source.|}*)

}

type add_application_cloud_watch_logging_option_response = {
  cloud_watch_logging_option_descriptions: cloud_watch_logging_option_description list option;
   (**{|
    The descriptions of the current CloudWatch logging options for the
    SQL-based Kinesis Data Analytics application.|}*)

  application_version_id: int option;
   (**{|
    The new version ID of the SQL-based Kinesis Data Analytics application.
    Kinesis Data Analytics updates the [ApplicationVersionId] each time you
    change the CloudWatch logging options.|}*)

  application_ar_n: string option;
   (**{|
    The application's ARN.|}*)

}

type add_application_cloud_watch_logging_option_request = {
  conditional_token: string option;
   (**{|
    A value you use to implement strong concurrency for application updates.
    You must provide the [CurrentApplicationVersionId] or the
    [ConditionalToken]. You get the application's current [ConditionalToken]
    using {{:  }DescribeApplication}. For better concurrency support, use the
    [ConditionalToken] parameter instead of [CurrentApplicationVersionId].|}*)

  cloud_watch_logging_option: cloud_watch_logging_option;
   (**{|
    Provides the Amazon CloudWatch log stream Amazon Resource Name (ARN).|}*)

  current_application_version_id: int option;
   (**{|
    The version ID of the SQL-based Kinesis Data Analytics application. You
    must provide the [CurrentApplicationVersionId] or the
    [ConditionalToken].You can retrieve the application version ID using
    {{:  }DescribeApplication}. For better concurrency support, use the
    [ConditionalToken] parameter instead of [CurrentApplicationVersionId].|}*)

  application_name: string;
   (**{|
    The Kinesis Data Analytics application name.|}*)

}

(**{|
    Amazon Managed Service for Apache Flink was previously known as Amazon
    Kinesis Data Analytics for Apache Flink.
    
    Amazon Managed Service for Apache Flink is a fully managed service that
    you can use to process and analyze streaming data using Java, Python,
    SQL, or Scala. The service enables you to quickly author and run Java,
    SQL, or Scala code against streaming sources to perform time series
    analytics, feed real-time dashboards, and create real-time metrics.|}*)


type base_document = Json.t

