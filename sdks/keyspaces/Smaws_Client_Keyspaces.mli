(** 
    Keyspaces client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

type rs = | SINGLE_REGION
  | MULTI_REGION

(** 
    The operation failed due to an invalid or malformed request.
     *)
type validation_exception = {
  message: string option;
  (** 
    Description of the error.
     *)

}

type update_table_response = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the modified table.
     *)

}

(** 
    The names and data types of regular columns.
     *)
type column_definition = {
  type_: string;
  (** 
    The data type of the column. For a list of available data types, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types}Data types} in the {i Amazon Keyspaces Developer Guide}.
     *)

  name: string;
  (** 
    The name of the column.
     *)

}

type throughput_mode = | PAY_PER_REQUEST
  | PROVISIONED

(** 
    Amazon Keyspaces has two read/write capacity modes for processing reads and writes on your tables:
    
     {ul
          {- On-demand (default)
             
             }
           {- Provisioned
              
              }
          
      }
       The read/write capacity mode that you choose controls how you are charged for read and write throughput and how table throughput capacity is managed.
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.
         *)
type capacity_specification = {
  write_capacity_units: int option;
  (** 
    The throughput capacity specified for [write] operations defined in [write capacity units] [(WCUs)].
     *)

  read_capacity_units: int option;
  (** 
    The throughput capacity specified for [read] operations defined in [read capacity units] [(RCUs)].
     *)

  throughput_mode: throughput_mode;
  (** 
    The read/write throughput capacity mode for a table. The options are:
    
     {ul
          {- [throughputMode:PAY_PER_REQUEST] and
             
             }
           {- [throughputMode:PROVISIONED] - Provisioned capacity mode requires [readCapacityUnits] and [writeCapacityUnits] as input.
              
              }
          
      }
       The default is [throughput_mode:PAY_PER_REQUEST].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.
         *)

}

type encryption_type = | CUSTOMER_MANAGED_KMS_KEY
  | AWS_OWNED_KMS_KEY

(** 
    Amazon Keyspaces encrypts and decrypts the table data at rest transparently and integrates with Key Management Service for storing and managing the encryption key. You can choose one of the following KMS keys (KMS keys):
    
     {ul
          {- Amazon Web Services owned key - This is the default encryption type. The key is owned by Amazon Keyspaces (no additional charge).
             
             }
           {- Customer managed key - This key is stored in your account and is created, owned, and managed by you. You have full control over the customer managed key (KMS charges apply).
              
              }
          
      }
       For more information about encryption at rest in Amazon Keyspaces, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.
       
        For more information about KMS, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}KMS management service concepts} in the {i Key Management Service Developer Guide}.
         *)
type encryption_specification = {
  kms_key_identifier: string option;
  (** 
    The Amazon Resource Name (ARN) of the customer managed KMS key, for example [kms_key_identifier:ARN].
     *)

  type_: encryption_type;
  (** 
    The encryption option specified for the table. You can choose one of the following KMS keys (KMS keys):
    
     {ul
          {- [type:AWS_OWNED_KMS_KEY] - This key is owned by Amazon Keyspaces.
             
             }
           {- [type:CUSTOMER_MANAGED_KMS_KEY] - This key is stored in your account and is created, owned, and managed by you. This option requires the [kms_key_identifier] of the KMS key in Amazon Resource Name (ARN) format as input.
              
              }
          
      }
       The default is [type:AWS_OWNED_KMS_KEY].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.
         *)

}

type point_in_time_recovery_status = | ENABLED
  | DISABLED

(** 
    Point-in-time recovery (PITR) helps protect your Amazon Keyspaces tables from accidental write or delete operations by providing you continuous backups of your table data.
    
     For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html}Point-in-time recovery} in the {i Amazon Keyspaces Developer Guide}.
      *)
type point_in_time_recovery = {
  status: point_in_time_recovery_status;
  (** 
    The options are:
    
     {ul
          {- [status=ENABLED]
             
             }
           {- [status=DISABLED]
              
              }
          
      }
       *)

}

type time_to_live_status = | ENABLED

(** 
    Enable custom Time to Live (TTL) settings for rows and columns without setting a TTL default for the specified table.
    
     For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_enabling}Enabling TTL on tables} in the {i Amazon Keyspaces Developer Guide}.
      *)
type time_to_live = {
  status: time_to_live_status;
  (** 
    Shows how to enable custom Time to Live (TTL) settings for the specified table.
     *)

}

type client_side_timestamps_status = | ENABLED

(** 
    The client-side timestamp setting of the table.
    
     For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/client-side-timestamps-how-it-works.html}How it works: Amazon Keyspaces client-side timestamps} in the {i Amazon Keyspaces Developer Guide}.
      *)
type client_side_timestamps = {
  status: client_side_timestamps_status;
  (** 
    Shows how to enable client-side timestamps settings for the specified table.
     *)

}

(** 
    The auto scaling policy that scales a table based on the ratio of consumed to provisioned capacity.
     *)
type target_tracking_scaling_policy_configuration = {
  target_value: float;
  (** 
    Specifies the target value for the target tracking auto scaling policy.
    
     Amazon Keyspaces auto scaling scales up capacity automatically when traffic exceeds this target utilization rate, and then back down when it falls below the target. This ensures that the ratio of consumed capacity to provisioned capacity stays at or near this value. You define [targetValue] as a percentage. A [double] between 20 and 90.
      *)

  scale_out_cooldown: int option;
  (** 
    Specifies a scale out cool down period.
    
     A cooldown period in seconds between scaling activities that lets the table stabilize before another scaling activity starts.
      *)

  scale_in_cooldown: int option;
  (** 
    Specifies a [scale-in] cool down period.
    
     A cooldown period in seconds between scaling activities that lets the table stabilize before another scaling activity starts.
      *)

  disable_scale_in: bool option;
  (** 
    Specifies if [scale-in] is enabled.
    
     When auto scaling automatically decreases capacity for a table, the table {i scales in}. When scaling policies are set, they can't scale in the table lower than its minimum capacity.
      *)

}

(** 
    Amazon Keyspaces supports the [target tracking] auto scaling policy. With this policy, Amazon Keyspaces auto scaling ensures that the table's ratio of consumed to provisioned capacity stays at or near the target value that you specify. You define the target value as a percentage between 20 and 90.
     *)
type auto_scaling_policy = {
  target_tracking_scaling_policy_configuration: target_tracking_scaling_policy_configuration option;
  (** 
    Auto scaling scales up capacity automatically when traffic exceeds this target utilization rate, and then back down when it falls below the target. A [double] between 20 and 90.
     *)

}

(** 
    The optional auto scaling settings for a table with provisioned throughput capacity.
    
     To turn on auto scaling for a table in [throughputMode:PROVISIONED], you must specify the following parameters.
     
      Configure the minimum and maximum capacity units. The auto scaling policy ensures that capacity never goes below the minimum or above the maximum range.
      
       {ul
            {- [minimumUnits]: The minimum level of throughput the table should always be ready to support. The value must be between 1 and the max throughput per second quota for your account (40,000 by default).
               
               }
             {- [maximumUnits]: The maximum level of throughput the table should always be ready to support. The value must be between 1 and the max throughput per second quota for your account (40,000 by default).
                
                }
             {- [scalingPolicy]: Amazon Keyspaces supports the [target tracking] scaling policy. The auto scaling target is the provisioned capacity of the table.
                
                 {ul
                      {- [targetTrackingScalingPolicyConfiguration]: To define the target tracking policy, you must define the target value.
                         
                          {ul
                               {- [targetValue]: The target utilization rate of the table. Amazon Keyspaces auto scaling ensures that the ratio of consumed capacity to provisioned capacity stays at or near this value. You define [targetValue] as a percentage. A [double] between 20 and 90. (Required)
                                  
                                  }
                                {- [disableScaleIn]: A [boolean] that specifies if [scale-in] is disabled or enabled for the table. This parameter is disabled by default. To turn on [scale-in], set the [boolean] value to [FALSE]. This means that capacity for a table can be automatically scaled down on your behalf. (Optional)
                                   
                                   }
                                {- [scaleInCooldown]: A cooldown period in seconds between scaling activities that lets the table stabilize before another scale in activity starts. If no value is provided, the default is 0. (Optional)
                                   
                                   }
                                {- [scaleOutCooldown]: A cooldown period in seconds between scaling activities that lets the table stabilize before another scale out activity starts. If no value is provided, the default is 0. (Optional)
                                   
                                   }
                               
                        }
                        }
                      
              }
              }
            
      }
       For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.
        *)
type auto_scaling_settings = {
  scaling_policy: auto_scaling_policy option;
  (** 
    Amazon Keyspaces supports the [target tracking] auto scaling policy. With this policy, Amazon Keyspaces auto scaling ensures that the table's ratio of consumed to provisioned capacity stays at or near the target value that you specify. You define the target value as a percentage between 20 and 90.
     *)

  maximum_units: int option;
  (** 
    Manage costs by specifying the maximum amount of throughput to provision. The value must be between 1 and the max throughput per second quota for your account (40,000 by default).
     *)

  minimum_units: int option;
  (** 
    The minimum level of throughput the table should always be ready to support. The value must be between 1 and the max throughput per second quota for your account (40,000 by default).
     *)

  auto_scaling_disabled: bool option;
  (** 
    This optional parameter enables auto scaling for the table if set to [false].
     *)

}

(** 
    The optional auto scaling capacity settings for a table in provisioned capacity mode.
     *)
type auto_scaling_specification = {
  read_capacity_auto_scaling: auto_scaling_settings option;
  (** 
    The auto scaling settings for the table's read capacity.
     *)

  write_capacity_auto_scaling: auto_scaling_settings option;
  (** 
    The auto scaling settings for the table's write capacity.
     *)

}

(** 
    The Amazon Web Services Region specific settings of a multi-Region table.
    
     For a multi-Region table, you can configure the table's read capacity differently per Amazon Web Services Region. You can do this by configuring the following parameters.
     
      {ul
           {- [region]: The Region where these settings are applied. (Required)
              
              }
            {- [readCapacityUnits]: The provisioned read capacity units. (Optional)
               
               }
            {- [readCapacityAutoScaling]: The read capacity auto scaling settings for the table. (Optional)
               
               }
           
      }
       *)
type replica_specification = {
  read_capacity_auto_scaling: auto_scaling_settings option;
  (** 
    The read capacity auto scaling settings for the multi-Region table in the specified Amazon Web Services Region.
     *)

  read_capacity_units: int option;
  (** 
    The provisioned read capacity units for the multi-Region table in the specified Amazon Web Services Region.
     *)

  region: string;
  (** 
    The Amazon Web Services Region.
     *)

}

type update_table_request = {
  replica_specifications: replica_specification list option;
  (** 
    The Region specific settings of a multi-Regional table.
     *)

  auto_scaling_specification: auto_scaling_specification option;
  (** 
    The optional auto scaling settings to update for a table in provisioned capacity mode. Specifies if the service can manage throughput capacity of a provisioned table automatically on your behalf. Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads efficiently by increasing and decreasing your table's read and write capacity automatically in response to application traffic.
    
     If auto scaling is already enabled for the table, you can use [UpdateTable] to update the minimum and maximum values or the auto scaling policy settings independently.
     
      For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.
       *)

  client_side_timestamps: client_side_timestamps option;
  [@ocaml.doc {| 
    Enables client-side timestamps for the table. By default, the setting is disabled. You can enable client-side timestamps with the following option:
    
     {ul
          {- [status: "enabled"]
             
             }
          
      }
       Once client-side timestamps are enabled for a table, this setting cannot be disabled.
        |}]

  default_time_to_live: int option;
  (** 
    The default Time to Live setting in seconds for the table.
    
     For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_default_ttl}Setting the default TTL value for a table} in the {i Amazon Keyspaces Developer Guide}.
      *)

  ttl: time_to_live option;
  (** 
    Modifies Time to Live custom settings for the table. The options are:
    
     {ul
          {- [status:enabled]
             
             }
           {- [status:disabled]
              
              }
          
      }
       The default is [status:disabled]. After [ttl] is enabled, you can't disable it for the table.
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL.html}Expiring data by using Amazon Keyspaces Time to Live (TTL)} in the {i Amazon Keyspaces Developer Guide}.
         *)

  point_in_time_recovery: point_in_time_recovery option;
  (** 
    Modifies the [pointInTimeRecovery] settings of the table. The options are:
    
     {ul
          {- [status=ENABLED]
             
             }
           {- [status=DISABLED]
              
              }
          
      }
       If it's not specified, the default is [status=DISABLED].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html}Point-in-time recovery} in the {i Amazon Keyspaces Developer Guide}.
         *)

  encryption_specification: encryption_specification option;
  (** 
    Modifies the encryption settings of the table. You can choose one of the following KMS key (KMS key):
    
     {ul
          {- [type:AWS_OWNED_KMS_KEY] - This key is owned by Amazon Keyspaces.
             
             }
           {- [type:CUSTOMER_MANAGED_KMS_KEY] - This key is stored in your account and is created, owned, and managed by you. This option requires the [kms_key_identifier] of the KMS key in Amazon Resource Name (ARN) format as input.
              
              }
          
      }
       The default is [AWS_OWNED_KMS_KEY].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.
         *)

  capacity_specification: capacity_specification option;
  (** 
    Modifies the read/write throughput capacity mode for the table. The options are:
    
     {ul
          {- [throughputMode:PAY_PER_REQUEST] and
             
             }
           {- [throughputMode:PROVISIONED] - Provisioned capacity mode requires [readCapacityUnits] and [writeCapacityUnits] as input.
              
              }
          
      }
       The default is [throughput_mode:PAY_PER_REQUEST].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.
         *)

  add_columns: column_definition list option;
  (** 
    For each column to be added to the specified table:
    
     {ul
          {- [name] - The name of the column.
             
             }
           {- [type] - An Amazon Keyspaces data type. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types}Data types} in the {i Amazon Keyspaces Developer Guide}.
              
              }
          
      }
       *)

  table_name: string;
  (** 
    The name of the table.
     *)

  keyspace_name: string;
  (** 
    The name of the keyspace the specified table is stored in.
     *)

}

(** 
    The operation exceeded the service quota for this resource. For more information on service quotas, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/quotas.html}Quotas} in the {i Amazon Keyspaces Developer Guide}.
     *)
type service_quota_exceeded_exception = {
  message: string option;
  (** 
    Description of the error.
     *)

}

(** 
    The operation tried to access a keyspace or table that doesn't exist. The resource might not be specified correctly, or its status might not be [ACTIVE].
     *)
type resource_not_found_exception = {
  resource_arn: string option;
  (** 
    The unique identifier in the format of Amazon Resource Name (ARN), for the resource not found.
     *)

  message: string option;
  (** 
    Description of the error.
     *)

}

(** 
    Amazon Keyspaces was unable to fully process this request because of an internal server error.
     *)
type internal_server_exception = {
  message: string option;
  (** 
    Description of the error.
     *)

}

(** 
    Amazon Keyspaces couldn't complete the requested action. This error may occur if you try to perform an action and the same or a different action is already in progress, or if you try to create a resource that already exists.
     *)
type conflict_exception = {
  message: string option;
  (** 
    Description of the error.
     *)

}

(** 
    You don't have sufficient access permissions to perform this action.
     *)
type access_denied_exception = {
  message: string option;
  (** 
    Description of the error.
     *)

}

type untag_resource_response = unit

(** 
    Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a single Amazon Keyspaces resource.
    
     Amazon Web Services-assigned tag names and values are automatically assigned the [aws:] prefix, which the user cannot assign. Amazon Web Services-assigned tag names do not count towards the tag limit of 50. User-assigned tag names have the prefix [user:] in the Cost Allocation Report. You cannot backdate the application of a tag.
     
      For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.
       *)
type tag = {
  value: string;
  (** 
    The value of the tag. Tag values are case-sensitive and can be null.
     *)

  key: string;
  (** 
    The key of the tag. Tag keys are case sensitive. Each Amazon Keyspaces resource can only have up to one tag with the same key. If you try to add an existing tag (same key), the existing tag value will be updated to the new value.
     *)

}

type untag_resource_request = {
  tags: tag list;
  (** 
    A list of existing tags to be removed from the Amazon Keyspaces resource.
     *)

  resource_arn: string;
  (** 
    The Amazon Keyspaces resource that the tags will be removed from. This value is an Amazon Resource Name (ARN).
     *)

}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
  (** 
    The tags to be assigned to the Amazon Keyspaces resource.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the Amazon Keyspaces resource to which to add tags.
     *)

}

(** 
    Returns the name of the specified table, the keyspace it is stored in, and the unique identifier in the format of an Amazon Resource Name (ARN).
     *)
type table_summary = {
  resource_arn: string;
  (** 
    The unique identifier of the table in the format of an Amazon Resource Name (ARN).
     *)

  table_name: string;
  (** 
    The name of the table.
     *)

  keyspace_name: string;
  (** 
    The name of the keyspace that the table is stored in.
     *)

}

type table_status = | ACTIVE
  | CREATING
  | UPDATING
  | DELETING
  | DELETED
  | RESTORING
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS

(** 
    The static columns of the table. Static columns store values that are shared by all rows in the same partition.
     *)
type static_column = {
  name: string;
  (** 
    The name of the static column.
     *)

}

type sort_order = | ASC
  | DESC

(** 
    The partition key portion of the primary key is required and determines how Amazon Keyspaces stores the data. The partition key can be a single column, or it can be a compound value composed of two or more columns.
     *)
type partition_key = {
  name: string;
  (** 
    The name(s) of the partition key column(s).
     *)

}

(** 
    The optional clustering column portion of your primary key determines how the data is clustered and sorted within each partition.
     *)
type clustering_key = {
  order_by: sort_order;
  (** 
    Sets the ascendant ([ASC]) or descendant ([DESC]) order modifier.
     *)

  name: string;
  (** 
    The name(s) of the clustering column(s).
     *)

}

(** 
    Describes the schema of the table.
     *)
type schema_definition = {
  static_columns: static_column list option;
  (** 
    The columns that have been defined as [STATIC]. Static columns store values that are shared by all rows in the same partition.
     *)

  clustering_keys: clustering_key list option;
  (** 
    The columns that are part of the clustering key of the table.
     *)

  partition_keys: partition_key list;
  (** 
    The columns that are part of the partition key of the table .
     *)

  all_columns: column_definition list;
  (** 
    The regular columns of the table.
     *)

}

type restore_table_response = {
  restored_table_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the restored table.
     *)

}

type restore_table_request = {
  replica_specifications: replica_specification list option;
  (** 
    The optional Region specific settings of a multi-Regional table.
     *)

  auto_scaling_specification: auto_scaling_specification option;
  (** 
    The optional auto scaling settings for the restored table in provisioned capacity mode. Specifies if the service can manage throughput capacity of a provisioned table automatically on your behalf. Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads efficiently by increasing and decreasing your table's read and write capacity automatically in response to application traffic.
    
     For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.
      *)

  tags_override: tag list option;
  (** 
    A list of key-value pair tags to be attached to the restored table.
    
     For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.
      *)

  point_in_time_recovery_override: point_in_time_recovery option;
  (** 
    Specifies the [pointInTimeRecovery] settings for the target table. The options are:
    
     {ul
          {- [status=ENABLED]
             
             }
           {- [status=DISABLED]
              
              }
          
      }
       If it's not specified, the default is [status=DISABLED].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html}Point-in-time recovery} in the {i Amazon Keyspaces Developer Guide}.
         *)

  encryption_specification_override: encryption_specification option;
  (** 
    Specifies the encryption settings for the target table. You can choose one of the following KMS key (KMS key):
    
     {ul
          {- [type:AWS_OWNED_KMS_KEY] - This key is owned by Amazon Keyspaces.
             
             }
           {- [type:CUSTOMER_MANAGED_KMS_KEY] - This key is stored in your account and is created, owned, and managed by you. This option requires the [kms_key_identifier] of the KMS key in Amazon Resource Name (ARN) format as input.
              
              }
          
      }
       The default is [type:AWS_OWNED_KMS_KEY].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.
         *)

  capacity_specification_override: capacity_specification option;
  (** 
    Specifies the read/write throughput capacity mode for the target table. The options are:
    
     {ul
          {- [throughputMode:PAY_PER_REQUEST]
             
             }
           {- [throughputMode:PROVISIONED] - Provisioned capacity mode requires [readCapacityUnits] and [writeCapacityUnits] as input.
              
              }
          
      }
       The default is [throughput_mode:PAY_PER_REQUEST].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.
         *)

  restore_timestamp: float option;
  (** 
    The restore timestamp in ISO 8601 format.
     *)

  target_table_name: string;
  (** 
    The name of the target table.
     *)

  target_keyspace_name: string;
  (** 
    The name of the target keyspace.
     *)

  source_table_name: string;
  (** 
    The name of the source table.
     *)

  source_keyspace_name: string;
  (** 
    The keyspace name of the source table.
     *)

}

(** 
    The replication specification of the keyspace includes:
    
     {ul
          {- [regionList] - up to six Amazon Web Services Regions where the keyspace is replicated in.
             
             }
           {- [replicationStrategy] - the required value is [SINGLE_REGION] or [MULTI_REGION].
              
              }
          
      }
       *)
type replication_specification = {
  region_list: string list option;
  (** 
    The [regionList] can contain up to six Amazon Web Services Regions where the keyspace is replicated in.
     *)

  replication_strategy: rs;
  (** 
    The [replicationStrategy] of a keyspace, the required value is [SINGLE_REGION] or [MULTI_REGION].
     *)

}

(** 
    The read/write throughput capacity mode for a table. The options are:
    
     {ul
          {- [throughputMode:PAY_PER_REQUEST] and
             
             }
           {- [throughputMode:PROVISIONED].
              
              }
          
      }
       For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.
        *)
type capacity_specification_summary = {
  last_update_to_pay_per_request_timestamp: float option;
  (** 
    The timestamp of the last operation that changed the provisioned throughput capacity of a table.
     *)

  write_capacity_units: int option;
  (** 
    The throughput capacity specified for [write] operations defined in [write capacity units] [(WCUs)].
     *)

  read_capacity_units: int option;
  (** 
    The throughput capacity specified for [read] operations defined in [read capacity units] [(RCUs)].
     *)

  throughput_mode: throughput_mode;
  (** 
    The read/write throughput capacity mode for a table. The options are:
    
     {ul
          {- [throughputMode:PAY_PER_REQUEST] and
             
             }
           {- [throughputMode:PROVISIONED] - Provisioned capacity mode requires [readCapacityUnits] and [writeCapacityUnits] as input.
              
              }
          
      }
       The default is [throughput_mode:PAY_PER_REQUEST].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.
         *)

}

(** 
    The Region-specific settings of a multi-Region table in the specified Amazon Web Services Region.
    
     If the multi-Region table is using provisioned capacity and has optional auto scaling policies configured, note that the Region specific summary returns both read and write capacity settings. But only Region specific read capacity settings can be configured for a multi-Region table. In a multi-Region table, your write capacity units will be synced across all Amazon Web Services Regions to ensure that there is enough capacity to replicate write events across Regions.
      *)
type replica_specification_summary = {
  capacity_specification: capacity_specification_summary option;
  
  status: table_status option;
  (** 
    The status of the multi-Region table in the specified Amazon Web Services Region.
     *)

  region: string option;
  (** 
    The Amazon Web Services Region.
     *)

}

(** 
    The auto scaling settings of a multi-Region table in the specified Amazon Web Services Region.
     *)
type replica_auto_scaling_specification = {
  auto_scaling_specification: auto_scaling_specification option;
  (** 
    The auto scaling settings for a multi-Region table in the specified Amazon Web Services Region.
     *)

  region: string option;
  (** 
    The Amazon Web Services Region.
     *)

}

(** 
    The point-in-time recovery status of the specified table.
     *)
type point_in_time_recovery_summary = {
  earliest_restorable_timestamp: float option;
  (** 
    Specifies the earliest possible restore point of the table in ISO 8601 format.
     *)

  status: point_in_time_recovery_status;
  (** 
    Shows if point-in-time recovery is enabled or disabled for the specified table.
     *)

}

type list_tags_for_resource_response = {
  tags: tag list option;
  (** 
    A list of tags.
     *)

  next_token: string option;
  (** 
    A token to specify where to start paginating. This is the [NextToken] from a previously truncated response.
     *)

}

type list_tags_for_resource_request = {
  max_results: int option;
  (** 
    The total number of tags to return in the output. If the total number of tags available is more than the value specified, a [NextToken] is provided in the output. To resume pagination, provide the [NextToken] value as an argument of a subsequent API invocation.
     *)

  next_token: string option;
  (** 
    The pagination token. To resume pagination, provide the [NextToken] value as argument of a subsequent API invocation.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the Amazon Keyspaces resource.
     *)

}

type list_tables_response = {
  tables: table_summary list option;
  (** 
    A list of tables.
     *)

  next_token: string option;
  (** 
    A token to specify where to start paginating. This is the [NextToken] from a previously truncated response.
     *)

}

type list_tables_request = {
  keyspace_name: string;
  (** 
    The name of the keyspace.
     *)

  max_results: int option;
  (** 
    The total number of tables to return in the output. If the total number of tables available is more than the value specified, a [NextToken] is provided in the output. To resume pagination, provide the [NextToken] value as an argument of a subsequent API invocation.
     *)

  next_token: string option;
  (** 
    The pagination token. To resume pagination, provide the [NextToken] value as an argument of a subsequent API invocation.
     *)

}

(** 
    Represents the properties of a keyspace.
     *)
type keyspace_summary = {
  replication_regions: string list option;
  (** 
    If the [replicationStrategy] of the keyspace is [MULTI_REGION], a list of replication Regions is returned.
     *)

  replication_strategy: rs;
  (** 
    This property specifies if a keyspace is a single Region keyspace or a multi-Region keyspace. The available values are [SINGLE_REGION] or [MULTI_REGION].
     *)

  resource_arn: string;
  (** 
    The unique identifier of the keyspace in the format of an Amazon Resource Name (ARN).
     *)

  keyspace_name: string;
  (** 
    The name of the keyspace.
     *)

}

type list_keyspaces_response = {
  keyspaces: keyspace_summary list;
  (** 
    A list of keyspaces.
     *)

  next_token: string option;
  (** 
    A token to specify where to start paginating. This is the [NextToken] from a previously truncated response.
     *)

}

type list_keyspaces_request = {
  max_results: int option;
  (** 
    The total number of keyspaces to return in the output. If the total number of keyspaces available is more than the value specified, a [NextToken] is provided in the output. To resume pagination, provide the [NextToken] value as an argument of a subsequent API invocation.
     *)

  next_token: string option;
  (** 
    The pagination token. To resume pagination, provide the [NextToken] value as argument of a subsequent API invocation.
     *)

}

type get_table_auto_scaling_settings_response = {
  replica_specifications: replica_auto_scaling_specification list option;
  (** 
    The Amazon Web Services Region specific settings of a multi-Region table. Returns the settings for all Regions the table is replicated in.
     *)

  auto_scaling_specification: auto_scaling_specification option;
  (** 
    The auto scaling settings of the table.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the table.
     *)

  table_name: string;
  (** 
    The name of the table.
     *)

  keyspace_name: string;
  (** 
    The name of the keyspace.
     *)

}

type get_table_auto_scaling_settings_request = {
  table_name: string;
  (** 
    The name of the table.
     *)

  keyspace_name: string;
  (** 
    The name of the keyspace.
     *)

}

(** 
    An optional comment that describes the table.
     *)
type comment = {
  message: string;
  (** 
    An optional description of the table.
     *)

}

type get_table_response = {
  replica_specifications: replica_specification_summary list option;
  (** 
    Returns the Amazon Web Services Region specific settings of all Regions a multi-Region table is replicated in.
     *)

  client_side_timestamps: client_side_timestamps option;
  (** 
    The client-side timestamps setting of the table.
     *)

  comment: comment option;
  (** 
    The the description of the specified table.
     *)

  default_time_to_live: int option;
  (** 
    The default Time to Live settings in seconds of the specified table.
     *)

  ttl: time_to_live option;
  (** 
    The custom Time to Live settings of the specified table.
     *)

  point_in_time_recovery: point_in_time_recovery_summary option;
  (** 
    The point-in-time recovery status of the specified table.
     *)

  encryption_specification: encryption_specification option;
  (** 
    The encryption settings of the specified table.
     *)

  capacity_specification: capacity_specification_summary option;
  (** 
    The read/write throughput capacity mode for a table. The options are:
    
     {ul
          {- [throughputMode:PAY_PER_REQUEST]
             
             }
           {- [throughputMode:PROVISIONED]
              
              }
          
      }
       *)

  schema_definition: schema_definition option;
  (** 
    The schema definition of the specified table.
     *)

  status: table_status option;
  (** 
    The current status of the specified table.
     *)

  creation_timestamp: float option;
  (** 
    The creation timestamp of the specified table.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the specified table.
     *)

  table_name: string;
  (** 
    The name of the specified table.
     *)

  keyspace_name: string;
  (** 
    The name of the keyspace that the specified table is stored in.
     *)

}

type get_table_request = {
  table_name: string;
  (** 
    The name of the table.
     *)

  keyspace_name: string;
  (** 
    The name of the keyspace that the table is stored in.
     *)

}

type get_keyspace_response = {
  replication_regions: string list option;
  (** 
    If the [replicationStrategy] of the keyspace is [MULTI_REGION], a list of replication Regions is returned.
     *)

  replication_strategy: rs;
  (** 
    Returns the replication strategy of the keyspace. The options are [SINGLE_REGION] or [MULTI_REGION].
     *)

  resource_arn: string;
  (** 
    Returns the ARN of the keyspace.
     *)

  keyspace_name: string;
  (** 
    The name of the keyspace.
     *)

}

type get_keyspace_request = {
  keyspace_name: string;
  (** 
    The name of the keyspace.
     *)

}

type delete_table_response = unit

type delete_table_request = {
  table_name: string;
  (** 
    The name of the table to be deleted.
     *)

  keyspace_name: string;
  (** 
    The name of the keyspace of the to be deleted table.
     *)

}

type delete_keyspace_response = unit

type delete_keyspace_request = {
  keyspace_name: string;
  (** 
    The name of the keyspace to be deleted.
     *)

}

type create_table_response = {
  resource_arn: string;
  (** 
    The unique identifier of the table in the format of an Amazon Resource Name (ARN).
     *)

}

type create_table_request = {
  replica_specifications: replica_specification list option;
  (** 
    The optional Amazon Web Services Region specific settings of a multi-Region table. These settings overwrite the general settings of the table for the specified Region.
    
     For a multi-Region table in provisioned capacity mode, you can configure the table's read capacity differently for each Region's replica. The write capacity, however, remains synchronized between all replicas to ensure that there's enough capacity to replicate writes across all Regions. To define the read capacity for a table replica in a specific Region, you can do so by configuring the following parameters.
     
      {ul
           {- [region]: The Region where these settings are applied. (Required)
              
              }
            {- [readCapacityUnits]: The provisioned read capacity units. (Optional)
               
               }
            {- [readCapacityAutoScaling]: The read capacity auto scaling settings for the table. (Optional)
               
               }
           
      }
       *)

  auto_scaling_specification: auto_scaling_specification option;
  (** 
    The optional auto scaling settings for a table in provisioned capacity mode. Specifies if the service can manage throughput capacity automatically on your behalf.
    
     Auto scaling helps you provision throughput capacity for variable workloads efficiently by increasing and decreasing your table's read and write capacity automatically in response to application traffic. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.
     
      By default, auto scaling is disabled for a table.
       *)

  client_side_timestamps: client_side_timestamps option;
  [@ocaml.doc {| 
    Enables client-side timestamps for the table. By default, the setting is disabled. You can enable client-side timestamps with the following option:
    
     {ul
          {- [status: "enabled"]
             
             }
          
      }
       Once client-side timestamps are enabled for a table, this setting cannot be disabled.
        |}]

  tags: tag list option;
  (** 
    A list of key-value pair tags to be attached to the resource.
    
     For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.
      *)

  default_time_to_live: int option;
  (** 
    The default Time to Live setting in seconds for the table.
    
     For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_default_ttl}Setting the default TTL value for a table} in the {i Amazon Keyspaces Developer Guide}.
      *)

  ttl: time_to_live option;
  (** 
    Enables Time to Live custom settings for the table. The options are:
    
     {ul
          {- [status:enabled]
             
             }
           {- [status:disabled]
              
              }
          
      }
       The default is [status:disabled]. After [ttl] is enabled, you can't disable it for the table.
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL.html}Expiring data by using Amazon Keyspaces Time to Live (TTL)} in the {i Amazon Keyspaces Developer Guide}.
         *)

  point_in_time_recovery: point_in_time_recovery option;
  (** 
    Specifies if [pointInTimeRecovery] is enabled or disabled for the table. The options are:
    
     {ul
          {- [status=ENABLED]
             
             }
           {- [status=DISABLED]
              
              }
          
      }
       If it's not specified, the default is [status=DISABLED].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html}Point-in-time recovery} in the {i Amazon Keyspaces Developer Guide}.
         *)

  encryption_specification: encryption_specification option;
  (** 
    Specifies how the encryption key for encryption at rest is managed for the table. You can choose one of the following KMS key (KMS key):
    
     {ul
          {- [type:AWS_OWNED_KMS_KEY] - This key is owned by Amazon Keyspaces.
             
             }
           {- [type:CUSTOMER_MANAGED_KMS_KEY] - This key is stored in your account and is created, owned, and managed by you. This option requires the [kms_key_identifier] of the KMS key in Amazon Resource Name (ARN) format as input.
              
              }
          
      }
       The default is [type:AWS_OWNED_KMS_KEY].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.
         *)

  capacity_specification: capacity_specification option;
  (** 
    Specifies the read/write throughput capacity mode for the table. The options are:
    
     {ul
          {- [throughputMode:PAY_PER_REQUEST] and
             
             }
           {- [throughputMode:PROVISIONED] - Provisioned capacity mode requires [readCapacityUnits] and [writeCapacityUnits] as input.
              
              }
          
      }
       The default is [throughput_mode:PAY_PER_REQUEST].
       
        For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.
         *)

  comment: comment option;
  (** 
    This parameter allows to enter a description of the table.
     *)

  schema_definition: schema_definition;
  (** 
    The [schemaDefinition] consists of the following parameters.
    
     For each column to be created:
     
      {ul
           {- [name] - The name of the column.
              
              }
            {- [type] - An Amazon Keyspaces data type. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types}Data types} in the {i Amazon Keyspaces Developer Guide}.
               
               }
           
      }
       The primary key of the table consists of the following columns:
       
        {ul
             {- [partitionKeys] - The partition key can be a single column, or it can be a compound value composed of two or more columns. The partition key portion of the primary key is required and determines how Amazon Keyspaces stores your data.
                
                }
              {- [name] - The name of each partition key column.
                 
                 }
              {- [clusteringKeys] - The optional clustering column portion of your primary key determines how the data is clustered and sorted within each partition.
                 
                 }
              {- [name] - The name of the clustering column.
                 
                 }
              {- [orderBy] - Sets the ascendant ([ASC]) or descendant ([DESC]) order modifier.
                 
                  To define a column as static use [staticColumns] - Static columns store values that are shared by all rows in the same partition:
                  
                  }
              {- [name] - The name of the column.
                 
                 }
              {- [type] - An Amazon Keyspaces data type.
                 
                 }
             
      }
       *)

  table_name: string;
  (** 
    The name of the table.
     *)

  keyspace_name: string;
  (** 
    The name of the keyspace that the table is going to be created in.
     *)

}

type create_keyspace_response = {
  resource_arn: string;
  (** 
    The unique identifier of the keyspace in the format of an Amazon Resource Name (ARN).
     *)

}

type create_keyspace_request = {
  replication_specification: replication_specification option;
  (** 
    The replication specification of the keyspace includes:
    
     {ul
          {- [replicationStrategy] - the required value is [SINGLE_REGION] or [MULTI_REGION].
             
             }
           {- [regionList] - if the [replicationStrategy] is [MULTI_REGION], the [regionList] requires the current Region and at least one additional Amazon Web Services Region where the keyspace is going to be replicated in. The maximum number of supported replication Regions including the current Region is six.
              
              }
          
      }
       *)

  tags: tag list option;
  (** 
    A list of key-value pair tags to be attached to the keyspace.
    
     For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.
      *)

  keyspace_name: string;
  (** 
    The name of the keyspace to be created.
     *)

}

(** 
    Amazon Keyspaces (for Apache Cassandra) is a scalable, highly available, and managed Apache Cassandra-compatible database service. Amazon Keyspaces makes it easy to migrate, run, and scale Cassandra workloads in the Amazon Web Services Cloud. With just a few clicks on the Amazon Web Services Management Console or a few lines of code, you can create keyspaces and tables in Amazon Keyspaces, without deploying any infrastructure or installing software.
    
     In addition to supporting Cassandra Query Language (CQL) requests via open-source Cassandra drivers, Amazon Keyspaces supports data definition language (DDL) operations to manage keyspaces and tables using the Amazon Web Services SDK and CLI, as well as infrastructure as code (IaC) services and tools such as CloudFormation and Terraform. This API reference describes the supported DDL operations in detail.
     
      For the list of all supported CQL APIs, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/cassandra-apis.html}Supported Cassandra APIs, operations, and data types in Amazon Keyspaces} in the {i Amazon Keyspaces Developer Guide}.
      
       To learn how Amazon Keyspaces API actions are recorded with CloudTrail, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/logging-using-cloudtrail.html#service-name-info-in-cloudtrail}Amazon Keyspaces information in CloudTrail} in the {i Amazon Keyspaces Developer Guide}.
       
        For more information about Amazon Web Services APIs, for example how to implement retry logic or how to sign Amazon Web Services API requests, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-apis.html}Amazon Web Services APIs} in the {i General Reference}.
         *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_update_table_response : resource_arn:string -> unit
-> update_table_response

val make_column_definition : type_:string -> name:string -> unit
-> column_definition

val make_capacity_specification :
  ?write_capacity_units:int ->
  ?read_capacity_units:int ->
  throughput_mode:throughput_mode ->
  unit -> capacity_specification

val make_encryption_specification :
  ?kms_key_identifier:string -> type_:encryption_type -> unit
-> encryption_specification

val make_point_in_time_recovery :
  status:point_in_time_recovery_status -> unit
-> point_in_time_recovery

val make_time_to_live : status:time_to_live_status -> unit
-> time_to_live

val make_client_side_timestamps :
  status:client_side_timestamps_status -> unit
-> client_side_timestamps

val make_target_tracking_scaling_policy_configuration :
  ?scale_out_cooldown:int ->
  ?scale_in_cooldown:int ->
  ?disable_scale_in:bool ->
  target_value:float ->
  unit
-> target_tracking_scaling_policy_configuration

val make_auto_scaling_policy :
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  unit -> auto_scaling_policy

val make_auto_scaling_settings :
  ?scaling_policy:auto_scaling_policy ->
  ?maximum_units:int ->
  ?minimum_units:int ->
  ?auto_scaling_disabled:bool ->
  unit -> auto_scaling_settings

val make_auto_scaling_specification :
  ?read_capacity_auto_scaling:auto_scaling_settings ->
  ?write_capacity_auto_scaling:auto_scaling_settings ->
  unit -> auto_scaling_specification

val make_replica_specification :
  ?read_capacity_auto_scaling:auto_scaling_settings ->
  ?read_capacity_units:int ->
  region:string ->
  unit -> replica_specification

val make_update_table_request :
  ?replica_specifications:replica_specification list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?client_side_timestamps:client_side_timestamps ->
  ?default_time_to_live:int ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification ->
  ?add_columns:column_definition list ->
  table_name:string ->
  keyspace_name:string ->
  unit -> update_table_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_tag : value:string -> key:string -> unit
-> tag

val make_untag_resource_request :
  tags:tag list -> resource_arn:string -> unit
-> untag_resource_request

val make_tag_resource_response : unit
-> tag_resource_response

val make_tag_resource_request : tags:tag list -> resource_arn:string -> unit
-> tag_resource_request

val make_table_summary :
  resource_arn:string -> table_name:string -> keyspace_name:string -> unit
-> table_summary

val make_static_column : name:string -> unit
-> static_column

val make_partition_key : name:string -> unit
-> partition_key

val make_clustering_key : order_by:sort_order -> name:string -> unit
-> clustering_key

val make_schema_definition :
  ?static_columns:static_column list ->
  ?clustering_keys:clustering_key list ->
  partition_keys:partition_key list ->
  all_columns:column_definition list ->
  unit -> schema_definition

val make_restore_table_response : restored_table_ar_n:string -> unit
-> restore_table_response

val make_restore_table_request :
  ?replica_specifications:replica_specification list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?tags_override:tag list ->
  ?point_in_time_recovery_override:point_in_time_recovery ->
  ?encryption_specification_override:encryption_specification ->
  ?capacity_specification_override:capacity_specification ->
  ?restore_timestamp:float ->
  target_table_name:string ->
  target_keyspace_name:string ->
  source_table_name:string ->
  source_keyspace_name:string ->
  unit -> restore_table_request

val make_replication_specification :
  ?region_list:string list -> replication_strategy:rs -> unit
-> replication_specification

val make_capacity_specification_summary :
  ?last_update_to_pay_per_request_timestamp:float ->
  ?write_capacity_units:int ->
  ?read_capacity_units:int ->
  throughput_mode:throughput_mode ->
  unit
-> capacity_specification_summary

val make_replica_specification_summary :
  ?capacity_specification:capacity_specification_summary ->
  ?status:table_status ->
  ?region:string ->
  unit
-> replica_specification_summary

val make_replica_auto_scaling_specification :
  ?auto_scaling_specification:auto_scaling_specification ->
  ?region:string ->
  unit
-> replica_auto_scaling_specification

val make_point_in_time_recovery_summary :
  ?earliest_restorable_timestamp:float ->
  status:point_in_time_recovery_status ->
  unit
-> point_in_time_recovery_summary

val make_list_tags_for_resource_response :
  ?tags:tag list -> ?next_token:string -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:int -> ?next_token:string -> resource_arn:string -> unit
-> list_tags_for_resource_request

val make_list_tables_response :
  ?tables:table_summary list -> ?next_token:string -> unit
-> list_tables_response

val make_list_tables_request :
  ?max_results:int -> ?next_token:string -> keyspace_name:string -> unit
-> list_tables_request

val make_keyspace_summary :
  ?replication_regions:string list ->
  replication_strategy:rs ->
  resource_arn:string ->
  keyspace_name:string ->
  unit -> keyspace_summary

val make_list_keyspaces_response :
  ?next_token:string -> keyspaces:keyspace_summary list -> unit
-> list_keyspaces_response

val make_list_keyspaces_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_keyspaces_request

val make_get_table_auto_scaling_settings_response :
  ?replica_specifications:replica_auto_scaling_specification list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  resource_arn:string ->
  table_name:string ->
  keyspace_name:string ->
  unit
-> get_table_auto_scaling_settings_response

val make_get_table_auto_scaling_settings_request :
  table_name:string -> keyspace_name:string -> unit
-> get_table_auto_scaling_settings_request

val make_comment : message:string -> unit
-> comment

val make_get_table_response :
  ?replica_specifications:replica_specification_summary list ->
  ?client_side_timestamps:client_side_timestamps ->
  ?comment:comment ->
  ?default_time_to_live:int ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery_summary ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification_summary ->
  ?schema_definition:schema_definition ->
  ?status:table_status ->
  ?creation_timestamp:float ->
  resource_arn:string ->
  table_name:string ->
  keyspace_name:string ->
  unit -> get_table_response

val make_get_table_request :
  table_name:string -> keyspace_name:string -> unit
-> get_table_request

val make_get_keyspace_response :
  ?replication_regions:string list ->
  replication_strategy:rs ->
  resource_arn:string ->
  keyspace_name:string ->
  unit -> get_keyspace_response

val make_get_keyspace_request : keyspace_name:string -> unit
-> get_keyspace_request

val make_delete_table_response : unit
-> delete_table_response

val make_delete_table_request :
  table_name:string -> keyspace_name:string -> unit
-> delete_table_request

val make_delete_keyspace_response : unit
-> delete_keyspace_response

val make_delete_keyspace_request : keyspace_name:string -> unit
-> delete_keyspace_request

val make_create_table_response : resource_arn:string -> unit
-> create_table_response

val make_create_table_request :
  ?replica_specifications:replica_specification list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?client_side_timestamps:client_side_timestamps ->
  ?tags:tag list ->
  ?default_time_to_live:int ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification ->
  ?comment:comment ->
  schema_definition:schema_definition ->
  table_name:string ->
  keyspace_name:string ->
  unit -> create_table_request

val make_create_keyspace_response : resource_arn:string -> unit
-> create_keyspace_response

val make_create_keyspace_request :
  ?replication_specification:replication_specification ->
  ?tags:tag list ->
  keyspace_name:string ->
  unit
-> create_keyspace_request

(** {1:operations Operations} *)

module CreateKeyspace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_keyspace_request ->
        (create_keyspace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    The [CreateKeyspace] operation adds a new keyspace to your account. In an Amazon Web Services account, keyspace names must be unique within each Region.
    
     [CreateKeyspace] is an asynchronous operation. You can monitor the creation status of the new keyspace by using the [GetKeyspace] operation.
     
      For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/working-with-keyspaces.html#keyspaces-create}Creating keyspaces} in the {i Amazon Keyspaces Developer Guide}.
       *)

  
end

module CreateTable : sig
  val request :
    Smaws_Lib.Context.t ->
      create_table_request ->
        (create_table_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    The [CreateTable] operation adds a new table to the specified keyspace. Within a keyspace, table names must be unique.
    
     [CreateTable] is an asynchronous operation. When the request is received, the status of the table is set to [CREATING]. You can monitor the creation status of the new table by using the [GetTable] operation, which returns the current [status] of the table. You can start using a table when the status is [ACTIVE].
     
      For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/working-with-tables.html#tables-create}Creating tables} in the {i Amazon Keyspaces Developer Guide}.
       *)

  
end

module DeleteKeyspace : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_keyspace_request ->
        (delete_keyspace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    The [DeleteKeyspace] operation deletes a keyspace and all of its tables.
     *)

  
end

module DeleteTable : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_table_request ->
        (delete_table_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    The [DeleteTable] operation deletes a table and all of its data. After a [DeleteTable] request is received, the specified table is in the [DELETING] state until Amazon Keyspaces completes the deletion. If the table is in the [ACTIVE] state, you can delete it. If a table is either in the [CREATING] or [UPDATING] states, then Amazon Keyspaces returns a [ResourceInUseException]. If the specified table does not exist, Amazon Keyspaces returns a [ResourceNotFoundException]. If the table is already in the [DELETING] state, no error is returned.
     *)

  
end

module GetKeyspace : sig
  val request :
    Smaws_Lib.Context.t ->
      get_keyspace_request ->
        (get_keyspace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns the name and the Amazon Resource Name (ARN) of the specified table.
     *)

  
end

module GetTable : sig
  val request :
    Smaws_Lib.Context.t ->
      get_table_request ->
        (get_table_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns information about the table, including the table's name and current status, the keyspace name, configuration settings, and metadata.
    
     To read table metadata using [GetTable], [Select] action permissions for the table and system tables are required to complete the operation.
      *)

  
end

module GetTableAutoScalingSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      get_table_auto_scaling_settings_request ->
        (get_table_auto_scaling_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns auto scaling related settings of the specified table in JSON format. If the table is a multi-Region table, the Amazon Web Services Region specific auto scaling settings of the table are included.
    
     Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads efficiently by increasing and decreasing your table's read and write capacity automatically in response to application traffic. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.
     
      [GetTableAutoScalingSettings] can't be used as an action in an IAM policy.
      
       To define permissions for [GetTableAutoScalingSettings], you must allow the following two actions in the IAM policy statement's [Action] element:
       
        {ul
             {- [application-autoscaling:DescribeScalableTargets]
                
                }
              {- [application-autoscaling:DescribeScalingPolicies]
                 
                 }
             
      }
       *)

  
end

module ListKeyspaces : sig
  val request :
    Smaws_Lib.Context.t ->
      list_keyspaces_request ->
        (list_keyspaces_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns a list of keyspaces.
     *)

  
end

module ListTables : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tables_request ->
        (list_tables_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns a list of tables for a specified keyspace.
     *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns a list of all tags associated with the specified Amazon Keyspaces resource.
     *)

  
end

module RestoreTable : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_table_request ->
        (restore_table_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Restores the table to the specified point in time within the [earliest_restorable_timestamp] and the current time. For more information about restore points, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_window}Time window for PITR continuous backups} in the {i Amazon Keyspaces Developer Guide}.
    
     Any number of users can execute up to 4 concurrent restores (any type of restore) in a given account.
     
      When you restore using point in time recovery, Amazon Keyspaces restores your source table's schema and data to the state based on the selected timestamp [(day:hour:minute:second)] to a new table. The Time to Live (TTL) settings are also restored to the state based on the selected timestamp.
      
       In addition to the table's schema, data, and TTL settings, [RestoreTable] restores the capacity mode, auto scaling settings, encryption settings, and point-in-time recovery settings from the source table. Unlike the table's schema data and TTL settings, which are restored based on the selected timestamp, these settings are always restored based on the table's settings as of the current time or when the table was deleted.
       
        You can also overwrite these settings during restore:
        
         {ul
              {- Read/write capacity mode
                 
                 }
               {- Provisioned throughput capacity units
                  
                  }
               {- Auto scaling settings
                  
                  }
               {- Point-in-time (PITR) settings
                  
                  }
               {- Tags
                  
                  }
              
      }
       For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_settings}PITR restore settings} in the {i Amazon Keyspaces Developer Guide}.
       
        Note that the following settings are not restored, and you must configure them manually for the new table:
        
         {ul
              {- Identity and Access Management (IAM) policies
                 
                 }
               {- Amazon CloudWatch metrics and alarms
                  
                  }
              
      }
       *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Associates a set of tags with a Amazon Keyspaces resource. You can then activate these user-defined tags so that they appear on the Cost Management Console for cost allocation tracking. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.
    
     For IAM policy examples that show how to control access to Amazon Keyspaces resources based on tags, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-tags}Amazon Keyspaces resource access based on tags} in the {i Amazon Keyspaces Developer Guide}.
      *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Removes the association of tags from a Amazon Keyspaces resource.
     *)

  
end

module UpdateTable : sig
  val request :
    Smaws_Lib.Context.t ->
      update_table_request ->
        (update_table_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Adds new columns to the table or updates one of the table's settings, for example capacity mode, auto scaling, encryption, point-in-time recovery, or ttl settings. Note that you can only update one specific table setting per update operation.
     *)

  
end

