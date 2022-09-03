open AwsSdkLib;
type baseString = string;

type baseBoolean = bool;

type baseInteger = int;

type baseTimestamp = float;

type baseLong = int64;

exception UnsupportedOperation(Aws.apiError(Aws.emptyErrorDetails));

exception TooManyEntriesInBatchRequest(Aws.apiError(Aws.emptyErrorDetails));

type token = string;

type tagValue = string;

type tagKey = string;

type string_ = string;

exception ReceiptHandleIsInvalid(Aws.apiError(Aws.emptyErrorDetails));

exception QueueNameExists(Aws.apiError(Aws.emptyErrorDetails));

exception QueueDoesNotExist(Aws.apiError(Aws.emptyErrorDetails));

exception QueueDeletedRecently(Aws.apiError(Aws.emptyErrorDetails));

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
  | SqsManagedSseEnabled;

exception PurgeQueueInProgress(Aws.apiError(Aws.emptyErrorDetails));

exception OverLimit(Aws.apiError(Aws.emptyErrorDetails));

type messageSystemAttributeNameForSends =
  | AWSTraceHeader;

type messageSystemAttributeName =
  | SenderId
  | SentTimestamp
  | ApproximateReceiveCount
  | ApproximateFirstReceiveTimestamp
  | SequenceNumber
  | MessageDeduplicationId
  | MessageGroupId
  | AWSTraceHeader;

exception MessageNotInflight(Aws.apiError(Aws.emptyErrorDetails));

type messageAttributeName = string;

exception InvalidMessageContents(Aws.apiError(Aws.emptyErrorDetails));

exception InvalidIdFormat(Aws.apiError(Aws.emptyErrorDetails));

exception InvalidBatchEntryId(Aws.apiError(Aws.emptyErrorDetails));

exception InvalidAttributeName(Aws.apiError(Aws.emptyErrorDetails));

type integer_ = int;

exception EmptyBatchRequest(Aws.apiError(Aws.emptyErrorDetails));

type boxedInteger = int;

type boolean_ = bool;

type binary = bytes;

exception BatchRequestTooLong(Aws.apiError(Aws.emptyErrorDetails));

exception BatchEntryIdsNotDistinct(Aws.apiError(Aws.emptyErrorDetails));

type tagMap = list((string, tagValue));

type tagKeyList = list(tagKey);

type stringList = list(string_);

type sendMessageResult = {
  sequenceNumber: option(string_),
  messageId: option(string_),
  md5OfMessageSystemAttributes: option(string_),
  md5OfMessageAttributes: option(string_),
  md5OfMessageBody: option(string_),
};

type sendMessageBatchResultEntry = {
  sequenceNumber: option(string_),
  md5OfMessageSystemAttributes: option(string_),
  md5OfMessageAttributes: option(string_),
  md5OfMessageBody: string_,
  messageId: string_,
  id: string_,
};

type removePermissionRequest = {
  label: string_,
  queueUrl: string_,
};

type queueUrlList = list(string_);

type queueAttributeMap = list((string, string_));

type purgeQueueRequest = {queueUrl: string_};

type messageSystemAttributeMap = list((string, string_));

type messageAttributeNameList = list(messageAttributeName);

type listQueuesRequest = {
  maxResults: option(boxedInteger),
  nextToken: option(token),
  queueNamePrefix: option(string_),
};

type listQueueTagsRequest = {queueUrl: string_};

type listDeadLetterSourceQueuesRequest = {
  maxResults: option(boxedInteger),
  nextToken: option(token),
  queueUrl: string_,
};

type getQueueUrlResult = {queueUrl: option(string_)};

type getQueueUrlRequest = {
  queueOwnerAWSAccountId: option(string_),
  queueName: string_,
};

type deleteQueueRequest = {queueUrl: string_};

type deleteMessageRequest = {
  receiptHandle: string_,
  queueUrl: string_,
};

type deleteMessageBatchResultEntry = {id: string_};

type deleteMessageBatchRequestEntry = {
  receiptHandle: string_,
  id: string_,
};

type createQueueResult = {queueUrl: option(string_)};

type changeMessageVisibilityRequest = {
  visibilityTimeout: integer_,
  receiptHandle: string_,
  queueUrl: string_,
};

type changeMessageVisibilityBatchResultEntry = {id: string_};

type changeMessageVisibilityBatchRequestEntry = {
  visibilityTimeout: option(integer_),
  receiptHandle: string_,
  id: string_,
};

type binaryList = list(binary);

type batchResultErrorEntry = {
  message: option(string_),
  code: string_,
  senderFault: boolean_,
  id: string_,
};

type attributeNameList = list(queueAttributeName);

type actionNameList = list(string_);

type awsaccountIdList = list(string_);

type untagQueueRequest = {
  tagKeys: tagKeyList,
  queueUrl: string_,
};

type tagQueueRequest = {
  tags: tagMap,
  queueUrl: string_,
};

type setQueueAttributesRequest = {
  attributes: queueAttributeMap,
  queueUrl: string_,
};

type sendMessageBatchResultEntryList = list(sendMessageBatchResultEntry);

type receiveMessageRequest = {
  receiveRequestAttemptId: option(string_),
  waitTimeSeconds: option(integer_),
  visibilityTimeout: option(integer_),
  maxNumberOfMessages: option(integer_),
  messageAttributeNames: option(messageAttributeNameList),
  attributeNames: option(attributeNameList),
  queueUrl: string_,
};

type messageSystemAttributeValue = {
  dataType: string_,
  binaryListValues: option(binaryList),
  stringListValues: option(stringList),
  binaryValue: option(binary),
  stringValue: option(string_),
};

type messageAttributeValue = {
  dataType: string_,
  binaryListValues: option(binaryList),
  stringListValues: option(stringList),
  binaryValue: option(binary),
  stringValue: option(string_),
};

type listQueuesResult = {
  queueUrls: option(queueUrlList),
  nextToken: option(token),
};

type listQueueTagsResult = {tags: option(tagMap)};

type listDeadLetterSourceQueuesResult = {
  nextToken: option(token),
  queueUrls: queueUrlList,
};

type getQueueAttributesResult = {attributes: option(queueAttributeMap)};

type getQueueAttributesRequest = {
  attributeNames: option(attributeNameList),
  queueUrl: string_,
};

type deleteMessageBatchResultEntryList = list(deleteMessageBatchResultEntry);

type deleteMessageBatchRequestEntryList =
  list(deleteMessageBatchRequestEntry);

type createQueueRequest = {
  attributes: option(queueAttributeMap),
  tags: option(tagMap),
  queueName: string_,
};

type changeMessageVisibilityBatchResultEntryList =
  list(changeMessageVisibilityBatchResultEntry);

type changeMessageVisibilityBatchRequestEntryList =
  list(changeMessageVisibilityBatchRequestEntry);

type batchResultErrorEntryList = list(batchResultErrorEntry);

type addPermissionRequest = {
  actions: actionNameList,
  awsaccountIds: awsaccountIdList,
  label: string_,
  queueUrl: string_,
};

type sendMessageBatchResult = {
  failed: batchResultErrorEntryList,
  successful: sendMessageBatchResultEntryList,
};

type messageBodySystemAttributeMap =
  list((string, messageSystemAttributeValue));

type messageBodyAttributeMap = list((string, messageAttributeValue));

type deleteMessageBatchResult = {
  failed: batchResultErrorEntryList,
  successful: deleteMessageBatchResultEntryList,
};

type deleteMessageBatchRequest = {
  entries: deleteMessageBatchRequestEntryList,
  queueUrl: string_,
};

type changeMessageVisibilityBatchResult = {
  failed: batchResultErrorEntryList,
  successful: changeMessageVisibilityBatchResultEntryList,
};

type changeMessageVisibilityBatchRequest = {
  entries: changeMessageVisibilityBatchRequestEntryList,
  queueUrl: string_,
};

type sendMessageRequest = {
  messageGroupId: option(string_),
  messageDeduplicationId: option(string_),
  messageSystemAttributes: option(messageBodySystemAttributeMap),
  messageAttributes: option(messageBodyAttributeMap),
  delaySeconds: option(integer_),
  messageBody: string_,
  queueUrl: string_,
};

type sendMessageBatchRequestEntry = {
  messageGroupId: option(string_),
  messageDeduplicationId: option(string_),
  messageSystemAttributes: option(messageBodySystemAttributeMap),
  messageAttributes: option(messageBodyAttributeMap),
  delaySeconds: option(integer_),
  messageBody: string_,
  id: string_,
};

type message = {
  messageAttributes: option(messageBodyAttributeMap),
  md5OfMessageAttributes: option(string_),
  attributes: option(messageSystemAttributeMap),
  body: option(string_),
  md5OfBody: option(string_),
  receiptHandle: option(string_),
  messageId: option(string_),
};

type sendMessageBatchRequestEntryList = list(sendMessageBatchRequestEntry);

type messageList = list(message);

type sendMessageBatchRequest = {
  entries: sendMessageBatchRequestEntryList,
  queueUrl: string_,
};

type receiveMessageResult = {messages: option(messageList)};
