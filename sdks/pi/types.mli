open Smaws_Lib
val service : Service.descriptor

type untag_resource_response = unit

type service_type = | DOCDB
  | RDS

type untag_resource_request = {
  tag_keys: string list;
  (** 
    The metadata assigned to an Amazon RDS Performance Insights resource consisting of a key-value pair.
     *)

  resource_ar_n: string;
  (** 
    The Amazon RDS Performance Insights resource that the tags are added to. This value is an Amazon Resource Name (ARN). For information about creating an ARN, see {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing}Constructing an RDS Amazon Resource Name (ARN)}.
     *)

  service_type: service_type;
  (** 
    List the tags for the Amazon Web Services service for which Performance Insights returns metrics. Valid value is [RDS].
     *)

}

(** 
    The user is not authorized to perform this request.
     *)
type not_authorized_exception = {
  message: string option;
  
}

(** 
    One of the arguments provided is invalid for this request.
     *)
type invalid_argument_exception = {
  message: string option;
  
}

(** 
    The request failed due to an unknown error.
     *)
type internal_service_error = {
  message: string option;
  
}

type text_format = | MARKDOWN
  | PLAIN_TEXT

type tag_resource_response = unit

(** 
    Metadata assigned to an Amazon RDS resource consisting of a key-value pair.
     *)
type tag = {
  value: string;
  [@ocaml.doc {| 
    A value is the optional value of the tag. The string value can be from 1 to 256 Unicode characters in length and can't be prefixed with [aws:] or [rds:]. The string can only contain only the set of Unicode letters, digits, white-space, '_', '.', ':', '/', '=', '+', '-', '@' (Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$").
     |}]

  key: string;
  [@ocaml.doc {| 
    A key is the required name of the tag. The string value can be from 1 to 128 Unicode characters in length and can't be prefixed with [aws:] or [rds:]. The string can only contain only the set of Unicode letters, digits, white-space, '_', '.', ':', '/', '=', '+', '-', '@' (Java regex: ["^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$"]).
     |}]

}

type tag_resource_request = {
  tags: tag list;
  (** 
    The metadata assigned to an Amazon RDS resource consisting of a key-value pair.
     *)

  resource_ar_n: string;
  (** 
    The Amazon RDS Performance Insights resource that the tags are added to. This value is an Amazon Resource Name (ARN). For information about creating an ARN, see {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing}Constructing an RDS Amazon Resource Name (ARN)}.
     *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights returns metrics. Valid value is [RDS].
     *)

}

type severity = | HIGH
  | MEDIUM
  | LOW

(** 
    An object that contains the full name, description, and unit of a metric.
     *)
type response_resource_metric = {
  unit_: string option;
  (** 
    The unit of the metric.
     *)

  description: string option;
  (** 
    The description of the metric.
     *)

  metric: string option;
  (** 
    The full name of the metric.
     *)

}

(** 
    An object describing a Performance Insights metric and one or more dimensions for that metric.
     *)
type response_resource_metric_key = {
  dimensions: (string * string) list option;
  (** 
    The valid dimensions for the metric.
     *)

  metric: string;
  (** 
    The name of a Performance Insights metric to be measured.
    
     Valid values for [Metric] are:
     
      {ul
           {- [db.load.avg] - A scaled representation of the number of active sessions for the database engine.
              
              }
            {- [db.sampledload.avg] - The raw number of active sessions for the database engine.
               
               }
            {- The counter metrics listed in {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS}Performance Insights operating system counters} in the {i Amazon Aurora User Guide}.
               
               }
            {- The counter metrics listed in {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS}Performance Insights operating system counters} in the {i Amazon RDS User Guide}.
               
               }
           
      }
       If the number of active sessions is less than an internal Performance Insights threshold, [db.load.avg] and [db.sampledload.avg] are the same value. If the number of active sessions is greater than the internal threshold, Performance Insights samples the active sessions, with [db.load.avg] showing the scaled values, [db.sampledload.avg] showing the raw values, and [db.sampledload.avg] less than [db.load.avg]. For most use cases, you can query [db.load.avg] only.
        *)

}

(** 
    If [PartitionBy] was specified in a [DescribeDimensionKeys] request, the dimensions are returned in an array. Each element in the array specifies one dimension.
     *)
type response_partition_key = {
  dimensions: (string * string) list;
  (** 
    A dimension map that contains the dimensions for this partition.
     *)

}

(** 
    The list of recommendations for the insight.
     *)
type recommendation = {
  recommendation_description: string option;
  (** 
    The recommendation details to help resolve the performance issue. For example, [Investigate the following SQLs that contributed to 100% of the total DBLoad during that time period: sql-id]
     *)

  recommendation_id: string option;
  (** 
    The unique identifier for the recommendation.
     *)

}

type period_alignment = | START_TIME
  | END_TIME

type list_tags_for_resource_response = {
  tags: tag list option;
  (** 
    The metadata assigned to an Amazon RDS resource consisting of a key-value pair.
     *)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  (** 
    Lists all the tags for the Amazon RDS Performance Insights resource. This value is an Amazon Resource Name (ARN). For information about creating an ARN, see {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing}Constructing an RDS Amazon Resource Name (ARN)}.
     *)

  service_type: service_type;
  (** 
    List the tags for the Amazon Web Services service for which Performance Insights returns metrics. Valid value is [RDS].
     *)

}

type analysis_status = | FAILED
  | SUCCEEDED
  | RUNNING

(** 
    Retrieves the details of the performance analysis report.
     *)
type analysis_report_summary = {
  tags: tag list option;
  (** 
    List of all the tags added to the analysis report.
     *)

  status: analysis_status option;
  (** 
    The status of the analysis report.
     *)

  end_time: float option;
  (** 
    The end time of the analysis in the report.
     *)

  start_time: float option;
  (** 
    The start time of the analysis in the report.
     *)

  create_time: float option;
  (** 
    The time you created the analysis report.
     *)

  analysis_report_id: string option;
  (** 
    The name of the analysis report.
     *)

}

type list_performance_analysis_reports_response = {
  next_token: string option;
  (** 
    An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the token, up to the value specified by [MaxResults].
     *)

  analysis_reports: analysis_report_summary list option;
  (** 
    List of reports including the report identifier, start and end time, creation time, and status.
     *)

}

type list_performance_analysis_reports_request = {
  list_tags: bool option;
  (** 
    Specifies whether or not to include the list of tags in the response.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return in the response. If more items exist than the specified [MaxResults] value, a pagination token is included in the response so that the remaining results can be retrieved.
     *)

  next_token: string option;
  (** 
    An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the token, up to the value specified by [MaxResults].
     *)

  identifier: string;
  (** 
    An immutable identifier for a data source that is unique for an Amazon Web Services Region. Performance Insights gathers metrics from this data source. In the console, the identifier is shown as {i ResourceID}. When you call [DescribeDBInstances], the identifier is returned as [DbiResourceId].
    
     To use a DB instance as a data source, specify its [DbiResourceId] value. For example, specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].
      *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights returns metrics. Valid value is [RDS].
     *)

}

type list_available_resource_metrics_response = {
  next_token: string option;
  (** 
    A pagination token that indicates the response didn’t return all available records because [MaxRecords] was specified in the previous request. To get the remaining records, specify [NextToken] in a separate request with this value.
     *)

  metrics: response_resource_metric list option;
  (** 
    An array of metrics available to query. Each array element contains the full name, description, and unit of the metric.
     *)

}

type list_available_resource_metrics_request = {
  max_results: int option;
  (** 
    The maximum number of items to return. If the [MaxRecords] value is less than the number of existing items, the response includes a pagination token.
     *)

  next_token: string option;
  (** 
    An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the token, up to the value specified by [MaxRecords].
     *)

  metric_types: string list;
  (** 
    The types of metrics to return in the response. Valid values in the array include the following:
    
     {ul
          {- [os] (OS counter metrics) - All engines
             
             }
           {- [db] (DB load metrics) - All engines except for Amazon DocumentDB
              
              }
           {- [db.sql.stats] (per-SQL metrics) - All engines except for Amazon DocumentDB
              
              }
           {- [db.sql_tokenized.stats] (per-SQL digest metrics) - All engines except for Amazon DocumentDB
              
              }
          
      }
       *)

  identifier: string;
  (** 
    An immutable identifier for a data source that is unique within an Amazon Web Services Region. Performance Insights gathers metrics from this data source. To use an Amazon RDS DB instance as a data source, specify its [DbiResourceId] value. For example, specify [db-ABCDEFGHIJKLMNOPQRSTU1VWZ].
     *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights returns metrics.
     *)

}

(** 
    The information about a dimension.
     *)
type dimension_detail = {
  identifier: string option;
  (** 
    The identifier of a dimension.
     *)

}

(** 
    Information about dimensions within a dimension group.
     *)
type dimension_group_detail = {
  dimensions: dimension_detail list option;
  (** 
    The dimensions within a dimension group.
     *)

  group: string option;
  (** 
    The name of the dimension group.
     *)

}

(** 
    The available dimension information for a metric type.
     *)
type metric_dimension_groups = {
  groups: dimension_group_detail list option;
  (** 
    The available dimension groups for a metric type.
     *)

  metric: string option;
  (** 
    The metric type to which the dimension information belongs.
     *)

}

type list_available_resource_dimensions_response = {
  next_token: string option;
  (** 
    An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the token, up to the value specified by [MaxRecords].
     *)

  metric_dimensions: metric_dimension_groups list option;
  (** 
    The dimension information returned for requested metric types.
     *)

}

type fine_grained_action = | GET_RESOURCE_METRICS
  | GET_DIMENSION_KEY_DETAILS
  | DESCRIBE_DIMENSION_KEYS

type list_available_resource_dimensions_request = {
  authorized_actions: fine_grained_action list option;
  (** 
    The actions to discover the dimensions you are authorized to access. If you specify multiple actions, then the response will contain the dimensions common for all the actions.
    
     When you don't specify this request parameter or provide an empty list, the response contains all the available dimensions for the target database engine whether or not you are authorized to access them.
      *)

  next_token: string option;
  (** 
    An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the token, up to the value specified by [MaxRecords].
     *)

  max_results: int option;
  (** 
    The maximum number of items to return in the response. If more items exist than the specified [MaxRecords] value, a pagination token is included in the response so that the remaining results can be retrieved.
     *)

  metrics: string list;
  (** 
    The types of metrics for which to retrieve dimensions. Valid values include [db.load].
     *)

  identifier: string;
  (** 
    An immutable identifier for a data source that is unique within an Amazon Web Services Region. Performance Insights gathers metrics from this data source. To use an Amazon RDS DB instance as a data source, specify its [DbiResourceId] value. For example, specify [db-ABCDEFGHIJKLMNOPQRSTU1VWZ].
     *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights returns metrics.
     *)

}

(** 
    A timestamp, and a single numerical value, which together represent a measurement at a particular point in time.
     *)
type data_point = {
  value: float;
  (** 
    The actual value associated with a particular [Timestamp].
     *)

  timestamp_: float;
  (** 
    The time, in epoch format, associated with a particular [Value].
     *)

}

(** 
    A time-ordered series of data points, corresponding to a dimension of a Performance Insights metric.
     *)
type metric_key_data_points = {
  data_points: data_point list option;
  (** 
    An array of timestamp-value pairs, representing measurements over a period of time.
     *)

  key: response_resource_metric_key option;
  (** 
    The dimensions to which the data points apply.
     *)

}

type get_resource_metrics_response = {
  next_token: string option;
  (** 
    An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the token, up to the value specified by [MaxRecords].
     *)

  metric_list: metric_key_data_points list option;
  (** 
    An array of metric results, where each array element contains all of the data points for a particular dimension.
     *)

  identifier: string option;
  (** 
    An immutable identifier for a data source that is unique for an Amazon Web Services Region. Performance Insights gathers metrics from this data source. In the console, the identifier is shown as {i ResourceID}. When you call [DescribeDBInstances], the identifier is returned as [DbiResourceId].
     *)

  aligned_end_time: float option;
  (** 
    The end time for the returned metrics, after alignment to a granular boundary (as specified by [PeriodInSeconds]). [AlignedEndTime] will be greater than or equal to the value of the user-specified [Endtime].
     *)

  aligned_start_time: float option;
  (** 
    The start time for the returned metrics, after alignment to a granular boundary (as specified by [PeriodInSeconds]). [AlignedStartTime] will be less than or equal to the value of the user-specified [StartTime].
     *)

}

(** 
    A logical grouping of Performance Insights metrics for a related subject area. For example, the [db.sql] dimension group consists of the following dimensions:
    
     {ul
          {- [db.sql.id] - The hash of a running SQL statement, generated by Performance Insights.
             
             }
           {- [db.sql.db_id] - Either the SQL ID generated by the database engine, or a value generated by Performance Insights that begins with [pi-].
              
              }
           {- [db.sql.statement] - The full text of the SQL statement that is running, for example, [SELECT * FROM employees].
              
              }
           {- [db.sql_tokenized.id] - The hash of the SQL digest generated by Performance Insights.
              
              }
          
      }
       Each response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500 bytes are returned.
       
        *)
type dimension_group = {
  limit: int option;
  (** 
    The maximum number of items to fetch for this dimension group.
     *)

  dimensions: string list option;
  (** 
    A list of specific dimensions from a dimension group. If this parameter is not present, then it signifies that all of the dimensions in the group were requested, or are present in the response.
    
     Valid values for elements in the [Dimensions] array are:
     
      {ul
           {- [db.application.name] - The name of the application that is connected to the database. Valid values are as follows:
              
               {ul
                    {- Aurora PostgreSQL
                       
                       }
                     {- Amazon RDS PostgreSQL
                        
                        }
                     {- Amazon DocumentDB
                        
                        }
                    
             }
             }
            {- [db.host.id] - The host ID of the connected client (all engines).
               
               }
            {- [db.host.name] - The host name of the connected client (all engines).
               
               }
            {- [db.name] - The name of the database to which the client is connected. Valid values are as follows:
               
                {ul
                     {- Aurora PostgreSQL
                        
                        }
                      {- Amazon RDS PostgreSQL
                         
                         }
                      {- Aurora MySQL
                         
                         }
                      {- Amazon RDS MySQL
                         
                         }
                      {- Amazon RDS MariaDB
                         
                         }
                      {- Amazon DocumentDB
                         
                         }
                     
             }
             }
            {- [db.query.id] - The query ID generated by Performance Insights (only Amazon DocumentDB).
               
               }
            {- [db.query.db_id] - The query ID generated by the database (only Amazon DocumentDB).
               
               }
            {- [db.query.statement] - The text of the query that is being run (only Amazon DocumentDB).
               
               }
            {- [db.query.tokenized_id]
               
               }
            {- [db.query.tokenized.id] - The query digest ID generated by Performance Insights (only Amazon DocumentDB).
               
               }
            {- [db.query.tokenized.db_id] - The query digest ID generated by Performance Insights (only Amazon DocumentDB).
               
               }
            {- [db.query.tokenized.statement] - The text of the query digest (only Amazon DocumentDB).
               
               }
            {- [db.session_type.name] - The type of the current session (only Amazon DocumentDB).
               
               }
            {- [db.sql.id] - The hash of the full, non-tokenized SQL statement generated by Performance Insights (all engines except Amazon DocumentDB).
               
               }
            {- [db.sql.db_id] - Either the SQL ID generated by the database engine, or a value generated by Performance Insights that begins with [pi-] (all engines except Amazon DocumentDB).
               
               }
            {- [db.sql.statement] - The full text of the SQL statement that is running, as in [SELECT * FROM employees] (all engines except Amazon DocumentDB)
               
               }
            {- [db.sql.tokenized_id]
               
               }
            {- [db.sql_tokenized.id] - The hash of the SQL digest generated by Performance Insights (all engines except Amazon DocumentDB). In the console, [db.sql_tokenized.id] is called the Support ID because Amazon Web Services Support can look at this data to help you troubleshoot database issues.
               
               }
            {- [db.sql_tokenized.db_id] - Either the native database ID used to refer to the SQL statement, or a synthetic ID such as [pi-2372568224] that Performance Insights generates if the native database ID isn't available (all engines except Amazon DocumentDB).
               
               }
            {- [db.sql_tokenized.statement] - The text of the SQL digest, as in [SELECT * FROM employees WHERE employee_id = ?] (all engines except Amazon DocumentDB)
               
               }
            {- [db.user.id] - The ID of the user logged in to the database (all engines except Amazon DocumentDB).
               
               }
            {- [db.user.name] - The name of the user logged in to the database (all engines except Amazon DocumentDB).
               
               }
            {- [db.wait_event.name] - The event for which the backend is waiting (all engines except Amazon DocumentDB).
               
               }
            {- [db.wait_event.type] - The type of event for which the backend is waiting (all engines except Amazon DocumentDB).
               
               }
            {- [db.wait_event_type.name] - The name of the event type for which the backend is waiting (all engines except Amazon DocumentDB).
               
               }
            {- [db.wait_state.name] - The event for which the backend is waiting (only Amazon DocumentDB).
               
               }
           
      }
       *)

  group: string;
  (** 
    The name of the dimension group. Valid values are as follows:
    
     {ul
          {- [db] - The name of the database to which the client is connected. The following values are permitted:
             
              {ul
                   {- Aurora PostgreSQL
                      
                      }
                    {- Amazon RDS PostgreSQL
                       
                       }
                    {- Aurora MySQL
                       
                       }
                    {- Amazon RDS MySQL
                       
                       }
                    {- Amazon RDS MariaDB
                       
                       }
                    {- Amazon DocumentDB
                       
                       }
                   
            }
            }
           {- [db.application] - The name of the application that is connected to the database. The following values are permitted:
              
               {ul
                    {- Aurora PostgreSQL
                       
                       }
                     {- Amazon RDS PostgreSQL
                        
                        }
                     {- Amazon DocumentDB
                        
                        }
                    
            }
            }
           {- [db.host] - The host name of the connected client (all engines).
              
              }
           {- [db.query] - The query that is currently running (only Amazon DocumentDB).
              
              }
           {- [db.query_tokenized] - The digest query (only Amazon DocumentDB).
              
              }
           {- [db.session_type] - The type of the current session (only Aurora PostgreSQL and RDS PostgreSQL).
              
              }
           {- [db.sql] - The text of the SQL statement that is currently running (all engines except Amazon DocumentDB).
              
              }
           {- [db.sql_tokenized] - The SQL digest (all engines except Amazon DocumentDB).
              
              }
           {- [db.user] - The user logged in to the database (all engines except Amazon DocumentDB).
              
              }
           {- [db.wait_event] - The event for which the database backend is waiting (all engines except Amazon DocumentDB).
              
              }
           {- [db.wait_event_type] - The type of event for which the database backend is waiting (all engines except Amazon DocumentDB).
              
              }
           {- [db.wait_state] - The event for which the database backend is waiting (only Amazon DocumentDB).
              
              }
          
      }
       *)

}

(** 
    A single query to be processed. You must provide the metric to query and append an aggregate function to the metric. For example, to find the average for the metric [db.load] you must use [db.load.avg]. Valid values for aggregate functions include [.avg], [.min], [.max], and [.sum]. If no other parameters are specified, Performance Insights returns all data points for the specified metric. Optionally, you can request that the data points be aggregated by dimension group ([GroupBy]), and return only those data points that match your criteria ([Filter]).
     *)
type metric_query = {
  filter: (string * string) list option;
  (** 
    One or more filters to apply in the request. Restrictions:
    
     {ul
          {- Any number of filters by the same dimension, as specified in the [GroupBy] parameter.
             
             }
           {- A single filter for any other dimension in this dimension group.
              
              }
          
      }
       *)

  group_by: dimension_group option;
  (** 
    A specification for how to aggregate the data points from a query result. You must specify a valid dimension group. Performance Insights will return all of the dimensions within that group, unless you provide the names of specific dimensions within that group. You can also request that Performance Insights return a limited number of values for a dimension.
     *)

  metric: string;
  (** 
    The name of a Performance Insights metric to be measured.
    
     Valid values for [Metric] are:
     
      {ul
           {- [db.load.avg] - A scaled representation of the number of active sessions for the database engine.
              
              }
            {- [db.sampledload.avg] - The raw number of active sessions for the database engine.
               
               }
            {- The counter metrics listed in {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS}Performance Insights operating system counters} in the {i Amazon Aurora User Guide}.
               
               }
            {- The counter metrics listed in {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS}Performance Insights operating system counters} in the {i Amazon RDS User Guide}.
               
               }
           
      }
       If the number of active sessions is less than an internal Performance Insights threshold, [db.load.avg] and [db.sampledload.avg] are the same value. If the number of active sessions is greater than the internal threshold, Performance Insights samples the active sessions, with [db.load.avg] showing the scaled values, [db.sampledload.avg] showing the raw values, and [db.sampledload.avg] less than [db.load.avg]. For most use cases, you can query [db.load.avg] only.
        *)

}

type get_resource_metrics_request = {
  period_alignment: period_alignment option;
  (** 
    The returned timestamp which is the start or end time of the time periods. The default value is [END_TIME].
     *)

  next_token: string option;
  (** 
    An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the token, up to the value specified by [MaxRecords].
     *)

  max_results: int option;
  (** 
    The maximum number of items to return in the response. If more items exist than the specified [MaxRecords] value, a pagination token is included in the response so that the remaining results can be retrieved.
     *)

  period_in_seconds: int option;
  (** 
    The granularity, in seconds, of the data points returned from Performance Insights. A period can be as short as one second, or as long as one day (86400 seconds). Valid values are:
    
     {ul
          {- [1] (one second)
             
             }
           {- [60] (one minute)
              
              }
           {- [300] (five minutes)
              
              }
           {- [3600] (one hour)
              
              }
           {- [86400] (twenty-four hours)
              
              }
          
      }
       If you don't specify [PeriodInSeconds], then Performance Insights will choose a value for you, with a goal of returning roughly 100-200 data points in the response.
        *)

  end_time: float;
  (** 
    The date and time specifying the end of the requested time series query range. The value specified is {i exclusive}. Thus, the command returns data points less than (but not equal to) [EndTime].
    
     The value for [EndTime] must be later than the value for [StartTime].
      *)

  start_time: float;
  (** 
    The date and time specifying the beginning of the requested time series query range. You can't specify a [StartTime] that is earlier than 7 days ago. By default, Performance Insights has 7 days of retention, but you can extend this range up to 2 years. The value specified is {i inclusive}. Thus, the command returns data points equal to or greater than [StartTime].
    
     The value for [StartTime] must be earlier than the value for [EndTime].
      *)

  metric_queries: metric_query list;
  (** 
    An array of one or more queries to perform. Each query must specify a Performance Insights metric and specify an aggregate function, and you can provide filtering criteria. You must append the aggregate function to the metric. For example, to find the average for the metric [db.load] you must use [db.load.avg]. Valid values for aggregate functions include [.avg], [.min], [.max], and [.sum].
     *)

  identifier: string;
  (** 
    An immutable identifier for a data source that is unique for an Amazon Web Services Region. Performance Insights gathers metrics from this data source. In the console, the identifier is shown as {i ResourceID}. When you call [DescribeDBInstances], the identifier is returned as [DbiResourceId].
    
     To use a DB instance as a data source, specify its [DbiResourceId] value. For example, specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].
      *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights returns metrics. Valid values are as follows:
    
     {ul
          {- [RDS]
             
             }
           {- [DOCDB]
              
              }
          
      }
       *)

}

type feature_status = | UNKNOWN
  | DISABLED_PENDING_REBOOT
  | ENABLED_PENDING_REBOOT
  | UNSUPPORTED
  | DISABLED
  | ENABLED

(** 
    The metadata for a feature. For example, the metadata might indicate that a feature is turned on or off on a specific DB instance.
     *)
type feature_metadata = {
  status: feature_status option;
  (** 
    The status of the feature on the DB instance. Possible values include the following:
    
     {ul
          {- [ENABLED] - The feature is enabled on the instance.
             
             }
           {- [DISABLED] - The feature is disabled on the instance.
              
              }
           {- [UNSUPPORTED] - The feature isn't supported on the instance.
              
              }
           {- [ENABLED_PENDING_REBOOT] - The feature is enabled on the instance but requires a reboot to take effect.
              
              }
           {- [DISABLED_PENDING_REBOOT] - The feature is disabled on the instance but requires a reboot to take effect.
              
              }
           {- [UNKNOWN] - The feature status couldn't be determined.
              
              }
          
      }
       *)

}

type get_resource_metadata_response = {
  features: (string * feature_metadata) list option;
  (** 
    The metadata for different features. For example, the metadata might indicate that a feature is turned on or off on a specific DB instance.
     *)

  identifier: string option;
  (** 
    An immutable identifier for a data source that is unique for an Amazon Web Services Region. Performance Insights gathers metrics from this data source. To use a DB instance as a data source, specify its [DbiResourceId] value. For example, specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].
     *)

}

type get_resource_metadata_request = {
  identifier: string;
  (** 
    An immutable identifier for a data source that is unique for an Amazon Web Services Region. Performance Insights gathers metrics from this data source. To use a DB instance as a data source, specify its [DbiResourceId] value. For example, specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].
     *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights returns metrics.
     *)

}

type context_type = | CONTEXTUAL
  | CAUSAL

(** 
    This data type helps to determine Performance Insights metric to render for the insight.
     *)
type performance_insights_metric = {
  value: float option;
  (** 
    The value of the metric. For example, [9] for [db.load.avg].
     *)

  dimensions: (string * string) list option;
  (** 
    A dimension map that contains the dimensions for this partition.
     *)

  display_name: string option;
  (** 
    The Performance Insights metric name.
     *)

  metric: string option;
  (** 
    The Performance Insights metric.
     *)

}

(** 
    List of data objects which provide details about source metrics. This field can be used to determine the PI metric to render for the insight. This data type also includes static values for the metrics for the Insight that were calculated and included in text and annotations on the DB load chart.
     *)
type data = {
  performance_insights_metric: performance_insights_metric option;
  (** 
    This field determines the Performance Insights metric to render for the insight. The [name] field refers to a Performance Insights metric.
     *)

}

type insight = {
  baseline_data: data list option;
  (** 
    Metric names and values from the timeframe used as baseline to generate the insight.
     *)

  insight_data: data list option;
  (** 
    List of data objects containing metrics and references from the time range while generating the insight.
     *)

  recommendations: recommendation list option;
  (** 
    List of recommendations for the insight. For example, [Investigate the following SQLs that contributed to 100% of the total DBLoad during that time period: sql-id].
     *)

  description: string option;
  (** 
    Description of the insight. For example: [A high severity Insight found between 02:00 to 02:30, where there was an unusually high DB load 600x above baseline. Likely performance impact].
     *)

  supporting_insights: insight list option;
  (** 
    List of supporting insights that provide additional factors for the insight.
     *)

  severity: severity option;
  (** 
    The severity of the insight. The values are: [Low], [Medium], or [High].
     *)

  end_time: float option;
  (** 
    The end time of the insight. For example, [2018-10-30T00:00:00Z].
     *)

  start_time: float option;
  (** 
    The start time of the insight. For example, [2018-10-30T00:00:00Z].
     *)

  context: context_type option;
  (** 
    Indicates if the insight is causal or correlated insight.
     *)

  insight_type: string option;
  (** 
    The type of insight. For example, [HighDBLoad], [HighCPU], or [DominatingSQLs].
     *)

  insight_id: string;
  (** 
    The unique identifier for the insight. For example, [insight-12345678901234567].
     *)

}

(** 
    Retrieves the summary of the performance analysis report created for a time period.
     *)
type analysis_report = {
  insights: insight list option;
  (** 
    The list of identified insights in the analysis report.
     *)

  status: analysis_status option;
  (** 
    The status of the created analysis report.
     *)

  end_time: float option;
  (** 
    The analysis end time in the report.
     *)

  start_time: float option;
  (** 
    The analysis start time in the report.
     *)

  create_time: float option;
  (** 
    The time you created the analysis report.
     *)

  service_type: service_type option;
  (** 
    List the tags for the Amazon Web Services service for which Performance Insights returns metrics. Valid values are as follows:
    
     {ul
          {- [RDS]
             
             }
           {- [DOCDB]
              
              }
          
      }
       *)

  identifier: string option;
  (** 
    The unique identifier of the analysis report.
     *)

  analysis_report_id: string;
  (** 
    The name of the analysis report.
     *)

}

type get_performance_analysis_report_response = {
  analysis_report: analysis_report option;
  (** 
    The summary of the performance analysis report created for a time period.
     *)

}

type accept_language = | EN_US

type get_performance_analysis_report_request = {
  accept_language: accept_language option;
  (** 
    The text language in the report. The default language is [EN_US] (English).
     *)

  text_format: text_format option;
  (** 
    Indicates the text format in the report. The options are [PLAIN_TEXT] or [MARKDOWN]. The default value is [plain text].
     *)

  analysis_report_id: string;
  (** 
    A unique identifier of the created analysis report. For example, [report-12345678901234567]
     *)

  identifier: string;
  (** 
    An immutable identifier for a data source that is unique for an Amazon Web Services Region. Performance Insights gathers metrics from this data source. In the console, the identifier is shown as {i ResourceID}. When you call [DescribeDBInstances], the identifier is returned as [DbiResourceId].
    
     To use a DB instance as a data source, specify its [DbiResourceId] value. For example, specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].
      *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights will return metrics. Valid value is [RDS].
     *)

}

type detail_status = | UNAVAILABLE
  | PROCESSING
  | AVAILABLE

(** 
    An object that describes the details for a specified dimension.
     *)
type dimension_key_detail = {
  status: detail_status option;
  (** 
    The status of the dimension detail data. Possible values include the following:
    
     {ul
          {- [AVAILABLE] - The dimension detail data is ready to be retrieved.
             
             }
           {- [PROCESSING] - The dimension detail data isn't ready to be retrieved because more processing time is required. If the requested detail data has the status [PROCESSING], Performance Insights returns the truncated query.
              
              }
           {- [UNAVAILABLE] - The dimension detail data could not be collected successfully.
              
              }
          
      }
       *)

  dimension: string option;
  (** 
    The full name of the dimension. The full name includes the group name and key name. The following values are valid:
    
     {ul
          {- [db.query.statement] (Amazon DocumentDB)
             
             }
           {- [db.sql.statement] (Amazon RDS and Aurora)
              
              }
          
      }
       *)

  value: string option;
  (** 
    The value of the dimension detail data. Depending on the return status, this value is either the full or truncated SQL query for the following dimensions:
    
     {ul
          {- [db.query.statement] (Amazon DocumentDB)
             
             }
           {- [db.sql.statement] (Amazon RDS and Aurora)
              
              }
          
      }
       *)

}

type get_dimension_key_details_response = {
  dimensions: dimension_key_detail list option;
  (** 
    The details for the requested dimensions.
     *)

}

type get_dimension_key_details_request = {
  requested_dimensions: string list option;
  (** 
    A list of dimensions to retrieve the detail data for within the given dimension group. If you don't specify this parameter, Performance Insights returns all dimension data within the specified dimension group. Specify dimension names for the following dimension groups:
    
     {ul
          {- [db.sql] - Specify either the full dimension name [db.sql.statement] or the short dimension name [statement] (Aurora and RDS only).
             
             }
           {- [db.query] - Specify either the full dimension name [db.query.statement] or the short dimension name [statement] (DocumentDB only).
              
              }
          
      }
       *)

  group_identifier: string;
  (** 
    The ID of the dimension group from which to retrieve dimension details. For dimension group [db.sql], the group ID is [db.sql.id]. The following group ID values are valid:
    
     {ul
          {- [db.sql.id] for dimension group [db.sql] (Aurora and RDS only)
             
             }
           {- [db.query.id] for dimension group [db.query] (DocumentDB only)
              
              }
          
      }
       *)

  group: string;
  (** 
    The name of the dimension group. Performance Insights searches the specified group for the dimension group ID. The following group name values are valid:
    
     {ul
          {- [db.query] (Amazon DocumentDB only)
             
             }
           {- [db.sql] (Amazon RDS and Aurora only)
              
              }
          
      }
       *)

  identifier: string;
  (** 
    The ID for a data source from which to gather dimension data. This ID must be immutable and unique within an Amazon Web Services Region. When a DB instance is the data source, specify its [DbiResourceId] value. For example, specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].
     *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights returns data. The only valid value is [RDS].
     *)

}

(** 
    An object that includes the requested dimension key values and aggregated metric values within a dimension group.
     *)
type dimension_key_description = {
  partitions: float list option;
  (** 
    If [PartitionBy] was specified, [PartitionKeys] contains the dimensions that were.
     *)

  additional_metrics: (string * float) list option;
  (** 
    A map that contains the value for each additional metric.
     *)

  total: float option;
  (** 
    The aggregated metric value for the dimensions, over the requested time range.
     *)

  dimensions: (string * string) list option;
  (** 
    A map of name-value pairs for the dimensions in the group.
     *)

}

type describe_dimension_keys_response = {
  next_token: string option;
  (** 
    A pagination token that indicates the response didn’t return all available records because [MaxRecords] was specified in the previous request. To get the remaining records, specify [NextToken] in a separate request with this value.
     *)

  keys: dimension_key_description list option;
  (** 
    The dimension keys that were requested.
     *)

  partition_keys: response_partition_key list option;
  (** 
    If [PartitionBy] was present in the request, [PartitionKeys] contains the breakdown of dimension keys by the specified partitions.
     *)

  aligned_end_time: float option;
  (** 
    The end time for the returned dimension keys, after alignment to a granular boundary (as specified by [PeriodInSeconds]). [AlignedEndTime] will be greater than or equal to the value of the user-specified [Endtime].
     *)

  aligned_start_time: float option;
  (** 
    The start time for the returned dimension keys, after alignment to a granular boundary (as specified by [PeriodInSeconds]). [AlignedStartTime] will be less than or equal to the value of the user-specified [StartTime].
     *)

}

type describe_dimension_keys_request = {
  next_token: string option;
  (** 
    An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the token, up to the value specified by [MaxRecords].
     *)

  max_results: int option;
  (** 
    The maximum number of items to return in the response. If more items exist than the specified [MaxRecords] value, a pagination token is included in the response so that the remaining results can be retrieved.
     *)

  filter: (string * string) list option;
  (** 
    One or more filters to apply in the request. Restrictions:
    
     {ul
          {- Any number of filters by the same dimension, as specified in the [GroupBy] or [Partition] parameters.
             
             }
           {- A single filter for any other dimension in this dimension group.
              
              }
          
      }
       *)

  partition_by: dimension_group option;
  (** 
    For each dimension specified in [GroupBy], specify a secondary dimension to further subdivide the partition keys in the response.
     *)

  additional_metrics: string list option;
  [@ocaml.doc {| 
    Additional metrics for the top [N] dimension keys. If the specified dimension group in the [GroupBy] parameter is [db.sql_tokenized], you can specify per-SQL metrics to get the values for the top [N] SQL digests. The response syntax is as follows: ["AdditionalMetrics" : { "{i string}" : "{i string}" }].
     |}]

  group_by: dimension_group;
  (** 
    A specification for how to aggregate the data points from a query result. You must specify a valid dimension group. Performance Insights returns all dimensions within this group, unless you provide the names of specific dimensions within this group. You can also request that Performance Insights return a limited number of values for a dimension.
     *)

  period_in_seconds: int option;
  (** 
    The granularity, in seconds, of the data points returned from Performance Insights. A period can be as short as one second, or as long as one day (86400 seconds). Valid values are:
    
     {ul
          {- [1] (one second)
             
             }
           {- [60] (one minute)
              
              }
           {- [300] (five minutes)
              
              }
           {- [3600] (one hour)
              
              }
           {- [86400] (twenty-four hours)
              
              }
          
      }
       If you don't specify [PeriodInSeconds], then Performance Insights chooses a value for you, with a goal of returning roughly 100-200 data points in the response.
        *)

  metric: string;
  (** 
    The name of a Performance Insights metric to be measured.
    
     Valid values for [Metric] are:
     
      {ul
           {- [db.load.avg] - A scaled representation of the number of active sessions for the database engine.
              
              }
            {- [db.sampledload.avg] - The raw number of active sessions for the database engine.
               
               }
           
      }
       If the number of active sessions is less than an internal Performance Insights threshold, [db.load.avg] and [db.sampledload.avg] are the same value. If the number of active sessions is greater than the internal threshold, Performance Insights samples the active sessions, with [db.load.avg] showing the scaled values, [db.sampledload.avg] showing the raw values, and [db.sampledload.avg] less than [db.load.avg]. For most use cases, you can query [db.load.avg] only.
        *)

  end_time: float;
  (** 
    The date and time specifying the end of the requested time series data. The value specified is {i exclusive}, which means that data points less than (but not equal to) [EndTime] are returned.
    
     The value for [EndTime] must be later than the value for [StartTime].
      *)

  start_time: float;
  (** 
    The date and time specifying the beginning of the requested time series data. You must specify a [StartTime] within the past 7 days. The value specified is {i inclusive}, which means that data points equal to or greater than [StartTime] are returned.
    
     The value for [StartTime] must be earlier than the value for [EndTime].
      *)

  identifier: string;
  (** 
    An immutable, Amazon Web Services Region-unique identifier for a data source. Performance Insights gathers metrics from this data source.
    
     To use an Amazon RDS instance as a data source, you specify its [DbiResourceId] value. For example, specify [db-FAIHNTYBKTGAUSUZQYPDS2GW4A].
      *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights will return metrics. Valid values are as follows:
    
     {ul
          {- [RDS]
             
             }
           {- [DOCDB]
              
              }
          
      }
       *)

}

type delete_performance_analysis_report_response = unit

type delete_performance_analysis_report_request = {
  analysis_report_id: string;
  (** 
    The unique identifier of the analysis report for deletion.
     *)

  identifier: string;
  (** 
    An immutable identifier for a data source that is unique for an Amazon Web Services Region. Performance Insights gathers metrics from this data source. In the console, the identifier is shown as {i ResourceID}. When you call [DescribeDBInstances], the identifier is returned as [DbiResourceId].
    
     To use a DB instance as a data source, specify its [DbiResourceId] value. For example, specify [db-ABCDEFGHIJKLMNOPQRSTU1VW2X].
      *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights will return metrics. Valid value is [RDS].
     *)

}

type create_performance_analysis_report_response = {
  analysis_report_id: string option;
  (** 
    A unique identifier for the created analysis report.
     *)

}

type create_performance_analysis_report_request = {
  tags: tag list option;
  (** 
    The metadata assigned to the analysis report consisting of a key-value pair.
     *)

  end_time: float;
  (** 
    The end time defined for the analysis report.
     *)

  start_time: float;
  (** 
    The start time defined for the analysis report.
     *)

  identifier: string;
  (** 
    An immutable, Amazon Web Services Region-unique identifier for a data source. Performance Insights gathers metrics from this data source.
    
     To use an Amazon RDS instance as a data source, you specify its [DbiResourceId] value. For example, specify [db-ADECBTYHKTSAUMUZQYPDS2GW4A].
      *)

  service_type: service_type;
  (** 
    The Amazon Web Services service for which Performance Insights will return metrics. Valid value is [RDS].
     *)

}

(** 
    Amazon RDS Performance Insights Amazon RDS Performance Insights enables you to monitor and explore different dimensions of database load based on data captured from a running DB instance. The guide provides detailed information about Performance Insights data types, parameters and errors.
                                    
                                     When Performance Insights is enabled, the Amazon RDS Performance Insights API provides visibility into the performance of your DB instance. Amazon CloudWatch provides the authoritative source for Amazon Web Services service-vended monitoring metrics. Performance Insights offers a domain-specific view of DB load.
                                     
                                      DB load is measured as average active sessions. Performance Insights provides the data to API consumers as a two-dimensional time-series dataset. The time dimension provides DB load data for each time point in the queried time range. Each time point decomposes overall load in relation to the requested dimensions, measured at that time point. Examples include SQL, Wait event, User, and Host.
                                      
                                       {ul
                                            {- To learn more about Performance Insights and Amazon Aurora DB instances, go to the {i {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights.html}Amazon Aurora User Guide}}.
                                               
                                               }
                                             {- To learn more about Performance Insights and Amazon RDS DB instances, go to the {i {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html}Amazon RDS User Guide}}.
                                                
                                                }
                                             {- To learn more about Performance Insights and Amazon DocumentDB clusters, go to the {i {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/performance-insights.html}Amazon DocumentDB Developer Guide}}.
                                                
                                                }
                                            
      }
       *)


type base_document = Json.t

