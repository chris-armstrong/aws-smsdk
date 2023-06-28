open AwsSdkLib;type stringAttributeValue = string

type numberAttributeValue = string

type binaryAttributeValue = bytes

type stringSetAttributeValue = list(stringAttributeValue)

type numberSetAttributeValue = list(numberAttributeValue)

type binarySetAttributeValue = list(binaryAttributeValue)

type attributeName = string

type nullAttributeValue = bool

type booleanAttributeValue = bool

type attributeValue = {
  bool_: option(booleanAttributeValue),
  null: option(nullAttributeValue),
  l: option(listAttributeValue),
  m: option(mapAttributeValue),
  bs: option(binarySetAttributeValue),
  ns: option(numberSetAttributeValue),
  ss: option(stringSetAttributeValue),
  b: option(binaryAttributeValue),
  n: option(numberAttributeValue),
  s: option(stringAttributeValue)
} and listAttributeValue = list(attributeValue) and mapAttributeValue = list((string, attributeValue))

type putItemInputAttributeMap = list((string, attributeValue))

type putRequest = {
  item: putItemInputAttributeMap
}

type key = list((string, attributeValue))

type deleteRequest = {
  key: key
}

type writeRequest = {
  deleteRequest: option(deleteRequest),
  putRequest: option(putRequest)
}

type writeRequests = list(writeRequest)

type timeToLiveEnabled = bool

type timeToLiveAttributeName = string

type timeToLiveSpecification = {
  attributeName: timeToLiveAttributeName,
  enabled: timeToLiveEnabled
}

type updateTimeToLiveOutput = {
  timeToLiveSpecification: option(timeToLiveSpecification)
}

type tableName = string

type updateTimeToLiveInput = {
  timeToLiveSpecification: timeToLiveSpecification,
  tableName: tableName
}

type errorMessage = string

exception ResourceNotFoundException(Aws.apiError(Aws.emptyErrorDetails))

exception ResourceInUseException(Aws.apiError(Aws.emptyErrorDetails))

exception LimitExceededException(Aws.apiError(Aws.emptyErrorDetails))

type string_ = string

exception InvalidEndpointException(Aws.apiError(Aws.emptyErrorDetails))

exception InternalServerError(Aws.apiError(Aws.emptyErrorDetails))

type tableStatus = | CREATING
| UPDATING
| DELETING
| ACTIVE
| INACCESSIBLE_ENCRYPTION_CREDENTIALS
| ARCHIVING
| ARCHIVED

type regionName = string

type indexName = string

type indexStatus = | CREATING
| UPDATING
| DELETING
| ACTIVE

type positiveLongObject = int64

type booleanObject = bool

type autoScalingPolicyName = string

type integerObject = int

type double = float

type autoScalingTargetTrackingScalingPolicyConfigurationDescription = {
  targetValue: double,
  scaleOutCooldown: option(integerObject),
  scaleInCooldown: option(integerObject),
  disableScaleIn: option(booleanObject)
}

type autoScalingPolicyDescription = {
  targetTrackingScalingPolicyConfiguration: option(autoScalingTargetTrackingScalingPolicyConfigurationDescription),
  policyName: option(autoScalingPolicyName)
}

type autoScalingPolicyDescriptionList = list(autoScalingPolicyDescription)

type autoScalingSettingsDescription = {
  scalingPolicies: option(autoScalingPolicyDescriptionList),
  autoScalingRoleArn: option(string_),
  autoScalingDisabled: option(booleanObject),
  maximumUnits: option(positiveLongObject),
  minimumUnits: option(positiveLongObject)
}

type replicaGlobalSecondaryIndexAutoScalingDescription = {
  provisionedWriteCapacityAutoScalingSettings: option(autoScalingSettingsDescription),
  provisionedReadCapacityAutoScalingSettings: option(autoScalingSettingsDescription),
  indexStatus: option(indexStatus),
  indexName: option(indexName)
}

type replicaGlobalSecondaryIndexAutoScalingDescriptionList = list(replicaGlobalSecondaryIndexAutoScalingDescription)

type replicaStatus = | CREATING
| CREATION_FAILED
| UPDATING
| DELETING
| ACTIVE
| REGION_DISABLED
| INACCESSIBLE_ENCRYPTION_CREDENTIALS

type replicaAutoScalingDescription = {
  replicaStatus: option(replicaStatus),
  replicaProvisionedWriteCapacityAutoScalingSettings: option(autoScalingSettingsDescription),
  replicaProvisionedReadCapacityAutoScalingSettings: option(autoScalingSettingsDescription),
  globalSecondaryIndexes: option(replicaGlobalSecondaryIndexAutoScalingDescriptionList),
  regionName: option(regionName)
}

type replicaAutoScalingDescriptionList = list(replicaAutoScalingDescription)

type tableAutoScalingDescription = {
  replicas: option(replicaAutoScalingDescriptionList),
  tableStatus: option(tableStatus),
  tableName: option(tableName)
}

type updateTableReplicaAutoScalingOutput = {
  tableAutoScalingDescription: option(tableAutoScalingDescription)
}

type autoScalingRoleArn = string

type autoScalingTargetTrackingScalingPolicyConfigurationUpdate = {
  targetValue: double,
  scaleOutCooldown: option(integerObject),
  scaleInCooldown: option(integerObject),
  disableScaleIn: option(booleanObject)
}

type autoScalingPolicyUpdate = {
  targetTrackingScalingPolicyConfiguration: autoScalingTargetTrackingScalingPolicyConfigurationUpdate,
  policyName: option(autoScalingPolicyName)
}

type autoScalingSettingsUpdate = {
  scalingPolicyUpdate: option(autoScalingPolicyUpdate),
  autoScalingRoleArn: option(autoScalingRoleArn),
  autoScalingDisabled: option(booleanObject),
  maximumUnits: option(positiveLongObject),
  minimumUnits: option(positiveLongObject)
}

type globalSecondaryIndexAutoScalingUpdate = {
  provisionedWriteCapacityAutoScalingUpdate: option(autoScalingSettingsUpdate),
  indexName: option(indexName)
}

type globalSecondaryIndexAutoScalingUpdateList = list(globalSecondaryIndexAutoScalingUpdate)

type replicaGlobalSecondaryIndexAutoScalingUpdate = {
  provisionedReadCapacityAutoScalingUpdate: option(autoScalingSettingsUpdate),
  indexName: option(indexName)
}

type replicaGlobalSecondaryIndexAutoScalingUpdateList = list(replicaGlobalSecondaryIndexAutoScalingUpdate)

type replicaAutoScalingUpdate = {
  replicaProvisionedReadCapacityAutoScalingUpdate: option(autoScalingSettingsUpdate),
  replicaGlobalSecondaryIndexUpdates: option(replicaGlobalSecondaryIndexAutoScalingUpdateList),
  regionName: regionName
}

type replicaAutoScalingUpdateList = list(replicaAutoScalingUpdate)

type updateTableReplicaAutoScalingInput = {
  replicaUpdates: option(replicaAutoScalingUpdateList),
  provisionedWriteCapacityAutoScalingUpdate: option(autoScalingSettingsUpdate),
  tableName: tableName,
  globalSecondaryIndexUpdates: option(globalSecondaryIndexAutoScalingUpdateList)
}

type keySchemaAttributeName = string

type scalarAttributeType = | S
| N
| B

type attributeDefinition = {
  attributeType: scalarAttributeType,
  attributeName: keySchemaAttributeName
}

type attributeDefinitions = list(attributeDefinition)

type keyType = | HASH
| RANGE

type keySchemaElement = {
  keyType: keyType,
  attributeName: keySchemaAttributeName
}

type keySchema = list(keySchemaElement)

type date = float

type nonNegativeLongObject = int64

type provisionedThroughputDescription = {
  writeCapacityUnits: option(nonNegativeLongObject),
  readCapacityUnits: option(nonNegativeLongObject),
  numberOfDecreasesToday: option(positiveLongObject),
  lastDecreaseDateTime: option(date),
  lastIncreaseDateTime: option(date)
}

type long = int64

type tableId = string

type billingMode = | PROVISIONED
| PAY_PER_REQUEST

type billingModeSummary = {
  lastUpdateToPayPerRequestDateTime: option(date),
  billingMode: option(billingMode)
}

type projectionType = | ALL
| KEYS_ONLY
| INCLUDE

type nonKeyAttributeName = string

type nonKeyAttributeNameList = list(nonKeyAttributeName)

type projection = {
  nonKeyAttributes: option(nonKeyAttributeNameList),
  projectionType: option(projectionType)
}

type localSecondaryIndexDescription = {
  indexArn: option(string_),
  itemCount: option(long),
  indexSizeBytes: option(long),
  projection: option(projection),
  keySchema: option(keySchema),
  indexName: option(indexName)
}

type localSecondaryIndexDescriptionList = list(localSecondaryIndexDescription)

type backfilling = bool

type globalSecondaryIndexDescription = {
  indexArn: option(string_),
  itemCount: option(long),
  indexSizeBytes: option(long),
  provisionedThroughput: option(provisionedThroughputDescription),
  backfilling: option(backfilling),
  indexStatus: option(indexStatus),
  projection: option(projection),
  keySchema: option(keySchema),
  indexName: option(indexName)
}

type globalSecondaryIndexDescriptionList = list(globalSecondaryIndexDescription)

type streamEnabled = bool

type streamViewType = | NEW_IMAGE
| OLD_IMAGE
| NEW_AND_OLD_IMAGES
| KEYS_ONLY

type streamSpecification = {
  streamViewType: option(streamViewType),
  streamEnabled: streamEnabled
}

type streamArn = string

type replicaStatusDescription = string

type replicaStatusPercentProgress = string

type kmsmasterKeyId = string

type provisionedThroughputOverride = {
  readCapacityUnits: option(positiveLongObject)
}

type replicaGlobalSecondaryIndexDescription = {
  provisionedThroughputOverride: option(provisionedThroughputOverride),
  indexName: option(indexName)
}

type replicaGlobalSecondaryIndexDescriptionList = list(replicaGlobalSecondaryIndexDescription)

type replicaDescription = {
  replicaInaccessibleDateTime: option(date),
  globalSecondaryIndexes: option(replicaGlobalSecondaryIndexDescriptionList),
  provisionedThroughputOverride: option(provisionedThroughputOverride),
  kmsmasterKeyId: option(kmsmasterKeyId),
  replicaStatusPercentProgress: option(replicaStatusPercentProgress),
  replicaStatusDescription: option(replicaStatusDescription),
  replicaStatus: option(replicaStatus),
  regionName: option(regionName)
}

type replicaDescriptionList = list(replicaDescription)

type backupArn = string

type tableArn = string

type restoreInProgress = bool

type restoreSummary = {
  restoreInProgress: restoreInProgress,
  restoreDateTime: date,
  sourceTableArn: option(tableArn),
  sourceBackupArn: option(backupArn)
}

type ssestatus = | ENABLING
| ENABLED
| DISABLING
| DISABLED
| UPDATING

type ssetype = | AES256
| KMS

type kmsmasterKeyArn = string

type ssedescription = {
  inaccessibleEncryptionDateTime: option(date),
  kmsmasterKeyArn: option(kmsmasterKeyArn),
  ssetype: option(ssetype),
  status: option(ssestatus)
}

type archivalReason = string

type archivalSummary = {
  archivalBackupArn: option(backupArn),
  archivalReason: option(archivalReason),
  archivalDateTime: option(date)
}

type tableDescription = {
  archivalSummary: option(archivalSummary),
  ssedescription: option(ssedescription),
  restoreSummary: option(restoreSummary),
  replicas: option(replicaDescriptionList),
  globalTableVersion: option(string_),
  latestStreamArn: option(streamArn),
  latestStreamLabel: option(string_),
  streamSpecification: option(streamSpecification),
  globalSecondaryIndexes: option(globalSecondaryIndexDescriptionList),
  localSecondaryIndexes: option(localSecondaryIndexDescriptionList),
  billingModeSummary: option(billingModeSummary),
  tableId: option(tableId),
  tableArn: option(string_),
  itemCount: option(long),
  tableSizeBytes: option(long),
  provisionedThroughput: option(provisionedThroughputDescription),
  creationDateTime: option(date),
  tableStatus: option(tableStatus),
  keySchema: option(keySchema),
  tableName: option(tableName),
  attributeDefinitions: option(attributeDefinitions)
}

type updateTableOutput = {
  tableDescription: option(tableDescription)
}

type provisionedThroughput = {
  writeCapacityUnits: positiveLongObject,
  readCapacityUnits: positiveLongObject
}

type updateGlobalSecondaryIndexAction = {
  provisionedThroughput: provisionedThroughput,
  indexName: indexName
}

type createGlobalSecondaryIndexAction = {
  provisionedThroughput: option(provisionedThroughput),
  projection: projection,
  keySchema: keySchema,
  indexName: indexName
}

type deleteGlobalSecondaryIndexAction = {
  indexName: indexName
}

type globalSecondaryIndexUpdate = {
  delete: option(deleteGlobalSecondaryIndexAction),
  create: option(createGlobalSecondaryIndexAction),
  update: option(updateGlobalSecondaryIndexAction)
}

type globalSecondaryIndexUpdateList = list(globalSecondaryIndexUpdate)

type sseenabled = bool

type ssespecification = {
  kmsmasterKeyId: option(kmsmasterKeyId),
  ssetype: option(ssetype),
  enabled: option(sseenabled)
}

type replicaGlobalSecondaryIndex = {
  provisionedThroughputOverride: option(provisionedThroughputOverride),
  indexName: indexName
}

type replicaGlobalSecondaryIndexList = list(replicaGlobalSecondaryIndex)

type createReplicationGroupMemberAction = {
  globalSecondaryIndexes: option(replicaGlobalSecondaryIndexList),
  provisionedThroughputOverride: option(provisionedThroughputOverride),
  kmsmasterKeyId: option(kmsmasterKeyId),
  regionName: regionName
}

type updateReplicationGroupMemberAction = {
  globalSecondaryIndexes: option(replicaGlobalSecondaryIndexList),
  provisionedThroughputOverride: option(provisionedThroughputOverride),
  kmsmasterKeyId: option(kmsmasterKeyId),
  regionName: regionName
}

type deleteReplicationGroupMemberAction = {
  regionName: regionName
}

type replicationGroupUpdate = {
  delete: option(deleteReplicationGroupMemberAction),
  update: option(updateReplicationGroupMemberAction),
  create: option(createReplicationGroupMemberAction)
}

type replicationGroupUpdateList = list(replicationGroupUpdate)

type updateTableInput = {
  replicaUpdates: option(replicationGroupUpdateList),
  ssespecification: option(ssespecification),
  streamSpecification: option(streamSpecification),
  globalSecondaryIndexUpdates: option(globalSecondaryIndexUpdateList),
  provisionedThroughput: option(provisionedThroughput),
  billingMode: option(billingMode),
  tableName: tableName,
  attributeDefinitions: option(attributeDefinitions)
}

type attributeMap = list((string, attributeValue))

type consumedCapacityUnits = float

type capacity = {
  capacityUnits: option(consumedCapacityUnits),
  writeCapacityUnits: option(consumedCapacityUnits),
  readCapacityUnits: option(consumedCapacityUnits)
}

type secondaryIndexesCapacityMap = list((string, capacity))

type consumedCapacity = {
  globalSecondaryIndexes: option(secondaryIndexesCapacityMap),
  localSecondaryIndexes: option(secondaryIndexesCapacityMap),
  table: option(capacity),
  writeCapacityUnits: option(consumedCapacityUnits),
  readCapacityUnits: option(consumedCapacityUnits),
  capacityUnits: option(consumedCapacityUnits),
  tableName: option(tableName)
}

type itemCollectionKeyAttributeMap = list((string, attributeValue))

type itemCollectionSizeEstimateBound = float

type itemCollectionSizeEstimateRange = list(itemCollectionSizeEstimateBound)

type itemCollectionMetrics = {
  sizeEstimateRangeGB: option(itemCollectionSizeEstimateRange),
  itemCollectionKey: option(itemCollectionKeyAttributeMap)
}

type updateItemOutput = {
  itemCollectionMetrics: option(itemCollectionMetrics),
  consumedCapacity: option(consumedCapacity),
  attributes: option(attributeMap)
}

type attributeAction = | ADD
| PUT
| DELETE

type attributeValueUpdate = {
  action: option(attributeAction),
  value: option(attributeValue)
}

type attributeUpdates = list((string, attributeValueUpdate))

type comparisonOperator = | EQ
| NE
| IN
| LE
| LT
| GE
| GT
| BETWEEN
| NOT_NULL
| NULL
| CONTAINS
| NOT_CONTAINS
| BEGINS_WITH

type attributeValueList = list(attributeValue)

type expectedAttributeValue = {
  attributeValueList: option(attributeValueList),
  comparisonOperator: option(comparisonOperator),
  exists: option(booleanObject),
  value: option(attributeValue)
}

type expectedAttributeMap = list((string, expectedAttributeValue))

type conditionalOperator = | AND
| OR

type returnValue = | NONE
| ALL_OLD
| UPDATED_OLD
| ALL_NEW
| UPDATED_NEW

type returnConsumedCapacity = | INDEXES
| TOTAL
| NONE

type returnItemCollectionMetrics = | SIZE
| NONE

type updateExpression = string

type conditionExpression = string

type expressionAttributeNameVariable = string

type expressionAttributeNameMap = list((string, attributeName))

type expressionAttributeValueVariable = string

type expressionAttributeValueMap = list((string, attributeValue))

type updateItemInput = {
  expressionAttributeValues: option(expressionAttributeValueMap),
  expressionAttributeNames: option(expressionAttributeNameMap),
  conditionExpression: option(conditionExpression),
  updateExpression: option(updateExpression),
  returnItemCollectionMetrics: option(returnItemCollectionMetrics),
  returnConsumedCapacity: option(returnConsumedCapacity),
  returnValues: option(returnValue),
  conditionalOperator: option(conditionalOperator),
  expected: option(expectedAttributeMap),
  attributeUpdates: option(attributeUpdates),
  key: key,
  tableName: tableName
}

exception TransactionConflictException(Aws.apiError(Aws.emptyErrorDetails))

exception RequestLimitExceeded(Aws.apiError(Aws.emptyErrorDetails))

exception ProvisionedThroughputExceededException(Aws.apiError(Aws.emptyErrorDetails))

exception ItemCollectionSizeLimitExceededException(Aws.apiError(Aws.emptyErrorDetails))

exception ConditionalCheckFailedException(Aws.apiError(Aws.emptyErrorDetails))

type replicaGlobalSecondaryIndexSettingsDescription = {
  provisionedWriteCapacityAutoScalingSettings: option(autoScalingSettingsDescription),
  provisionedWriteCapacityUnits: option(positiveLongObject),
  provisionedReadCapacityAutoScalingSettings: option(autoScalingSettingsDescription),
  provisionedReadCapacityUnits: option(positiveLongObject),
  indexStatus: option(indexStatus),
  indexName: indexName
}

type replicaGlobalSecondaryIndexSettingsDescriptionList = list(replicaGlobalSecondaryIndexSettingsDescription)

type replicaSettingsDescription = {
  replicaGlobalSecondaryIndexSettings: option(replicaGlobalSecondaryIndexSettingsDescriptionList),
  replicaProvisionedWriteCapacityAutoScalingSettings: option(autoScalingSettingsDescription),
  replicaProvisionedWriteCapacityUnits: option(nonNegativeLongObject),
  replicaProvisionedReadCapacityAutoScalingSettings: option(autoScalingSettingsDescription),
  replicaProvisionedReadCapacityUnits: option(nonNegativeLongObject),
  replicaBillingModeSummary: option(billingModeSummary),
  replicaStatus: option(replicaStatus),
  regionName: regionName
}

type replicaSettingsDescriptionList = list(replicaSettingsDescription)

type updateGlobalTableSettingsOutput = {
  replicaSettings: option(replicaSettingsDescriptionList),
  globalTableName: option(tableName)
}

type globalTableGlobalSecondaryIndexSettingsUpdate = {
  provisionedWriteCapacityAutoScalingSettingsUpdate: option(autoScalingSettingsUpdate),
  provisionedWriteCapacityUnits: option(positiveLongObject),
  indexName: indexName
}

type globalTableGlobalSecondaryIndexSettingsUpdateList = list(globalTableGlobalSecondaryIndexSettingsUpdate)

type replicaGlobalSecondaryIndexSettingsUpdate = {
  provisionedReadCapacityAutoScalingSettingsUpdate: option(autoScalingSettingsUpdate),
  provisionedReadCapacityUnits: option(positiveLongObject),
  indexName: indexName
}

type replicaGlobalSecondaryIndexSettingsUpdateList = list(replicaGlobalSecondaryIndexSettingsUpdate)

type replicaSettingsUpdate = {
  replicaGlobalSecondaryIndexSettingsUpdate: option(replicaGlobalSecondaryIndexSettingsUpdateList),
  replicaProvisionedReadCapacityAutoScalingSettingsUpdate: option(autoScalingSettingsUpdate),
  replicaProvisionedReadCapacityUnits: option(positiveLongObject),
  regionName: regionName
}

type replicaSettingsUpdateList = list(replicaSettingsUpdate)

type updateGlobalTableSettingsInput = {
  replicaSettingsUpdate: option(replicaSettingsUpdateList),
  globalTableGlobalSecondaryIndexSettingsUpdate: option(globalTableGlobalSecondaryIndexSettingsUpdateList),
  globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate: option(autoScalingSettingsUpdate),
  globalTableProvisionedWriteCapacityUnits: option(positiveLongObject),
  globalTableBillingMode: option(billingMode),
  globalTableName: tableName
}

exception ReplicaNotFoundException(Aws.apiError(Aws.emptyErrorDetails))

exception IndexNotFoundException(Aws.apiError(Aws.emptyErrorDetails))

exception GlobalTableNotFoundException(Aws.apiError(Aws.emptyErrorDetails))

type globalTableArnString = string

type globalTableStatus = | CREATING
| ACTIVE
| DELETING
| UPDATING

type globalTableDescription = {
  globalTableName: option(tableName),
  globalTableStatus: option(globalTableStatus),
  creationDateTime: option(date),
  globalTableArn: option(globalTableArnString),
  replicationGroup: option(replicaDescriptionList)
}

type updateGlobalTableOutput = {
  globalTableDescription: option(globalTableDescription)
}

type createReplicaAction = {
  regionName: regionName
}

type deleteReplicaAction = {
  regionName: regionName
}

type replicaUpdate = {
  delete: option(deleteReplicaAction),
  create: option(createReplicaAction)
}

type replicaUpdateList = list(replicaUpdate)

type updateGlobalTableInput = {
  replicaUpdates: replicaUpdateList,
  globalTableName: tableName
}

exception TableNotFoundException(Aws.apiError(Aws.emptyErrorDetails))

exception ReplicaAlreadyExistsException(Aws.apiError(Aws.emptyErrorDetails))

type contributorInsightsStatus = | ENABLING
| ENABLED
| DISABLING
| DISABLED
| FAILED

type updateContributorInsightsOutput = {
  contributorInsightsStatus: option(contributorInsightsStatus),
  indexName: option(indexName),
  tableName: option(tableName)
}

type contributorInsightsAction = | ENABLE
| DISABLE

type updateContributorInsightsInput = {
  contributorInsightsAction: contributorInsightsAction,
  indexName: option(indexName),
  tableName: tableName
}

type continuousBackupsStatus = | ENABLED
| DISABLED

type pointInTimeRecoveryStatus = | ENABLED
| DISABLED

type pointInTimeRecoveryDescription = {
  latestRestorableDateTime: option(date),
  earliestRestorableDateTime: option(date),
  pointInTimeRecoveryStatus: option(pointInTimeRecoveryStatus)
}

type continuousBackupsDescription = {
  pointInTimeRecoveryDescription: option(pointInTimeRecoveryDescription),
  continuousBackupsStatus: continuousBackupsStatus
}

type updateContinuousBackupsOutput = {
  continuousBackupsDescription: option(continuousBackupsDescription)
}

type pointInTimeRecoverySpecification = {
  pointInTimeRecoveryEnabled: booleanObject
}

type updateContinuousBackupsInput = {
  pointInTimeRecoverySpecification: pointInTimeRecoverySpecification,
  tableName: tableName
}

exception ContinuousBackupsUnavailableException(Aws.apiError(Aws.emptyErrorDetails))

type returnValuesOnConditionCheckFailure = | ALL_OLD
| NONE

type update = {
  returnValuesOnConditionCheckFailure: option(returnValuesOnConditionCheckFailure),
  expressionAttributeValues: option(expressionAttributeValueMap),
  expressionAttributeNames: option(expressionAttributeNameMap),
  conditionExpression: option(conditionExpression),
  tableName: tableName,
  updateExpression: updateExpression,
  key: key
}

type resourceArnString = string

type tagKeyString = string

type tagKeyList = list(tagKeyString)

type untagResourceInput = {
  tagKeys: tagKeyList,
  resourceArn: resourceArnString
}

exception TransactionInProgressException(Aws.apiError(Aws.emptyErrorDetails))

type code = string

type cancellationReason = {
  message: option(errorMessage),
  code: option(code),
  item: option(attributeMap)
}

type cancellationReasonList = list(cancellationReason)

exception TransactionCanceledException(Aws.apiError(Aws.emptyErrorDetails))

type consumedCapacityMultiple = list(consumedCapacity)

type itemCollectionMetricsMultiple = list(itemCollectionMetrics)

type itemCollectionMetricsPerTable = list((string, itemCollectionMetricsMultiple))

type transactWriteItemsOutput = {
  itemCollectionMetrics: option(itemCollectionMetricsPerTable),
  consumedCapacity: option(consumedCapacityMultiple)
}

type conditionCheck = {
  returnValuesOnConditionCheckFailure: option(returnValuesOnConditionCheckFailure),
  expressionAttributeValues: option(expressionAttributeValueMap),
  expressionAttributeNames: option(expressionAttributeNameMap),
  conditionExpression: conditionExpression,
  tableName: tableName,
  key: key
}

type put = {
  returnValuesOnConditionCheckFailure: option(returnValuesOnConditionCheckFailure),
  expressionAttributeValues: option(expressionAttributeValueMap),
  expressionAttributeNames: option(expressionAttributeNameMap),
  conditionExpression: option(conditionExpression),
  tableName: tableName,
  item: putItemInputAttributeMap
}

type delete = {
  returnValuesOnConditionCheckFailure: option(returnValuesOnConditionCheckFailure),
  expressionAttributeValues: option(expressionAttributeValueMap),
  expressionAttributeNames: option(expressionAttributeNameMap),
  conditionExpression: option(conditionExpression),
  tableName: tableName,
  key: key
}

type transactWriteItem = {
  update: option(update),
  delete: option(delete),
  put: option(put),
  conditionCheck: option(conditionCheck)
}

type transactWriteItemList = list(transactWriteItem)

type clientRequestToken = string

type transactWriteItemsInput = {
  clientRequestToken: option(clientRequestToken),
  returnItemCollectionMetrics: option(returnItemCollectionMetrics),
  returnConsumedCapacity: option(returnConsumedCapacity),
  transactItems: transactWriteItemList
}

exception IdempotentParameterMismatchException(Aws.apiError(Aws.emptyErrorDetails))

type itemResponse = {
  item: option(attributeMap)
}

type itemResponseList = list(itemResponse)

type transactGetItemsOutput = {
  responses: option(itemResponseList),
  consumedCapacity: option(consumedCapacityMultiple)
}

type projectionExpression = string

type get = {
  expressionAttributeNames: option(expressionAttributeNameMap),
  projectionExpression: option(projectionExpression),
  tableName: tableName,
  key: key
}

type transactGetItem = {
  get: get
}

type transactGetItemList = list(transactGetItem)

type transactGetItemsInput = {
  returnConsumedCapacity: option(returnConsumedCapacity),
  transactItems: transactGetItemList
}

type timeToLiveStatus = | ENABLING
| DISABLING
| ENABLED
| DISABLED

type timeToLiveDescription = {
  attributeName: option(timeToLiveAttributeName),
  timeToLiveStatus: option(timeToLiveStatus)
}

type timeRangeUpperBound = float

type timeRangeLowerBound = float

type tagValueString = string

type tag = {
  value: tagValueString,
  key: tagKeyString
}

type tagList_ = list(tag)

type tagResourceInput = {
  tags: tagList_,
  resourceArn: resourceArnString
}

type tableNameList = list(tableName)

exception TableInUseException(Aws.apiError(Aws.emptyErrorDetails))

type tableCreationDateTime = float

exception TableAlreadyExistsException(Aws.apiError(Aws.emptyErrorDetails))

type localSecondaryIndexInfo = {
  projection: option(projection),
  keySchema: option(keySchema),
  indexName: option(indexName)
}

type localSecondaryIndexes = list(localSecondaryIndexInfo)

type globalSecondaryIndexInfo = {
  provisionedThroughput: option(provisionedThroughput),
  projection: option(projection),
  keySchema: option(keySchema),
  indexName: option(indexName)
}

type globalSecondaryIndexes = list(globalSecondaryIndexInfo)

type sourceTableFeatureDetails = {
  ssedescription: option(ssedescription),
  timeToLiveDescription: option(timeToLiveDescription),
  streamDescription: option(streamSpecification),
  globalSecondaryIndexes: option(globalSecondaryIndexes),
  localSecondaryIndexes: option(localSecondaryIndexes)
}

type itemCount = int64

type sourceTableDetails = {
  billingMode: option(billingMode),
  itemCount: option(itemCount),
  provisionedThroughput: provisionedThroughput,
  tableCreationDateTime: tableCreationDateTime,
  keySchema: keySchema,
  tableSizeBytes: option(long),
  tableArn: option(tableArn),
  tableId: tableId,
  tableName: tableName
}

type select = | ALL_ATTRIBUTES
| ALL_PROJECTED_ATTRIBUTES
| SPECIFIC_ATTRIBUTES
| COUNT

type scanTotalSegments = int

type scanSegment = int

type itemList = list(attributeMap)

type integer_ = int

type scanOutput = {
  consumedCapacity: option(consumedCapacity),
  lastEvaluatedKey: option(key),
  scannedCount: option(integer_),
  count: option(integer_),
  items: option(itemList)
}

type attributeNameList = list(attributeName)

type positiveIntegerObject = int

type condition = {
  comparisonOperator: comparisonOperator,
  attributeValueList: option(attributeValueList)
}

type filterConditionMap = list((string, condition))

type consistentRead = bool

type scanInput = {
  consistentRead: option(consistentRead),
  expressionAttributeValues: option(expressionAttributeValueMap),
  expressionAttributeNames: option(expressionAttributeNameMap),
  filterExpression: option(conditionExpression),
  projectionExpression: option(projectionExpression),
  segment: option(scanSegment),
  totalSegments: option(scanTotalSegments),
  returnConsumedCapacity: option(returnConsumedCapacity),
  exclusiveStartKey: option(key),
  conditionalOperator: option(conditionalOperator),
  scanFilter: option(filterConditionMap),
  select: option(select),
  limit: option(positiveIntegerObject),
  attributesToGet: option(attributeNameList),
  indexName: option(indexName),
  tableName: tableName
}

type s3SseKmsKeyId = string

type s3SseAlgorithm = | AES256
| KMS

type s3Prefix = string

type s3BucketOwner = string

type s3Bucket = string

type restoreTableToPointInTimeOutput = {
  tableDescription: option(tableDescription)
}

type globalSecondaryIndex = {
  provisionedThroughput: option(provisionedThroughput),
  projection: projection,
  keySchema: keySchema,
  indexName: indexName
}

type globalSecondaryIndexList = list(globalSecondaryIndex)

type localSecondaryIndex = {
  projection: projection,
  keySchema: keySchema,
  indexName: indexName
}

type localSecondaryIndexList = list(localSecondaryIndex)

type restoreTableToPointInTimeInput = {
  ssespecificationOverride: option(ssespecification),
  provisionedThroughputOverride: option(provisionedThroughput),
  localSecondaryIndexOverride: option(localSecondaryIndexList),
  globalSecondaryIndexOverride: option(globalSecondaryIndexList),
  billingModeOverride: option(billingMode),
  restoreDateTime: option(date),
  useLatestRestorableTime: option(booleanObject),
  targetTableName: tableName,
  sourceTableName: option(tableName),
  sourceTableArn: option(tableArn)
}

exception PointInTimeRecoveryUnavailableException(Aws.apiError(Aws.emptyErrorDetails))

exception InvalidRestoreTimeException(Aws.apiError(Aws.emptyErrorDetails))

type restoreTableFromBackupOutput = {
  tableDescription: option(tableDescription)
}

type restoreTableFromBackupInput = {
  ssespecificationOverride: option(ssespecification),
  provisionedThroughputOverride: option(provisionedThroughput),
  localSecondaryIndexOverride: option(localSecondaryIndexList),
  globalSecondaryIndexOverride: option(globalSecondaryIndexList),
  billingModeOverride: option(billingMode),
  backupArn: backupArn,
  targetTableName: tableName
}

exception BackupNotFoundException(Aws.apiError(Aws.emptyErrorDetails))

exception BackupInUseException(Aws.apiError(Aws.emptyErrorDetails))

type replica = {
  regionName: option(regionName)
}

type replicaList = list(replica)

type queryOutput = {
  consumedCapacity: option(consumedCapacity),
  lastEvaluatedKey: option(key),
  scannedCount: option(integer_),
  count: option(integer_),
  items: option(itemList)
}

type keyConditions = list((string, condition))

type keyExpression = string

type queryInput = {
  expressionAttributeValues: option(expressionAttributeValueMap),
  expressionAttributeNames: option(expressionAttributeNameMap),
  keyConditionExpression: option(keyExpression),
  filterExpression: option(conditionExpression),
  projectionExpression: option(projectionExpression),
  returnConsumedCapacity: option(returnConsumedCapacity),
  exclusiveStartKey: option(key),
  scanIndexForward: option(booleanObject),
  conditionalOperator: option(conditionalOperator),
  queryFilter: option(filterConditionMap),
  keyConditions: option(keyConditions),
  consistentRead: option(consistentRead),
  limit: option(positiveIntegerObject),
  attributesToGet: option(attributeNameList),
  select: option(select),
  indexName: option(indexName),
  tableName: tableName
}

type putItemOutput = {
  itemCollectionMetrics: option(itemCollectionMetrics),
  consumedCapacity: option(consumedCapacity),
  attributes: option(attributeMap)
}

type putItemInput = {
  expressionAttributeValues: option(expressionAttributeValueMap),
  expressionAttributeNames: option(expressionAttributeNameMap),
  conditionExpression: option(conditionExpression),
  conditionalOperator: option(conditionalOperator),
  returnItemCollectionMetrics: option(returnItemCollectionMetrics),
  returnConsumedCapacity: option(returnConsumedCapacity),
  returnValues: option(returnValue),
  expected: option(expectedAttributeMap),
  item: putItemInputAttributeMap,
  tableName: tableName
}

type preparedStatementParameters = list(attributeValue)

type partiQLStatement = string

type partiQLNextToken = string

type batchStatementErrorCodeEnum = | ConditionalCheckFailed
| ItemCollectionSizeLimitExceeded
| RequestLimitExceeded
| ValidationError
| ProvisionedThroughputExceeded
| TransactionConflict
| ThrottlingError
| InternalServerError
| ResourceNotFound
| AccessDenied
| DuplicateItem

type batchStatementError = {
  message: option(string_),
  code: option(batchStatementErrorCodeEnum)
}

type batchStatementResponse = {
  item: option(attributeMap),
  tableName: option(tableName),
  error: option(batchStatementError)
}

type partiQLBatchResponse = list(batchStatementResponse)

type batchStatementRequest = {
  consistentRead: option(consistentRead),
  parameters: option(preparedStatementParameters),
  statement: partiQLStatement
}

type partiQLBatchRequest = list(batchStatementRequest)

type parameterizedStatement = {
  parameters: option(preparedStatementParameters),
  statement: partiQLStatement
}

type parameterizedStatements = list(parameterizedStatement)

type nextTokenString = string

type listTagsOfResourceOutput = {
  nextToken: option(nextTokenString),
  tags: option(tagList_)
}

type listTagsOfResourceInput = {
  nextToken: option(nextTokenString),
  resourceArn: resourceArnString
}

type listTablesOutput = {
  lastEvaluatedTableName: option(tableName),
  tableNames: option(tableNameList)
}

type listTablesInputLimit = int

type listTablesInput = {
  limit: option(listTablesInputLimit),
  exclusiveStartTableName: option(tableName)
}

type globalTable = {
  replicationGroup: option(replicaList),
  globalTableName: option(tableName)
}

type globalTableList = list(globalTable)

type listGlobalTablesOutput = {
  lastEvaluatedGlobalTableName: option(tableName),
  globalTables: option(globalTableList)
}

type listGlobalTablesInput = {
  regionName: option(regionName),
  limit: option(positiveIntegerObject),
  exclusiveStartGlobalTableName: option(tableName)
}

type exportArn = string

type exportStatus = | IN_PROGRESS
| COMPLETED
| FAILED

type exportSummary = {
  exportStatus: option(exportStatus),
  exportArn: option(exportArn)
}

type exportSummaries = list(exportSummary)

type exportNextToken = string

type listExportsOutput = {
  nextToken: option(exportNextToken),
  exportSummaries: option(exportSummaries)
}

type listExportsMaxLimit = int

type listExportsInput = {
  nextToken: option(exportNextToken),
  maxResults: option(listExportsMaxLimit),
  tableArn: option(tableArn)
}

type contributorInsightsSummary = {
  contributorInsightsStatus: option(contributorInsightsStatus),
  indexName: option(indexName),
  tableName: option(tableName)
}

type contributorInsightsSummaries = list(contributorInsightsSummary)

type listContributorInsightsOutput = {
  nextToken: option(nextTokenString),
  contributorInsightsSummaries: option(contributorInsightsSummaries)
}

type listContributorInsightsLimit = int

type listContributorInsightsInput = {
  maxResults: option(listContributorInsightsLimit),
  nextToken: option(nextTokenString),
  tableName: option(tableName)
}

type backupName = string

type backupCreationDateTime = float

type backupStatus = | CREATING
| DELETED
| AVAILABLE

type backupType = | USER
| SYSTEM
| AWS_BACKUP

type backupSizeBytes = int64

type backupSummary = {
  backupSizeBytes: option(backupSizeBytes),
  backupType: option(backupType),
  backupStatus: option(backupStatus),
  backupExpiryDateTime: option(date),
  backupCreationDateTime: option(backupCreationDateTime),
  backupName: option(backupName),
  backupArn: option(backupArn),
  tableArn: option(tableArn),
  tableId: option(tableId),
  tableName: option(tableName)
}

type backupSummaries = list(backupSummary)

type listBackupsOutput = {
  lastEvaluatedBackupArn: option(backupArn),
  backupSummaries: option(backupSummaries)
}

type backupsInputLimit = int

type backupTypeFilter = | USER
| SYSTEM
| AWS_BACKUP
| ALL

type listBackupsInput = {
  backupType: option(backupTypeFilter),
  exclusiveStartBackupArn: option(backupArn),
  timeRangeUpperBound: option(timeRangeUpperBound),
  timeRangeLowerBound: option(timeRangeLowerBound),
  limit: option(backupsInputLimit),
  tableName: option(tableName)
}

type lastUpdateDateTime = float

type destinationStatus = | ENABLING
| ACTIVE
| DISABLING
| DISABLED
| ENABLE_FAILED

type kinesisStreamingDestinationOutput = {
  destinationStatus: option(destinationStatus),
  streamArn: option(streamArn),
  tableName: option(tableName)
}

type kinesisStreamingDestinationInput = {
  streamArn: streamArn,
  tableName: tableName
}

type kinesisDataStreamDestination = {
  destinationStatusDescription: option(string_),
  destinationStatus: option(destinationStatus),
  streamArn: option(streamArn)
}

type kinesisDataStreamDestinations = list(kinesisDataStreamDestination)

type keyList = list(key)

type keysAndAttributes = {
  expressionAttributeNames: option(expressionAttributeNameMap),
  projectionExpression: option(projectionExpression),
  consistentRead: option(consistentRead),
  attributesToGet: option(attributeNameList),
  keys: keyList
}

exception InvalidExportTimeException(Aws.apiError(Aws.emptyErrorDetails))

exception GlobalTableAlreadyExistsException(Aws.apiError(Aws.emptyErrorDetails))

type getItemOutput = {
  consumedCapacity: option(consumedCapacity),
  item: option(attributeMap)
}

type getItemInput = {
  expressionAttributeNames: option(expressionAttributeNameMap),
  projectionExpression: option(projectionExpression),
  returnConsumedCapacity: option(returnConsumedCapacity),
  consistentRead: option(consistentRead),
  attributesToGet: option(attributeNameList),
  key: key,
  tableName: tableName
}

type failureMessage = string

type exceptionName = string

type exceptionDescription = string

type failureException = {
  exceptionDescription: option(exceptionDescription),
  exceptionName: option(exceptionName)
}

type failureCode = string

type exportTime = float

type exportStartTime = float

type exportEndTime = float

type exportManifest = string

type clientToken = string

type exportFormat = | DYNAMODB_JSON
| ION

type billedSizeBytes = int64

type exportDescription = {
  itemCount: option(itemCount),
  billedSizeBytes: option(billedSizeBytes),
  exportFormat: option(exportFormat),
  failureMessage: option(failureMessage),
  failureCode: option(failureCode),
  s3SseKmsKeyId: option(s3SseKmsKeyId),
  s3SseAlgorithm: option(s3SseAlgorithm),
  s3Prefix: option(s3Prefix),
  s3BucketOwner: option(s3BucketOwner),
  s3Bucket: option(s3Bucket),
  clientToken: option(clientToken),
  exportTime: option(exportTime),
  tableId: option(tableId),
  tableArn: option(tableArn),
  exportManifest: option(exportManifest),
  endTime: option(exportEndTime),
  startTime: option(exportStartTime),
  exportStatus: option(exportStatus),
  exportArn: option(exportArn)
}

type exportTableToPointInTimeOutput = {
  exportDescription: option(exportDescription)
}

type exportTableToPointInTimeInput = {
  exportFormat: option(exportFormat),
  s3SseKmsKeyId: option(s3SseKmsKeyId),
  s3SseAlgorithm: option(s3SseAlgorithm),
  s3Prefix: option(s3Prefix),
  s3BucketOwner: option(s3BucketOwner),
  s3Bucket: s3Bucket,
  clientToken: option(clientToken),
  exportTime: option(exportTime),
  tableArn: tableArn
}

exception ExportConflictException(Aws.apiError(Aws.emptyErrorDetails))

exception ExportNotFoundException(Aws.apiError(Aws.emptyErrorDetails))

type executeTransactionOutput = {
  responses: option(itemResponseList)
}

type executeTransactionInput = {
  clientRequestToken: option(clientRequestToken),
  transactStatements: parameterizedStatements
}

type executeStatementOutput = {
  nextToken: option(partiQLNextToken),
  items: option(itemList)
}

type executeStatementInput = {
  nextToken: option(partiQLNextToken),
  consistentRead: option(consistentRead),
  parameters: option(preparedStatementParameters),
  statement: partiQLStatement
}

exception DuplicateItemException(Aws.apiError(Aws.emptyErrorDetails))

type endpoint = {
  cachePeriodInMinutes: long,
  address: string_
}

type endpoints = list(endpoint)

type describeTimeToLiveOutput = {
  timeToLiveDescription: option(timeToLiveDescription)
}

type describeTimeToLiveInput = {
  tableName: tableName
}

type describeTableReplicaAutoScalingOutput = {
  tableAutoScalingDescription: option(tableAutoScalingDescription)
}

type describeTableReplicaAutoScalingInput = {
  tableName: tableName
}

type describeTableOutput = {
  table: option(tableDescription)
}

type describeTableInput = {
  tableName: tableName
}

type describeLimitsOutput = {
  tableMaxWriteCapacityUnits: option(positiveLongObject),
  tableMaxReadCapacityUnits: option(positiveLongObject),
  accountMaxWriteCapacityUnits: option(positiveLongObject),
  accountMaxReadCapacityUnits: option(positiveLongObject)
}

type describeLimitsInput = {.}

type describeKinesisStreamingDestinationOutput = {
  kinesisDataStreamDestinations: option(kinesisDataStreamDestinations),
  tableName: option(tableName)
}

type describeKinesisStreamingDestinationInput = {
  tableName: tableName
}

type describeGlobalTableSettingsOutput = {
  replicaSettings: option(replicaSettingsDescriptionList),
  globalTableName: option(tableName)
}

type describeGlobalTableSettingsInput = {
  globalTableName: tableName
}

type describeGlobalTableOutput = {
  globalTableDescription: option(globalTableDescription)
}

type describeGlobalTableInput = {
  globalTableName: tableName
}

type describeExportOutput = {
  exportDescription: option(exportDescription)
}

type describeExportInput = {
  exportArn: exportArn
}

type describeEndpointsResponse = {
  endpoints: endpoints
}

type describeEndpointsRequest = {.}

type contributorInsightsRule = string

type contributorInsightsRuleList = list(contributorInsightsRule)

type describeContributorInsightsOutput = {
  failureException: option(failureException),
  lastUpdateDateTime: option(lastUpdateDateTime),
  contributorInsightsStatus: option(contributorInsightsStatus),
  contributorInsightsRuleList: option(contributorInsightsRuleList),
  indexName: option(indexName),
  tableName: option(tableName)
}

type describeContributorInsightsInput = {
  indexName: option(indexName),
  tableName: tableName
}

type describeContinuousBackupsOutput = {
  continuousBackupsDescription: option(continuousBackupsDescription)
}

type describeContinuousBackupsInput = {
  tableName: tableName
}

type backupDetails = {
  backupExpiryDateTime: option(date),
  backupCreationDateTime: backupCreationDateTime,
  backupType: backupType,
  backupStatus: backupStatus,
  backupSizeBytes: option(backupSizeBytes),
  backupName: backupName,
  backupArn: backupArn
}

type backupDescription = {
  sourceTableFeatureDetails: option(sourceTableFeatureDetails),
  sourceTableDetails: option(sourceTableDetails),
  backupDetails: option(backupDetails)
}

type describeBackupOutput = {
  backupDescription: option(backupDescription)
}

type describeBackupInput = {
  backupArn: backupArn
}

type deleteTableOutput = {
  tableDescription: option(tableDescription)
}

type deleteTableInput = {
  tableName: tableName
}

type deleteItemOutput = {
  itemCollectionMetrics: option(itemCollectionMetrics),
  consumedCapacity: option(consumedCapacity),
  attributes: option(attributeMap)
}

type deleteItemInput = {
  expressionAttributeValues: option(expressionAttributeValueMap),
  expressionAttributeNames: option(expressionAttributeNameMap),
  conditionExpression: option(conditionExpression),
  returnItemCollectionMetrics: option(returnItemCollectionMetrics),
  returnConsumedCapacity: option(returnConsumedCapacity),
  returnValues: option(returnValue),
  conditionalOperator: option(conditionalOperator),
  expected: option(expectedAttributeMap),
  key: key,
  tableName: tableName
}

type deleteBackupOutput = {
  backupDescription: option(backupDescription)
}

type deleteBackupInput = {
  backupArn: backupArn
}

type createTableOutput = {
  tableDescription: option(tableDescription)
}

type createTableInput = {
  tags: option(tagList_),
  ssespecification: option(ssespecification),
  streamSpecification: option(streamSpecification),
  provisionedThroughput: option(provisionedThroughput),
  billingMode: option(billingMode),
  globalSecondaryIndexes: option(globalSecondaryIndexList),
  localSecondaryIndexes: option(localSecondaryIndexList),
  keySchema: keySchema,
  tableName: tableName,
  attributeDefinitions: attributeDefinitions
}

type createGlobalTableOutput = {
  globalTableDescription: option(globalTableDescription)
}

type createGlobalTableInput = {
  replicationGroup: replicaList,
  globalTableName: tableName
}

type createBackupOutput = {
  backupDetails: option(backupDetails)
}

type createBackupInput = {
  backupName: backupName,
  tableName: tableName
}

type batchWriteItemRequestMap = list((string, writeRequests))

type batchWriteItemOutput = {
  consumedCapacity: option(consumedCapacityMultiple),
  itemCollectionMetrics: option(itemCollectionMetricsPerTable),
  unprocessedItems: option(batchWriteItemRequestMap)
}

type batchWriteItemInput = {
  returnItemCollectionMetrics: option(returnItemCollectionMetrics),
  returnConsumedCapacity: option(returnConsumedCapacity),
  requestItems: batchWriteItemRequestMap
}

type batchGetResponseMap = list((string, itemList))

type batchGetRequestMap = list((string, keysAndAttributes))

type batchGetItemOutput = {
  consumedCapacity: option(consumedCapacityMultiple),
  unprocessedKeys: option(batchGetRequestMap),
  responses: option(batchGetResponseMap)
}

type batchGetItemInput = {
  returnConsumedCapacity: option(returnConsumedCapacity),
  requestItems: batchGetRequestMap
}

type batchExecuteStatementOutput = {
  responses: option(partiQLBatchResponse)
}

type batchExecuteStatementInput = {
  statements: partiQLBatchRequest
}



type baseString = string

type baseBoolean = bool

type baseInteger = int

type baseTimestamp = float

type baseLong = int64

module Serialize = {

  open AwsSdkLib.Json.SerializeHelpers
  let stringAttributeValue_to_yojson = string_to_yojson;
  
  let numberAttributeValue_to_yojson = string_to_yojson;
  
  let binaryAttributeValue_to_yojson = blob_to_yojson;
  
  let stringSetAttributeValue_to_yojson =
  list_to_yojson( stringAttributeValue_to_yojson );
  
  let numberSetAttributeValue_to_yojson =
  list_to_yojson( numberAttributeValue_to_yojson );
  
  let binarySetAttributeValue_to_yojson =
  list_to_yojson( binaryAttributeValue_to_yojson );
  
  let attributeName_to_yojson = string_to_yojson;
  
  let nullAttributeValue_to_yojson = bool_to_yojson;
  
  let booleanAttributeValue_to_yojson = bool_to_yojson;
  
  let attributeValue_to_yojson = ;
  
  let putItemInputAttributeMap_to_yojson = map_to_yojson;
  
  let putRequest_to_yojson =
  (x:putRequest)=>assoc_to_yojson([
    ( "Item" Some(putItemInputAttributeMap_to_yojson(x.item)) )]);
  
  let key_to_yojson = map_to_yojson;
  
  let deleteRequest_to_yojson =
  (x:deleteRequest)=>assoc_to_yojson([( "Key" Some(key_to_yojson(x.key)) )]);
  
  let writeRequest_to_yojson =
  (x:writeRequest)=>assoc_to_yojson([
    ( "DeleteRequest"
      option_to_yojson(deleteRequest_to_yojson)(x.deleteRequest) )(
      "PutRequest" option_to_yojson(putRequest_to_yojson)(x.putRequest) )])
    ;
  
  let writeRequests_to_yojson = list_to_yojson( writeRequest_to_yojson );
  
  let timeToLiveEnabled_to_yojson = bool_to_yojson;
  
  let timeToLiveAttributeName_to_yojson = string_to_yojson;
  
  let timeToLiveSpecification_to_yojson =
  (x:timeToLiveSpecification)=>assoc_to_yojson([
    ( "AttributeName"
      Some(timeToLiveAttributeName_to_yojson(x.attributeName)) )( "Enabled"
      Some(timeToLiveEnabled_to_yojson(x.enabled)) )])
    ;
  
  let updateTimeToLiveOutput_to_yojson =
  (x:updateTimeToLiveOutput)=>assoc_to_yojson([
    ( "TimeToLiveSpecification"
      option_to_yojson(timeToLiveSpecification_to_yojson)(x.timeToLiveSpecification)
      )])
    ;
  
  let tableName_to_yojson = string_to_yojson;
  
  let updateTimeToLiveInput_to_yojson =
  (x:updateTimeToLiveInput)=>assoc_to_yojson([
    ( "TimeToLiveSpecification"
      Some(timeToLiveSpecification_to_yojson(x.timeToLiveSpecification)) )(
      "TableName" Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let errorMessage_to_yojson = string_to_yojson;
  
  let resourceNotFoundException_to_yojson =
  (x:resourceNotFoundException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let resourceInUseException_to_yojson =
  (x:resourceInUseException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let limitExceededException_to_yojson =
  (x:limitExceededException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let string_to_yojson = string_to_yojson;
  
  let invalidEndpointException_to_yojson =
  (x:invalidEndpointException)=>assoc_to_yojson([
    ( "Message" option_to_yojson(string_to_yojson)(x.message) )]);
  
  let internalServerError_to_yojson =
  (x:internalServerError)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let tableStatus_to_yojson =
  fun
    | CREATING => "CREATING"
| UPDATING => "UPDATING"
| DELETING => "DELETING"
| ACTIVE => "ACTIVE"
| INACCESSIBLE_ENCRYPTION_CREDENTIALS => "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
| ARCHIVING => "ARCHIVING"
| ARCHIVED => "ARCHIVED"
    ;
  
  let regionName_to_yojson = string_to_yojson;
  
  let indexName_to_yojson = string_to_yojson;
  
  let indexStatus_to_yojson =
  fun
    | CREATING => "CREATING"
| UPDATING => "UPDATING"
| DELETING => "DELETING"
| ACTIVE => "ACTIVE"
    ;
  
  let positiveLongObject_to_yojson = int_to_yojson;
  
  let booleanObject_to_yojson = bool_to_yojson;
  
  let autoScalingPolicyName_to_yojson = string_to_yojson;
  
  let integerObject_to_yojson = int_to_yojson;
  
  let double_to_yojson = double_to_yojson;
  
  let
  autoScalingTargetTrackingScalingPolicyConfigurationDescription_to_yojson =
  (x:autoScalingTargetTrackingScalingPolicyConfigurationDescription)=>
    assoc_to_yojson([
    ( "TargetValue" Some(double_to_yojson(x.targetValue)) )(
      "ScaleOutCooldown"
      option_to_yojson(integerObject_to_yojson)(x.scaleOutCooldown) )(
      "ScaleInCooldown"
      option_to_yojson(integerObject_to_yojson)(x.scaleInCooldown) )(
      "DisableScaleIn"
      option_to_yojson(booleanObject_to_yojson)(x.disableScaleIn) )])
    ;
  
  let autoScalingPolicyDescription_to_yojson =
  (x:autoScalingPolicyDescription)=>assoc_to_yojson([
    ( "TargetTrackingScalingPolicyConfiguration"
      option_to_yojson(autoScalingTargetTrackingScalingPolicyConfigurationDescription_to_yojson)(x.targetTrackingScalingPolicyConfiguration)
      )( "PolicyName"
      option_to_yojson(autoScalingPolicyName_to_yojson)(x.policyName) )])
    ;
  
  let autoScalingPolicyDescriptionList_to_yojson =
  list_to_yojson( autoScalingPolicyDescription_to_yojson );
  
  let autoScalingSettingsDescription_to_yojson =
  (x:autoScalingSettingsDescription)=>assoc_to_yojson([
    ( "ScalingPolicies"
      option_to_yojson(autoScalingPolicyDescriptionList_to_yojson)(x.scalingPolicies)
      )( "AutoScalingRoleArn"
      option_to_yojson(string_to_yojson)(x.autoScalingRoleArn) )(
      "AutoScalingDisabled"
      option_to_yojson(booleanObject_to_yojson)(x.autoScalingDisabled) )(
      "MaximumUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.maximumUnits) )(
      "MinimumUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.minimumUnits) )])
    ;
  
  let replicaGlobalSecondaryIndexAutoScalingDescription_to_yojson =
  (x:replicaGlobalSecondaryIndexAutoScalingDescription)=>assoc_to_yojson([
    ( "ProvisionedWriteCapacityAutoScalingSettings"
      option_to_yojson(autoScalingSettingsDescription_to_yojson)(x.provisionedWriteCapacityAutoScalingSettings)
      )( "ProvisionedReadCapacityAutoScalingSettings"
      option_to_yojson(autoScalingSettingsDescription_to_yojson)(x.provisionedReadCapacityAutoScalingSettings)
      )( "IndexStatus" option_to_yojson(indexStatus_to_yojson)(x.indexStatus)
      )( "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )])
    ;
  
  let replicaGlobalSecondaryIndexAutoScalingDescriptionList_to_yojson =
  list_to_yojson( replicaGlobalSecondaryIndexAutoScalingDescription_to_yojson
    );
  
  let replicaStatus_to_yojson =
  fun
    | CREATING => "CREATING"
| CREATION_FAILED => "CREATION_FAILED"
| UPDATING => "UPDATING"
| DELETING => "DELETING"
| ACTIVE => "ACTIVE"
| REGION_DISABLED => "REGION_DISABLED"
| INACCESSIBLE_ENCRYPTION_CREDENTIALS => "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
    ;
  
  let replicaAutoScalingDescription_to_yojson =
  (x:replicaAutoScalingDescription)=>assoc_to_yojson([
    ( "ReplicaStatus"
      option_to_yojson(replicaStatus_to_yojson)(x.replicaStatus) )(
      "ReplicaProvisionedWriteCapacityAutoScalingSettings"
      option_to_yojson(autoScalingSettingsDescription_to_yojson)(x.replicaProvisionedWriteCapacityAutoScalingSettings)
      )( "ReplicaProvisionedReadCapacityAutoScalingSettings"
      option_to_yojson(autoScalingSettingsDescription_to_yojson)(x.replicaProvisionedReadCapacityAutoScalingSettings)
      )( "GlobalSecondaryIndexes"
      option_to_yojson(replicaGlobalSecondaryIndexAutoScalingDescriptionList_to_yojson)(x.globalSecondaryIndexes)
      )( "RegionName" option_to_yojson(regionName_to_yojson)(x.regionName) )])
    ;
  
  let replicaAutoScalingDescriptionList_to_yojson =
  list_to_yojson( replicaAutoScalingDescription_to_yojson );
  
  let tableAutoScalingDescription_to_yojson =
  (x:tableAutoScalingDescription)=>assoc_to_yojson([
    ( "Replicas"
      option_to_yojson(replicaAutoScalingDescriptionList_to_yojson)(x.replicas)
      )( "TableStatus" option_to_yojson(tableStatus_to_yojson)(x.tableStatus)
      )( "TableName" option_to_yojson(tableName_to_yojson)(x.tableName) )])
    ;
  
  let updateTableReplicaAutoScalingOutput_to_yojson =
  (x:updateTableReplicaAutoScalingOutput)=>assoc_to_yojson([
    ( "TableAutoScalingDescription"
      option_to_yojson(tableAutoScalingDescription_to_yojson)(x.tableAutoScalingDescription)
      )])
    ;
  
  let autoScalingRoleArn_to_yojson = string_to_yojson;
  
  let autoScalingTargetTrackingScalingPolicyConfigurationUpdate_to_yojson =
  (x:autoScalingTargetTrackingScalingPolicyConfigurationUpdate)=>
    assoc_to_yojson([
    ( "TargetValue" Some(double_to_yojson(x.targetValue)) )(
      "ScaleOutCooldown"
      option_to_yojson(integerObject_to_yojson)(x.scaleOutCooldown) )(
      "ScaleInCooldown"
      option_to_yojson(integerObject_to_yojson)(x.scaleInCooldown) )(
      "DisableScaleIn"
      option_to_yojson(booleanObject_to_yojson)(x.disableScaleIn) )])
    ;
  
  let autoScalingPolicyUpdate_to_yojson =
  (x:autoScalingPolicyUpdate)=>assoc_to_yojson([
    ( "TargetTrackingScalingPolicyConfiguration"
      Some(autoScalingTargetTrackingScalingPolicyConfigurationUpdate_to_yojson(x.targetTrackingScalingPolicyConfiguration))
      )( "PolicyName"
      option_to_yojson(autoScalingPolicyName_to_yojson)(x.policyName) )])
    ;
  
  let autoScalingSettingsUpdate_to_yojson =
  (x:autoScalingSettingsUpdate)=>assoc_to_yojson([
    ( "ScalingPolicyUpdate"
      option_to_yojson(autoScalingPolicyUpdate_to_yojson)(x.scalingPolicyUpdate)
      )( "AutoScalingRoleArn"
      option_to_yojson(autoScalingRoleArn_to_yojson)(x.autoScalingRoleArn) )(
      "AutoScalingDisabled"
      option_to_yojson(booleanObject_to_yojson)(x.autoScalingDisabled) )(
      "MaximumUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.maximumUnits) )(
      "MinimumUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.minimumUnits) )])
    ;
  
  let globalSecondaryIndexAutoScalingUpdate_to_yojson =
  (x:globalSecondaryIndexAutoScalingUpdate)=>assoc_to_yojson([
    ( "ProvisionedWriteCapacityAutoScalingUpdate"
      option_to_yojson(autoScalingSettingsUpdate_to_yojson)(x.provisionedWriteCapacityAutoScalingUpdate)
      )( "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )])
    ;
  
  let globalSecondaryIndexAutoScalingUpdateList_to_yojson =
  list_to_yojson( globalSecondaryIndexAutoScalingUpdate_to_yojson );
  
  let replicaGlobalSecondaryIndexAutoScalingUpdate_to_yojson =
  (x:replicaGlobalSecondaryIndexAutoScalingUpdate)=>assoc_to_yojson([
    ( "ProvisionedReadCapacityAutoScalingUpdate"
      option_to_yojson(autoScalingSettingsUpdate_to_yojson)(x.provisionedReadCapacityAutoScalingUpdate)
      )( "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )])
    ;
  
  let replicaGlobalSecondaryIndexAutoScalingUpdateList_to_yojson =
  list_to_yojson( replicaGlobalSecondaryIndexAutoScalingUpdate_to_yojson );
  
  let replicaAutoScalingUpdate_to_yojson =
  (x:replicaAutoScalingUpdate)=>assoc_to_yojson([
    ( "ReplicaProvisionedReadCapacityAutoScalingUpdate"
      option_to_yojson(autoScalingSettingsUpdate_to_yojson)(x.replicaProvisionedReadCapacityAutoScalingUpdate)
      )( "ReplicaGlobalSecondaryIndexUpdates"
      option_to_yojson(replicaGlobalSecondaryIndexAutoScalingUpdateList_to_yojson)(x.replicaGlobalSecondaryIndexUpdates)
      )( "RegionName" Some(regionName_to_yojson(x.regionName)) )])
    ;
  
  let replicaAutoScalingUpdateList_to_yojson =
  list_to_yojson( replicaAutoScalingUpdate_to_yojson );
  
  let updateTableReplicaAutoScalingInput_to_yojson =
  (x:updateTableReplicaAutoScalingInput)=>assoc_to_yojson([
    ( "ReplicaUpdates"
      option_to_yojson(replicaAutoScalingUpdateList_to_yojson)(x.replicaUpdates)
      )( "ProvisionedWriteCapacityAutoScalingUpdate"
      option_to_yojson(autoScalingSettingsUpdate_to_yojson)(x.provisionedWriteCapacityAutoScalingUpdate)
      )( "TableName" Some(tableName_to_yojson(x.tableName)) )(
      "GlobalSecondaryIndexUpdates"
      option_to_yojson(globalSecondaryIndexAutoScalingUpdateList_to_yojson)(x.globalSecondaryIndexUpdates)
      )])
    ;
  
  let keySchemaAttributeName_to_yojson = string_to_yojson;
  
  let scalarAttributeType_to_yojson = fun
                                        | S => "S"
| N => "N"
| B => "B"
                                        ;
  
  let attributeDefinition_to_yojson =
  (x:attributeDefinition)=>assoc_to_yojson([
    ( "AttributeType" Some(scalarAttributeType_to_yojson(x.attributeType)) )(
      "AttributeName" Some(keySchemaAttributeName_to_yojson(x.attributeName))
      )])
    ;
  
  let attributeDefinitions_to_yojson =
  list_to_yojson( attributeDefinition_to_yojson );
  
  let keyType_to_yojson = fun
                            | HASH => "HASH"
| RANGE => "RANGE"
                            ;
  
  let keySchemaElement_to_yojson =
  (x:keySchemaElement)=>assoc_to_yojson([
    ( "KeyType" Some(keyType_to_yojson(x.keyType)) )( "AttributeName"
      Some(keySchemaAttributeName_to_yojson(x.attributeName)) )])
    ;
  
  let keySchema_to_yojson = list_to_yojson( keySchemaElement_to_yojson );
  
  let date_to_yojson = timestamp_to_yojson;
  
  let nonNegativeLongObject_to_yojson = int_to_yojson;
  
  let provisionedThroughputDescription_to_yojson =
  (x:provisionedThroughputDescription)=>assoc_to_yojson([
    ( "WriteCapacityUnits"
      option_to_yojson(nonNegativeLongObject_to_yojson)(x.writeCapacityUnits)
      )( "ReadCapacityUnits"
      option_to_yojson(nonNegativeLongObject_to_yojson)(x.readCapacityUnits)
      )( "NumberOfDecreasesToday"
      option_to_yojson(positiveLongObject_to_yojson)(x.numberOfDecreasesToday)
      )( "LastDecreaseDateTime"
      option_to_yojson(date_to_yojson)(x.lastDecreaseDateTime) )(
      "LastIncreaseDateTime"
      option_to_yojson(date_to_yojson)(x.lastIncreaseDateTime) )])
    ;
  
  let long_to_yojson = int_to_yojson;
  
  let tableId_to_yojson = string_to_yojson;
  
  let billingMode_to_yojson =
  fun
    | PROVISIONED => "PROVISIONED"
| PAY_PER_REQUEST => "PAY_PER_REQUEST"
    ;
  
  let billingModeSummary_to_yojson =
  (x:billingModeSummary)=>assoc_to_yojson([
    ( "LastUpdateToPayPerRequestDateTime"
      option_to_yojson(date_to_yojson)(x.lastUpdateToPayPerRequestDateTime)
      )( "BillingMode" option_to_yojson(billingMode_to_yojson)(x.billingMode)
      )])
    ;
  
  let projectionType_to_yojson =
  fun
    | ALL => "ALL"
| KEYS_ONLY => "KEYS_ONLY"
| INCLUDE => "INCLUDE"
    ;
  
  let nonKeyAttributeName_to_yojson = string_to_yojson;
  
  let nonKeyAttributeNameList_to_yojson =
  list_to_yojson( nonKeyAttributeName_to_yojson );
  
  let projection_to_yojson =
  (x:projection)=>assoc_to_yojson([
    ( "NonKeyAttributes"
      option_to_yojson(nonKeyAttributeNameList_to_yojson)(x.nonKeyAttributes)
      )( "ProjectionType"
      option_to_yojson(projectionType_to_yojson)(x.projectionType) )])
    ;
  
  let localSecondaryIndexDescription_to_yojson =
  (x:localSecondaryIndexDescription)=>assoc_to_yojson([
    ( "IndexArn" option_to_yojson(string_to_yojson)(x.indexArn) )(
      "ItemCount" option_to_yojson(long_to_yojson)(x.itemCount) )(
      "IndexSizeBytes" option_to_yojson(long_to_yojson)(x.indexSizeBytes) )(
      "Projection" option_to_yojson(projection_to_yojson)(x.projection) )(
      "KeySchema" option_to_yojson(keySchema_to_yojson)(x.keySchema) )(
      "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )])
    ;
  
  let localSecondaryIndexDescriptionList_to_yojson =
  list_to_yojson( localSecondaryIndexDescription_to_yojson );
  
  let backfilling_to_yojson = bool_to_yojson;
  
  let globalSecondaryIndexDescription_to_yojson =
  (x:globalSecondaryIndexDescription)=>assoc_to_yojson([
    ( "IndexArn" option_to_yojson(string_to_yojson)(x.indexArn) )(
      "ItemCount" option_to_yojson(long_to_yojson)(x.itemCount) )(
      "IndexSizeBytes" option_to_yojson(long_to_yojson)(x.indexSizeBytes) )(
      "ProvisionedThroughput"
      option_to_yojson(provisionedThroughputDescription_to_yojson)(x.provisionedThroughput)
      )( "Backfilling" option_to_yojson(backfilling_to_yojson)(x.backfilling)
      )( "IndexStatus" option_to_yojson(indexStatus_to_yojson)(x.indexStatus)
      )( "Projection" option_to_yojson(projection_to_yojson)(x.projection) )(
      "KeySchema" option_to_yojson(keySchema_to_yojson)(x.keySchema) )(
      "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )])
    ;
  
  let globalSecondaryIndexDescriptionList_to_yojson =
  list_to_yojson( globalSecondaryIndexDescription_to_yojson );
  
  let streamEnabled_to_yojson = bool_to_yojson;
  
  let streamViewType_to_yojson =
  fun
    | NEW_IMAGE => "NEW_IMAGE"
| OLD_IMAGE => "OLD_IMAGE"
| NEW_AND_OLD_IMAGES => "NEW_AND_OLD_IMAGES"
| KEYS_ONLY => "KEYS_ONLY"
    ;
  
  let streamSpecification_to_yojson =
  (x:streamSpecification)=>assoc_to_yojson([
    ( "StreamViewType"
      option_to_yojson(streamViewType_to_yojson)(x.streamViewType) )(
      "StreamEnabled" Some(streamEnabled_to_yojson(x.streamEnabled)) )])
    ;
  
  let streamArn_to_yojson = string_to_yojson;
  
  let replicaStatusDescription_to_yojson = string_to_yojson;
  
  let replicaStatusPercentProgress_to_yojson = string_to_yojson;
  
  let kmsmasterKeyId_to_yojson = string_to_yojson;
  
  let provisionedThroughputOverride_to_yojson =
  (x:provisionedThroughputOverride)=>assoc_to_yojson([
    ( "ReadCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.readCapacityUnits) )])
    ;
  
  let replicaGlobalSecondaryIndexDescription_to_yojson =
  (x:replicaGlobalSecondaryIndexDescription)=>assoc_to_yojson([
    ( "ProvisionedThroughputOverride"
      option_to_yojson(provisionedThroughputOverride_to_yojson)(x.provisionedThroughputOverride)
      )( "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )])
    ;
  
  let replicaGlobalSecondaryIndexDescriptionList_to_yojson =
  list_to_yojson( replicaGlobalSecondaryIndexDescription_to_yojson );
  
  let replicaDescription_to_yojson =
  (x:replicaDescription)=>assoc_to_yojson([
    ( "ReplicaInaccessibleDateTime"
      option_to_yojson(date_to_yojson)(x.replicaInaccessibleDateTime) )(
      "GlobalSecondaryIndexes"
      option_to_yojson(replicaGlobalSecondaryIndexDescriptionList_to_yojson)(x.globalSecondaryIndexes)
      )( "ProvisionedThroughputOverride"
      option_to_yojson(provisionedThroughputOverride_to_yojson)(x.provisionedThroughputOverride)
      )( "KMSMasterKeyId"
      option_to_yojson(kmsmasterKeyId_to_yojson)(x.kmsmasterKeyId) )(
      "ReplicaStatusPercentProgress"
      option_to_yojson(replicaStatusPercentProgress_to_yojson)(x.replicaStatusPercentProgress)
      )( "ReplicaStatusDescription"
      option_to_yojson(replicaStatusDescription_to_yojson)(x.replicaStatusDescription)
      )( "ReplicaStatus"
      option_to_yojson(replicaStatus_to_yojson)(x.replicaStatus) )(
      "RegionName" option_to_yojson(regionName_to_yojson)(x.regionName) )])
    ;
  
  let replicaDescriptionList_to_yojson =
  list_to_yojson( replicaDescription_to_yojson );
  
  let backupArn_to_yojson = string_to_yojson;
  
  let tableArn_to_yojson = string_to_yojson;
  
  let restoreInProgress_to_yojson = bool_to_yojson;
  
  let restoreSummary_to_yojson =
  (x:restoreSummary)=>assoc_to_yojson([
    ( "RestoreInProgress"
      Some(restoreInProgress_to_yojson(x.restoreInProgress)) )(
      "RestoreDateTime" Some(date_to_yojson(x.restoreDateTime)) )(
      "SourceTableArn" option_to_yojson(tableArn_to_yojson)(x.sourceTableArn)
      )( "SourceBackupArn"
      option_to_yojson(backupArn_to_yojson)(x.sourceBackupArn) )])
    ;
  
  let ssestatus_to_yojson =
  fun
    | ENABLING => "ENABLING"
| ENABLED => "ENABLED"
| DISABLING => "DISABLING"
| DISABLED => "DISABLED"
| UPDATING => "UPDATING"
    ;
  
  let ssetype_to_yojson = fun
                            | AES256 => "AES256"
| KMS => "KMS"
                            ;
  
  let kmsmasterKeyArn_to_yojson = string_to_yojson;
  
  let ssedescription_to_yojson =
  (x:ssedescription)=>assoc_to_yojson([
    ( "InaccessibleEncryptionDateTime"
      option_to_yojson(date_to_yojson)(x.inaccessibleEncryptionDateTime) )(
      "KMSMasterKeyArn"
      option_to_yojson(kmsmasterKeyArn_to_yojson)(x.kmsmasterKeyArn) )(
      "SSEType" option_to_yojson(ssetype_to_yojson)(x.ssetype) )( "Status"
      option_to_yojson(ssestatus_to_yojson)(x.status) )])
    ;
  
  let archivalReason_to_yojson = string_to_yojson;
  
  let archivalSummary_to_yojson =
  (x:archivalSummary)=>assoc_to_yojson([
    ( "ArchivalBackupArn"
      option_to_yojson(backupArn_to_yojson)(x.archivalBackupArn) )(
      "ArchivalReason"
      option_to_yojson(archivalReason_to_yojson)(x.archivalReason) )(
      "ArchivalDateTime" option_to_yojson(date_to_yojson)(x.archivalDateTime)
      )])
    ;
  
  let tableDescription_to_yojson =
  (x:tableDescription)=>assoc_to_yojson([
    ( "ArchivalSummary"
      option_to_yojson(archivalSummary_to_yojson)(x.archivalSummary) )(
      "SSEDescription"
      option_to_yojson(ssedescription_to_yojson)(x.ssedescription) )(
      "RestoreSummary"
      option_to_yojson(restoreSummary_to_yojson)(x.restoreSummary) )(
      "Replicas"
      option_to_yojson(replicaDescriptionList_to_yojson)(x.replicas) )(
      "GlobalTableVersion"
      option_to_yojson(string_to_yojson)(x.globalTableVersion) )(
      "LatestStreamArn"
      option_to_yojson(streamArn_to_yojson)(x.latestStreamArn) )(
      "LatestStreamLabel"
      option_to_yojson(string_to_yojson)(x.latestStreamLabel) )(
      "StreamSpecification"
      option_to_yojson(streamSpecification_to_yojson)(x.streamSpecification)
      )( "GlobalSecondaryIndexes"
      option_to_yojson(globalSecondaryIndexDescriptionList_to_yojson)(x.globalSecondaryIndexes)
      )( "LocalSecondaryIndexes"
      option_to_yojson(localSecondaryIndexDescriptionList_to_yojson)(x.localSecondaryIndexes)
      )( "BillingModeSummary"
      option_to_yojson(billingModeSummary_to_yojson)(x.billingModeSummary) )(
      "TableId" option_to_yojson(tableId_to_yojson)(x.tableId) )( "TableArn"
      option_to_yojson(string_to_yojson)(x.tableArn) )( "ItemCount"
      option_to_yojson(long_to_yojson)(x.itemCount) )( "TableSizeBytes"
      option_to_yojson(long_to_yojson)(x.tableSizeBytes) )(
      "ProvisionedThroughput"
      option_to_yojson(provisionedThroughputDescription_to_yojson)(x.provisionedThroughput)
      )( "CreationDateTime"
      option_to_yojson(date_to_yojson)(x.creationDateTime) )( "TableStatus"
      option_to_yojson(tableStatus_to_yojson)(x.tableStatus) )( "KeySchema"
      option_to_yojson(keySchema_to_yojson)(x.keySchema) )( "TableName"
      option_to_yojson(tableName_to_yojson)(x.tableName) )(
      "AttributeDefinitions"
      option_to_yojson(attributeDefinitions_to_yojson)(x.attributeDefinitions)
      )])
    ;
  
  let updateTableOutput_to_yojson =
  (x:updateTableOutput)=>assoc_to_yojson([
    ( "TableDescription"
      option_to_yojson(tableDescription_to_yojson)(x.tableDescription) )])
    ;
  
  let provisionedThroughput_to_yojson =
  (x:provisionedThroughput)=>assoc_to_yojson([
    ( "WriteCapacityUnits"
      Some(positiveLongObject_to_yojson(x.writeCapacityUnits)) )(
      "ReadCapacityUnits"
      Some(positiveLongObject_to_yojson(x.readCapacityUnits)) )])
    ;
  
  let updateGlobalSecondaryIndexAction_to_yojson =
  (x:updateGlobalSecondaryIndexAction)=>assoc_to_yojson([
    ( "ProvisionedThroughput"
      Some(provisionedThroughput_to_yojson(x.provisionedThroughput)) )(
      "IndexName" Some(indexName_to_yojson(x.indexName)) )])
    ;
  
  let createGlobalSecondaryIndexAction_to_yojson =
  (x:createGlobalSecondaryIndexAction)=>assoc_to_yojson([
    ( "ProvisionedThroughput"
      option_to_yojson(provisionedThroughput_to_yojson)(x.provisionedThroughput)
      )( "Projection" Some(projection_to_yojson(x.projection)) )( "KeySchema"
      Some(keySchema_to_yojson(x.keySchema)) )( "IndexName"
      Some(indexName_to_yojson(x.indexName)) )])
    ;
  
  let deleteGlobalSecondaryIndexAction_to_yojson =
  (x:deleteGlobalSecondaryIndexAction)=>assoc_to_yojson([
    ( "IndexName" Some(indexName_to_yojson(x.indexName)) )]);
  
  let globalSecondaryIndexUpdate_to_yojson =
  (x:globalSecondaryIndexUpdate)=>assoc_to_yojson([
    ( "Delete"
      option_to_yojson(deleteGlobalSecondaryIndexAction_to_yojson)(x.delete)
      )( "Create"
      option_to_yojson(createGlobalSecondaryIndexAction_to_yojson)(x.create)
      )( "Update"
      option_to_yojson(updateGlobalSecondaryIndexAction_to_yojson)(x.update)
      )])
    ;
  
  let globalSecondaryIndexUpdateList_to_yojson =
  list_to_yojson( globalSecondaryIndexUpdate_to_yojson );
  
  let sseenabled_to_yojson = bool_to_yojson;
  
  let ssespecification_to_yojson =
  (x:ssespecification)=>assoc_to_yojson([
    ( "KMSMasterKeyId"
      option_to_yojson(kmsmasterKeyId_to_yojson)(x.kmsmasterKeyId) )(
      "SSEType" option_to_yojson(ssetype_to_yojson)(x.ssetype) )( "Enabled"
      option_to_yojson(sseenabled_to_yojson)(x.enabled) )])
    ;
  
  let replicaGlobalSecondaryIndex_to_yojson =
  (x:replicaGlobalSecondaryIndex)=>assoc_to_yojson([
    ( "ProvisionedThroughputOverride"
      option_to_yojson(provisionedThroughputOverride_to_yojson)(x.provisionedThroughputOverride)
      )( "IndexName" Some(indexName_to_yojson(x.indexName)) )])
    ;
  
  let replicaGlobalSecondaryIndexList_to_yojson =
  list_to_yojson( replicaGlobalSecondaryIndex_to_yojson );
  
  let createReplicationGroupMemberAction_to_yojson =
  (x:createReplicationGroupMemberAction)=>assoc_to_yojson([
    ( "GlobalSecondaryIndexes"
      option_to_yojson(replicaGlobalSecondaryIndexList_to_yojson)(x.globalSecondaryIndexes)
      )( "ProvisionedThroughputOverride"
      option_to_yojson(provisionedThroughputOverride_to_yojson)(x.provisionedThroughputOverride)
      )( "KMSMasterKeyId"
      option_to_yojson(kmsmasterKeyId_to_yojson)(x.kmsmasterKeyId) )(
      "RegionName" Some(regionName_to_yojson(x.regionName)) )])
    ;
  
  let updateReplicationGroupMemberAction_to_yojson =
  (x:updateReplicationGroupMemberAction)=>assoc_to_yojson([
    ( "GlobalSecondaryIndexes"
      option_to_yojson(replicaGlobalSecondaryIndexList_to_yojson)(x.globalSecondaryIndexes)
      )( "ProvisionedThroughputOverride"
      option_to_yojson(provisionedThroughputOverride_to_yojson)(x.provisionedThroughputOverride)
      )( "KMSMasterKeyId"
      option_to_yojson(kmsmasterKeyId_to_yojson)(x.kmsmasterKeyId) )(
      "RegionName" Some(regionName_to_yojson(x.regionName)) )])
    ;
  
  let deleteReplicationGroupMemberAction_to_yojson =
  (x:deleteReplicationGroupMemberAction)=>assoc_to_yojson([
    ( "RegionName" Some(regionName_to_yojson(x.regionName)) )]);
  
  let replicationGroupUpdate_to_yojson =
  (x:replicationGroupUpdate)=>assoc_to_yojson([
    ( "Delete"
      option_to_yojson(deleteReplicationGroupMemberAction_to_yojson)(x.delete)
      )( "Update"
      option_to_yojson(updateReplicationGroupMemberAction_to_yojson)(x.update)
      )( "Create"
      option_to_yojson(createReplicationGroupMemberAction_to_yojson)(x.create)
      )])
    ;
  
  let replicationGroupUpdateList_to_yojson =
  list_to_yojson( replicationGroupUpdate_to_yojson );
  
  let updateTableInput_to_yojson =
  (x:updateTableInput)=>assoc_to_yojson([
    ( "ReplicaUpdates"
      option_to_yojson(replicationGroupUpdateList_to_yojson)(x.replicaUpdates)
      )( "SSESpecification"
      option_to_yojson(ssespecification_to_yojson)(x.ssespecification) )(
      "StreamSpecification"
      option_to_yojson(streamSpecification_to_yojson)(x.streamSpecification)
      )( "GlobalSecondaryIndexUpdates"
      option_to_yojson(globalSecondaryIndexUpdateList_to_yojson)(x.globalSecondaryIndexUpdates)
      )( "ProvisionedThroughput"
      option_to_yojson(provisionedThroughput_to_yojson)(x.provisionedThroughput)
      )( "BillingMode" option_to_yojson(billingMode_to_yojson)(x.billingMode)
      )( "TableName" Some(tableName_to_yojson(x.tableName)) )(
      "AttributeDefinitions"
      option_to_yojson(attributeDefinitions_to_yojson)(x.attributeDefinitions)
      )])
    ;
  
  let attributeMap_to_yojson = map_to_yojson;
  
  let consumedCapacityUnits_to_yojson = double_to_yojson;
  
  let capacity_to_yojson =
  (x:capacity)=>assoc_to_yojson([
    ( "CapacityUnits"
      option_to_yojson(consumedCapacityUnits_to_yojson)(x.capacityUnits) )(
      "WriteCapacityUnits"
      option_to_yojson(consumedCapacityUnits_to_yojson)(x.writeCapacityUnits)
      )( "ReadCapacityUnits"
      option_to_yojson(consumedCapacityUnits_to_yojson)(x.readCapacityUnits)
      )])
    ;
  
  let secondaryIndexesCapacityMap_to_yojson = map_to_yojson;
  
  let consumedCapacity_to_yojson =
  (x:consumedCapacity)=>assoc_to_yojson([
    ( "GlobalSecondaryIndexes"
      option_to_yojson(secondaryIndexesCapacityMap_to_yojson)(x.globalSecondaryIndexes)
      )( "LocalSecondaryIndexes"
      option_to_yojson(secondaryIndexesCapacityMap_to_yojson)(x.localSecondaryIndexes)
      )( "Table" option_to_yojson(capacity_to_yojson)(x.table) )(
      "WriteCapacityUnits"
      option_to_yojson(consumedCapacityUnits_to_yojson)(x.writeCapacityUnits)
      )( "ReadCapacityUnits"
      option_to_yojson(consumedCapacityUnits_to_yojson)(x.readCapacityUnits)
      )( "CapacityUnits"
      option_to_yojson(consumedCapacityUnits_to_yojson)(x.capacityUnits) )(
      "TableName" option_to_yojson(tableName_to_yojson)(x.tableName) )])
    ;
  
  let itemCollectionKeyAttributeMap_to_yojson = map_to_yojson;
  
  let itemCollectionSizeEstimateBound_to_yojson = double_to_yojson;
  
  let itemCollectionSizeEstimateRange_to_yojson =
  list_to_yojson( itemCollectionSizeEstimateBound_to_yojson );
  
  let itemCollectionMetrics_to_yojson =
  (x:itemCollectionMetrics)=>assoc_to_yojson([
    ( "SizeEstimateRangeGB"
      option_to_yojson(itemCollectionSizeEstimateRange_to_yojson)(x.sizeEstimateRangeGB)
      )( "ItemCollectionKey"
      option_to_yojson(itemCollectionKeyAttributeMap_to_yojson)(x.itemCollectionKey)
      )])
    ;
  
  let updateItemOutput_to_yojson =
  (x:updateItemOutput)=>assoc_to_yojson([
    ( "ItemCollectionMetrics"
      option_to_yojson(itemCollectionMetrics_to_yojson)(x.itemCollectionMetrics)
      )( "ConsumedCapacity"
      option_to_yojson(consumedCapacity_to_yojson)(x.consumedCapacity) )(
      "Attributes" option_to_yojson(attributeMap_to_yojson)(x.attributes) )])
    ;
  
  let attributeAction_to_yojson =
  fun
    | ADD => "ADD"
| PUT => "PUT"
| DELETE => "DELETE"
    ;
  
  let attributeValueUpdate_to_yojson =
  (x:attributeValueUpdate)=>assoc_to_yojson([
    ( "Action" option_to_yojson(attributeAction_to_yojson)(x.action) )(
      "Value" option_to_yojson(attributeValue_to_yojson)(x.value) )])
    ;
  
  let attributeUpdates_to_yojson = map_to_yojson;
  
  let comparisonOperator_to_yojson =
  fun
    | EQ => "EQ"
| NE => "NE"
| IN => "IN"
| LE => "LE"
| LT => "LT"
| GE => "GE"
| GT => "GT"
| BETWEEN => "BETWEEN"
| NOT_NULL => "NOT_NULL"
| NULL => "NULL"
| CONTAINS => "CONTAINS"
| NOT_CONTAINS => "NOT_CONTAINS"
| BEGINS_WITH => "BEGINS_WITH"
    ;
  
  let attributeValueList_to_yojson =
  list_to_yojson( attributeValue_to_yojson );
  
  let expectedAttributeValue_to_yojson =
  (x:expectedAttributeValue)=>assoc_to_yojson([
    ( "AttributeValueList"
      option_to_yojson(attributeValueList_to_yojson)(x.attributeValueList) )(
      "ComparisonOperator"
      option_to_yojson(comparisonOperator_to_yojson)(x.comparisonOperator) )(
      "Exists" option_to_yojson(booleanObject_to_yojson)(x.exists) )( "Value"
      option_to_yojson(attributeValue_to_yojson)(x.value) )])
    ;
  
  let expectedAttributeMap_to_yojson = map_to_yojson;
  
  let conditionalOperator_to_yojson = fun
                                        | AND => "AND"
| OR => "OR"
                                        ;
  
  let returnValue_to_yojson =
  fun
    | NONE => "NONE"
| ALL_OLD => "ALL_OLD"
| UPDATED_OLD => "UPDATED_OLD"
| ALL_NEW => "ALL_NEW"
| UPDATED_NEW => "UPDATED_NEW"
    ;
  
  let returnConsumedCapacity_to_yojson =
  fun
    | INDEXES => "INDEXES"
| TOTAL => "TOTAL"
| NONE => "NONE"
    ;
  
  let returnItemCollectionMetrics_to_yojson =
  fun
    | SIZE => "SIZE"
| NONE => "NONE"
    ;
  
  let updateExpression_to_yojson = string_to_yojson;
  
  let conditionExpression_to_yojson = string_to_yojson;
  
  let expressionAttributeNameVariable_to_yojson = string_to_yojson;
  
  let expressionAttributeNameMap_to_yojson = map_to_yojson;
  
  let expressionAttributeValueVariable_to_yojson = string_to_yojson;
  
  let expressionAttributeValueMap_to_yojson = map_to_yojson;
  
  let updateItemInput_to_yojson =
  (x:updateItemInput)=>assoc_to_yojson([
    ( "ExpressionAttributeValues"
      option_to_yojson(expressionAttributeValueMap_to_yojson)(x.expressionAttributeValues)
      )( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "ConditionExpression"
      option_to_yojson(conditionExpression_to_yojson)(x.conditionExpression)
      )( "UpdateExpression"
      option_to_yojson(updateExpression_to_yojson)(x.updateExpression) )(
      "ReturnItemCollectionMetrics"
      option_to_yojson(returnItemCollectionMetrics_to_yojson)(x.returnItemCollectionMetrics)
      )( "ReturnConsumedCapacity"
      option_to_yojson(returnConsumedCapacity_to_yojson)(x.returnConsumedCapacity)
      )( "ReturnValues"
      option_to_yojson(returnValue_to_yojson)(x.returnValues) )(
      "ConditionalOperator"
      option_to_yojson(conditionalOperator_to_yojson)(x.conditionalOperator)
      )( "Expected"
      option_to_yojson(expectedAttributeMap_to_yojson)(x.expected) )(
      "AttributeUpdates"
      option_to_yojson(attributeUpdates_to_yojson)(x.attributeUpdates) )(
      "Key" Some(key_to_yojson(x.key)) )( "TableName"
      Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let transactionConflictException_to_yojson =
  (x:transactionConflictException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let requestLimitExceeded_to_yojson =
  (x:requestLimitExceeded)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let provisionedThroughputExceededException_to_yojson =
  (x:provisionedThroughputExceededException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let itemCollectionSizeLimitExceededException_to_yojson =
  (x:itemCollectionSizeLimitExceededException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let conditionalCheckFailedException_to_yojson =
  (x:conditionalCheckFailedException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let replicaGlobalSecondaryIndexSettingsDescription_to_yojson =
  (x:replicaGlobalSecondaryIndexSettingsDescription)=>assoc_to_yojson([
    ( "ProvisionedWriteCapacityAutoScalingSettings"
      option_to_yojson(autoScalingSettingsDescription_to_yojson)(x.provisionedWriteCapacityAutoScalingSettings)
      )( "ProvisionedWriteCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.provisionedWriteCapacityUnits)
      )( "ProvisionedReadCapacityAutoScalingSettings"
      option_to_yojson(autoScalingSettingsDescription_to_yojson)(x.provisionedReadCapacityAutoScalingSettings)
      )( "ProvisionedReadCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.provisionedReadCapacityUnits)
      )( "IndexStatus" option_to_yojson(indexStatus_to_yojson)(x.indexStatus)
      )( "IndexName" Some(indexName_to_yojson(x.indexName)) )])
    ;
  
  let replicaGlobalSecondaryIndexSettingsDescriptionList_to_yojson =
  list_to_yojson( replicaGlobalSecondaryIndexSettingsDescription_to_yojson );
  
  let replicaSettingsDescription_to_yojson =
  (x:replicaSettingsDescription)=>assoc_to_yojson([
    ( "ReplicaGlobalSecondaryIndexSettings"
      option_to_yojson(replicaGlobalSecondaryIndexSettingsDescriptionList_to_yojson)(x.replicaGlobalSecondaryIndexSettings)
      )( "ReplicaProvisionedWriteCapacityAutoScalingSettings"
      option_to_yojson(autoScalingSettingsDescription_to_yojson)(x.replicaProvisionedWriteCapacityAutoScalingSettings)
      )( "ReplicaProvisionedWriteCapacityUnits"
      option_to_yojson(nonNegativeLongObject_to_yojson)(x.replicaProvisionedWriteCapacityUnits)
      )( "ReplicaProvisionedReadCapacityAutoScalingSettings"
      option_to_yojson(autoScalingSettingsDescription_to_yojson)(x.replicaProvisionedReadCapacityAutoScalingSettings)
      )( "ReplicaProvisionedReadCapacityUnits"
      option_to_yojson(nonNegativeLongObject_to_yojson)(x.replicaProvisionedReadCapacityUnits)
      )( "ReplicaBillingModeSummary"
      option_to_yojson(billingModeSummary_to_yojson)(x.replicaBillingModeSummary)
      )( "ReplicaStatus"
      option_to_yojson(replicaStatus_to_yojson)(x.replicaStatus) )(
      "RegionName" Some(regionName_to_yojson(x.regionName)) )])
    ;
  
  let replicaSettingsDescriptionList_to_yojson =
  list_to_yojson( replicaSettingsDescription_to_yojson );
  
  let updateGlobalTableSettingsOutput_to_yojson =
  (x:updateGlobalTableSettingsOutput)=>assoc_to_yojson([
    ( "ReplicaSettings"
      option_to_yojson(replicaSettingsDescriptionList_to_yojson)(x.replicaSettings)
      )( "GlobalTableName"
      option_to_yojson(tableName_to_yojson)(x.globalTableName) )])
    ;
  
  let globalTableGlobalSecondaryIndexSettingsUpdate_to_yojson =
  (x:globalTableGlobalSecondaryIndexSettingsUpdate)=>assoc_to_yojson([
    ( "ProvisionedWriteCapacityAutoScalingSettingsUpdate"
      option_to_yojson(autoScalingSettingsUpdate_to_yojson)(x.provisionedWriteCapacityAutoScalingSettingsUpdate)
      )( "ProvisionedWriteCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.provisionedWriteCapacityUnits)
      )( "IndexName" Some(indexName_to_yojson(x.indexName)) )])
    ;
  
  let globalTableGlobalSecondaryIndexSettingsUpdateList_to_yojson =
  list_to_yojson( globalTableGlobalSecondaryIndexSettingsUpdate_to_yojson );
  
  let replicaGlobalSecondaryIndexSettingsUpdate_to_yojson =
  (x:replicaGlobalSecondaryIndexSettingsUpdate)=>assoc_to_yojson([
    ( "ProvisionedReadCapacityAutoScalingSettingsUpdate"
      option_to_yojson(autoScalingSettingsUpdate_to_yojson)(x.provisionedReadCapacityAutoScalingSettingsUpdate)
      )( "ProvisionedReadCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.provisionedReadCapacityUnits)
      )( "IndexName" Some(indexName_to_yojson(x.indexName)) )])
    ;
  
  let replicaGlobalSecondaryIndexSettingsUpdateList_to_yojson =
  list_to_yojson( replicaGlobalSecondaryIndexSettingsUpdate_to_yojson );
  
  let replicaSettingsUpdate_to_yojson =
  (x:replicaSettingsUpdate)=>assoc_to_yojson([
    ( "ReplicaGlobalSecondaryIndexSettingsUpdate"
      option_to_yojson(replicaGlobalSecondaryIndexSettingsUpdateList_to_yojson)(x.replicaGlobalSecondaryIndexSettingsUpdate)
      )( "ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate"
      option_to_yojson(autoScalingSettingsUpdate_to_yojson)(x.replicaProvisionedReadCapacityAutoScalingSettingsUpdate)
      )( "ReplicaProvisionedReadCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.replicaProvisionedReadCapacityUnits)
      )( "RegionName" Some(regionName_to_yojson(x.regionName)) )])
    ;
  
  let replicaSettingsUpdateList_to_yojson =
  list_to_yojson( replicaSettingsUpdate_to_yojson );
  
  let updateGlobalTableSettingsInput_to_yojson =
  (x:updateGlobalTableSettingsInput)=>assoc_to_yojson([
    ( "ReplicaSettingsUpdate"
      option_to_yojson(replicaSettingsUpdateList_to_yojson)(x.replicaSettingsUpdate)
      )( "GlobalTableGlobalSecondaryIndexSettingsUpdate"
      option_to_yojson(globalTableGlobalSecondaryIndexSettingsUpdateList_to_yojson)(x.globalTableGlobalSecondaryIndexSettingsUpdate)
      )( "GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate"
      option_to_yojson(autoScalingSettingsUpdate_to_yojson)(x.globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate)
      )( "GlobalTableProvisionedWriteCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.globalTableProvisionedWriteCapacityUnits)
      )( "GlobalTableBillingMode"
      option_to_yojson(billingMode_to_yojson)(x.globalTableBillingMode) )(
      "GlobalTableName" Some(tableName_to_yojson(x.globalTableName)) )])
    ;
  
  let replicaNotFoundException_to_yojson =
  (x:replicaNotFoundException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let indexNotFoundException_to_yojson =
  (x:indexNotFoundException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let globalTableNotFoundException_to_yojson =
  (x:globalTableNotFoundException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let globalTableArnString_to_yojson = string_to_yojson;
  
  let globalTableStatus_to_yojson =
  fun
    | CREATING => "CREATING"
| ACTIVE => "ACTIVE"
| DELETING => "DELETING"
| UPDATING => "UPDATING"
    ;
  
  let globalTableDescription_to_yojson =
  (x:globalTableDescription)=>assoc_to_yojson([
    ( "GlobalTableName"
      option_to_yojson(tableName_to_yojson)(x.globalTableName) )(
      "GlobalTableStatus"
      option_to_yojson(globalTableStatus_to_yojson)(x.globalTableStatus) )(
      "CreationDateTime" option_to_yojson(date_to_yojson)(x.creationDateTime)
      )( "GlobalTableArn"
      option_to_yojson(globalTableArnString_to_yojson)(x.globalTableArn) )(
      "ReplicationGroup"
      option_to_yojson(replicaDescriptionList_to_yojson)(x.replicationGroup)
      )])
    ;
  
  let updateGlobalTableOutput_to_yojson =
  (x:updateGlobalTableOutput)=>assoc_to_yojson([
    ( "GlobalTableDescription"
      option_to_yojson(globalTableDescription_to_yojson)(x.globalTableDescription)
      )])
    ;
  
  let createReplicaAction_to_yojson =
  (x:createReplicaAction)=>assoc_to_yojson([
    ( "RegionName" Some(regionName_to_yojson(x.regionName)) )]);
  
  let deleteReplicaAction_to_yojson =
  (x:deleteReplicaAction)=>assoc_to_yojson([
    ( "RegionName" Some(regionName_to_yojson(x.regionName)) )]);
  
  let replicaUpdate_to_yojson =
  (x:replicaUpdate)=>assoc_to_yojson([
    ( "Delete" option_to_yojson(deleteReplicaAction_to_yojson)(x.delete) )(
      "Create" option_to_yojson(createReplicaAction_to_yojson)(x.create) )])
    ;
  
  let replicaUpdateList_to_yojson =
  list_to_yojson( replicaUpdate_to_yojson );
  
  let updateGlobalTableInput_to_yojson =
  (x:updateGlobalTableInput)=>assoc_to_yojson([
    ( "ReplicaUpdates" Some(replicaUpdateList_to_yojson(x.replicaUpdates)) )(
      "GlobalTableName" Some(tableName_to_yojson(x.globalTableName)) )])
    ;
  
  let tableNotFoundException_to_yojson =
  (x:tableNotFoundException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let replicaAlreadyExistsException_to_yojson =
  (x:replicaAlreadyExistsException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let contributorInsightsStatus_to_yojson =
  fun
    | ENABLING => "ENABLING"
| ENABLED => "ENABLED"
| DISABLING => "DISABLING"
| DISABLED => "DISABLED"
| FAILED => "FAILED"
    ;
  
  let updateContributorInsightsOutput_to_yojson =
  (x:updateContributorInsightsOutput)=>assoc_to_yojson([
    ( "ContributorInsightsStatus"
      option_to_yojson(contributorInsightsStatus_to_yojson)(x.contributorInsightsStatus)
      )( "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )(
      "TableName" option_to_yojson(tableName_to_yojson)(x.tableName) )])
    ;
  
  let contributorInsightsAction_to_yojson =
  fun
    | ENABLE => "ENABLE"
| DISABLE => "DISABLE"
    ;
  
  let updateContributorInsightsInput_to_yojson =
  (x:updateContributorInsightsInput)=>assoc_to_yojson([
    ( "ContributorInsightsAction"
      Some(contributorInsightsAction_to_yojson(x.contributorInsightsAction))
      )( "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )(
      "TableName" Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let continuousBackupsStatus_to_yojson =
  fun
    | ENABLED => "ENABLED"
| DISABLED => "DISABLED"
    ;
  
  let pointInTimeRecoveryStatus_to_yojson =
  fun
    | ENABLED => "ENABLED"
| DISABLED => "DISABLED"
    ;
  
  let pointInTimeRecoveryDescription_to_yojson =
  (x:pointInTimeRecoveryDescription)=>assoc_to_yojson([
    ( "LatestRestorableDateTime"
      option_to_yojson(date_to_yojson)(x.latestRestorableDateTime) )(
      "EarliestRestorableDateTime"
      option_to_yojson(date_to_yojson)(x.earliestRestorableDateTime) )(
      "PointInTimeRecoveryStatus"
      option_to_yojson(pointInTimeRecoveryStatus_to_yojson)(x.pointInTimeRecoveryStatus)
      )])
    ;
  
  let continuousBackupsDescription_to_yojson =
  (x:continuousBackupsDescription)=>assoc_to_yojson([
    ( "PointInTimeRecoveryDescription"
      option_to_yojson(pointInTimeRecoveryDescription_to_yojson)(x.pointInTimeRecoveryDescription)
      )( "ContinuousBackupsStatus"
      Some(continuousBackupsStatus_to_yojson(x.continuousBackupsStatus)) )])
    ;
  
  let updateContinuousBackupsOutput_to_yojson =
  (x:updateContinuousBackupsOutput)=>assoc_to_yojson([
    ( "ContinuousBackupsDescription"
      option_to_yojson(continuousBackupsDescription_to_yojson)(x.continuousBackupsDescription)
      )])
    ;
  
  let pointInTimeRecoverySpecification_to_yojson =
  (x:pointInTimeRecoverySpecification)=>assoc_to_yojson([
    ( "PointInTimeRecoveryEnabled"
      Some(booleanObject_to_yojson(x.pointInTimeRecoveryEnabled)) )])
    ;
  
  let updateContinuousBackupsInput_to_yojson =
  (x:updateContinuousBackupsInput)=>assoc_to_yojson([
    ( "PointInTimeRecoverySpecification"
      Some(pointInTimeRecoverySpecification_to_yojson(x.pointInTimeRecoverySpecification))
      )( "TableName" Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let continuousBackupsUnavailableException_to_yojson =
  (x:continuousBackupsUnavailableException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let returnValuesOnConditionCheckFailure_to_yojson =
  fun
    | ALL_OLD => "ALL_OLD"
| NONE => "NONE"
    ;
  
  let update_to_yojson =
  (x:update)=>assoc_to_yojson([
    ( "ReturnValuesOnConditionCheckFailure"
      option_to_yojson(returnValuesOnConditionCheckFailure_to_yojson)(x.returnValuesOnConditionCheckFailure)
      )( "ExpressionAttributeValues"
      option_to_yojson(expressionAttributeValueMap_to_yojson)(x.expressionAttributeValues)
      )( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "ConditionExpression"
      option_to_yojson(conditionExpression_to_yojson)(x.conditionExpression)
      )( "TableName" Some(tableName_to_yojson(x.tableName)) )(
      "UpdateExpression" Some(updateExpression_to_yojson(x.updateExpression))
      )( "Key" Some(key_to_yojson(x.key)) )])
    ;
  
  let resourceArnString_to_yojson = string_to_yojson;
  
  let tagKeyString_to_yojson = string_to_yojson;
  
  let tagKeyList_to_yojson = list_to_yojson( tagKeyString_to_yojson );
  
  let untagResourceInput_to_yojson =
  (x:untagResourceInput)=>assoc_to_yojson([
    ( "TagKeys" Some(tagKeyList_to_yojson(x.tagKeys)) )( "ResourceArn"
      Some(resourceArnString_to_yojson(x.resourceArn)) )])
    ;
  
  let transactionInProgressException_to_yojson =
  (x:transactionInProgressException)=>assoc_to_yojson([
    ( "Message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let code_to_yojson = string_to_yojson;
  
  let cancellationReason_to_yojson =
  (x:cancellationReason)=>assoc_to_yojson([
    ( "Message" option_to_yojson(errorMessage_to_yojson)(x.message) )( "Code"
      option_to_yojson(code_to_yojson)(x.code) )( "Item"
      option_to_yojson(attributeMap_to_yojson)(x.item) )])
    ;
  
  let cancellationReasonList_to_yojson =
  list_to_yojson( cancellationReason_to_yojson );
  
  let transactionCanceledException_to_yojson =
  (x:transactionCanceledException)=>assoc_to_yojson([
    ( "CancellationReasons"
      option_to_yojson(cancellationReasonList_to_yojson)(x.cancellationReasons)
      )( "Message" option_to_yojson(errorMessage_to_yojson)(x.message) )])
    ;
  
  let consumedCapacityMultiple_to_yojson =
  list_to_yojson( consumedCapacity_to_yojson );
  
  let itemCollectionMetricsMultiple_to_yojson =
  list_to_yojson( itemCollectionMetrics_to_yojson );
  
  let itemCollectionMetricsPerTable_to_yojson = map_to_yojson;
  
  let transactWriteItemsOutput_to_yojson =
  (x:transactWriteItemsOutput)=>assoc_to_yojson([
    ( "ItemCollectionMetrics"
      option_to_yojson(itemCollectionMetricsPerTable_to_yojson)(x.itemCollectionMetrics)
      )( "ConsumedCapacity"
      option_to_yojson(consumedCapacityMultiple_to_yojson)(x.consumedCapacity)
      )])
    ;
  
  let conditionCheck_to_yojson =
  (x:conditionCheck)=>assoc_to_yojson([
    ( "ReturnValuesOnConditionCheckFailure"
      option_to_yojson(returnValuesOnConditionCheckFailure_to_yojson)(x.returnValuesOnConditionCheckFailure)
      )( "ExpressionAttributeValues"
      option_to_yojson(expressionAttributeValueMap_to_yojson)(x.expressionAttributeValues)
      )( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "ConditionExpression"
      Some(conditionExpression_to_yojson(x.conditionExpression)) )(
      "TableName" Some(tableName_to_yojson(x.tableName)) )( "Key"
      Some(key_to_yojson(x.key)) )])
    ;
  
  let put_to_yojson =
  (x:put)=>assoc_to_yojson([
    ( "ReturnValuesOnConditionCheckFailure"
      option_to_yojson(returnValuesOnConditionCheckFailure_to_yojson)(x.returnValuesOnConditionCheckFailure)
      )( "ExpressionAttributeValues"
      option_to_yojson(expressionAttributeValueMap_to_yojson)(x.expressionAttributeValues)
      )( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "ConditionExpression"
      option_to_yojson(conditionExpression_to_yojson)(x.conditionExpression)
      )( "TableName" Some(tableName_to_yojson(x.tableName)) )( "Item"
      Some(putItemInputAttributeMap_to_yojson(x.item)) )])
    ;
  
  let delete_to_yojson =
  (x:delete)=>assoc_to_yojson([
    ( "ReturnValuesOnConditionCheckFailure"
      option_to_yojson(returnValuesOnConditionCheckFailure_to_yojson)(x.returnValuesOnConditionCheckFailure)
      )( "ExpressionAttributeValues"
      option_to_yojson(expressionAttributeValueMap_to_yojson)(x.expressionAttributeValues)
      )( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "ConditionExpression"
      option_to_yojson(conditionExpression_to_yojson)(x.conditionExpression)
      )( "TableName" Some(tableName_to_yojson(x.tableName)) )( "Key"
      Some(key_to_yojson(x.key)) )])
    ;
  
  let transactWriteItem_to_yojson =
  (x:transactWriteItem)=>assoc_to_yojson([
    ( "Update" option_to_yojson(update_to_yojson)(x.update) )( "Delete"
      option_to_yojson(delete_to_yojson)(x.delete) )( "Put"
      option_to_yojson(put_to_yojson)(x.put) )( "ConditionCheck"
      option_to_yojson(conditionCheck_to_yojson)(x.conditionCheck) )])
    ;
  
  let transactWriteItemList_to_yojson =
  list_to_yojson( transactWriteItem_to_yojson );
  
  let clientRequestToken_to_yojson = string_to_yojson;
  
  let transactWriteItemsInput_to_yojson =
  (x:transactWriteItemsInput)=>assoc_to_yojson([
    ( "ClientRequestToken"
      option_to_yojson(clientRequestToken_to_yojson)(x.clientRequestToken) )(
      "ReturnItemCollectionMetrics"
      option_to_yojson(returnItemCollectionMetrics_to_yojson)(x.returnItemCollectionMetrics)
      )( "ReturnConsumedCapacity"
      option_to_yojson(returnConsumedCapacity_to_yojson)(x.returnConsumedCapacity)
      )( "TransactItems"
      Some(transactWriteItemList_to_yojson(x.transactItems)) )])
    ;
  
  let idempotentParameterMismatchException_to_yojson =
  (x:idempotentParameterMismatchException)=>assoc_to_yojson([
    ( "Message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let itemResponse_to_yojson =
  (x:itemResponse)=>assoc_to_yojson([
    ( "Item" option_to_yojson(attributeMap_to_yojson)(x.item) )]);
  
  let itemResponseList_to_yojson =
  list_to_yojson( itemResponse_to_yojson );
  
  let transactGetItemsOutput_to_yojson =
  (x:transactGetItemsOutput)=>assoc_to_yojson([
    ( "Responses" option_to_yojson(itemResponseList_to_yojson)(x.responses)
      )( "ConsumedCapacity"
      option_to_yojson(consumedCapacityMultiple_to_yojson)(x.consumedCapacity)
      )])
    ;
  
  let projectionExpression_to_yojson = string_to_yojson;
  
  let get_to_yojson =
  (x:get)=>assoc_to_yojson([
    ( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "ProjectionExpression"
      option_to_yojson(projectionExpression_to_yojson)(x.projectionExpression)
      )( "TableName" Some(tableName_to_yojson(x.tableName)) )( "Key"
      Some(key_to_yojson(x.key)) )])
    ;
  
  let transactGetItem_to_yojson =
  (x:transactGetItem)=>assoc_to_yojson([
    ( "Get" Some(get_to_yojson(x.get)) )]);
  
  let transactGetItemList_to_yojson =
  list_to_yojson( transactGetItem_to_yojson );
  
  let transactGetItemsInput_to_yojson =
  (x:transactGetItemsInput)=>assoc_to_yojson([
    ( "ReturnConsumedCapacity"
      option_to_yojson(returnConsumedCapacity_to_yojson)(x.returnConsumedCapacity)
      )( "TransactItems" Some(transactGetItemList_to_yojson(x.transactItems))
      )])
    ;
  
  let timeToLiveStatus_to_yojson =
  fun
    | ENABLING => "ENABLING"
| DISABLING => "DISABLING"
| ENABLED => "ENABLED"
| DISABLED => "DISABLED"
    ;
  
  let timeToLiveDescription_to_yojson =
  (x:timeToLiveDescription)=>assoc_to_yojson([
    ( "AttributeName"
      option_to_yojson(timeToLiveAttributeName_to_yojson)(x.attributeName) )(
      "TimeToLiveStatus"
      option_to_yojson(timeToLiveStatus_to_yojson)(x.timeToLiveStatus) )])
    ;
  
  let timeRangeUpperBound_to_yojson = timestamp_to_yojson;
  
  let timeRangeLowerBound_to_yojson = timestamp_to_yojson;
  
  let tagValueString_to_yojson = string_to_yojson;
  
  let tag_to_yojson =
  (x:tag)=>assoc_to_yojson([
    ( "Value" Some(tagValueString_to_yojson(x.value)) )( "Key"
      Some(tagKeyString_to_yojson(x.key)) )])
    ;
  
  let tagList_to_yojson = list_to_yojson( tag_to_yojson );
  
  let tagResourceInput_to_yojson =
  (x:tagResourceInput)=>assoc_to_yojson([
    ( "Tags" Some(tagList_to_yojson(x.tags)) )( "ResourceArn"
      Some(resourceArnString_to_yojson(x.resourceArn)) )])
    ;
  
  let tableNameList_to_yojson = list_to_yojson( tableName_to_yojson );
  
  let tableInUseException_to_yojson =
  (x:tableInUseException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let tableCreationDateTime_to_yojson = timestamp_to_yojson;
  
  let tableAlreadyExistsException_to_yojson =
  (x:tableAlreadyExistsException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let localSecondaryIndexInfo_to_yojson =
  (x:localSecondaryIndexInfo)=>assoc_to_yojson([
    ( "Projection" option_to_yojson(projection_to_yojson)(x.projection) )(
      "KeySchema" option_to_yojson(keySchema_to_yojson)(x.keySchema) )(
      "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )])
    ;
  
  let localSecondaryIndexes_to_yojson =
  list_to_yojson( localSecondaryIndexInfo_to_yojson );
  
  let globalSecondaryIndexInfo_to_yojson =
  (x:globalSecondaryIndexInfo)=>assoc_to_yojson([
    ( "ProvisionedThroughput"
      option_to_yojson(provisionedThroughput_to_yojson)(x.provisionedThroughput)
      )( "Projection" option_to_yojson(projection_to_yojson)(x.projection) )(
      "KeySchema" option_to_yojson(keySchema_to_yojson)(x.keySchema) )(
      "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )])
    ;
  
  let globalSecondaryIndexes_to_yojson =
  list_to_yojson( globalSecondaryIndexInfo_to_yojson );
  
  let sourceTableFeatureDetails_to_yojson =
  (x:sourceTableFeatureDetails)=>assoc_to_yojson([
    ( "SSEDescription"
      option_to_yojson(ssedescription_to_yojson)(x.ssedescription) )(
      "TimeToLiveDescription"
      option_to_yojson(timeToLiveDescription_to_yojson)(x.timeToLiveDescription)
      )( "StreamDescription"
      option_to_yojson(streamSpecification_to_yojson)(x.streamDescription) )(
      "GlobalSecondaryIndexes"
      option_to_yojson(globalSecondaryIndexes_to_yojson)(x.globalSecondaryIndexes)
      )( "LocalSecondaryIndexes"
      option_to_yojson(localSecondaryIndexes_to_yojson)(x.localSecondaryIndexes)
      )])
    ;
  
  let itemCount_to_yojson = int_to_yojson;
  
  let sourceTableDetails_to_yojson =
  (x:sourceTableDetails)=>assoc_to_yojson([
    ( "BillingMode" option_to_yojson(billingMode_to_yojson)(x.billingMode) )(
      "ItemCount" option_to_yojson(itemCount_to_yojson)(x.itemCount) )(
      "ProvisionedThroughput"
      Some(provisionedThroughput_to_yojson(x.provisionedThroughput)) )(
      "TableCreationDateTime"
      Some(tableCreationDateTime_to_yojson(x.tableCreationDateTime)) )(
      "KeySchema" Some(keySchema_to_yojson(x.keySchema)) )( "TableSizeBytes"
      option_to_yojson(long_to_yojson)(x.tableSizeBytes) )( "TableArn"
      option_to_yojson(tableArn_to_yojson)(x.tableArn) )( "TableId"
      Some(tableId_to_yojson(x.tableId)) )( "TableName"
      Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let select_to_yojson =
  fun
    | ALL_ATTRIBUTES => "ALL_ATTRIBUTES"
| ALL_PROJECTED_ATTRIBUTES => "ALL_PROJECTED_ATTRIBUTES"
| SPECIFIC_ATTRIBUTES => "SPECIFIC_ATTRIBUTES"
| COUNT => "COUNT"
    ;
  
  let scanTotalSegments_to_yojson = int_to_yojson;
  
  let scanSegment_to_yojson = int_to_yojson;
  
  let itemList_to_yojson = list_to_yojson( attributeMap_to_yojson );
  
  let integer_to_yojson = int_to_yojson;
  
  let scanOutput_to_yojson =
  (x:scanOutput)=>assoc_to_yojson([
    ( "ConsumedCapacity"
      option_to_yojson(consumedCapacity_to_yojson)(x.consumedCapacity) )(
      "LastEvaluatedKey" option_to_yojson(key_to_yojson)(x.lastEvaluatedKey)
      )( "ScannedCount" option_to_yojson(integer_to_yojson)(x.scannedCount)
      )( "Count" option_to_yojson(integer_to_yojson)(x.count) )( "Items"
      option_to_yojson(itemList_to_yojson)(x.items) )])
    ;
  
  let attributeNameList_to_yojson =
  list_to_yojson( attributeName_to_yojson );
  
  let positiveIntegerObject_to_yojson = int_to_yojson;
  
  let condition_to_yojson =
  (x:condition)=>assoc_to_yojson([
    ( "ComparisonOperator"
      Some(comparisonOperator_to_yojson(x.comparisonOperator)) )(
      "AttributeValueList"
      option_to_yojson(attributeValueList_to_yojson)(x.attributeValueList) )])
    ;
  
  let filterConditionMap_to_yojson = map_to_yojson;
  
  let consistentRead_to_yojson = bool_to_yojson;
  
  let scanInput_to_yojson =
  (x:scanInput)=>assoc_to_yojson([
    ( "ConsistentRead"
      option_to_yojson(consistentRead_to_yojson)(x.consistentRead) )(
      "ExpressionAttributeValues"
      option_to_yojson(expressionAttributeValueMap_to_yojson)(x.expressionAttributeValues)
      )( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "FilterExpression"
      option_to_yojson(conditionExpression_to_yojson)(x.filterExpression) )(
      "ProjectionExpression"
      option_to_yojson(projectionExpression_to_yojson)(x.projectionExpression)
      )( "Segment" option_to_yojson(scanSegment_to_yojson)(x.segment) )(
      "TotalSegments"
      option_to_yojson(scanTotalSegments_to_yojson)(x.totalSegments) )(
      "ReturnConsumedCapacity"
      option_to_yojson(returnConsumedCapacity_to_yojson)(x.returnConsumedCapacity)
      )( "ExclusiveStartKey"
      option_to_yojson(key_to_yojson)(x.exclusiveStartKey) )(
      "ConditionalOperator"
      option_to_yojson(conditionalOperator_to_yojson)(x.conditionalOperator)
      )( "ScanFilter"
      option_to_yojson(filterConditionMap_to_yojson)(x.scanFilter) )(
      "Select" option_to_yojson(select_to_yojson)(x.select) )( "Limit"
      option_to_yojson(positiveIntegerObject_to_yojson)(x.limit) )(
      "AttributesToGet"
      option_to_yojson(attributeNameList_to_yojson)(x.attributesToGet) )(
      "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )(
      "TableName" Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let s3SseKmsKeyId_to_yojson = string_to_yojson;
  
  let s3SseAlgorithm_to_yojson = fun
                                   | AES256 => "AES256"
| KMS => "KMS"
                                   ;
  
  let s3Prefix_to_yojson = string_to_yojson;
  
  let s3BucketOwner_to_yojson = string_to_yojson;
  
  let s3Bucket_to_yojson = string_to_yojson;
  
  let restoreTableToPointInTimeOutput_to_yojson =
  (x:restoreTableToPointInTimeOutput)=>assoc_to_yojson([
    ( "TableDescription"
      option_to_yojson(tableDescription_to_yojson)(x.tableDescription) )])
    ;
  
  let globalSecondaryIndex_to_yojson =
  (x:globalSecondaryIndex)=>assoc_to_yojson([
    ( "ProvisionedThroughput"
      option_to_yojson(provisionedThroughput_to_yojson)(x.provisionedThroughput)
      )( "Projection" Some(projection_to_yojson(x.projection)) )( "KeySchema"
      Some(keySchema_to_yojson(x.keySchema)) )( "IndexName"
      Some(indexName_to_yojson(x.indexName)) )])
    ;
  
  let globalSecondaryIndexList_to_yojson =
  list_to_yojson( globalSecondaryIndex_to_yojson );
  
  let localSecondaryIndex_to_yojson =
  (x:localSecondaryIndex)=>assoc_to_yojson([
    ( "Projection" Some(projection_to_yojson(x.projection)) )( "KeySchema"
      Some(keySchema_to_yojson(x.keySchema)) )( "IndexName"
      Some(indexName_to_yojson(x.indexName)) )])
    ;
  
  let localSecondaryIndexList_to_yojson =
  list_to_yojson( localSecondaryIndex_to_yojson );
  
  let restoreTableToPointInTimeInput_to_yojson =
  (x:restoreTableToPointInTimeInput)=>assoc_to_yojson([
    ( "SSESpecificationOverride"
      option_to_yojson(ssespecification_to_yojson)(x.ssespecificationOverride)
      )( "ProvisionedThroughputOverride"
      option_to_yojson(provisionedThroughput_to_yojson)(x.provisionedThroughputOverride)
      )( "LocalSecondaryIndexOverride"
      option_to_yojson(localSecondaryIndexList_to_yojson)(x.localSecondaryIndexOverride)
      )( "GlobalSecondaryIndexOverride"
      option_to_yojson(globalSecondaryIndexList_to_yojson)(x.globalSecondaryIndexOverride)
      )( "BillingModeOverride"
      option_to_yojson(billingMode_to_yojson)(x.billingModeOverride) )(
      "RestoreDateTime" option_to_yojson(date_to_yojson)(x.restoreDateTime)
      )( "UseLatestRestorableTime"
      option_to_yojson(booleanObject_to_yojson)(x.useLatestRestorableTime) )(
      "TargetTableName" Some(tableName_to_yojson(x.targetTableName)) )(
      "SourceTableName"
      option_to_yojson(tableName_to_yojson)(x.sourceTableName) )(
      "SourceTableArn" option_to_yojson(tableArn_to_yojson)(x.sourceTableArn)
      )])
    ;
  
  let pointInTimeRecoveryUnavailableException_to_yojson =
  (x:pointInTimeRecoveryUnavailableException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let invalidRestoreTimeException_to_yojson =
  (x:invalidRestoreTimeException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let restoreTableFromBackupOutput_to_yojson =
  (x:restoreTableFromBackupOutput)=>assoc_to_yojson([
    ( "TableDescription"
      option_to_yojson(tableDescription_to_yojson)(x.tableDescription) )])
    ;
  
  let restoreTableFromBackupInput_to_yojson =
  (x:restoreTableFromBackupInput)=>assoc_to_yojson([
    ( "SSESpecificationOverride"
      option_to_yojson(ssespecification_to_yojson)(x.ssespecificationOverride)
      )( "ProvisionedThroughputOverride"
      option_to_yojson(provisionedThroughput_to_yojson)(x.provisionedThroughputOverride)
      )( "LocalSecondaryIndexOverride"
      option_to_yojson(localSecondaryIndexList_to_yojson)(x.localSecondaryIndexOverride)
      )( "GlobalSecondaryIndexOverride"
      option_to_yojson(globalSecondaryIndexList_to_yojson)(x.globalSecondaryIndexOverride)
      )( "BillingModeOverride"
      option_to_yojson(billingMode_to_yojson)(x.billingModeOverride) )(
      "BackupArn" Some(backupArn_to_yojson(x.backupArn)) )( "TargetTableName"
      Some(tableName_to_yojson(x.targetTableName)) )])
    ;
  
  let backupNotFoundException_to_yojson =
  (x:backupNotFoundException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let backupInUseException_to_yojson =
  (x:backupInUseException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let replica_to_yojson =
  (x:replica)=>assoc_to_yojson([
    ( "RegionName" option_to_yojson(regionName_to_yojson)(x.regionName) )]);
  
  let replicaList_to_yojson = list_to_yojson( replica_to_yojson );
  
  let queryOutput_to_yojson =
  (x:queryOutput)=>assoc_to_yojson([
    ( "ConsumedCapacity"
      option_to_yojson(consumedCapacity_to_yojson)(x.consumedCapacity) )(
      "LastEvaluatedKey" option_to_yojson(key_to_yojson)(x.lastEvaluatedKey)
      )( "ScannedCount" option_to_yojson(integer_to_yojson)(x.scannedCount)
      )( "Count" option_to_yojson(integer_to_yojson)(x.count) )( "Items"
      option_to_yojson(itemList_to_yojson)(x.items) )])
    ;
  
  let keyConditions_to_yojson = map_to_yojson;
  
  let keyExpression_to_yojson = string_to_yojson;
  
  let queryInput_to_yojson =
  (x:queryInput)=>assoc_to_yojson([
    ( "ExpressionAttributeValues"
      option_to_yojson(expressionAttributeValueMap_to_yojson)(x.expressionAttributeValues)
      )( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "KeyConditionExpression"
      option_to_yojson(keyExpression_to_yojson)(x.keyConditionExpression) )(
      "FilterExpression"
      option_to_yojson(conditionExpression_to_yojson)(x.filterExpression) )(
      "ProjectionExpression"
      option_to_yojson(projectionExpression_to_yojson)(x.projectionExpression)
      )( "ReturnConsumedCapacity"
      option_to_yojson(returnConsumedCapacity_to_yojson)(x.returnConsumedCapacity)
      )( "ExclusiveStartKey"
      option_to_yojson(key_to_yojson)(x.exclusiveStartKey) )(
      "ScanIndexForward"
      option_to_yojson(booleanObject_to_yojson)(x.scanIndexForward) )(
      "ConditionalOperator"
      option_to_yojson(conditionalOperator_to_yojson)(x.conditionalOperator)
      )( "QueryFilter"
      option_to_yojson(filterConditionMap_to_yojson)(x.queryFilter) )(
      "KeyConditions"
      option_to_yojson(keyConditions_to_yojson)(x.keyConditions) )(
      "ConsistentRead"
      option_to_yojson(consistentRead_to_yojson)(x.consistentRead) )( "Limit"
      option_to_yojson(positiveIntegerObject_to_yojson)(x.limit) )(
      "AttributesToGet"
      option_to_yojson(attributeNameList_to_yojson)(x.attributesToGet) )(
      "Select" option_to_yojson(select_to_yojson)(x.select) )( "IndexName"
      option_to_yojson(indexName_to_yojson)(x.indexName) )( "TableName"
      Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let putItemOutput_to_yojson =
  (x:putItemOutput)=>assoc_to_yojson([
    ( "ItemCollectionMetrics"
      option_to_yojson(itemCollectionMetrics_to_yojson)(x.itemCollectionMetrics)
      )( "ConsumedCapacity"
      option_to_yojson(consumedCapacity_to_yojson)(x.consumedCapacity) )(
      "Attributes" option_to_yojson(attributeMap_to_yojson)(x.attributes) )])
    ;
  
  let putItemInput_to_yojson =
  (x:putItemInput)=>assoc_to_yojson([
    ( "ExpressionAttributeValues"
      option_to_yojson(expressionAttributeValueMap_to_yojson)(x.expressionAttributeValues)
      )( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "ConditionExpression"
      option_to_yojson(conditionExpression_to_yojson)(x.conditionExpression)
      )( "ConditionalOperator"
      option_to_yojson(conditionalOperator_to_yojson)(x.conditionalOperator)
      )( "ReturnItemCollectionMetrics"
      option_to_yojson(returnItemCollectionMetrics_to_yojson)(x.returnItemCollectionMetrics)
      )( "ReturnConsumedCapacity"
      option_to_yojson(returnConsumedCapacity_to_yojson)(x.returnConsumedCapacity)
      )( "ReturnValues"
      option_to_yojson(returnValue_to_yojson)(x.returnValues) )( "Expected"
      option_to_yojson(expectedAttributeMap_to_yojson)(x.expected) )( "Item"
      Some(putItemInputAttributeMap_to_yojson(x.item)) )( "TableName"
      Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let preparedStatementParameters_to_yojson =
  list_to_yojson( attributeValue_to_yojson );
  
  let partiQLStatement_to_yojson = string_to_yojson;
  
  let partiQLNextToken_to_yojson = string_to_yojson;
  
  let batchStatementErrorCodeEnum_to_yojson =
  fun
    | ConditionalCheckFailed => "ConditionalCheckFailed"
| ItemCollectionSizeLimitExceeded => "ItemCollectionSizeLimitExceeded"
| RequestLimitExceeded => "RequestLimitExceeded"
| ValidationError => "ValidationError"
| ProvisionedThroughputExceeded => "ProvisionedThroughputExceeded"
| TransactionConflict => "TransactionConflict"
| ThrottlingError => "ThrottlingError"
| InternalServerError => "InternalServerError"
| ResourceNotFound => "ResourceNotFound"
| AccessDenied => "AccessDenied"
| DuplicateItem => "DuplicateItem"
    ;
  
  let batchStatementError_to_yojson =
  (x:batchStatementError)=>assoc_to_yojson([
    ( "Message" option_to_yojson(string_to_yojson)(x.message) )( "Code"
      option_to_yojson(batchStatementErrorCodeEnum_to_yojson)(x.code) )])
    ;
  
  let batchStatementResponse_to_yojson =
  (x:batchStatementResponse)=>assoc_to_yojson([
    ( "Item" option_to_yojson(attributeMap_to_yojson)(x.item) )( "TableName"
      option_to_yojson(tableName_to_yojson)(x.tableName) )( "Error"
      option_to_yojson(batchStatementError_to_yojson)(x.error) )])
    ;
  
  let partiQLBatchResponse_to_yojson =
  list_to_yojson( batchStatementResponse_to_yojson );
  
  let batchStatementRequest_to_yojson =
  (x:batchStatementRequest)=>assoc_to_yojson([
    ( "ConsistentRead"
      option_to_yojson(consistentRead_to_yojson)(x.consistentRead) )(
      "Parameters"
      option_to_yojson(preparedStatementParameters_to_yojson)(x.parameters)
      )( "Statement" Some(partiQLStatement_to_yojson(x.statement)) )])
    ;
  
  let partiQLBatchRequest_to_yojson =
  list_to_yojson( batchStatementRequest_to_yojson );
  
  let parameterizedStatement_to_yojson =
  (x:parameterizedStatement)=>assoc_to_yojson([
    ( "Parameters"
      option_to_yojson(preparedStatementParameters_to_yojson)(x.parameters)
      )( "Statement" Some(partiQLStatement_to_yojson(x.statement)) )])
    ;
  
  let parameterizedStatements_to_yojson =
  list_to_yojson( parameterizedStatement_to_yojson );
  
  let nextTokenString_to_yojson = string_to_yojson;
  
  let listTagsOfResourceOutput_to_yojson =
  (x:listTagsOfResourceOutput)=>assoc_to_yojson([
    ( "NextToken" option_to_yojson(nextTokenString_to_yojson)(x.nextToken) )(
      "Tags" option_to_yojson(tagList_to_yojson)(x.tags) )])
    ;
  
  let listTagsOfResourceInput_to_yojson =
  (x:listTagsOfResourceInput)=>assoc_to_yojson([
    ( "NextToken" option_to_yojson(nextTokenString_to_yojson)(x.nextToken) )(
      "ResourceArn" Some(resourceArnString_to_yojson(x.resourceArn)) )])
    ;
  
  let listTablesOutput_to_yojson =
  (x:listTablesOutput)=>assoc_to_yojson([
    ( "LastEvaluatedTableName"
      option_to_yojson(tableName_to_yojson)(x.lastEvaluatedTableName) )(
      "TableNames" option_to_yojson(tableNameList_to_yojson)(x.tableNames) )])
    ;
  
  let listTablesInputLimit_to_yojson = int_to_yojson;
  
  let listTablesInput_to_yojson =
  (x:listTablesInput)=>assoc_to_yojson([
    ( "Limit" option_to_yojson(listTablesInputLimit_to_yojson)(x.limit) )(
      "ExclusiveStartTableName"
      option_to_yojson(tableName_to_yojson)(x.exclusiveStartTableName) )])
    ;
  
  let globalTable_to_yojson =
  (x:globalTable)=>assoc_to_yojson([
    ( "ReplicationGroup"
      option_to_yojson(replicaList_to_yojson)(x.replicationGroup) )(
      "GlobalTableName"
      option_to_yojson(tableName_to_yojson)(x.globalTableName) )])
    ;
  
  let globalTableList_to_yojson = list_to_yojson( globalTable_to_yojson );
  
  let listGlobalTablesOutput_to_yojson =
  (x:listGlobalTablesOutput)=>assoc_to_yojson([
    ( "LastEvaluatedGlobalTableName"
      option_to_yojson(tableName_to_yojson)(x.lastEvaluatedGlobalTableName)
      )( "GlobalTables"
      option_to_yojson(globalTableList_to_yojson)(x.globalTables) )])
    ;
  
  let listGlobalTablesInput_to_yojson =
  (x:listGlobalTablesInput)=>assoc_to_yojson([
    ( "RegionName" option_to_yojson(regionName_to_yojson)(x.regionName) )(
      "Limit" option_to_yojson(positiveIntegerObject_to_yojson)(x.limit) )(
      "ExclusiveStartGlobalTableName"
      option_to_yojson(tableName_to_yojson)(x.exclusiveStartGlobalTableName)
      )])
    ;
  
  let exportArn_to_yojson = string_to_yojson;
  
  let exportStatus_to_yojson =
  fun
    | IN_PROGRESS => "IN_PROGRESS"
| COMPLETED => "COMPLETED"
| FAILED => "FAILED"
    ;
  
  let exportSummary_to_yojson =
  (x:exportSummary)=>assoc_to_yojson([
    ( "ExportStatus" option_to_yojson(exportStatus_to_yojson)(x.exportStatus)
      )( "ExportArn" option_to_yojson(exportArn_to_yojson)(x.exportArn) )])
    ;
  
  let exportSummaries_to_yojson =
  list_to_yojson( exportSummary_to_yojson );
  
  let exportNextToken_to_yojson = string_to_yojson;
  
  let listExportsOutput_to_yojson =
  (x:listExportsOutput)=>assoc_to_yojson([
    ( "NextToken" option_to_yojson(exportNextToken_to_yojson)(x.nextToken) )(
      "ExportSummaries"
      option_to_yojson(exportSummaries_to_yojson)(x.exportSummaries) )])
    ;
  
  let listExportsMaxLimit_to_yojson = int_to_yojson;
  
  let listExportsInput_to_yojson =
  (x:listExportsInput)=>assoc_to_yojson([
    ( "NextToken" option_to_yojson(exportNextToken_to_yojson)(x.nextToken) )(
      "MaxResults"
      option_to_yojson(listExportsMaxLimit_to_yojson)(x.maxResults) )(
      "TableArn" option_to_yojson(tableArn_to_yojson)(x.tableArn) )])
    ;
  
  let contributorInsightsSummary_to_yojson =
  (x:contributorInsightsSummary)=>assoc_to_yojson([
    ( "ContributorInsightsStatus"
      option_to_yojson(contributorInsightsStatus_to_yojson)(x.contributorInsightsStatus)
      )( "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )(
      "TableName" option_to_yojson(tableName_to_yojson)(x.tableName) )])
    ;
  
  let contributorInsightsSummaries_to_yojson =
  list_to_yojson( contributorInsightsSummary_to_yojson );
  
  let listContributorInsightsOutput_to_yojson =
  (x:listContributorInsightsOutput)=>assoc_to_yojson([
    ( "NextToken" option_to_yojson(nextTokenString_to_yojson)(x.nextToken) )(
      "ContributorInsightsSummaries"
      option_to_yojson(contributorInsightsSummaries_to_yojson)(x.contributorInsightsSummaries)
      )])
    ;
  
  let listContributorInsightsLimit_to_yojson = int_to_yojson;
  
  let listContributorInsightsInput_to_yojson =
  (x:listContributorInsightsInput)=>assoc_to_yojson([
    ( "MaxResults"
      option_to_yojson(listContributorInsightsLimit_to_yojson)(x.maxResults)
      )( "NextToken" option_to_yojson(nextTokenString_to_yojson)(x.nextToken)
      )( "TableName" option_to_yojson(tableName_to_yojson)(x.tableName) )])
    ;
  
  let backupName_to_yojson = string_to_yojson;
  
  let backupCreationDateTime_to_yojson = timestamp_to_yojson;
  
  let backupStatus_to_yojson =
  fun
    | CREATING => "CREATING"
| DELETED => "DELETED"
| AVAILABLE => "AVAILABLE"
    ;
  
  let backupType_to_yojson =
  fun
    | USER => "USER"
| SYSTEM => "SYSTEM"
| AWS_BACKUP => "AWS_BACKUP"
    ;
  
  let backupSizeBytes_to_yojson = int_to_yojson;
  
  let backupSummary_to_yojson =
  (x:backupSummary)=>assoc_to_yojson([
    ( "BackupSizeBytes"
      option_to_yojson(backupSizeBytes_to_yojson)(x.backupSizeBytes) )(
      "BackupType" option_to_yojson(backupType_to_yojson)(x.backupType) )(
      "BackupStatus" option_to_yojson(backupStatus_to_yojson)(x.backupStatus)
      )( "BackupExpiryDateTime"
      option_to_yojson(date_to_yojson)(x.backupExpiryDateTime) )(
      "BackupCreationDateTime"
      option_to_yojson(backupCreationDateTime_to_yojson)(x.backupCreationDateTime)
      )( "BackupName" option_to_yojson(backupName_to_yojson)(x.backupName) )(
      "BackupArn" option_to_yojson(backupArn_to_yojson)(x.backupArn) )(
      "TableArn" option_to_yojson(tableArn_to_yojson)(x.tableArn) )(
      "TableId" option_to_yojson(tableId_to_yojson)(x.tableId) )( "TableName"
      option_to_yojson(tableName_to_yojson)(x.tableName) )])
    ;
  
  let backupSummaries_to_yojson =
  list_to_yojson( backupSummary_to_yojson );
  
  let listBackupsOutput_to_yojson =
  (x:listBackupsOutput)=>assoc_to_yojson([
    ( "LastEvaluatedBackupArn"
      option_to_yojson(backupArn_to_yojson)(x.lastEvaluatedBackupArn) )(
      "BackupSummaries"
      option_to_yojson(backupSummaries_to_yojson)(x.backupSummaries) )])
    ;
  
  let backupsInputLimit_to_yojson = int_to_yojson;
  
  let backupTypeFilter_to_yojson =
  fun
    | USER => "USER"
| SYSTEM => "SYSTEM"
| AWS_BACKUP => "AWS_BACKUP"
| ALL => "ALL"
    ;
  
  let listBackupsInput_to_yojson =
  (x:listBackupsInput)=>assoc_to_yojson([
    ( "BackupType" option_to_yojson(backupTypeFilter_to_yojson)(x.backupType)
      )( "ExclusiveStartBackupArn"
      option_to_yojson(backupArn_to_yojson)(x.exclusiveStartBackupArn) )(
      "TimeRangeUpperBound"
      option_to_yojson(timeRangeUpperBound_to_yojson)(x.timeRangeUpperBound)
      )( "TimeRangeLowerBound"
      option_to_yojson(timeRangeLowerBound_to_yojson)(x.timeRangeLowerBound)
      )( "Limit" option_to_yojson(backupsInputLimit_to_yojson)(x.limit) )(
      "TableName" option_to_yojson(tableName_to_yojson)(x.tableName) )])
    ;
  
  let lastUpdateDateTime_to_yojson = timestamp_to_yojson;
  
  let destinationStatus_to_yojson =
  fun
    | ENABLING => "ENABLING"
| ACTIVE => "ACTIVE"
| DISABLING => "DISABLING"
| DISABLED => "DISABLED"
| ENABLE_FAILED => "ENABLE_FAILED"
    ;
  
  let kinesisStreamingDestinationOutput_to_yojson =
  (x:kinesisStreamingDestinationOutput)=>assoc_to_yojson([
    ( "DestinationStatus"
      option_to_yojson(destinationStatus_to_yojson)(x.destinationStatus) )(
      "StreamArn" option_to_yojson(streamArn_to_yojson)(x.streamArn) )(
      "TableName" option_to_yojson(tableName_to_yojson)(x.tableName) )])
    ;
  
  let kinesisStreamingDestinationInput_to_yojson =
  (x:kinesisStreamingDestinationInput)=>assoc_to_yojson([
    ( "StreamArn" Some(streamArn_to_yojson(x.streamArn)) )( "TableName"
      Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let kinesisDataStreamDestination_to_yojson =
  (x:kinesisDataStreamDestination)=>assoc_to_yojson([
    ( "DestinationStatusDescription"
      option_to_yojson(string_to_yojson)(x.destinationStatusDescription) )(
      "DestinationStatus"
      option_to_yojson(destinationStatus_to_yojson)(x.destinationStatus) )(
      "StreamArn" option_to_yojson(streamArn_to_yojson)(x.streamArn) )])
    ;
  
  let kinesisDataStreamDestinations_to_yojson =
  list_to_yojson( kinesisDataStreamDestination_to_yojson );
  
  let keyList_to_yojson = list_to_yojson( key_to_yojson );
  
  let keysAndAttributes_to_yojson =
  (x:keysAndAttributes)=>assoc_to_yojson([
    ( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "ProjectionExpression"
      option_to_yojson(projectionExpression_to_yojson)(x.projectionExpression)
      )( "ConsistentRead"
      option_to_yojson(consistentRead_to_yojson)(x.consistentRead) )(
      "AttributesToGet"
      option_to_yojson(attributeNameList_to_yojson)(x.attributesToGet) )(
      "Keys" Some(keyList_to_yojson(x.keys)) )])
    ;
  
  let invalidExportTimeException_to_yojson =
  (x:invalidExportTimeException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let globalTableAlreadyExistsException_to_yojson =
  (x:globalTableAlreadyExistsException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let getItemOutput_to_yojson =
  (x:getItemOutput)=>assoc_to_yojson([
    ( "ConsumedCapacity"
      option_to_yojson(consumedCapacity_to_yojson)(x.consumedCapacity) )(
      "Item" option_to_yojson(attributeMap_to_yojson)(x.item) )])
    ;
  
  let getItemInput_to_yojson =
  (x:getItemInput)=>assoc_to_yojson([
    ( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "ProjectionExpression"
      option_to_yojson(projectionExpression_to_yojson)(x.projectionExpression)
      )( "ReturnConsumedCapacity"
      option_to_yojson(returnConsumedCapacity_to_yojson)(x.returnConsumedCapacity)
      )( "ConsistentRead"
      option_to_yojson(consistentRead_to_yojson)(x.consistentRead) )(
      "AttributesToGet"
      option_to_yojson(attributeNameList_to_yojson)(x.attributesToGet) )(
      "Key" Some(key_to_yojson(x.key)) )( "TableName"
      Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let failureMessage_to_yojson = string_to_yojson;
  
  let exceptionName_to_yojson = string_to_yojson;
  
  let exceptionDescription_to_yojson = string_to_yojson;
  
  let failureException_to_yojson =
  (x:failureException)=>assoc_to_yojson([
    ( "ExceptionDescription"
      option_to_yojson(exceptionDescription_to_yojson)(x.exceptionDescription)
      )( "ExceptionName"
      option_to_yojson(exceptionName_to_yojson)(x.exceptionName) )])
    ;
  
  let failureCode_to_yojson = string_to_yojson;
  
  let exportTime_to_yojson = timestamp_to_yojson;
  
  let exportStartTime_to_yojson = timestamp_to_yojson;
  
  let exportEndTime_to_yojson = timestamp_to_yojson;
  
  let exportManifest_to_yojson = string_to_yojson;
  
  let clientToken_to_yojson = string_to_yojson;
  
  let exportFormat_to_yojson =
  fun
    | DYNAMODB_JSON => "DYNAMODB_JSON"
| ION => "ION"
    ;
  
  let billedSizeBytes_to_yojson = int_to_yojson;
  
  let exportDescription_to_yojson =
  (x:exportDescription)=>assoc_to_yojson([
    ( "ItemCount" option_to_yojson(itemCount_to_yojson)(x.itemCount) )(
      "BilledSizeBytes"
      option_to_yojson(billedSizeBytes_to_yojson)(x.billedSizeBytes) )(
      "ExportFormat" option_to_yojson(exportFormat_to_yojson)(x.exportFormat)
      )( "FailureMessage"
      option_to_yojson(failureMessage_to_yojson)(x.failureMessage) )(
      "FailureCode" option_to_yojson(failureCode_to_yojson)(x.failureCode) )(
      "S3SseKmsKeyId"
      option_to_yojson(s3SseKmsKeyId_to_yojson)(x.s3SseKmsKeyId) )(
      "S3SseAlgorithm"
      option_to_yojson(s3SseAlgorithm_to_yojson)(x.s3SseAlgorithm) )(
      "S3Prefix" option_to_yojson(s3Prefix_to_yojson)(x.s3Prefix) )(
      "S3BucketOwner"
      option_to_yojson(s3BucketOwner_to_yojson)(x.s3BucketOwner) )(
      "S3Bucket" option_to_yojson(s3Bucket_to_yojson)(x.s3Bucket) )(
      "ClientToken" option_to_yojson(clientToken_to_yojson)(x.clientToken) )(
      "ExportTime" option_to_yojson(exportTime_to_yojson)(x.exportTime) )(
      "TableId" option_to_yojson(tableId_to_yojson)(x.tableId) )( "TableArn"
      option_to_yojson(tableArn_to_yojson)(x.tableArn) )( "ExportManifest"
      option_to_yojson(exportManifest_to_yojson)(x.exportManifest) )(
      "EndTime" option_to_yojson(exportEndTime_to_yojson)(x.endTime) )(
      "StartTime" option_to_yojson(exportStartTime_to_yojson)(x.startTime) )(
      "ExportStatus" option_to_yojson(exportStatus_to_yojson)(x.exportStatus)
      )( "ExportArn" option_to_yojson(exportArn_to_yojson)(x.exportArn) )])
    ;
  
  let exportTableToPointInTimeOutput_to_yojson =
  (x:exportTableToPointInTimeOutput)=>assoc_to_yojson([
    ( "ExportDescription"
      option_to_yojson(exportDescription_to_yojson)(x.exportDescription) )])
    ;
  
  let exportTableToPointInTimeInput_to_yojson =
  (x:exportTableToPointInTimeInput)=>assoc_to_yojson([
    ( "ExportFormat" option_to_yojson(exportFormat_to_yojson)(x.exportFormat)
      )( "S3SseKmsKeyId"
      option_to_yojson(s3SseKmsKeyId_to_yojson)(x.s3SseKmsKeyId) )(
      "S3SseAlgorithm"
      option_to_yojson(s3SseAlgorithm_to_yojson)(x.s3SseAlgorithm) )(
      "S3Prefix" option_to_yojson(s3Prefix_to_yojson)(x.s3Prefix) )(
      "S3BucketOwner"
      option_to_yojson(s3BucketOwner_to_yojson)(x.s3BucketOwner) )(
      "S3Bucket" Some(s3Bucket_to_yojson(x.s3Bucket)) )( "ClientToken"
      option_to_yojson(clientToken_to_yojson)(x.clientToken) )( "ExportTime"
      option_to_yojson(exportTime_to_yojson)(x.exportTime) )( "TableArn"
      Some(tableArn_to_yojson(x.tableArn)) )])
    ;
  
  let exportConflictException_to_yojson =
  (x:exportConflictException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let exportNotFoundException_to_yojson =
  (x:exportNotFoundException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let executeTransactionOutput_to_yojson =
  (x:executeTransactionOutput)=>assoc_to_yojson([
    ( "Responses" option_to_yojson(itemResponseList_to_yojson)(x.responses) )])
    ;
  
  let executeTransactionInput_to_yojson =
  (x:executeTransactionInput)=>assoc_to_yojson([
    ( "ClientRequestToken"
      option_to_yojson(clientRequestToken_to_yojson)(x.clientRequestToken) )(
      "TransactStatements"
      Some(parameterizedStatements_to_yojson(x.transactStatements)) )])
    ;
  
  let executeStatementOutput_to_yojson =
  (x:executeStatementOutput)=>assoc_to_yojson([
    ( "NextToken" option_to_yojson(partiQLNextToken_to_yojson)(x.nextToken)
      )( "Items" option_to_yojson(itemList_to_yojson)(x.items) )])
    ;
  
  let executeStatementInput_to_yojson =
  (x:executeStatementInput)=>assoc_to_yojson([
    ( "NextToken" option_to_yojson(partiQLNextToken_to_yojson)(x.nextToken)
      )( "ConsistentRead"
      option_to_yojson(consistentRead_to_yojson)(x.consistentRead) )(
      "Parameters"
      option_to_yojson(preparedStatementParameters_to_yojson)(x.parameters)
      )( "Statement" Some(partiQLStatement_to_yojson(x.statement)) )])
    ;
  
  let duplicateItemException_to_yojson =
  (x:duplicateItemException)=>assoc_to_yojson([
    ( "message" option_to_yojson(errorMessage_to_yojson)(x.message) )]);
  
  let endpoint_to_yojson =
  (x:endpoint)=>assoc_to_yojson([
    ( "CachePeriodInMinutes" Some(long_to_yojson(x.cachePeriodInMinutes)) )(
      "Address" Some(string_to_yojson(x.address)) )])
    ;
  
  let endpoints_to_yojson = list_to_yojson( endpoint_to_yojson );
  
  let describeTimeToLiveOutput_to_yojson =
  (x:describeTimeToLiveOutput)=>assoc_to_yojson([
    ( "TimeToLiveDescription"
      option_to_yojson(timeToLiveDescription_to_yojson)(x.timeToLiveDescription)
      )])
    ;
  
  let describeTimeToLiveInput_to_yojson =
  (x:describeTimeToLiveInput)=>assoc_to_yojson([
    ( "TableName" Some(tableName_to_yojson(x.tableName)) )]);
  
  let describeTableReplicaAutoScalingOutput_to_yojson =
  (x:describeTableReplicaAutoScalingOutput)=>assoc_to_yojson([
    ( "TableAutoScalingDescription"
      option_to_yojson(tableAutoScalingDescription_to_yojson)(x.tableAutoScalingDescription)
      )])
    ;
  
  let describeTableReplicaAutoScalingInput_to_yojson =
  (x:describeTableReplicaAutoScalingInput)=>assoc_to_yojson([
    ( "TableName" Some(tableName_to_yojson(x.tableName)) )]);
  
  let describeTableOutput_to_yojson =
  (x:describeTableOutput)=>assoc_to_yojson([
    ( "Table" option_to_yojson(tableDescription_to_yojson)(x.table) )]);
  
  let describeTableInput_to_yojson =
  (x:describeTableInput)=>assoc_to_yojson([
    ( "TableName" Some(tableName_to_yojson(x.tableName)) )]);
  
  let describeLimitsOutput_to_yojson =
  (x:describeLimitsOutput)=>assoc_to_yojson([
    ( "TableMaxWriteCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.tableMaxWriteCapacityUnits)
      )( "TableMaxReadCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.tableMaxReadCapacityUnits)
      )( "AccountMaxWriteCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.accountMaxWriteCapacityUnits)
      )( "AccountMaxReadCapacityUnits"
      option_to_yojson(positiveLongObject_to_yojson)(x.accountMaxReadCapacityUnits)
      )])
    ;
  
  let describeLimitsInput_to_yojson =
  (x:describeLimitsInput)=>assoc_to_yojson([]);
  
  let describeKinesisStreamingDestinationOutput_to_yojson =
  (x:describeKinesisStreamingDestinationOutput)=>assoc_to_yojson([
    ( "KinesisDataStreamDestinations"
      option_to_yojson(kinesisDataStreamDestinations_to_yojson)(x.kinesisDataStreamDestinations)
      )( "TableName" option_to_yojson(tableName_to_yojson)(x.tableName) )])
    ;
  
  let describeKinesisStreamingDestinationInput_to_yojson =
  (x:describeKinesisStreamingDestinationInput)=>assoc_to_yojson([
    ( "TableName" Some(tableName_to_yojson(x.tableName)) )]);
  
  let describeGlobalTableSettingsOutput_to_yojson =
  (x:describeGlobalTableSettingsOutput)=>assoc_to_yojson([
    ( "ReplicaSettings"
      option_to_yojson(replicaSettingsDescriptionList_to_yojson)(x.replicaSettings)
      )( "GlobalTableName"
      option_to_yojson(tableName_to_yojson)(x.globalTableName) )])
    ;
  
  let describeGlobalTableSettingsInput_to_yojson =
  (x:describeGlobalTableSettingsInput)=>assoc_to_yojson([
    ( "GlobalTableName" Some(tableName_to_yojson(x.globalTableName)) )]);
  
  let describeGlobalTableOutput_to_yojson =
  (x:describeGlobalTableOutput)=>assoc_to_yojson([
    ( "GlobalTableDescription"
      option_to_yojson(globalTableDescription_to_yojson)(x.globalTableDescription)
      )])
    ;
  
  let describeGlobalTableInput_to_yojson =
  (x:describeGlobalTableInput)=>assoc_to_yojson([
    ( "GlobalTableName" Some(tableName_to_yojson(x.globalTableName)) )]);
  
  let describeExportOutput_to_yojson =
  (x:describeExportOutput)=>assoc_to_yojson([
    ( "ExportDescription"
      option_to_yojson(exportDescription_to_yojson)(x.exportDescription) )])
    ;
  
  let describeExportInput_to_yojson =
  (x:describeExportInput)=>assoc_to_yojson([
    ( "ExportArn" Some(exportArn_to_yojson(x.exportArn)) )]);
  
  let describeEndpointsResponse_to_yojson =
  (x:describeEndpointsResponse)=>assoc_to_yojson([
    ( "Endpoints" Some(endpoints_to_yojson(x.endpoints)) )]);
  
  let describeEndpointsRequest_to_yojson =
  (x:describeEndpointsRequest)=>assoc_to_yojson([]);
  
  let contributorInsightsRule_to_yojson = string_to_yojson;
  
  let contributorInsightsRuleList_to_yojson =
  list_to_yojson( contributorInsightsRule_to_yojson );
  
  let describeContributorInsightsOutput_to_yojson =
  (x:describeContributorInsightsOutput)=>assoc_to_yojson([
    ( "FailureException"
      option_to_yojson(failureException_to_yojson)(x.failureException) )(
      "LastUpdateDateTime"
      option_to_yojson(lastUpdateDateTime_to_yojson)(x.lastUpdateDateTime) )(
      "ContributorInsightsStatus"
      option_to_yojson(contributorInsightsStatus_to_yojson)(x.contributorInsightsStatus)
      )( "ContributorInsightsRuleList"
      option_to_yojson(contributorInsightsRuleList_to_yojson)(x.contributorInsightsRuleList)
      )( "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )(
      "TableName" option_to_yojson(tableName_to_yojson)(x.tableName) )])
    ;
  
  let describeContributorInsightsInput_to_yojson =
  (x:describeContributorInsightsInput)=>assoc_to_yojson([
    ( "IndexName" option_to_yojson(indexName_to_yojson)(x.indexName) )(
      "TableName" Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let describeContinuousBackupsOutput_to_yojson =
  (x:describeContinuousBackupsOutput)=>assoc_to_yojson([
    ( "ContinuousBackupsDescription"
      option_to_yojson(continuousBackupsDescription_to_yojson)(x.continuousBackupsDescription)
      )])
    ;
  
  let describeContinuousBackupsInput_to_yojson =
  (x:describeContinuousBackupsInput)=>assoc_to_yojson([
    ( "TableName" Some(tableName_to_yojson(x.tableName)) )]);
  
  let backupDetails_to_yojson =
  (x:backupDetails)=>assoc_to_yojson([
    ( "BackupExpiryDateTime"
      option_to_yojson(date_to_yojson)(x.backupExpiryDateTime) )(
      "BackupCreationDateTime"
      Some(backupCreationDateTime_to_yojson(x.backupCreationDateTime)) )(
      "BackupType" Some(backupType_to_yojson(x.backupType)) )( "BackupStatus"
      Some(backupStatus_to_yojson(x.backupStatus)) )( "BackupSizeBytes"
      option_to_yojson(backupSizeBytes_to_yojson)(x.backupSizeBytes) )(
      "BackupName" Some(backupName_to_yojson(x.backupName)) )( "BackupArn"
      Some(backupArn_to_yojson(x.backupArn)) )])
    ;
  
  let backupDescription_to_yojson =
  (x:backupDescription)=>assoc_to_yojson([
    ( "SourceTableFeatureDetails"
      option_to_yojson(sourceTableFeatureDetails_to_yojson)(x.sourceTableFeatureDetails)
      )( "SourceTableDetails"
      option_to_yojson(sourceTableDetails_to_yojson)(x.sourceTableDetails) )(
      "BackupDetails"
      option_to_yojson(backupDetails_to_yojson)(x.backupDetails) )])
    ;
  
  let describeBackupOutput_to_yojson =
  (x:describeBackupOutput)=>assoc_to_yojson([
    ( "BackupDescription"
      option_to_yojson(backupDescription_to_yojson)(x.backupDescription) )])
    ;
  
  let describeBackupInput_to_yojson =
  (x:describeBackupInput)=>assoc_to_yojson([
    ( "BackupArn" Some(backupArn_to_yojson(x.backupArn)) )]);
  
  let deleteTableOutput_to_yojson =
  (x:deleteTableOutput)=>assoc_to_yojson([
    ( "TableDescription"
      option_to_yojson(tableDescription_to_yojson)(x.tableDescription) )])
    ;
  
  let deleteTableInput_to_yojson =
  (x:deleteTableInput)=>assoc_to_yojson([
    ( "TableName" Some(tableName_to_yojson(x.tableName)) )]);
  
  let deleteItemOutput_to_yojson =
  (x:deleteItemOutput)=>assoc_to_yojson([
    ( "ItemCollectionMetrics"
      option_to_yojson(itemCollectionMetrics_to_yojson)(x.itemCollectionMetrics)
      )( "ConsumedCapacity"
      option_to_yojson(consumedCapacity_to_yojson)(x.consumedCapacity) )(
      "Attributes" option_to_yojson(attributeMap_to_yojson)(x.attributes) )])
    ;
  
  let deleteItemInput_to_yojson =
  (x:deleteItemInput)=>assoc_to_yojson([
    ( "ExpressionAttributeValues"
      option_to_yojson(expressionAttributeValueMap_to_yojson)(x.expressionAttributeValues)
      )( "ExpressionAttributeNames"
      option_to_yojson(expressionAttributeNameMap_to_yojson)(x.expressionAttributeNames)
      )( "ConditionExpression"
      option_to_yojson(conditionExpression_to_yojson)(x.conditionExpression)
      )( "ReturnItemCollectionMetrics"
      option_to_yojson(returnItemCollectionMetrics_to_yojson)(x.returnItemCollectionMetrics)
      )( "ReturnConsumedCapacity"
      option_to_yojson(returnConsumedCapacity_to_yojson)(x.returnConsumedCapacity)
      )( "ReturnValues"
      option_to_yojson(returnValue_to_yojson)(x.returnValues) )(
      "ConditionalOperator"
      option_to_yojson(conditionalOperator_to_yojson)(x.conditionalOperator)
      )( "Expected"
      option_to_yojson(expectedAttributeMap_to_yojson)(x.expected) )( "Key"
      Some(key_to_yojson(x.key)) )( "TableName"
      Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let deleteBackupOutput_to_yojson =
  (x:deleteBackupOutput)=>assoc_to_yojson([
    ( "BackupDescription"
      option_to_yojson(backupDescription_to_yojson)(x.backupDescription) )])
    ;
  
  let deleteBackupInput_to_yojson =
  (x:deleteBackupInput)=>assoc_to_yojson([
    ( "BackupArn" Some(backupArn_to_yojson(x.backupArn)) )]);
  
  let createTableOutput_to_yojson =
  (x:createTableOutput)=>assoc_to_yojson([
    ( "TableDescription"
      option_to_yojson(tableDescription_to_yojson)(x.tableDescription) )])
    ;
  
  let createTableInput_to_yojson =
  (x:createTableInput)=>assoc_to_yojson([
    ( "Tags" option_to_yojson(tagList_to_yojson)(x.tags) )(
      "SSESpecification"
      option_to_yojson(ssespecification_to_yojson)(x.ssespecification) )(
      "StreamSpecification"
      option_to_yojson(streamSpecification_to_yojson)(x.streamSpecification)
      )( "ProvisionedThroughput"
      option_to_yojson(provisionedThroughput_to_yojson)(x.provisionedThroughput)
      )( "BillingMode" option_to_yojson(billingMode_to_yojson)(x.billingMode)
      )( "GlobalSecondaryIndexes"
      option_to_yojson(globalSecondaryIndexList_to_yojson)(x.globalSecondaryIndexes)
      )( "LocalSecondaryIndexes"
      option_to_yojson(localSecondaryIndexList_to_yojson)(x.localSecondaryIndexes)
      )( "KeySchema" Some(keySchema_to_yojson(x.keySchema)) )( "TableName"
      Some(tableName_to_yojson(x.tableName)) )( "AttributeDefinitions"
      Some(attributeDefinitions_to_yojson(x.attributeDefinitions)) )])
    ;
  
  let createGlobalTableOutput_to_yojson =
  (x:createGlobalTableOutput)=>assoc_to_yojson([
    ( "GlobalTableDescription"
      option_to_yojson(globalTableDescription_to_yojson)(x.globalTableDescription)
      )])
    ;
  
  let createGlobalTableInput_to_yojson =
  (x:createGlobalTableInput)=>assoc_to_yojson([
    ( "ReplicationGroup" Some(replicaList_to_yojson(x.replicationGroup)) )(
      "GlobalTableName" Some(tableName_to_yojson(x.globalTableName)) )])
    ;
  
  let createBackupOutput_to_yojson =
  (x:createBackupOutput)=>assoc_to_yojson([
    ( "BackupDetails"
      option_to_yojson(backupDetails_to_yojson)(x.backupDetails) )])
    ;
  
  let createBackupInput_to_yojson =
  (x:createBackupInput)=>assoc_to_yojson([
    ( "BackupName" Some(backupName_to_yojson(x.backupName)) )( "TableName"
      Some(tableName_to_yojson(x.tableName)) )])
    ;
  
  let batchWriteItemRequestMap_to_yojson = map_to_yojson;
  
  let batchWriteItemOutput_to_yojson =
  (x:batchWriteItemOutput)=>assoc_to_yojson([
    ( "ConsumedCapacity"
      option_to_yojson(consumedCapacityMultiple_to_yojson)(x.consumedCapacity)
      )( "ItemCollectionMetrics"
      option_to_yojson(itemCollectionMetricsPerTable_to_yojson)(x.itemCollectionMetrics)
      )( "UnprocessedItems"
      option_to_yojson(batchWriteItemRequestMap_to_yojson)(x.unprocessedItems)
      )])
    ;
  
  let batchWriteItemInput_to_yojson =
  (x:batchWriteItemInput)=>assoc_to_yojson([
    ( "ReturnItemCollectionMetrics"
      option_to_yojson(returnItemCollectionMetrics_to_yojson)(x.returnItemCollectionMetrics)
      )( "ReturnConsumedCapacity"
      option_to_yojson(returnConsumedCapacity_to_yojson)(x.returnConsumedCapacity)
      )( "RequestItems"
      Some(batchWriteItemRequestMap_to_yojson(x.requestItems)) )])
    ;
  
  let batchGetResponseMap_to_yojson = map_to_yojson;
  
  let batchGetRequestMap_to_yojson = map_to_yojson;
  
  let batchGetItemOutput_to_yojson =
  (x:batchGetItemOutput)=>assoc_to_yojson([
    ( "ConsumedCapacity"
      option_to_yojson(consumedCapacityMultiple_to_yojson)(x.consumedCapacity)
      )( "UnprocessedKeys"
      option_to_yojson(batchGetRequestMap_to_yojson)(x.unprocessedKeys) )(
      "Responses"
      option_to_yojson(batchGetResponseMap_to_yojson)(x.responses) )])
    ;
  
  let batchGetItemInput_to_yojson =
  (x:batchGetItemInput)=>assoc_to_yojson([
    ( "ReturnConsumedCapacity"
      option_to_yojson(returnConsumedCapacity_to_yojson)(x.returnConsumedCapacity)
      )( "RequestItems" Some(batchGetRequestMap_to_yojson(x.requestItems)) )])
    ;
  
  let batchExecuteStatementOutput_to_yojson =
  (x:batchExecuteStatementOutput)=>assoc_to_yojson([
    ( "Responses"
      option_to_yojson(partiQLBatchResponse_to_yojson)(x.responses) )])
    ;
  
  let batchExecuteStatementInput_to_yojson =
  (x:batchExecuteStatementInput)=>assoc_to_yojson([
    ( "Statements" Some(partiQLBatchRequest_to_yojson(x.statements)) )]);
  
  let baseString_to_yojson = string_to_yojson;
  
  let baseBoolean_to_yojson = bool_to_yojson;
  
  let baseInteger_to_yojson = int_to_yojson;
  
  let baseTimestamp_to_yojson = timestamp_to_yojson;
  
  let baseLong_to_yojson = int_to_yojson;
  
  
}


