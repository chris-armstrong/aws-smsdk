open AwsSdkLib
type baseString = string
type baseBoolean = bool
type baseInteger = int
type baseTimestamp = float
type baseLong = int64
exception UnsupportedOperation of Aws.emptyErrorDetails Aws.apiError 
exception TooManyEntriesInBatchRequest of Aws.emptyErrorDetails Aws.apiError 
type token = string
type tagValue = string
type tagKey = string
type string_ = string
exception ReceiptHandleIsInvalid of Aws.emptyErrorDetails Aws.apiError 
exception QueueNameExists of Aws.emptyErrorDetails Aws.apiError 
exception QueueDoesNotExist of Aws.emptyErrorDetails Aws.apiError 
exception QueueDeletedRecently of Aws.emptyErrorDetails Aws.apiError 
type queueAttributeName =
  | All 
  | Policy 
  | VisibilityTimeout 
  | MaximumMessageSize 
  | MessageRetentionPeriod 
  | ApproximateNumberOfMessages 
  | ApproximateNumberOfMessagesNotVisible 
  | CreatedTimestamp 
  | LastModifiedTimestamp 
  | QueueArn 
  | ApproximateNumberOfMessagesDelayed 
  | DelaySeconds 
  | ReceiveMessageWaitTimeSeconds 
  | RedrivePolicy 
  | FifoQueue 
  | ContentBasedDeduplication 
  | KmsMasterKeyId 
  | KmsDataKeyReusePeriodSeconds 
  | DeduplicationScope 
  | FifoThroughputLimit 
  | RedriveAllowPolicy 
  | SqsManagedSseEnabled 
exception PurgeQueueInProgress of Aws.emptyErrorDetails Aws.apiError 
exception OverLimit of Aws.emptyErrorDetails Aws.apiError 
type messageSystemAttributeNameForSends =
  | AWSTraceHeader 
type messageSystemAttributeName =
  | SenderId 
  | SentTimestamp 
  | ApproximateReceiveCount 
  | ApproximateFirstReceiveTimestamp 
  | SequenceNumber 
  | MessageDeduplicationId 
  | MessageGroupId 
  | AWSTraceHeader 
exception MessageNotInflight of Aws.emptyErrorDetails Aws.apiError 
type messageAttributeName = string
exception InvalidMessageContents of Aws.emptyErrorDetails Aws.apiError 
exception InvalidIdFormat of Aws.emptyErrorDetails Aws.apiError 
exception InvalidBatchEntryId of Aws.emptyErrorDetails Aws.apiError 
exception InvalidAttributeName of Aws.emptyErrorDetails Aws.apiError 
type integer_ = int
exception EmptyBatchRequest of Aws.emptyErrorDetails Aws.apiError 
type boxedInteger = int
type boolean_ = bool
type binary = bytes
exception BatchRequestTooLong of Aws.emptyErrorDetails Aws.apiError 
exception BatchEntryIdsNotDistinct of Aws.emptyErrorDetails Aws.apiError 
type tagMap = (string * tagValue) list
type tagKeyList = tagKey list
type stringList = string_ list
type sendMessageResult =
  {
  sequenceNumber: string_ option ;
  messageId: string_ option ;
  md5OfMessageSystemAttributes: string_ option ;
  md5OfMessageAttributes: string_ option ;
  md5OfMessageBody: string_ option }
type sendMessageBatchResultEntry =
  {
  sequenceNumber: string_ option ;
  md5OfMessageSystemAttributes: string_ option ;
  md5OfMessageAttributes: string_ option ;
  md5OfMessageBody: string_ ;
  messageId: string_ ;
  id: string_ }
type removePermissionRequest = {
  label: string_ ;
  queueUrl: string_ }
type queueUrlList = string_ list
type queueAttributeMap = (string * string_) list
type purgeQueueRequest = {
  queueUrl: string_ }
type messageSystemAttributeMap = (string * string_) list
type messageAttributeNameList = messageAttributeName list
type listQueuesRequest =
  {
  maxResults: boxedInteger option ;
  nextToken: token option ;
  queueNamePrefix: string_ option }
type listQueueTagsRequest = {
  queueUrl: string_ }
type listDeadLetterSourceQueuesRequest =
  {
  maxResults: boxedInteger option ;
  nextToken: token option ;
  queueUrl: string_ }
type getQueueUrlResult = {
  queueUrl: string_ option }
type getQueueUrlRequest =
  {
  queueOwnerAWSAccountId: string_ option ;
  queueName: string_ }
type deleteQueueRequest = {
  queueUrl: string_ }
type deleteMessageRequest = {
  receiptHandle: string_ ;
  queueUrl: string_ }
type deleteMessageBatchResultEntry = {
  id: string_ }
type deleteMessageBatchRequestEntry = {
  receiptHandle: string_ ;
  id: string_ }
type createQueueResult = {
  queueUrl: string_ option }
type changeMessageVisibilityRequest =
  {
  visibilityTimeout: integer_ ;
  receiptHandle: string_ ;
  queueUrl: string_ }
type changeMessageVisibilityBatchResultEntry = {
  id: string_ }
type changeMessageVisibilityBatchRequestEntry =
  {
  visibilityTimeout: integer_ option ;
  receiptHandle: string_ ;
  id: string_ }
type binaryList = binary list
type batchResultErrorEntry =
  {
  message: string_ option ;
  code: string_ ;
  senderFault: boolean_ ;
  id: string_ }
type attributeNameList = queueAttributeName list
type actionNameList = string_ list
type awsaccountIdList = string_ list
type untagQueueRequest = {
  tagKeys: tagKeyList ;
  queueUrl: string_ }
type tagQueueRequest = {
  tags: tagMap ;
  queueUrl: string_ }
type setQueueAttributesRequest =
  {
  attributes: queueAttributeMap ;
  queueUrl: string_ }
type sendMessageBatchResultEntryList = sendMessageBatchResultEntry list
type receiveMessageRequest =
  {
  receiveRequestAttemptId: string_ option ;
  waitTimeSeconds: integer_ option ;
  visibilityTimeout: integer_ option ;
  maxNumberOfMessages: integer_ option ;
  messageAttributeNames: messageAttributeNameList option ;
  attributeNames: attributeNameList option ;
  queueUrl: string_ }
type messageSystemAttributeValue =
  {
  dataType: string_ ;
  binaryListValues: binaryList option ;
  stringListValues: stringList option ;
  binaryValue: binary option ;
  stringValue: string_ option }
type messageAttributeValue =
  {
  dataType: string_ ;
  binaryListValues: binaryList option ;
  stringListValues: stringList option ;
  binaryValue: binary option ;
  stringValue: string_ option }
type listQueuesResult =
  {
  queueUrls: queueUrlList option ;
  nextToken: token option }
type listQueueTagsResult = {
  tags: tagMap option }
type listDeadLetterSourceQueuesResult =
  {
  nextToken: token option ;
  queueUrls: queueUrlList }
type getQueueAttributesResult = {
  attributes: queueAttributeMap option }
type getQueueAttributesRequest =
  {
  attributeNames: attributeNameList option ;
  queueUrl: string_ }
type deleteMessageBatchResultEntryList = deleteMessageBatchResultEntry list
type deleteMessageBatchRequestEntryList = deleteMessageBatchRequestEntry list
type createQueueRequest =
  {
  attributes: queueAttributeMap option ;
  tags: tagMap option ;
  queueName: string_ }
type changeMessageVisibilityBatchResultEntryList =
  changeMessageVisibilityBatchResultEntry list
type changeMessageVisibilityBatchRequestEntryList =
  changeMessageVisibilityBatchRequestEntry list
type batchResultErrorEntryList = batchResultErrorEntry list
type addPermissionRequest =
  {
  actions: actionNameList ;
  awsaccountIds: awsaccountIdList ;
  label: string_ ;
  queueUrl: string_ }
type sendMessageBatchResult =
  {
  failed: batchResultErrorEntryList ;
  successful: sendMessageBatchResultEntryList }
type messageBodySystemAttributeMap =
  (string * messageSystemAttributeValue) list
type messageBodyAttributeMap = (string * messageAttributeValue) list
type deleteMessageBatchResult =
  {
  failed: batchResultErrorEntryList ;
  successful: deleteMessageBatchResultEntryList }
type deleteMessageBatchRequest =
  {
  entries: deleteMessageBatchRequestEntryList ;
  queueUrl: string_ }
type changeMessageVisibilityBatchResult =
  {
  failed: batchResultErrorEntryList ;
  successful: changeMessageVisibilityBatchResultEntryList }
type changeMessageVisibilityBatchRequest =
  {
  entries: changeMessageVisibilityBatchRequestEntryList ;
  queueUrl: string_ }
type sendMessageRequest =
  {
  messageGroupId: string_ option ;
  messageDeduplicationId: string_ option ;
  messageSystemAttributes: messageBodySystemAttributeMap option ;
  messageAttributes: messageBodyAttributeMap option ;
  delaySeconds: integer_ option ;
  messageBody: string_ ;
  queueUrl: string_ }
type sendMessageBatchRequestEntry =
  {
  messageGroupId: string_ option ;
  messageDeduplicationId: string_ option ;
  messageSystemAttributes: messageBodySystemAttributeMap option ;
  messageAttributes: messageBodyAttributeMap option ;
  delaySeconds: integer_ option ;
  messageBody: string_ ;
  id: string_ }
type message =
  {
  messageAttributes: messageBodyAttributeMap option ;
  md5OfMessageAttributes: string_ option ;
  attributes: messageSystemAttributeMap option ;
  body: string_ option ;
  md5OfBody: string_ option ;
  receiptHandle: string_ option ;
  messageId: string_ option }
type sendMessageBatchRequestEntryList = sendMessageBatchRequestEntry list
type messageList = message list
type sendMessageBatchRequest =
  {
  entries: sendMessageBatchRequestEntryList ;
  queueUrl: string_ }
type receiveMessageResult = {
  messages: messageList option }