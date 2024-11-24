open Smaws_Lib
val service : Service.descriptor

type attribute_value = BOOL of bool | NULL of bool | L of attribute_value list | M of (string * attribute_value) list | BS of bytes list | NS of string list | SS of string list | B of bytes | N of string | S of string

(**{|
    Represents a request to perform a [PutItem] operation on an item.|}*)
type put_request = {
  item: (string * attribute_value) list;
   (**{|
    A map of attribute name to attribute values, representing the primary key
    of an item to be processed by [PutItem]. All of the table's primary key
    attributes must be specified, and their data types must match those of
    the table's key schema. If any attributes are present in the item that
    are part of an index key schema for the table, their types must match the
    index key schema.|}*)

}

(**{|
    Represents a request to perform a [DeleteItem] operation on an item.|}*)
type delete_request = {
  key: (string * attribute_value) list;
   (**{|
    A map of attribute name to attribute values, representing the primary key
    of the item to delete. All of the table's primary key attributes must be
    specified, and their data types must match those of the table's key
    schema.|}*)

}

(**{|
    Represents an operation to perform - either [DeleteItem] or [PutItem].
    You can only request one of these operations, not both, in a single
    [WriteRequest]. If you do need to perform both of these operations, you
    need to provide two separate [WriteRequest] objects.|}*)
type write_request = {
  delete_request: delete_request option;
   (**{|
    A request to perform a [DeleteItem] operation.|}*)

  put_request: put_request option;
   (**{|
    A request to perform a [PutItem] operation.|}*)

}

(**{|
    Represents the settings used to enable or disable Time to Live (TTL) for
    the specified table.|}*)
type time_to_live_specification = {
  attribute_name: string;
   (**{|
    The name of the TTL attribute used to store the expiration time for items
    in the table.|}*)

  enabled: bool;
   (**{|
    Indicates whether TTL is to be enabled (true) or disabled (false) on the
    table.|}*)

}

type update_time_to_live_output = {
  time_to_live_specification: time_to_live_specification option;
   (**{|
    Represents the output of an [UpdateTimeToLive] operation.|}*)

}

(**{|
    Represents the input of an [UpdateTimeToLive] operation.|}*)
type update_time_to_live_input = {
  time_to_live_specification: time_to_live_specification;
   (**{|
    Represents the settings used to enable or disable Time to Live for the
    specified table.|}*)

  table_name: string;
   (**{|
    The name of the table to be configured. You can also provide the Amazon
    Resource Name (ARN) of the table in this parameter.|}*)

}

(**{|
    The operation tried to access a nonexistent table or index. The resource
    might not be specified correctly, or its status might not be [ACTIVE].|}*)
type resource_not_found_exception = {
  message: string option;
   (**{|
    The resource which is being requested does not exist.|}*)

}

(**{|
    The operation conflicts with the resource's availability. For example,
    you attempted to recreate an existing table, or tried to delete a table
    currently in the [CREATING] state.|}*)
type resource_in_use_exception = {
  message: string option;
   (**{|
    The resource which is being attempted to be changed is in use.|}*)

}

(**{|
    There is no limit to the number of daily on-demand backups that can be
    taken.
    
    For most purposes, up to 500 simultaneous table operations are allowed
    per account. These operations include [CreateTable], [UpdateTable],
    [DeleteTable],[UpdateTimeToLive], [RestoreTableFromBackup], and
    [RestoreTableToPointInTime].
    
    When you are creating a table with one or more secondary indexes, you can
    have up to 250 such requests running at a time. However, if the table or
    index specifications are complex, then DynamoDB might temporarily reduce
    the number of concurrent operations.
    
    When importing into DynamoDB, up to 50 simultaneous import table
    operations are allowed per account.
    
    There is a soft account quota of 2,500 tables.
    
    GetRecords was called with a value of more than 1000 for the limit
    request parameter.
    
    More than 2 processes are reading from the same streams shard at the same
    time. Exceeding this limit may result in request throttling.|}*)
type limit_exceeded_exception = {
  message: string option;
   (**{|
    Too many operations for a given subscriber.|}*)

}

type invalid_endpoint_exception = {
  message: string option;
  
}

(**{|
    An error occurred on the server side.|}*)
type internal_server_error = {
  message: string option;
   (**{|
    The server encountered an internal error trying to fulfill the request.|}*)

}

type table_status = | ARCHIVED
  | ARCHIVING
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS
  | ACTIVE
  | DELETING
  | UPDATING
  | CREATING

type index_status = | ACTIVE
  | DELETING
  | UPDATING
  | CREATING

(**{|
    Represents the properties of a target tracking scaling policy.|}*)
type auto_scaling_target_tracking_scaling_policy_configuration_description = {
  target_value: float;
   (**{|
    The target value for the metric. The range is 8.515920e-109 to
    1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).|}*)

  scale_out_cooldown: int option;
   (**{|
    The amount of time, in seconds, after a scale out activity completes
    before another scale out activity can start. While the cooldown period is
    in effect, the capacity that has been added by the previous scale out
    event that initiated the cooldown is calculated as part of the desired
    capacity for the next scale out. You should continuously (but not
    excessively) scale out.|}*)

  scale_in_cooldown: int option;
   (**{|
    The amount of time, in seconds, after a scale in activity completes
    before another scale in activity can start. The cooldown period is used
    to block subsequent scale in requests until it has expired. You should
    scale in conservatively to protect your application's availability.
    However, if another alarm triggers a scale out policy during the cooldown
    period after a scale-in, application auto scaling scales out your
    scalable target immediately.|}*)

  disable_scale_in: bool option;
   (**{|
    Indicates whether scale in by the target tracking policy is disabled. If
    the value is true, scale in is disabled and the target tracking policy
    won't remove capacity from the scalable resource. Otherwise, scale in is
    enabled and the target tracking policy can remove capacity from the
    scalable resource. The default value is false.|}*)

}

(**{|
    Represents the properties of the scaling policy.|}*)
type auto_scaling_policy_description = {
  target_tracking_scaling_policy_configuration: auto_scaling_target_tracking_scaling_policy_configuration_description option;
   (**{|
    Represents a target tracking scaling policy configuration.|}*)

  policy_name: string option;
   (**{|
    The name of the scaling policy.|}*)

}

(**{|
    Represents the auto scaling settings for a global table or global
    secondary index.|}*)
type auto_scaling_settings_description = {
  scaling_policies: auto_scaling_policy_description list option;
   (**{|
    Information about the scaling policies.|}*)

  auto_scaling_role_arn: string option;
   (**{|
    Role ARN used for configuring the auto scaling policy.|}*)

  auto_scaling_disabled: bool option;
   (**{|
    Disabled auto scaling for this global table or global secondary index.|}*)

  maximum_units: int option;
   (**{|
    The maximum capacity units that a global table or global secondary index
    should be scaled up to.|}*)

  minimum_units: int option;
   (**{|
    The minimum capacity units that a global table or global secondary index
    should be scaled down to.|}*)

}

(**{|
    Represents the auto scaling configuration for a replica global secondary
    index.|}*)
type replica_global_secondary_index_auto_scaling_description = {
  provisioned_write_capacity_auto_scaling_settings: auto_scaling_settings_description option;
  
  provisioned_read_capacity_auto_scaling_settings: auto_scaling_settings_description option;
  
  index_status: index_status option;
   (**{|
    The current state of the replica global secondary index:
    
    {ol 
          {- [CREATING] - The index is being created.
             }
          
          {- [UPDATING] - The table/index configuration is being updated. The
             table/index remains available for data operations when
             [UPDATING]
             }
          
          {- [DELETING] - The index is being deleted.
             }
          
          {- [ACTIVE] - The index is ready for use.
             }
          
    }
    |}*)

  index_name: string option;
   (**{|
    The name of the global secondary index.|}*)

}

type replica_status = | INACCESSIBLE_ENCRYPTION_CREDENTIALS
  | REGION_DISABLED
  | ACTIVE
  | DELETING
  | UPDATING
  | CREATION_FAILED
  | CREATING

(**{|
    Represents the auto scaling settings of the replica.|}*)
type replica_auto_scaling_description = {
  replica_status: replica_status option;
   (**{|
    The current state of the replica:
    
    {ol 
          {- [CREATING] - The replica is being created.
             }
          
          {- [UPDATING] - The replica is being updated.
             }
          
          {- [DELETING] - The replica is being deleted.
             }
          
          {- [ACTIVE] - The replica is ready for use.
             }
          
    }
    |}*)

  replica_provisioned_write_capacity_auto_scaling_settings: auto_scaling_settings_description option;
  
  replica_provisioned_read_capacity_auto_scaling_settings: auto_scaling_settings_description option;
  
  global_secondary_indexes: replica_global_secondary_index_auto_scaling_description list option;
   (**{|
    Replica-specific global secondary index auto scaling settings.|}*)

  region_name: string option;
   (**{|
    The Region where the replica exists.|}*)

}

(**{|
    Represents the auto scaling configuration for a global table.|}*)
type table_auto_scaling_description = {
  replicas: replica_auto_scaling_description list option;
   (**{|
    Represents replicas of the global table.|}*)

  table_status: table_status option;
   (**{|
    The current state of the table:
    
    {ol 
          {- [CREATING] - The table is being created.
             }
          
          {- [UPDATING] - The table is being updated.
             }
          
          {- [DELETING] - The table is being deleted.
             }
          
          {- [ACTIVE] - The table is ready for use.
             }
          
    }
    |}*)

  table_name: string option;
   (**{|
    The name of the table.|}*)

}

type update_table_replica_auto_scaling_output = {
  table_auto_scaling_description: table_auto_scaling_description option;
   (**{|
    Returns information about the auto scaling settings of a table with
    replicas.|}*)

}

(**{|
    Represents the settings of a target tracking scaling policy that will be
    modified.|}*)
type auto_scaling_target_tracking_scaling_policy_configuration_update = {
  target_value: float;
   (**{|
    The target value for the metric. The range is 8.515920e-109 to
    1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).|}*)

  scale_out_cooldown: int option;
   (**{|
    The amount of time, in seconds, after a scale out activity completes
    before another scale out activity can start. While the cooldown period is
    in effect, the capacity that has been added by the previous scale out
    event that initiated the cooldown is calculated as part of the desired
    capacity for the next scale out. You should continuously (but not
    excessively) scale out.|}*)

  scale_in_cooldown: int option;
   (**{|
    The amount of time, in seconds, after a scale in activity completes
    before another scale in activity can start. The cooldown period is used
    to block subsequent scale in requests until it has expired. You should
    scale in conservatively to protect your application's availability.
    However, if another alarm triggers a scale out policy during the cooldown
    period after a scale-in, application auto scaling scales out your
    scalable target immediately.|}*)

  disable_scale_in: bool option;
   (**{|
    Indicates whether scale in by the target tracking policy is disabled. If
    the value is true, scale in is disabled and the target tracking policy
    won't remove capacity from the scalable resource. Otherwise, scale in is
    enabled and the target tracking policy can remove capacity from the
    scalable resource. The default value is false.|}*)

}

(**{|
    Represents the auto scaling policy to be modified.|}*)
type auto_scaling_policy_update = {
  target_tracking_scaling_policy_configuration: auto_scaling_target_tracking_scaling_policy_configuration_update;
   (**{|
    Represents a target tracking scaling policy configuration.|}*)

  policy_name: string option;
   (**{|
    The name of the scaling policy.|}*)

}

(**{|
    Represents the auto scaling settings to be modified for a global table or
    global secondary index.|}*)
type auto_scaling_settings_update = {
  scaling_policy_update: auto_scaling_policy_update option;
   (**{|
    The scaling policy to apply for scaling target global table or global
    secondary index capacity units.|}*)

  auto_scaling_role_arn: string option;
   (**{|
    Role ARN used for configuring auto scaling policy.|}*)

  auto_scaling_disabled: bool option;
   (**{|
    Disabled auto scaling for this global table or global secondary index.|}*)

  maximum_units: int option;
   (**{|
    The maximum capacity units that a global table or global secondary index
    should be scaled up to.|}*)

  minimum_units: int option;
   (**{|
    The minimum capacity units that a global table or global secondary index
    should be scaled down to.|}*)

}

(**{|
    Represents the auto scaling settings of a global secondary index for a
    global table that will be modified.|}*)
type global_secondary_index_auto_scaling_update = {
  provisioned_write_capacity_auto_scaling_update: auto_scaling_settings_update option;
  
  index_name: string option;
   (**{|
    The name of the global secondary index.|}*)

}

(**{|
    Represents the auto scaling settings of a global secondary index for a
    replica that will be modified.|}*)
type replica_global_secondary_index_auto_scaling_update = {
  provisioned_read_capacity_auto_scaling_update: auto_scaling_settings_update option;
  
  index_name: string option;
   (**{|
    The name of the global secondary index.|}*)

}

(**{|
    Represents the auto scaling settings of a replica that will be modified.|}*)
type replica_auto_scaling_update = {
  replica_provisioned_read_capacity_auto_scaling_update: auto_scaling_settings_update option;
  
  replica_global_secondary_index_updates: replica_global_secondary_index_auto_scaling_update list option;
   (**{|
    Represents the auto scaling settings of global secondary indexes that
    will be modified.|}*)

  region_name: string;
   (**{|
    The Region where the replica exists.|}*)

}

type update_table_replica_auto_scaling_input = {
  replica_updates: replica_auto_scaling_update list option;
   (**{|
    Represents the auto scaling settings of replicas of the table that will
    be modified.|}*)

  provisioned_write_capacity_auto_scaling_update: auto_scaling_settings_update option;
  
  table_name: string;
   (**{|
    The name of the global table to be updated. You can also provide the
    Amazon Resource Name (ARN) of the table in this parameter.|}*)

  global_secondary_index_updates: global_secondary_index_auto_scaling_update list option;
   (**{|
    Represents the auto scaling settings of the global secondary indexes of
    the replica to be updated.|}*)

}

type scalar_attribute_type = | B
  | N
  | S

(**{|
    Represents an attribute for describing the schema for the table and
    indexes.|}*)
type attribute_definition = {
  attribute_type: scalar_attribute_type;
   (**{|
    The data type for the attribute, where:
    
    {ol 
          {- [S] - the attribute is of type String
             }
          
          {- [N] - the attribute is of type Number
             }
          
          {- [B] - the attribute is of type Binary
             }
          
    }
    |}*)

  attribute_name: string;
   (**{|
    A name for the attribute.|}*)

}

type key_type = | RANGE
  | HASH

(**{|
    Represents {i a single element} of a key schema. A key schema specifies
    the attributes that make up the primary key of a table, or the key
    attributes of an index.
    
    A [KeySchemaElement] represents exactly one attribute of the primary key.
    For example, a simple primary key would be represented by one
    [KeySchemaElement] (for the partition key). A composite primary key would
    require one [KeySchemaElement] for the partition key, and another
    [KeySchemaElement] for the sort key.
    
    A [KeySchemaElement] must be a scalar, top-level attribute (not a nested
    attribute). The data type must be one of String, Number, or Binary. The
    attribute cannot be nested within a List or a Map.|}*)
type key_schema_element = {
  key_type: key_type;
   (**{|
    The role that this key attribute will assume:
    
    {ol 
          {- [HASH] - partition key
             }
          
          {- [RANGE] - sort key
             }
          
    }
    
    The partition key of an item is also known as its {i hash attribute}. The
    term "hash attribute" derives from DynamoDB's usage of an internal hash
    function to evenly distribute data items across partitions, based on
    their partition key values.
    
    The sort key of an item is also known as its {i range attribute}. The
    term "range attribute" derives from the way DynamoDB stores items with
    the same partition key physically close together, in sorted order by the
    sort key value.
    |}*)

  attribute_name: string;
   (**{|
    The name of a key attribute.|}*)

}

(**{|
    Represents the provisioned throughput settings for the table, consisting
    of read and write capacity units, along with data about increases and
    decreases.|}*)
type provisioned_throughput_description = {
  write_capacity_units: int option;
   (**{|
    The maximum number of writes consumed per second before DynamoDB returns
    a [ThrottlingException].|}*)

  read_capacity_units: int option;
   (**{|
    The maximum number of strongly consistent reads consumed per second
    before DynamoDB returns a [ThrottlingException]. Eventually consistent
    reads require less effort than strongly consistent reads, so a setting of
    50 [ReadCapacityUnits] per second provides 100 eventually consistent
    [ReadCapacityUnits] per second.|}*)

  number_of_decreases_today: int option;
   (**{|
    The number of provisioned throughput decreases for this table during this
    UTC calendar day. For current maximums on provisioned throughput
    decreases, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html }Service,
    Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.|}*)

  last_decrease_date_time: float option;
   (**{|
    The date and time of the last provisioned throughput decrease for this
    table.|}*)

  last_increase_date_time: float option;
   (**{|
    The date and time of the last provisioned throughput increase for this
    table.|}*)

}

type billing_mode = | PAY_PER_REQUEST
  | PROVISIONED

(**{|
    Contains the details for the read/write capacity mode. This page talks
    about [PROVISIONED] and [PAY_PER_REQUEST] billing modes. For more
    information about these modes, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html }Read/write
    capacity mode}.
    
    You may need to switch to on-demand mode at least once in order to return
    a [BillingModeSummary] response.
    |}*)
type billing_mode_summary = {
  last_update_to_pay_per_request_date_time: float option;
   (**{|
    Represents the time when [PAY_PER_REQUEST] was last set as the read/write
    capacity mode.|}*)

  billing_mode: billing_mode option;
   (**{|
    Controls how you are charged for read and write throughput and how you
    manage capacity. This setting can be changed later.
    
    {ol 
          {- [PROVISIONED] - Sets the read/write capacity mode to
             [PROVISIONED]. We recommend using [PROVISIONED] for predictable
             workloads.
             }
          
          {- [PAY_PER_REQUEST] - Sets the read/write capacity mode to
             [PAY_PER_REQUEST]. We recommend using [PAY_PER_REQUEST] for
             unpredictable workloads.
             }
          
    }
    |}*)

}

type projection_type = | INCLUDE
  | KEYS_ONLY
  | ALL

(**{|
    Represents attributes that are copied (projected) from the table into an
    index. These are in addition to the primary key attributes and index key
    attributes, which are automatically projected.|}*)
type projection = {
  non_key_attributes: string list option;
   (**{|
    Represents the non-key attribute names which will be projected into the
    index.
    
    For local secondary indexes, the total count of [NonKeyAttributes] summed
    across all of the local secondary indexes, must not exceed 100. If you
    project the same attribute into two different indexes, this counts as two
    distinct attributes when determining the total.|}*)

  projection_type: projection_type option;
   (**{|
    The set of attributes that are projected into the index:
    
    {ol 
          {- [KEYS_ONLY] - Only the index and primary keys are projected into
             the index.
             }
          
          {- [INCLUDE] - In addition to the attributes described in
             [KEYS_ONLY], the secondary index will include other non-key
             attributes that you specify.
             }
          
          {- [ALL] - All of the table attributes are projected into the
             index.
             }
          
    }
    
    When using the DynamoDB console, [ALL] is selected by default.|}*)

}

(**{|
    Represents the properties of a local secondary index.|}*)
type local_secondary_index_description = {
  index_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) that uniquely identifies the index.|}*)

  item_count: int option;
   (**{|
    The number of items in the specified index. DynamoDB updates this value
    approximately every six hours. Recent changes might not be reflected in
    this value.|}*)

  index_size_bytes: int option;
   (**{|
    The total size of the specified index, in bytes. DynamoDB updates this
    value approximately every six hours. Recent changes might not be
    reflected in this value.|}*)

  projection: projection option;
   (**{|
    Represents attributes that are copied (projected) from the table into the
    global secondary index. These are in addition to the primary key
    attributes and index key attributes, which are automatically projected.|}*)

  key_schema: key_schema_element list option;
   (**{|
    The complete key schema for the local secondary index, consisting of one
    or more pairs of attribute names and key types:
    
    {ol 
          {- [HASH] - partition key
             }
          
          {- [RANGE] - sort key
             }
          
    }
    
    The partition key of an item is also known as its {i hash attribute}. The
    term "hash attribute" derives from DynamoDB's usage of an internal hash
    function to evenly distribute data items across partitions, based on
    their partition key values.
    
    The sort key of an item is also known as its {i range attribute}. The
    term "range attribute" derives from the way DynamoDB stores items with
    the same partition key physically close together, in sorted order by the
    sort key value.
    |}*)

  index_name: string option;
   (**{|
    Represents the name of the local secondary index.|}*)

}

(**{|
    Sets the maximum number of read and write units for the specified
    on-demand table. If you use this parameter, you must specify
    [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.|}*)
type on_demand_throughput = {
  max_write_request_units: int option;
   (**{|
    Maximum number of write request units for the specified table.
    
    To specify a maximum [OnDemandThroughput] on your table, set the value of
    [MaxWriteRequestUnits] as greater than or equal to 1. To remove the
    maximum [OnDemandThroughput] that is currently set on your table, set the
    value of [MaxWriteRequestUnits] to -1.|}*)

  max_read_request_units: int option;
   (**{|
    Maximum number of read request units for the specified table.
    
    To specify a maximum [OnDemandThroughput] on your table, set the value of
    [MaxReadRequestUnits] as greater than or equal to 1. To remove the
    maximum [OnDemandThroughput] that is currently set on your table, set the
    value of [MaxReadRequestUnits] to -1.|}*)

}

(**{|
    Represents the properties of a global secondary index.|}*)
type global_secondary_index_description = {
  on_demand_throughput: on_demand_throughput option;
   (**{|
    The maximum number of read and write units for the specified global
    secondary index. If you use this parameter, you must specify
    [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.|}*)

  index_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) that uniquely identifies the index.|}*)

  item_count: int option;
   (**{|
    The number of items in the specified index. DynamoDB updates this value
    approximately every six hours. Recent changes might not be reflected in
    this value.|}*)

  index_size_bytes: int option;
   (**{|
    The total size of the specified index, in bytes. DynamoDB updates this
    value approximately every six hours. Recent changes might not be
    reflected in this value.|}*)

  provisioned_throughput: provisioned_throughput_description option;
   (**{|
    Represents the provisioned throughput settings for the specified global
    secondary index.
    
    For current minimum and maximum provisioned throughput values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html }Service,
    Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.|}*)

  backfilling: bool option;
   (**{|
    Indicates whether the index is currently backfilling. {i Backfilling} is
    the process of reading items from the table and determining whether they
    can be added to the index. (Not all items will qualify: For example, a
    partition key cannot have any duplicate values.) If an item can be added
    to the index, DynamoDB will do so. After all items have been processed,
    the backfilling operation is complete and [Backfilling] is false.
    
    You can delete an index that is being created during the [Backfilling]
    phase when [IndexStatus] is set to CREATING and [Backfilling] is true.
    You can't delete the index that is being created when [IndexStatus] is
    set to CREATING and [Backfilling] is false.
    
    For indexes that were created during a [CreateTable] operation, the
    [Backfilling] attribute does not appear in the [DescribeTable] output.
    |}*)

  index_status: index_status option;
   (**{|
    The current state of the global secondary index:
    
    {ol 
          {- [CREATING] - The index is being created.
             }
          
          {- [UPDATING] - The index is being updated.
             }
          
          {- [DELETING] - The index is being deleted.
             }
          
          {- [ACTIVE] - The index is ready for use.
             }
          
    }
    |}*)

  projection: projection option;
   (**{|
    Represents attributes that are copied (projected) from the table into the
    global secondary index. These are in addition to the primary key
    attributes and index key attributes, which are automatically projected.|}*)

  key_schema: key_schema_element list option;
   (**{|
    The complete key schema for a global secondary index, which consists of
    one or more pairs of attribute names and key types:
    
    {ol 
          {- [HASH] - partition key
             }
          
          {- [RANGE] - sort key
             }
          
    }
    
    The partition key of an item is also known as its {i hash attribute}. The
    term "hash attribute" derives from DynamoDB's usage of an internal hash
    function to evenly distribute data items across partitions, based on
    their partition key values.
    
    The sort key of an item is also known as its {i range attribute}. The
    term "range attribute" derives from the way DynamoDB stores items with
    the same partition key physically close together, in sorted order by the
    sort key value.
    |}*)

  index_name: string option;
   (**{|
    The name of the global secondary index.|}*)

}

type stream_view_type = | KEYS_ONLY
  | NEW_AND_OLD_IMAGES
  | OLD_IMAGE
  | NEW_IMAGE

(**{|
    Represents the DynamoDB Streams configuration for a table in DynamoDB.|}*)
type stream_specification = {
  stream_view_type: stream_view_type option;
   (**{|
    When an item in the table is modified, [StreamViewType] determines what
    information is written to the stream for this table. Valid values for
    [StreamViewType] are:
    
    {ol 
          {- [KEYS_ONLY] - Only the key attributes of the modified item are
             written to the stream.
             }
          
          {- [NEW_IMAGE] - The entire item, as it appears after it was
             modified, is written to the stream.
             }
          
          {- [OLD_IMAGE] - The entire item, as it appeared before it was
             modified, is written to the stream.
             }
          
          {- [NEW_AND_OLD_IMAGES] - Both the new and the old item images of
             the item are written to the stream.
             }
          
    }
    |}*)

  stream_enabled: bool;
   (**{|
    Indicates whether DynamoDB Streams is enabled (true) or disabled (false)
    on the table.|}*)

}

(**{|
    Replica-specific provisioned throughput settings. If not specified, uses
    the source table's provisioned throughput settings.|}*)
type provisioned_throughput_override = {
  read_capacity_units: int option;
   (**{|
    Replica-specific read capacity units. If not specified, uses the source
    table's read capacity settings.|}*)

}

(**{|
    Overrides the on-demand throughput settings for this replica table. If
    you don't specify a value for this parameter, it uses the source table's
    on-demand throughput settings.|}*)
type on_demand_throughput_override = {
  max_read_request_units: int option;
   (**{|
    Maximum number of read request units for the specified replica table.|}*)

}

(**{|
    Represents the properties of a replica global secondary index.|}*)
type replica_global_secondary_index_description = {
  on_demand_throughput_override: on_demand_throughput_override option;
   (**{|
    Overrides the maximum on-demand throughput for the specified global
    secondary index in the specified replica table.|}*)

  provisioned_throughput_override: provisioned_throughput_override option;
   (**{|
    If not described, uses the source table GSI's read capacity settings.|}*)

  index_name: string option;
   (**{|
    The name of the global secondary index.|}*)

}

type table_class = | STANDARD_INFREQUENT_ACCESS
  | STANDARD

(**{|
    Contains details of the table class.|}*)
type table_class_summary = {
  last_update_date_time: float option;
   (**{|
    The date and time at which the table class was last updated.|}*)

  table_class: table_class option;
   (**{|
    The table class of the specified table. Valid values are [STANDARD] and
    [STANDARD_INFREQUENT_ACCESS].|}*)

}

(**{|
    Contains the details of the replica.|}*)
type replica_description = {
  replica_table_class_summary: table_class_summary option;
  
  replica_inaccessible_date_time: float option;
   (**{|
    The time at which the replica was first detected as inaccessible. To
    determine cause of inaccessibility check the [ReplicaStatus] property.|}*)

  global_secondary_indexes: replica_global_secondary_index_description list option;
   (**{|
    Replica-specific global secondary index settings.|}*)

  on_demand_throughput_override: on_demand_throughput_override option;
   (**{|
    Overrides the maximum on-demand throughput settings for the specified
    replica table.|}*)

  provisioned_throughput_override: provisioned_throughput_override option;
   (**{|
    Replica-specific provisioned throughput. If not described, uses the
    source table's provisioned throughput settings.|}*)

  kms_master_key_id: string option;
   (**{|
    The KMS key of the replica that will be used for KMS encryption.|}*)

  replica_status_percent_progress: string option;
   (**{|
    Specifies the progress of a Create, Update, or Delete action on the
    replica as a percentage.|}*)

  replica_status_description: string option;
   (**{|
    Detailed information about the replica status.|}*)

  replica_status: replica_status option;
   (**{|
    The current state of the replica:
    
    {ol 
          {- [CREATING] - The replica is being created.
             }
          
          {- [UPDATING] - The replica is being updated.
             }
          
          {- [DELETING] - The replica is being deleted.
             }
          
          {- [ACTIVE] - The replica is ready for use.
             }
          
          {- [REGION_DISABLED] - The replica is inaccessible because the
             Amazon Web Services Region has been disabled.
             
          If the Amazon Web Services Region remains inaccessible for more
          than 20 hours, DynamoDB will remove this replica from the
          replication group. The replica will not be deleted and replication
          will stop from and to this region.
          }
          
          {- [INACCESSIBLE_ENCRYPTION_CREDENTIALS] - The KMS key used to
             encrypt the table is inaccessible.
             
          If the KMS key remains inaccessible for more than 20 hours,
          DynamoDB will remove this replica from the replication group. The
          replica will not be deleted and replication will stop from and to
          this region.
          }
          
    }
    |}*)

  region_name: string option;
   (**{|
    The name of the Region.|}*)

}

(**{|
    Contains details for the restore.|}*)
type restore_summary = {
  restore_in_progress: bool;
   (**{|
    Indicates if a restore is in progress or not.|}*)

  restore_date_time: float;
   (**{|
    Point in time or source backup time.|}*)

  source_table_arn: string option;
   (**{|
    The ARN of the source table of the backup that is being restored.|}*)

  source_backup_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the backup from which the table was
    restored.|}*)

}

type sse_status = | UPDATING
  | DISABLED
  | DISABLING
  | ENABLED
  | ENABLING

type sse_type = | KMS
  | AES256

(**{|
    The description of the server-side encryption status on the specified
    table.|}*)
type sse_description = {
  inaccessible_encryption_date_time: float option;
   (**{|
    Indicates the time, in UNIX epoch date format, when DynamoDB detected
    that the table's KMS key was inaccessible. This attribute will
    automatically be cleared when DynamoDB detects that the table's KMS key
    is accessible again. DynamoDB will initiate the table archival process
    when table's KMS key remains inaccessible for more than seven days from
    this date.|}*)

  kms_master_key_arn: string option;
   (**{|
    The KMS key ARN used for the KMS encryption.|}*)

  sse_type: sse_type option;
   (**{|
    Server-side encryption type. The only supported value is:
    
    {ol 
          {- [KMS] - Server-side encryption that uses Key Management Service.
             The key is stored in your account and is managed by KMS (KMS
             charges apply).
             }
          
    }
    |}*)

  status: sse_status option;
   (**{|
    Represents the current state of server-side encryption. The only
    supported values are:
    
    {ol 
          {- [ENABLED] - Server-side encryption is enabled.
             }
          
          {- [UPDATING] - Server-side encryption is being updated.
             }
          
    }
    |}*)

}

(**{|
    Contains details of a table archival operation.|}*)
type archival_summary = {
  archival_backup_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the backup the table was archived to,
    when applicable in the archival reason. If you wish to restore this
    backup to the same table name, you will need to delete the original
    table.|}*)

  archival_reason: string option;
   (**{|
    The reason DynamoDB archived the table. Currently, the only possible
    value is:
    
    {ol 
          {- [INACCESSIBLE_ENCRYPTION_CREDENTIALS] - The table was archived
             due to the table's KMS key being inaccessible for more than
             seven days. An On-Demand backup was created at the archival
             time.
             }
          
    }
    |}*)

  archival_date_time: float option;
   (**{|
    The date and time when table archival was initiated by DynamoDB, in UNIX
    epoch time format.|}*)

}

(**{|
    Represents the properties of a table.|}*)
type table_description = {
  on_demand_throughput: on_demand_throughput option;
   (**{|
    The maximum number of read and write units for the specified on-demand
    table. If you use this parameter, you must specify [MaxReadRequestUnits],
    [MaxWriteRequestUnits], or both.|}*)

  deletion_protection_enabled: bool option;
   (**{|
    Indicates whether deletion protection is enabled (true) or disabled
    (false) on the table.|}*)

  table_class_summary: table_class_summary option;
   (**{|
    Contains details of the table class.|}*)

  archival_summary: archival_summary option;
   (**{|
    Contains information about the table archive.|}*)

  sse_description: sse_description option;
   (**{|
    The description of the server-side encryption status on the specified
    table.|}*)

  restore_summary: restore_summary option;
   (**{|
    Contains details for the restore.|}*)

  replicas: replica_description list option;
   (**{|
    Represents replicas of the table.|}*)

  global_table_version: string option;
   (**{|
    Represents the version of
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html }global
    tables} in use, if the table is replicated across Amazon Web Services
    Regions.|}*)

  latest_stream_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) that uniquely identifies the latest stream
    for this table.|}*)

  latest_stream_label: string option;
   (**{|
    A timestamp, in ISO 8601 format, for this stream.
    
    Note that [LatestStreamLabel] is not a unique identifier for the stream,
    because it is possible that a stream from another table might have the
    same timestamp. However, the combination of the following three elements
    is guaranteed to be unique:
    
    {ol 
          {- Amazon Web Services customer ID
             }
          
          {- Table name
             }
          
          {- [StreamLabel]
             }
          
    }
    |}*)

  stream_specification: stream_specification option;
   (**{|
    The current DynamoDB Streams configuration for the table.|}*)

  global_secondary_indexes: global_secondary_index_description list option;
   (**{|
    The global secondary indexes, if any, on the table. Each index is scoped
    to a given partition key value. Each element is composed of:
    
    {ol 
          {- [Backfilling] - If true, then the index is currently in the
             backfilling phase. Backfilling occurs only when a new global
             secondary index is added to the table. It is the process by
             which DynamoDB populates the new index with data from the table.
             (This attribute does not appear for indexes that were created
             during a [CreateTable] operation.)
             
          You can delete an index that is being created during the
          [Backfilling] phase when [IndexStatus] is set to CREATING and
          [Backfilling] is true. You can't delete the index that is being
          created when [IndexStatus] is set to CREATING and [Backfilling] is
          false. (This attribute does not appear for indexes that were
          created during a [CreateTable] operation.)
          }
          
          {- [IndexName] - The name of the global secondary index.
             }
          
          {- [IndexSizeBytes] - The total size of the global secondary index,
             in bytes. DynamoDB updates this value approximately every six
             hours. Recent changes might not be reflected in this value.
             }
          
          {- [IndexStatus] - The current status of the global secondary
             index:
             
          {ol 
                {- [CREATING] - The index is being created.
                   }
                
                {- [UPDATING] - The index is being updated.
                   }
                
                {- [DELETING] - The index is being deleted.
                   }
                
                {- [ACTIVE] - The index is ready for use.
                   }
                
          }
          }
          
          {- [ItemCount] - The number of items in the global secondary index.
             DynamoDB updates this value approximately every six hours.
             Recent changes might not be reflected in this value.
             }
          
          {- [KeySchema] - Specifies the complete index key schema. The
             attribute names in the key schema must be between 1 and 255
             characters (inclusive). The key schema must begin with the same
             partition key as the table.
             }
          
          {- [Projection] - Specifies attributes that are copied (projected)
             from the table into the index. These are in addition to the
             primary key attributes and index key attributes, which are
             automatically projected. Each attribute specification is
             composed of:
             
          {ol 
                {- [ProjectionType] - One of the following:
                   
                {ol 
                      {- [KEYS_ONLY] - Only the index and primary keys are
                         projected into the index.
                         }
                      
                      {- [INCLUDE] - In addition to the attributes described
                         in [KEYS_ONLY], the secondary index will include
                         other non-key attributes that you specify.
                         }
                      
                      {- [ALL] - All of the table attributes are projected
                         into the index.
                         }
                      
                }
                }
                
                {- [NonKeyAttributes] - A list of one or more non-key
                   attribute names that are projected into the secondary
                   index. The total count of attributes provided in
                   [NonKeyAttributes], summed across all of the secondary
                   indexes, must not exceed 100. If you project the same
                   attribute into two different indexes, this counts as two
                   distinct attributes when determining the total.
                   }
                
          }
          }
          
          {- [ProvisionedThroughput] - The provisioned throughput settings
             for the global secondary index, consisting of read and write
             capacity units, along with data about increases and decreases.
             }
          
    }
    
    If the table is in the [DELETING] state, no information about indexes
    will be returned.|}*)

  local_secondary_indexes: local_secondary_index_description list option;
   (**{|
    Represents one or more local secondary indexes on the table. Each index
    is scoped to a given partition key value. Tables with one or more local
    secondary indexes are subject to an item collection size limit, where the
    amount of data within a given item collection cannot exceed 10 GB. Each
    element is composed of:
    
    {ol 
          {- [IndexName] - The name of the local secondary index.
             }
          
          {- [KeySchema] - Specifies the complete index key schema. The
             attribute names in the key schema must be between 1 and 255
             characters (inclusive). The key schema must begin with the same
             partition key as the table.
             }
          
          {- [Projection] - Specifies attributes that are copied (projected)
             from the table into the index. These are in addition to the
             primary key attributes and index key attributes, which are
             automatically projected. Each attribute specification is
             composed of:
             
          {ol 
                {- [ProjectionType] - One of the following:
                   
                {ol 
                      {- [KEYS_ONLY] - Only the index and primary keys are
                         projected into the index.
                         }
                      
                      {- [INCLUDE] - Only the specified table attributes are
                         projected into the index. The list of projected
                         attributes is in [NonKeyAttributes].
                         }
                      
                      {- [ALL] - All of the table attributes are projected
                         into the index.
                         }
                      
                }
                }
                
                {- [NonKeyAttributes] - A list of one or more non-key
                   attribute names that are projected into the secondary
                   index. The total count of attributes provided in
                   [NonKeyAttributes], summed across all of the secondary
                   indexes, must not exceed 100. If you project the same
                   attribute into two different indexes, this counts as two
                   distinct attributes when determining the total.
                   }
                
          }
          }
          
          {- [IndexSizeBytes] - Represents the total size of the index, in
             bytes. DynamoDB updates this value approximately every six
             hours. Recent changes might not be reflected in this value.
             }
          
          {- [ItemCount] - Represents the number of items in the index.
             DynamoDB updates this value approximately every six hours.
             Recent changes might not be reflected in this value.
             }
          
    }
    
    If the table is in the [DELETING] state, no information about indexes
    will be returned.|}*)

  billing_mode_summary: billing_mode_summary option;
   (**{|
    Contains the details for the read/write capacity mode.|}*)

  table_id: string option;
   (**{|
    Unique identifier for the table for which the backup was created.|}*)

  table_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) that uniquely identifies the table.|}*)

  item_count: int option;
   (**{|
    The number of items in the specified table. DynamoDB updates this value
    approximately every six hours. Recent changes might not be reflected in
    this value.|}*)

  table_size_bytes: int option;
   (**{|
    The total size of the specified table, in bytes. DynamoDB updates this
    value approximately every six hours. Recent changes might not be
    reflected in this value.|}*)

  provisioned_throughput: provisioned_throughput_description option;
   (**{|
    The provisioned throughput settings for the table, consisting of read and
    write capacity units, along with data about increases and decreases.|}*)

  creation_date_time: float option;
   (**{|
    The date and time when the table was created, in
    {{: http://www.epochconverter.com/ }UNIX epoch time} format.|}*)

  table_status: table_status option;
   (**{|
    The current state of the table:
    
    {ol 
          {- [CREATING] - The table is being created.
             }
          
          {- [UPDATING] - The table/index configuration is being updated. The
             table/index remains available for data operations when
             [UPDATING].
             }
          
          {- [DELETING] - The table is being deleted.
             }
          
          {- [ACTIVE] - The table is ready for use.
             }
          
          {- [INACCESSIBLE_ENCRYPTION_CREDENTIALS] - The KMS key used to
             encrypt the table in inaccessible. Table operations may fail due
             to failure to use the KMS key. DynamoDB will initiate the table
             archival process when a table's KMS key remains inaccessible for
             more than seven days.
             }
          
          {- [ARCHIVING] - The table is being archived. Operations are not
             allowed until archival is complete.
             }
          
          {- [ARCHIVED] - The table has been archived. See the ArchivalReason
             for more information.
             }
          
    }
    |}*)

  key_schema: key_schema_element list option;
   (**{|
    The primary key structure for the table. Each [KeySchemaElement] consists
    of:
    
    {ol 
          {- [AttributeName] - The name of the attribute.
             }
          
          {- [KeyType] - The role of the attribute:
             
          {ol 
                {- [HASH] - partition key
                   }
                
                {- [RANGE] - sort key
                   }
                
          }
          
          The partition key of an item is also known as its {i hash
          attribute}. The term "hash attribute" derives from DynamoDB's usage
          of an internal hash function to evenly distribute data items across
          partitions, based on their partition key values.
          
          The sort key of an item is also known as its {i range attribute}.
          The term "range attribute" derives from the way DynamoDB stores
          items with the same partition key physically close together, in
          sorted order by the sort key value.
          }
          
    }
    
    For more information about primary keys, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html#DataModelPrimaryKey }Primary
    Key} in the {i Amazon DynamoDB Developer Guide}.|}*)

  table_name: string option;
   (**{|
    The name of the table.|}*)

  attribute_definitions: attribute_definition list option;
   (**{|
    An array of [AttributeDefinition] objects. Each of these objects
    describes one attribute in the table and index key schema.
    
    Each [AttributeDefinition] object in this array is composed of:
    
    {ol 
          {- [AttributeName] - The name of the attribute.
             }
          
          {- [AttributeType] - The data type for the attribute.
             }
          
    }
    |}*)

}

(**{|
    Represents the output of an [UpdateTable] operation.|}*)
type update_table_output = {
  table_description: table_description option;
   (**{|
    Represents the properties of the table.|}*)

}

(**{|
    Represents the provisioned throughput settings for a specified table or
    index. The settings can be modified using the [UpdateTable] operation.
    
    For current minimum and maximum provisioned throughput values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html }Service,
    Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.|}*)
type provisioned_throughput = {
  write_capacity_units: int;
   (**{|
    The maximum number of writes consumed per second before DynamoDB returns
    a [ThrottlingException]. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughput.html }Specifying
    Read and Write Requirements} in the {i Amazon DynamoDB Developer Guide}.
    
    If read/write capacity mode is [PAY_PER_REQUEST] the value is set to 0.|}*)

  read_capacity_units: int;
   (**{|
    The maximum number of strongly consistent reads consumed per second
    before DynamoDB returns a [ThrottlingException]. For more information,
    see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughput.html }Specifying
    Read and Write Requirements} in the {i Amazon DynamoDB Developer Guide}.
    
    If read/write capacity mode is [PAY_PER_REQUEST] the value is set to 0.|}*)

}

(**{|
    Represents the new provisioned throughput settings to be applied to a
    global secondary index.|}*)
type update_global_secondary_index_action = {
  on_demand_throughput: on_demand_throughput option;
   (**{|
    Updates the maximum number of read and write units for the specified
    global secondary index. If you use this parameter, you must specify
    [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.|}*)

  provisioned_throughput: provisioned_throughput option;
   (**{|
    Represents the provisioned throughput settings for the specified global
    secondary index.
    
    For current minimum and maximum provisioned throughput values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html }Service,
    Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.|}*)

  index_name: string;
   (**{|
    The name of the global secondary index to be updated.|}*)

}

(**{|
    Represents a new global secondary index to be added to an existing table.|}*)
type create_global_secondary_index_action = {
  on_demand_throughput: on_demand_throughput option;
   (**{|
    The maximum number of read and write units for the global secondary index
    being created. If you use this parameter, you must specify
    [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.|}*)

  provisioned_throughput: provisioned_throughput option;
   (**{|
    Represents the provisioned throughput settings for the specified global
    secondary index.
    
    For current minimum and maximum provisioned throughput values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html }Service,
    Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.|}*)

  projection: projection;
   (**{|
    Represents attributes that are copied (projected) from the table into an
    index. These are in addition to the primary key attributes and index key
    attributes, which are automatically projected.|}*)

  key_schema: key_schema_element list;
   (**{|
    The key schema for the global secondary index.|}*)

  index_name: string;
   (**{|
    The name of the global secondary index to be created.|}*)

}

(**{|
    Represents a global secondary index to be deleted from an existing table.|}*)
type delete_global_secondary_index_action = {
  index_name: string;
   (**{|
    The name of the global secondary index to be deleted.|}*)

}

(**{|
    Represents one of the following:
    
    {ol 
          {- A new global secondary index to be added to an existing table.
             }
          
          {- New provisioned throughput parameters for an existing global
             secondary index.
             }
          
          {- An existing global secondary index to be removed from an
             existing table.
             }
          
    }
    |}*)
type global_secondary_index_update = {
  delete: delete_global_secondary_index_action option;
   (**{|
    The name of an existing global secondary index to be removed.|}*)

  create: create_global_secondary_index_action option;
   (**{|
    The parameters required for creating a global secondary index on an
    existing table:
    
    {ol 
          {- [IndexName]
             }
          
          {- [KeySchema]
             }
          
          {- [AttributeDefinitions]
             }
          
          {- [Projection]
             }
          
          {- [ProvisionedThroughput]
             }
          
    }
    |}*)

  update: update_global_secondary_index_action option;
   (**{|
    The name of an existing global secondary index, along with new
    provisioned throughput settings to be applied to that index.|}*)

}

(**{|
    Represents the settings used to enable server-side encryption.|}*)
type sse_specification = {
  kms_master_key_id: string option;
   (**{|
    The KMS key that should be used for the KMS encryption. To specify a key,
    use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN.
    Note that you should only provide this parameter if the key is different
    from the default DynamoDB key [alias/aws/dynamodb].|}*)

  sse_type: sse_type option;
   (**{|
    Server-side encryption type. The only supported value is:
    
    {ol 
          {- [KMS] - Server-side encryption that uses Key Management Service.
             The key is stored in your account and is managed by KMS (KMS
             charges apply).
             }
          
    }
    |}*)

  enabled: bool option;
   (**{|
    Indicates whether server-side encryption is done using an Amazon Web
    Services managed key or an Amazon Web Services owned key. If enabled
    (true), server-side encryption type is set to [KMS] and an Amazon Web
    Services managed key is used (KMS charges apply). If disabled (false) or
    not specified, server-side encryption is set to Amazon Web Services owned
    key.|}*)

}

(**{|
    Represents the properties of a replica global secondary index.|}*)
type replica_global_secondary_index = {
  on_demand_throughput_override: on_demand_throughput_override option;
   (**{|
    Overrides the maximum on-demand throughput settings for the specified
    global secondary index in the specified replica table.|}*)

  provisioned_throughput_override: provisioned_throughput_override option;
   (**{|
    Replica table GSI-specific provisioned throughput. If not specified, uses
    the source table GSI's read capacity settings.|}*)

  index_name: string;
   (**{|
    The name of the global secondary index.|}*)

}

(**{|
    Represents a replica to be created.|}*)
type create_replication_group_member_action = {
  table_class_override: table_class option;
   (**{|
    Replica-specific table class. If not specified, uses the source table's
    table class.|}*)

  global_secondary_indexes: replica_global_secondary_index list option;
   (**{|
    Replica-specific global secondary index settings.|}*)

  on_demand_throughput_override: on_demand_throughput_override option;
   (**{|
    The maximum on-demand throughput settings for the specified replica table
    being created. You can only modify [MaxReadRequestUnits], because you
    can't modify [MaxWriteRequestUnits] for individual replica tables.|}*)

  provisioned_throughput_override: provisioned_throughput_override option;
   (**{|
    Replica-specific provisioned throughput. If not specified, uses the
    source table's provisioned throughput settings.|}*)

  kms_master_key_id: string option;
   (**{|
    The KMS key that should be used for KMS encryption in the new replica. To
    specify a key, use its key ID, Amazon Resource Name (ARN), alias name, or
    alias ARN. Note that you should only provide this parameter if the key is
    different from the default DynamoDB KMS key [alias/aws/dynamodb].|}*)

  region_name: string;
   (**{|
    The Region where the new replica will be created.|}*)

}

(**{|
    Represents a replica to be modified.|}*)
type update_replication_group_member_action = {
  table_class_override: table_class option;
   (**{|
    Replica-specific table class. If not specified, uses the source table's
    table class.|}*)

  global_secondary_indexes: replica_global_secondary_index list option;
   (**{|
    Replica-specific global secondary index settings.|}*)

  on_demand_throughput_override: on_demand_throughput_override option;
   (**{|
    Overrides the maximum on-demand throughput for the replica table.|}*)

  provisioned_throughput_override: provisioned_throughput_override option;
   (**{|
    Replica-specific provisioned throughput. If not specified, uses the
    source table's provisioned throughput settings.|}*)

  kms_master_key_id: string option;
   (**{|
    The KMS key of the replica that should be used for KMS encryption. To
    specify a key, use its key ID, Amazon Resource Name (ARN), alias name, or
    alias ARN. Note that you should only provide this parameter if the key is
    different from the default DynamoDB KMS key [alias/aws/dynamodb].|}*)

  region_name: string;
   (**{|
    The Region where the replica exists.|}*)

}

(**{|
    Represents a replica to be deleted.|}*)
type delete_replication_group_member_action = {
  region_name: string;
   (**{|
    The Region where the replica exists.|}*)

}

(**{|
    Represents one of the following:
    
    {ol 
          {- A new replica to be added to an existing regional table or
             global table. This request invokes the [CreateTableReplica]
             action in the destination Region.
             }
          
          {- New parameters for an existing replica. This request invokes the
             [UpdateTable] action in the destination Region.
             }
          
          {- An existing replica to be deleted. The request invokes the
             [DeleteTableReplica] action in the destination Region, deleting
             the replica and all if its items in the destination Region.
             }
          
    }
    
    When you manually remove a table or global table replica, you do not
    automatically remove any associated scalable targets, scaling policies,
    or CloudWatch alarms.
    |}*)
type replication_group_update = {
  delete: delete_replication_group_member_action option;
   (**{|
    The parameters required for deleting a replica for the table.|}*)

  update: update_replication_group_member_action option;
   (**{|
    The parameters required for updating a replica for the table.|}*)

  create: create_replication_group_member_action option;
   (**{|
    The parameters required for creating a replica for the table.|}*)

}

(**{|
    Represents the input of an [UpdateTable] operation.|}*)
type update_table_input = {
  on_demand_throughput: on_demand_throughput option;
   (**{|
    Updates the maximum number of read and write units for the specified
    table in on-demand capacity mode. If you use this parameter, you must
    specify [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.|}*)

  deletion_protection_enabled: bool option;
   (**{|
    Indicates whether deletion protection is to be enabled (true) or disabled
    (false) on the table.|}*)

  table_class: table_class option;
   (**{|
    The table class of the table to be updated. Valid values are [STANDARD]
    and [STANDARD_INFREQUENT_ACCESS].|}*)

  replica_updates: replication_group_update list option;
   (**{|
    A list of replica update actions (create, delete, or update) for the
    table.
    
    For global tables, this property only applies to global tables using
    Version 2019.11.21 (Current version).
    |}*)

  sse_specification: sse_specification option;
   (**{|
    The new server-side encryption settings for the specified table.|}*)

  stream_specification: stream_specification option;
   (**{|
    Represents the DynamoDB Streams configuration for the table.
    
    You receive a [ValidationException] if you try to enable a stream on a
    table that already has a stream, or if you try to disable a stream on a
    table that doesn't have a stream.
    |}*)

  global_secondary_index_updates: global_secondary_index_update list option;
   (**{|
    An array of one or more global secondary indexes for the table. For each
    index in the array, you can request one action:
    
    {ol 
          {- [Create] - add a new global secondary index to the table.
             }
          
          {- [Update] - modify the provisioned throughput settings of an
             existing global secondary index.
             }
          
          {- [Delete] - remove a global secondary index from the table.
             }
          
    }
    
    You can create or delete only one global secondary index per
    [UpdateTable] operation.
    
    For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.OnlineOps.html }Managing
    Global Secondary Indexes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  provisioned_throughput: provisioned_throughput option;
   (**{|
    The new provisioned throughput settings for the specified table or index.|}*)

  billing_mode: billing_mode option;
   (**{|
    Controls how you are charged for read and write throughput and how you
    manage capacity. When switching from pay-per-request to provisioned
    capacity, initial provisioned capacity values must be set. The initial
    provisioned capacity values are estimated based on the consumed read and
    write capacity of your table and global secondary indexes over the past
    30 minutes.
    
    {ol 
          {- [PROVISIONED] - We recommend using [PROVISIONED] for predictable
             workloads. [PROVISIONED] sets the billing mode to
             {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html }Provisioned
             capacity mode}.
             }
          
          {- [PAY_PER_REQUEST] - We recommend using [PAY_PER_REQUEST] for
             unpredictable workloads. [PAY_PER_REQUEST] sets the billing mode
             to
             {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html }On-demand
             capacity mode}.
             }
          
    }
    |}*)

  table_name: string;
   (**{|
    The name of the table to be updated. You can also provide the Amazon
    Resource Name (ARN) of the table in this parameter.|}*)

  attribute_definitions: attribute_definition list option;
   (**{|
    An array of attributes that describe the key schema for the table and
    indexes. If you are adding a new global secondary index to the table,
    [AttributeDefinitions] must include the key element(s) of the new index.|}*)

}

type destination_status = | UPDATING
  | ENABLE_FAILED
  | DISABLED
  | DISABLING
  | ACTIVE
  | ENABLING

type approximate_creation_date_time_precision = | MICROSECOND
  | MILLISECOND

(**{|
    Enables updating the configuration for Kinesis Streaming.|}*)
type update_kinesis_streaming_configuration = {
  approximate_creation_date_time_precision: approximate_creation_date_time_precision option;
   (**{|
    Enables updating the precision of Kinesis data stream timestamp.|}*)

}

type update_kinesis_streaming_destination_output = {
  update_kinesis_streaming_configuration: update_kinesis_streaming_configuration option;
   (**{|
    The command to update the Kinesis streaming destination configuration.|}*)

  destination_status: destination_status option;
   (**{|
    The status of the attempt to update the Kinesis streaming destination
    output.|}*)

  stream_arn: string option;
   (**{|
    The ARN for the Kinesis stream input.|}*)

  table_name: string option;
   (**{|
    The table name for the Kinesis streaming destination output.|}*)

}

type update_kinesis_streaming_destination_input = {
  update_kinesis_streaming_configuration: update_kinesis_streaming_configuration option;
   (**{|
    The command to update the Kinesis stream configuration.|}*)

  stream_arn: string;
   (**{|
    The Amazon Resource Name (ARN) for the Kinesis stream input.|}*)

  table_name: string;
   (**{|
    The table name for the Kinesis streaming destination input. You can also
    provide the ARN of the table in this parameter.|}*)

}

(**{|
    Represents the amount of provisioned throughput capacity consumed on a
    table or an index.|}*)
type capacity = {
  capacity_units: float option;
   (**{|
    The total number of capacity units consumed on a table or an index.|}*)

  write_capacity_units: float option;
   (**{|
    The total number of write capacity units consumed on a table or an index.|}*)

  read_capacity_units: float option;
   (**{|
    The total number of read capacity units consumed on a table or an index.|}*)

}

(**{|
    The capacity units consumed by an operation. The data returned includes
    the total provisioned throughput consumed, along with statistics for the
    table and any indexes involved in the operation. [ConsumedCapacity] is
    only returned if the request asked for it. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html }Provisioned
    capacity mode} in the {i Amazon DynamoDB Developer Guide}.|}*)
type consumed_capacity = {
  global_secondary_indexes: (string * capacity) list option;
   (**{|
    The amount of throughput consumed on each global index affected by the
    operation.|}*)

  local_secondary_indexes: (string * capacity) list option;
   (**{|
    The amount of throughput consumed on each local index affected by the
    operation.|}*)

  table: capacity option;
   (**{|
    The amount of throughput consumed on the table affected by the operation.|}*)

  write_capacity_units: float option;
   (**{|
    The total number of write capacity units consumed by the operation.|}*)

  read_capacity_units: float option;
   (**{|
    The total number of read capacity units consumed by the operation.|}*)

  capacity_units: float option;
   (**{|
    The total number of capacity units consumed by the operation.|}*)

  table_name: string option;
   (**{|
    The name of the table that was affected by the operation. If you had
    specified the Amazon Resource Name (ARN) of a table in the input, you'll
    see the table ARN in the response.|}*)

}

(**{|
    Information about item collections, if any, that were affected by the
    operation. [ItemCollectionMetrics] is only returned if the request asked
    for it. If the table does not have any local secondary indexes, this
    information is not returned in the response.|}*)
type item_collection_metrics = {
  size_estimate_range_g_b: float list option;
   (**{|
    An estimate of item collection size, in gigabytes. This value is a
    two-element array containing a lower bound and an upper bound for the
    estimate. The estimate includes the size of all the items in the table,
    plus the size of all attributes projected into all of the local secondary
    indexes on that table. Use this estimate to measure whether a local
    secondary index is approaching its size limit.
    
    The estimate is subject to change over time; therefore, do not rely on
    the precision or accuracy of the estimate.|}*)

  item_collection_key: (string * attribute_value) list option;
   (**{|
    The partition key value of the item collection. This value is the same as
    the partition key value of the item.|}*)

}

(**{|
    Represents the output of an [UpdateItem] operation.|}*)
type update_item_output = {
  item_collection_metrics: item_collection_metrics option;
   (**{|
    Information about item collections, if any, that were affected by the
    [UpdateItem] operation. [ItemCollectionMetrics] is only returned if the
    [ReturnItemCollectionMetrics] parameter was specified. If the table does
    not have any local secondary indexes, this information is not returned in
    the response.
    
    Each [ItemCollectionMetrics] element consists of:
    
    {ol 
          {- [ItemCollectionKey] - The partition key value of the item
             collection. This is the same as the partition key value of the
             item itself.
             }
          
          {- [SizeEstimateRangeGB] - An estimate of item collection size, in
             gigabytes. This value is a two-element array containing a lower
             bound and an upper bound for the estimate. The estimate includes
             the size of all the items in the table, plus the size of all
             attributes projected into all of the local secondary indexes on
             that table. Use this estimate to measure whether a local
             secondary index is approaching its size limit.
             
          The estimate is subject to change over time; therefore, do not rely
          on the precision or accuracy of the estimate.
          }
          
    }
    |}*)

  consumed_capacity: consumed_capacity option;
   (**{|
    The capacity units consumed by the [UpdateItem] operation. The data
    returned includes the total provisioned throughput consumed, along with
    statistics for the table and any indexes involved in the operation.
    [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity]
    parameter was specified. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#write-operation-consumption }Capacity
    unity consumption for write operations} in the {i Amazon DynamoDB
    Developer Guide}.|}*)

  attributes: (string * attribute_value) list option;
   (**{|
    A map of attribute values as they appear before or after the [UpdateItem]
    operation, as determined by the [ReturnValues] parameter.
    
    The [Attributes] map is only present if the update was successful and
    [ReturnValues] was specified as something other than [NONE] in the
    request. Each element represents one attribute.|}*)

}

type attribute_action = | DELETE
  | PUT
  | ADD

(**{|
    For the [UpdateItem] operation, represents the attributes to be modified,
    the action to perform on each, and the new value for each.
    
    You cannot use [UpdateItem] to update any primary key attributes.
    Instead, you will need to delete the item, and then use [PutItem] to
    create a new item with new attributes.
    
    Attribute values cannot be null; string and binary type attributes must
    have lengths greater than zero; and set type attributes must not be
    empty. Requests with empty values will be rejected with a
    [ValidationException] exception.|}*)
type attribute_value_update = {
  action: attribute_action option;
   (**{|
    Specifies how to perform the update. Valid values are [PUT] (default),
    [DELETE], and [ADD]. The behavior depends on whether the specified
    primary key already exists in the table.
    
    {b If an item with the specified {i Key} is found in the table:}
    
    {ol 
          {- [PUT] - Adds the specified attribute to the item. If the
             attribute already exists, it is replaced by the new value.
             }
          
          {- [DELETE] - If no value is specified, the attribute and its value
             are removed from the item. The data type of the specified value
             must match the existing value's data type.
             
          If a {i set} of values is specified, then those values are
          subtracted from the old set. For example, if the attribute value
          was the set [[a,b,c]] and the [DELETE] action specified [[a,c]],
          then the final attribute value would be [[b]]. Specifying an empty
          set is an error.
          }
          
          {- [ADD] - If the attribute does not already exist, then the
             attribute and its values are added to the item. If the attribute
             does exist, then the behavior of [ADD] depends on the data type
             of the attribute:
             
          {ol 
                {- If the existing attribute is a number, and if [Value] is
                   also a number, then the [Value] is mathematically added to
                   the existing attribute. If [Value] is a negative number,
                   then it is subtracted from the existing attribute.
                   
                If you use [ADD] to increment or decrement a number value for
                an item that doesn't exist before the update, DynamoDB uses 0
                as the initial value.
                
                In addition, if you use [ADD] to update an existing item, and
                intend to increment or decrement an attribute value which
                does not yet exist, DynamoDB uses [0] as the initial value.
                For example, suppose that the item you want to update does
                not yet have an attribute named {i itemcount}, but you decide
                to [ADD] the number [3] to this attribute anyway, even though
                it currently does not exist. DynamoDB will create the
                {i itemcount} attribute, set its initial value to [0], and
                finally add [3] to it. The result will be a new {i itemcount}
                attribute in the item, with a value of [3].
                }
                
                {- If the existing data type is a set, and if the [Value] is
                   also a set, then the [Value] is added to the existing set.
                   (This is a {i set} operation, not mathematical addition.)
                   For example, if the attribute value was the set [[1,2]],
                   and the [ADD] action specified [[3]], then the final
                   attribute value would be [[1,2,3]]. An error occurs if an
                   Add action is specified for a set attribute and the
                   attribute type specified does not match the existing set
                   type.
                   
                Both sets must have the same primitive data type. For
                example, if the existing data type is a set of strings, the
                [Value] must also be a set of strings. The same holds true
                for number sets and binary sets.
                }
                
          }
          
          This action is only valid for an existing attribute whose data type
          is number or is a set. Do not use [ADD] for any other data types.
          }
          
    }
    
    {b If no item with the specified {i Key} is found:}
    
    {ol 
          {- [PUT] - DynamoDB creates a new item with the specified primary
             key, and then adds the attribute.
             }
          
          {- [DELETE] - Nothing happens; there is no attribute to delete.
             }
          
          {- [ADD] - DynamoDB creates a new item with the supplied primary
             key and number (or set) for the attribute value. The only data
             types allowed are number, number set, string set or binary set.
             }
          
    }
    |}*)

  value: attribute_value option;
   (**{|
    Represents the data for an attribute.
    
    Each attribute value is described as a name-value pair. The name is the
    data type, and the value is the data itself.
    
    For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes }Data
    Types} in the {i Amazon DynamoDB Developer Guide}.|}*)

}

type comparison_operator = | BEGINS_WITH
  | NOT_CONTAINS
  | CONTAINS
  | NULL
  | NOT_NULL
  | BETWEEN
  | GT
  | GE
  | LT
  | LE
  | IN
  | NE
  | EQ

(**{|
    Represents a condition to be compared with an attribute value. This
    condition can be used with [DeleteItem], [PutItem], or [UpdateItem]
    operations; if the comparison evaluates to true, the operation succeeds;
    if not, the operation fails. You can use [ExpectedAttributeValue] in one
    of two different ways:
    
    {ol 
          {- Use [AttributeValueList] to specify one or more values to
             compare against an attribute. Use [ComparisonOperator] to
             specify how you want to perform the comparison. If the
             comparison evaluates to true, then the conditional operation
             succeeds.
             }
          
          {- Use [Value] to specify a value that DynamoDB will compare
             against an attribute. If the values match, then
             [ExpectedAttributeValue] evaluates to true and the conditional
             operation succeeds. Optionally, you can also set [Exists] to
             false, indicating that you {i do not} expect to find the
             attribute value in the table. In this case, the conditional
             operation succeeds only if the comparison evaluates to false.
             }
          
    }
    
    [Value] and [Exists] are incompatible with [AttributeValueList] and
    [ComparisonOperator]. Note that if you use both sets of parameters at
    once, DynamoDB will return a [ValidationException] exception.|}*)
type expected_attribute_value = {
  attribute_value_list: attribute_value list option;
   (**{|
    One or more values to evaluate against the supplied attribute. The number
    of values in the list depends on the [ComparisonOperator] being used.
    
    For type Number, value comparisons are numeric.
    
    String value comparisons for greater than, equals, or less than are based
    on ASCII character code values. For example, [a] is greater than [A], and
    [a] is greater than [B]. For a list of code values, see
    {{: http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters }http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}.
    
    
    For Binary, DynamoDB treats each byte of the binary data as unsigned when
    it compares binary values.
    
    For information on specifying data types in JSON, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html }JSON
    Data Format} in the {i Amazon DynamoDB Developer Guide}.|}*)

  comparison_operator: comparison_operator option;
   (**{|
    A comparator for evaluating attributes in the [AttributeValueList]. For
    example, equals, greater than, less than, etc.
    
    The following comparison operators are available:
    
    [EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS
    | BEGINS_WITH | IN | BETWEEN]
    
    The following are descriptions of each comparison operator.
    
    {ol 
          {- [EQ] : Equal. [EQ] is supported for all data types, including
             lists and maps.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, Binary, String Set, Number Set, or Binary
          Set. If an item contains an [AttributeValue] element of a different
          type than the one provided in the request, the value does not
          match. For example, [{"S":"6"}] does not equal [{"N":"6"}]. Also,
          [{"N":"6"}] does not equal [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [NE] : Not equal. [NE] is supported for all data types,
             including lists and maps.
             
          [AttributeValueList] can contain only one [AttributeValue] of type
          String, Number, Binary, String Set, Number Set, or Binary Set. If
          an item contains an [AttributeValue] of a different type than the
          one provided in the request, the value does not match. For example,
          [{"S":"6"}] does not equal [{"N":"6"}]. Also, [{"N":"6"}] does not
          equal [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [LE] : Less than or equal.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, or Binary (not a set type). If an item
          contains an [AttributeValue] element of a different type than the
          one provided in the request, the value does not match. For example,
          [{"S":"6"}] does not equal [{"N":"6"}]. Also, [{"N":"6"}] does not
          compare to [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [LT] : Less than.
             
          [AttributeValueList] can contain only one [AttributeValue] of type
          String, Number, or Binary (not a set type). If an item contains an
          [AttributeValue] element of a different type than the one provided
          in the request, the value does not match. For example, [{"S":"6"}]
          does not equal [{"N":"6"}]. Also, [{"N":"6"}] does not compare to
          [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [GE] : Greater than or equal.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, or Binary (not a set type). If an item
          contains an [AttributeValue] element of a different type than the
          one provided in the request, the value does not match. For example,
          [{"S":"6"}] does not equal [{"N":"6"}]. Also, [{"N":"6"}] does not
          compare to [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [GT] : Greater than.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, or Binary (not a set type). If an item
          contains an [AttributeValue] element of a different type than the
          one provided in the request, the value does not match. For example,
          [{"S":"6"}] does not equal [{"N":"6"}]. Also, [{"N":"6"}] does not
          compare to [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [NOT_NULL] : The attribute exists. [NOT_NULL] is supported for
             all data types, including lists and maps.
             
          This operator tests for the existence of an attribute, not its data
          type. If the data type of attribute "[a]" is null, and you evaluate
          it using [NOT_NULL], the result is a Boolean [true]. This result is
          because the attribute "[a]" exists; its data type is not relevant
          to the [NOT_NULL] comparison operator.
          }
          
          {- [NULL] : The attribute does not exist. [NULL] is supported for
             all data types, including lists and maps.
             
          This operator tests for the nonexistence of an attribute, not its
          data type. If the data type of attribute "[a]" is null, and you
          evaluate it using [NULL], the result is a Boolean [false]. This is
          because the attribute "[a]" exists; its data type is not relevant
          to the [NULL] comparison operator.
          }
          
          {- [CONTAINS] : Checks for a subsequence, or value in a set.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, or Binary (not a set type). If the target
          attribute of the comparison is of type String, then the operator
          checks for a substring match. If the target attribute of the
          comparison is of type Binary, then the operator looks for a
          subsequence of the target that matches the input. If the target
          attribute of the comparison is a set ("[SS]", "[NS]", or "[BS]"),
          then the operator evaluates to true if it finds an exact match with
          any member of the set.
          
          CONTAINS is supported for lists: When evaluating "[a CONTAINS b]",
          "[a]" can be a list; however, "[b]" cannot be a set, a map, or a
          list.
          }
          
          {- [NOT_CONTAINS] : Checks for absence of a subsequence, or absence
             of a value in a set.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, or Binary (not a set type). If the target
          attribute of the comparison is a String, then the operator checks
          for the absence of a substring match. If the target attribute of
          the comparison is Binary, then the operator checks for the absence
          of a subsequence of the target that matches the input. If the
          target attribute of the comparison is a set ("[SS]", "[NS]", or
          "[BS]"), then the operator evaluates to true if it {i does not}
          find an exact match with any member of the set.
          
          NOT_CONTAINS is supported for lists: When evaluating "[a NOT
          CONTAINS b]", "[a]" can be a list; however, "[b]" cannot be a set,
          a map, or a list.
          }
          
          {- [BEGINS_WITH] : Checks for a prefix.
             
          [AttributeValueList] can contain only one [AttributeValue] of type
          String or Binary (not a Number or a set type). The target attribute
          of the comparison must be of type String or Binary (not a Number or
          a set type).
          
          
          }
          
          {- [IN] : Checks for matching elements in a list.
             
          [AttributeValueList] can contain one or more [AttributeValue]
          elements of type String, Number, or Binary. These attributes are
          compared against an existing attribute of an item. If any elements
          of the input are equal to the item attribute, the expression
          evaluates to true.
          }
          
          {- [BETWEEN] : Greater than or equal to the first value, and less
             than or equal to the second value.
             
          [AttributeValueList] must contain two [AttributeValue] elements of
          the same type, either String, Number, or Binary (not a set type). A
          target attribute matches if the target value is greater than, or
          equal to, the first element and less than, or equal to, the second
          element. If an item contains an [AttributeValue] element of a
          different type than the one provided in the request, the value does
          not match. For example, [{"S":"6"}] does not compare to
          [{"N":"6"}]. Also, [{"N":"6"}] does not compare to [{"NS":["6",
          "2", "1"]}]
          }
          
    }
    |}*)

  exists: bool option;
   (**{|
    Causes DynamoDB to evaluate the value before attempting a conditional
    operation:
    
    {ol 
          {- If [Exists] is [true], DynamoDB will check to see if that
             attribute value already exists in the table. If it is found,
             then the operation succeeds. If it is not found, the operation
             fails with a [ConditionCheckFailedException].
             }
          
          {- If [Exists] is [false], DynamoDB assumes that the attribute
             value does not exist in the table. If in fact the value does not
             exist, then the assumption is valid and the operation succeeds.
             If the value is found, despite the assumption that it does not
             exist, the operation fails with a
             [ConditionCheckFailedException].
             }
          
    }
    
    The default setting for [Exists] is [true]. If you supply a [Value] all
    by itself, DynamoDB assumes the attribute exists: You don't have to set
    [Exists] to [true], because it is implied.
    
    DynamoDB returns a [ValidationException] if:
    
    {ol 
          {- [Exists] is [true] but there is no [Value] to check. (You expect
             a value to exist, but don't specify what that value is.)
             }
          
          {- [Exists] is [false] but you also provide a [Value]. (You cannot
             expect an attribute to have a value, while also expecting it not
             to exist.)
             }
          
    }
    |}*)

  value: attribute_value option;
   (**{|
    Represents the data for the expected attribute.
    
    Each attribute value is described as a name-value pair. The name is the
    data type, and the value is the data itself.
    
    For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes }Data
    Types} in the {i Amazon DynamoDB Developer Guide}.|}*)

}

type conditional_operator = | OR
  | AND

type return_value = | UPDATED_NEW
  | ALL_NEW
  | UPDATED_OLD
  | ALL_OLD
  | NONE

(**{|
    Determines the level of detail about either provisioned or on-demand
    throughput consumption that is returned in the response:
    
    {ol 
          {- [INDEXES] - The response includes the aggregate
             [ConsumedCapacity] for the operation, together with
             [ConsumedCapacity] for each table and secondary index that was
             accessed.
             
          Note that some operations, such as [GetItem] and [BatchGetItem], do
          not access any indexes at all. In these cases, specifying [INDEXES]
          will only return [ConsumedCapacity] information for table(s).
          }
          
          {- [TOTAL] - The response includes only the aggregate
             [ConsumedCapacity] for the operation.
             }
          
          {- [NONE] - No [ConsumedCapacity] details are included in the
             response.
             }
          
    }
    |}*)
type return_consumed_capacity = | NONE
  | TOTAL
  | INDEXES

type return_item_collection_metrics = | NONE
  | SIZE

type return_values_on_condition_check_failure = | NONE
  | ALL_OLD

(**{|
    Represents the input of an [UpdateItem] operation.|}*)
type update_item_input = {
  return_values_on_condition_check_failure: return_values_on_condition_check_failure option;
   (**{|
    An optional parameter that returns the item attributes for an
    [UpdateItem] operation that failed a condition check.
    
    There is no additional cost associated with requesting a return value
    aside from the small network and processing overhead of receiving a
    larger response. No read capacity units are consumed.|}*)

  expression_attribute_values: (string * attribute_value) list option;
   (**{|
    One or more values that can be substituted in an expression.
    
    Use the {b :} (colon) character in an expression to dereference an
    attribute value. For example, suppose that you wanted to check whether
    the value of the [ProductStatus] attribute was one of the following:
    
    [Available | Backordered | Discontinued]
    
    You would first need to specify [ExpressionAttributeValues] as follows:
    
    [{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
    ":disc":{"S":"Discontinued"} }]
    
    You could then use these values in an expression, such as this:
    
    [ProductStatus IN (:avail, :back, :disc)]
    
    For more information on expression attribute values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html }Condition
    Expressions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression. The
    following are some use cases for using [ExpressionAttributeNames]:
    
    {ol 
          {- To access an attribute whose name conflicts with a DynamoDB
             reserved word.
             }
          
          {- To create a placeholder for repeating occurrences of an
             attribute name in an expression.
             }
          
          {- To prevent special characters in an attribute name from being
             misinterpreted in an expression.
             }
          
    }
    
    Use the {b #} character in an expression to dereference an attribute
    name. For example, consider the following attribute name:
    
    {ol 
          {- [Percentile]
             }
          
    }
    
    The name of this attribute conflicts with a reserved word, so it cannot
    be used directly in an expression. (For the complete list of reserved
    words, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html }Reserved
    Words} in the {i Amazon DynamoDB Developer Guide}.) To work around this,
    you could specify the following for [ExpressionAttributeNames]:
    
    {ol 
          {- [{"#P":"Percentile"}]
             }
          
    }
    
    You could then use this substitution in an expression, as in this
    example:
    
    {ol 
          {- [#P = :val]
             }
          
    }
    
    Tokens that begin with the {b :} character are {i expression attribute
    values}, which are placeholders for the actual value at runtime.
    
    For more information about expression attribute names, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Specifying
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  condition_expression: string option;
   (**{|
    A condition that must be satisfied in order for a conditional update to
    succeed.
    
    An expression can contain any of the following:
    
    {ol 
          {- Functions: [attribute_exists | attribute_not_exists |
             attribute_type | contains | begins_with | size]
             
          These function names are case-sensitive.
          }
          
          {- Comparison operators: [= | <> | < | > | <= | >= | BETWEEN | IN]
             }
          
          {- Logical operators: [AND | OR | NOT]
             }
          
    }
    
    For more information about condition expressions, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html }Specifying
    Conditions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  update_expression: string option;
   (**{|
    An expression that defines one or more attributes to be updated, the
    action to be performed on them, and new values for them.
    
    The following action values are available for [UpdateExpression].
    
    {ol 
          {- [SET] - Adds one or more attributes and values to an item. If
             any of these attributes already exist, they are replaced by the
             new values. You can also use [SET] to add or subtract from an
             attribute that is of type Number. For example: [SET myNum =
             myNum + :val]
             
          [SET] supports the following functions:
          
          {ol 
                {- [if_not_exists (path, operand)] - if the item does not
                   contain an attribute at the specified path, then
                   [if_not_exists] evaluates to operand; otherwise, it
                   evaluates to path. You can use this function to avoid
                   overwriting an attribute that may already be present in
                   the item.
                   }
                
                {- [list_append (operand, operand)] - evaluates to a list
                   with a new element added to it. You can append the new
                   element to the start or the end of the list by reversing
                   the order of the operands.
                   }
                
          }
          
          These function names are case-sensitive.
          }
          
          {- [REMOVE] - Removes one or more attributes from an item.
             }
          
          {- [ADD] - Adds the specified value to the item, if the attribute
             does not already exist. If the attribute does exist, then the
             behavior of [ADD] depends on the data type of the attribute:
             
          {ol 
                {- If the existing attribute is a number, and if [Value] is
                   also a number, then [Value] is mathematically added to the
                   existing attribute. If [Value] is a negative number, then
                   it is subtracted from the existing attribute.
                   
                If you use [ADD] to increment or decrement a number value for
                an item that doesn't exist before the update, DynamoDB uses
                [0] as the initial value.
                
                Similarly, if you use [ADD] for an existing item to increment
                or decrement an attribute value that doesn't exist before the
                update, DynamoDB uses [0] as the initial value. For example,
                suppose that the item you want to update doesn't have an
                attribute named [itemcount], but you decide to [ADD] the
                number [3] to this attribute anyway. DynamoDB will create the
                [itemcount] attribute, set its initial value to [0], and
                finally add [3] to it. The result will be a new [itemcount]
                attribute in the item, with a value of [3].
                }
                
                {- If the existing data type is a set and if [Value] is also
                   a set, then [Value] is added to the existing set. For
                   example, if the attribute value is the set [[1,2]], and
                   the [ADD] action specified [[3]], then the final attribute
                   value is [[1,2,3]]. An error occurs if an [ADD] action is
                   specified for a set attribute and the attribute type
                   specified does not match the existing set type.
                   
                Both sets must have the same primitive data type. For
                example, if the existing data type is a set of strings, the
                [Value] must also be a set of strings.
                }
                
          }
          
          The [ADD] action only supports Number and set data types. In
          addition, [ADD] can only be used on top-level attributes, not
          nested attributes.
          }
          
          {- [DELETE] - Deletes an element from a set.
             
          If a set of values is specified, then those values are subtracted
          from the old set. For example, if the attribute value was the set
          [[a,b,c]] and the [DELETE] action specifies [[a,c]], then the final
          attribute value is [[b]]. Specifying an empty set is an error.
          
          The [DELETE] action only supports set data types. In addition,
          [DELETE] can only be used on top-level attributes, not nested
          attributes.
          }
          
    }
    
    You can have many actions in a single expression, such as the following:
    [SET a=:value1, b=:value2 DELETE :value3, :value4, :value5]
    
    For more information on update expressions, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.Modifying.html }Modifying
    Items and Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  return_item_collection_metrics: return_item_collection_metrics option;
   (**{|
    Determines whether item collection metrics are returned. If set to
    [SIZE], the response includes statistics about item collections, if any,
    that were modified during the operation are returned in the response. If
    set to [NONE] (the default), no statistics are returned.|}*)

  return_consumed_capacity: return_consumed_capacity option;
  
  return_values: return_value option;
   (**{|
    Use [ReturnValues] if you want to get the item attributes as they appear
    before or after they are successfully updated. For [UpdateItem], the
    valid values are:
    
    {ol 
          {- [NONE] - If [ReturnValues] is not specified, or if its value is
             [NONE], then nothing is returned. (This setting is the default
             for [ReturnValues].)
             }
          
          {- [ALL_OLD] - Returns all of the attributes of the item, as they
             appeared before the UpdateItem operation.
             }
          
          {- [UPDATED_OLD] - Returns only the updated attributes, as they
             appeared before the UpdateItem operation.
             }
          
          {- [ALL_NEW] - Returns all of the attributes of the item, as they
             appear after the UpdateItem operation.
             }
          
          {- [UPDATED_NEW] - Returns only the updated attributes, as they
             appear after the UpdateItem operation.
             }
          
    }
    
    There is no additional cost associated with requesting a return value
    aside from the small network and processing overhead of receiving a
    larger response. No read capacity units are consumed.
    
    The values returned are strongly consistent.|}*)

  conditional_operator: conditional_operator option;
   (**{|
    This is a legacy parameter. Use [ConditionExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html }ConditionalOperator}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  expected: (string * expected_attribute_value) list option;
   (**{|
    This is a legacy parameter. Use [ConditionExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html }Expected}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  attribute_updates: (string * attribute_value_update) list option;
   (**{|
    This is a legacy parameter. Use [UpdateExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributeUpdates.html }AttributeUpdates}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  key: (string * attribute_value) list;
   (**{|
    The primary key of the item to be updated. Each element consists of an
    attribute name and a value for that attribute.
    
    For the primary key, you must provide all of the attributes. For example,
    with a simple primary key, you only need to provide a value for the
    partition key. For a composite primary key, you must provide values for
    both the partition key and the sort key.|}*)

  table_name: string;
   (**{|
    The name of the table containing the item to update. You can also provide
    the Amazon Resource Name (ARN) of the table in this parameter.|}*)

}

(**{|
    Operation was rejected because there is an ongoing transaction for the
    item.|}*)
type transaction_conflict_exception = {
  message: string option;
  
}

(**{|
    Throughput exceeds the current throughput quota for your account. Please
    contact {{: https://aws.amazon.com/support }Amazon Web Services Support}
    to request a quota increase.|}*)
type request_limit_exceeded = {
  message: string option;
  
}

(**{|
    Your request rate is too high. The Amazon Web Services SDKs for DynamoDB
    automatically retry requests that receive this exception. Your request is
    eventually successful, unless your retry queue is too large to finish.
    Reduce the frequency of requests and use exponential backoff. For more
    information, go to
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Programming.Errors.html#Programming.Errors.RetryAndBackoff }Error
    Retries and Exponential Backoff} in the {i Amazon DynamoDB Developer
    Guide}.|}*)
type provisioned_throughput_exceeded_exception = {
  message: string option;
   (**{|
    You exceeded your maximum allowed provisioned throughput.|}*)

}

(**{|
    An item collection is too large. This exception is only returned for
    tables that have one or more local secondary indexes.|}*)
type item_collection_size_limit_exceeded_exception = {
  message: string option;
   (**{|
    The total size of an item collection has exceeded the maximum limit of 10
    gigabytes.|}*)

}

(**{|
    A condition specified in the operation could not be evaluated.|}*)
type conditional_check_failed_exception = {
  item: (string * attribute_value) list option;
   (**{|
    Item which caused the [ConditionalCheckFailedException].|}*)

  message: string option;
   (**{|
    The conditional request failed.|}*)

}

(**{|
    Represents the properties of a global secondary index.|}*)
type replica_global_secondary_index_settings_description = {
  provisioned_write_capacity_auto_scaling_settings: auto_scaling_settings_description option;
   (**{|
    Auto scaling settings for a global secondary index replica's write
    capacity units.|}*)

  provisioned_write_capacity_units: int option;
   (**{|
    The maximum number of writes consumed per second before DynamoDB returns
    a [ThrottlingException].|}*)

  provisioned_read_capacity_auto_scaling_settings: auto_scaling_settings_description option;
   (**{|
    Auto scaling settings for a global secondary index replica's read
    capacity units.|}*)

  provisioned_read_capacity_units: int option;
   (**{|
    The maximum number of strongly consistent reads consumed per second
    before DynamoDB returns a [ThrottlingException].|}*)

  index_status: index_status option;
   (**{|
    The current status of the global secondary index:
    
    {ol 
          {- [CREATING] - The global secondary index is being created.
             }
          
          {- [UPDATING] - The global secondary index is being updated.
             }
          
          {- [DELETING] - The global secondary index is being deleted.
             }
          
          {- [ACTIVE] - The global secondary index is ready for use.
             }
          
    }
    |}*)

  index_name: string;
   (**{|
    The name of the global secondary index. The name must be unique among all
    other indexes on this table.|}*)

}

(**{|
    Represents the properties of a replica.|}*)
type replica_settings_description = {
  replica_table_class_summary: table_class_summary option;
  
  replica_global_secondary_index_settings: replica_global_secondary_index_settings_description list option;
   (**{|
    Replica global secondary index settings for the global table.|}*)

  replica_provisioned_write_capacity_auto_scaling_settings: auto_scaling_settings_description option;
   (**{|
    Auto scaling settings for a global table replica's write capacity units.|}*)

  replica_provisioned_write_capacity_units: int option;
   (**{|
    The maximum number of writes consumed per second before DynamoDB returns
    a [ThrottlingException]. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput }Specifying
    Read and Write Requirements} in the {i Amazon DynamoDB Developer Guide}.|}*)

  replica_provisioned_read_capacity_auto_scaling_settings: auto_scaling_settings_description option;
   (**{|
    Auto scaling settings for a global table replica's read capacity units.|}*)

  replica_provisioned_read_capacity_units: int option;
   (**{|
    The maximum number of strongly consistent reads consumed per second
    before DynamoDB returns a [ThrottlingException]. For more information,
    see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput }Specifying
    Read and Write Requirements} in the {i Amazon DynamoDB Developer Guide}.|}*)

  replica_billing_mode_summary: billing_mode_summary option;
   (**{|
    The read/write capacity mode of the replica.|}*)

  replica_status: replica_status option;
   (**{|
    The current state of the Region:
    
    {ol 
          {- [CREATING] - The Region is being created.
             }
          
          {- [UPDATING] - The Region is being updated.
             }
          
          {- [DELETING] - The Region is being deleted.
             }
          
          {- [ACTIVE] - The Region is ready for use.
             }
          
    }
    |}*)

  region_name: string;
   (**{|
    The Region name of the replica.|}*)

}

type update_global_table_settings_output = {
  replica_settings: replica_settings_description list option;
   (**{|
    The Region-specific settings for the global table.|}*)

  global_table_name: string option;
   (**{|
    The name of the global table.|}*)

}

(**{|
    Represents the settings of a global secondary index for a global table
    that will be modified.|}*)
type global_table_global_secondary_index_settings_update = {
  provisioned_write_capacity_auto_scaling_settings_update: auto_scaling_settings_update option;
   (**{|
    Auto scaling settings for managing a global secondary index's write
    capacity units.|}*)

  provisioned_write_capacity_units: int option;
   (**{|
    The maximum number of writes consumed per second before DynamoDB returns
    a [ThrottlingException.]|}*)

  index_name: string;
   (**{|
    The name of the global secondary index. The name must be unique among all
    other indexes on this table.|}*)

}

(**{|
    Represents the settings of a global secondary index for a global table
    that will be modified.|}*)
type replica_global_secondary_index_settings_update = {
  provisioned_read_capacity_auto_scaling_settings_update: auto_scaling_settings_update option;
   (**{|
    Auto scaling settings for managing a global secondary index replica's
    read capacity units.|}*)

  provisioned_read_capacity_units: int option;
   (**{|
    The maximum number of strongly consistent reads consumed per second
    before DynamoDB returns a [ThrottlingException].|}*)

  index_name: string;
   (**{|
    The name of the global secondary index. The name must be unique among all
    other indexes on this table.|}*)

}

(**{|
    Represents the settings for a global table in a Region that will be
    modified.|}*)
type replica_settings_update = {
  replica_table_class: table_class option;
   (**{|
    Replica-specific table class. If not specified, uses the source table's
    table class.|}*)

  replica_global_secondary_index_settings_update: replica_global_secondary_index_settings_update list option;
   (**{|
    Represents the settings of a global secondary index for a global table
    that will be modified.|}*)

  replica_provisioned_read_capacity_auto_scaling_settings_update: auto_scaling_settings_update option;
   (**{|
    Auto scaling settings for managing a global table replica's read capacity
    units.|}*)

  replica_provisioned_read_capacity_units: int option;
   (**{|
    The maximum number of strongly consistent reads consumed per second
    before DynamoDB returns a [ThrottlingException]. For more information,
    see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput }Specifying
    Read and Write Requirements} in the {i Amazon DynamoDB Developer Guide}.|}*)

  region_name: string;
   (**{|
    The Region of the replica to be added.|}*)

}

type update_global_table_settings_input = {
  replica_settings_update: replica_settings_update list option;
   (**{|
    Represents the settings for a global table in a Region that will be
    modified.|}*)

  global_table_global_secondary_index_settings_update: global_table_global_secondary_index_settings_update list option;
   (**{|
    Represents the settings of a global secondary index for a global table
    that will be modified.|}*)

  global_table_provisioned_write_capacity_auto_scaling_settings_update: auto_scaling_settings_update option;
   (**{|
    Auto scaling settings for managing provisioned write capacity for the
    global table.|}*)

  global_table_provisioned_write_capacity_units: int option;
   (**{|
    The maximum number of writes consumed per second before DynamoDB returns
    a [ThrottlingException.]|}*)

  global_table_billing_mode: billing_mode option;
   (**{|
    The billing mode of the global table. If [GlobalTableBillingMode] is not
    specified, the global table defaults to [PROVISIONED] capacity billing
    mode.
    
    {ol 
          {- [PROVISIONED] - We recommend using [PROVISIONED] for predictable
             workloads. [PROVISIONED] sets the billing mode to
             {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html }Provisioned
             capacity mode}.
             }
          
          {- [PAY_PER_REQUEST] - We recommend using [PAY_PER_REQUEST] for
             unpredictable workloads. [PAY_PER_REQUEST] sets the billing mode
             to
             {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html }On-demand
             capacity mode}.
             }
          
    }
    |}*)

  global_table_name: string;
   (**{|
    The name of the global table|}*)

}

(**{|
    The specified replica is no longer part of the global table.|}*)
type replica_not_found_exception = {
  message: string option;
  
}

(**{|
    The operation tried to access a nonexistent index.|}*)
type index_not_found_exception = {
  message: string option;
  
}

(**{|
    The specified global table does not exist.|}*)
type global_table_not_found_exception = {
  message: string option;
  
}

type global_table_status = | UPDATING
  | DELETING
  | ACTIVE
  | CREATING

(**{|
    Contains details about the global table.|}*)
type global_table_description = {
  global_table_name: string option;
   (**{|
    The global table name.|}*)

  global_table_status: global_table_status option;
   (**{|
    The current state of the global table:
    
    {ol 
          {- [CREATING] - The global table is being created.
             }
          
          {- [UPDATING] - The global table is being updated.
             }
          
          {- [DELETING] - The global table is being deleted.
             }
          
          {- [ACTIVE] - The global table is ready for use.
             }
          
    }
    |}*)

  creation_date_time: float option;
   (**{|
    The creation time of the global table.|}*)

  global_table_arn: string option;
   (**{|
    The unique identifier of the global table.|}*)

  replication_group: replica_description list option;
   (**{|
    The Regions where the global table has replicas.|}*)

}

type update_global_table_output = {
  global_table_description: global_table_description option;
   (**{|
    Contains the details of the global table.|}*)

}

(**{|
    Represents a replica to be added.|}*)
type create_replica_action = {
  region_name: string;
   (**{|
    The Region of the replica to be added.|}*)

}

(**{|
    Represents a replica to be removed.|}*)
type delete_replica_action = {
  region_name: string;
   (**{|
    The Region of the replica to be removed.|}*)

}

(**{|
    Represents one of the following:
    
    {ol 
          {- A new replica to be added to an existing global table.
             }
          
          {- New parameters for an existing replica.
             }
          
          {- An existing replica to be removed from an existing global table.
             }
          
    }
    |}*)
type replica_update = {
  delete: delete_replica_action option;
   (**{|
    The name of the existing replica to be removed.|}*)

  create: create_replica_action option;
   (**{|
    The parameters required for creating a replica on an existing global
    table.|}*)

}

type update_global_table_input = {
  replica_updates: replica_update list;
   (**{|
    A list of Regions that should be added or removed from the global table.|}*)

  global_table_name: string;
   (**{|
    The global table name.|}*)

}

(**{|
    A source table with the name [TableName] does not currently exist within
    the subscriber's account or the subscriber is operating in the wrong
    Amazon Web Services Region.|}*)
type table_not_found_exception = {
  message: string option;
  
}

(**{|
    The specified replica is already part of the global table.|}*)
type replica_already_exists_exception = {
  message: string option;
  
}

type contributor_insights_status = | FAILED
  | DISABLED
  | DISABLING
  | ENABLED
  | ENABLING

type update_contributor_insights_output = {
  contributor_insights_status: contributor_insights_status option;
   (**{|
    The status of contributor insights|}*)

  index_name: string option;
   (**{|
    The name of the global secondary index, if applicable.|}*)

  table_name: string option;
   (**{|
    The name of the table.|}*)

}

type contributor_insights_action = | DISABLE
  | ENABLE

type update_contributor_insights_input = {
  contributor_insights_action: contributor_insights_action;
   (**{|
    Represents the contributor insights action.|}*)

  index_name: string option;
   (**{|
    The global secondary index name, if applicable.|}*)

  table_name: string;
   (**{|
    The name of the table. You can also provide the Amazon Resource Name
    (ARN) of the table in this parameter.|}*)

}

type continuous_backups_status = | DISABLED
  | ENABLED

type point_in_time_recovery_status = | DISABLED
  | ENABLED

(**{|
    The description of the point in time settings applied to the table.|}*)
type point_in_time_recovery_description = {
  latest_restorable_date_time: float option;
   (**{|
    [LatestRestorableDateTime] is typically 5 minutes before the current time.|}*)

  earliest_restorable_date_time: float option;
   (**{|
    Specifies the earliest point in time you can restore your table to. You
    can restore your table to any point in time during the last 35 days.|}*)

  point_in_time_recovery_status: point_in_time_recovery_status option;
   (**{|
    The current state of point in time recovery:
    
    {ol 
          {- [ENABLED] - Point in time recovery is enabled.
             }
          
          {- [DISABLED] - Point in time recovery is disabled.
             }
          
    }
    |}*)

}

(**{|
    Represents the continuous backups and point in time recovery settings on
    the table.|}*)
type continuous_backups_description = {
  point_in_time_recovery_description: point_in_time_recovery_description option;
   (**{|
    The description of the point in time recovery settings applied to the
    table.|}*)

  continuous_backups_status: continuous_backups_status;
   (**{|
    [ContinuousBackupsStatus] can be one of the following states: ENABLED,
    DISABLED|}*)

}

type update_continuous_backups_output = {
  continuous_backups_description: continuous_backups_description option;
   (**{|
    Represents the continuous backups and point in time recovery settings on
    the table.|}*)

}

(**{|
    Represents the settings used to enable point in time recovery.|}*)
type point_in_time_recovery_specification = {
  point_in_time_recovery_enabled: bool;
   (**{|
    Indicates whether point in time recovery is enabled (true) or disabled
    (false) on the table.|}*)

}

type update_continuous_backups_input = {
  point_in_time_recovery_specification: point_in_time_recovery_specification;
   (**{|
    Represents the settings used to enable point in time recovery.|}*)

  table_name: string;
   (**{|
    The name of the table. You can also provide the Amazon Resource Name
    (ARN) of the table in this parameter.|}*)

}

(**{|
    Backups have not yet been enabled for this table.|}*)
type continuous_backups_unavailable_exception = {
  message: string option;
  
}

(**{|
    Represents a request to perform an [UpdateItem] operation.|}*)
type update = {
  return_values_on_condition_check_failure: return_values_on_condition_check_failure option;
   (**{|
    Use [ReturnValuesOnConditionCheckFailure] to get the item attributes if
    the [Update] condition fails. For [ReturnValuesOnConditionCheckFailure],
    the valid values are: NONE and ALL_OLD.|}*)

  expression_attribute_values: (string * attribute_value) list option;
   (**{|
    One or more values that can be substituted in an expression.|}*)

  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression.|}*)

  condition_expression: string option;
   (**{|
    A condition that must be satisfied in order for a conditional update to
    succeed.|}*)

  table_name: string;
   (**{|
    Name of the table for the [UpdateItem] request. You can also provide the
    Amazon Resource Name (ARN) of the table in this parameter.|}*)

  update_expression: string;
   (**{|
    An expression that defines one or more attributes to be updated, the
    action to be performed on them, and new value(s) for them.|}*)

  key: (string * attribute_value) list;
   (**{|
    The primary key of the item to be updated. Each element consists of an
    attribute name and a value for that attribute.|}*)

}

type untag_resource_input = {
  tag_keys: string list;
   (**{|
    A list of tag keys. Existing tags of the resource whose keys are members
    of this list will be removed from the DynamoDB resource.|}*)

  resource_arn: string;
   (**{|
    The DynamoDB resource that the tags will be removed from. This value is
    an Amazon Resource Name (ARN).|}*)

}

(**{|
    The transaction with the given request token is already in progress.
    
    Recommended Settings
    
    This is a general recommendation for handling the
    [TransactionInProgressException]. These settings help ensure that the
    client retries will trigger completion of the ongoing
    [TransactWriteItems] request.
    
    {ol 
          {- Set [clientExecutionTimeout] to a value that allows at least one
             retry to be processed after 5 seconds have elapsed since the
             first attempt for the [TransactWriteItems] operation.
             }
          
          {- Set [socketTimeout] to a value a little lower than the
             [requestTimeout] setting.
             }
          
          {- [requestTimeout] should be set based on the time taken for the
             individual retries of a single HTTP request for your use case,
             but setting it to 1 second or higher should work well to reduce
             chances of retries and [TransactionInProgressException] errors.
             }
          
          {- Use exponential backoff when retrying and tune backoff if
             needed.
             }
          
    }
    
    Assuming
    {{: https://github.com/aws/aws-sdk-java/blob/fd409dee8ae23fb8953e0bb4dbde65536a7e0514/aws-java-sdk-core/src/main/java/com/amazonaws/retry/PredefinedRetryPolicies.java#L97 }default
    retry policy}, example timeout settings based on the guidelines above are
    as follows:
    
    Example timeline:
    
    {ol 
          {- 0-1000 first attempt
             }
          
          {- 1000-1500 first sleep/delay (default retry policy uses 500 ms as
             base delay for 4xx errors)
             }
          
          {- 1500-2500 second attempt
             }
          
          {- 2500-3500 second sleep/delay (500 * 2, exponential backoff)
             }
          
          {- 3500-4500 third attempt
             }
          
          {- 4500-6500 third sleep/delay (500 * 2^2)
             }
          
          {- 6500-7500 fourth attempt (this can trigger inline recovery since
             5 seconds have elapsed since the first attempt reached TC)
             }
          
    }
    |}*)
type transaction_in_progress_exception = {
  message: string option;
  
}

(**{|
    An ordered list of errors for each item in the request which caused the
    transaction to get cancelled. The values of the list are ordered
    according to the ordering of the [TransactWriteItems] request parameter.
    If no error occurred for the associated item an error with a Null code
    and Null message will be present.|}*)
type cancellation_reason = {
  message: string option;
   (**{|
    Cancellation reason message description.|}*)

  code: string option;
   (**{|
    Status code for the result of the cancelled transaction.|}*)

  item: (string * attribute_value) list option;
   (**{|
    Item in the request which caused the transaction to get cancelled.|}*)

}

(**{|
    The entire transaction request was canceled.
    
    DynamoDB cancels a [TransactWriteItems] request under the following
    circumstances:
    
    {ol 
          {- A condition in one of the condition expressions is not met.
             }
          
          {- A table in the [TransactWriteItems] request is in a different
             account or region.
             }
          
          {- More than one action in the [TransactWriteItems] operation
             targets the same item.
             }
          
          {- There is insufficient provisioned capacity for the transaction
             to be completed.
             }
          
          {- An item size becomes too large (larger than 400 KB), or a local
             secondary index (LSI) becomes too large, or a similar validation
             error occurs because of changes made by the transaction.
             }
          
          {- There is a user error, such as an invalid data format.
             }
          
          {- There is an ongoing [TransactWriteItems] operation that
             conflicts with a concurrent [TransactWriteItems] request. In
             this case the [TransactWriteItems] operation fails with a
             [TransactionCanceledException].
             }
          
    }
    
    DynamoDB cancels a [TransactGetItems] request under the following
    circumstances:
    
    {ol 
          {- There is an ongoing [TransactGetItems] operation that conflicts
             with a concurrent [PutItem], [UpdateItem], [DeleteItem] or
             [TransactWriteItems] request. In this case the
             [TransactGetItems] operation fails with a
             [TransactionCanceledException].
             }
          
          {- A table in the [TransactGetItems] request is in a different
             account or region.
             }
          
          {- There is insufficient provisioned capacity for the transaction
             to be completed.
             }
          
          {- There is a user error, such as an invalid data format.
             }
          
    }
    
    If using Java, DynamoDB lists the cancellation reasons on the
    [CancellationReasons] property. This property is not set for other
    languages. Transaction cancellation reasons are ordered in the order of
    requested items, if an item has no error it will have [None] code and
    [Null] message.
    
    Cancellation reason codes and possible error messages:
    
    {ol 
          {- No Errors:
             
          {ol 
                {- Code: [None]
                   }
                
                {- Message: [null]
                   }
                
          }
          }
          
          {- Conditional Check Failed:
             
          {ol 
                {- Code: [ConditionalCheckFailed]
                   }
                
                {- Message: The conditional request failed.
                   }
                
          }
          }
          
          {- Item Collection Size Limit Exceeded:
             
          {ol 
                {- Code: [ItemCollectionSizeLimitExceeded]
                   }
                
                {- Message: Collection size exceeded.
                   }
                
          }
          }
          
          {- Transaction Conflict:
             
          {ol 
                {- Code: [TransactionConflict]
                   }
                
                {- Message: Transaction is ongoing for the item.
                   }
                
          }
          }
          
          {- Provisioned Throughput Exceeded:
             
          {ol 
                {- Code: [ProvisionedThroughputExceeded]
                   }
                
                {- Messages:
                   
                {ol 
                      {- The level of configured provisioned throughput for
                         the table was exceeded. Consider increasing your
                         provisioning level with the UpdateTable API.
                         
                      This Message is received when provisioned throughput is
                      exceeded is on a provisioned DynamoDB table.
                      }
                      
                      {- The level of configured provisioned throughput for
                         one or more global secondary indexes of the table
                         was exceeded. Consider increasing your provisioning
                         level for the under-provisioned global secondary
                         indexes with the UpdateTable API.
                         
                      This message is returned when provisioned throughput is
                      exceeded is on a provisioned GSI.
                      }
                      
                }
                }
                
          }
          }
          
          {- Throttling Error:
             
          {ol 
                {- Code: [ThrottlingError]
                   }
                
                {- Messages:
                   
                {ol 
                      {- Throughput exceeds the current capacity of your
                         table or index. DynamoDB is automatically scaling
                         your table or index so please try again shortly. If
                         exceptions persist, check if you have a hot key:
                         https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-partition-key-design.html.
                         
                         
                      This message is returned when writes get throttled on
                      an On-Demand table as DynamoDB is automatically scaling
                      the table.
                      }
                      
                      {- Throughput exceeds the current capacity for one or
                         more global secondary indexes. DynamoDB is
                         automatically scaling your index so please try again
                         shortly.
                         
                      This message is returned when writes get throttled on
                      an On-Demand GSI as DynamoDB is automatically scaling
                      the GSI.
                      }
                      
                }
                }
                
          }
          }
          
          {- Validation Error:
             
          {ol 
                {- Code: [ValidationError]
                   }
                
                {- Messages:
                   
                {ol 
                      {- One or more parameter values were invalid.
                         }
                      
                      {- The update expression attempted to update the
                         secondary index key beyond allowed size limits.
                         }
                      
                      {- The update expression attempted to update the
                         secondary index key to unsupported type.
                         }
                      
                      {- An operand in the update expression has an incorrect
                         data type.
                         }
                      
                      {- Item size to update has exceeded the maximum allowed
                         size.
                         }
                      
                      {- Number overflow. Attempting to store a number with
                         magnitude larger than supported range.
                         }
                      
                      {- Type mismatch for attribute to update.
                         }
                      
                      {- Nesting Levels have exceeded supported limits.
                         }
                      
                      {- The document path provided in the update expression
                         is invalid for update.
                         }
                      
                      {- The provided expression refers to an attribute that
                         does not exist in the item.
                         }
                      
                }
                }
                
          }
          }
          
    }
    |}*)
type transaction_canceled_exception = {
  cancellation_reasons: cancellation_reason list option;
   (**{|
    A list of cancellation reasons.|}*)

  message: string option;
  
}

type transact_write_items_output = {
  item_collection_metrics: (string * item_collection_metrics list) list option;
   (**{|
    A list of tables that were processed by [TransactWriteItems] and, for
    each table, information about any item collections that were affected by
    individual [UpdateItem], [PutItem], or [DeleteItem] operations.|}*)

  consumed_capacity: consumed_capacity list option;
   (**{|
    The capacity units consumed by the entire [TransactWriteItems] operation.
    The values of the list are ordered according to the ordering of the
    [TransactItems] request parameter.|}*)

}

(**{|
    Represents a request to perform a check that an item exists or to check
    the condition of specific attributes of the item.|}*)
type condition_check = {
  return_values_on_condition_check_failure: return_values_on_condition_check_failure option;
   (**{|
    Use [ReturnValuesOnConditionCheckFailure] to get the item attributes if
    the [ConditionCheck] condition fails. For
    [ReturnValuesOnConditionCheckFailure], the valid values are: NONE and
    ALL_OLD.|}*)

  expression_attribute_values: (string * attribute_value) list option;
   (**{|
    One or more values that can be substituted in an expression. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ConditionExpressions.html }Condition
    expressions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression. For
    more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionAttributeNames.html }Expression
    attribute names} in the {i Amazon DynamoDB Developer Guide}.|}*)

  condition_expression: string;
   (**{|
    A condition that must be satisfied in order for a conditional update to
    succeed. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ConditionExpressions.html }Condition
    expressions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  table_name: string;
   (**{|
    Name of the table for the check item request. You can also provide the
    Amazon Resource Name (ARN) of the table in this parameter.|}*)

  key: (string * attribute_value) list;
   (**{|
    The primary key of the item to be checked. Each element consists of an
    attribute name and a value for that attribute.|}*)

}

(**{|
    Represents a request to perform a [PutItem] operation.|}*)
type put = {
  return_values_on_condition_check_failure: return_values_on_condition_check_failure option;
   (**{|
    Use [ReturnValuesOnConditionCheckFailure] to get the item attributes if
    the [Put] condition fails. For [ReturnValuesOnConditionCheckFailure], the
    valid values are: NONE and ALL_OLD.|}*)

  expression_attribute_values: (string * attribute_value) list option;
   (**{|
    One or more values that can be substituted in an expression.|}*)

  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression.|}*)

  condition_expression: string option;
   (**{|
    A condition that must be satisfied in order for a conditional update to
    succeed.|}*)

  table_name: string;
   (**{|
    Name of the table in which to write the item. You can also provide the
    Amazon Resource Name (ARN) of the table in this parameter.|}*)

  item: (string * attribute_value) list;
   (**{|
    A map of attribute name to attribute values, representing the primary key
    of the item to be written by [PutItem]. All of the table's primary key
    attributes must be specified, and their data types must match those of
    the table's key schema. If any attributes are present in the item that
    are part of an index key schema for the table, their types must match the
    index key schema.|}*)

}

(**{|
    Represents a request to perform a [DeleteItem] operation.|}*)
type delete = {
  return_values_on_condition_check_failure: return_values_on_condition_check_failure option;
   (**{|
    Use [ReturnValuesOnConditionCheckFailure] to get the item attributes if
    the [Delete] condition fails. For [ReturnValuesOnConditionCheckFailure],
    the valid values are: NONE and ALL_OLD.|}*)

  expression_attribute_values: (string * attribute_value) list option;
   (**{|
    One or more values that can be substituted in an expression.|}*)

  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression.|}*)

  condition_expression: string option;
   (**{|
    A condition that must be satisfied in order for a conditional delete to
    succeed.|}*)

  table_name: string;
   (**{|
    Name of the table in which the item to be deleted resides. You can also
    provide the Amazon Resource Name (ARN) of the table in this parameter.|}*)

  key: (string * attribute_value) list;
   (**{|
    The primary key of the item to be deleted. Each element consists of an
    attribute name and a value for that attribute.|}*)

}

(**{|
    A list of requests that can perform update, put, delete, or check
    operations on multiple items in one or more tables atomically.|}*)
type transact_write_item = {
  update: update option;
   (**{|
    A request to perform an [UpdateItem] operation.|}*)

  delete: delete option;
   (**{|
    A request to perform a [DeleteItem] operation.|}*)

  put: put option;
   (**{|
    A request to perform a [PutItem] operation.|}*)

  condition_check: condition_check option;
   (**{|
    A request to perform a check item operation.|}*)

}

type transact_write_items_input = {
  client_request_token: string option;
   (**{|
    Providing a [ClientRequestToken] makes the call to [TransactWriteItems]
    idempotent, meaning that multiple identical calls have the same effect as
    one single call.
    
    Although multiple identical calls using the same client request token
    produce the same result on the server (no side effects), the responses to
    the calls might not be the same. If the [ReturnConsumedCapacity]
    parameter is set, then the initial [TransactWriteItems] call returns the
    amount of write capacity units consumed in making the changes. Subsequent
    [TransactWriteItems] calls with the same client token return the number
    of read capacity units consumed in reading the item.
    
    A client request token is valid for 10 minutes after the first request
    that uses it is completed. After 10 minutes, any request with the same
    client token is treated as a new request. Do not resubmit the same
    request with the same client token for more than 10 minutes, or the
    result might not be idempotent.
    
    If you submit a request with the same client token but a change in other
    parameters within the 10-minute idempotency window, DynamoDB returns an
    [IdempotentParameterMismatch] exception.|}*)

  return_item_collection_metrics: return_item_collection_metrics option;
   (**{|
    Determines whether item collection metrics are returned. If set to
    [SIZE], the response includes statistics about item collections (if any),
    that were modified during the operation and are returned in the response.
    If set to [NONE] (the default), no statistics are returned.|}*)

  return_consumed_capacity: return_consumed_capacity option;
  
  transact_items: transact_write_item list;
   (**{|
    An ordered array of up to 100 [TransactWriteItem] objects, each of which
    contains a [ConditionCheck], [Put], [Update], or [Delete] object. These
    can operate on items in different tables, but the tables must reside in
    the same Amazon Web Services account and Region, and no two of them can
    operate on the same item.|}*)

}

(**{|
    DynamoDB rejected the request because you retried a request with a
    different payload but with an idempotent token that was already used.|}*)
type idempotent_parameter_mismatch_exception = {
  message: string option;
  
}

(**{|
    Details for the requested item.|}*)
type item_response = {
  item: (string * attribute_value) list option;
   (**{|
    Map of attribute data consisting of the data type and attribute value.|}*)

}

type transact_get_items_output = {
  responses: item_response list option;
   (**{|
    An ordered array of up to 100 [ItemResponse] objects, each of which
    corresponds to the [TransactGetItem] object in the same position in the
    {i TransactItems} array. Each [ItemResponse] object contains a Map of the
    name-value pairs that are the projected attributes of the requested item.
    
    If a requested item could not be retrieved, the corresponding
    [ItemResponse] object is Null, or if the requested item has no projected
    attributes, the corresponding [ItemResponse] object is an empty Map.|}*)

  consumed_capacity: consumed_capacity list option;
   (**{|
    If the {i ReturnConsumedCapacity} value was [TOTAL], this is an array of
    [ConsumedCapacity] objects, one for each table addressed by
    [TransactGetItem] objects in the {i TransactItems} parameter. These
    [ConsumedCapacity] objects report the read-capacity units consumed by the
    [TransactGetItems] call in that table.|}*)

}

(**{|
    Specifies an item and related attribute values to retrieve in a
    [TransactGetItem] object.|}*)
type get = {
  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in the
    ProjectionExpression parameter.|}*)

  projection_expression: string option;
   (**{|
    A string that identifies one or more attributes of the specified item to
    retrieve from the table. The attributes in the expression must be
    separated by commas. If no attribute names are specified, then all
    attributes of the specified item are returned. If any of the requested
    attributes are not found, they do not appear in the result.|}*)

  table_name: string;
   (**{|
    The name of the table from which to retrieve the specified item. You can
    also provide the Amazon Resource Name (ARN) of the table in this
    parameter.|}*)

  key: (string * attribute_value) list;
   (**{|
    A map of attribute names to [AttributeValue] objects that specifies the
    primary key of the item to retrieve.|}*)

}

(**{|
    Specifies an item to be retrieved as part of the transaction.|}*)
type transact_get_item = {
  get: get;
   (**{|
    Contains the primary key that identifies the item to get, together with
    the name of the table that contains the item, and optionally the specific
    attributes of the item to retrieve.|}*)

}

type transact_get_items_input = {
  return_consumed_capacity: return_consumed_capacity option;
   (**{|
    A value of [TOTAL] causes consumed capacity information to be returned,
    and a value of [NONE] prevents that information from being returned. No
    other value is valid.|}*)

  transact_items: transact_get_item list;
   (**{|
    An ordered array of up to 100 [TransactGetItem] objects, each of which
    contains a [Get] structure.|}*)

}

type time_to_live_status = | DISABLED
  | ENABLED
  | DISABLING
  | ENABLING

(**{|
    The description of the Time to Live (TTL) status on the specified table.|}*)
type time_to_live_description = {
  attribute_name: string option;
   (**{|
    The name of the TTL attribute for items in the table.|}*)

  time_to_live_status: time_to_live_status option;
   (**{|
    The TTL status for the table.|}*)

}

(**{|
    Describes a tag. A tag is a key-value pair. You can add up to 50 tags to
    a single DynamoDB table.
    
    Amazon Web Services-assigned tag names and values are automatically
    assigned the [aws:] prefix, which the user cannot assign. Amazon Web
    Services-assigned tag names do not count towards the tag limit of 50.
    User-assigned tag names have the prefix [user:] in the Cost Allocation
    Report. You cannot backdate the application of a tag.
    
    For an overview on tagging DynamoDB resources, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html }Tagging
    for DynamoDB} in the {i Amazon DynamoDB Developer Guide}.|}*)
type tag = {
  value: string;
   (**{|
    The value of the tag. Tag values are case-sensitive and can be null.|}*)

  key: string;
   (**{|
    The key of the tag. Tag keys are case sensitive. Each DynamoDB table can
    only have up to one tag with the same key. If you try to add an existing
    tag (same key), the existing tag value will be updated to the new value.|}*)

}

type tag_resource_input = {
  tags: tag list;
   (**{|
    The tags to be assigned to the Amazon DynamoDB resource.|}*)

  resource_arn: string;
   (**{|
    Identifies the Amazon DynamoDB resource to which tags should be added.
    This value is an Amazon Resource Name (ARN).|}*)

}

(**{|
    A target table with the specified name is either being created or deleted.|}*)
type table_in_use_exception = {
  message: string option;
  
}

(**{|
    Represents the properties of a global secondary index.|}*)
type global_secondary_index = {
  on_demand_throughput: on_demand_throughput option;
   (**{|
    The maximum number of read and write units for the specified global
    secondary index. If you use this parameter, you must specify
    [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.|}*)

  provisioned_throughput: provisioned_throughput option;
   (**{|
    Represents the provisioned throughput settings for the specified global
    secondary index.
    
    For current minimum and maximum provisioned throughput values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html }Service,
    Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.|}*)

  projection: projection;
   (**{|
    Represents attributes that are copied (projected) from the table into the
    global secondary index. These are in addition to the primary key
    attributes and index key attributes, which are automatically projected.|}*)

  key_schema: key_schema_element list;
   (**{|
    The complete key schema for a global secondary index, which consists of
    one or more pairs of attribute names and key types:
    
    {ol 
          {- [HASH] - partition key
             }
          
          {- [RANGE] - sort key
             }
          
    }
    
    The partition key of an item is also known as its {i hash attribute}. The
    term "hash attribute" derives from DynamoDB's usage of an internal hash
    function to evenly distribute data items across partitions, based on
    their partition key values.
    
    The sort key of an item is also known as its {i range attribute}. The
    term "range attribute" derives from the way DynamoDB stores items with
    the same partition key physically close together, in sorted order by the
    sort key value.
    |}*)

  index_name: string;
   (**{|
    The name of the global secondary index. The name must be unique among all
    other indexes on this table.|}*)

}

(**{|
    The parameters for the table created as part of the import operation.|}*)
type table_creation_parameters = {
  global_secondary_indexes: global_secondary_index list option;
   (**{|
    The Global Secondary Indexes (GSI) of the table to be created as part of
    the import operation.|}*)

  sse_specification: sse_specification option;
  
  on_demand_throughput: on_demand_throughput option;
  
  provisioned_throughput: provisioned_throughput option;
  
  billing_mode: billing_mode option;
   (**{|
    The billing mode for provisioning the table created as part of the import
    operation.|}*)

  key_schema: key_schema_element list;
   (**{|
    The primary key and option sort key of the table created as part of the
    import operation.|}*)

  attribute_definitions: attribute_definition list;
   (**{|
    The attributes of the table created as part of the import operation.|}*)

  table_name: string;
   (**{|
    The name of the table created as part of the import operation.|}*)

}

(**{|
    A target table with the specified name already exists.|}*)
type table_already_exists_exception = {
  message: string option;
  
}

(**{|
    Represents the properties of a local secondary index for the table when
    the backup was created.|}*)
type local_secondary_index_info = {
  projection: projection option;
   (**{|
    Represents attributes that are copied (projected) from the table into the
    global secondary index. These are in addition to the primary key
    attributes and index key attributes, which are automatically projected.|}*)

  key_schema: key_schema_element list option;
   (**{|
    The complete key schema for a local secondary index, which consists of
    one or more pairs of attribute names and key types:
    
    {ol 
          {- [HASH] - partition key
             }
          
          {- [RANGE] - sort key
             }
          
    }
    
    The partition key of an item is also known as its {i hash attribute}. The
    term "hash attribute" derives from DynamoDB's usage of an internal hash
    function to evenly distribute data items across partitions, based on
    their partition key values.
    
    The sort key of an item is also known as its {i range attribute}. The
    term "range attribute" derives from the way DynamoDB stores items with
    the same partition key physically close together, in sorted order by the
    sort key value.
    |}*)

  index_name: string option;
   (**{|
    Represents the name of the local secondary index.|}*)

}

(**{|
    Represents the properties of a global secondary index for the table when
    the backup was created.|}*)
type global_secondary_index_info = {
  on_demand_throughput: on_demand_throughput option;
  
  provisioned_throughput: provisioned_throughput option;
   (**{|
    Represents the provisioned throughput settings for the specified global
    secondary index.|}*)

  projection: projection option;
   (**{|
    Represents attributes that are copied (projected) from the table into the
    global secondary index. These are in addition to the primary key
    attributes and index key attributes, which are automatically projected.|}*)

  key_schema: key_schema_element list option;
   (**{|
    The complete key schema for a global secondary index, which consists of
    one or more pairs of attribute names and key types:
    
    {ol 
          {- [HASH] - partition key
             }
          
          {- [RANGE] - sort key
             }
          
    }
    
    The partition key of an item is also known as its {i hash attribute}. The
    term "hash attribute" derives from DynamoDB's usage of an internal hash
    function to evenly distribute data items across partitions, based on
    their partition key values.
    
    The sort key of an item is also known as its {i range attribute}. The
    term "range attribute" derives from the way DynamoDB stores items with
    the same partition key physically close together, in sorted order by the
    sort key value.
    |}*)

  index_name: string option;
   (**{|
    The name of the global secondary index.|}*)

}

(**{|
    Contains the details of the features enabled on the table when the backup
    was created. For example, LSIs, GSIs, streams, TTL.|}*)
type source_table_feature_details = {
  sse_description: sse_description option;
   (**{|
    The description of the server-side encryption status on the table when
    the backup was created.|}*)

  time_to_live_description: time_to_live_description option;
   (**{|
    Time to Live settings on the table when the backup was created.|}*)

  stream_description: stream_specification option;
   (**{|
    Stream settings on the table when the backup was created.|}*)

  global_secondary_indexes: global_secondary_index_info list option;
   (**{|
    Represents the GSI properties for the table when the backup was created.
    It includes the IndexName, KeySchema, Projection, and
    ProvisionedThroughput for the GSIs on the table at the time of backup.|}*)

  local_secondary_indexes: local_secondary_index_info list option;
   (**{|
    Represents the LSI properties for the table when the backup was created.
    It includes the IndexName, KeySchema and Projection for the LSIs on the
    table at the time of backup.|}*)

}

(**{|
    Contains the details of the table when the backup was created.|}*)
type source_table_details = {
  billing_mode: billing_mode option;
   (**{|
    Controls how you are charged for read and write throughput and how you
    manage capacity. This setting can be changed later.
    
    {ol 
          {- [PROVISIONED] - Sets the read/write capacity mode to
             [PROVISIONED]. We recommend using [PROVISIONED] for predictable
             workloads.
             }
          
          {- [PAY_PER_REQUEST] - Sets the read/write capacity mode to
             [PAY_PER_REQUEST]. We recommend using [PAY_PER_REQUEST] for
             unpredictable workloads.
             }
          
    }
    |}*)

  item_count: int option;
   (**{|
    Number of items in the table. Note that this is an approximate value.|}*)

  on_demand_throughput: on_demand_throughput option;
  
  provisioned_throughput: provisioned_throughput;
   (**{|
    Read IOPs and Write IOPS on the table when the backup was created.|}*)

  table_creation_date_time: float;
   (**{|
    Time when the source table was created.|}*)

  key_schema: key_schema_element list;
   (**{|
    Schema of the table.|}*)

  table_size_bytes: int option;
   (**{|
    Size of the table in bytes. Note that this is an approximate value.|}*)

  table_arn: string option;
   (**{|
    ARN of the table for which backup was created.|}*)

  table_id: string;
   (**{|
    Unique identifier for the table for which the backup was created.|}*)

  table_name: string;
   (**{|
    The name of the table for which the backup was created.|}*)

}

type select = | COUNT
  | SPECIFIC_ATTRIBUTES
  | ALL_PROJECTED_ATTRIBUTES
  | ALL_ATTRIBUTES

(**{|
    Represents the output of a [Scan] operation.|}*)
type scan_output = {
  consumed_capacity: consumed_capacity option;
   (**{|
    The capacity units consumed by the [Scan] operation. The data returned
    includes the total provisioned throughput consumed, along with statistics
    for the table and any indexes involved in the operation.
    [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity]
    parameter was specified. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption }Capacity
    unit consumption for read operations} in the {i Amazon DynamoDB Developer
    Guide}.|}*)

  last_evaluated_key: (string * attribute_value) list option;
   (**{|
    The primary key of the item where the operation stopped, inclusive of the
    previous result set. Use this value to start a new operation, excluding
    this value in the new request.
    
    If [LastEvaluatedKey] is empty, then the "last page" of results has been
    processed and there is no more data to be retrieved.
    
    If [LastEvaluatedKey] is not empty, it does not necessarily mean that
    there is more data in the result set. The only way to know when you have
    reached the end of the result set is when [LastEvaluatedKey] is empty.|}*)

  scanned_count: int option;
   (**{|
    The number of items evaluated, before any [ScanFilter] is applied. A high
    [ScannedCount] value with few, or no, [Count] results indicates an
    inefficient [Scan] operation. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count }Count
    and ScannedCount} in the {i Amazon DynamoDB Developer Guide}.
    
    If you did not use a filter in the request, then [ScannedCount] is the
    same as [Count].|}*)

  count: int option;
   (**{|
    The number of items in the response.
    
    If you set [ScanFilter] in the request, then [Count] is the number of
    items returned after the filter was applied, and [ScannedCount] is the
    number of matching items before the filter was applied.
    
    If you did not use a filter in the request, then [Count] is the same as
    [ScannedCount].|}*)

  items: (string * attribute_value) list list option;
   (**{|
    An array of item attributes that match the scan criteria. Each element in
    this array consists of an attribute name and the value for that
    attribute.|}*)

}

(**{|
    Represents the selection criteria for a [Query] or [Scan] operation:
    
    {ol 
          {- For a [Query] operation, [Condition] is used for specifying the
             [KeyConditions] to use when querying a table or an index. For
             [KeyConditions], only the following comparison operators are
             supported:
             
          [EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN]
          
          [Condition] is also used in a [QueryFilter], which evaluates the
          query results and returns only the desired values.
          }
          
          {- For a [Scan] operation, [Condition] is used in a [ScanFilter],
             which evaluates the scan results and returns only the desired
             values.
             }
          
    }
    |}*)
type condition = {
  comparison_operator: comparison_operator;
   (**{|
    A comparator for evaluating attributes. For example, equals, greater
    than, less than, etc.
    
    The following comparison operators are available:
    
    [EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS
    | BEGINS_WITH | IN | BETWEEN]
    
    The following are descriptions of each comparison operator.
    
    {ol 
          {- [EQ] : Equal. [EQ] is supported for all data types, including
             lists and maps.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, Binary, String Set, Number Set, or Binary
          Set. If an item contains an [AttributeValue] element of a different
          type than the one provided in the request, the value does not
          match. For example, [{"S":"6"}] does not equal [{"N":"6"}]. Also,
          [{"N":"6"}] does not equal [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [NE] : Not equal. [NE] is supported for all data types,
             including lists and maps.
             
          [AttributeValueList] can contain only one [AttributeValue] of type
          String, Number, Binary, String Set, Number Set, or Binary Set. If
          an item contains an [AttributeValue] of a different type than the
          one provided in the request, the value does not match. For example,
          [{"S":"6"}] does not equal [{"N":"6"}]. Also, [{"N":"6"}] does not
          equal [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [LE] : Less than or equal.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, or Binary (not a set type). If an item
          contains an [AttributeValue] element of a different type than the
          one provided in the request, the value does not match. For example,
          [{"S":"6"}] does not equal [{"N":"6"}]. Also, [{"N":"6"}] does not
          compare to [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [LT] : Less than.
             
          [AttributeValueList] can contain only one [AttributeValue] of type
          String, Number, or Binary (not a set type). If an item contains an
          [AttributeValue] element of a different type than the one provided
          in the request, the value does not match. For example, [{"S":"6"}]
          does not equal [{"N":"6"}]. Also, [{"N":"6"}] does not compare to
          [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [GE] : Greater than or equal.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, or Binary (not a set type). If an item
          contains an [AttributeValue] element of a different type than the
          one provided in the request, the value does not match. For example,
          [{"S":"6"}] does not equal [{"N":"6"}]. Also, [{"N":"6"}] does not
          compare to [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [GT] : Greater than.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, or Binary (not a set type). If an item
          contains an [AttributeValue] element of a different type than the
          one provided in the request, the value does not match. For example,
          [{"S":"6"}] does not equal [{"N":"6"}]. Also, [{"N":"6"}] does not
          compare to [{"NS":["6", "2", "1"]}].
          
          
          }
          
          {- [NOT_NULL] : The attribute exists. [NOT_NULL] is supported for
             all data types, including lists and maps.
             
          This operator tests for the existence of an attribute, not its data
          type. If the data type of attribute "[a]" is null, and you evaluate
          it using [NOT_NULL], the result is a Boolean [true]. This result is
          because the attribute "[a]" exists; its data type is not relevant
          to the [NOT_NULL] comparison operator.
          }
          
          {- [NULL] : The attribute does not exist. [NULL] is supported for
             all data types, including lists and maps.
             
          This operator tests for the nonexistence of an attribute, not its
          data type. If the data type of attribute "[a]" is null, and you
          evaluate it using [NULL], the result is a Boolean [false]. This is
          because the attribute "[a]" exists; its data type is not relevant
          to the [NULL] comparison operator.
          }
          
          {- [CONTAINS] : Checks for a subsequence, or value in a set.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, or Binary (not a set type). If the target
          attribute of the comparison is of type String, then the operator
          checks for a substring match. If the target attribute of the
          comparison is of type Binary, then the operator looks for a
          subsequence of the target that matches the input. If the target
          attribute of the comparison is a set ("[SS]", "[NS]", or "[BS]"),
          then the operator evaluates to true if it finds an exact match with
          any member of the set.
          
          CONTAINS is supported for lists: When evaluating "[a CONTAINS b]",
          "[a]" can be a list; however, "[b]" cannot be a set, a map, or a
          list.
          }
          
          {- [NOT_CONTAINS] : Checks for absence of a subsequence, or absence
             of a value in a set.
             
          [AttributeValueList] can contain only one [AttributeValue] element
          of type String, Number, or Binary (not a set type). If the target
          attribute of the comparison is a String, then the operator checks
          for the absence of a substring match. If the target attribute of
          the comparison is Binary, then the operator checks for the absence
          of a subsequence of the target that matches the input. If the
          target attribute of the comparison is a set ("[SS]", "[NS]", or
          "[BS]"), then the operator evaluates to true if it {i does not}
          find an exact match with any member of the set.
          
          NOT_CONTAINS is supported for lists: When evaluating "[a NOT
          CONTAINS b]", "[a]" can be a list; however, "[b]" cannot be a set,
          a map, or a list.
          }
          
          {- [BEGINS_WITH] : Checks for a prefix.
             
          [AttributeValueList] can contain only one [AttributeValue] of type
          String or Binary (not a Number or a set type). The target attribute
          of the comparison must be of type String or Binary (not a Number or
          a set type).
          
          
          }
          
          {- [IN] : Checks for matching elements in a list.
             
          [AttributeValueList] can contain one or more [AttributeValue]
          elements of type String, Number, or Binary. These attributes are
          compared against an existing attribute of an item. If any elements
          of the input are equal to the item attribute, the expression
          evaluates to true.
          }
          
          {- [BETWEEN] : Greater than or equal to the first value, and less
             than or equal to the second value.
             
          [AttributeValueList] must contain two [AttributeValue] elements of
          the same type, either String, Number, or Binary (not a set type). A
          target attribute matches if the target value is greater than, or
          equal to, the first element and less than, or equal to, the second
          element. If an item contains an [AttributeValue] element of a
          different type than the one provided in the request, the value does
          not match. For example, [{"S":"6"}] does not compare to
          [{"N":"6"}]. Also, [{"N":"6"}] does not compare to [{"NS":["6",
          "2", "1"]}]
          }
          
    }
    
    For usage examples of [AttributeValueList] and [ComparisonOperator], see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html }Legacy
    Conditional Parameters} in the {i Amazon DynamoDB Developer Guide}.|}*)

  attribute_value_list: attribute_value list option;
   (**{|
    One or more values to evaluate against the supplied attribute. The number
    of values in the list depends on the [ComparisonOperator] being used.
    
    For type Number, value comparisons are numeric.
    
    String value comparisons for greater than, equals, or less than are based
    on ASCII character code values. For example, [a] is greater than [A], and
    [a] is greater than [B]. For a list of code values, see
    {{: http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters }http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}.
    
    
    For Binary, DynamoDB treats each byte of the binary data as unsigned when
    it compares binary values.|}*)

}

(**{|
    Represents the input of a [Scan] operation.|}*)
type scan_input = {
  consistent_read: bool option;
   (**{|
    A Boolean value that determines the read consistency model during the
    scan:
    
    {ol 
          {- If [ConsistentRead] is [false], then the data returned from
             [Scan] might not contain the results from other recently
             completed write operations ([PutItem], [UpdateItem], or
             [DeleteItem]).
             }
          
          {- If [ConsistentRead] is [true], then all of the write operations
             that completed before the [Scan] began are guaranteed to be
             contained in the [Scan] response.
             }
          
    }
    
    The default setting for [ConsistentRead] is [false].
    
    The [ConsistentRead] parameter is not supported on global secondary
    indexes. If you scan a global secondary index with [ConsistentRead] set
    to true, you will receive a [ValidationException].|}*)

  expression_attribute_values: (string * attribute_value) list option;
   (**{|
    One or more values that can be substituted in an expression.
    
    Use the {b :} (colon) character in an expression to dereference an
    attribute value. For example, suppose that you wanted to check whether
    the value of the [ProductStatus] attribute was one of the following:
    
    [Available | Backordered | Discontinued]
    
    You would first need to specify [ExpressionAttributeValues] as follows:
    
    [{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
    ":disc":{"S":"Discontinued"} }]
    
    You could then use these values in an expression, such as this:
    
    [ProductStatus IN (:avail, :back, :disc)]
    
    For more information on expression attribute values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html }Condition
    Expressions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression. The
    following are some use cases for using [ExpressionAttributeNames]:
    
    {ol 
          {- To access an attribute whose name conflicts with a DynamoDB
             reserved word.
             }
          
          {- To create a placeholder for repeating occurrences of an
             attribute name in an expression.
             }
          
          {- To prevent special characters in an attribute name from being
             misinterpreted in an expression.
             }
          
    }
    
    Use the {b #} character in an expression to dereference an attribute
    name. For example, consider the following attribute name:
    
    {ol 
          {- [Percentile]
             }
          
    }
    
    The name of this attribute conflicts with a reserved word, so it cannot
    be used directly in an expression. (For the complete list of reserved
    words, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html }Reserved
    Words} in the {i Amazon DynamoDB Developer Guide}). To work around this,
    you could specify the following for [ExpressionAttributeNames]:
    
    {ol 
          {- [{"#P":"Percentile"}]
             }
          
    }
    
    You could then use this substitution in an expression, as in this
    example:
    
    {ol 
          {- [#P = :val]
             }
          
    }
    
    Tokens that begin with the {b :} character are {i expression attribute
    values}, which are placeholders for the actual value at runtime.
    
    For more information on expression attribute names, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Specifying
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  filter_expression: string option;
   (**{|
    A string that contains conditions that DynamoDB applies after the [Scan]
    operation, but before the data is returned to you. Items that do not
    satisfy the [FilterExpression] criteria are not returned.
    
    A [FilterExpression] is applied after the items have already been read;
    the process of filtering does not consume any additional read capacity
    units.
    
    For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.FilterExpression }Filter
    Expressions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  projection_expression: string option;
   (**{|
    A string that identifies one or more attributes to retrieve from the
    specified table or index. These attributes can include scalars, sets, or
    elements of a JSON document. The attributes in the expression must be
    separated by commas.
    
    If no attribute names are specified, then all attributes will be
    returned. If any of the requested attributes are not found, they will not
    appear in the result.
    
    For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Specifying
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  segment: int option;
   (**{|
    For a parallel [Scan] request, [Segment] identifies an individual segment
    to be scanned by an application worker.
    
    Segment IDs are zero-based, so the first segment is always 0. For
    example, if you want to use four application threads to scan a table or
    an index, then the first thread specifies a [Segment] value of 0, the
    second thread specifies 1, and so on.
    
    The value of [LastEvaluatedKey] returned from a parallel [Scan] request
    must be used as [ExclusiveStartKey] with the same segment ID in a
    subsequent [Scan] operation.
    
    The value for [Segment] must be greater than or equal to 0, and less than
    the value provided for [TotalSegments].
    
    If you provide [Segment], you must also provide [TotalSegments].|}*)

  total_segments: int option;
   (**{|
    For a parallel [Scan] request, [TotalSegments] represents the total
    number of segments into which the [Scan] operation will be divided. The
    value of [TotalSegments] corresponds to the number of application workers
    that will perform the parallel scan. For example, if you want to use four
    application threads to scan a table or an index, specify a
    [TotalSegments] value of 4.
    
    The value for [TotalSegments] must be greater than or equal to 1, and
    less than or equal to 1000000. If you specify a [TotalSegments] value of
    1, the [Scan] operation will be sequential rather than parallel.
    
    If you specify [TotalSegments], you must also specify [Segment].|}*)

  return_consumed_capacity: return_consumed_capacity option;
  
  exclusive_start_key: (string * attribute_value) list option;
   (**{|
    The primary key of the first item that this operation will evaluate. Use
    the value that was returned for [LastEvaluatedKey] in the previous
    operation.
    
    The data type for [ExclusiveStartKey] must be String, Number or Binary.
    No set data types are allowed.
    
    In a parallel scan, a [Scan] request that includes [ExclusiveStartKey]
    must specify the same segment whose previous [Scan] returned the
    corresponding value of [LastEvaluatedKey].|}*)

  conditional_operator: conditional_operator option;
   (**{|
    This is a legacy parameter. Use [FilterExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html }ConditionalOperator}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  scan_filter: (string * condition) list option;
   (**{|
    This is a legacy parameter. Use [FilterExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ScanFilter.html }ScanFilter}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  select: select option;
   (**{|
    The attributes to be returned in the result. You can retrieve all item
    attributes, specific item attributes, the count of matching items, or in
    the case of an index, some or all of the attributes projected into the
    index.
    
    {ol 
          {- [ALL_ATTRIBUTES] - Returns all of the item attributes from the
             specified table or index. If you query a local secondary index,
             then for each matching item in the index, DynamoDB fetches the
             entire item from the parent table. If the index is configured to
             project all item attributes, then all of the data can be
             obtained from the local secondary index, and no fetching is
             required.
             }
          
          {- [ALL_PROJECTED_ATTRIBUTES] - Allowed only when querying an
             index. Retrieves all attributes that have been projected into
             the index. If the index is configured to project all attributes,
             this return value is equivalent to specifying [ALL_ATTRIBUTES].
             }
          
          {- [COUNT] - Returns the number of matching items, rather than the
             matching items themselves. Note that this uses the same quantity
             of read capacity units as getting the items, and is subject to
             the same item size calculations.
             }
          
          {- [SPECIFIC_ATTRIBUTES] - Returns only the attributes listed in
             [ProjectionExpression]. This return value is equivalent to
             specifying [ProjectionExpression] without specifying any value
             for [Select].
             
          If you query or scan a local secondary index and request only
          attributes that are projected into that index, the operation reads
          only the index and not the table. If any of the requested
          attributes are not projected into the local secondary index,
          DynamoDB fetches each of these attributes from the parent table.
          This extra fetching incurs additional throughput cost and latency.
          
          If you query or scan a global secondary index, you can only request
          attributes that are projected into the index. Global secondary
          index queries cannot fetch attributes from the parent table.
          }
          
    }
    
    If neither [Select] nor [ProjectionExpression] are specified, DynamoDB
    defaults to [ALL_ATTRIBUTES] when accessing a table, and
    [ALL_PROJECTED_ATTRIBUTES] when accessing an index. You cannot use both
    [Select] and [ProjectionExpression] together in a single request, unless
    the value for [Select] is [SPECIFIC_ATTRIBUTES]. (This usage is
    equivalent to specifying [ProjectionExpression] without any value for
    [Select].)
    
    If you use the [ProjectionExpression] parameter, then the value for
    [Select] can only be [SPECIFIC_ATTRIBUTES]. Any other value for [Select]
    will return an error.
    |}*)

  limit: int option;
   (**{|
    The maximum number of items to evaluate (not necessarily the number of
    matching items). If DynamoDB processes the number of items up to the
    limit while processing the results, it stops the operation and returns
    the matching values up to that point, and a key in [LastEvaluatedKey] to
    apply in a subsequent operation, so that you can pick up where you left
    off. Also, if the processed dataset size exceeds 1 MB before DynamoDB
    reaches this limit, it stops the operation and returns the matching
    values up to the limit, and a key in [LastEvaluatedKey] to apply in a
    subsequent operation to continue the operation. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html }Working
    with Queries} in the {i Amazon DynamoDB Developer Guide}.|}*)

  attributes_to_get: string list option;
   (**{|
    This is a legacy parameter. Use [ProjectionExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html }AttributesToGet}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  index_name: string option;
   (**{|
    The name of a secondary index to scan. This index can be any local
    secondary index or global secondary index. Note that if you use the
    [IndexName] parameter, you must also provide [TableName].|}*)

  table_name: string;
   (**{|
    The name of the table containing the requested items or if you provide
    [IndexName], the name of the table to which that index belongs.
    
    You can also provide the Amazon Resource Name (ARN) of the table in this
    parameter.|}*)

}

type s3_sse_algorithm = | KMS
  | AES256

(**{|
    The S3 bucket that is being imported from.|}*)
type s3_bucket_source = {
  s3_key_prefix: string option;
   (**{|
    The key prefix shared by all S3 Objects that are being imported.|}*)

  s3_bucket: string;
   (**{|
    The S3 bucket that is being imported from.|}*)

  s3_bucket_owner: string option;
   (**{|
    The account number of the S3 bucket that is being imported from. If the
    bucket is owned by the requester this is optional.|}*)

}

type restore_table_to_point_in_time_output = {
  table_description: table_description option;
   (**{|
    Represents the properties of a table.|}*)

}

(**{|
    Represents the properties of a local secondary index.|}*)
type local_secondary_index = {
  projection: projection;
   (**{|
    Represents attributes that are copied (projected) from the table into the
    local secondary index. These are in addition to the primary key
    attributes and index key attributes, which are automatically projected.|}*)

  key_schema: key_schema_element list;
   (**{|
    The complete key schema for the local secondary index, consisting of one
    or more pairs of attribute names and key types:
    
    {ol 
          {- [HASH] - partition key
             }
          
          {- [RANGE] - sort key
             }
          
    }
    
    The partition key of an item is also known as its {i hash attribute}. The
    term "hash attribute" derives from DynamoDB's usage of an internal hash
    function to evenly distribute data items across partitions, based on
    their partition key values.
    
    The sort key of an item is also known as its {i range attribute}. The
    term "range attribute" derives from the way DynamoDB stores items with
    the same partition key physically close together, in sorted order by the
    sort key value.
    |}*)

  index_name: string;
   (**{|
    The name of the local secondary index. The name must be unique among all
    other indexes on this table.|}*)

}

type restore_table_to_point_in_time_input = {
  sse_specification_override: sse_specification option;
   (**{|
    The new server-side encryption settings for the restored table.|}*)

  on_demand_throughput_override: on_demand_throughput option;
  
  provisioned_throughput_override: provisioned_throughput option;
   (**{|
    Provisioned throughput settings for the restored table.|}*)

  local_secondary_index_override: local_secondary_index list option;
   (**{|
    List of local secondary indexes for the restored table. The indexes
    provided should match existing secondary indexes. You can choose to
    exclude some or all of the indexes at the time of restore.|}*)

  global_secondary_index_override: global_secondary_index list option;
   (**{|
    List of global secondary indexes for the restored table. The indexes
    provided should match existing secondary indexes. You can choose to
    exclude some or all of the indexes at the time of restore.|}*)

  billing_mode_override: billing_mode option;
   (**{|
    The billing mode of the restored table.|}*)

  restore_date_time: float option;
   (**{|
    Time in the past to restore the table to.|}*)

  use_latest_restorable_time: bool option;
   (**{|
    Restore the table to the latest possible time. [LatestRestorableDateTime]
    is typically 5 minutes before the current time.|}*)

  target_table_name: string;
   (**{|
    The name of the new table to which it must be restored to.|}*)

  source_table_name: string option;
   (**{|
    Name of the source table that is being restored.|}*)

  source_table_arn: string option;
   (**{|
    The DynamoDB table that will be restored. This value is an Amazon
    Resource Name (ARN).|}*)

}

(**{|
    Point in time recovery has not yet been enabled for this source table.|}*)
type point_in_time_recovery_unavailable_exception = {
  message: string option;
  
}

(**{|
    An invalid restore time was specified. RestoreDateTime must be between
    EarliestRestorableDateTime and LatestRestorableDateTime.|}*)
type invalid_restore_time_exception = {
  message: string option;
  
}

type restore_table_from_backup_output = {
  table_description: table_description option;
   (**{|
    The description of the table created from an existing backup.|}*)

}

type restore_table_from_backup_input = {
  sse_specification_override: sse_specification option;
   (**{|
    The new server-side encryption settings for the restored table.|}*)

  on_demand_throughput_override: on_demand_throughput option;
  
  provisioned_throughput_override: provisioned_throughput option;
   (**{|
    Provisioned throughput settings for the restored table.|}*)

  local_secondary_index_override: local_secondary_index list option;
   (**{|
    List of local secondary indexes for the restored table. The indexes
    provided should match existing secondary indexes. You can choose to
    exclude some or all of the indexes at the time of restore.|}*)

  global_secondary_index_override: global_secondary_index list option;
   (**{|
    List of global secondary indexes for the restored table. The indexes
    provided should match existing secondary indexes. You can choose to
    exclude some or all of the indexes at the time of restore.|}*)

  billing_mode_override: billing_mode option;
   (**{|
    The billing mode of the restored table.|}*)

  backup_arn: string;
   (**{|
    The Amazon Resource Name (ARN) associated with the backup.|}*)

  target_table_name: string;
   (**{|
    The name of the new table to which the backup must be restored.|}*)

}

(**{|
    Backup not found for the given BackupARN.|}*)
type backup_not_found_exception = {
  message: string option;
  
}

(**{|
    There is another ongoing conflicting backup control plane operation on
    the table. The backup is either being created, deleted or restored to a
    table.|}*)
type backup_in_use_exception = {
  message: string option;
  
}

(**{|
    Represents the properties of a replica.|}*)
type replica = {
  region_name: string option;
   (**{|
    The Region where the replica needs to be created.|}*)

}

(**{|
    Represents the output of a [Query] operation.|}*)
type query_output = {
  consumed_capacity: consumed_capacity option;
   (**{|
    The capacity units consumed by the [Query] operation. The data returned
    includes the total provisioned throughput consumed, along with statistics
    for the table and any indexes involved in the operation.
    [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity]
    parameter was specified. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption }Capacity
    unit consumption for read operations} in the {i Amazon DynamoDB Developer
    Guide}.|}*)

  last_evaluated_key: (string * attribute_value) list option;
   (**{|
    The primary key of the item where the operation stopped, inclusive of the
    previous result set. Use this value to start a new operation, excluding
    this value in the new request.
    
    If [LastEvaluatedKey] is empty, then the "last page" of results has been
    processed and there is no more data to be retrieved.
    
    If [LastEvaluatedKey] is not empty, it does not necessarily mean that
    there is more data in the result set. The only way to know when you have
    reached the end of the result set is when [LastEvaluatedKey] is empty.|}*)

  scanned_count: int option;
   (**{|
    The number of items evaluated, before any [QueryFilter] is applied. A
    high [ScannedCount] value with few, or no, [Count] results indicates an
    inefficient [Query] operation. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count }Count
    and ScannedCount} in the {i Amazon DynamoDB Developer Guide}.
    
    If you did not use a filter in the request, then [ScannedCount] is the
    same as [Count].|}*)

  count: int option;
   (**{|
    The number of items in the response.
    
    If you used a [QueryFilter] in the request, then [Count] is the number of
    items returned after the filter was applied, and [ScannedCount] is the
    number of matching items before the filter was applied.
    
    If you did not use a filter in the request, then [Count] and
    [ScannedCount] are the same.|}*)

  items: (string * attribute_value) list list option;
   (**{|
    An array of item attributes that match the query criteria. Each element
    in this array consists of an attribute name and the value for that
    attribute.|}*)

}

(**{|
    Represents the input of a [Query] operation.|}*)
type query_input = {
  expression_attribute_values: (string * attribute_value) list option;
   (**{|
    One or more values that can be substituted in an expression.
    
    Use the {b :} (colon) character in an expression to dereference an
    attribute value. For example, suppose that you wanted to check whether
    the value of the {i ProductStatus} attribute was one of the following:
    
    [Available | Backordered | Discontinued]
    
    You would first need to specify [ExpressionAttributeValues] as follows:
    
    [{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
    ":disc":{"S":"Discontinued"} }]
    
    You could then use these values in an expression, such as this:
    
    [ProductStatus IN (:avail, :back, :disc)]
    
    For more information on expression attribute values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html }Specifying
    Conditions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression. The
    following are some use cases for using [ExpressionAttributeNames]:
    
    {ol 
          {- To access an attribute whose name conflicts with a DynamoDB
             reserved word.
             }
          
          {- To create a placeholder for repeating occurrences of an
             attribute name in an expression.
             }
          
          {- To prevent special characters in an attribute name from being
             misinterpreted in an expression.
             }
          
    }
    
    Use the {b #} character in an expression to dereference an attribute
    name. For example, consider the following attribute name:
    
    {ol 
          {- [Percentile]
             }
          
    }
    
    The name of this attribute conflicts with a reserved word, so it cannot
    be used directly in an expression. (For the complete list of reserved
    words, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html }Reserved
    Words} in the {i Amazon DynamoDB Developer Guide}). To work around this,
    you could specify the following for [ExpressionAttributeNames]:
    
    {ol 
          {- [{"#P":"Percentile"}]
             }
          
    }
    
    You could then use this substitution in an expression, as in this
    example:
    
    {ol 
          {- [#P = :val]
             }
          
    }
    
    Tokens that begin with the {b :} character are {i expression attribute
    values}, which are placeholders for the actual value at runtime.
    
    For more information on expression attribute names, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Specifying
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  key_condition_expression: string option;
   (**{|
    The condition that specifies the key values for items to be retrieved by
    the [Query] action.
    
    The condition must perform an equality test on a single partition key
    value.
    
    The condition can optionally perform one of several comparison tests on a
    single sort key value. This allows [Query] to retrieve one item with a
    given partition key value and sort key value, or several items that have
    the same partition key value but different sort key values.
    
    The partition key equality test is required, and must be specified in the
    following format:
    
    [partitionKeyName] {i =} [:partitionkeyval]
    
    If you also want to provide a condition for the sort key, it must be
    combined using [AND] with the condition for the sort key. Following is an
    example, using the {b =} comparison operator for the sort key:
    
    [partitionKeyName] [=] [:partitionkeyval] [AND] [sortKeyName] [=]
    [:sortkeyval]
    
    Valid comparisons for the sort key condition are as follows:
    
    {ol 
          {- [sortKeyName] [=] [:sortkeyval] - true if the sort key value is
             equal to [:sortkeyval].
             }
          
          {- [sortKeyName] [<] [:sortkeyval] - true if the sort key value is
             less than [:sortkeyval].
             }
          
          {- [sortKeyName] [<=] [:sortkeyval] - true if the sort key value is
             less than or equal to [:sortkeyval].
             }
          
          {- [sortKeyName] [>] [:sortkeyval] - true if the sort key value is
             greater than [:sortkeyval].
             }
          
          {- [sortKeyName] [>=] [:sortkeyval] - true if the sort key value is
             greater than or equal to [:sortkeyval].
             }
          
          {- [sortKeyName] [BETWEEN] [:sortkeyval1] [AND] [:sortkeyval2] -
             true if the sort key value is greater than or equal to
             [:sortkeyval1], and less than or equal to [:sortkeyval2].
             }
          
          {- [begins_with (] [sortKeyName], [:sortkeyval] [)] - true if the
             sort key value begins with a particular operand. (You cannot use
             this function with a sort key that is of type Number.) Note that
             the function name [begins_with] is case-sensitive.
             }
          
    }
    
    Use the [ExpressionAttributeValues] parameter to replace tokens such as
    [:partitionval] and [:sortval] with actual values at runtime.
    
    You can optionally use the [ExpressionAttributeNames] parameter to
    replace the names of the partition key and sort key with placeholder
    tokens. This option might be necessary if an attribute name conflicts
    with a DynamoDB reserved word. For example, the following
    [KeyConditionExpression] parameter causes an error because {i Size} is a
    reserved word:
    
    {ol 
          {- [Size = :myval]
             }
          
    }
    
    To work around this, define a placeholder (such a [#S]) to represent the
    attribute name {i Size}. [KeyConditionExpression] then is as follows:
    
    {ol 
          {- [#S = :myval]
             }
          
    }
    
    For a list of reserved words, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html }Reserved
    Words} in the {i Amazon DynamoDB Developer Guide}.
    
    For more information on [ExpressionAttributeNames] and
    [ExpressionAttributeValues], see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html }Using
    Placeholders for Attribute Names and Values} in the {i Amazon DynamoDB
    Developer Guide}.|}*)

  filter_expression: string option;
   (**{|
    A string that contains conditions that DynamoDB applies after the [Query]
    operation, but before the data is returned to you. Items that do not
    satisfy the [FilterExpression] criteria are not returned.
    
    A [FilterExpression] does not allow key attributes. You cannot define a
    filter expression based on a partition key or a sort key.
    
    A [FilterExpression] is applied after the items have already been read;
    the process of filtering does not consume any additional read capacity
    units.
    
    For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Query.FilterExpression.html }Filter
    Expressions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  projection_expression: string option;
   (**{|
    A string that identifies one or more attributes to retrieve from the
    table. These attributes can include scalars, sets, or elements of a JSON
    document. The attributes in the expression must be separated by commas.
    
    If no attribute names are specified, then all attributes will be
    returned. If any of the requested attributes are not found, they will not
    appear in the result.
    
    For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Accessing
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  return_consumed_capacity: return_consumed_capacity option;
  
  exclusive_start_key: (string * attribute_value) list option;
   (**{|
    The primary key of the first item that this operation will evaluate. Use
    the value that was returned for [LastEvaluatedKey] in the previous
    operation.
    
    The data type for [ExclusiveStartKey] must be String, Number, or Binary.
    No set data types are allowed.|}*)

  scan_index_forward: bool option;
   (**{|
    Specifies the order for index traversal: If [true] (default), the
    traversal is performed in ascending order; if [false], the traversal is
    performed in descending order.
    
    Items with the same partition key value are stored in sorted order by
    sort key. If the sort key data type is Number, the results are stored in
    numeric order. For type String, the results are stored in order of UTF-8
    bytes. For type Binary, DynamoDB treats each byte of the binary data as
    unsigned.
    
    If [ScanIndexForward] is [true], DynamoDB returns the results in the
    order in which they are stored (by sort key value). This is the default
    behavior. If [ScanIndexForward] is [false], DynamoDB reads the results in
    reverse order by sort key value, and then returns the results to the
    client.|}*)

  conditional_operator: conditional_operator option;
   (**{|
    This is a legacy parameter. Use [FilterExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html }ConditionalOperator}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  query_filter: (string * condition) list option;
   (**{|
    This is a legacy parameter. Use [FilterExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.QueryFilter.html }QueryFilter}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  key_conditions: (string * condition) list option;
   (**{|
    This is a legacy parameter. Use [KeyConditionExpression] instead. For
    more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.KeyConditions.html }KeyConditions}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  consistent_read: bool option;
   (**{|
    Determines the read consistency model: If set to [true], then the
    operation uses strongly consistent reads; otherwise, the operation uses
    eventually consistent reads.
    
    Strongly consistent reads are not supported on global secondary indexes.
    If you query a global secondary index with [ConsistentRead] set to
    [true], you will receive a [ValidationException].|}*)

  limit: int option;
   (**{|
    The maximum number of items to evaluate (not necessarily the number of
    matching items). If DynamoDB processes the number of items up to the
    limit while processing the results, it stops the operation and returns
    the matching values up to that point, and a key in [LastEvaluatedKey] to
    apply in a subsequent operation, so that you can pick up where you left
    off. Also, if the processed dataset size exceeds 1 MB before DynamoDB
    reaches this limit, it stops the operation and returns the matching
    values up to the limit, and a key in [LastEvaluatedKey] to apply in a
    subsequent operation to continue the operation. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html }Query
    and Scan} in the {i Amazon DynamoDB Developer Guide}.|}*)

  attributes_to_get: string list option;
   (**{|
    This is a legacy parameter. Use [ProjectionExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html }AttributesToGet}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  select: select option;
   (**{|
    The attributes to be returned in the result. You can retrieve all item
    attributes, specific item attributes, the count of matching items, or in
    the case of an index, some or all of the attributes projected into the
    index.
    
    {ol 
          {- [ALL_ATTRIBUTES] - Returns all of the item attributes from the
             specified table or index. If you query a local secondary index,
             then for each matching item in the index, DynamoDB fetches the
             entire item from the parent table. If the index is configured to
             project all item attributes, then all of the data can be
             obtained from the local secondary index, and no fetching is
             required.
             }
          
          {- [ALL_PROJECTED_ATTRIBUTES] - Allowed only when querying an
             index. Retrieves all attributes that have been projected into
             the index. If the index is configured to project all attributes,
             this return value is equivalent to specifying [ALL_ATTRIBUTES].
             }
          
          {- [COUNT] - Returns the number of matching items, rather than the
             matching items themselves. Note that this uses the same quantity
             of read capacity units as getting the items, and is subject to
             the same item size calculations.
             }
          
          {- [SPECIFIC_ATTRIBUTES] - Returns only the attributes listed in
             [ProjectionExpression]. This return value is equivalent to
             specifying [ProjectionExpression] without specifying any value
             for [Select].
             
          If you query or scan a local secondary index and request only
          attributes that are projected into that index, the operation will
          read only the index and not the table. If any of the requested
          attributes are not projected into the local secondary index,
          DynamoDB fetches each of these attributes from the parent table.
          This extra fetching incurs additional throughput cost and latency.
          
          If you query or scan a global secondary index, you can only request
          attributes that are projected into the index. Global secondary
          index queries cannot fetch attributes from the parent table.
          }
          
    }
    
    If neither [Select] nor [ProjectionExpression] are specified, DynamoDB
    defaults to [ALL_ATTRIBUTES] when accessing a table, and
    [ALL_PROJECTED_ATTRIBUTES] when accessing an index. You cannot use both
    [Select] and [ProjectionExpression] together in a single request, unless
    the value for [Select] is [SPECIFIC_ATTRIBUTES]. (This usage is
    equivalent to specifying [ProjectionExpression] without any value for
    [Select].)
    
    If you use the [ProjectionExpression] parameter, then the value for
    [Select] can only be [SPECIFIC_ATTRIBUTES]. Any other value for [Select]
    will return an error.
    |}*)

  index_name: string option;
   (**{|
    The name of an index to query. This index can be any local secondary
    index or global secondary index on the table. Note that if you use the
    [IndexName] parameter, you must also provide [TableName.]|}*)

  table_name: string;
   (**{|
    The name of the table containing the requested items. You can also
    provide the Amazon Resource Name (ARN) of the table in this parameter.|}*)

}

type put_resource_policy_output = {
  revision_id: string option;
   (**{|
    A unique string that represents the revision ID of the policy. If you're
    comparing revision IDs, make sure to always use string comparison logic.|}*)

}

type put_resource_policy_input = {
  confirm_remove_self_resource_access: bool option;
   (**{|
    Set this parameter to [true] to confirm that you want to remove your
    permissions to change the policy of this resource in the future.|}*)

  expected_revision_id: string option;
   (**{|
    A string value that you can use to conditionally update your policy. You
    can provide the revision ID of your existing policy to make mutating
    requests against that policy.
    
    When you provide an expected revision ID, if the revision ID of the
    existing policy on the resource doesn't match or if there's no policy
    attached to the resource, your request will be rejected with a
    [PolicyNotFoundException].
    
    To conditionally attach a policy when no policy exists for the resource,
    specify [NO_POLICY] for the revision ID.|}*)

  policy: string;
   (**{|
    An Amazon Web Services resource-based policy document in JSON format.
    
    {ol 
          {- The maximum size supported for a resource-based policy document
             is 20 KB. DynamoDB counts whitespaces when calculating the size
             of a policy against this limit.
             }
          
          {- Within a resource-based policy, if the action for a DynamoDB
             service-linked role (SLR) to replicate data for a global table
             is denied, adding or deleting a replica will fail with an error.
             }
          
    }
    
    For a full list of all considerations that apply while attaching a
    resource-based policy, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/rbac-considerations.html }Resource-based
    policy considerations}.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the DynamoDB resource to which the
    policy will be attached. The resources you can specify include tables and
    streams.
    
    You can control index permissions using the base table's policy. To
    specify the same permission level for your table and its indexes, you can
    provide both the table and index Amazon Resource Name (ARN)s in the
    [Resource] field of a given [Statement] in your policy document.
    Alternatively, to specify different permissions for your table, indexes,
    or both, you can define multiple [Statement] fields in your policy
    document.|}*)

}

(**{|
    The operation tried to access a nonexistent resource-based policy.
    
    If you specified an [ExpectedRevisionId], it's possible that a policy is
    present for the resource but its revision ID didn't match the expected
    value.|}*)
type policy_not_found_exception = {
  message: string option;
  
}

(**{|
    Represents the output of a [PutItem] operation.|}*)
type put_item_output = {
  item_collection_metrics: item_collection_metrics option;
   (**{|
    Information about item collections, if any, that were affected by the
    [PutItem] operation. [ItemCollectionMetrics] is only returned if the
    [ReturnItemCollectionMetrics] parameter was specified. If the table does
    not have any local secondary indexes, this information is not returned in
    the response.
    
    Each [ItemCollectionMetrics] element consists of:
    
    {ol 
          {- [ItemCollectionKey] - The partition key value of the item
             collection. This is the same as the partition key value of the
             item itself.
             }
          
          {- [SizeEstimateRangeGB] - An estimate of item collection size, in
             gigabytes. This value is a two-element array containing a lower
             bound and an upper bound for the estimate. The estimate includes
             the size of all the items in the table, plus the size of all
             attributes projected into all of the local secondary indexes on
             that table. Use this estimate to measure whether a local
             secondary index is approaching its size limit.
             
          The estimate is subject to change over time; therefore, do not rely
          on the precision or accuracy of the estimate.
          }
          
    }
    |}*)

  consumed_capacity: consumed_capacity option;
   (**{|
    The capacity units consumed by the [PutItem] operation. The data returned
    includes the total provisioned throughput consumed, along with statistics
    for the table and any indexes involved in the operation.
    [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity]
    parameter was specified. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#write-operation-consumption }Capacity
    unity consumption for write operations} in the {i Amazon DynamoDB
    Developer Guide}.|}*)

  attributes: (string * attribute_value) list option;
   (**{|
    The attribute values as they appeared before the [PutItem] operation, but
    only if [ReturnValues] is specified as [ALL_OLD] in the request. Each
    element consists of an attribute name and an attribute value.|}*)

}

(**{|
    Represents the input of a [PutItem] operation.|}*)
type put_item_input = {
  return_values_on_condition_check_failure: return_values_on_condition_check_failure option;
   (**{|
    An optional parameter that returns the item attributes for a [PutItem]
    operation that failed a condition check.
    
    There is no additional cost associated with requesting a return value
    aside from the small network and processing overhead of receiving a
    larger response. No read capacity units are consumed.|}*)

  expression_attribute_values: (string * attribute_value) list option;
   (**{|
    One or more values that can be substituted in an expression.
    
    Use the {b :} (colon) character in an expression to dereference an
    attribute value. For example, suppose that you wanted to check whether
    the value of the {i ProductStatus} attribute was one of the following:
    
    [Available | Backordered | Discontinued]
    
    You would first need to specify [ExpressionAttributeValues] as follows:
    
    [{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
    ":disc":{"S":"Discontinued"} }]
    
    You could then use these values in an expression, such as this:
    
    [ProductStatus IN (:avail, :back, :disc)]
    
    For more information on expression attribute values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html }Condition
    Expressions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression. The
    following are some use cases for using [ExpressionAttributeNames]:
    
    {ol 
          {- To access an attribute whose name conflicts with a DynamoDB
             reserved word.
             }
          
          {- To create a placeholder for repeating occurrences of an
             attribute name in an expression.
             }
          
          {- To prevent special characters in an attribute name from being
             misinterpreted in an expression.
             }
          
    }
    
    Use the {b #} character in an expression to dereference an attribute
    name. For example, consider the following attribute name:
    
    {ol 
          {- [Percentile]
             }
          
    }
    
    The name of this attribute conflicts with a reserved word, so it cannot
    be used directly in an expression. (For the complete list of reserved
    words, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html }Reserved
    Words} in the {i Amazon DynamoDB Developer Guide}). To work around this,
    you could specify the following for [ExpressionAttributeNames]:
    
    {ol 
          {- [{"#P":"Percentile"}]
             }
          
    }
    
    You could then use this substitution in an expression, as in this
    example:
    
    {ol 
          {- [#P = :val]
             }
          
    }
    
    Tokens that begin with the {b :} character are {i expression attribute
    values}, which are placeholders for the actual value at runtime.
    
    For more information on expression attribute names, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Specifying
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  condition_expression: string option;
   (**{|
    A condition that must be satisfied in order for a conditional [PutItem]
    operation to succeed.
    
    An expression can contain any of the following:
    
    {ol 
          {- Functions: [attribute_exists | attribute_not_exists |
             attribute_type | contains | begins_with | size]
             
          These function names are case-sensitive.
          }
          
          {- Comparison operators: [= | <> | < | > | <= | >= | BETWEEN | IN]
             }
          
          {- Logical operators: [AND | OR | NOT]
             }
          
    }
    
    For more information on condition expressions, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html }Condition
    Expressions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  conditional_operator: conditional_operator option;
   (**{|
    This is a legacy parameter. Use [ConditionExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html }ConditionalOperator}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  return_item_collection_metrics: return_item_collection_metrics option;
   (**{|
    Determines whether item collection metrics are returned. If set to
    [SIZE], the response includes statistics about item collections, if any,
    that were modified during the operation are returned in the response. If
    set to [NONE] (the default), no statistics are returned.|}*)

  return_consumed_capacity: return_consumed_capacity option;
  
  return_values: return_value option;
   (**{|
    Use [ReturnValues] if you want to get the item attributes as they
    appeared before they were updated with the [PutItem] request. For
    [PutItem], the valid values are:
    
    {ol 
          {- [NONE] - If [ReturnValues] is not specified, or if its value is
             [NONE], then nothing is returned. (This setting is the default
             for [ReturnValues].)
             }
          
          {- [ALL_OLD] - If [PutItem] overwrote an attribute name-value pair,
             then the content of the old item is returned.
             }
          
    }
    
    The values returned are strongly consistent.
    
    There is no additional cost associated with requesting a return value
    aside from the small network and processing overhead of receiving a
    larger response. No read capacity units are consumed.
    
    The [ReturnValues] parameter is used by several DynamoDB operations;
    however, [PutItem] does not recognize any values other than [NONE] or
    [ALL_OLD].
    |}*)

  expected: (string * expected_attribute_value) list option;
   (**{|
    This is a legacy parameter. Use [ConditionExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html }Expected}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  item: (string * attribute_value) list;
   (**{|
    A map of attribute name/value pairs, one for each attribute. Only the
    primary key attributes are required; you can optionally provide other
    attribute name-value pairs for the item.
    
    You must provide all of the attributes for the primary key. For example,
    with a simple primary key, you only need to provide a value for the
    partition key. For a composite primary key, you must provide both values
    for both the partition key and the sort key.
    
    If you specify any attributes that are part of an index key, then the
    data types for those attributes must match those of the schema in the
    table's attribute definition.
    
    Empty String and Binary attribute values are allowed. Attribute values of
    type String and Binary must have a length greater than zero if the
    attribute is used as a key attribute for a table or index.
    
    For more information about primary keys, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.CoreComponents.html#HowItWorks.CoreComponents.PrimaryKey }Primary
    Key} in the {i Amazon DynamoDB Developer Guide}.
    
    Each element in the [Item] map is an [AttributeValue] object.|}*)

  table_name: string;
   (**{|
    The name of the table to contain the item. You can also provide the
    Amazon Resource Name (ARN) of the table in this parameter.|}*)

}

type batch_statement_error_code_enum = | DuplicateItem
  | AccessDenied
  | ResourceNotFound
  | InternalServerError
  | ThrottlingError
  | TransactionConflict
  | ProvisionedThroughputExceeded
  | ValidationError
  | RequestLimitExceeded
  | ItemCollectionSizeLimitExceeded
  | ConditionalCheckFailed

(**{|
    An error associated with a statement in a PartiQL batch that was run.|}*)
type batch_statement_error = {
  item: (string * attribute_value) list option;
   (**{|
    The item which caused the condition check to fail. This will be set if
    ReturnValuesOnConditionCheckFailure is specified as [ALL_OLD].|}*)

  message: string option;
   (**{|
    The error message associated with the PartiQL batch response.|}*)

  code: batch_statement_error_code_enum option;
   (**{|
    The error code associated with the failed PartiQL batch statement.|}*)

}

(**{|
    A PartiQL batch statement response..|}*)
type batch_statement_response = {
  item: (string * attribute_value) list option;
   (**{|
    A DynamoDB item associated with a BatchStatementResponse|}*)

  table_name: string option;
   (**{|
    The table name associated with a failed PartiQL batch statement.|}*)

  error: batch_statement_error option;
   (**{|
    The error associated with a failed PartiQL batch statement.|}*)

}

(**{|
    A PartiQL batch statement request.|}*)
type batch_statement_request = {
  return_values_on_condition_check_failure: return_values_on_condition_check_failure option;
   (**{|
    An optional parameter that returns the item attributes for a PartiQL
    batch request operation that failed a condition check.
    
    There is no additional cost associated with requesting a return value
    aside from the small network and processing overhead of receiving a
    larger response. No read capacity units are consumed.|}*)

  consistent_read: bool option;
   (**{|
    The read consistency of the PartiQL batch request.|}*)

  parameters: attribute_value list option;
   (**{|
    The parameters associated with a PartiQL statement in the batch request.|}*)

  statement: string;
   (**{|
    A valid PartiQL statement.|}*)

}

(**{|
    Represents a PartiQL statement that uses parameters.|}*)
type parameterized_statement = {
  return_values_on_condition_check_failure: return_values_on_condition_check_failure option;
   (**{|
    An optional parameter that returns the item attributes for a PartiQL
    [ParameterizedStatement] operation that failed a condition check.
    
    There is no additional cost associated with requesting a return value
    aside from the small network and processing overhead of receiving a
    larger response. No read capacity units are consumed.|}*)

  parameters: attribute_value list option;
   (**{|
    The parameter values.|}*)

  statement: string;
   (**{|
    A PartiQL statement that uses parameters.|}*)

}

type list_tags_of_resource_output = {
  next_token: string option;
   (**{|
    If this value is returned, there are additional results to be displayed.
    To retrieve them, call ListTagsOfResource again, with NextToken set to
    this value.|}*)

  tags: tag list option;
   (**{|
    The tags currently associated with the Amazon DynamoDB resource.|}*)

}

type list_tags_of_resource_input = {
  next_token: string option;
   (**{|
    An optional string that, if supplied, must be copied from the output of a
    previous call to ListTagOfResource. When provided in this manner, this
    API fetches the next page of results.|}*)

  resource_arn: string;
   (**{|
    The Amazon DynamoDB resource with tags to be listed. This value is an
    Amazon Resource Name (ARN).|}*)

}

(**{|
    Represents the output of a [ListTables] operation.|}*)
type list_tables_output = {
  last_evaluated_table_name: string option;
   (**{|
    The name of the last table in the current page of results. Use this value
    as the [ExclusiveStartTableName] in a new request to obtain the next page
    of results, until all the table names are returned.
    
    If you do not receive a [LastEvaluatedTableName] value in the response,
    this means that there are no more table names to be retrieved.|}*)

  table_names: string list option;
   (**{|
    The names of the tables associated with the current account at the
    current endpoint. The maximum size of this array is 100.
    
    If [LastEvaluatedTableName] also appears in the output, you can use this
    value as the [ExclusiveStartTableName] parameter in a subsequent
    [ListTables] request and obtain the next page of results.|}*)

}

(**{|
    Represents the input of a [ListTables] operation.|}*)
type list_tables_input = {
  limit: int option;
   (**{|
    A maximum number of table names to return. If this parameter is not
    specified, the limit is 100.|}*)

  exclusive_start_table_name: string option;
   (**{|
    The first table name that this operation will evaluate. Use the value
    that was returned for [LastEvaluatedTableName] in a previous operation,
    so that you can obtain the next page of results.|}*)

}

type import_status = | FAILED
  | CANCELLED
  | CANCELLING
  | COMPLETED
  | IN_PROGRESS

type input_format = | CSV
  | ION
  | DYNAMODB_JSON

(**{|
    Summary information about the source file for the import.|}*)
type import_summary = {
  end_time: float option;
   (**{|
    The time at which this import task ended. (Does this include the
    successful complete creation of the table it was imported to?)|}*)

  start_time: float option;
   (**{|
    The time at which this import task began.|}*)

  input_format: input_format option;
   (**{|
    The format of the source data. Valid values are [CSV], [DYNAMODB_JSON] or
    [ION].|}*)

  cloud_watch_log_group_arn: string option;
   (**{|
    The Amazon Resource Number (ARN) of the Cloudwatch Log Group associated
    with this import task.|}*)

  s3_bucket_source: s3_bucket_source option;
   (**{|
    The path and S3 bucket of the source file that is being imported. This
    includes the S3Bucket (required), S3KeyPrefix (optional) and
    S3BucketOwner (optional if the bucket is owned by the requester).|}*)

  table_arn: string option;
   (**{|
    The Amazon Resource Number (ARN) of the table being imported into.|}*)

  import_status: import_status option;
   (**{|
    The status of the import operation.|}*)

  import_arn: string option;
   (**{|
    The Amazon Resource Number (ARN) corresponding to the import request.|}*)

}

type list_imports_output = {
  next_token: string option;
   (**{|
    If this value is returned, there are additional results to be displayed.
    To retrieve them, call [ListImports] again, with [NextToken] set to this
    value.|}*)

  import_summary_list: import_summary list option;
   (**{|
    A list of [ImportSummary] objects.|}*)

}

type list_imports_input = {
  next_token: string option;
   (**{|
    An optional string that, if supplied, must be copied from the output of a
    previous call to [ListImports]. When provided in this manner, the API
    fetches the next page of results.|}*)

  page_size: int option;
   (**{|
    The number of [ImportSummary]objects returned in a single page.|}*)

  table_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) associated with the table that was
    imported to.|}*)

}

(**{|
    Represents the properties of a global table.|}*)
type global_table = {
  replication_group: replica list option;
   (**{|
    The Regions where the global table has replicas.|}*)

  global_table_name: string option;
   (**{|
    The global table name.|}*)

}

type list_global_tables_output = {
  last_evaluated_global_table_name: string option;
   (**{|
    Last evaluated global table name.|}*)

  global_tables: global_table list option;
   (**{|
    List of global table names.|}*)

}

type list_global_tables_input = {
  region_name: string option;
   (**{|
    Lists the global tables in a specific Region.|}*)

  limit: int option;
   (**{|
    The maximum number of table names to return, if the parameter is not
    specified DynamoDB defaults to 100.
    
    If the number of global tables DynamoDB finds reaches this limit, it
    stops the operation and returns the table names collected up to that
    point, with a table name in the [LastEvaluatedGlobalTableName] to apply
    in a subsequent operation to the [ExclusiveStartGlobalTableName]
    parameter.|}*)

  exclusive_start_global_table_name: string option;
   (**{|
    The first global table name that this operation will evaluate.|}*)

}

type export_status = | FAILED
  | COMPLETED
  | IN_PROGRESS

type export_type = | INCREMENTAL_EXPORT
  | FULL_EXPORT

(**{|
    Summary information about an export task.|}*)
type export_summary = {
  export_type: export_type option;
   (**{|
    The type of export that was performed. Valid values are [FULL_EXPORT] or
    [INCREMENTAL_EXPORT].|}*)

  export_status: export_status option;
   (**{|
    Export can be in one of the following states: IN_PROGRESS, COMPLETED, or
    FAILED.|}*)

  export_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the export.|}*)

}

type list_exports_output = {
  next_token: string option;
   (**{|
    If this value is returned, there are additional results to be displayed.
    To retrieve them, call [ListExports] again, with [NextToken] set to this
    value.|}*)

  export_summaries: export_summary list option;
   (**{|
    A list of [ExportSummary] objects.|}*)

}

type list_exports_input = {
  next_token: string option;
   (**{|
    An optional string that, if supplied, must be copied from the output of a
    previous call to [ListExports]. When provided in this manner, the API
    fetches the next page of results.|}*)

  max_results: int option;
   (**{|
    Maximum number of results to return per page.|}*)

  table_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) associated with the exported table.|}*)

}

(**{|
    Represents a Contributor Insights summary entry.|}*)
type contributor_insights_summary = {
  contributor_insights_status: contributor_insights_status option;
   (**{|
    Describes the current status for contributor insights for the given table
    and index, if applicable.|}*)

  index_name: string option;
   (**{|
    Name of the index associated with the summary, if any.|}*)

  table_name: string option;
   (**{|
    Name of the table associated with the summary.|}*)

}

type list_contributor_insights_output = {
  next_token: string option;
   (**{|
    A token to go to the next page if there is one.|}*)

  contributor_insights_summaries: contributor_insights_summary list option;
   (**{|
    A list of ContributorInsightsSummary.|}*)

}

type list_contributor_insights_input = {
  max_results: int option;
   (**{|
    Maximum number of results to return per page.|}*)

  next_token: string option;
   (**{|
    A token to for the desired page, if there is one.|}*)

  table_name: string option;
   (**{|
    The name of the table. You can also provide the Amazon Resource Name
    (ARN) of the table in this parameter.|}*)

}

type backup_status = | AVAILABLE
  | DELETED
  | CREATING

type backup_type = | AWS_BACKUP
  | SYSTEM
  | USER

(**{|
    Contains details for the backup.|}*)
type backup_summary = {
  backup_size_bytes: int option;
   (**{|
    Size of the backup in bytes.|}*)

  backup_type: backup_type option;
   (**{|
    BackupType:
    
    {ol 
          {- [USER] - You create and manage these using the on-demand backup
             feature.
             }
          
          {- [SYSTEM] - If you delete a table with point-in-time recovery
             enabled, a [SYSTEM] backup is automatically created and is
             retained for 35 days (at no additional cost). System backups
             allow you to restore the deleted table to the state it was in
             just before the point of deletion.
             }
          
          {- [AWS_BACKUP] - On-demand backup created by you from Backup
             service.
             }
          
    }
    |}*)

  backup_status: backup_status option;
   (**{|
    Backup can be in one of the following states: CREATING, ACTIVE, DELETED.|}*)

  backup_expiry_date_time: float option;
   (**{|
    Time at which the automatic on-demand backup created by DynamoDB will
    expire. This [SYSTEM] on-demand backup expires automatically 35 days
    after its creation.|}*)

  backup_creation_date_time: float option;
   (**{|
    Time at which the backup was created.|}*)

  backup_name: string option;
   (**{|
    Name of the specified backup.|}*)

  backup_arn: string option;
   (**{|
    ARN associated with the backup.|}*)

  table_arn: string option;
   (**{|
    ARN associated with the table.|}*)

  table_id: string option;
   (**{|
    Unique identifier for the table.|}*)

  table_name: string option;
   (**{|
    Name of the table.|}*)

}

type list_backups_output = {
  last_evaluated_backup_arn: string option;
   (**{|
    The ARN of the backup last evaluated when the current page of results was
    returned, inclusive of the current page of results. This value may be
    specified as the [ExclusiveStartBackupArn] of a new [ListBackups]
    operation in order to fetch the next page of results.
    
    If [LastEvaluatedBackupArn] is empty, then the last page of results has
    been processed and there are no more results to be retrieved.
    
    If [LastEvaluatedBackupArn] is not empty, this may or may not indicate
    that there is more data to be returned. All results are guaranteed to
    have been returned if and only if no value for [LastEvaluatedBackupArn]
    is returned.|}*)

  backup_summaries: backup_summary list option;
   (**{|
    List of [BackupSummary] objects.|}*)

}

type backup_type_filter = | ALL
  | AWS_BACKUP
  | SYSTEM
  | USER

type list_backups_input = {
  backup_type: backup_type_filter option;
   (**{|
    The backups from the table specified by [BackupType] are listed.
    
    Where [BackupType] can be:
    
    {ol 
          {- [USER] - On-demand backup created by you. (The default setting
             if no other backup types are specified.)
             }
          
          {- [SYSTEM] - On-demand backup automatically created by DynamoDB.
             }
          
          {- [ALL] - All types of on-demand backups (USER and SYSTEM).
             }
          
    }
    |}*)

  exclusive_start_backup_arn: string option;
   (**{|
    [LastEvaluatedBackupArn] is the Amazon Resource Name (ARN) of the backup
    last evaluated when the current page of results was returned, inclusive
    of the current page of results. This value may be specified as the
    [ExclusiveStartBackupArn] of a new [ListBackups] operation in order to
    fetch the next page of results.|}*)

  time_range_upper_bound: float option;
   (**{|
    Only backups created before this time are listed. [TimeRangeUpperBound]
    is exclusive.|}*)

  time_range_lower_bound: float option;
   (**{|
    Only backups created after this time are listed. [TimeRangeLowerBound] is
    inclusive.|}*)

  limit: int option;
   (**{|
    Maximum number of backups to return at once.|}*)

  table_name: string option;
   (**{|
    Lists the backups from the table specified in [TableName]. You can also
    provide the Amazon Resource Name (ARN) of the table in this parameter.|}*)

}

(**{|
    Enables setting the configuration for Kinesis Streaming.|}*)
type enable_kinesis_streaming_configuration = {
  approximate_creation_date_time_precision: approximate_creation_date_time_precision option;
   (**{|
    Toggle for the precision of Kinesis data stream timestamp. The values are
    either [MILLISECOND] or [MICROSECOND].|}*)

}

type kinesis_streaming_destination_output = {
  enable_kinesis_streaming_configuration: enable_kinesis_streaming_configuration option;
   (**{|
    The destination for the Kinesis streaming information that is being
    enabled.|}*)

  destination_status: destination_status option;
   (**{|
    The current status of the replication.|}*)

  stream_arn: string option;
   (**{|
    The ARN for the specific Kinesis data stream.|}*)

  table_name: string option;
   (**{|
    The name of the table being modified.|}*)

}

type kinesis_streaming_destination_input = {
  enable_kinesis_streaming_configuration: enable_kinesis_streaming_configuration option;
   (**{|
    The source for the Kinesis streaming information that is being enabled.|}*)

  stream_arn: string;
   (**{|
    The ARN for a Kinesis data stream.|}*)

  table_name: string;
   (**{|
    The name of the DynamoDB table. You can also provide the Amazon Resource
    Name (ARN) of the table in this parameter.|}*)

}

(**{|
    Describes a Kinesis data stream destination.|}*)
type kinesis_data_stream_destination = {
  approximate_creation_date_time_precision: approximate_creation_date_time_precision option;
   (**{|
    The precision of the Kinesis data stream timestamp. The values are either
    [MILLISECOND] or [MICROSECOND].|}*)

  destination_status_description: string option;
   (**{|
    The human-readable string that corresponds to the replica status.|}*)

  destination_status: destination_status option;
   (**{|
    The current status of replication.|}*)

  stream_arn: string option;
   (**{|
    The ARN for a specific Kinesis data stream.|}*)

}

(**{|
    Represents a set of primary keys and, for each key, the attributes to
    retrieve from the table.
    
    For each primary key, you must provide {i all} of the key attributes. For
    example, with a simple primary key, you only need to provide the
    partition key. For a composite primary key, you must provide {i both} the
    partition key and the sort key.|}*)
type keys_and_attributes = {
  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression. The
    following are some use cases for using [ExpressionAttributeNames]:
    
    {ol 
          {- To access an attribute whose name conflicts with a DynamoDB
             reserved word.
             }
          
          {- To create a placeholder for repeating occurrences of an
             attribute name in an expression.
             }
          
          {- To prevent special characters in an attribute name from being
             misinterpreted in an expression.
             }
          
    }
    
    Use the {b #} character in an expression to dereference an attribute
    name. For example, consider the following attribute name:
    
    {ol 
          {- [Percentile]
             }
          
    }
    
    The name of this attribute conflicts with a reserved word, so it cannot
    be used directly in an expression. (For the complete list of reserved
    words, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html }Reserved
    Words} in the {i Amazon DynamoDB Developer Guide}). To work around this,
    you could specify the following for [ExpressionAttributeNames]:
    
    {ol 
          {- [{"#P":"Percentile"}]
             }
          
    }
    
    You could then use this substitution in an expression, as in this
    example:
    
    {ol 
          {- [#P = :val]
             }
          
    }
    
    Tokens that begin with the {b :} character are {i expression attribute
    values}, which are placeholders for the actual value at runtime.
    
    For more information on expression attribute names, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Accessing
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  projection_expression: string option;
   (**{|
    A string that identifies one or more attributes to retrieve from the
    table. These attributes can include scalars, sets, or elements of a JSON
    document. The attributes in the [ProjectionExpression] must be separated
    by commas.
    
    If no attribute names are specified, then all attributes will be
    returned. If any of the requested attributes are not found, they will not
    appear in the result.
    
    For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Accessing
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  consistent_read: bool option;
   (**{|
    The consistency of a read operation. If set to [true], then a strongly
    consistent read is used; otherwise, an eventually consistent read is
    used.|}*)

  attributes_to_get: string list option;
   (**{|
    This is a legacy parameter. Use [ProjectionExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html }Legacy
    Conditional Parameters} in the {i Amazon DynamoDB Developer Guide}.|}*)

  keys: (string * attribute_value) list list;
   (**{|
    The primary key attribute values that define the items and the attributes
    associated with the items.|}*)

}

(**{|
    The specified [ExportTime] is outside of the point in time recovery
    window.|}*)
type invalid_export_time_exception = {
  message: string option;
  
}

(**{|
    Processing options for the CSV file being imported.|}*)
type csv_options = {
  header_list: string list option;
   (**{|
    List of the headers used to specify a common header for all source CSV
    files being imported. If this field is specified then the first line of
    each CSV file is treated as data instead of the header. If this field is
    not specified the the first line of each CSV file is treated as the
    header.|}*)

  delimiter: string option;
   (**{|
    The delimiter used for separating items in the CSV file being imported.|}*)

}

(**{|
    The format options for the data that was imported into the target table.
    There is one value, CsvOption.|}*)
type input_format_options = {
  csv: csv_options option;
   (**{|
    The options for imported source files in CSV format. The values are
    Delimiter and HeaderList.|}*)

}

type input_compression_type = | NONE
  | ZSTD
  | GZIP

type export_view_type = | NEW_AND_OLD_IMAGES
  | NEW_IMAGE

(**{|
    Optional object containing the parameters specific to an incremental
    export.|}*)
type incremental_export_specification = {
  export_view_type: export_view_type option;
   (**{|
    The view type that was chosen for the export. Valid values are
    [NEW_AND_OLD_IMAGES] and [NEW_IMAGES]. The default value is
    [NEW_AND_OLD_IMAGES].|}*)

  export_to_time: float option;
   (**{|
    Time in the past which provides the exclusive end range for the export
    table's data, counted in seconds from the start of the Unix epoch. The
    incremental export will reflect the table's state just prior to this
    point in time. If this is not provided, the latest time with data
    available will be used.|}*)

  export_from_time: float option;
   (**{|
    Time in the past which provides the inclusive start range for the export
    table's data, counted in seconds from the start of the Unix epoch. The
    incremental export will reflect the table's state including and after
    this point in time.|}*)

}

(**{|
    Represents the properties of the table being imported into.|}*)
type import_table_description = {
  failure_message: string option;
   (**{|
    The error message corresponding to the failure that the import job ran
    into during execution.|}*)

  failure_code: string option;
   (**{|
    The error code corresponding to the failure that the import job ran into
    during execution.|}*)

  imported_item_count: int option;
   (**{|
    The number of items successfully imported into the new table.|}*)

  processed_item_count: int option;
   (**{|
    The total number of items processed from the source file.|}*)

  processed_size_bytes: int option;
   (**{|
    The total size of data processed from the source file, in Bytes.|}*)

  end_time: float option;
   (**{|
    The time at which the creation of the table associated with this import
    task completed.|}*)

  start_time: float option;
   (**{|
    The time when this import task started.|}*)

  table_creation_parameters: table_creation_parameters option;
   (**{|
    The parameters for the new table that is being imported into.|}*)

  input_compression_type: input_compression_type option;
   (**{|
    The compression options for the data that has been imported into the
    target table. The values are NONE, GZIP, or ZSTD.|}*)

  input_format_options: input_format_options option;
   (**{|
    The format options for the data that was imported into the target table.
    There is one value, CsvOption.|}*)

  input_format: input_format option;
   (**{|
    The format of the source data going into the target table.|}*)

  cloud_watch_log_group_arn: string option;
   (**{|
    The Amazon Resource Number (ARN) of the Cloudwatch Log Group associated
    with the target table.|}*)

  error_count: int option;
   (**{|
    The number of errors occurred on importing the source file into the
    target table.|}*)

  s3_bucket_source: s3_bucket_source option;
   (**{|
    Values for the S3 bucket the source file is imported from. Includes
    bucket name (required), key prefix (optional) and bucket account owner ID
    (optional).|}*)

  client_token: string option;
   (**{|
    The client token that was provided for the import task. Reusing the
    client token on retry makes a call to [ImportTable] idempotent.|}*)

  table_id: string option;
   (**{|
    The table id corresponding to the table created by import table process.|}*)

  table_arn: string option;
   (**{|
    The Amazon Resource Number (ARN) of the table being imported into.|}*)

  import_status: import_status option;
   (**{|
    The status of the import.|}*)

  import_arn: string option;
   (**{|
    The Amazon Resource Number (ARN) corresponding to the import request.|}*)

}

type import_table_output = {
  import_table_description: import_table_description;
   (**{|
    Represents the properties of the table created for the import, and
    parameters of the import. The import parameters include import status,
    how many items were processed, and how many errors were encountered.|}*)

}

type import_table_input = {
  table_creation_parameters: table_creation_parameters;
   (**{|
    Parameters for the table to import the data into.|}*)

  input_compression_type: input_compression_type option;
   (**{|
    Type of compression to be used on the input coming from the imported
    table.|}*)

  input_format_options: input_format_options option;
   (**{|
    Additional properties that specify how the input is formatted,|}*)

  input_format: input_format;
   (**{|
    The format of the source data. Valid values for [ImportFormat] are [CSV],
    [DYNAMODB_JSON] or [ION].|}*)

  s3_bucket_source: s3_bucket_source;
   (**{|
    The S3 bucket that provides the source for the import.|}*)

  client_token: string option;
   (**{|
    Providing a [ClientToken] makes the call to [ImportTableInput]
    idempotent, meaning that multiple identical calls have the same effect as
    one single call.
    
    A client token is valid for 8 hours after the first request that uses it
    is completed. After 8 hours, any request with the same client token is
    treated as a new request. Do not resubmit the same request with the same
    client token for more than 8 hours, or the result might not be
    idempotent.
    
    If you submit a request with the same client token but a change in other
    parameters within the 8-hour idempotency window, DynamoDB returns an
    [IdempotentParameterMismatch] exception.|}*)

}

(**{|
    There was a conflict when importing from the specified S3 source. This
    can occur when the current import conflicts with a previous import
    request that had the same client token.|}*)
type import_conflict_exception = {
  message: string option;
  
}

(**{|
    The specified import was not found.|}*)
type import_not_found_exception = {
  message: string option;
  
}

(**{|
    The specified global table already exists.|}*)
type global_table_already_exists_exception = {
  message: string option;
  
}

type get_resource_policy_output = {
  revision_id: string option;
   (**{|
    A unique string that represents the revision ID of the policy. If you're
    comparing revision IDs, make sure to always use string comparison logic.|}*)

  policy: string option;
   (**{|
    The resource-based policy document attached to the resource, which can be
    a table or stream, in JSON format.|}*)

}

type get_resource_policy_input = {
  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the DynamoDB resource to which the
    policy is attached. The resources you can specify include tables and
    streams.|}*)

}

(**{|
    Represents the output of a [GetItem] operation.|}*)
type get_item_output = {
  consumed_capacity: consumed_capacity option;
   (**{|
    The capacity units consumed by the [GetItem] operation. The data returned
    includes the total provisioned throughput consumed, along with statistics
    for the table and any indexes involved in the operation.
    [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity]
    parameter was specified. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption }Capacity
    unit consumption for read operations} in the {i Amazon DynamoDB Developer
    Guide}.|}*)

  item: (string * attribute_value) list option;
   (**{|
    A map of attribute names to [AttributeValue] objects, as specified by
    [ProjectionExpression].|}*)

}

(**{|
    Represents the input of a [GetItem] operation.|}*)
type get_item_input = {
  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression. The
    following are some use cases for using [ExpressionAttributeNames]:
    
    {ol 
          {- To access an attribute whose name conflicts with a DynamoDB
             reserved word.
             }
          
          {- To create a placeholder for repeating occurrences of an
             attribute name in an expression.
             }
          
          {- To prevent special characters in an attribute name from being
             misinterpreted in an expression.
             }
          
    }
    
    Use the {b #} character in an expression to dereference an attribute
    name. For example, consider the following attribute name:
    
    {ol 
          {- [Percentile]
             }
          
    }
    
    The name of this attribute conflicts with a reserved word, so it cannot
    be used directly in an expression. (For the complete list of reserved
    words, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html }Reserved
    Words} in the {i Amazon DynamoDB Developer Guide}). To work around this,
    you could specify the following for [ExpressionAttributeNames]:
    
    {ol 
          {- [{"#P":"Percentile"}]
             }
          
    }
    
    You could then use this substitution in an expression, as in this
    example:
    
    {ol 
          {- [#P = :val]
             }
          
    }
    
    Tokens that begin with the {b :} character are {i expression attribute
    values}, which are placeholders for the actual value at runtime.
    
    For more information on expression attribute names, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Specifying
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  projection_expression: string option;
   (**{|
    A string that identifies one or more attributes to retrieve from the
    table. These attributes can include scalars, sets, or elements of a JSON
    document. The attributes in the expression must be separated by commas.
    
    If no attribute names are specified, then all attributes are returned. If
    any of the requested attributes are not found, they do not appear in the
    result.
    
    For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Specifying
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  return_consumed_capacity: return_consumed_capacity option;
  
  consistent_read: bool option;
   (**{|
    Determines the read consistency model: If set to [true], then the
    operation uses strongly consistent reads; otherwise, the operation uses
    eventually consistent reads.|}*)

  attributes_to_get: string list option;
   (**{|
    This is a legacy parameter. Use [ProjectionExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html }AttributesToGet}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  key: (string * attribute_value) list;
   (**{|
    A map of attribute names to [AttributeValue] objects, representing the
    primary key of the item to retrieve.
    
    For the primary key, you must provide all of the attributes. For example,
    with a simple primary key, you only need to provide a value for the
    partition key. For a composite primary key, you must provide values for
    both the partition key and the sort key.|}*)

  table_name: string;
   (**{|
    The name of the table containing the requested item. You can also provide
    the Amazon Resource Name (ARN) of the table in this parameter.|}*)

}

(**{|
    Represents a failure a contributor insights operation.|}*)
type failure_exception = {
  exception_description: string option;
   (**{|
    Description of the failure.|}*)

  exception_name: string option;
   (**{|
    Exception name.|}*)

}

type export_format = | ION
  | DYNAMODB_JSON

(**{|
    Represents the properties of the exported table.|}*)
type export_description = {
  incremental_export_specification: incremental_export_specification option;
   (**{|
    Optional object containing the parameters specific to an incremental
    export.|}*)

  export_type: export_type option;
   (**{|
    The type of export that was performed. Valid values are [FULL_EXPORT] or
    [INCREMENTAL_EXPORT].|}*)

  item_count: int option;
   (**{|
    The number of items exported.|}*)

  billed_size_bytes: int option;
   (**{|
    The billable size of the table export.|}*)

  export_format: export_format option;
   (**{|
    The format of the exported data. Valid values for [ExportFormat] are
    [DYNAMODB_JSON] or [ION].|}*)

  failure_message: string option;
   (**{|
    Export failure reason description.|}*)

  failure_code: string option;
   (**{|
    Status code for the result of the failed export.|}*)

  s3_sse_kms_key_id: string option;
   (**{|
    The ID of the KMS managed key used to encrypt the S3 bucket where export
    data is stored (if applicable).|}*)

  s3_sse_algorithm: s3_sse_algorithm option;
   (**{|
    Type of encryption used on the bucket where export data is stored. Valid
    values for [S3SseAlgorithm] are:
    
    {ol 
          {- [AES256] - server-side encryption with Amazon S3 managed keys
             }
          
          {- [KMS] - server-side encryption with KMS managed keys
             }
          
    }
    |}*)

  s3_prefix: string option;
   (**{|
    The Amazon S3 bucket prefix used as the file name and path of the
    exported snapshot.|}*)

  s3_bucket_owner: string option;
   (**{|
    The ID of the Amazon Web Services account that owns the bucket containing
    the export.|}*)

  s3_bucket: string option;
   (**{|
    The name of the Amazon S3 bucket containing the export.|}*)

  client_token: string option;
   (**{|
    The client token that was provided for the export task. A client token
    makes calls to [ExportTableToPointInTimeInput] idempotent, meaning that
    multiple identical calls have the same effect as one single call.|}*)

  export_time: float option;
   (**{|
    Point in time from which table data was exported.|}*)

  table_id: string option;
   (**{|
    Unique ID of the table that was exported.|}*)

  table_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the table that was exported.|}*)

  export_manifest: string option;
   (**{|
    The name of the manifest file for the export task.|}*)

  end_time: float option;
   (**{|
    The time at which the export task completed.|}*)

  start_time: float option;
   (**{|
    The time at which the export task began.|}*)

  export_status: export_status option;
   (**{|
    Export can be in one of the following states: IN_PROGRESS, COMPLETED, or
    FAILED.|}*)

  export_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the table export.|}*)

}

type export_table_to_point_in_time_output = {
  export_description: export_description option;
   (**{|
    Contains a description of the table export.|}*)

}

type export_table_to_point_in_time_input = {
  incremental_export_specification: incremental_export_specification option;
   (**{|
    Optional object containing the parameters specific to an incremental
    export.|}*)

  export_type: export_type option;
   (**{|
    Choice of whether to execute as a full export or incremental export.
    Valid values are FULL_EXPORT or INCREMENTAL_EXPORT. The default value is
    FULL_EXPORT. If INCREMENTAL_EXPORT is provided, the
    IncrementalExportSpecification must also be used.|}*)

  export_format: export_format option;
   (**{|
    The format for the exported data. Valid values for [ExportFormat] are
    [DYNAMODB_JSON] or [ION].|}*)

  s3_sse_kms_key_id: string option;
   (**{|
    The ID of the KMS managed key used to encrypt the S3 bucket where export
    data will be stored (if applicable).|}*)

  s3_sse_algorithm: s3_sse_algorithm option;
   (**{|
    Type of encryption used on the bucket where export data will be stored.
    Valid values for [S3SseAlgorithm] are:
    
    {ol 
          {- [AES256] - server-side encryption with Amazon S3 managed keys
             }
          
          {- [KMS] - server-side encryption with KMS managed keys
             }
          
    }
    |}*)

  s3_prefix: string option;
   (**{|
    The Amazon S3 bucket prefix to use as the file name and path of the
    exported snapshot.|}*)

  s3_bucket_owner: string option;
   (**{|
    The ID of the Amazon Web Services account that owns the bucket the export
    will be stored in.
    
    S3BucketOwner is a required parameter when exporting to a S3 bucket in
    another account.
    |}*)

  s3_bucket: string;
   (**{|
    The name of the Amazon S3 bucket to export the snapshot to.|}*)

  client_token: string option;
   (**{|
    Providing a [ClientToken] makes the call to
    [ExportTableToPointInTimeInput] idempotent, meaning that multiple
    identical calls have the same effect as one single call.
    
    A client token is valid for 8 hours after the first request that uses it
    is completed. After 8 hours, any request with the same client token is
    treated as a new request. Do not resubmit the same request with the same
    client token for more than 8 hours, or the result might not be
    idempotent.
    
    If you submit a request with the same client token but a change in other
    parameters within the 8-hour idempotency window, DynamoDB returns an
    [ImportConflictException].|}*)

  export_time: float option;
   (**{|
    Time in the past from which to export table data, counted in seconds from
    the start of the Unix epoch. The table export will be a snapshot of the
    table's state at this point in time.|}*)

  table_arn: string;
   (**{|
    The Amazon Resource Name (ARN) associated with the table to export.|}*)

}

(**{|
    There was a conflict when writing to the specified S3 bucket.|}*)
type export_conflict_exception = {
  message: string option;
  
}

(**{|
    The specified export was not found.|}*)
type export_not_found_exception = {
  message: string option;
  
}

type execute_transaction_output = {
  consumed_capacity: consumed_capacity list option;
   (**{|
    The capacity units consumed by the entire operation. The values of the
    list are ordered according to the ordering of the statements.|}*)

  responses: item_response list option;
   (**{|
    The response to a PartiQL transaction.|}*)

}

type execute_transaction_input = {
  return_consumed_capacity: return_consumed_capacity option;
   (**{|
    Determines the level of detail about either provisioned or on-demand
    throughput consumption that is returned in the response. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_TransactGetItems.html }TransactGetItems}
    and
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_TransactWriteItems.html }TransactWriteItems}.
    |}*)

  client_request_token: string option;
   (**{|
    Set this value to get remaining results, if [NextToken] was returned in
    the statement response.|}*)

  transact_statements: parameterized_statement list;
   (**{|
    The list of PartiQL statements representing the transaction to run.|}*)

}

type execute_statement_output = {
  last_evaluated_key: (string * attribute_value) list option;
   (**{|
    The primary key of the item where the operation stopped, inclusive of the
    previous result set. Use this value to start a new operation, excluding
    this value in the new request. If [LastEvaluatedKey] is empty, then the
    "last page" of results has been processed and there is no more data to be
    retrieved. If [LastEvaluatedKey] is not empty, it does not necessarily
    mean that there is more data in the result set. The only way to know when
    you have reached the end of the result set is when [LastEvaluatedKey] is
    empty.|}*)

  consumed_capacity: consumed_capacity option;
  
  next_token: string option;
   (**{|
    If the response of a read request exceeds the response payload limit
    DynamoDB will set this value in the response. If set, you can use that
    this value in the subsequent request to get the remaining results.|}*)

  items: (string * attribute_value) list list option;
   (**{|
    If a read operation was used, this property will contain the result of
    the read operation; a map of attribute names and their values. For the
    write operations this value will be empty.|}*)

}

type execute_statement_input = {
  return_values_on_condition_check_failure: return_values_on_condition_check_failure option;
   (**{|
    An optional parameter that returns the item attributes for an
    [ExecuteStatement] operation that failed a condition check.
    
    There is no additional cost associated with requesting a return value
    aside from the small network and processing overhead of receiving a
    larger response. No read capacity units are consumed.|}*)

  limit: int option;
   (**{|
    The maximum number of items to evaluate (not necessarily the number of
    matching items). If DynamoDB processes the number of items up to the
    limit while processing the results, it stops the operation and returns
    the matching values up to that point, along with a key in
    [LastEvaluatedKey] to apply in a subsequent operation so you can pick up
    where you left off. Also, if the processed dataset size exceeds 1 MB
    before DynamoDB reaches this limit, it stops the operation and returns
    the matching values up to the limit, and a key in [LastEvaluatedKey] to
    apply in a subsequent operation to continue the operation.|}*)

  return_consumed_capacity: return_consumed_capacity option;
  
  next_token: string option;
   (**{|
    Set this value to get remaining results, if [NextToken] was returned in
    the statement response.|}*)

  consistent_read: bool option;
   (**{|
    The consistency of a read operation. If set to [true], then a strongly
    consistent read is used; otherwise, an eventually consistent read is
    used.|}*)

  parameters: attribute_value list option;
   (**{|
    The parameters for the PartiQL statement, if any.|}*)

  statement: string;
   (**{|
    The PartiQL statement representing the operation to run.|}*)

}

(**{|
    There was an attempt to insert an item with the same primary key as an
    item that already exists in the DynamoDB table.|}*)
type duplicate_item_exception = {
  message: string option;
  
}

(**{|
    An endpoint information details.|}*)
type endpoint = {
  cache_period_in_minutes: int;
   (**{|
    Endpoint cache time to live (TTL) value.|}*)

  address: string;
   (**{|
    IP address of the endpoint.|}*)

}

type describe_time_to_live_output = {
  time_to_live_description: time_to_live_description option;
   (**{|
    |}*)

}

type describe_time_to_live_input = {
  table_name: string;
   (**{|
    The name of the table to be described. You can also provide the Amazon
    Resource Name (ARN) of the table in this parameter.|}*)

}

type describe_table_replica_auto_scaling_output = {
  table_auto_scaling_description: table_auto_scaling_description option;
   (**{|
    Represents the auto scaling properties of the table.|}*)

}

type describe_table_replica_auto_scaling_input = {
  table_name: string;
   (**{|
    The name of the table. You can also provide the Amazon Resource Name
    (ARN) of the table in this parameter.|}*)

}

(**{|
    Represents the output of a [DescribeTable] operation.|}*)
type describe_table_output = {
  table: table_description option;
   (**{|
    The properties of the table.|}*)

}

(**{|
    Represents the input of a [DescribeTable] operation.|}*)
type describe_table_input = {
  table_name: string;
   (**{|
    The name of the table to describe. You can also provide the Amazon
    Resource Name (ARN) of the table in this parameter.|}*)

}

(**{|
    Represents the output of a [DescribeLimits] operation.|}*)
type describe_limits_output = {
  table_max_write_capacity_units: int option;
   (**{|
    The maximum write capacity units that your account allows you to
    provision for a new table that you are creating in this Region, including
    the write capacity units provisioned for its global secondary indexes
    (GSIs).|}*)

  table_max_read_capacity_units: int option;
   (**{|
    The maximum read capacity units that your account allows you to provision
    for a new table that you are creating in this Region, including the read
    capacity units provisioned for its global secondary indexes (GSIs).|}*)

  account_max_write_capacity_units: int option;
   (**{|
    The maximum total write capacity units that your account allows you to
    provision across all of your tables in this Region.|}*)

  account_max_read_capacity_units: int option;
   (**{|
    The maximum total read capacity units that your account allows you to
    provision across all of your tables in this Region.|}*)

}

(**{|
    Represents the input of a [DescribeLimits] operation. Has no content.|}*)
type describe_limits_input = unit

type describe_kinesis_streaming_destination_output = {
  kinesis_data_stream_destinations: kinesis_data_stream_destination list option;
   (**{|
    The list of replica structures for the table being described.|}*)

  table_name: string option;
   (**{|
    The name of the table being described.|}*)

}

type describe_kinesis_streaming_destination_input = {
  table_name: string;
   (**{|
    The name of the table being described. You can also provide the Amazon
    Resource Name (ARN) of the table in this parameter.|}*)

}

type describe_import_output = {
  import_table_description: import_table_description;
   (**{|
    Represents the properties of the table created for the import, and
    parameters of the import. The import parameters include import status,
    how many items were processed, and how many errors were encountered.|}*)

}

type describe_import_input = {
  import_arn: string;
   (**{|
    The Amazon Resource Name (ARN) associated with the table you're importing
    to.|}*)

}

type describe_global_table_settings_output = {
  replica_settings: replica_settings_description list option;
   (**{|
    The Region-specific settings for the global table.|}*)

  global_table_name: string option;
   (**{|
    The name of the global table.|}*)

}

type describe_global_table_settings_input = {
  global_table_name: string;
   (**{|
    The name of the global table to describe.|}*)

}

type describe_global_table_output = {
  global_table_description: global_table_description option;
   (**{|
    Contains the details of the global table.|}*)

}

type describe_global_table_input = {
  global_table_name: string;
   (**{|
    The name of the global table.|}*)

}

type describe_export_output = {
  export_description: export_description option;
   (**{|
    Represents the properties of the export.|}*)

}

type describe_export_input = {
  export_arn: string;
   (**{|
    The Amazon Resource Name (ARN) associated with the export.|}*)

}

type describe_endpoints_response = {
  endpoints: endpoint list;
   (**{|
    List of endpoints.|}*)

}

type describe_endpoints_request = unit

type describe_contributor_insights_output = {
  failure_exception: failure_exception option;
   (**{|
    Returns information about the last failure that was encountered.
    
    The most common exceptions for a FAILED status are:
    
    {ol 
          {- LimitExceededException - Per-account Amazon CloudWatch
             Contributor Insights rule limit reached. Please disable
             Contributor Insights for other tables/indexes OR disable
             Contributor Insights rules before retrying.
             }
          
          {- AccessDeniedException - Amazon CloudWatch Contributor Insights
             rules cannot be modified due to insufficient permissions.
             }
          
          {- AccessDeniedException - Failed to create service-linked role for
             Contributor Insights due to insufficient permissions.
             }
          
          {- InternalServerError - Failed to create Amazon CloudWatch
             Contributor Insights rules. Please retry request.
             }
          
    }
    |}*)

  last_update_date_time: float option;
   (**{|
    Timestamp of the last time the status was changed.|}*)

  contributor_insights_status: contributor_insights_status option;
   (**{|
    Current status of contributor insights.|}*)

  contributor_insights_rule_list: string list option;
   (**{|
    List of names of the associated contributor insights rules.|}*)

  index_name: string option;
   (**{|
    The name of the global secondary index being described.|}*)

  table_name: string option;
   (**{|
    The name of the table being described.|}*)

}

type describe_contributor_insights_input = {
  index_name: string option;
   (**{|
    The name of the global secondary index to describe, if applicable.|}*)

  table_name: string;
   (**{|
    The name of the table to describe. You can also provide the Amazon
    Resource Name (ARN) of the table in this parameter.|}*)

}

type describe_continuous_backups_output = {
  continuous_backups_description: continuous_backups_description option;
   (**{|
    Represents the continuous backups and point in time recovery settings on
    the table.|}*)

}

type describe_continuous_backups_input = {
  table_name: string;
   (**{|
    Name of the table for which the customer wants to check the continuous
    backups and point in time recovery settings.
    
    You can also provide the Amazon Resource Name (ARN) of the table in this
    parameter.|}*)

}

(**{|
    Contains the details of the backup created for the table.|}*)
type backup_details = {
  backup_expiry_date_time: float option;
   (**{|
    Time at which the automatic on-demand backup created by DynamoDB will
    expire. This [SYSTEM] on-demand backup expires automatically 35 days
    after its creation.|}*)

  backup_creation_date_time: float;
   (**{|
    Time at which the backup was created. This is the request time of the
    backup.|}*)

  backup_type: backup_type;
   (**{|
    BackupType:
    
    {ol 
          {- [USER] - You create and manage these using the on-demand backup
             feature.
             }
          
          {- [SYSTEM] - If you delete a table with point-in-time recovery
             enabled, a [SYSTEM] backup is automatically created and is
             retained for 35 days (at no additional cost). System backups
             allow you to restore the deleted table to the state it was in
             just before the point of deletion.
             }
          
          {- [AWS_BACKUP] - On-demand backup created by you from Backup
             service.
             }
          
    }
    |}*)

  backup_status: backup_status;
   (**{|
    Backup can be in one of the following states: CREATING, ACTIVE, DELETED.|}*)

  backup_size_bytes: int option;
   (**{|
    Size of the backup in bytes. DynamoDB updates this value approximately
    every six hours. Recent changes might not be reflected in this value.|}*)

  backup_name: string;
   (**{|
    Name of the requested backup.|}*)

  backup_arn: string;
   (**{|
    ARN associated with the backup.|}*)

}

(**{|
    Contains the description of the backup created for the table.|}*)
type backup_description = {
  source_table_feature_details: source_table_feature_details option;
   (**{|
    Contains the details of the features enabled on the table when the backup
    was created. For example, LSIs, GSIs, streams, TTL.|}*)

  source_table_details: source_table_details option;
   (**{|
    Contains the details of the table when the backup was created.|}*)

  backup_details: backup_details option;
   (**{|
    Contains the details of the backup created for the table.|}*)

}

type describe_backup_output = {
  backup_description: backup_description option;
   (**{|
    Contains the description of the backup created for the table.|}*)

}

type describe_backup_input = {
  backup_arn: string;
   (**{|
    The Amazon Resource Name (ARN) associated with the backup.|}*)

}

(**{|
    Represents the output of a [DeleteTable] operation.|}*)
type delete_table_output = {
  table_description: table_description option;
   (**{|
    Represents the properties of a table.|}*)

}

(**{|
    Represents the input of a [DeleteTable] operation.|}*)
type delete_table_input = {
  table_name: string;
   (**{|
    The name of the table to delete. You can also provide the Amazon Resource
    Name (ARN) of the table in this parameter.|}*)

}

type delete_resource_policy_output = {
  revision_id: string option;
   (**{|
    A unique string that represents the revision ID of the policy. If you're
    comparing revision IDs, make sure to always use string comparison logic.
    
    This value will be empty if you make a request against a resource without
    a policy.|}*)

}

type delete_resource_policy_input = {
  expected_revision_id: string option;
   (**{|
    A string value that you can use to conditionally delete your policy. When
    you provide an expected revision ID, if the revision ID of the existing
    policy on the resource doesn't match or if there's no policy attached to
    the resource, the request will fail and return a
    [PolicyNotFoundException].|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the DynamoDB resource from which the
    policy will be removed. The resources you can specify include tables and
    streams. If you remove the policy of a table, it will also remove the
    permissions for the table's indexes defined in that policy document. This
    is because index permissions are defined in the table's policy.|}*)

}

(**{|
    Represents the output of a [DeleteItem] operation.|}*)
type delete_item_output = {
  item_collection_metrics: item_collection_metrics option;
   (**{|
    Information about item collections, if any, that were affected by the
    [DeleteItem] operation. [ItemCollectionMetrics] is only returned if the
    [ReturnItemCollectionMetrics] parameter was specified. If the table does
    not have any local secondary indexes, this information is not returned in
    the response.
    
    Each [ItemCollectionMetrics] element consists of:
    
    {ol 
          {- [ItemCollectionKey] - The partition key value of the item
             collection. This is the same as the partition key value of the
             item itself.
             }
          
          {- [SizeEstimateRangeGB] - An estimate of item collection size, in
             gigabytes. This value is a two-element array containing a lower
             bound and an upper bound for the estimate. The estimate includes
             the size of all the items in the table, plus the size of all
             attributes projected into all of the local secondary indexes on
             that table. Use this estimate to measure whether a local
             secondary index is approaching its size limit.
             
          The estimate is subject to change over time; therefore, do not rely
          on the precision or accuracy of the estimate.
          }
          
    }
    |}*)

  consumed_capacity: consumed_capacity option;
   (**{|
    The capacity units consumed by the [DeleteItem] operation. The data
    returned includes the total provisioned throughput consumed, along with
    statistics for the table and any indexes involved in the operation.
    [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity]
    parameter was specified. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html }Provisioned
    capacity mode} in the {i Amazon DynamoDB Developer Guide}.|}*)

  attributes: (string * attribute_value) list option;
   (**{|
    A map of attribute names to [AttributeValue] objects, representing the
    item as it appeared before the [DeleteItem] operation. This map appears
    in the response only if [ReturnValues] was specified as [ALL_OLD] in the
    request.|}*)

}

(**{|
    Represents the input of a [DeleteItem] operation.|}*)
type delete_item_input = {
  return_values_on_condition_check_failure: return_values_on_condition_check_failure option;
   (**{|
    An optional parameter that returns the item attributes for a [DeleteItem]
    operation that failed a condition check.
    
    There is no additional cost associated with requesting a return value
    aside from the small network and processing overhead of receiving a
    larger response. No read capacity units are consumed.|}*)

  expression_attribute_values: (string * attribute_value) list option;
   (**{|
    One or more values that can be substituted in an expression.
    
    Use the {b :} (colon) character in an expression to dereference an
    attribute value. For example, suppose that you wanted to check whether
    the value of the {i ProductStatus} attribute was one of the following:
    
    [Available | Backordered | Discontinued]
    
    You would first need to specify [ExpressionAttributeValues] as follows:
    
    [{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
    ":disc":{"S":"Discontinued"} }]
    
    You could then use these values in an expression, such as this:
    
    [ProductStatus IN (:avail, :back, :disc)]
    
    For more information on expression attribute values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html }Condition
    Expressions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  expression_attribute_names: (string * string) list option;
   (**{|
    One or more substitution tokens for attribute names in an expression. The
    following are some use cases for using [ExpressionAttributeNames]:
    
    {ol 
          {- To access an attribute whose name conflicts with a DynamoDB
             reserved word.
             }
          
          {- To create a placeholder for repeating occurrences of an
             attribute name in an expression.
             }
          
          {- To prevent special characters in an attribute name from being
             misinterpreted in an expression.
             }
          
    }
    
    Use the {b #} character in an expression to dereference an attribute
    name. For example, consider the following attribute name:
    
    {ol 
          {- [Percentile]
             }
          
    }
    
    The name of this attribute conflicts with a reserved word, so it cannot
    be used directly in an expression. (For the complete list of reserved
    words, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html }Reserved
    Words} in the {i Amazon DynamoDB Developer Guide}). To work around this,
    you could specify the following for [ExpressionAttributeNames]:
    
    {ol 
          {- [{"#P":"Percentile"}]
             }
          
    }
    
    You could then use this substitution in an expression, as in this
    example:
    
    {ol 
          {- [#P = :val]
             }
          
    }
    
    Tokens that begin with the {b :} character are {i expression attribute
    values}, which are placeholders for the actual value at runtime.
    
    For more information on expression attribute names, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Specifying
    Item Attributes} in the {i Amazon DynamoDB Developer Guide}.|}*)

  condition_expression: string option;
   (**{|
    A condition that must be satisfied in order for a conditional
    [DeleteItem] to succeed.
    
    An expression can contain any of the following:
    
    {ol 
          {- Functions: [attribute_exists | attribute_not_exists |
             attribute_type | contains | begins_with | size]
             
          These function names are case-sensitive.
          }
          
          {- Comparison operators: [= | <> | < | > | <= | >= | BETWEEN | IN]
             }
          
          {- Logical operators: [AND | OR | NOT]
             }
          
    }
    
    For more information about condition expressions, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html }Condition
    Expressions} in the {i Amazon DynamoDB Developer Guide}.|}*)

  return_item_collection_metrics: return_item_collection_metrics option;
   (**{|
    Determines whether item collection metrics are returned. If set to
    [SIZE], the response includes statistics about item collections, if any,
    that were modified during the operation are returned in the response. If
    set to [NONE] (the default), no statistics are returned.|}*)

  return_consumed_capacity: return_consumed_capacity option;
  
  return_values: return_value option;
   (**{|
    Use [ReturnValues] if you want to get the item attributes as they
    appeared before they were deleted. For [DeleteItem], the valid values
    are:
    
    {ol 
          {- [NONE] - If [ReturnValues] is not specified, or if its value is
             [NONE], then nothing is returned. (This setting is the default
             for [ReturnValues].)
             }
          
          {- [ALL_OLD] - The content of the old item is returned.
             }
          
    }
    
    There is no additional cost associated with requesting a return value
    aside from the small network and processing overhead of receiving a
    larger response. No read capacity units are consumed.
    
    The [ReturnValues] parameter is used by several DynamoDB operations;
    however, [DeleteItem] does not recognize any values other than [NONE] or
    [ALL_OLD].
    |}*)

  conditional_operator: conditional_operator option;
   (**{|
    This is a legacy parameter. Use [ConditionExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html }ConditionalOperator}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  expected: (string * expected_attribute_value) list option;
   (**{|
    This is a legacy parameter. Use [ConditionExpression] instead. For more
    information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html }Expected}
    in the {i Amazon DynamoDB Developer Guide}.|}*)

  key: (string * attribute_value) list;
   (**{|
    A map of attribute names to [AttributeValue] objects, representing the
    primary key of the item to delete.
    
    For the primary key, you must provide all of the key attributes. For
    example, with a simple primary key, you only need to provide a value for
    the partition key. For a composite primary key, you must provide values
    for both the partition key and the sort key.|}*)

  table_name: string;
   (**{|
    The name of the table from which to delete the item. You can also provide
    the Amazon Resource Name (ARN) of the table in this parameter.|}*)

}

type delete_backup_output = {
  backup_description: backup_description option;
   (**{|
    Contains the description of the backup created for the table.|}*)

}

type delete_backup_input = {
  backup_arn: string;
   (**{|
    The ARN associated with the backup.|}*)

}

(**{|
    Represents the output of a [CreateTable] operation.|}*)
type create_table_output = {
  table_description: table_description option;
   (**{|
    Represents the properties of the table.|}*)

}

(**{|
    Represents the input of a [CreateTable] operation.|}*)
type create_table_input = {
  on_demand_throughput: on_demand_throughput option;
   (**{|
    Sets the maximum number of read and write units for the specified table
    in on-demand capacity mode. If you use this parameter, you must specify
    [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.|}*)

  resource_policy: string option;
   (**{|
    An Amazon Web Services resource-based policy document in JSON format that
    will be attached to the table.
    
    When you attach a resource-based policy while creating a table, the
    policy application is {i strongly consistent}.
    
    The maximum size supported for a resource-based policy document is 20 KB.
    DynamoDB counts whitespaces when calculating the size of a policy against
    this limit. For a full list of all considerations that apply for
    resource-based policies, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/rbac-considerations.html }Resource-based
    policy considerations}.
    
    You need to specify the [CreateTable] and [PutResourcePolicy] IAM actions
    for authorizing a user to create a table with a resource-based policy.
    |}*)

  deletion_protection_enabled: bool option;
   (**{|
    Indicates whether deletion protection is to be enabled (true) or disabled
    (false) on the table.|}*)

  table_class: table_class option;
   (**{|
    The table class of the new table. Valid values are [STANDARD] and
    [STANDARD_INFREQUENT_ACCESS].|}*)

  tags: tag list option;
   (**{|
    A list of key-value pairs to label the table. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html }Tagging
    for DynamoDB}.|}*)

  sse_specification: sse_specification option;
   (**{|
    Represents the settings used to enable server-side encryption.|}*)

  stream_specification: stream_specification option;
   (**{|
    The settings for DynamoDB Streams on the table. These settings consist of:
    
    {ol 
          {- [StreamEnabled] - Indicates whether DynamoDB Streams is to be
             enabled (true) or disabled (false).
             }
          
          {- [StreamViewType] - When an item in the table is modified,
             [StreamViewType] determines what information is written to the
             table's stream. Valid values for [StreamViewType] are:
             
          {ol 
                {- [KEYS_ONLY] - Only the key attributes of the modified item
                   are written to the stream.
                   }
                
                {- [NEW_IMAGE] - The entire item, as it appears after it was
                   modified, is written to the stream.
                   }
                
                {- [OLD_IMAGE] - The entire item, as it appeared before it
                   was modified, is written to the stream.
                   }
                
                {- [NEW_AND_OLD_IMAGES] - Both the new and the old item
                   images of the item are written to the stream.
                   }
                
          }
          }
          
    }
    |}*)

  provisioned_throughput: provisioned_throughput option;
   (**{|
    Represents the provisioned throughput settings for a specified table or
    index. The settings can be modified using the [UpdateTable] operation.
    
    If you set BillingMode as [PROVISIONED], you must specify this property.
    If you set BillingMode as [PAY_PER_REQUEST], you cannot specify this
    property.
    
    For current minimum and maximum provisioned throughput values, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html }Service,
    Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.|}*)

  billing_mode: billing_mode option;
   (**{|
    Controls how you are charged for read and write throughput and how you
    manage capacity. This setting can be changed later.
    
    {ol 
          {- [PROVISIONED] - We recommend using [PROVISIONED] for predictable
             workloads. [PROVISIONED] sets the billing mode to
             {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html }Provisioned
             capacity mode}.
             }
          
          {- [PAY_PER_REQUEST] - We recommend using [PAY_PER_REQUEST] for
             unpredictable workloads. [PAY_PER_REQUEST] sets the billing mode
             to
             {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html }On-demand
             capacity mode}.
             }
          
    }
    |}*)

  global_secondary_indexes: global_secondary_index list option;
   (**{|
    One or more global secondary indexes (the maximum is 20) to be created on
    the table. Each global secondary index in the array includes the
    following:
    
    {ol 
          {- [IndexName] - The name of the global secondary index. Must be
             unique only for this table.
             
          
          }
          
          {- [KeySchema] - Specifies the key schema for the global secondary
             index.
             }
          
          {- [Projection] - Specifies attributes that are copied (projected)
             from the table into the index. These are in addition to the
             primary key attributes and index key attributes, which are
             automatically projected. Each attribute specification is
             composed of:
             
          {ol 
                {- [ProjectionType] - One of the following:
                   
                {ol 
                      {- [KEYS_ONLY] - Only the index and primary keys are
                         projected into the index.
                         }
                      
                      {- [INCLUDE] - Only the specified table attributes are
                         projected into the index. The list of projected
                         attributes is in [NonKeyAttributes].
                         }
                      
                      {- [ALL] - All of the table attributes are projected
                         into the index.
                         }
                      
                }
                }
                
                {- [NonKeyAttributes] - A list of one or more non-key
                   attribute names that are projected into the secondary
                   index. The total count of attributes provided in
                   [NonKeyAttributes], summed across all of the secondary
                   indexes, must not exceed 100. If you project the same
                   attribute into two different indexes, this counts as two
                   distinct attributes when determining the total.
                   }
                
          }
          }
          
          {- [ProvisionedThroughput] - The provisioned throughput settings
             for the global secondary index, consisting of read and write
             capacity units.
             }
          
    }
    |}*)

  local_secondary_indexes: local_secondary_index list option;
   (**{|
    One or more local secondary indexes (the maximum is 5) to be created on
    the table. Each index is scoped to a given partition key value. There is
    a 10 GB size limit per partition key value; otherwise, the size of a
    local secondary index is unconstrained.
    
    Each local secondary index in the array includes the following:
    
    {ol 
          {- [IndexName] - The name of the local secondary index. Must be
             unique only for this table.
             
          
          }
          
          {- [KeySchema] - Specifies the key schema for the local secondary
             index. The key schema must begin with the same partition key as
             the table.
             }
          
          {- [Projection] - Specifies attributes that are copied (projected)
             from the table into the index. These are in addition to the
             primary key attributes and index key attributes, which are
             automatically projected. Each attribute specification is
             composed of:
             
          {ol 
                {- [ProjectionType] - One of the following:
                   
                {ol 
                      {- [KEYS_ONLY] - Only the index and primary keys are
                         projected into the index.
                         }
                      
                      {- [INCLUDE] - Only the specified table attributes are
                         projected into the index. The list of projected
                         attributes is in [NonKeyAttributes].
                         }
                      
                      {- [ALL] - All of the table attributes are projected
                         into the index.
                         }
                      
                }
                }
                
                {- [NonKeyAttributes] - A list of one or more non-key
                   attribute names that are projected into the secondary
                   index. The total count of attributes provided in
                   [NonKeyAttributes], summed across all of the secondary
                   indexes, must not exceed 100. If you project the same
                   attribute into two different indexes, this counts as two
                   distinct attributes when determining the total.
                   }
                
          }
          }
          
    }
    |}*)

  key_schema: key_schema_element list;
   (**{|
    Specifies the attributes that make up the primary key for a table or an
    index. The attributes in [KeySchema] must also be defined in the
    [AttributeDefinitions] array. For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html }Data
    Model} in the {i Amazon DynamoDB Developer Guide}.
    
    Each [KeySchemaElement] in the array is composed of:
    
    {ol 
          {- [AttributeName] - The name of this key attribute.
             }
          
          {- [KeyType] - The role that the key attribute will assume:
             
          {ol 
                {- [HASH] - partition key
                   }
                
                {- [RANGE] - sort key
                   }
                
          }
          }
          
    }
    
    The partition key of an item is also known as its {i hash attribute}. The
    term "hash attribute" derives from the DynamoDB usage of an internal hash
    function to evenly distribute data items across partitions, based on
    their partition key values.
    
    The sort key of an item is also known as its {i range attribute}. The
    term "range attribute" derives from the way DynamoDB stores items with
    the same partition key physically close together, in sorted order by the
    sort key value.
    
    For a simple primary key (partition key), you must provide exactly one
    element with a [KeyType] of [HASH].
    
    For a composite primary key (partition key and sort key), you must
    provide exactly two elements, in this order: The first element must have
    a [KeyType] of [HASH], and the second element must have a [KeyType] of
    [RANGE].
    
    For more information, see
    {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#WorkingWithTables.primary.key }Working
    with Tables} in the {i Amazon DynamoDB Developer Guide}.|}*)

  table_name: string;
   (**{|
    The name of the table to create. You can also provide the Amazon Resource
    Name (ARN) of the table in this parameter.|}*)

  attribute_definitions: attribute_definition list;
   (**{|
    An array of attributes that describe the key schema for the table and
    indexes.|}*)

}

type create_global_table_output = {
  global_table_description: global_table_description option;
   (**{|
    Contains the details of the global table.|}*)

}

type create_global_table_input = {
  replication_group: replica list;
   (**{|
    The Regions where the global table needs to be created.|}*)

  global_table_name: string;
   (**{|
    The global table name.|}*)

}

type create_backup_output = {
  backup_details: backup_details option;
   (**{|
    Contains the details of the backup created for the table.|}*)

}

type create_backup_input = {
  backup_name: string;
   (**{|
    Specified name for the backup.|}*)

  table_name: string;
   (**{|
    The name of the table. You can also provide the Amazon Resource Name
    (ARN) of the table in this parameter.|}*)

}

(**{|
    Represents the output of a [BatchWriteItem] operation.|}*)
type batch_write_item_output = {
  consumed_capacity: consumed_capacity list option;
   (**{|
    The capacity units consumed by the entire [BatchWriteItem] operation.
    
    Each element consists of:
    
    {ol 
          {- [TableName] - The table that consumed the provisioned throughput.
             }
          
          {- [CapacityUnits] - The total number of capacity units consumed.
             }
          
    }
    |}*)

  item_collection_metrics: (string * item_collection_metrics list) list option;
   (**{|
    A list of tables that were processed by [BatchWriteItem] and, for each
    table, information about any item collections that were affected by
    individual [DeleteItem] or [PutItem] operations.
    
    Each entry consists of the following subelements:
    
    {ol 
          {- [ItemCollectionKey] - The partition key value of the item
             collection. This is the same as the partition key value of the
             item.
             }
          
          {- [SizeEstimateRangeGB] - An estimate of item collection size,
             expressed in GB. This is a two-element array containing a lower
             bound and an upper bound for the estimate. The estimate includes
             the size of all the items in the table, plus the size of all
             attributes projected into all of the local secondary indexes on
             the table. Use this estimate to measure whether a local
             secondary index is approaching its size limit.
             
          The estimate is subject to change over time; therefore, do not rely
          on the precision or accuracy of the estimate.
          }
          
    }
    |}*)

  unprocessed_items: (string * write_request list) list option;
   (**{|
    A map of tables and requests against those tables that were not
    processed. The [UnprocessedItems] value is in the same form as
    [RequestItems], so you can provide this value directly to a subsequent
    [BatchWriteItem] operation. For more information, see [RequestItems] in
    the Request Parameters section.
    
    Each [UnprocessedItems] entry consists of a table name or table ARN and,
    for that table, a list of operations to perform ([DeleteRequest] or
    [PutRequest]).
    
    {ol 
          {- [DeleteRequest] - Perform a [DeleteItem] operation on the
             specified item. The item to be deleted is identified by a [Key]
             subelement:
             
          {ol 
                {- [Key] - A map of primary key attribute values that
                   uniquely identify the item. Each entry in this map
                   consists of an attribute name and an attribute value.
                   }
                
          }
          }
          
          {- [PutRequest] - Perform a [PutItem] operation on the specified
             item. The item to be put is identified by an [Item] subelement:
             
          {ol 
                {- [Item] - A map of attributes and their values. Each entry
                   in this map consists of an attribute name and an attribute
                   value. Attribute values must not be null; string and
                   binary type attributes must have lengths greater than
                   zero; and set type attributes must not be empty. Requests
                   that contain empty values will be rejected with a
                   [ValidationException] exception.
                   
                If you specify any attributes that are part of an index key,
                then the data types for those attributes must match those of
                the schema in the table's attribute definition.
                }
                
          }
          }
          
    }
    
    If there are no unprocessed items remaining, the response contains an
    empty [UnprocessedItems] map.|}*)

}

(**{|
    Represents the input of a [BatchWriteItem] operation.|}*)
type batch_write_item_input = {
  return_item_collection_metrics: return_item_collection_metrics option;
   (**{|
    Determines whether item collection metrics are returned. If set to
    [SIZE], the response includes statistics about item collections, if any,
    that were modified during the operation are returned in the response. If
    set to [NONE] (the default), no statistics are returned.|}*)

  return_consumed_capacity: return_consumed_capacity option;
  
  request_items: (string * write_request list) list;
   (**{|
    A map of one or more table names or table ARNs and, for each table, a
    list of operations to be performed ([DeleteRequest] or [PutRequest]).
    Each element in the map consists of the following:
    
    {ol 
          {- [DeleteRequest] - Perform a [DeleteItem] operation on the
             specified item. The item to be deleted is identified by a [Key]
             subelement:
             
          {ol 
                {- [Key] - A map of primary key attribute values that
                   uniquely identify the item. Each entry in this map
                   consists of an attribute name and an attribute value. For
                   each primary key, you must provide {i all} of the key
                   attributes. For example, with a simple primary key, you
                   only need to provide a value for the partition key. For a
                   composite primary key, you must provide values for
                   {i both} the partition key and the sort key.
                   }
                
          }
          }
          
          {- [PutRequest] - Perform a [PutItem] operation on the specified
             item. The item to be put is identified by an [Item] subelement:
             
          {ol 
                {- [Item] - A map of attributes and their values. Each entry
                   in this map consists of an attribute name and an attribute
                   value. Attribute values must not be null; string and
                   binary type attributes must have lengths greater than
                   zero; and set type attributes must not be empty. Requests
                   that contain empty values are rejected with a
                   [ValidationException] exception.
                   
                If you specify any attributes that are part of an index key,
                then the data types for those attributes must match those of
                the schema in the table's attribute definition.
                }
                
          }
          }
          
    }
    |}*)

}

(**{|
    Represents the output of a [BatchGetItem] operation.|}*)
type batch_get_item_output = {
  consumed_capacity: consumed_capacity list option;
   (**{|
    The read capacity units consumed by the entire [BatchGetItem] operation.
    
    Each element consists of:
    
    {ol 
          {- [TableName] - The table that consumed the provisioned throughput.
             }
          
          {- [CapacityUnits] - The total number of capacity units consumed.
             }
          
    }
    |}*)

  unprocessed_keys: (string * keys_and_attributes) list option;
   (**{|
    A map of tables and their respective keys that were not processed with
    the current response. The [UnprocessedKeys] value is in the same form as
    [RequestItems], so the value can be provided directly to a subsequent
    [BatchGetItem] operation. For more information, see [RequestItems] in the
    Request Parameters section.
    
    Each element consists of:
    
    {ol 
          {- [Keys] - An array of primary key attribute values that define
             specific items in the table.
             }
          
          {- [ProjectionExpression] - One or more attributes to be retrieved
             from the table or index. By default, all attributes are
             returned. If a requested attribute is not found, it does not
             appear in the result.
             }
          
          {- [ConsistentRead] - The consistency of a read operation. If set
             to [true], then a strongly consistent read is used; otherwise,
             an eventually consistent read is used.
             }
          
    }
    
    If there are no unprocessed keys remaining, the response contains an
    empty [UnprocessedKeys] map.|}*)

  responses: (string * (string * attribute_value) list list) list option;
   (**{|
    A map of table name or table ARN to a list of items. Each object in
    [Responses] consists of a table name or ARN, along with a map of
    attribute data consisting of the data type and attribute value.|}*)

}

(**{|
    Represents the input of a [BatchGetItem] operation.|}*)
type batch_get_item_input = {
  return_consumed_capacity: return_consumed_capacity option;
  
  request_items: (string * keys_and_attributes) list;
   (**{|
    A map of one or more table names or table ARNs and, for each table, a map
    that describes one or more items to retrieve from that table. Each table
    name or ARN can be used only once per [BatchGetItem] request.
    
    Each element in the map of items to retrieve consists of the following:
    
    {ol 
          {- [ConsistentRead] - If [true], a strongly consistent read is
             used; if [false] (the default), an eventually consistent read is
             used.
             }
          
          {- [ExpressionAttributeNames] - One or more substitution tokens for
             attribute names in the [ProjectionExpression] parameter. The
             following are some use cases for using
             [ExpressionAttributeNames]:
             
          {ol 
                {- To access an attribute whose name conflicts with a
                   DynamoDB reserved word.
                   }
                
                {- To create a placeholder for repeating occurrences of an
                   attribute name in an expression.
                   }
                
                {- To prevent special characters in an attribute name from
                   being misinterpreted in an expression.
                   }
                
          }
          
          Use the {b #} character in an expression to dereference an
          attribute name. For example, consider the following attribute name:
          
          {ol 
                {- [Percentile]
                   }
                
          }
          
          The name of this attribute conflicts with a reserved word, so it
          cannot be used directly in an expression. (For the complete list of
          reserved words, see
          {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html }Reserved
          Words} in the {i Amazon DynamoDB Developer Guide}). To work around
          this, you could specify the following for
          [ExpressionAttributeNames]:
          
          {ol 
                {- [{"#P":"Percentile"}]
                   }
                
          }
          
          You could then use this substitution in an expression, as in this
          example:
          
          {ol 
                {- [#P = :val]
                   }
                
          }
          
          Tokens that begin with the {b :} character are {i expression
          attribute values}, which are placeholders for the actual value at
          runtime.
          
          For more information about expression attribute names, see
          {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Accessing
          Item Attributes} in the {i Amazon DynamoDB Developer Guide}.
          }
          
          {- [Keys] - An array of primary key attribute values that define
             specific items in the table. For each primary key, you must
             provide {i all} of the key attributes. For example, with a
             simple primary key, you only need to provide the partition key
             value. For a composite key, you must provide {i both} the
             partition key value and the sort key value.
             }
          
          {- [ProjectionExpression] - A string that identifies one or more
             attributes to retrieve from the table. These attributes can
             include scalars, sets, or elements of a JSON document. The
             attributes in the expression must be separated by commas.
             
          If no attribute names are specified, then all attributes are
          returned. If any of the requested attributes are not found, they do
          not appear in the result.
          
          For more information, see
          {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html }Accessing
          Item Attributes} in the {i Amazon DynamoDB Developer Guide}.
          }
          
          {- [AttributesToGet] - This is a legacy parameter. Use
             [ProjectionExpression] instead. For more information, see
             {{: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html }AttributesToGet}
             in the {i Amazon DynamoDB Developer Guide}.
             }
          
    }
    |}*)

}

type batch_execute_statement_output = {
  consumed_capacity: consumed_capacity list option;
   (**{|
    The capacity units consumed by the entire operation. The values of the
    list are ordered according to the ordering of the statements.|}*)

  responses: batch_statement_response list option;
   (**{|
    The response to each PartiQL statement in the batch. The values of the
    list are ordered according to the ordering of the request statements.|}*)

}

type batch_execute_statement_input = {
  return_consumed_capacity: return_consumed_capacity option;
  
  statements: batch_statement_request list;
   (**{|
    The list of PartiQL statements representing the batch to run.|}*)

}

(**{|
    Amazon
    DynamoDB
    Amazon DynamoDB is a fully managed NoSQL database service that provides
    fast and predictable performance with seamless scalability. DynamoDB lets
    you offload the administrative burdens of operating and scaling a
    distributed database, so that you don't have to worry about hardware
    provisioning, setup and configuration, replication, software patching, or
    cluster scaling.
    
    With DynamoDB, you can create database tables that can store and retrieve
    any amount of data, and serve any level of request traffic. You can scale
    up or scale down your tables' throughput capacity without downtime or
    performance degradation, and use the Amazon Web Services Management
    Console to monitor resource utilization and performance metrics.
    
    DynamoDB automatically spreads the data and traffic for your tables over
    a sufficient number of servers to handle your throughput and storage
    requirements, while maintaining consistent and fast performance. All of
    your data is stored on solid state disks (SSDs) and automatically
    replicated across multiple Availability Zones in an Amazon Web Services
    Region, providing built-in high availability and data durability.|}*)


type base_document = Json.t

