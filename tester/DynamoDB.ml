open AwsSdkLib
let service =
  let open Aws.Service in
    {
      namespace = "dynamodb";
      endpointPrefix = "dynamodb";
      version = "2012-08-10"
    }
type stringAttributeValue = string
type numberAttributeValue = string
type binaryAttributeValue = bytes
type stringSetAttributeValue = stringAttributeValue list
type numberSetAttributeValue = numberAttributeValue list
type binarySetAttributeValue = binaryAttributeValue list
type attributeName = string
type nullAttributeValue = bool
type booleanAttributeValue = bool
type attributeValue =
  | BOOL of booleanAttributeValue 
  | NULL of nullAttributeValue 
  | L of listAttributeValue 
  | M of mapAttributeValue 
  | BS of binarySetAttributeValue 
  | NS of numberSetAttributeValue 
  | SS of stringSetAttributeValue 
  | B of binaryAttributeValue 
  | N of numberAttributeValue 
  | S of stringAttributeValue 
and listAttributeValue = attributeValue list
and mapAttributeValue = (string * attributeValue) list
type putItemInputAttributeMap = (string * attributeValue) list
type putRequest = {
  item: putItemInputAttributeMap }
type key = (string * attributeValue) list
type deleteRequest = {
  key: key }
type writeRequest =
  {
  deleteRequest: deleteRequest option ;
  putRequest: putRequest option }
type writeRequests = writeRequest list
type timeToLiveEnabled = bool
type timeToLiveAttributeName = string
type timeToLiveSpecification =
  {
  attributeName: timeToLiveAttributeName ;
  enabled: timeToLiveEnabled }
type updateTimeToLiveOutput =
  {
  timeToLiveSpecification: timeToLiveSpecification option }
type tableName = string
type updateTimeToLiveInput =
  {
  timeToLiveSpecification: timeToLiveSpecification ;
  tableName: tableName }
type errorMessage = string
exception ResourceNotFoundException of Aws.emptyErrorDetails Aws.apiError 
exception ResourceInUseException of Aws.emptyErrorDetails Aws.apiError 
exception LimitExceededException of Aws.emptyErrorDetails Aws.apiError 
type string_ = string
exception InvalidEndpointException of Aws.emptyErrorDetails Aws.apiError 
exception InternalServerError of Aws.emptyErrorDetails Aws.apiError 
type tableStatus =
  | CREATING 
  | UPDATING 
  | DELETING 
  | ACTIVE 
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS 
  | ARCHIVING 
  | ARCHIVED 
type regionName = string
type indexName = string
type indexStatus =
  | CREATING 
  | UPDATING 
  | DELETING 
  | ACTIVE 
type positiveLongObject = int
type booleanObject = bool
type autoScalingPolicyName = string
type integerObject = int
type double = float
type autoScalingTargetTrackingScalingPolicyConfigurationDescription =
  {
  targetValue: double ;
  scaleOutCooldown: integerObject option ;
  scaleInCooldown: integerObject option ;
  disableScaleIn: booleanObject option }
type autoScalingPolicyDescription =
  {
  targetTrackingScalingPolicyConfiguration:
    autoScalingTargetTrackingScalingPolicyConfigurationDescription option ;
  policyName: autoScalingPolicyName option }
type autoScalingPolicyDescriptionList = autoScalingPolicyDescription list
type autoScalingSettingsDescription =
  {
  scalingPolicies: autoScalingPolicyDescriptionList option ;
  autoScalingRoleArn: string_ option ;
  autoScalingDisabled: booleanObject option ;
  maximumUnits: positiveLongObject option ;
  minimumUnits: positiveLongObject option }
type replicaGlobalSecondaryIndexAutoScalingDescription =
  {
  provisionedWriteCapacityAutoScalingSettings:
    autoScalingSettingsDescription option ;
  provisionedReadCapacityAutoScalingSettings:
    autoScalingSettingsDescription option ;
  indexStatus: indexStatus option ;
  indexName: indexName option }
type replicaGlobalSecondaryIndexAutoScalingDescriptionList =
  replicaGlobalSecondaryIndexAutoScalingDescription list
type replicaStatus =
  | CREATING 
  | CREATION_FAILED 
  | UPDATING 
  | DELETING 
  | ACTIVE 
  | REGION_DISABLED 
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS 
type replicaAutoScalingDescription =
  {
  replicaStatus: replicaStatus option ;
  replicaProvisionedWriteCapacityAutoScalingSettings:
    autoScalingSettingsDescription option ;
  replicaProvisionedReadCapacityAutoScalingSettings:
    autoScalingSettingsDescription option ;
  globalSecondaryIndexes:
    replicaGlobalSecondaryIndexAutoScalingDescriptionList option ;
  regionName: regionName option }
type replicaAutoScalingDescriptionList = replicaAutoScalingDescription list
type tableAutoScalingDescription =
  {
  replicas: replicaAutoScalingDescriptionList option ;
  tableStatus: tableStatus option ;
  tableName: tableName option }
type updateTableReplicaAutoScalingOutput =
  {
  tableAutoScalingDescription: tableAutoScalingDescription option }
type autoScalingRoleArn = string
type autoScalingTargetTrackingScalingPolicyConfigurationUpdate =
  {
  targetValue: double ;
  scaleOutCooldown: integerObject option ;
  scaleInCooldown: integerObject option ;
  disableScaleIn: booleanObject option }
type autoScalingPolicyUpdate =
  {
  targetTrackingScalingPolicyConfiguration:
    autoScalingTargetTrackingScalingPolicyConfigurationUpdate ;
  policyName: autoScalingPolicyName option }
type autoScalingSettingsUpdate =
  {
  scalingPolicyUpdate: autoScalingPolicyUpdate option ;
  autoScalingRoleArn: autoScalingRoleArn option ;
  autoScalingDisabled: booleanObject option ;
  maximumUnits: positiveLongObject option ;
  minimumUnits: positiveLongObject option }
type globalSecondaryIndexAutoScalingUpdate =
  {
  provisionedWriteCapacityAutoScalingUpdate: autoScalingSettingsUpdate option ;
  indexName: indexName option }
type globalSecondaryIndexAutoScalingUpdateList =
  globalSecondaryIndexAutoScalingUpdate list
type replicaGlobalSecondaryIndexAutoScalingUpdate =
  {
  provisionedReadCapacityAutoScalingUpdate: autoScalingSettingsUpdate option ;
  indexName: indexName option }
type replicaGlobalSecondaryIndexAutoScalingUpdateList =
  replicaGlobalSecondaryIndexAutoScalingUpdate list
type replicaAutoScalingUpdate =
  {
  replicaProvisionedReadCapacityAutoScalingUpdate:
    autoScalingSettingsUpdate option ;
  replicaGlobalSecondaryIndexUpdates:
    replicaGlobalSecondaryIndexAutoScalingUpdateList option ;
  regionName: regionName }
type replicaAutoScalingUpdateList = replicaAutoScalingUpdate list
type updateTableReplicaAutoScalingInput =
  {
  replicaUpdates: replicaAutoScalingUpdateList option ;
  provisionedWriteCapacityAutoScalingUpdate: autoScalingSettingsUpdate option ;
  tableName: tableName ;
  globalSecondaryIndexUpdates:
    globalSecondaryIndexAutoScalingUpdateList option }
type keySchemaAttributeName = string
type scalarAttributeType =
  | S 
  | N 
  | B 
type attributeDefinition =
  {
  attributeType: scalarAttributeType ;
  attributeName: keySchemaAttributeName }
type attributeDefinitions = attributeDefinition list
type keyType =
  | HASH 
  | RANGE 
type keySchemaElement =
  {
  keyType: keyType ;
  attributeName: keySchemaAttributeName }
type keySchema = keySchemaElement list
type date = float
type nonNegativeLongObject = int
type provisionedThroughputDescription =
  {
  writeCapacityUnits: nonNegativeLongObject option ;
  readCapacityUnits: nonNegativeLongObject option ;
  numberOfDecreasesToday: positiveLongObject option ;
  lastDecreaseDateTime: date option ;
  lastIncreaseDateTime: date option }
type long = int
type tableId = string
type billingMode =
  | PROVISIONED 
  | PAY_PER_REQUEST 
type billingModeSummary =
  {
  lastUpdateToPayPerRequestDateTime: date option ;
  billingMode: billingMode option }
type projectionType =
  | ALL 
  | KEYS_ONLY 
  | INCLUDE 
type nonKeyAttributeName = string
type nonKeyAttributeNameList = nonKeyAttributeName list
type projection =
  {
  nonKeyAttributes: nonKeyAttributeNameList option ;
  projectionType: projectionType option }
type localSecondaryIndexDescription =
  {
  indexArn: string_ option ;
  itemCount: long option ;
  indexSizeBytes: long option ;
  projection: projection option ;
  keySchema: keySchema option ;
  indexName: indexName option }
type localSecondaryIndexDescriptionList = localSecondaryIndexDescription list
type backfilling = bool
type globalSecondaryIndexDescription =
  {
  indexArn: string_ option ;
  itemCount: long option ;
  indexSizeBytes: long option ;
  provisionedThroughput: provisionedThroughputDescription option ;
  backfilling: backfilling option ;
  indexStatus: indexStatus option ;
  projection: projection option ;
  keySchema: keySchema option ;
  indexName: indexName option }
type globalSecondaryIndexDescriptionList =
  globalSecondaryIndexDescription list
type streamEnabled = bool
type streamViewType =
  | NEW_IMAGE 
  | OLD_IMAGE 
  | NEW_AND_OLD_IMAGES 
  | KEYS_ONLY 
type streamSpecification =
  {
  streamViewType: streamViewType option ;
  streamEnabled: streamEnabled }
type streamArn = string
type replicaStatusDescription = string
type replicaStatusPercentProgress = string
type kmsmasterKeyId = string
type provisionedThroughputOverride =
  {
  readCapacityUnits: positiveLongObject option }
type replicaGlobalSecondaryIndexDescription =
  {
  provisionedThroughputOverride: provisionedThroughputOverride option ;
  indexName: indexName option }
type replicaGlobalSecondaryIndexDescriptionList =
  replicaGlobalSecondaryIndexDescription list
type replicaDescription =
  {
  replicaInaccessibleDateTime: date option ;
  globalSecondaryIndexes: replicaGlobalSecondaryIndexDescriptionList option ;
  provisionedThroughputOverride: provisionedThroughputOverride option ;
  kmsmasterKeyId: kmsmasterKeyId option ;
  replicaStatusPercentProgress: replicaStatusPercentProgress option ;
  replicaStatusDescription: replicaStatusDescription option ;
  replicaStatus: replicaStatus option ;
  regionName: regionName option }
type replicaDescriptionList = replicaDescription list
type backupArn = string
type tableArn = string
type restoreInProgress = bool
type restoreSummary =
  {
  restoreInProgress: restoreInProgress ;
  restoreDateTime: date ;
  sourceTableArn: tableArn option ;
  sourceBackupArn: backupArn option }
type ssestatus =
  | ENABLING 
  | ENABLED 
  | DISABLING 
  | DISABLED 
  | UPDATING 
type ssetype =
  | AES256 
  | KMS 
type kmsmasterKeyArn = string
type ssedescription =
  {
  inaccessibleEncryptionDateTime: date option ;
  kmsmasterKeyArn: kmsmasterKeyArn option ;
  ssetype: ssetype option ;
  status: ssestatus option }
type archivalReason = string
type archivalSummary =
  {
  archivalBackupArn: backupArn option ;
  archivalReason: archivalReason option ;
  archivalDateTime: date option }
type tableDescription =
  {
  archivalSummary: archivalSummary option ;
  ssedescription: ssedescription option ;
  restoreSummary: restoreSummary option ;
  replicas: replicaDescriptionList option ;
  globalTableVersion: string_ option ;
  latestStreamArn: streamArn option ;
  latestStreamLabel: string_ option ;
  streamSpecification: streamSpecification option ;
  globalSecondaryIndexes: globalSecondaryIndexDescriptionList option ;
  localSecondaryIndexes: localSecondaryIndexDescriptionList option ;
  billingModeSummary: billingModeSummary option ;
  tableId: tableId option ;
  tableArn: string_ option ;
  itemCount: long option ;
  tableSizeBytes: long option ;
  provisionedThroughput: provisionedThroughputDescription option ;
  creationDateTime: date option ;
  tableStatus: tableStatus option ;
  keySchema: keySchema option ;
  tableName: tableName option ;
  attributeDefinitions: attributeDefinitions option }
type updateTableOutput = {
  tableDescription: tableDescription option }
type provisionedThroughput =
  {
  writeCapacityUnits: positiveLongObject ;
  readCapacityUnits: positiveLongObject }
type updateGlobalSecondaryIndexAction =
  {
  provisionedThroughput: provisionedThroughput ;
  indexName: indexName }
type createGlobalSecondaryIndexAction =
  {
  provisionedThroughput: provisionedThroughput option ;
  projection: projection ;
  keySchema: keySchema ;
  indexName: indexName }
type deleteGlobalSecondaryIndexAction = {
  indexName: indexName }
type globalSecondaryIndexUpdate =
  {
  delete: deleteGlobalSecondaryIndexAction option ;
  create: createGlobalSecondaryIndexAction option ;
  update: updateGlobalSecondaryIndexAction option }
type globalSecondaryIndexUpdateList = globalSecondaryIndexUpdate list
type sseenabled = bool
type ssespecification =
  {
  kmsmasterKeyId: kmsmasterKeyId option ;
  ssetype: ssetype option ;
  enabled: sseenabled option }
type replicaGlobalSecondaryIndex =
  {
  provisionedThroughputOverride: provisionedThroughputOverride option ;
  indexName: indexName }
type replicaGlobalSecondaryIndexList = replicaGlobalSecondaryIndex list
type createReplicationGroupMemberAction =
  {
  globalSecondaryIndexes: replicaGlobalSecondaryIndexList option ;
  provisionedThroughputOverride: provisionedThroughputOverride option ;
  kmsmasterKeyId: kmsmasterKeyId option ;
  regionName: regionName }
type updateReplicationGroupMemberAction =
  {
  globalSecondaryIndexes: replicaGlobalSecondaryIndexList option ;
  provisionedThroughputOverride: provisionedThroughputOverride option ;
  kmsmasterKeyId: kmsmasterKeyId option ;
  regionName: regionName }
type deleteReplicationGroupMemberAction = {
  regionName: regionName }
type replicationGroupUpdate =
  {
  delete: deleteReplicationGroupMemberAction option ;
  update: updateReplicationGroupMemberAction option ;
  create: createReplicationGroupMemberAction option }
type replicationGroupUpdateList = replicationGroupUpdate list
type updateTableInput =
  {
  replicaUpdates: replicationGroupUpdateList option ;
  ssespecification: ssespecification option ;
  streamSpecification: streamSpecification option ;
  globalSecondaryIndexUpdates: globalSecondaryIndexUpdateList option ;
  provisionedThroughput: provisionedThroughput option ;
  billingMode: billingMode option ;
  tableName: tableName ;
  attributeDefinitions: attributeDefinitions option }
type attributeMap = (string * attributeValue) list
type consumedCapacityUnits = float
type capacity =
  {
  capacityUnits: consumedCapacityUnits option ;
  writeCapacityUnits: consumedCapacityUnits option ;
  readCapacityUnits: consumedCapacityUnits option }
type secondaryIndexesCapacityMap = (string * capacity) list
type consumedCapacity =
  {
  globalSecondaryIndexes: secondaryIndexesCapacityMap option ;
  localSecondaryIndexes: secondaryIndexesCapacityMap option ;
  table: capacity option ;
  writeCapacityUnits: consumedCapacityUnits option ;
  readCapacityUnits: consumedCapacityUnits option ;
  capacityUnits: consumedCapacityUnits option ;
  tableName: tableName option }
type itemCollectionKeyAttributeMap = (string * attributeValue) list
type itemCollectionSizeEstimateBound = float
type itemCollectionSizeEstimateRange = itemCollectionSizeEstimateBound list
type itemCollectionMetrics =
  {
  sizeEstimateRangeGB: itemCollectionSizeEstimateRange option ;
  itemCollectionKey: itemCollectionKeyAttributeMap option }
type updateItemOutput =
  {
  itemCollectionMetrics: itemCollectionMetrics option ;
  consumedCapacity: consumedCapacity option ;
  attributes: attributeMap option }
type attributeAction =
  | ADD 
  | PUT 
  | DELETE 
type attributeValueUpdate =
  {
  action: attributeAction option ;
  value: attributeValue option }
type attributeUpdates = (string * attributeValueUpdate) list
type comparisonOperator =
  | EQ 
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
type attributeValueList = attributeValue list
type expectedAttributeValue =
  {
  attributeValueList: attributeValueList option ;
  comparisonOperator: comparisonOperator option ;
  exists: booleanObject option ;
  value: attributeValue option }
type expectedAttributeMap = (string * expectedAttributeValue) list
type conditionalOperator =
  | AND 
  | OR 
type returnValue =
  | NONE 
  | ALL_OLD 
  | UPDATED_OLD 
  | ALL_NEW 
  | UPDATED_NEW 
type returnConsumedCapacity =
  | INDEXES 
  | TOTAL 
  | NONE 
type returnItemCollectionMetrics =
  | SIZE 
  | NONE 
type updateExpression = string
type conditionExpression = string
type expressionAttributeNameVariable = string
type expressionAttributeNameMap = (string * attributeName) list
type expressionAttributeValueVariable = string
type expressionAttributeValueMap = (string * attributeValue) list
type updateItemInput =
  {
  expressionAttributeValues: expressionAttributeValueMap option ;
  expressionAttributeNames: expressionAttributeNameMap option ;
  conditionExpression: conditionExpression option ;
  updateExpression: updateExpression option ;
  returnItemCollectionMetrics: returnItemCollectionMetrics option ;
  returnConsumedCapacity: returnConsumedCapacity option ;
  returnValues: returnValue option ;
  conditionalOperator: conditionalOperator option ;
  expected: expectedAttributeMap option ;
  attributeUpdates: attributeUpdates option ;
  key: key ;
  tableName: tableName }
exception TransactionConflictException of Aws.emptyErrorDetails Aws.apiError 
exception RequestLimitExceeded of Aws.emptyErrorDetails Aws.apiError 
exception ProvisionedThroughputExceededException of Aws.emptyErrorDetails
  Aws.apiError 
exception ItemCollectionSizeLimitExceededException of Aws.emptyErrorDetails
  Aws.apiError 
exception ConditionalCheckFailedException of Aws.emptyErrorDetails
  Aws.apiError 
type replicaGlobalSecondaryIndexSettingsDescription =
  {
  provisionedWriteCapacityAutoScalingSettings:
    autoScalingSettingsDescription option ;
  provisionedWriteCapacityUnits: positiveLongObject option ;
  provisionedReadCapacityAutoScalingSettings:
    autoScalingSettingsDescription option ;
  provisionedReadCapacityUnits: positiveLongObject option ;
  indexStatus: indexStatus option ;
  indexName: indexName }
type replicaGlobalSecondaryIndexSettingsDescriptionList =
  replicaGlobalSecondaryIndexSettingsDescription list
type replicaSettingsDescription =
  {
  replicaGlobalSecondaryIndexSettings:
    replicaGlobalSecondaryIndexSettingsDescriptionList option ;
  replicaProvisionedWriteCapacityAutoScalingSettings:
    autoScalingSettingsDescription option ;
  replicaProvisionedWriteCapacityUnits: nonNegativeLongObject option ;
  replicaProvisionedReadCapacityAutoScalingSettings:
    autoScalingSettingsDescription option ;
  replicaProvisionedReadCapacityUnits: nonNegativeLongObject option ;
  replicaBillingModeSummary: billingModeSummary option ;
  replicaStatus: replicaStatus option ;
  regionName: regionName }
type replicaSettingsDescriptionList = replicaSettingsDescription list
type updateGlobalTableSettingsOutput =
  {
  replicaSettings: replicaSettingsDescriptionList option ;
  globalTableName: tableName option }
type globalTableGlobalSecondaryIndexSettingsUpdate =
  {
  provisionedWriteCapacityAutoScalingSettingsUpdate:
    autoScalingSettingsUpdate option ;
  provisionedWriteCapacityUnits: positiveLongObject option ;
  indexName: indexName }
type globalTableGlobalSecondaryIndexSettingsUpdateList =
  globalTableGlobalSecondaryIndexSettingsUpdate list
type replicaGlobalSecondaryIndexSettingsUpdate =
  {
  provisionedReadCapacityAutoScalingSettingsUpdate:
    autoScalingSettingsUpdate option ;
  provisionedReadCapacityUnits: positiveLongObject option ;
  indexName: indexName }
type replicaGlobalSecondaryIndexSettingsUpdateList =
  replicaGlobalSecondaryIndexSettingsUpdate list
type replicaSettingsUpdate =
  {
  replicaGlobalSecondaryIndexSettingsUpdate:
    replicaGlobalSecondaryIndexSettingsUpdateList option ;
  replicaProvisionedReadCapacityAutoScalingSettingsUpdate:
    autoScalingSettingsUpdate option ;
  replicaProvisionedReadCapacityUnits: positiveLongObject option ;
  regionName: regionName }
type replicaSettingsUpdateList = replicaSettingsUpdate list
type updateGlobalTableSettingsInput =
  {
  replicaSettingsUpdate: replicaSettingsUpdateList option ;
  globalTableGlobalSecondaryIndexSettingsUpdate:
    globalTableGlobalSecondaryIndexSettingsUpdateList option ;
  globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate:
    autoScalingSettingsUpdate option ;
  globalTableProvisionedWriteCapacityUnits: positiveLongObject option ;
  globalTableBillingMode: billingMode option ;
  globalTableName: tableName }
exception ReplicaNotFoundException of Aws.emptyErrorDetails Aws.apiError 
exception IndexNotFoundException of Aws.emptyErrorDetails Aws.apiError 
exception GlobalTableNotFoundException of Aws.emptyErrorDetails Aws.apiError 
type globalTableArnString = string
type globalTableStatus =
  | CREATING 
  | ACTIVE 
  | DELETING 
  | UPDATING 
type globalTableDescription =
  {
  globalTableName: tableName option ;
  globalTableStatus: globalTableStatus option ;
  creationDateTime: date option ;
  globalTableArn: globalTableArnString option ;
  replicationGroup: replicaDescriptionList option }
type updateGlobalTableOutput =
  {
  globalTableDescription: globalTableDescription option }
type createReplicaAction = {
  regionName: regionName }
type deleteReplicaAction = {
  regionName: regionName }
type replicaUpdate =
  {
  delete: deleteReplicaAction option ;
  create: createReplicaAction option }
type replicaUpdateList = replicaUpdate list
type updateGlobalTableInput =
  {
  replicaUpdates: replicaUpdateList ;
  globalTableName: tableName }
exception TableNotFoundException of Aws.emptyErrorDetails Aws.apiError 
exception ReplicaAlreadyExistsException of Aws.emptyErrorDetails Aws.apiError 
type contributorInsightsStatus =
  | ENABLING 
  | ENABLED 
  | DISABLING 
  | DISABLED 
  | FAILED 
type updateContributorInsightsOutput =
  {
  contributorInsightsStatus: contributorInsightsStatus option ;
  indexName: indexName option ;
  tableName: tableName option }
type contributorInsightsAction =
  | ENABLE 
  | DISABLE 
type updateContributorInsightsInput =
  {
  contributorInsightsAction: contributorInsightsAction ;
  indexName: indexName option ;
  tableName: tableName }
type continuousBackupsStatus =
  | ENABLED 
  | DISABLED 
type pointInTimeRecoveryStatus =
  | ENABLED 
  | DISABLED 
type pointInTimeRecoveryDescription =
  {
  latestRestorableDateTime: date option ;
  earliestRestorableDateTime: date option ;
  pointInTimeRecoveryStatus: pointInTimeRecoveryStatus option }
type continuousBackupsDescription =
  {
  pointInTimeRecoveryDescription: pointInTimeRecoveryDescription option ;
  continuousBackupsStatus: continuousBackupsStatus }
type updateContinuousBackupsOutput =
  {
  continuousBackupsDescription: continuousBackupsDescription option }
type pointInTimeRecoverySpecification =
  {
  pointInTimeRecoveryEnabled: booleanObject }
type updateContinuousBackupsInput =
  {
  pointInTimeRecoverySpecification: pointInTimeRecoverySpecification ;
  tableName: tableName }
exception ContinuousBackupsUnavailableException of Aws.emptyErrorDetails
  Aws.apiError 
type returnValuesOnConditionCheckFailure =
  | ALL_OLD 
  | NONE 
type update =
  {
  returnValuesOnConditionCheckFailure:
    returnValuesOnConditionCheckFailure option ;
  expressionAttributeValues: expressionAttributeValueMap option ;
  expressionAttributeNames: expressionAttributeNameMap option ;
  conditionExpression: conditionExpression option ;
  tableName: tableName ;
  updateExpression: updateExpression ;
  key: key }
type resourceArnString = string
type tagKeyString = string
type tagKeyList = tagKeyString list
type untagResourceInput =
  {
  tagKeys: tagKeyList ;
  resourceArn: resourceArnString }
exception TransactionInProgressException of Aws.emptyErrorDetails
  Aws.apiError 
type code = string
type cancellationReason =
  {
  message: errorMessage option ;
  code: code option ;
  item: attributeMap option }
type cancellationReasonList = cancellationReason list
exception TransactionCanceledException of Aws.emptyErrorDetails Aws.apiError 
type consumedCapacityMultiple = consumedCapacity list
type itemCollectionMetricsMultiple = itemCollectionMetrics list
type itemCollectionMetricsPerTable =
  (string * itemCollectionMetricsMultiple) list
type transactWriteItemsOutput =
  {
  itemCollectionMetrics: itemCollectionMetricsPerTable option ;
  consumedCapacity: consumedCapacityMultiple option }
type conditionCheck =
  {
  returnValuesOnConditionCheckFailure:
    returnValuesOnConditionCheckFailure option ;
  expressionAttributeValues: expressionAttributeValueMap option ;
  expressionAttributeNames: expressionAttributeNameMap option ;
  conditionExpression: conditionExpression ;
  tableName: tableName ;
  key: key }
type put =
  {
  returnValuesOnConditionCheckFailure:
    returnValuesOnConditionCheckFailure option ;
  expressionAttributeValues: expressionAttributeValueMap option ;
  expressionAttributeNames: expressionAttributeNameMap option ;
  conditionExpression: conditionExpression option ;
  tableName: tableName ;
  item: putItemInputAttributeMap }
type delete =
  {
  returnValuesOnConditionCheckFailure:
    returnValuesOnConditionCheckFailure option ;
  expressionAttributeValues: expressionAttributeValueMap option ;
  expressionAttributeNames: expressionAttributeNameMap option ;
  conditionExpression: conditionExpression option ;
  tableName: tableName ;
  key: key }
type transactWriteItem =
  {
  update: update option ;
  delete: delete option ;
  put: put option ;
  conditionCheck: conditionCheck option }
type transactWriteItemList = transactWriteItem list
type clientRequestToken = string
type transactWriteItemsInput =
  {
  clientRequestToken: clientRequestToken option ;
  returnItemCollectionMetrics: returnItemCollectionMetrics option ;
  returnConsumedCapacity: returnConsumedCapacity option ;
  transactItems: transactWriteItemList }
exception IdempotentParameterMismatchException of Aws.emptyErrorDetails
  Aws.apiError 
type itemResponse = {
  item: attributeMap option }
type itemResponseList = itemResponse list
type transactGetItemsOutput =
  {
  responses: itemResponseList option ;
  consumedCapacity: consumedCapacityMultiple option }
type projectionExpression = string
type get =
  {
  expressionAttributeNames: expressionAttributeNameMap option ;
  projectionExpression: projectionExpression option ;
  tableName: tableName ;
  key: key }
type transactGetItem = {
  get: get }
type transactGetItemList = transactGetItem list
type transactGetItemsInput =
  {
  returnConsumedCapacity: returnConsumedCapacity option ;
  transactItems: transactGetItemList }
type timeToLiveStatus =
  | ENABLING 
  | DISABLING 
  | ENABLED 
  | DISABLED 
type timeToLiveDescription =
  {
  attributeName: timeToLiveAttributeName option ;
  timeToLiveStatus: timeToLiveStatus option }
type timeRangeUpperBound = float
type timeRangeLowerBound = float
type tagValueString = string
type tag = {
  value: tagValueString ;
  key: tagKeyString }
type tagList_ = tag list
type tagResourceInput = {
  tags: tagList_ ;
  resourceArn: resourceArnString }
type tableNameList = tableName list
exception TableInUseException of Aws.emptyErrorDetails Aws.apiError 
type tableCreationDateTime = float
exception TableAlreadyExistsException of Aws.emptyErrorDetails Aws.apiError 
type localSecondaryIndexInfo =
  {
  projection: projection option ;
  keySchema: keySchema option ;
  indexName: indexName option }
type localSecondaryIndexes = localSecondaryIndexInfo list
type globalSecondaryIndexInfo =
  {
  provisionedThroughput: provisionedThroughput option ;
  projection: projection option ;
  keySchema: keySchema option ;
  indexName: indexName option }
type globalSecondaryIndexes = globalSecondaryIndexInfo list
type sourceTableFeatureDetails =
  {
  ssedescription: ssedescription option ;
  timeToLiveDescription: timeToLiveDescription option ;
  streamDescription: streamSpecification option ;
  globalSecondaryIndexes: globalSecondaryIndexes option ;
  localSecondaryIndexes: localSecondaryIndexes option }
type itemCount = int
type sourceTableDetails =
  {
  billingMode: billingMode option ;
  itemCount: itemCount option ;
  provisionedThroughput: provisionedThroughput ;
  tableCreationDateTime: tableCreationDateTime ;
  keySchema: keySchema ;
  tableSizeBytes: long option ;
  tableArn: tableArn option ;
  tableId: tableId ;
  tableName: tableName }
type select =
  | ALL_ATTRIBUTES 
  | ALL_PROJECTED_ATTRIBUTES 
  | SPECIFIC_ATTRIBUTES 
  | COUNT 
type scanTotalSegments = int
type scanSegment = int
type itemList = attributeMap list
type integer_ = int
type scanOutput =
  {
  consumedCapacity: consumedCapacity option ;
  lastEvaluatedKey: key option ;
  scannedCount: integer_ option ;
  count: integer_ option ;
  items: itemList option }
type attributeNameList = attributeName list
type positiveIntegerObject = int
type condition =
  {
  comparisonOperator: comparisonOperator ;
  attributeValueList: attributeValueList option }
type filterConditionMap = (string * condition) list
type consistentRead = bool
type scanInput =
  {
  consistentRead: consistentRead option ;
  expressionAttributeValues: expressionAttributeValueMap option ;
  expressionAttributeNames: expressionAttributeNameMap option ;
  filterExpression: conditionExpression option ;
  projectionExpression: projectionExpression option ;
  segment: scanSegment option ;
  totalSegments: scanTotalSegments option ;
  returnConsumedCapacity: returnConsumedCapacity option ;
  exclusiveStartKey: key option ;
  conditionalOperator: conditionalOperator option ;
  scanFilter: filterConditionMap option ;
  select: select option ;
  limit: positiveIntegerObject option ;
  attributesToGet: attributeNameList option ;
  indexName: indexName option ;
  tableName: tableName }
type s3SseKmsKeyId = string
type s3SseAlgorithm =
  | AES256 
  | KMS 
type s3Prefix = string
type s3BucketOwner = string
type s3Bucket = string
type restoreTableToPointInTimeOutput =
  {
  tableDescription: tableDescription option }
type globalSecondaryIndex =
  {
  provisionedThroughput: provisionedThroughput option ;
  projection: projection ;
  keySchema: keySchema ;
  indexName: indexName }
type globalSecondaryIndexList = globalSecondaryIndex list
type localSecondaryIndex =
  {
  projection: projection ;
  keySchema: keySchema ;
  indexName: indexName }
type localSecondaryIndexList = localSecondaryIndex list
type restoreTableToPointInTimeInput =
  {
  ssespecificationOverride: ssespecification option ;
  provisionedThroughputOverride: provisionedThroughput option ;
  localSecondaryIndexOverride: localSecondaryIndexList option ;
  globalSecondaryIndexOverride: globalSecondaryIndexList option ;
  billingModeOverride: billingMode option ;
  restoreDateTime: date option ;
  useLatestRestorableTime: booleanObject option ;
  targetTableName: tableName ;
  sourceTableName: tableName option ;
  sourceTableArn: tableArn option }
exception PointInTimeRecoveryUnavailableException of Aws.emptyErrorDetails
  Aws.apiError 
exception InvalidRestoreTimeException of Aws.emptyErrorDetails Aws.apiError 
type restoreTableFromBackupOutput =
  {
  tableDescription: tableDescription option }
type restoreTableFromBackupInput =
  {
  ssespecificationOverride: ssespecification option ;
  provisionedThroughputOverride: provisionedThroughput option ;
  localSecondaryIndexOverride: localSecondaryIndexList option ;
  globalSecondaryIndexOverride: globalSecondaryIndexList option ;
  billingModeOverride: billingMode option ;
  backupArn: backupArn ;
  targetTableName: tableName }
exception BackupNotFoundException of Aws.emptyErrorDetails Aws.apiError 
exception BackupInUseException of Aws.emptyErrorDetails Aws.apiError 
type replica = {
  regionName: regionName option }
type replicaList = replica list
type queryOutput =
  {
  consumedCapacity: consumedCapacity option ;
  lastEvaluatedKey: key option ;
  scannedCount: integer_ option ;
  count: integer_ option ;
  items: itemList option }
type keyConditions = (string * condition) list
type keyExpression = string
type queryInput =
  {
  expressionAttributeValues: expressionAttributeValueMap option ;
  expressionAttributeNames: expressionAttributeNameMap option ;
  keyConditionExpression: keyExpression option ;
  filterExpression: conditionExpression option ;
  projectionExpression: projectionExpression option ;
  returnConsumedCapacity: returnConsumedCapacity option ;
  exclusiveStartKey: key option ;
  scanIndexForward: booleanObject option ;
  conditionalOperator: conditionalOperator option ;
  queryFilter: filterConditionMap option ;
  keyConditions: keyConditions option ;
  consistentRead: consistentRead option ;
  limit: positiveIntegerObject option ;
  attributesToGet: attributeNameList option ;
  select: select option ;
  indexName: indexName option ;
  tableName: tableName }
type putItemOutput =
  {
  itemCollectionMetrics: itemCollectionMetrics option ;
  consumedCapacity: consumedCapacity option ;
  attributes: attributeMap option }
type putItemInput =
  {
  expressionAttributeValues: expressionAttributeValueMap option ;
  expressionAttributeNames: expressionAttributeNameMap option ;
  conditionExpression: conditionExpression option ;
  conditionalOperator: conditionalOperator option ;
  returnItemCollectionMetrics: returnItemCollectionMetrics option ;
  returnConsumedCapacity: returnConsumedCapacity option ;
  returnValues: returnValue option ;
  expected: expectedAttributeMap option ;
  item: putItemInputAttributeMap ;
  tableName: tableName }
type preparedStatementParameters = attributeValue list
type partiQLStatement = string
type partiQLNextToken = string
type batchStatementErrorCodeEnum =
  | ConditionalCheckFailed 
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
type batchStatementError =
  {
  message: string_ option ;
  code: batchStatementErrorCodeEnum option }
type batchStatementResponse =
  {
  item: attributeMap option ;
  tableName: tableName option ;
  error: batchStatementError option }
type partiQLBatchResponse = batchStatementResponse list
type batchStatementRequest =
  {
  consistentRead: consistentRead option ;
  parameters: preparedStatementParameters option ;
  statement: partiQLStatement }
type partiQLBatchRequest = batchStatementRequest list
type parameterizedStatement =
  {
  parameters: preparedStatementParameters option ;
  statement: partiQLStatement }
type parameterizedStatements = parameterizedStatement list
type nextTokenString = string
type listTagsOfResourceOutput =
  {
  nextToken: nextTokenString option ;
  tags: tagList_ option }
type listTagsOfResourceInput =
  {
  nextToken: nextTokenString option ;
  resourceArn: resourceArnString }
type listTablesOutput =
  {
  lastEvaluatedTableName: tableName option ;
  tableNames: tableNameList option }
type listTablesInputLimit = int
type listTablesInput =
  {
  limit: listTablesInputLimit option ;
  exclusiveStartTableName: tableName option }
type globalTable =
  {
  replicationGroup: replicaList option ;
  globalTableName: tableName option }
type globalTableList = globalTable list
type listGlobalTablesOutput =
  {
  lastEvaluatedGlobalTableName: tableName option ;
  globalTables: globalTableList option }
type listGlobalTablesInput =
  {
  regionName: regionName option ;
  limit: positiveIntegerObject option ;
  exclusiveStartGlobalTableName: tableName option }
type exportArn = string
type exportStatus =
  | IN_PROGRESS 
  | COMPLETED 
  | FAILED 
type exportSummary =
  {
  exportStatus: exportStatus option ;
  exportArn: exportArn option }
type exportSummaries = exportSummary list
type exportNextToken = string
type listExportsOutput =
  {
  nextToken: exportNextToken option ;
  exportSummaries: exportSummaries option }
type listExportsMaxLimit = int
type listExportsInput =
  {
  nextToken: exportNextToken option ;
  maxResults: listExportsMaxLimit option ;
  tableArn: tableArn option }
type contributorInsightsSummary =
  {
  contributorInsightsStatus: contributorInsightsStatus option ;
  indexName: indexName option ;
  tableName: tableName option }
type contributorInsightsSummaries = contributorInsightsSummary list
type listContributorInsightsOutput =
  {
  nextToken: nextTokenString option ;
  contributorInsightsSummaries: contributorInsightsSummaries option }
type listContributorInsightsLimit = int
type listContributorInsightsInput =
  {
  maxResults: listContributorInsightsLimit option ;
  nextToken: nextTokenString option ;
  tableName: tableName option }
type backupName = string
type backupCreationDateTime = float
type backupStatus =
  | CREATING 
  | DELETED 
  | AVAILABLE 
type backupType =
  | USER 
  | SYSTEM 
  | AWS_BACKUP 
type backupSizeBytes = int
type backupSummary =
  {
  backupSizeBytes: backupSizeBytes option ;
  backupType: backupType option ;
  backupStatus: backupStatus option ;
  backupExpiryDateTime: date option ;
  backupCreationDateTime: backupCreationDateTime option ;
  backupName: backupName option ;
  backupArn: backupArn option ;
  tableArn: tableArn option ;
  tableId: tableId option ;
  tableName: tableName option }
type backupSummaries = backupSummary list
type listBackupsOutput =
  {
  lastEvaluatedBackupArn: backupArn option ;
  backupSummaries: backupSummaries option }
type backupsInputLimit = int
type backupTypeFilter =
  | USER 
  | SYSTEM 
  | AWS_BACKUP 
  | ALL 
type listBackupsInput =
  {
  backupType: backupTypeFilter option ;
  exclusiveStartBackupArn: backupArn option ;
  timeRangeUpperBound: timeRangeUpperBound option ;
  timeRangeLowerBound: timeRangeLowerBound option ;
  limit: backupsInputLimit option ;
  tableName: tableName option }
type lastUpdateDateTime = float
type destinationStatus =
  | ENABLING 
  | ACTIVE 
  | DISABLING 
  | DISABLED 
  | ENABLE_FAILED 
type kinesisStreamingDestinationOutput =
  {
  destinationStatus: destinationStatus option ;
  streamArn: streamArn option ;
  tableName: tableName option }
type kinesisStreamingDestinationInput =
  {
  streamArn: streamArn ;
  tableName: tableName }
type kinesisDataStreamDestination =
  {
  destinationStatusDescription: string_ option ;
  destinationStatus: destinationStatus option ;
  streamArn: streamArn option }
type kinesisDataStreamDestinations = kinesisDataStreamDestination list
type keyList = key list
type keysAndAttributes =
  {
  expressionAttributeNames: expressionAttributeNameMap option ;
  projectionExpression: projectionExpression option ;
  consistentRead: consistentRead option ;
  attributesToGet: attributeNameList option ;
  keys: keyList }
exception InvalidExportTimeException of Aws.emptyErrorDetails Aws.apiError 
exception GlobalTableAlreadyExistsException of Aws.emptyErrorDetails
  Aws.apiError 
type getItemOutput =
  {
  consumedCapacity: consumedCapacity option ;
  item: attributeMap option }
type getItemInput =
  {
  expressionAttributeNames: expressionAttributeNameMap option ;
  projectionExpression: projectionExpression option ;
  returnConsumedCapacity: returnConsumedCapacity option ;
  consistentRead: consistentRead option ;
  attributesToGet: attributeNameList option ;
  key: key ;
  tableName: tableName }
type failureMessage = string
type exceptionName = string
type exceptionDescription = string
type failureException =
  {
  exceptionDescription: exceptionDescription option ;
  exceptionName: exceptionName option }
type failureCode = string
type exportTime = float
type exportStartTime = float
type exportEndTime = float
type exportManifest = string
type clientToken = string
type exportFormat =
  | DYNAMODB_JSON 
  | ION 
type billedSizeBytes = int
type exportDescription =
  {
  itemCount: itemCount option ;
  billedSizeBytes: billedSizeBytes option ;
  exportFormat: exportFormat option ;
  failureMessage: failureMessage option ;
  failureCode: failureCode option ;
  s3SseKmsKeyId: s3SseKmsKeyId option ;
  s3SseAlgorithm: s3SseAlgorithm option ;
  s3Prefix: s3Prefix option ;
  s3BucketOwner: s3BucketOwner option ;
  s3Bucket: s3Bucket option ;
  clientToken: clientToken option ;
  exportTime: exportTime option ;
  tableId: tableId option ;
  tableArn: tableArn option ;
  exportManifest: exportManifest option ;
  endTime: exportEndTime option ;
  startTime: exportStartTime option ;
  exportStatus: exportStatus option ;
  exportArn: exportArn option }
type exportTableToPointInTimeOutput =
  {
  exportDescription: exportDescription option }
type exportTableToPointInTimeInput =
  {
  exportFormat: exportFormat option ;
  s3SseKmsKeyId: s3SseKmsKeyId option ;
  s3SseAlgorithm: s3SseAlgorithm option ;
  s3Prefix: s3Prefix option ;
  s3BucketOwner: s3BucketOwner option ;
  s3Bucket: s3Bucket ;
  clientToken: clientToken option ;
  exportTime: exportTime option ;
  tableArn: tableArn }
exception ExportConflictException of Aws.emptyErrorDetails Aws.apiError 
exception ExportNotFoundException of Aws.emptyErrorDetails Aws.apiError 
type executeTransactionOutput = {
  responses: itemResponseList option }
type executeTransactionInput =
  {
  clientRequestToken: clientRequestToken option ;
  transactStatements: parameterizedStatements }
type executeStatementOutput =
  {
  nextToken: partiQLNextToken option ;
  items: itemList option }
type executeStatementInput =
  {
  nextToken: partiQLNextToken option ;
  consistentRead: consistentRead option ;
  parameters: preparedStatementParameters option ;
  statement: partiQLStatement }
exception DuplicateItemException of Aws.emptyErrorDetails Aws.apiError 
type endpoint = {
  cachePeriodInMinutes: long ;
  address: string_ }
type endpoints = endpoint list
type describeTimeToLiveOutput =
  {
  timeToLiveDescription: timeToLiveDescription option }
type describeTimeToLiveInput = {
  tableName: tableName }
type describeTableReplicaAutoScalingOutput =
  {
  tableAutoScalingDescription: tableAutoScalingDescription option }
type describeTableReplicaAutoScalingInput = {
  tableName: tableName }
type describeTableOutput = {
  table: tableDescription option }
type describeTableInput = {
  tableName: tableName }
type describeLimitsOutput =
  {
  tableMaxWriteCapacityUnits: positiveLongObject option ;
  tableMaxReadCapacityUnits: positiveLongObject option ;
  accountMaxWriteCapacityUnits: positiveLongObject option ;
  accountMaxReadCapacityUnits: positiveLongObject option }
type describeLimitsInput = <  > 
type describeKinesisStreamingDestinationOutput =
  {
  kinesisDataStreamDestinations: kinesisDataStreamDestinations option ;
  tableName: tableName option }
type describeKinesisStreamingDestinationInput = {
  tableName: tableName }
type describeGlobalTableSettingsOutput =
  {
  replicaSettings: replicaSettingsDescriptionList option ;
  globalTableName: tableName option }
type describeGlobalTableSettingsInput = {
  globalTableName: tableName }
type describeGlobalTableOutput =
  {
  globalTableDescription: globalTableDescription option }
type describeGlobalTableInput = {
  globalTableName: tableName }
type describeExportOutput = {
  exportDescription: exportDescription option }
type describeExportInput = {
  exportArn: exportArn }
type describeEndpointsResponse = {
  endpoints: endpoints }
type describeEndpointsRequest = <  > 
type contributorInsightsRule = string
type contributorInsightsRuleList = contributorInsightsRule list
type describeContributorInsightsOutput =
  {
  failureException: failureException option ;
  lastUpdateDateTime: lastUpdateDateTime option ;
  contributorInsightsStatus: contributorInsightsStatus option ;
  contributorInsightsRuleList: contributorInsightsRuleList option ;
  indexName: indexName option ;
  tableName: tableName option }
type describeContributorInsightsInput =
  {
  indexName: indexName option ;
  tableName: tableName }
type describeContinuousBackupsOutput =
  {
  continuousBackupsDescription: continuousBackupsDescription option }
type describeContinuousBackupsInput = {
  tableName: tableName }
type backupDetails =
  {
  backupExpiryDateTime: date option ;
  backupCreationDateTime: backupCreationDateTime ;
  backupType: backupType ;
  backupStatus: backupStatus ;
  backupSizeBytes: backupSizeBytes option ;
  backupName: backupName ;
  backupArn: backupArn }
type backupDescription =
  {
  sourceTableFeatureDetails: sourceTableFeatureDetails option ;
  sourceTableDetails: sourceTableDetails option ;
  backupDetails: backupDetails option }
type describeBackupOutput = {
  backupDescription: backupDescription option }
type describeBackupInput = {
  backupArn: backupArn }
type deleteTableOutput = {
  tableDescription: tableDescription option }
type deleteTableInput = {
  tableName: tableName }
type deleteItemOutput =
  {
  itemCollectionMetrics: itemCollectionMetrics option ;
  consumedCapacity: consumedCapacity option ;
  attributes: attributeMap option }
type deleteItemInput =
  {
  expressionAttributeValues: expressionAttributeValueMap option ;
  expressionAttributeNames: expressionAttributeNameMap option ;
  conditionExpression: conditionExpression option ;
  returnItemCollectionMetrics: returnItemCollectionMetrics option ;
  returnConsumedCapacity: returnConsumedCapacity option ;
  returnValues: returnValue option ;
  conditionalOperator: conditionalOperator option ;
  expected: expectedAttributeMap option ;
  key: key ;
  tableName: tableName }
type deleteBackupOutput = {
  backupDescription: backupDescription option }
type deleteBackupInput = {
  backupArn: backupArn }
type createTableOutput = {
  tableDescription: tableDescription option }
type createTableInput =
  {
  tags: tagList_ option ;
  ssespecification: ssespecification option ;
  streamSpecification: streamSpecification option ;
  provisionedThroughput: provisionedThroughput option ;
  billingMode: billingMode option ;
  globalSecondaryIndexes: globalSecondaryIndexList option ;
  localSecondaryIndexes: localSecondaryIndexList option ;
  keySchema: keySchema ;
  tableName: tableName ;
  attributeDefinitions: attributeDefinitions }
type createGlobalTableOutput =
  {
  globalTableDescription: globalTableDescription option }
type createGlobalTableInput =
  {
  replicationGroup: replicaList ;
  globalTableName: tableName }
type createBackupOutput = {
  backupDetails: backupDetails option }
type createBackupInput = {
  backupName: backupName ;
  tableName: tableName }
type batchWriteItemRequestMap = (string * writeRequests) list
type batchWriteItemOutput =
  {
  consumedCapacity: consumedCapacityMultiple option ;
  itemCollectionMetrics: itemCollectionMetricsPerTable option ;
  unprocessedItems: batchWriteItemRequestMap option }
type batchWriteItemInput =
  {
  returnItemCollectionMetrics: returnItemCollectionMetrics option ;
  returnConsumedCapacity: returnConsumedCapacity option ;
  requestItems: batchWriteItemRequestMap }
type batchGetResponseMap = (string * itemList) list
type batchGetRequestMap = (string * keysAndAttributes) list
type batchGetItemOutput =
  {
  consumedCapacity: consumedCapacityMultiple option ;
  unprocessedKeys: batchGetRequestMap option ;
  responses: batchGetResponseMap option }
type batchGetItemInput =
  {
  returnConsumedCapacity: returnConsumedCapacity option ;
  requestItems: batchGetRequestMap }
type batchExecuteStatementOutput = {
  responses: partiQLBatchResponse option }
type batchExecuteStatementInput = {
  statements: partiQLBatchRequest }
type baseString = string
type baseBoolean = bool
type baseInteger = int
type baseTimestamp = float
type baseLong = int
module Serialize =
  struct
    open AwsSdkLib.Json.SerializeHelpers
    let stringAttributeValue_to_yojson = string_to_yojson
    let numberAttributeValue_to_yojson = string_to_yojson
    let binaryAttributeValue_to_yojson = blob_to_yojson
    let stringSetAttributeValue_to_yojson x =
      list_to_yojson stringAttributeValue_to_yojson x
    let numberSetAttributeValue_to_yojson x =
      list_to_yojson numberAttributeValue_to_yojson x
    let binarySetAttributeValue_to_yojson x =
      list_to_yojson binaryAttributeValue_to_yojson x
    let attributeName_to_yojson = string_to_yojson
    let nullAttributeValue_to_yojson = bool_to_yojson
    let booleanAttributeValue_to_yojson = bool_to_yojson
    let rec attributeValue_to_yojson (x : attributeValue) =
      match x with
      | ((BOOL (arg))[@explicit_arity ]) ->
          assoc_to_yojson
            [("BOOL", ((Some ((booleanAttributeValue_to_yojson arg)))
               [@explicit_arity ]))]
      | ((NULL (arg))[@explicit_arity ]) ->
          assoc_to_yojson
            [("NULL", ((Some ((nullAttributeValue_to_yojson arg)))
               [@explicit_arity ]))]
      | ((L (arg))[@explicit_arity ]) ->
          assoc_to_yojson
            [("L", ((Some ((listAttributeValue_to_yojson arg)))
               [@explicit_arity ]))]
      | ((M (arg))[@explicit_arity ]) ->
          assoc_to_yojson
            [("M", ((Some ((mapAttributeValue_to_yojson arg)))
               [@explicit_arity ]))]
      | ((BS (arg))[@explicit_arity ]) ->
          assoc_to_yojson
            [("BS", ((Some ((binarySetAttributeValue_to_yojson arg)))
               [@explicit_arity ]))]
      | ((NS (arg))[@explicit_arity ]) ->
          assoc_to_yojson
            [("NS", ((Some ((numberSetAttributeValue_to_yojson arg)))
               [@explicit_arity ]))]
      | ((SS (arg))[@explicit_arity ]) ->
          assoc_to_yojson
            [("SS", ((Some ((stringSetAttributeValue_to_yojson arg)))
               [@explicit_arity ]))]
      | ((B (arg))[@explicit_arity ]) ->
          assoc_to_yojson
            [("B", ((Some ((binaryAttributeValue_to_yojson arg)))
               [@explicit_arity ]))]
      | ((N (arg))[@explicit_arity ]) ->
          assoc_to_yojson
            [("N", ((Some ((numberAttributeValue_to_yojson arg)))
               [@explicit_arity ]))]
      | ((S (arg))[@explicit_arity ]) ->
          assoc_to_yojson
            [("S", ((Some ((stringAttributeValue_to_yojson arg)))
               [@explicit_arity ]))]
    and listAttributeValue_to_yojson x =
      list_to_yojson attributeValue_to_yojson x
    and mapAttributeValue_to_yojson x =
      map_to_yojson attributeValue_to_yojson x
    let putItemInputAttributeMap_to_yojson x =
      map_to_yojson attributeValue_to_yojson x
    let putRequest_to_yojson (x : putRequest) =
      assoc_to_yojson
        [("Item", ((Some ((putItemInputAttributeMap_to_yojson x.item)))
           [@explicit_arity ]))]
    let key_to_yojson x = map_to_yojson attributeValue_to_yojson x
    let deleteRequest_to_yojson (x : deleteRequest) =
      assoc_to_yojson
        [("Key", ((Some ((key_to_yojson x.key)))[@explicit_arity ]))]
    let writeRequest_to_yojson (x : writeRequest) =
      assoc_to_yojson
        [("DeleteRequest",
           (option_to_yojson deleteRequest_to_yojson x.deleteRequest));
        ("PutRequest", (option_to_yojson putRequest_to_yojson x.putRequest))]
    let writeRequests_to_yojson x = list_to_yojson writeRequest_to_yojson x
    let timeToLiveEnabled_to_yojson = bool_to_yojson
    let timeToLiveAttributeName_to_yojson = string_to_yojson
    let timeToLiveSpecification_to_yojson (x : timeToLiveSpecification) =
      assoc_to_yojson
        [("AttributeName",
           ((Some ((timeToLiveAttributeName_to_yojson x.attributeName)))
           [@explicit_arity ]));
        ("Enabled", ((Some ((timeToLiveEnabled_to_yojson x.enabled)))
          [@explicit_arity ]))]
    let updateTimeToLiveOutput_to_yojson (x : updateTimeToLiveOutput) =
      assoc_to_yojson
        [("TimeToLiveSpecification",
           (option_to_yojson timeToLiveSpecification_to_yojson
              x.timeToLiveSpecification))]
    let tableName_to_yojson = string_to_yojson
    let updateTimeToLiveInput_to_yojson (x : updateTimeToLiveInput) =
      assoc_to_yojson
        [("TimeToLiveSpecification",
           ((Some
               ((timeToLiveSpecification_to_yojson x.timeToLiveSpecification)))
           [@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let errorMessage_to_yojson = string_to_yojson
    let string_to_yojson = string_to_yojson
    let tableStatus_to_yojson (x : tableStatus) =
      match x with
      | CREATING -> `String "CREATING"
      | UPDATING -> `String "UPDATING"
      | DELETING -> `String "DELETING"
      | ACTIVE -> `String "ACTIVE"
      | INACCESSIBLE_ENCRYPTION_CREDENTIALS ->
          `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
      | ARCHIVING -> `String "ARCHIVING"
      | ARCHIVED -> `String "ARCHIVED"
    let regionName_to_yojson = string_to_yojson
    let indexName_to_yojson = string_to_yojson
    let indexStatus_to_yojson (x : indexStatus) =
      match x with
      | CREATING -> `String "CREATING"
      | UPDATING -> `String "UPDATING"
      | DELETING -> `String "DELETING"
      | ACTIVE -> `String "ACTIVE"
    let positiveLongObject_to_yojson = long_to_yojson
    let booleanObject_to_yojson = bool_to_yojson
    let autoScalingPolicyName_to_yojson = string_to_yojson
    let integerObject_to_yojson = int_to_yojson
    let double_to_yojson = double_to_yojson
    let autoScalingTargetTrackingScalingPolicyConfigurationDescription_to_yojson
      (x : autoScalingTargetTrackingScalingPolicyConfigurationDescription) =
      assoc_to_yojson
        [("TargetValue", ((Some ((double_to_yojson x.targetValue)))
           [@explicit_arity ]));
        ("ScaleOutCooldown",
          (option_to_yojson integerObject_to_yojson x.scaleOutCooldown));
        ("ScaleInCooldown",
          (option_to_yojson integerObject_to_yojson x.scaleInCooldown));
        ("DisableScaleIn",
          (option_to_yojson booleanObject_to_yojson x.disableScaleIn))]
    let autoScalingPolicyDescription_to_yojson
      (x : autoScalingPolicyDescription) =
      assoc_to_yojson
        [("TargetTrackingScalingPolicyConfiguration",
           (option_to_yojson
              autoScalingTargetTrackingScalingPolicyConfigurationDescription_to_yojson
              x.targetTrackingScalingPolicyConfiguration));
        ("PolicyName",
          (option_to_yojson autoScalingPolicyName_to_yojson x.policyName))]
    let autoScalingPolicyDescriptionList_to_yojson x =
      list_to_yojson autoScalingPolicyDescription_to_yojson x
    let autoScalingSettingsDescription_to_yojson
      (x : autoScalingSettingsDescription) =
      assoc_to_yojson
        [("ScalingPolicies",
           (option_to_yojson autoScalingPolicyDescriptionList_to_yojson
              x.scalingPolicies));
        ("AutoScalingRoleArn",
          (option_to_yojson string_to_yojson x.autoScalingRoleArn));
        ("AutoScalingDisabled",
          (option_to_yojson booleanObject_to_yojson x.autoScalingDisabled));
        ("MaximumUnits",
          (option_to_yojson positiveLongObject_to_yojson x.maximumUnits));
        ("MinimumUnits",
          (option_to_yojson positiveLongObject_to_yojson x.minimumUnits))]
    let replicaGlobalSecondaryIndexAutoScalingDescription_to_yojson
      (x : replicaGlobalSecondaryIndexAutoScalingDescription) =
      assoc_to_yojson
        [("ProvisionedWriteCapacityAutoScalingSettings",
           (option_to_yojson autoScalingSettingsDescription_to_yojson
              x.provisionedWriteCapacityAutoScalingSettings));
        ("ProvisionedReadCapacityAutoScalingSettings",
          (option_to_yojson autoScalingSettingsDescription_to_yojson
             x.provisionedReadCapacityAutoScalingSettings));
        ("IndexStatus",
          (option_to_yojson indexStatus_to_yojson x.indexStatus));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName))]
    let replicaGlobalSecondaryIndexAutoScalingDescriptionList_to_yojson x =
      list_to_yojson
        replicaGlobalSecondaryIndexAutoScalingDescription_to_yojson x
    let replicaStatus_to_yojson (x : replicaStatus) =
      match x with
      | CREATING -> `String "CREATING"
      | CREATION_FAILED -> `String "CREATION_FAILED"
      | UPDATING -> `String "UPDATING"
      | DELETING -> `String "DELETING"
      | ACTIVE -> `String "ACTIVE"
      | REGION_DISABLED -> `String "REGION_DISABLED"
      | INACCESSIBLE_ENCRYPTION_CREDENTIALS ->
          `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
    let replicaAutoScalingDescription_to_yojson
      (x : replicaAutoScalingDescription) =
      assoc_to_yojson
        [("ReplicaStatus",
           (option_to_yojson replicaStatus_to_yojson x.replicaStatus));
        ("ReplicaProvisionedWriteCapacityAutoScalingSettings",
          (option_to_yojson autoScalingSettingsDescription_to_yojson
             x.replicaProvisionedWriteCapacityAutoScalingSettings));
        ("ReplicaProvisionedReadCapacityAutoScalingSettings",
          (option_to_yojson autoScalingSettingsDescription_to_yojson
             x.replicaProvisionedReadCapacityAutoScalingSettings));
        ("GlobalSecondaryIndexes",
          (option_to_yojson
             replicaGlobalSecondaryIndexAutoScalingDescriptionList_to_yojson
             x.globalSecondaryIndexes));
        ("RegionName", (option_to_yojson regionName_to_yojson x.regionName))]
    let replicaAutoScalingDescriptionList_to_yojson x =
      list_to_yojson replicaAutoScalingDescription_to_yojson x
    let tableAutoScalingDescription_to_yojson
      (x : tableAutoScalingDescription) =
      assoc_to_yojson
        [("Replicas",
           (option_to_yojson replicaAutoScalingDescriptionList_to_yojson
              x.replicas));
        ("TableStatus",
          (option_to_yojson tableStatus_to_yojson x.tableStatus));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName))]
    let updateTableReplicaAutoScalingOutput_to_yojson
      (x : updateTableReplicaAutoScalingOutput) =
      assoc_to_yojson
        [("TableAutoScalingDescription",
           (option_to_yojson tableAutoScalingDescription_to_yojson
              x.tableAutoScalingDescription))]
    let autoScalingRoleArn_to_yojson = string_to_yojson
    let autoScalingTargetTrackingScalingPolicyConfigurationUpdate_to_yojson
      (x : autoScalingTargetTrackingScalingPolicyConfigurationUpdate) =
      assoc_to_yojson
        [("TargetValue", ((Some ((double_to_yojson x.targetValue)))
           [@explicit_arity ]));
        ("ScaleOutCooldown",
          (option_to_yojson integerObject_to_yojson x.scaleOutCooldown));
        ("ScaleInCooldown",
          (option_to_yojson integerObject_to_yojson x.scaleInCooldown));
        ("DisableScaleIn",
          (option_to_yojson booleanObject_to_yojson x.disableScaleIn))]
    let autoScalingPolicyUpdate_to_yojson (x : autoScalingPolicyUpdate) =
      assoc_to_yojson
        [("TargetTrackingScalingPolicyConfiguration",
           ((Some
               ((autoScalingTargetTrackingScalingPolicyConfigurationUpdate_to_yojson
                   x.targetTrackingScalingPolicyConfiguration)))
           [@explicit_arity ]));
        ("PolicyName",
          (option_to_yojson autoScalingPolicyName_to_yojson x.policyName))]
    let autoScalingSettingsUpdate_to_yojson (x : autoScalingSettingsUpdate) =
      assoc_to_yojson
        [("ScalingPolicyUpdate",
           (option_to_yojson autoScalingPolicyUpdate_to_yojson
              x.scalingPolicyUpdate));
        ("AutoScalingRoleArn",
          (option_to_yojson autoScalingRoleArn_to_yojson x.autoScalingRoleArn));
        ("AutoScalingDisabled",
          (option_to_yojson booleanObject_to_yojson x.autoScalingDisabled));
        ("MaximumUnits",
          (option_to_yojson positiveLongObject_to_yojson x.maximumUnits));
        ("MinimumUnits",
          (option_to_yojson positiveLongObject_to_yojson x.minimumUnits))]
    let globalSecondaryIndexAutoScalingUpdate_to_yojson
      (x : globalSecondaryIndexAutoScalingUpdate) =
      assoc_to_yojson
        [("ProvisionedWriteCapacityAutoScalingUpdate",
           (option_to_yojson autoScalingSettingsUpdate_to_yojson
              x.provisionedWriteCapacityAutoScalingUpdate));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName))]
    let globalSecondaryIndexAutoScalingUpdateList_to_yojson x =
      list_to_yojson globalSecondaryIndexAutoScalingUpdate_to_yojson x
    let replicaGlobalSecondaryIndexAutoScalingUpdate_to_yojson
      (x : replicaGlobalSecondaryIndexAutoScalingUpdate) =
      assoc_to_yojson
        [("ProvisionedReadCapacityAutoScalingUpdate",
           (option_to_yojson autoScalingSettingsUpdate_to_yojson
              x.provisionedReadCapacityAutoScalingUpdate));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName))]
    let replicaGlobalSecondaryIndexAutoScalingUpdateList_to_yojson x =
      list_to_yojson replicaGlobalSecondaryIndexAutoScalingUpdate_to_yojson x
    let replicaAutoScalingUpdate_to_yojson (x : replicaAutoScalingUpdate) =
      assoc_to_yojson
        [("ReplicaProvisionedReadCapacityAutoScalingUpdate",
           (option_to_yojson autoScalingSettingsUpdate_to_yojson
              x.replicaProvisionedReadCapacityAutoScalingUpdate));
        ("ReplicaGlobalSecondaryIndexUpdates",
          (option_to_yojson
             replicaGlobalSecondaryIndexAutoScalingUpdateList_to_yojson
             x.replicaGlobalSecondaryIndexUpdates));
        ("RegionName", ((Some ((regionName_to_yojson x.regionName)))
          [@explicit_arity ]))]
    let replicaAutoScalingUpdateList_to_yojson x =
      list_to_yojson replicaAutoScalingUpdate_to_yojson x
    let updateTableReplicaAutoScalingInput_to_yojson
      (x : updateTableReplicaAutoScalingInput) =
      assoc_to_yojson
        [("ReplicaUpdates",
           (option_to_yojson replicaAutoScalingUpdateList_to_yojson
              x.replicaUpdates));
        ("ProvisionedWriteCapacityAutoScalingUpdate",
          (option_to_yojson autoScalingSettingsUpdate_to_yojson
             x.provisionedWriteCapacityAutoScalingUpdate));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]));
        ("GlobalSecondaryIndexUpdates",
          (option_to_yojson
             globalSecondaryIndexAutoScalingUpdateList_to_yojson
             x.globalSecondaryIndexUpdates))]
    let keySchemaAttributeName_to_yojson = string_to_yojson
    let scalarAttributeType_to_yojson (x : scalarAttributeType) =
      match x with | S -> `String "S" | N -> `String "N" | B -> `String "B"
    let attributeDefinition_to_yojson (x : attributeDefinition) =
      assoc_to_yojson
        [("AttributeType",
           ((Some ((scalarAttributeType_to_yojson x.attributeType)))
           [@explicit_arity ]));
        ("AttributeName",
          ((Some ((keySchemaAttributeName_to_yojson x.attributeName)))
          [@explicit_arity ]))]
    let attributeDefinitions_to_yojson x =
      list_to_yojson attributeDefinition_to_yojson x
    let keyType_to_yojson (x : keyType) =
      match x with | HASH -> `String "HASH" | RANGE -> `String "RANGE"
    let keySchemaElement_to_yojson (x : keySchemaElement) =
      assoc_to_yojson
        [("KeyType", ((Some ((keyType_to_yojson x.keyType)))
           [@explicit_arity ]));
        ("AttributeName",
          ((Some ((keySchemaAttributeName_to_yojson x.attributeName)))
          [@explicit_arity ]))]
    let keySchema_to_yojson x = list_to_yojson keySchemaElement_to_yojson x
    let date_to_yojson = timestamp_to_yojson
    let nonNegativeLongObject_to_yojson = long_to_yojson
    let provisionedThroughputDescription_to_yojson
      (x : provisionedThroughputDescription) =
      assoc_to_yojson
        [("WriteCapacityUnits",
           (option_to_yojson nonNegativeLongObject_to_yojson
              x.writeCapacityUnits));
        ("ReadCapacityUnits",
          (option_to_yojson nonNegativeLongObject_to_yojson
             x.readCapacityUnits));
        ("NumberOfDecreasesToday",
          (option_to_yojson positiveLongObject_to_yojson
             x.numberOfDecreasesToday));
        ("LastDecreaseDateTime",
          (option_to_yojson date_to_yojson x.lastDecreaseDateTime));
        ("LastIncreaseDateTime",
          (option_to_yojson date_to_yojson x.lastIncreaseDateTime))]
    let long_to_yojson = long_to_yojson
    let tableId_to_yojson = string_to_yojson
    let billingMode_to_yojson (x : billingMode) =
      match x with
      | PROVISIONED -> `String "PROVISIONED"
      | PAY_PER_REQUEST -> `String "PAY_PER_REQUEST"
    let billingModeSummary_to_yojson (x : billingModeSummary) =
      assoc_to_yojson
        [("LastUpdateToPayPerRequestDateTime",
           (option_to_yojson date_to_yojson
              x.lastUpdateToPayPerRequestDateTime));
        ("BillingMode",
          (option_to_yojson billingMode_to_yojson x.billingMode))]
    let projectionType_to_yojson (x : projectionType) =
      match x with
      | ALL -> `String "ALL"
      | KEYS_ONLY -> `String "KEYS_ONLY"
      | INCLUDE -> `String "INCLUDE"
    let nonKeyAttributeName_to_yojson = string_to_yojson
    let nonKeyAttributeNameList_to_yojson x =
      list_to_yojson nonKeyAttributeName_to_yojson x
    let projection_to_yojson (x : projection) =
      assoc_to_yojson
        [("NonKeyAttributes",
           (option_to_yojson nonKeyAttributeNameList_to_yojson
              x.nonKeyAttributes));
        ("ProjectionType",
          (option_to_yojson projectionType_to_yojson x.projectionType))]
    let localSecondaryIndexDescription_to_yojson
      (x : localSecondaryIndexDescription) =
      assoc_to_yojson
        [("IndexArn", (option_to_yojson string_to_yojson x.indexArn));
        ("ItemCount", (option_to_yojson long_to_yojson x.itemCount));
        ("IndexSizeBytes",
          (option_to_yojson long_to_yojson x.indexSizeBytes));
        ("Projection", (option_to_yojson projection_to_yojson x.projection));
        ("KeySchema", (option_to_yojson keySchema_to_yojson x.keySchema));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName))]
    let localSecondaryIndexDescriptionList_to_yojson x =
      list_to_yojson localSecondaryIndexDescription_to_yojson x
    let backfilling_to_yojson = bool_to_yojson
    let globalSecondaryIndexDescription_to_yojson
      (x : globalSecondaryIndexDescription) =
      assoc_to_yojson
        [("IndexArn", (option_to_yojson string_to_yojson x.indexArn));
        ("ItemCount", (option_to_yojson long_to_yojson x.itemCount));
        ("IndexSizeBytes",
          (option_to_yojson long_to_yojson x.indexSizeBytes));
        ("ProvisionedThroughput",
          (option_to_yojson provisionedThroughputDescription_to_yojson
             x.provisionedThroughput));
        ("Backfilling",
          (option_to_yojson backfilling_to_yojson x.backfilling));
        ("IndexStatus",
          (option_to_yojson indexStatus_to_yojson x.indexStatus));
        ("Projection", (option_to_yojson projection_to_yojson x.projection));
        ("KeySchema", (option_to_yojson keySchema_to_yojson x.keySchema));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName))]
    let globalSecondaryIndexDescriptionList_to_yojson x =
      list_to_yojson globalSecondaryIndexDescription_to_yojson x
    let streamEnabled_to_yojson = bool_to_yojson
    let streamViewType_to_yojson (x : streamViewType) =
      match x with
      | NEW_IMAGE -> `String "NEW_IMAGE"
      | OLD_IMAGE -> `String "OLD_IMAGE"
      | NEW_AND_OLD_IMAGES -> `String "NEW_AND_OLD_IMAGES"
      | KEYS_ONLY -> `String "KEYS_ONLY"
    let streamSpecification_to_yojson (x : streamSpecification) =
      assoc_to_yojson
        [("StreamViewType",
           (option_to_yojson streamViewType_to_yojson x.streamViewType));
        ("StreamEnabled", ((Some ((streamEnabled_to_yojson x.streamEnabled)))
          [@explicit_arity ]))]
    let streamArn_to_yojson = string_to_yojson
    let replicaStatusDescription_to_yojson = string_to_yojson
    let replicaStatusPercentProgress_to_yojson = string_to_yojson
    let kmsmasterKeyId_to_yojson = string_to_yojson
    let provisionedThroughputOverride_to_yojson
      (x : provisionedThroughputOverride) =
      assoc_to_yojson
        [("ReadCapacityUnits",
           (option_to_yojson positiveLongObject_to_yojson x.readCapacityUnits))]
    let replicaGlobalSecondaryIndexDescription_to_yojson
      (x : replicaGlobalSecondaryIndexDescription) =
      assoc_to_yojson
        [("ProvisionedThroughputOverride",
           (option_to_yojson provisionedThroughputOverride_to_yojson
              x.provisionedThroughputOverride));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName))]
    let replicaGlobalSecondaryIndexDescriptionList_to_yojson x =
      list_to_yojson replicaGlobalSecondaryIndexDescription_to_yojson x
    let replicaDescription_to_yojson (x : replicaDescription) =
      assoc_to_yojson
        [("ReplicaInaccessibleDateTime",
           (option_to_yojson date_to_yojson x.replicaInaccessibleDateTime));
        ("GlobalSecondaryIndexes",
          (option_to_yojson
             replicaGlobalSecondaryIndexDescriptionList_to_yojson
             x.globalSecondaryIndexes));
        ("ProvisionedThroughputOverride",
          (option_to_yojson provisionedThroughputOverride_to_yojson
             x.provisionedThroughputOverride));
        ("KMSMasterKeyId",
          (option_to_yojson kmsmasterKeyId_to_yojson x.kmsmasterKeyId));
        ("ReplicaStatusPercentProgress",
          (option_to_yojson replicaStatusPercentProgress_to_yojson
             x.replicaStatusPercentProgress));
        ("ReplicaStatusDescription",
          (option_to_yojson replicaStatusDescription_to_yojson
             x.replicaStatusDescription));
        ("ReplicaStatus",
          (option_to_yojson replicaStatus_to_yojson x.replicaStatus));
        ("RegionName", (option_to_yojson regionName_to_yojson x.regionName))]
    let replicaDescriptionList_to_yojson x =
      list_to_yojson replicaDescription_to_yojson x
    let backupArn_to_yojson = string_to_yojson
    let tableArn_to_yojson = string_to_yojson
    let restoreInProgress_to_yojson = bool_to_yojson
    let restoreSummary_to_yojson (x : restoreSummary) =
      assoc_to_yojson
        [("RestoreInProgress",
           ((Some ((restoreInProgress_to_yojson x.restoreInProgress)))
           [@explicit_arity ]));
        ("RestoreDateTime", ((Some ((date_to_yojson x.restoreDateTime)))
          [@explicit_arity ]));
        ("SourceTableArn",
          (option_to_yojson tableArn_to_yojson x.sourceTableArn));
        ("SourceBackupArn",
          (option_to_yojson backupArn_to_yojson x.sourceBackupArn))]
    let ssestatus_to_yojson (x : ssestatus) =
      match x with
      | ENABLING -> `String "ENABLING"
      | ENABLED -> `String "ENABLED"
      | DISABLING -> `String "DISABLING"
      | DISABLED -> `String "DISABLED"
      | UPDATING -> `String "UPDATING"
    let ssetype_to_yojson (x : ssetype) =
      match x with | AES256 -> `String "AES256" | KMS -> `String "KMS"
    let kmsmasterKeyArn_to_yojson = string_to_yojson
    let ssedescription_to_yojson (x : ssedescription) =
      assoc_to_yojson
        [("InaccessibleEncryptionDateTime",
           (option_to_yojson date_to_yojson x.inaccessibleEncryptionDateTime));
        ("KMSMasterKeyArn",
          (option_to_yojson kmsmasterKeyArn_to_yojson x.kmsmasterKeyArn));
        ("SSEType", (option_to_yojson ssetype_to_yojson x.ssetype));
        ("Status", (option_to_yojson ssestatus_to_yojson x.status))]
    let archivalReason_to_yojson = string_to_yojson
    let archivalSummary_to_yojson (x : archivalSummary) =
      assoc_to_yojson
        [("ArchivalBackupArn",
           (option_to_yojson backupArn_to_yojson x.archivalBackupArn));
        ("ArchivalReason",
          (option_to_yojson archivalReason_to_yojson x.archivalReason));
        ("ArchivalDateTime",
          (option_to_yojson date_to_yojson x.archivalDateTime))]
    let tableDescription_to_yojson (x : tableDescription) =
      assoc_to_yojson
        [("ArchivalSummary",
           (option_to_yojson archivalSummary_to_yojson x.archivalSummary));
        ("SSEDescription",
          (option_to_yojson ssedescription_to_yojson x.ssedescription));
        ("RestoreSummary",
          (option_to_yojson restoreSummary_to_yojson x.restoreSummary));
        ("Replicas",
          (option_to_yojson replicaDescriptionList_to_yojson x.replicas));
        ("GlobalTableVersion",
          (option_to_yojson string_to_yojson x.globalTableVersion));
        ("LatestStreamArn",
          (option_to_yojson streamArn_to_yojson x.latestStreamArn));
        ("LatestStreamLabel",
          (option_to_yojson string_to_yojson x.latestStreamLabel));
        ("StreamSpecification",
          (option_to_yojson streamSpecification_to_yojson
             x.streamSpecification));
        ("GlobalSecondaryIndexes",
          (option_to_yojson globalSecondaryIndexDescriptionList_to_yojson
             x.globalSecondaryIndexes));
        ("LocalSecondaryIndexes",
          (option_to_yojson localSecondaryIndexDescriptionList_to_yojson
             x.localSecondaryIndexes));
        ("BillingModeSummary",
          (option_to_yojson billingModeSummary_to_yojson x.billingModeSummary));
        ("TableId", (option_to_yojson tableId_to_yojson x.tableId));
        ("TableArn", (option_to_yojson string_to_yojson x.tableArn));
        ("ItemCount", (option_to_yojson long_to_yojson x.itemCount));
        ("TableSizeBytes",
          (option_to_yojson long_to_yojson x.tableSizeBytes));
        ("ProvisionedThroughput",
          (option_to_yojson provisionedThroughputDescription_to_yojson
             x.provisionedThroughput));
        ("CreationDateTime",
          (option_to_yojson date_to_yojson x.creationDateTime));
        ("TableStatus",
          (option_to_yojson tableStatus_to_yojson x.tableStatus));
        ("KeySchema", (option_to_yojson keySchema_to_yojson x.keySchema));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName));
        ("AttributeDefinitions",
          (option_to_yojson attributeDefinitions_to_yojson
             x.attributeDefinitions))]
    let updateTableOutput_to_yojson (x : updateTableOutput) =
      assoc_to_yojson
        [("TableDescription",
           (option_to_yojson tableDescription_to_yojson x.tableDescription))]
    let provisionedThroughput_to_yojson (x : provisionedThroughput) =
      assoc_to_yojson
        [("WriteCapacityUnits",
           ((Some ((positiveLongObject_to_yojson x.writeCapacityUnits)))
           [@explicit_arity ]));
        ("ReadCapacityUnits",
          ((Some ((positiveLongObject_to_yojson x.readCapacityUnits)))
          [@explicit_arity ]))]
    let updateGlobalSecondaryIndexAction_to_yojson
      (x : updateGlobalSecondaryIndexAction) =
      assoc_to_yojson
        [("ProvisionedThroughput",
           ((Some ((provisionedThroughput_to_yojson x.provisionedThroughput)))
           [@explicit_arity ]));
        ("IndexName", ((Some ((indexName_to_yojson x.indexName)))
          [@explicit_arity ]))]
    let createGlobalSecondaryIndexAction_to_yojson
      (x : createGlobalSecondaryIndexAction) =
      assoc_to_yojson
        [("ProvisionedThroughput",
           (option_to_yojson provisionedThroughput_to_yojson
              x.provisionedThroughput));
        ("Projection", ((Some ((projection_to_yojson x.projection)))
          [@explicit_arity ]));
        ("KeySchema", ((Some ((keySchema_to_yojson x.keySchema)))
          [@explicit_arity ]));
        ("IndexName", ((Some ((indexName_to_yojson x.indexName)))
          [@explicit_arity ]))]
    let deleteGlobalSecondaryIndexAction_to_yojson
      (x : deleteGlobalSecondaryIndexAction) =
      assoc_to_yojson
        [("IndexName", ((Some ((indexName_to_yojson x.indexName)))
           [@explicit_arity ]))]
    let globalSecondaryIndexUpdate_to_yojson (x : globalSecondaryIndexUpdate)
      =
      assoc_to_yojson
        [("Delete",
           (option_to_yojson deleteGlobalSecondaryIndexAction_to_yojson
              x.delete));
        ("Create",
          (option_to_yojson createGlobalSecondaryIndexAction_to_yojson
             x.create));
        ("Update",
          (option_to_yojson updateGlobalSecondaryIndexAction_to_yojson
             x.update))]
    let globalSecondaryIndexUpdateList_to_yojson x =
      list_to_yojson globalSecondaryIndexUpdate_to_yojson x
    let sseenabled_to_yojson = bool_to_yojson
    let ssespecification_to_yojson (x : ssespecification) =
      assoc_to_yojson
        [("KMSMasterKeyId",
           (option_to_yojson kmsmasterKeyId_to_yojson x.kmsmasterKeyId));
        ("SSEType", (option_to_yojson ssetype_to_yojson x.ssetype));
        ("Enabled", (option_to_yojson sseenabled_to_yojson x.enabled))]
    let replicaGlobalSecondaryIndex_to_yojson
      (x : replicaGlobalSecondaryIndex) =
      assoc_to_yojson
        [("ProvisionedThroughputOverride",
           (option_to_yojson provisionedThroughputOverride_to_yojson
              x.provisionedThroughputOverride));
        ("IndexName", ((Some ((indexName_to_yojson x.indexName)))
          [@explicit_arity ]))]
    let replicaGlobalSecondaryIndexList_to_yojson x =
      list_to_yojson replicaGlobalSecondaryIndex_to_yojson x
    let createReplicationGroupMemberAction_to_yojson
      (x : createReplicationGroupMemberAction) =
      assoc_to_yojson
        [("GlobalSecondaryIndexes",
           (option_to_yojson replicaGlobalSecondaryIndexList_to_yojson
              x.globalSecondaryIndexes));
        ("ProvisionedThroughputOverride",
          (option_to_yojson provisionedThroughputOverride_to_yojson
             x.provisionedThroughputOverride));
        ("KMSMasterKeyId",
          (option_to_yojson kmsmasterKeyId_to_yojson x.kmsmasterKeyId));
        ("RegionName", ((Some ((regionName_to_yojson x.regionName)))
          [@explicit_arity ]))]
    let updateReplicationGroupMemberAction_to_yojson
      (x : updateReplicationGroupMemberAction) =
      assoc_to_yojson
        [("GlobalSecondaryIndexes",
           (option_to_yojson replicaGlobalSecondaryIndexList_to_yojson
              x.globalSecondaryIndexes));
        ("ProvisionedThroughputOverride",
          (option_to_yojson provisionedThroughputOverride_to_yojson
             x.provisionedThroughputOverride));
        ("KMSMasterKeyId",
          (option_to_yojson kmsmasterKeyId_to_yojson x.kmsmasterKeyId));
        ("RegionName", ((Some ((regionName_to_yojson x.regionName)))
          [@explicit_arity ]))]
    let deleteReplicationGroupMemberAction_to_yojson
      (x : deleteReplicationGroupMemberAction) =
      assoc_to_yojson
        [("RegionName", ((Some ((regionName_to_yojson x.regionName)))
           [@explicit_arity ]))]
    let replicationGroupUpdate_to_yojson (x : replicationGroupUpdate) =
      assoc_to_yojson
        [("Delete",
           (option_to_yojson deleteReplicationGroupMemberAction_to_yojson
              x.delete));
        ("Update",
          (option_to_yojson updateReplicationGroupMemberAction_to_yojson
             x.update));
        ("Create",
          (option_to_yojson createReplicationGroupMemberAction_to_yojson
             x.create))]
    let replicationGroupUpdateList_to_yojson x =
      list_to_yojson replicationGroupUpdate_to_yojson x
    let updateTableInput_to_yojson (x : updateTableInput) =
      assoc_to_yojson
        [("ReplicaUpdates",
           (option_to_yojson replicationGroupUpdateList_to_yojson
              x.replicaUpdates));
        ("SSESpecification",
          (option_to_yojson ssespecification_to_yojson x.ssespecification));
        ("StreamSpecification",
          (option_to_yojson streamSpecification_to_yojson
             x.streamSpecification));
        ("GlobalSecondaryIndexUpdates",
          (option_to_yojson globalSecondaryIndexUpdateList_to_yojson
             x.globalSecondaryIndexUpdates));
        ("ProvisionedThroughput",
          (option_to_yojson provisionedThroughput_to_yojson
             x.provisionedThroughput));
        ("BillingMode",
          (option_to_yojson billingMode_to_yojson x.billingMode));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]));
        ("AttributeDefinitions",
          (option_to_yojson attributeDefinitions_to_yojson
             x.attributeDefinitions))]
    let attributeMap_to_yojson x = map_to_yojson attributeValue_to_yojson x
    let consumedCapacityUnits_to_yojson = double_to_yojson
    let capacity_to_yojson (x : capacity) =
      assoc_to_yojson
        [("CapacityUnits",
           (option_to_yojson consumedCapacityUnits_to_yojson x.capacityUnits));
        ("WriteCapacityUnits",
          (option_to_yojson consumedCapacityUnits_to_yojson
             x.writeCapacityUnits));
        ("ReadCapacityUnits",
          (option_to_yojson consumedCapacityUnits_to_yojson
             x.readCapacityUnits))]
    let secondaryIndexesCapacityMap_to_yojson x =
      map_to_yojson capacity_to_yojson x
    let consumedCapacity_to_yojson (x : consumedCapacity) =
      assoc_to_yojson
        [("GlobalSecondaryIndexes",
           (option_to_yojson secondaryIndexesCapacityMap_to_yojson
              x.globalSecondaryIndexes));
        ("LocalSecondaryIndexes",
          (option_to_yojson secondaryIndexesCapacityMap_to_yojson
             x.localSecondaryIndexes));
        ("Table", (option_to_yojson capacity_to_yojson x.table));
        ("WriteCapacityUnits",
          (option_to_yojson consumedCapacityUnits_to_yojson
             x.writeCapacityUnits));
        ("ReadCapacityUnits",
          (option_to_yojson consumedCapacityUnits_to_yojson
             x.readCapacityUnits));
        ("CapacityUnits",
          (option_to_yojson consumedCapacityUnits_to_yojson x.capacityUnits));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName))]
    let itemCollectionKeyAttributeMap_to_yojson x =
      map_to_yojson attributeValue_to_yojson x
    let itemCollectionSizeEstimateBound_to_yojson = double_to_yojson
    let itemCollectionSizeEstimateRange_to_yojson x =
      list_to_yojson itemCollectionSizeEstimateBound_to_yojson x
    let itemCollectionMetrics_to_yojson (x : itemCollectionMetrics) =
      assoc_to_yojson
        [("SizeEstimateRangeGB",
           (option_to_yojson itemCollectionSizeEstimateRange_to_yojson
              x.sizeEstimateRangeGB));
        ("ItemCollectionKey",
          (option_to_yojson itemCollectionKeyAttributeMap_to_yojson
             x.itemCollectionKey))]
    let updateItemOutput_to_yojson (x : updateItemOutput) =
      assoc_to_yojson
        [("ItemCollectionMetrics",
           (option_to_yojson itemCollectionMetrics_to_yojson
              x.itemCollectionMetrics));
        ("ConsumedCapacity",
          (option_to_yojson consumedCapacity_to_yojson x.consumedCapacity));
        ("Attributes",
          (option_to_yojson attributeMap_to_yojson x.attributes))]
    let attributeAction_to_yojson (x : attributeAction) =
      match x with
      | ADD -> `String "ADD"
      | PUT -> `String "PUT"
      | DELETE -> `String "DELETE"
    let attributeValueUpdate_to_yojson (x : attributeValueUpdate) =
      assoc_to_yojson
        [("Action", (option_to_yojson attributeAction_to_yojson x.action));
        ("Value", (option_to_yojson attributeValue_to_yojson x.value))]
    let attributeUpdates_to_yojson x =
      map_to_yojson attributeValueUpdate_to_yojson x
    let comparisonOperator_to_yojson (x : comparisonOperator) =
      match x with
      | EQ -> `String "EQ"
      | NE -> `String "NE"
      | IN -> `String "IN"
      | LE -> `String "LE"
      | LT -> `String "LT"
      | GE -> `String "GE"
      | GT -> `String "GT"
      | BETWEEN -> `String "BETWEEN"
      | NOT_NULL -> `String "NOT_NULL"
      | NULL -> `String "NULL"
      | CONTAINS -> `String "CONTAINS"
      | NOT_CONTAINS -> `String "NOT_CONTAINS"
      | BEGINS_WITH -> `String "BEGINS_WITH"
    let attributeValueList_to_yojson x =
      list_to_yojson attributeValue_to_yojson x
    let expectedAttributeValue_to_yojson (x : expectedAttributeValue) =
      assoc_to_yojson
        [("AttributeValueList",
           (option_to_yojson attributeValueList_to_yojson
              x.attributeValueList));
        ("ComparisonOperator",
          (option_to_yojson comparisonOperator_to_yojson x.comparisonOperator));
        ("Exists", (option_to_yojson booleanObject_to_yojson x.exists));
        ("Value", (option_to_yojson attributeValue_to_yojson x.value))]
    let expectedAttributeMap_to_yojson x =
      map_to_yojson expectedAttributeValue_to_yojson x
    let conditionalOperator_to_yojson (x : conditionalOperator) =
      match x with | AND -> `String "AND" | OR -> `String "OR"
    let returnValue_to_yojson (x : returnValue) =
      match x with
      | NONE -> `String "NONE"
      | ALL_OLD -> `String "ALL_OLD"
      | UPDATED_OLD -> `String "UPDATED_OLD"
      | ALL_NEW -> `String "ALL_NEW"
      | UPDATED_NEW -> `String "UPDATED_NEW"
    let returnConsumedCapacity_to_yojson (x : returnConsumedCapacity) =
      match x with
      | INDEXES -> `String "INDEXES"
      | TOTAL -> `String "TOTAL"
      | NONE -> `String "NONE"
    let returnItemCollectionMetrics_to_yojson
      (x : returnItemCollectionMetrics) =
      match x with | SIZE -> `String "SIZE" | NONE -> `String "NONE"
    let updateExpression_to_yojson = string_to_yojson
    let conditionExpression_to_yojson = string_to_yojson
    let expressionAttributeNameVariable_to_yojson = string_to_yojson
    let expressionAttributeNameMap_to_yojson x =
      map_to_yojson attributeName_to_yojson x
    let expressionAttributeValueVariable_to_yojson = string_to_yojson
    let expressionAttributeValueMap_to_yojson x =
      map_to_yojson attributeValue_to_yojson x
    let updateItemInput_to_yojson (x : updateItemInput) =
      assoc_to_yojson
        [("ExpressionAttributeValues",
           (option_to_yojson expressionAttributeValueMap_to_yojson
              x.expressionAttributeValues));
        ("ExpressionAttributeNames",
          (option_to_yojson expressionAttributeNameMap_to_yojson
             x.expressionAttributeNames));
        ("ConditionExpression",
          (option_to_yojson conditionExpression_to_yojson
             x.conditionExpression));
        ("UpdateExpression",
          (option_to_yojson updateExpression_to_yojson x.updateExpression));
        ("ReturnItemCollectionMetrics",
          (option_to_yojson returnItemCollectionMetrics_to_yojson
             x.returnItemCollectionMetrics));
        ("ReturnConsumedCapacity",
          (option_to_yojson returnConsumedCapacity_to_yojson
             x.returnConsumedCapacity));
        ("ReturnValues",
          (option_to_yojson returnValue_to_yojson x.returnValues));
        ("ConditionalOperator",
          (option_to_yojson conditionalOperator_to_yojson
             x.conditionalOperator));
        ("Expected",
          (option_to_yojson expectedAttributeMap_to_yojson x.expected));
        ("AttributeUpdates",
          (option_to_yojson attributeUpdates_to_yojson x.attributeUpdates));
        ("Key", ((Some ((key_to_yojson x.key)))[@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let replicaGlobalSecondaryIndexSettingsDescription_to_yojson
      (x : replicaGlobalSecondaryIndexSettingsDescription) =
      assoc_to_yojson
        [("ProvisionedWriteCapacityAutoScalingSettings",
           (option_to_yojson autoScalingSettingsDescription_to_yojson
              x.provisionedWriteCapacityAutoScalingSettings));
        ("ProvisionedWriteCapacityUnits",
          (option_to_yojson positiveLongObject_to_yojson
             x.provisionedWriteCapacityUnits));
        ("ProvisionedReadCapacityAutoScalingSettings",
          (option_to_yojson autoScalingSettingsDescription_to_yojson
             x.provisionedReadCapacityAutoScalingSettings));
        ("ProvisionedReadCapacityUnits",
          (option_to_yojson positiveLongObject_to_yojson
             x.provisionedReadCapacityUnits));
        ("IndexStatus",
          (option_to_yojson indexStatus_to_yojson x.indexStatus));
        ("IndexName", ((Some ((indexName_to_yojson x.indexName)))
          [@explicit_arity ]))]
    let replicaGlobalSecondaryIndexSettingsDescriptionList_to_yojson x =
      list_to_yojson replicaGlobalSecondaryIndexSettingsDescription_to_yojson
        x
    let replicaSettingsDescription_to_yojson (x : replicaSettingsDescription)
      =
      assoc_to_yojson
        [("ReplicaGlobalSecondaryIndexSettings",
           (option_to_yojson
              replicaGlobalSecondaryIndexSettingsDescriptionList_to_yojson
              x.replicaGlobalSecondaryIndexSettings));
        ("ReplicaProvisionedWriteCapacityAutoScalingSettings",
          (option_to_yojson autoScalingSettingsDescription_to_yojson
             x.replicaProvisionedWriteCapacityAutoScalingSettings));
        ("ReplicaProvisionedWriteCapacityUnits",
          (option_to_yojson nonNegativeLongObject_to_yojson
             x.replicaProvisionedWriteCapacityUnits));
        ("ReplicaProvisionedReadCapacityAutoScalingSettings",
          (option_to_yojson autoScalingSettingsDescription_to_yojson
             x.replicaProvisionedReadCapacityAutoScalingSettings));
        ("ReplicaProvisionedReadCapacityUnits",
          (option_to_yojson nonNegativeLongObject_to_yojson
             x.replicaProvisionedReadCapacityUnits));
        ("ReplicaBillingModeSummary",
          (option_to_yojson billingModeSummary_to_yojson
             x.replicaBillingModeSummary));
        ("ReplicaStatus",
          (option_to_yojson replicaStatus_to_yojson x.replicaStatus));
        ("RegionName", ((Some ((regionName_to_yojson x.regionName)))
          [@explicit_arity ]))]
    let replicaSettingsDescriptionList_to_yojson x =
      list_to_yojson replicaSettingsDescription_to_yojson x
    let updateGlobalTableSettingsOutput_to_yojson
      (x : updateGlobalTableSettingsOutput) =
      assoc_to_yojson
        [("ReplicaSettings",
           (option_to_yojson replicaSettingsDescriptionList_to_yojson
              x.replicaSettings));
        ("GlobalTableName",
          (option_to_yojson tableName_to_yojson x.globalTableName))]
    let globalTableGlobalSecondaryIndexSettingsUpdate_to_yojson
      (x : globalTableGlobalSecondaryIndexSettingsUpdate) =
      assoc_to_yojson
        [("ProvisionedWriteCapacityAutoScalingSettingsUpdate",
           (option_to_yojson autoScalingSettingsUpdate_to_yojson
              x.provisionedWriteCapacityAutoScalingSettingsUpdate));
        ("ProvisionedWriteCapacityUnits",
          (option_to_yojson positiveLongObject_to_yojson
             x.provisionedWriteCapacityUnits));
        ("IndexName", ((Some ((indexName_to_yojson x.indexName)))
          [@explicit_arity ]))]
    let globalTableGlobalSecondaryIndexSettingsUpdateList_to_yojson x =
      list_to_yojson globalTableGlobalSecondaryIndexSettingsUpdate_to_yojson
        x
    let replicaGlobalSecondaryIndexSettingsUpdate_to_yojson
      (x : replicaGlobalSecondaryIndexSettingsUpdate) =
      assoc_to_yojson
        [("ProvisionedReadCapacityAutoScalingSettingsUpdate",
           (option_to_yojson autoScalingSettingsUpdate_to_yojson
              x.provisionedReadCapacityAutoScalingSettingsUpdate));
        ("ProvisionedReadCapacityUnits",
          (option_to_yojson positiveLongObject_to_yojson
             x.provisionedReadCapacityUnits));
        ("IndexName", ((Some ((indexName_to_yojson x.indexName)))
          [@explicit_arity ]))]
    let replicaGlobalSecondaryIndexSettingsUpdateList_to_yojson x =
      list_to_yojson replicaGlobalSecondaryIndexSettingsUpdate_to_yojson x
    let replicaSettingsUpdate_to_yojson (x : replicaSettingsUpdate) =
      assoc_to_yojson
        [("ReplicaGlobalSecondaryIndexSettingsUpdate",
           (option_to_yojson
              replicaGlobalSecondaryIndexSettingsUpdateList_to_yojson
              x.replicaGlobalSecondaryIndexSettingsUpdate));
        ("ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate",
          (option_to_yojson autoScalingSettingsUpdate_to_yojson
             x.replicaProvisionedReadCapacityAutoScalingSettingsUpdate));
        ("ReplicaProvisionedReadCapacityUnits",
          (option_to_yojson positiveLongObject_to_yojson
             x.replicaProvisionedReadCapacityUnits));
        ("RegionName", ((Some ((regionName_to_yojson x.regionName)))
          [@explicit_arity ]))]
    let replicaSettingsUpdateList_to_yojson x =
      list_to_yojson replicaSettingsUpdate_to_yojson x
    let updateGlobalTableSettingsInput_to_yojson
      (x : updateGlobalTableSettingsInput) =
      assoc_to_yojson
        [("ReplicaSettingsUpdate",
           (option_to_yojson replicaSettingsUpdateList_to_yojson
              x.replicaSettingsUpdate));
        ("GlobalTableGlobalSecondaryIndexSettingsUpdate",
          (option_to_yojson
             globalTableGlobalSecondaryIndexSettingsUpdateList_to_yojson
             x.globalTableGlobalSecondaryIndexSettingsUpdate));
        ("GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate",
          (option_to_yojson autoScalingSettingsUpdate_to_yojson
             x.globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate));
        ("GlobalTableProvisionedWriteCapacityUnits",
          (option_to_yojson positiveLongObject_to_yojson
             x.globalTableProvisionedWriteCapacityUnits));
        ("GlobalTableBillingMode",
          (option_to_yojson billingMode_to_yojson x.globalTableBillingMode));
        ("GlobalTableName", ((Some ((tableName_to_yojson x.globalTableName)))
          [@explicit_arity ]))]
    let globalTableArnString_to_yojson = string_to_yojson
    let globalTableStatus_to_yojson (x : globalTableStatus) =
      match x with
      | CREATING -> `String "CREATING"
      | ACTIVE -> `String "ACTIVE"
      | DELETING -> `String "DELETING"
      | UPDATING -> `String "UPDATING"
    let globalTableDescription_to_yojson (x : globalTableDescription) =
      assoc_to_yojson
        [("GlobalTableName",
           (option_to_yojson tableName_to_yojson x.globalTableName));
        ("GlobalTableStatus",
          (option_to_yojson globalTableStatus_to_yojson x.globalTableStatus));
        ("CreationDateTime",
          (option_to_yojson date_to_yojson x.creationDateTime));
        ("GlobalTableArn",
          (option_to_yojson globalTableArnString_to_yojson x.globalTableArn));
        ("ReplicationGroup",
          (option_to_yojson replicaDescriptionList_to_yojson
             x.replicationGroup))]
    let updateGlobalTableOutput_to_yojson (x : updateGlobalTableOutput) =
      assoc_to_yojson
        [("GlobalTableDescription",
           (option_to_yojson globalTableDescription_to_yojson
              x.globalTableDescription))]
    let createReplicaAction_to_yojson (x : createReplicaAction) =
      assoc_to_yojson
        [("RegionName", ((Some ((regionName_to_yojson x.regionName)))
           [@explicit_arity ]))]
    let deleteReplicaAction_to_yojson (x : deleteReplicaAction) =
      assoc_to_yojson
        [("RegionName", ((Some ((regionName_to_yojson x.regionName)))
           [@explicit_arity ]))]
    let replicaUpdate_to_yojson (x : replicaUpdate) =
      assoc_to_yojson
        [("Delete",
           (option_to_yojson deleteReplicaAction_to_yojson x.delete));
        ("Create", (option_to_yojson createReplicaAction_to_yojson x.create))]
    let replicaUpdateList_to_yojson x =
      list_to_yojson replicaUpdate_to_yojson x
    let updateGlobalTableInput_to_yojson (x : updateGlobalTableInput) =
      assoc_to_yojson
        [("ReplicaUpdates",
           ((Some ((replicaUpdateList_to_yojson x.replicaUpdates)))
           [@explicit_arity ]));
        ("GlobalTableName", ((Some ((tableName_to_yojson x.globalTableName)))
          [@explicit_arity ]))]
    let contributorInsightsStatus_to_yojson (x : contributorInsightsStatus) =
      match x with
      | ENABLING -> `String "ENABLING"
      | ENABLED -> `String "ENABLED"
      | DISABLING -> `String "DISABLING"
      | DISABLED -> `String "DISABLED"
      | FAILED -> `String "FAILED"
    let updateContributorInsightsOutput_to_yojson
      (x : updateContributorInsightsOutput) =
      assoc_to_yojson
        [("ContributorInsightsStatus",
           (option_to_yojson contributorInsightsStatus_to_yojson
              x.contributorInsightsStatus));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName))]
    let contributorInsightsAction_to_yojson (x : contributorInsightsAction) =
      match x with
      | ENABLE -> `String "ENABLE"
      | DISABLE -> `String "DISABLE"
    let updateContributorInsightsInput_to_yojson
      (x : updateContributorInsightsInput) =
      assoc_to_yojson
        [("ContributorInsightsAction",
           ((Some
               ((contributorInsightsAction_to_yojson
                   x.contributorInsightsAction)))[@explicit_arity ]));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let continuousBackupsStatus_to_yojson (x : continuousBackupsStatus) =
      match x with
      | ENABLED -> `String "ENABLED"
      | DISABLED -> `String "DISABLED"
    let pointInTimeRecoveryStatus_to_yojson (x : pointInTimeRecoveryStatus) =
      match x with
      | ENABLED -> `String "ENABLED"
      | DISABLED -> `String "DISABLED"
    let pointInTimeRecoveryDescription_to_yojson
      (x : pointInTimeRecoveryDescription) =
      assoc_to_yojson
        [("LatestRestorableDateTime",
           (option_to_yojson date_to_yojson x.latestRestorableDateTime));
        ("EarliestRestorableDateTime",
          (option_to_yojson date_to_yojson x.earliestRestorableDateTime));
        ("PointInTimeRecoveryStatus",
          (option_to_yojson pointInTimeRecoveryStatus_to_yojson
             x.pointInTimeRecoveryStatus))]
    let continuousBackupsDescription_to_yojson
      (x : continuousBackupsDescription) =
      assoc_to_yojson
        [("PointInTimeRecoveryDescription",
           (option_to_yojson pointInTimeRecoveryDescription_to_yojson
              x.pointInTimeRecoveryDescription));
        ("ContinuousBackupsStatus",
          ((Some
              ((continuousBackupsStatus_to_yojson x.continuousBackupsStatus)))
          [@explicit_arity ]))]
    let updateContinuousBackupsOutput_to_yojson
      (x : updateContinuousBackupsOutput) =
      assoc_to_yojson
        [("ContinuousBackupsDescription",
           (option_to_yojson continuousBackupsDescription_to_yojson
              x.continuousBackupsDescription))]
    let pointInTimeRecoverySpecification_to_yojson
      (x : pointInTimeRecoverySpecification) =
      assoc_to_yojson
        [("PointInTimeRecoveryEnabled",
           ((Some ((booleanObject_to_yojson x.pointInTimeRecoveryEnabled)))
           [@explicit_arity ]))]
    let updateContinuousBackupsInput_to_yojson
      (x : updateContinuousBackupsInput) =
      assoc_to_yojson
        [("PointInTimeRecoverySpecification",
           ((Some
               ((pointInTimeRecoverySpecification_to_yojson
                   x.pointInTimeRecoverySpecification)))[@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let returnValuesOnConditionCheckFailure_to_yojson
      (x : returnValuesOnConditionCheckFailure) =
      match x with | ALL_OLD -> `String "ALL_OLD" | NONE -> `String "NONE"
    let update_to_yojson (x : update) =
      assoc_to_yojson
        [("ReturnValuesOnConditionCheckFailure",
           (option_to_yojson returnValuesOnConditionCheckFailure_to_yojson
              x.returnValuesOnConditionCheckFailure));
        ("ExpressionAttributeValues",
          (option_to_yojson expressionAttributeValueMap_to_yojson
             x.expressionAttributeValues));
        ("ExpressionAttributeNames",
          (option_to_yojson expressionAttributeNameMap_to_yojson
             x.expressionAttributeNames));
        ("ConditionExpression",
          (option_to_yojson conditionExpression_to_yojson
             x.conditionExpression));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]));
        ("UpdateExpression",
          ((Some ((updateExpression_to_yojson x.updateExpression)))
          [@explicit_arity ]));
        ("Key", ((Some ((key_to_yojson x.key)))[@explicit_arity ]))]
    let resourceArnString_to_yojson = string_to_yojson
    let tagKeyString_to_yojson = string_to_yojson
    let tagKeyList_to_yojson x = list_to_yojson tagKeyString_to_yojson x
    let untagResourceInput_to_yojson (x : untagResourceInput) =
      assoc_to_yojson
        [("TagKeys", ((Some ((tagKeyList_to_yojson x.tagKeys)))
           [@explicit_arity ]));
        ("ResourceArn", ((Some ((resourceArnString_to_yojson x.resourceArn)))
          [@explicit_arity ]))]
    let code_to_yojson = string_to_yojson
    let cancellationReason_to_yojson (x : cancellationReason) =
      assoc_to_yojson
        [("Message", (option_to_yojson errorMessage_to_yojson x.message));
        ("Code", (option_to_yojson code_to_yojson x.code));
        ("Item", (option_to_yojson attributeMap_to_yojson x.item))]
    let cancellationReasonList_to_yojson x =
      list_to_yojson cancellationReason_to_yojson x
    let consumedCapacityMultiple_to_yojson x =
      list_to_yojson consumedCapacity_to_yojson x
    let itemCollectionMetricsMultiple_to_yojson x =
      list_to_yojson itemCollectionMetrics_to_yojson x
    let itemCollectionMetricsPerTable_to_yojson x =
      map_to_yojson itemCollectionMetricsMultiple_to_yojson x
    let transactWriteItemsOutput_to_yojson (x : transactWriteItemsOutput) =
      assoc_to_yojson
        [("ItemCollectionMetrics",
           (option_to_yojson itemCollectionMetricsPerTable_to_yojson
              x.itemCollectionMetrics));
        ("ConsumedCapacity",
          (option_to_yojson consumedCapacityMultiple_to_yojson
             x.consumedCapacity))]
    let conditionCheck_to_yojson (x : conditionCheck) =
      assoc_to_yojson
        [("ReturnValuesOnConditionCheckFailure",
           (option_to_yojson returnValuesOnConditionCheckFailure_to_yojson
              x.returnValuesOnConditionCheckFailure));
        ("ExpressionAttributeValues",
          (option_to_yojson expressionAttributeValueMap_to_yojson
             x.expressionAttributeValues));
        ("ExpressionAttributeNames",
          (option_to_yojson expressionAttributeNameMap_to_yojson
             x.expressionAttributeNames));
        ("ConditionExpression",
          ((Some ((conditionExpression_to_yojson x.conditionExpression)))
          [@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]));
        ("Key", ((Some ((key_to_yojson x.key)))[@explicit_arity ]))]
    let put_to_yojson (x : put) =
      assoc_to_yojson
        [("ReturnValuesOnConditionCheckFailure",
           (option_to_yojson returnValuesOnConditionCheckFailure_to_yojson
              x.returnValuesOnConditionCheckFailure));
        ("ExpressionAttributeValues",
          (option_to_yojson expressionAttributeValueMap_to_yojson
             x.expressionAttributeValues));
        ("ExpressionAttributeNames",
          (option_to_yojson expressionAttributeNameMap_to_yojson
             x.expressionAttributeNames));
        ("ConditionExpression",
          (option_to_yojson conditionExpression_to_yojson
             x.conditionExpression));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]));
        ("Item", ((Some ((putItemInputAttributeMap_to_yojson x.item)))
          [@explicit_arity ]))]
    let delete_to_yojson (x : delete) =
      assoc_to_yojson
        [("ReturnValuesOnConditionCheckFailure",
           (option_to_yojson returnValuesOnConditionCheckFailure_to_yojson
              x.returnValuesOnConditionCheckFailure));
        ("ExpressionAttributeValues",
          (option_to_yojson expressionAttributeValueMap_to_yojson
             x.expressionAttributeValues));
        ("ExpressionAttributeNames",
          (option_to_yojson expressionAttributeNameMap_to_yojson
             x.expressionAttributeNames));
        ("ConditionExpression",
          (option_to_yojson conditionExpression_to_yojson
             x.conditionExpression));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]));
        ("Key", ((Some ((key_to_yojson x.key)))[@explicit_arity ]))]
    let transactWriteItem_to_yojson (x : transactWriteItem) =
      assoc_to_yojson
        [("Update", (option_to_yojson update_to_yojson x.update));
        ("Delete", (option_to_yojson delete_to_yojson x.delete));
        ("Put", (option_to_yojson put_to_yojson x.put));
        ("ConditionCheck",
          (option_to_yojson conditionCheck_to_yojson x.conditionCheck))]
    let transactWriteItemList_to_yojson x =
      list_to_yojson transactWriteItem_to_yojson x
    let clientRequestToken_to_yojson = string_to_yojson
    let transactWriteItemsInput_to_yojson (x : transactWriteItemsInput) =
      assoc_to_yojson
        [("ClientRequestToken",
           (option_to_yojson clientRequestToken_to_yojson
              x.clientRequestToken));
        ("ReturnItemCollectionMetrics",
          (option_to_yojson returnItemCollectionMetrics_to_yojson
             x.returnItemCollectionMetrics));
        ("ReturnConsumedCapacity",
          (option_to_yojson returnConsumedCapacity_to_yojson
             x.returnConsumedCapacity));
        ("TransactItems",
          ((Some ((transactWriteItemList_to_yojson x.transactItems)))
          [@explicit_arity ]))]
    let itemResponse_to_yojson (x : itemResponse) =
      assoc_to_yojson
        [("Item", (option_to_yojson attributeMap_to_yojson x.item))]
    let itemResponseList_to_yojson x =
      list_to_yojson itemResponse_to_yojson x
    let transactGetItemsOutput_to_yojson (x : transactGetItemsOutput) =
      assoc_to_yojson
        [("Responses",
           (option_to_yojson itemResponseList_to_yojson x.responses));
        ("ConsumedCapacity",
          (option_to_yojson consumedCapacityMultiple_to_yojson
             x.consumedCapacity))]
    let projectionExpression_to_yojson = string_to_yojson
    let get_to_yojson (x : get) =
      assoc_to_yojson
        [("ExpressionAttributeNames",
           (option_to_yojson expressionAttributeNameMap_to_yojson
              x.expressionAttributeNames));
        ("ProjectionExpression",
          (option_to_yojson projectionExpression_to_yojson
             x.projectionExpression));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]));
        ("Key", ((Some ((key_to_yojson x.key)))[@explicit_arity ]))]
    let transactGetItem_to_yojson (x : transactGetItem) =
      assoc_to_yojson
        [("Get", ((Some ((get_to_yojson x.get)))[@explicit_arity ]))]
    let transactGetItemList_to_yojson x =
      list_to_yojson transactGetItem_to_yojson x
    let transactGetItemsInput_to_yojson (x : transactGetItemsInput) =
      assoc_to_yojson
        [("ReturnConsumedCapacity",
           (option_to_yojson returnConsumedCapacity_to_yojson
              x.returnConsumedCapacity));
        ("TransactItems",
          ((Some ((transactGetItemList_to_yojson x.transactItems)))
          [@explicit_arity ]))]
    let timeToLiveStatus_to_yojson (x : timeToLiveStatus) =
      match x with
      | ENABLING -> `String "ENABLING"
      | DISABLING -> `String "DISABLING"
      | ENABLED -> `String "ENABLED"
      | DISABLED -> `String "DISABLED"
    let timeToLiveDescription_to_yojson (x : timeToLiveDescription) =
      assoc_to_yojson
        [("AttributeName",
           (option_to_yojson timeToLiveAttributeName_to_yojson
              x.attributeName));
        ("TimeToLiveStatus",
          (option_to_yojson timeToLiveStatus_to_yojson x.timeToLiveStatus))]
    let timeRangeUpperBound_to_yojson = timestamp_to_yojson
    let timeRangeLowerBound_to_yojson = timestamp_to_yojson
    let tagValueString_to_yojson = string_to_yojson
    let tag_to_yojson (x : tag) =
      assoc_to_yojson
        [("Value", ((Some ((tagValueString_to_yojson x.value)))
           [@explicit_arity ]));
        ("Key", ((Some ((tagKeyString_to_yojson x.key)))[@explicit_arity ]))]
    let tagList_to_yojson x = list_to_yojson tag_to_yojson x
    let tagResourceInput_to_yojson (x : tagResourceInput) =
      assoc_to_yojson
        [("Tags", ((Some ((tagList_to_yojson x.tags)))[@explicit_arity ]));
        ("ResourceArn", ((Some ((resourceArnString_to_yojson x.resourceArn)))
          [@explicit_arity ]))]
    let tableNameList_to_yojson x = list_to_yojson tableName_to_yojson x
    let tableCreationDateTime_to_yojson = timestamp_to_yojson
    let localSecondaryIndexInfo_to_yojson (x : localSecondaryIndexInfo) =
      assoc_to_yojson
        [("Projection", (option_to_yojson projection_to_yojson x.projection));
        ("KeySchema", (option_to_yojson keySchema_to_yojson x.keySchema));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName))]
    let localSecondaryIndexes_to_yojson x =
      list_to_yojson localSecondaryIndexInfo_to_yojson x
    let globalSecondaryIndexInfo_to_yojson (x : globalSecondaryIndexInfo) =
      assoc_to_yojson
        [("ProvisionedThroughput",
           (option_to_yojson provisionedThroughput_to_yojson
              x.provisionedThroughput));
        ("Projection", (option_to_yojson projection_to_yojson x.projection));
        ("KeySchema", (option_to_yojson keySchema_to_yojson x.keySchema));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName))]
    let globalSecondaryIndexes_to_yojson x =
      list_to_yojson globalSecondaryIndexInfo_to_yojson x
    let sourceTableFeatureDetails_to_yojson (x : sourceTableFeatureDetails) =
      assoc_to_yojson
        [("SSEDescription",
           (option_to_yojson ssedescription_to_yojson x.ssedescription));
        ("TimeToLiveDescription",
          (option_to_yojson timeToLiveDescription_to_yojson
             x.timeToLiveDescription));
        ("StreamDescription",
          (option_to_yojson streamSpecification_to_yojson x.streamDescription));
        ("GlobalSecondaryIndexes",
          (option_to_yojson globalSecondaryIndexes_to_yojson
             x.globalSecondaryIndexes));
        ("LocalSecondaryIndexes",
          (option_to_yojson localSecondaryIndexes_to_yojson
             x.localSecondaryIndexes))]
    let itemCount_to_yojson = long_to_yojson
    let sourceTableDetails_to_yojson (x : sourceTableDetails) =
      assoc_to_yojson
        [("BillingMode",
           (option_to_yojson billingMode_to_yojson x.billingMode));
        ("ItemCount", (option_to_yojson itemCount_to_yojson x.itemCount));
        ("ProvisionedThroughput",
          ((Some ((provisionedThroughput_to_yojson x.provisionedThroughput)))
          [@explicit_arity ]));
        ("TableCreationDateTime",
          ((Some ((tableCreationDateTime_to_yojson x.tableCreationDateTime)))
          [@explicit_arity ]));
        ("KeySchema", ((Some ((keySchema_to_yojson x.keySchema)))
          [@explicit_arity ]));
        ("TableSizeBytes",
          (option_to_yojson long_to_yojson x.tableSizeBytes));
        ("TableArn", (option_to_yojson tableArn_to_yojson x.tableArn));
        ("TableId", ((Some ((tableId_to_yojson x.tableId)))
          [@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let select_to_yojson (x : select) =
      match x with
      | ALL_ATTRIBUTES -> `String "ALL_ATTRIBUTES"
      | ALL_PROJECTED_ATTRIBUTES -> `String "ALL_PROJECTED_ATTRIBUTES"
      | SPECIFIC_ATTRIBUTES -> `String "SPECIFIC_ATTRIBUTES"
      | COUNT -> `String "COUNT"
    let scanTotalSegments_to_yojson = int_to_yojson
    let scanSegment_to_yojson = int_to_yojson
    let itemList_to_yojson x = list_to_yojson attributeMap_to_yojson x
    let integer_to_yojson = int_to_yojson
    let scanOutput_to_yojson (x : scanOutput) =
      assoc_to_yojson
        [("ConsumedCapacity",
           (option_to_yojson consumedCapacity_to_yojson x.consumedCapacity));
        ("LastEvaluatedKey",
          (option_to_yojson key_to_yojson x.lastEvaluatedKey));
        ("ScannedCount", (option_to_yojson integer_to_yojson x.scannedCount));
        ("Count", (option_to_yojson integer_to_yojson x.count));
        ("Items", (option_to_yojson itemList_to_yojson x.items))]
    let attributeNameList_to_yojson x =
      list_to_yojson attributeName_to_yojson x
    let positiveIntegerObject_to_yojson = int_to_yojson
    let condition_to_yojson (x : condition) =
      assoc_to_yojson
        [("ComparisonOperator",
           ((Some ((comparisonOperator_to_yojson x.comparisonOperator)))
           [@explicit_arity ]));
        ("AttributeValueList",
          (option_to_yojson attributeValueList_to_yojson x.attributeValueList))]
    let filterConditionMap_to_yojson x = map_to_yojson condition_to_yojson x
    let consistentRead_to_yojson = bool_to_yojson
    let scanInput_to_yojson (x : scanInput) =
      assoc_to_yojson
        [("ConsistentRead",
           (option_to_yojson consistentRead_to_yojson x.consistentRead));
        ("ExpressionAttributeValues",
          (option_to_yojson expressionAttributeValueMap_to_yojson
             x.expressionAttributeValues));
        ("ExpressionAttributeNames",
          (option_to_yojson expressionAttributeNameMap_to_yojson
             x.expressionAttributeNames));
        ("FilterExpression",
          (option_to_yojson conditionExpression_to_yojson x.filterExpression));
        ("ProjectionExpression",
          (option_to_yojson projectionExpression_to_yojson
             x.projectionExpression));
        ("Segment", (option_to_yojson scanSegment_to_yojson x.segment));
        ("TotalSegments",
          (option_to_yojson scanTotalSegments_to_yojson x.totalSegments));
        ("ReturnConsumedCapacity",
          (option_to_yojson returnConsumedCapacity_to_yojson
             x.returnConsumedCapacity));
        ("ExclusiveStartKey",
          (option_to_yojson key_to_yojson x.exclusiveStartKey));
        ("ConditionalOperator",
          (option_to_yojson conditionalOperator_to_yojson
             x.conditionalOperator));
        ("ScanFilter",
          (option_to_yojson filterConditionMap_to_yojson x.scanFilter));
        ("Select", (option_to_yojson select_to_yojson x.select));
        ("Limit", (option_to_yojson positiveIntegerObject_to_yojson x.limit));
        ("AttributesToGet",
          (option_to_yojson attributeNameList_to_yojson x.attributesToGet));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let s3SseKmsKeyId_to_yojson = string_to_yojson
    let s3SseAlgorithm_to_yojson (x : s3SseAlgorithm) =
      match x with | AES256 -> `String "AES256" | KMS -> `String "KMS"
    let s3Prefix_to_yojson = string_to_yojson
    let s3BucketOwner_to_yojson = string_to_yojson
    let s3Bucket_to_yojson = string_to_yojson
    let restoreTableToPointInTimeOutput_to_yojson
      (x : restoreTableToPointInTimeOutput) =
      assoc_to_yojson
        [("TableDescription",
           (option_to_yojson tableDescription_to_yojson x.tableDescription))]
    let globalSecondaryIndex_to_yojson (x : globalSecondaryIndex) =
      assoc_to_yojson
        [("ProvisionedThroughput",
           (option_to_yojson provisionedThroughput_to_yojson
              x.provisionedThroughput));
        ("Projection", ((Some ((projection_to_yojson x.projection)))
          [@explicit_arity ]));
        ("KeySchema", ((Some ((keySchema_to_yojson x.keySchema)))
          [@explicit_arity ]));
        ("IndexName", ((Some ((indexName_to_yojson x.indexName)))
          [@explicit_arity ]))]
    let globalSecondaryIndexList_to_yojson x =
      list_to_yojson globalSecondaryIndex_to_yojson x
    let localSecondaryIndex_to_yojson (x : localSecondaryIndex) =
      assoc_to_yojson
        [("Projection", ((Some ((projection_to_yojson x.projection)))
           [@explicit_arity ]));
        ("KeySchema", ((Some ((keySchema_to_yojson x.keySchema)))
          [@explicit_arity ]));
        ("IndexName", ((Some ((indexName_to_yojson x.indexName)))
          [@explicit_arity ]))]
    let localSecondaryIndexList_to_yojson x =
      list_to_yojson localSecondaryIndex_to_yojson x
    let restoreTableToPointInTimeInput_to_yojson
      (x : restoreTableToPointInTimeInput) =
      assoc_to_yojson
        [("SSESpecificationOverride",
           (option_to_yojson ssespecification_to_yojson
              x.ssespecificationOverride));
        ("ProvisionedThroughputOverride",
          (option_to_yojson provisionedThroughput_to_yojson
             x.provisionedThroughputOverride));
        ("LocalSecondaryIndexOverride",
          (option_to_yojson localSecondaryIndexList_to_yojson
             x.localSecondaryIndexOverride));
        ("GlobalSecondaryIndexOverride",
          (option_to_yojson globalSecondaryIndexList_to_yojson
             x.globalSecondaryIndexOverride));
        ("BillingModeOverride",
          (option_to_yojson billingMode_to_yojson x.billingModeOverride));
        ("RestoreDateTime",
          (option_to_yojson date_to_yojson x.restoreDateTime));
        ("UseLatestRestorableTime",
          (option_to_yojson booleanObject_to_yojson x.useLatestRestorableTime));
        ("TargetTableName", ((Some ((tableName_to_yojson x.targetTableName)))
          [@explicit_arity ]));
        ("SourceTableName",
          (option_to_yojson tableName_to_yojson x.sourceTableName));
        ("SourceTableArn",
          (option_to_yojson tableArn_to_yojson x.sourceTableArn))]
    let restoreTableFromBackupOutput_to_yojson
      (x : restoreTableFromBackupOutput) =
      assoc_to_yojson
        [("TableDescription",
           (option_to_yojson tableDescription_to_yojson x.tableDescription))]
    let restoreTableFromBackupInput_to_yojson
      (x : restoreTableFromBackupInput) =
      assoc_to_yojson
        [("SSESpecificationOverride",
           (option_to_yojson ssespecification_to_yojson
              x.ssespecificationOverride));
        ("ProvisionedThroughputOverride",
          (option_to_yojson provisionedThroughput_to_yojson
             x.provisionedThroughputOverride));
        ("LocalSecondaryIndexOverride",
          (option_to_yojson localSecondaryIndexList_to_yojson
             x.localSecondaryIndexOverride));
        ("GlobalSecondaryIndexOverride",
          (option_to_yojson globalSecondaryIndexList_to_yojson
             x.globalSecondaryIndexOverride));
        ("BillingModeOverride",
          (option_to_yojson billingMode_to_yojson x.billingModeOverride));
        ("BackupArn", ((Some ((backupArn_to_yojson x.backupArn)))
          [@explicit_arity ]));
        ("TargetTableName", ((Some ((tableName_to_yojson x.targetTableName)))
          [@explicit_arity ]))]
    let replica_to_yojson (x : replica) =
      assoc_to_yojson
        [("RegionName", (option_to_yojson regionName_to_yojson x.regionName))]
    let replicaList_to_yojson x = list_to_yojson replica_to_yojson x
    let queryOutput_to_yojson (x : queryOutput) =
      assoc_to_yojson
        [("ConsumedCapacity",
           (option_to_yojson consumedCapacity_to_yojson x.consumedCapacity));
        ("LastEvaluatedKey",
          (option_to_yojson key_to_yojson x.lastEvaluatedKey));
        ("ScannedCount", (option_to_yojson integer_to_yojson x.scannedCount));
        ("Count", (option_to_yojson integer_to_yojson x.count));
        ("Items", (option_to_yojson itemList_to_yojson x.items))]
    let keyConditions_to_yojson x = map_to_yojson condition_to_yojson x
    let keyExpression_to_yojson = string_to_yojson
    let queryInput_to_yojson (x : queryInput) =
      assoc_to_yojson
        [("ExpressionAttributeValues",
           (option_to_yojson expressionAttributeValueMap_to_yojson
              x.expressionAttributeValues));
        ("ExpressionAttributeNames",
          (option_to_yojson expressionAttributeNameMap_to_yojson
             x.expressionAttributeNames));
        ("KeyConditionExpression",
          (option_to_yojson keyExpression_to_yojson x.keyConditionExpression));
        ("FilterExpression",
          (option_to_yojson conditionExpression_to_yojson x.filterExpression));
        ("ProjectionExpression",
          (option_to_yojson projectionExpression_to_yojson
             x.projectionExpression));
        ("ReturnConsumedCapacity",
          (option_to_yojson returnConsumedCapacity_to_yojson
             x.returnConsumedCapacity));
        ("ExclusiveStartKey",
          (option_to_yojson key_to_yojson x.exclusiveStartKey));
        ("ScanIndexForward",
          (option_to_yojson booleanObject_to_yojson x.scanIndexForward));
        ("ConditionalOperator",
          (option_to_yojson conditionalOperator_to_yojson
             x.conditionalOperator));
        ("QueryFilter",
          (option_to_yojson filterConditionMap_to_yojson x.queryFilter));
        ("KeyConditions",
          (option_to_yojson keyConditions_to_yojson x.keyConditions));
        ("ConsistentRead",
          (option_to_yojson consistentRead_to_yojson x.consistentRead));
        ("Limit", (option_to_yojson positiveIntegerObject_to_yojson x.limit));
        ("AttributesToGet",
          (option_to_yojson attributeNameList_to_yojson x.attributesToGet));
        ("Select", (option_to_yojson select_to_yojson x.select));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let putItemOutput_to_yojson (x : putItemOutput) =
      assoc_to_yojson
        [("ItemCollectionMetrics",
           (option_to_yojson itemCollectionMetrics_to_yojson
              x.itemCollectionMetrics));
        ("ConsumedCapacity",
          (option_to_yojson consumedCapacity_to_yojson x.consumedCapacity));
        ("Attributes",
          (option_to_yojson attributeMap_to_yojson x.attributes))]
    let putItemInput_to_yojson (x : putItemInput) =
      assoc_to_yojson
        [("ExpressionAttributeValues",
           (option_to_yojson expressionAttributeValueMap_to_yojson
              x.expressionAttributeValues));
        ("ExpressionAttributeNames",
          (option_to_yojson expressionAttributeNameMap_to_yojson
             x.expressionAttributeNames));
        ("ConditionExpression",
          (option_to_yojson conditionExpression_to_yojson
             x.conditionExpression));
        ("ConditionalOperator",
          (option_to_yojson conditionalOperator_to_yojson
             x.conditionalOperator));
        ("ReturnItemCollectionMetrics",
          (option_to_yojson returnItemCollectionMetrics_to_yojson
             x.returnItemCollectionMetrics));
        ("ReturnConsumedCapacity",
          (option_to_yojson returnConsumedCapacity_to_yojson
             x.returnConsumedCapacity));
        ("ReturnValues",
          (option_to_yojson returnValue_to_yojson x.returnValues));
        ("Expected",
          (option_to_yojson expectedAttributeMap_to_yojson x.expected));
        ("Item", ((Some ((putItemInputAttributeMap_to_yojson x.item)))
          [@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let preparedStatementParameters_to_yojson x =
      list_to_yojson attributeValue_to_yojson x
    let partiQLStatement_to_yojson = string_to_yojson
    let partiQLNextToken_to_yojson = string_to_yojson
    let batchStatementErrorCodeEnum_to_yojson
      (x : batchStatementErrorCodeEnum) =
      match x with
      | ConditionalCheckFailed -> `String "ConditionalCheckFailed"
      | ItemCollectionSizeLimitExceeded ->
          `String "ItemCollectionSizeLimitExceeded"
      | RequestLimitExceeded -> `String "RequestLimitExceeded"
      | ValidationError -> `String "ValidationError"
      | ProvisionedThroughputExceeded ->
          `String "ProvisionedThroughputExceeded"
      | TransactionConflict -> `String "TransactionConflict"
      | ThrottlingError -> `String "ThrottlingError"
      | InternalServerError -> `String "InternalServerError"
      | ResourceNotFound -> `String "ResourceNotFound"
      | AccessDenied -> `String "AccessDenied"
      | DuplicateItem -> `String "DuplicateItem"
    let batchStatementError_to_yojson (x : batchStatementError) =
      assoc_to_yojson
        [("Message", (option_to_yojson string_to_yojson x.message));
        ("Code",
          (option_to_yojson batchStatementErrorCodeEnum_to_yojson x.code))]
    let batchStatementResponse_to_yojson (x : batchStatementResponse) =
      assoc_to_yojson
        [("Item", (option_to_yojson attributeMap_to_yojson x.item));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName));
        ("Error", (option_to_yojson batchStatementError_to_yojson x.error))]
    let partiQLBatchResponse_to_yojson x =
      list_to_yojson batchStatementResponse_to_yojson x
    let batchStatementRequest_to_yojson (x : batchStatementRequest) =
      assoc_to_yojson
        [("ConsistentRead",
           (option_to_yojson consistentRead_to_yojson x.consistentRead));
        ("Parameters",
          (option_to_yojson preparedStatementParameters_to_yojson
             x.parameters));
        ("Statement", ((Some ((partiQLStatement_to_yojson x.statement)))
          [@explicit_arity ]))]
    let partiQLBatchRequest_to_yojson x =
      list_to_yojson batchStatementRequest_to_yojson x
    let parameterizedStatement_to_yojson (x : parameterizedStatement) =
      assoc_to_yojson
        [("Parameters",
           (option_to_yojson preparedStatementParameters_to_yojson
              x.parameters));
        ("Statement", ((Some ((partiQLStatement_to_yojson x.statement)))
          [@explicit_arity ]))]
    let parameterizedStatements_to_yojson x =
      list_to_yojson parameterizedStatement_to_yojson x
    let nextTokenString_to_yojson = string_to_yojson
    let listTagsOfResourceOutput_to_yojson (x : listTagsOfResourceOutput) =
      assoc_to_yojson
        [("NextToken",
           (option_to_yojson nextTokenString_to_yojson x.nextToken));
        ("Tags", (option_to_yojson tagList_to_yojson x.tags))]
    let listTagsOfResourceInput_to_yojson (x : listTagsOfResourceInput) =
      assoc_to_yojson
        [("NextToken",
           (option_to_yojson nextTokenString_to_yojson x.nextToken));
        ("ResourceArn", ((Some ((resourceArnString_to_yojson x.resourceArn)))
          [@explicit_arity ]))]
    let listTablesOutput_to_yojson (x : listTablesOutput) =
      assoc_to_yojson
        [("LastEvaluatedTableName",
           (option_to_yojson tableName_to_yojson x.lastEvaluatedTableName));
        ("TableNames",
          (option_to_yojson tableNameList_to_yojson x.tableNames))]
    let listTablesInputLimit_to_yojson = int_to_yojson
    let listTablesInput_to_yojson (x : listTablesInput) =
      assoc_to_yojson
        [("Limit", (option_to_yojson listTablesInputLimit_to_yojson x.limit));
        ("ExclusiveStartTableName",
          (option_to_yojson tableName_to_yojson x.exclusiveStartTableName))]
    let globalTable_to_yojson (x : globalTable) =
      assoc_to_yojson
        [("ReplicationGroup",
           (option_to_yojson replicaList_to_yojson x.replicationGroup));
        ("GlobalTableName",
          (option_to_yojson tableName_to_yojson x.globalTableName))]
    let globalTableList_to_yojson x = list_to_yojson globalTable_to_yojson x
    let listGlobalTablesOutput_to_yojson (x : listGlobalTablesOutput) =
      assoc_to_yojson
        [("LastEvaluatedGlobalTableName",
           (option_to_yojson tableName_to_yojson
              x.lastEvaluatedGlobalTableName));
        ("GlobalTables",
          (option_to_yojson globalTableList_to_yojson x.globalTables))]
    let listGlobalTablesInput_to_yojson (x : listGlobalTablesInput) =
      assoc_to_yojson
        [("RegionName", (option_to_yojson regionName_to_yojson x.regionName));
        ("Limit", (option_to_yojson positiveIntegerObject_to_yojson x.limit));
        ("ExclusiveStartGlobalTableName",
          (option_to_yojson tableName_to_yojson
             x.exclusiveStartGlobalTableName))]
    let exportArn_to_yojson = string_to_yojson
    let exportStatus_to_yojson (x : exportStatus) =
      match x with
      | IN_PROGRESS -> `String "IN_PROGRESS"
      | COMPLETED -> `String "COMPLETED"
      | FAILED -> `String "FAILED"
    let exportSummary_to_yojson (x : exportSummary) =
      assoc_to_yojson
        [("ExportStatus",
           (option_to_yojson exportStatus_to_yojson x.exportStatus));
        ("ExportArn", (option_to_yojson exportArn_to_yojson x.exportArn))]
    let exportSummaries_to_yojson x =
      list_to_yojson exportSummary_to_yojson x
    let exportNextToken_to_yojson = string_to_yojson
    let listExportsOutput_to_yojson (x : listExportsOutput) =
      assoc_to_yojson
        [("NextToken",
           (option_to_yojson exportNextToken_to_yojson x.nextToken));
        ("ExportSummaries",
          (option_to_yojson exportSummaries_to_yojson x.exportSummaries))]
    let listExportsMaxLimit_to_yojson = int_to_yojson
    let listExportsInput_to_yojson (x : listExportsInput) =
      assoc_to_yojson
        [("NextToken",
           (option_to_yojson exportNextToken_to_yojson x.nextToken));
        ("MaxResults",
          (option_to_yojson listExportsMaxLimit_to_yojson x.maxResults));
        ("TableArn", (option_to_yojson tableArn_to_yojson x.tableArn))]
    let contributorInsightsSummary_to_yojson (x : contributorInsightsSummary)
      =
      assoc_to_yojson
        [("ContributorInsightsStatus",
           (option_to_yojson contributorInsightsStatus_to_yojson
              x.contributorInsightsStatus));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName))]
    let contributorInsightsSummaries_to_yojson x =
      list_to_yojson contributorInsightsSummary_to_yojson x
    let listContributorInsightsOutput_to_yojson
      (x : listContributorInsightsOutput) =
      assoc_to_yojson
        [("NextToken",
           (option_to_yojson nextTokenString_to_yojson x.nextToken));
        ("ContributorInsightsSummaries",
          (option_to_yojson contributorInsightsSummaries_to_yojson
             x.contributorInsightsSummaries))]
    let listContributorInsightsLimit_to_yojson = int_to_yojson
    let listContributorInsightsInput_to_yojson
      (x : listContributorInsightsInput) =
      assoc_to_yojson
        [("MaxResults",
           (option_to_yojson listContributorInsightsLimit_to_yojson
              x.maxResults));
        ("NextToken",
          (option_to_yojson nextTokenString_to_yojson x.nextToken));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName))]
    let backupName_to_yojson = string_to_yojson
    let backupCreationDateTime_to_yojson = timestamp_to_yojson
    let backupStatus_to_yojson (x : backupStatus) =
      match x with
      | CREATING -> `String "CREATING"
      | DELETED -> `String "DELETED"
      | AVAILABLE -> `String "AVAILABLE"
    let backupType_to_yojson (x : backupType) =
      match x with
      | USER -> `String "USER"
      | SYSTEM -> `String "SYSTEM"
      | AWS_BACKUP -> `String "AWS_BACKUP"
    let backupSizeBytes_to_yojson = long_to_yojson
    let backupSummary_to_yojson (x : backupSummary) =
      assoc_to_yojson
        [("BackupSizeBytes",
           (option_to_yojson backupSizeBytes_to_yojson x.backupSizeBytes));
        ("BackupType", (option_to_yojson backupType_to_yojson x.backupType));
        ("BackupStatus",
          (option_to_yojson backupStatus_to_yojson x.backupStatus));
        ("BackupExpiryDateTime",
          (option_to_yojson date_to_yojson x.backupExpiryDateTime));
        ("BackupCreationDateTime",
          (option_to_yojson backupCreationDateTime_to_yojson
             x.backupCreationDateTime));
        ("BackupName", (option_to_yojson backupName_to_yojson x.backupName));
        ("BackupArn", (option_to_yojson backupArn_to_yojson x.backupArn));
        ("TableArn", (option_to_yojson tableArn_to_yojson x.tableArn));
        ("TableId", (option_to_yojson tableId_to_yojson x.tableId));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName))]
    let backupSummaries_to_yojson x =
      list_to_yojson backupSummary_to_yojson x
    let listBackupsOutput_to_yojson (x : listBackupsOutput) =
      assoc_to_yojson
        [("LastEvaluatedBackupArn",
           (option_to_yojson backupArn_to_yojson x.lastEvaluatedBackupArn));
        ("BackupSummaries",
          (option_to_yojson backupSummaries_to_yojson x.backupSummaries))]
    let backupsInputLimit_to_yojson = int_to_yojson
    let backupTypeFilter_to_yojson (x : backupTypeFilter) =
      match x with
      | USER -> `String "USER"
      | SYSTEM -> `String "SYSTEM"
      | AWS_BACKUP -> `String "AWS_BACKUP"
      | ALL -> `String "ALL"
    let listBackupsInput_to_yojson (x : listBackupsInput) =
      assoc_to_yojson
        [("BackupType",
           (option_to_yojson backupTypeFilter_to_yojson x.backupType));
        ("ExclusiveStartBackupArn",
          (option_to_yojson backupArn_to_yojson x.exclusiveStartBackupArn));
        ("TimeRangeUpperBound",
          (option_to_yojson timeRangeUpperBound_to_yojson
             x.timeRangeUpperBound));
        ("TimeRangeLowerBound",
          (option_to_yojson timeRangeLowerBound_to_yojson
             x.timeRangeLowerBound));
        ("Limit", (option_to_yojson backupsInputLimit_to_yojson x.limit));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName))]
    let lastUpdateDateTime_to_yojson = timestamp_to_yojson
    let destinationStatus_to_yojson (x : destinationStatus) =
      match x with
      | ENABLING -> `String "ENABLING"
      | ACTIVE -> `String "ACTIVE"
      | DISABLING -> `String "DISABLING"
      | DISABLED -> `String "DISABLED"
      | ENABLE_FAILED -> `String "ENABLE_FAILED"
    let kinesisStreamingDestinationOutput_to_yojson
      (x : kinesisStreamingDestinationOutput) =
      assoc_to_yojson
        [("DestinationStatus",
           (option_to_yojson destinationStatus_to_yojson x.destinationStatus));
        ("StreamArn", (option_to_yojson streamArn_to_yojson x.streamArn));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName))]
    let kinesisStreamingDestinationInput_to_yojson
      (x : kinesisStreamingDestinationInput) =
      assoc_to_yojson
        [("StreamArn", ((Some ((streamArn_to_yojson x.streamArn)))
           [@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let kinesisDataStreamDestination_to_yojson
      (x : kinesisDataStreamDestination) =
      assoc_to_yojson
        [("DestinationStatusDescription",
           (option_to_yojson string_to_yojson x.destinationStatusDescription));
        ("DestinationStatus",
          (option_to_yojson destinationStatus_to_yojson x.destinationStatus));
        ("StreamArn", (option_to_yojson streamArn_to_yojson x.streamArn))]
    let kinesisDataStreamDestinations_to_yojson x =
      list_to_yojson kinesisDataStreamDestination_to_yojson x
    let keyList_to_yojson x = list_to_yojson key_to_yojson x
    let keysAndAttributes_to_yojson (x : keysAndAttributes) =
      assoc_to_yojson
        [("ExpressionAttributeNames",
           (option_to_yojson expressionAttributeNameMap_to_yojson
              x.expressionAttributeNames));
        ("ProjectionExpression",
          (option_to_yojson projectionExpression_to_yojson
             x.projectionExpression));
        ("ConsistentRead",
          (option_to_yojson consistentRead_to_yojson x.consistentRead));
        ("AttributesToGet",
          (option_to_yojson attributeNameList_to_yojson x.attributesToGet));
        ("Keys", ((Some ((keyList_to_yojson x.keys)))[@explicit_arity ]))]
    let getItemOutput_to_yojson (x : getItemOutput) =
      assoc_to_yojson
        [("ConsumedCapacity",
           (option_to_yojson consumedCapacity_to_yojson x.consumedCapacity));
        ("Item", (option_to_yojson attributeMap_to_yojson x.item))]
    let getItemInput_to_yojson (x : getItemInput) =
      assoc_to_yojson
        [("ExpressionAttributeNames",
           (option_to_yojson expressionAttributeNameMap_to_yojson
              x.expressionAttributeNames));
        ("ProjectionExpression",
          (option_to_yojson projectionExpression_to_yojson
             x.projectionExpression));
        ("ReturnConsumedCapacity",
          (option_to_yojson returnConsumedCapacity_to_yojson
             x.returnConsumedCapacity));
        ("ConsistentRead",
          (option_to_yojson consistentRead_to_yojson x.consistentRead));
        ("AttributesToGet",
          (option_to_yojson attributeNameList_to_yojson x.attributesToGet));
        ("Key", ((Some ((key_to_yojson x.key)))[@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let failureMessage_to_yojson = string_to_yojson
    let exceptionName_to_yojson = string_to_yojson
    let exceptionDescription_to_yojson = string_to_yojson
    let failureException_to_yojson (x : failureException) =
      assoc_to_yojson
        [("ExceptionDescription",
           (option_to_yojson exceptionDescription_to_yojson
              x.exceptionDescription));
        ("ExceptionName",
          (option_to_yojson exceptionName_to_yojson x.exceptionName))]
    let failureCode_to_yojson = string_to_yojson
    let exportTime_to_yojson = timestamp_to_yojson
    let exportStartTime_to_yojson = timestamp_to_yojson
    let exportEndTime_to_yojson = timestamp_to_yojson
    let exportManifest_to_yojson = string_to_yojson
    let clientToken_to_yojson = string_to_yojson
    let exportFormat_to_yojson (x : exportFormat) =
      match x with
      | DYNAMODB_JSON -> `String "DYNAMODB_JSON"
      | ION -> `String "ION"
    let billedSizeBytes_to_yojson = long_to_yojson
    let exportDescription_to_yojson (x : exportDescription) =
      assoc_to_yojson
        [("ItemCount", (option_to_yojson itemCount_to_yojson x.itemCount));
        ("BilledSizeBytes",
          (option_to_yojson billedSizeBytes_to_yojson x.billedSizeBytes));
        ("ExportFormat",
          (option_to_yojson exportFormat_to_yojson x.exportFormat));
        ("FailureMessage",
          (option_to_yojson failureMessage_to_yojson x.failureMessage));
        ("FailureCode",
          (option_to_yojson failureCode_to_yojson x.failureCode));
        ("S3SseKmsKeyId",
          (option_to_yojson s3SseKmsKeyId_to_yojson x.s3SseKmsKeyId));
        ("S3SseAlgorithm",
          (option_to_yojson s3SseAlgorithm_to_yojson x.s3SseAlgorithm));
        ("S3Prefix", (option_to_yojson s3Prefix_to_yojson x.s3Prefix));
        ("S3BucketOwner",
          (option_to_yojson s3BucketOwner_to_yojson x.s3BucketOwner));
        ("S3Bucket", (option_to_yojson s3Bucket_to_yojson x.s3Bucket));
        ("ClientToken",
          (option_to_yojson clientToken_to_yojson x.clientToken));
        ("ExportTime", (option_to_yojson exportTime_to_yojson x.exportTime));
        ("TableId", (option_to_yojson tableId_to_yojson x.tableId));
        ("TableArn", (option_to_yojson tableArn_to_yojson x.tableArn));
        ("ExportManifest",
          (option_to_yojson exportManifest_to_yojson x.exportManifest));
        ("EndTime", (option_to_yojson exportEndTime_to_yojson x.endTime));
        ("StartTime",
          (option_to_yojson exportStartTime_to_yojson x.startTime));
        ("ExportStatus",
          (option_to_yojson exportStatus_to_yojson x.exportStatus));
        ("ExportArn", (option_to_yojson exportArn_to_yojson x.exportArn))]
    let exportTableToPointInTimeOutput_to_yojson
      (x : exportTableToPointInTimeOutput) =
      assoc_to_yojson
        [("ExportDescription",
           (option_to_yojson exportDescription_to_yojson x.exportDescription))]
    let exportTableToPointInTimeInput_to_yojson
      (x : exportTableToPointInTimeInput) =
      assoc_to_yojson
        [("ExportFormat",
           (option_to_yojson exportFormat_to_yojson x.exportFormat));
        ("S3SseKmsKeyId",
          (option_to_yojson s3SseKmsKeyId_to_yojson x.s3SseKmsKeyId));
        ("S3SseAlgorithm",
          (option_to_yojson s3SseAlgorithm_to_yojson x.s3SseAlgorithm));
        ("S3Prefix", (option_to_yojson s3Prefix_to_yojson x.s3Prefix));
        ("S3BucketOwner",
          (option_to_yojson s3BucketOwner_to_yojson x.s3BucketOwner));
        ("S3Bucket", ((Some ((s3Bucket_to_yojson x.s3Bucket)))
          [@explicit_arity ]));
        ("ClientToken",
          (option_to_yojson clientToken_to_yojson x.clientToken));
        ("ExportTime", (option_to_yojson exportTime_to_yojson x.exportTime));
        ("TableArn", ((Some ((tableArn_to_yojson x.tableArn)))
          [@explicit_arity ]))]
    let executeTransactionOutput_to_yojson (x : executeTransactionOutput) =
      assoc_to_yojson
        [("Responses",
           (option_to_yojson itemResponseList_to_yojson x.responses))]
    let executeTransactionInput_to_yojson (x : executeTransactionInput) =
      assoc_to_yojson
        [("ClientRequestToken",
           (option_to_yojson clientRequestToken_to_yojson
              x.clientRequestToken));
        ("TransactStatements",
          ((Some ((parameterizedStatements_to_yojson x.transactStatements)))
          [@explicit_arity ]))]
    let executeStatementOutput_to_yojson (x : executeStatementOutput) =
      assoc_to_yojson
        [("NextToken",
           (option_to_yojson partiQLNextToken_to_yojson x.nextToken));
        ("Items", (option_to_yojson itemList_to_yojson x.items))]
    let executeStatementInput_to_yojson (x : executeStatementInput) =
      assoc_to_yojson
        [("NextToken",
           (option_to_yojson partiQLNextToken_to_yojson x.nextToken));
        ("ConsistentRead",
          (option_to_yojson consistentRead_to_yojson x.consistentRead));
        ("Parameters",
          (option_to_yojson preparedStatementParameters_to_yojson
             x.parameters));
        ("Statement", ((Some ((partiQLStatement_to_yojson x.statement)))
          [@explicit_arity ]))]
    let endpoint_to_yojson (x : endpoint) =
      assoc_to_yojson
        [("CachePeriodInMinutes",
           ((Some ((long_to_yojson x.cachePeriodInMinutes)))
           [@explicit_arity ]));
        ("Address", ((Some ((string_to_yojson x.address)))
          [@explicit_arity ]))]
    let endpoints_to_yojson x = list_to_yojson endpoint_to_yojson x
    let describeTimeToLiveOutput_to_yojson (x : describeTimeToLiveOutput) =
      assoc_to_yojson
        [("TimeToLiveDescription",
           (option_to_yojson timeToLiveDescription_to_yojson
              x.timeToLiveDescription))]
    let describeTimeToLiveInput_to_yojson (x : describeTimeToLiveInput) =
      assoc_to_yojson
        [("TableName", ((Some ((tableName_to_yojson x.tableName)))
           [@explicit_arity ]))]
    let describeTableReplicaAutoScalingOutput_to_yojson
      (x : describeTableReplicaAutoScalingOutput) =
      assoc_to_yojson
        [("TableAutoScalingDescription",
           (option_to_yojson tableAutoScalingDescription_to_yojson
              x.tableAutoScalingDescription))]
    let describeTableReplicaAutoScalingInput_to_yojson
      (x : describeTableReplicaAutoScalingInput) =
      assoc_to_yojson
        [("TableName", ((Some ((tableName_to_yojson x.tableName)))
           [@explicit_arity ]))]
    let describeTableOutput_to_yojson (x : describeTableOutput) =
      assoc_to_yojson
        [("Table", (option_to_yojson tableDescription_to_yojson x.table))]
    let describeTableInput_to_yojson (x : describeTableInput) =
      assoc_to_yojson
        [("TableName", ((Some ((tableName_to_yojson x.tableName)))
           [@explicit_arity ]))]
    let describeLimitsOutput_to_yojson (x : describeLimitsOutput) =
      assoc_to_yojson
        [("TableMaxWriteCapacityUnits",
           (option_to_yojson positiveLongObject_to_yojson
              x.tableMaxWriteCapacityUnits));
        ("TableMaxReadCapacityUnits",
          (option_to_yojson positiveLongObject_to_yojson
             x.tableMaxReadCapacityUnits));
        ("AccountMaxWriteCapacityUnits",
          (option_to_yojson positiveLongObject_to_yojson
             x.accountMaxWriteCapacityUnits));
        ("AccountMaxReadCapacityUnits",
          (option_to_yojson positiveLongObject_to_yojson
             x.accountMaxReadCapacityUnits))]
    let describeLimitsInput_to_yojson (x : describeLimitsInput) =
      assoc_to_yojson []
    let describeKinesisStreamingDestinationOutput_to_yojson
      (x : describeKinesisStreamingDestinationOutput) =
      assoc_to_yojson
        [("KinesisDataStreamDestinations",
           (option_to_yojson kinesisDataStreamDestinations_to_yojson
              x.kinesisDataStreamDestinations));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName))]
    let describeKinesisStreamingDestinationInput_to_yojson
      (x : describeKinesisStreamingDestinationInput) =
      assoc_to_yojson
        [("TableName", ((Some ((tableName_to_yojson x.tableName)))
           [@explicit_arity ]))]
    let describeGlobalTableSettingsOutput_to_yojson
      (x : describeGlobalTableSettingsOutput) =
      assoc_to_yojson
        [("ReplicaSettings",
           (option_to_yojson replicaSettingsDescriptionList_to_yojson
              x.replicaSettings));
        ("GlobalTableName",
          (option_to_yojson tableName_to_yojson x.globalTableName))]
    let describeGlobalTableSettingsInput_to_yojson
      (x : describeGlobalTableSettingsInput) =
      assoc_to_yojson
        [("GlobalTableName",
           ((Some ((tableName_to_yojson x.globalTableName)))
           [@explicit_arity ]))]
    let describeGlobalTableOutput_to_yojson (x : describeGlobalTableOutput) =
      assoc_to_yojson
        [("GlobalTableDescription",
           (option_to_yojson globalTableDescription_to_yojson
              x.globalTableDescription))]
    let describeGlobalTableInput_to_yojson (x : describeGlobalTableInput) =
      assoc_to_yojson
        [("GlobalTableName",
           ((Some ((tableName_to_yojson x.globalTableName)))
           [@explicit_arity ]))]
    let describeExportOutput_to_yojson (x : describeExportOutput) =
      assoc_to_yojson
        [("ExportDescription",
           (option_to_yojson exportDescription_to_yojson x.exportDescription))]
    let describeExportInput_to_yojson (x : describeExportInput) =
      assoc_to_yojson
        [("ExportArn", ((Some ((exportArn_to_yojson x.exportArn)))
           [@explicit_arity ]))]
    let describeEndpointsResponse_to_yojson (x : describeEndpointsResponse) =
      assoc_to_yojson
        [("Endpoints", ((Some ((endpoints_to_yojson x.endpoints)))
           [@explicit_arity ]))]
    let describeEndpointsRequest_to_yojson (x : describeEndpointsRequest) =
      assoc_to_yojson []
    let contributorInsightsRule_to_yojson = string_to_yojson
    let contributorInsightsRuleList_to_yojson x =
      list_to_yojson contributorInsightsRule_to_yojson x
    let describeContributorInsightsOutput_to_yojson
      (x : describeContributorInsightsOutput) =
      assoc_to_yojson
        [("FailureException",
           (option_to_yojson failureException_to_yojson x.failureException));
        ("LastUpdateDateTime",
          (option_to_yojson lastUpdateDateTime_to_yojson x.lastUpdateDateTime));
        ("ContributorInsightsStatus",
          (option_to_yojson contributorInsightsStatus_to_yojson
             x.contributorInsightsStatus));
        ("ContributorInsightsRuleList",
          (option_to_yojson contributorInsightsRuleList_to_yojson
             x.contributorInsightsRuleList));
        ("IndexName", (option_to_yojson indexName_to_yojson x.indexName));
        ("TableName", (option_to_yojson tableName_to_yojson x.tableName))]
    let describeContributorInsightsInput_to_yojson
      (x : describeContributorInsightsInput) =
      assoc_to_yojson
        [("IndexName", (option_to_yojson indexName_to_yojson x.indexName));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let describeContinuousBackupsOutput_to_yojson
      (x : describeContinuousBackupsOutput) =
      assoc_to_yojson
        [("ContinuousBackupsDescription",
           (option_to_yojson continuousBackupsDescription_to_yojson
              x.continuousBackupsDescription))]
    let describeContinuousBackupsInput_to_yojson
      (x : describeContinuousBackupsInput) =
      assoc_to_yojson
        [("TableName", ((Some ((tableName_to_yojson x.tableName)))
           [@explicit_arity ]))]
    let backupDetails_to_yojson (x : backupDetails) =
      assoc_to_yojson
        [("BackupExpiryDateTime",
           (option_to_yojson date_to_yojson x.backupExpiryDateTime));
        ("BackupCreationDateTime",
          ((Some
              ((backupCreationDateTime_to_yojson x.backupCreationDateTime)))
          [@explicit_arity ]));
        ("BackupType", ((Some ((backupType_to_yojson x.backupType)))
          [@explicit_arity ]));
        ("BackupStatus", ((Some ((backupStatus_to_yojson x.backupStatus)))
          [@explicit_arity ]));
        ("BackupSizeBytes",
          (option_to_yojson backupSizeBytes_to_yojson x.backupSizeBytes));
        ("BackupName", ((Some ((backupName_to_yojson x.backupName)))
          [@explicit_arity ]));
        ("BackupArn", ((Some ((backupArn_to_yojson x.backupArn)))
          [@explicit_arity ]))]
    let backupDescription_to_yojson (x : backupDescription) =
      assoc_to_yojson
        [("SourceTableFeatureDetails",
           (option_to_yojson sourceTableFeatureDetails_to_yojson
              x.sourceTableFeatureDetails));
        ("SourceTableDetails",
          (option_to_yojson sourceTableDetails_to_yojson x.sourceTableDetails));
        ("BackupDetails",
          (option_to_yojson backupDetails_to_yojson x.backupDetails))]
    let describeBackupOutput_to_yojson (x : describeBackupOutput) =
      assoc_to_yojson
        [("BackupDescription",
           (option_to_yojson backupDescription_to_yojson x.backupDescription))]
    let describeBackupInput_to_yojson (x : describeBackupInput) =
      assoc_to_yojson
        [("BackupArn", ((Some ((backupArn_to_yojson x.backupArn)))
           [@explicit_arity ]))]
    let deleteTableOutput_to_yojson (x : deleteTableOutput) =
      assoc_to_yojson
        [("TableDescription",
           (option_to_yojson tableDescription_to_yojson x.tableDescription))]
    let deleteTableInput_to_yojson (x : deleteTableInput) =
      assoc_to_yojson
        [("TableName", ((Some ((tableName_to_yojson x.tableName)))
           [@explicit_arity ]))]
    let deleteItemOutput_to_yojson (x : deleteItemOutput) =
      assoc_to_yojson
        [("ItemCollectionMetrics",
           (option_to_yojson itemCollectionMetrics_to_yojson
              x.itemCollectionMetrics));
        ("ConsumedCapacity",
          (option_to_yojson consumedCapacity_to_yojson x.consumedCapacity));
        ("Attributes",
          (option_to_yojson attributeMap_to_yojson x.attributes))]
    let deleteItemInput_to_yojson (x : deleteItemInput) =
      assoc_to_yojson
        [("ExpressionAttributeValues",
           (option_to_yojson expressionAttributeValueMap_to_yojson
              x.expressionAttributeValues));
        ("ExpressionAttributeNames",
          (option_to_yojson expressionAttributeNameMap_to_yojson
             x.expressionAttributeNames));
        ("ConditionExpression",
          (option_to_yojson conditionExpression_to_yojson
             x.conditionExpression));
        ("ReturnItemCollectionMetrics",
          (option_to_yojson returnItemCollectionMetrics_to_yojson
             x.returnItemCollectionMetrics));
        ("ReturnConsumedCapacity",
          (option_to_yojson returnConsumedCapacity_to_yojson
             x.returnConsumedCapacity));
        ("ReturnValues",
          (option_to_yojson returnValue_to_yojson x.returnValues));
        ("ConditionalOperator",
          (option_to_yojson conditionalOperator_to_yojson
             x.conditionalOperator));
        ("Expected",
          (option_to_yojson expectedAttributeMap_to_yojson x.expected));
        ("Key", ((Some ((key_to_yojson x.key)))[@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let deleteBackupOutput_to_yojson (x : deleteBackupOutput) =
      assoc_to_yojson
        [("BackupDescription",
           (option_to_yojson backupDescription_to_yojson x.backupDescription))]
    let deleteBackupInput_to_yojson (x : deleteBackupInput) =
      assoc_to_yojson
        [("BackupArn", ((Some ((backupArn_to_yojson x.backupArn)))
           [@explicit_arity ]))]
    let createTableOutput_to_yojson (x : createTableOutput) =
      assoc_to_yojson
        [("TableDescription",
           (option_to_yojson tableDescription_to_yojson x.tableDescription))]
    let createTableInput_to_yojson (x : createTableInput) =
      assoc_to_yojson
        [("Tags", (option_to_yojson tagList_to_yojson x.tags));
        ("SSESpecification",
          (option_to_yojson ssespecification_to_yojson x.ssespecification));
        ("StreamSpecification",
          (option_to_yojson streamSpecification_to_yojson
             x.streamSpecification));
        ("ProvisionedThroughput",
          (option_to_yojson provisionedThroughput_to_yojson
             x.provisionedThroughput));
        ("BillingMode",
          (option_to_yojson billingMode_to_yojson x.billingMode));
        ("GlobalSecondaryIndexes",
          (option_to_yojson globalSecondaryIndexList_to_yojson
             x.globalSecondaryIndexes));
        ("LocalSecondaryIndexes",
          (option_to_yojson localSecondaryIndexList_to_yojson
             x.localSecondaryIndexes));
        ("KeySchema", ((Some ((keySchema_to_yojson x.keySchema)))
          [@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]));
        ("AttributeDefinitions",
          ((Some ((attributeDefinitions_to_yojson x.attributeDefinitions)))
          [@explicit_arity ]))]
    let createGlobalTableOutput_to_yojson (x : createGlobalTableOutput) =
      assoc_to_yojson
        [("GlobalTableDescription",
           (option_to_yojson globalTableDescription_to_yojson
              x.globalTableDescription))]
    let createGlobalTableInput_to_yojson (x : createGlobalTableInput) =
      assoc_to_yojson
        [("ReplicationGroup",
           ((Some ((replicaList_to_yojson x.replicationGroup)))
           [@explicit_arity ]));
        ("GlobalTableName", ((Some ((tableName_to_yojson x.globalTableName)))
          [@explicit_arity ]))]
    let createBackupOutput_to_yojson (x : createBackupOutput) =
      assoc_to_yojson
        [("BackupDetails",
           (option_to_yojson backupDetails_to_yojson x.backupDetails))]
    let createBackupInput_to_yojson (x : createBackupInput) =
      assoc_to_yojson
        [("BackupName", ((Some ((backupName_to_yojson x.backupName)))
           [@explicit_arity ]));
        ("TableName", ((Some ((tableName_to_yojson x.tableName)))
          [@explicit_arity ]))]
    let batchWriteItemRequestMap_to_yojson x =
      map_to_yojson writeRequests_to_yojson x
    let batchWriteItemOutput_to_yojson (x : batchWriteItemOutput) =
      assoc_to_yojson
        [("ConsumedCapacity",
           (option_to_yojson consumedCapacityMultiple_to_yojson
              x.consumedCapacity));
        ("ItemCollectionMetrics",
          (option_to_yojson itemCollectionMetricsPerTable_to_yojson
             x.itemCollectionMetrics));
        ("UnprocessedItems",
          (option_to_yojson batchWriteItemRequestMap_to_yojson
             x.unprocessedItems))]
    let batchWriteItemInput_to_yojson (x : batchWriteItemInput) =
      assoc_to_yojson
        [("ReturnItemCollectionMetrics",
           (option_to_yojson returnItemCollectionMetrics_to_yojson
              x.returnItemCollectionMetrics));
        ("ReturnConsumedCapacity",
          (option_to_yojson returnConsumedCapacity_to_yojson
             x.returnConsumedCapacity));
        ("RequestItems",
          ((Some ((batchWriteItemRequestMap_to_yojson x.requestItems)))
          [@explicit_arity ]))]
    let batchGetResponseMap_to_yojson x = map_to_yojson itemList_to_yojson x
    let batchGetRequestMap_to_yojson x =
      map_to_yojson keysAndAttributes_to_yojson x
    let batchGetItemOutput_to_yojson (x : batchGetItemOutput) =
      assoc_to_yojson
        [("ConsumedCapacity",
           (option_to_yojson consumedCapacityMultiple_to_yojson
              x.consumedCapacity));
        ("UnprocessedKeys",
          (option_to_yojson batchGetRequestMap_to_yojson x.unprocessedKeys));
        ("Responses",
          (option_to_yojson batchGetResponseMap_to_yojson x.responses))]
    let batchGetItemInput_to_yojson (x : batchGetItemInput) =
      assoc_to_yojson
        [("ReturnConsumedCapacity",
           (option_to_yojson returnConsumedCapacity_to_yojson
              x.returnConsumedCapacity));
        ("RequestItems",
          ((Some ((batchGetRequestMap_to_yojson x.requestItems)))
          [@explicit_arity ]))]
    let batchExecuteStatementOutput_to_yojson
      (x : batchExecuteStatementOutput) =
      assoc_to_yojson
        [("Responses",
           (option_to_yojson partiQLBatchResponse_to_yojson x.responses))]
    let batchExecuteStatementInput_to_yojson (x : batchExecuteStatementInput)
      =
      assoc_to_yojson
        [("Statements",
           ((Some ((partiQLBatchRequest_to_yojson x.statements)))
           [@explicit_arity ]))]
    let baseString_to_yojson = string_to_yojson
    let baseBoolean_to_yojson = bool_to_yojson
    let baseInteger_to_yojson = int_to_yojson
    let baseTimestamp_to_yojson = timestamp_to_yojson
    let baseLong_to_yojson = long_to_yojson
  end
module Client =
  struct
    type t = {
      config: Aws.config }
    let make (config : Aws.config) = config
    module UpdateTimeToLive =
      struct
        let request client (request : updateTimeToLiveInput) =
          let open Lwt.Syntax in
            let input = Serialize.updateTimeToLiveInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.UpdateTimeToLive" ~service
              ~config:(client.config) ~input
      end
    module UpdateTableReplicaAutoScaling =
      struct
        let request client (request : updateTableReplicaAutoScalingInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.updateTableReplicaAutoScalingInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.UpdateTableReplicaAutoScaling"
              ~service ~config:(client.config) ~input
      end
    module UpdateTable =
      struct
        let request client (request : updateTableInput) =
          let open Lwt.Syntax in
            let input = Serialize.updateTableInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.UpdateTable"
              ~service ~config:(client.config) ~input
      end
    module UpdateItem =
      struct
        let request client (request : updateItemInput) =
          let open Lwt.Syntax in
            let input = Serialize.updateItemInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.UpdateItem"
              ~service ~config:(client.config) ~input
      end
    module UpdateGlobalTableSettings =
      struct
        let request client (request : updateGlobalTableSettingsInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.updateGlobalTableSettingsInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.UpdateGlobalTableSettings"
              ~service ~config:(client.config) ~input
      end
    module UpdateGlobalTable =
      struct
        let request client (request : updateGlobalTableInput) =
          let open Lwt.Syntax in
            let input = Serialize.updateGlobalTableInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.UpdateGlobalTable" ~service
              ~config:(client.config) ~input
      end
    module UpdateContributorInsights =
      struct
        let request client (request : updateContributorInsightsInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.updateContributorInsightsInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.UpdateContributorInsights"
              ~service ~config:(client.config) ~input
      end
    module UpdateContinuousBackups =
      struct
        let request client (request : updateContinuousBackupsInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.updateContinuousBackupsInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.UpdateContinuousBackups" ~service
              ~config:(client.config) ~input
      end
    module UntagResource =
      struct
        let request client (request : untagResourceInput) =
          let open Lwt.Syntax in
            let input = Serialize.untagResourceInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.UntagResource"
              ~service ~config:(client.config) ~input
      end
    module TransactWriteItems =
      struct
        let request client (request : transactWriteItemsInput) =
          let open Lwt.Syntax in
            let input = Serialize.transactWriteItemsInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.TransactWriteItems" ~service
              ~config:(client.config) ~input
      end
    module TransactGetItems =
      struct
        let request client (request : transactGetItemsInput) =
          let open Lwt.Syntax in
            let input = Serialize.transactGetItemsInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.TransactGetItems" ~service
              ~config:(client.config) ~input
      end
    module TagResource =
      struct
        let request client (request : tagResourceInput) =
          let open Lwt.Syntax in
            let input = Serialize.tagResourceInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.TagResource"
              ~service ~config:(client.config) ~input
      end
    module Scan =
      struct
        let request client (request : scanInput) =
          let open Lwt.Syntax in
            let input = Serialize.scanInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.Scan" ~service
              ~config:(client.config) ~input
      end
    module RestoreTableToPointInTime =
      struct
        let request client (request : restoreTableToPointInTimeInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.restoreTableToPointInTimeInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.RestoreTableToPointInTime"
              ~service ~config:(client.config) ~input
      end
    module RestoreTableFromBackup =
      struct
        let request client (request : restoreTableFromBackupInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.restoreTableFromBackupInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.RestoreTableFromBackup" ~service
              ~config:(client.config) ~input
      end
    module Query =
      struct
        let request client (request : queryInput) =
          let open Lwt.Syntax in
            let input = Serialize.queryInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.Query"
              ~service ~config:(client.config) ~input
      end
    module PutItem =
      struct
        let request client (request : putItemInput) =
          let open Lwt.Syntax in
            let input = Serialize.putItemInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.PutItem"
              ~service ~config:(client.config) ~input
      end
    module ListTagsOfResource =
      struct
        let request client (request : listTagsOfResourceInput) =
          let open Lwt.Syntax in
            let input = Serialize.listTagsOfResourceInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.ListTagsOfResource" ~service
              ~config:(client.config) ~input
      end
    module ListTables =
      struct
        let request client (request : listTablesInput) =
          let open Lwt.Syntax in
            let input = Serialize.listTablesInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.ListTables"
              ~service ~config:(client.config) ~input
      end
    module ListGlobalTables =
      struct
        let request client (request : listGlobalTablesInput) =
          let open Lwt.Syntax in
            let input = Serialize.listGlobalTablesInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.ListGlobalTables" ~service
              ~config:(client.config) ~input
      end
    module ListExports =
      struct
        let request client (request : listExportsInput) =
          let open Lwt.Syntax in
            let input = Serialize.listExportsInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.ListExports"
              ~service ~config:(client.config) ~input
      end
    module ListContributorInsights =
      struct
        let request client (request : listContributorInsightsInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.listContributorInsightsInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.ListContributorInsights" ~service
              ~config:(client.config) ~input
      end
    module ListBackups =
      struct
        let request client (request : listBackupsInput) =
          let open Lwt.Syntax in
            let input = Serialize.listBackupsInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.ListBackups"
              ~service ~config:(client.config) ~input
      end
    module GetItem =
      struct
        let request client (request : getItemInput) =
          let open Lwt.Syntax in
            let input = Serialize.getItemInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.GetItem"
              ~service ~config:(client.config) ~input
      end
    module ExportTableToPointInTime =
      struct
        let request client (request : exportTableToPointInTimeInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.exportTableToPointInTimeInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.ExportTableToPointInTime"
              ~service ~config:(client.config) ~input
      end
    module ExecuteTransaction =
      struct
        let request client (request : executeTransactionInput) =
          let open Lwt.Syntax in
            let input = Serialize.executeTransactionInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.ExecuteTransaction" ~service
              ~config:(client.config) ~input
      end
    module ExecuteStatement =
      struct
        let request client (request : executeStatementInput) =
          let open Lwt.Syntax in
            let input = Serialize.executeStatementInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.ExecuteStatement" ~service
              ~config:(client.config) ~input
      end
    module EnableKinesisStreamingDestination =
      struct
        let request client (request : kinesisStreamingDestinationInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.kinesisStreamingDestinationInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.EnableKinesisStreamingDestination"
              ~service ~config:(client.config) ~input
      end
    module DisableKinesisStreamingDestination =
      struct
        let request client (request : kinesisStreamingDestinationInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.kinesisStreamingDestinationInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DisableKinesisStreamingDestination"
              ~service ~config:(client.config) ~input
      end
    module DescribeTimeToLive =
      struct
        let request client (request : describeTimeToLiveInput) =
          let open Lwt.Syntax in
            let input = Serialize.describeTimeToLiveInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeTimeToLive" ~service
              ~config:(client.config) ~input
      end
    module DescribeTableReplicaAutoScaling =
      struct
        let request client (request : describeTableReplicaAutoScalingInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.describeTableReplicaAutoScalingInput_to_yojson
                request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeTableReplicaAutoScaling"
              ~service ~config:(client.config) ~input
      end
    module DescribeTable =
      struct
        let request client (request : describeTableInput) =
          let open Lwt.Syntax in
            let input = Serialize.describeTableInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.DescribeTable"
              ~service ~config:(client.config) ~input
      end
    module DescribeLimits =
      struct
        let request client (request : describeLimitsInput) =
          let open Lwt.Syntax in
            let input = Serialize.describeLimitsInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeLimits" ~service
              ~config:(client.config) ~input
      end
    module DescribeKinesisStreamingDestination =
      struct
        let request client
          (request : describeKinesisStreamingDestinationInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.describeKinesisStreamingDestinationInput_to_yojson
                request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeKinesisStreamingDestination"
              ~service ~config:(client.config) ~input
      end
    module DescribeGlobalTableSettings =
      struct
        let request client (request : describeGlobalTableSettingsInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.describeGlobalTableSettingsInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeGlobalTableSettings"
              ~service ~config:(client.config) ~input
      end
    module DescribeGlobalTable =
      struct
        let request client (request : describeGlobalTableInput) =
          let open Lwt.Syntax in
            let input = Serialize.describeGlobalTableInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeGlobalTable" ~service
              ~config:(client.config) ~input
      end
    module DescribeExport =
      struct
        let request client (request : describeExportInput) =
          let open Lwt.Syntax in
            let input = Serialize.describeExportInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeExport" ~service
              ~config:(client.config) ~input
      end
    module DescribeEndpoints =
      struct
        let request client (request : describeEndpointsRequest) =
          let open Lwt.Syntax in
            let input = Serialize.describeEndpointsRequest_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeEndpoints" ~service
              ~config:(client.config) ~input
      end
    module DescribeContributorInsights =
      struct
        let request client (request : describeContributorInsightsInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.describeContributorInsightsInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeContributorInsights"
              ~service ~config:(client.config) ~input
      end
    module DescribeContinuousBackups =
      struct
        let request client (request : describeContinuousBackupsInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.describeContinuousBackupsInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeContinuousBackups"
              ~service ~config:(client.config) ~input
      end
    module DescribeBackup =
      struct
        let request client (request : describeBackupInput) =
          let open Lwt.Syntax in
            let input = Serialize.describeBackupInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.DescribeBackup" ~service
              ~config:(client.config) ~input
      end
    module DeleteTable =
      struct
        let request client (request : deleteTableInput) =
          let open Lwt.Syntax in
            let input = Serialize.deleteTableInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.DeleteTable"
              ~service ~config:(client.config) ~input
      end
    module DeleteItem =
      struct
        let request client (request : deleteItemInput) =
          let open Lwt.Syntax in
            let input = Serialize.deleteItemInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.DeleteItem"
              ~service ~config:(client.config) ~input
      end
    module DeleteBackup =
      struct
        let request client (request : deleteBackupInput) =
          let open Lwt.Syntax in
            let input = Serialize.deleteBackupInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.DeleteBackup"
              ~service ~config:(client.config) ~input
      end
    module CreateTable =
      struct
        let request client (request : createTableInput) =
          let open Lwt.Syntax in
            let input = Serialize.createTableInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.CreateTable"
              ~service ~config:(client.config) ~input
      end
    module CreateGlobalTable =
      struct
        let request client (request : createGlobalTableInput) =
          let open Lwt.Syntax in
            let input = Serialize.createGlobalTableInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.CreateGlobalTable" ~service
              ~config:(client.config) ~input
      end
    module CreateBackup =
      struct
        let request client (request : createBackupInput) =
          let open Lwt.Syntax in
            let input = Serialize.createBackupInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.CreateBackup"
              ~service ~config:(client.config) ~input
      end
    module BatchWriteItem =
      struct
        let request client (request : batchWriteItemInput) =
          let open Lwt.Syntax in
            let input = Serialize.batchWriteItemInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.BatchWriteItem" ~service
              ~config:(client.config) ~input
      end
    module BatchGetItem =
      struct
        let request client (request : batchGetItemInput) =
          let open Lwt.Syntax in
            let input = Serialize.batchGetItemInput_to_yojson request in
            AwsJson.make_request ~shapeName:"DynamoDB_20120810.BatchGetItem"
              ~service ~config:(client.config) ~input
      end
    module BatchExecuteStatement =
      struct
        let request client (request : batchExecuteStatementInput) =
          let open Lwt.Syntax in
            let input =
              Serialize.batchExecuteStatementInput_to_yojson request in
            AwsJson.make_request
              ~shapeName:"DynamoDB_20120810.BatchExecuteStatement" ~service
              ~config:(client.config) ~input
      end
  end