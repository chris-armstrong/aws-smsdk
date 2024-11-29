(** 
    SQS client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

type untag_queue_request = {
  tag_keys: string list;
  (** 
    The list of tags to be removed from the specified queue.
     *)

  queue_url: string;
  (** 
    The URL of the queue.
     *)

}

(** 
    Error code 400. Unsupported operation.
     *)
type unsupported_operation = {
  message: string option;
  
}

[@@ocaml.doc {| 
    The request was denied due to request throttling.
    
     {ul
          {- The rate of requests per second exceeds the Amazon Web Services KMS request quota for an account and Region.
             
             }
           {- A burst or sustained high rate of requests to change the state of the same KMS key. This condition is often known as a "hot key."
              
              }
           {- Requests for operations on KMS keys in a Amazon Web Services CloudHSM key store might be throttled at a lower-than-expected rate when the Amazon Web Services CloudHSM cluster associated with the Amazon Web Services CloudHSM key store is processing numerous commands, including those unrelated to the Amazon Web Services CloudHSM key store.
              
              }
          
      }
       |}]
type request_throttled = {
  message: string option;
  
}

(** 
    The specified queue doesn't exist.
     *)
type queue_does_not_exist = {
  message: string option;
  
}

(** 
    When the request to a queue is not HTTPS and SigV4.
     *)
type invalid_security = {
  message: string option;
  
}

(** 
    The [accountId] is invalid.
     *)
type invalid_address = {
  message: string option;
  
}

(** 
    The batch request contains more entries than permissible.
     *)
type too_many_entries_in_batch_request = {
  message: string option;
  
}

type tag_queue_request = {
  tags: (string * string) list;
  (** 
    The list of tags to be added to the specified queue.
     *)

  queue_url: string;
  (** 
    The URL of the queue.
     *)

}

type start_message_move_task_result = {
  task_handle: string option;
  (** 
    An identifier associated with a message movement task. You can use this identifier to cancel a specified message movement task using the [CancelMessageMoveTask] action.
     *)

}

type start_message_move_task_request = {
  max_number_of_messages_per_second: int option;
  (** 
    The number of messages to be moved per second (the message movement rate). You can use this field to define a fixed message movement rate. The maximum value for messages per second is 500. If this field is left blank, the system will optimize the rate based on the queue message backlog size, which may vary throughout the duration of the message movement task.
     *)

  destination_arn: string option;
  (** 
    The ARN of the queue that receives the moved messages. You can use this field to specify the destination queue where you would like to redrive messages. If this field is left blank, the messages will be redriven back to their respective original source queues.
     *)

  source_arn: string;
  (** 
    The ARN of the queue that contains the messages to be moved to another queue. Currently, only ARNs of dead-letter queues (DLQs) whose sources are other Amazon SQS queues are accepted. DLQs whose sources are non-SQS queues, such as Lambda or Amazon SNS topics, are not currently supported.
     *)

}

(** 
    One or more specified resources don't exist.
     *)
type resource_not_found_exception = {
  message: string option;
  
}

type queue_attribute_name = | SqsManagedSseEnabled
  | RedriveAllowPolicy
  | FifoThroughputLimit
  | DeduplicationScope
  | KmsDataKeyReusePeriodSeconds
  | KmsMasterKeyId
  | ContentBasedDeduplication
  | FifoQueue
  | RedrivePolicy
  | ReceiveMessageWaitTimeSeconds
  | DelaySeconds
  | ApproximateNumberOfMessagesDelayed
  | QueueArn
  | LastModifiedTimestamp
  | CreatedTimestamp
  | ApproximateNumberOfMessagesNotVisible
  | ApproximateNumberOfMessages
  | MessageRetentionPeriod
  | MaximumMessageSize
  | VisibilityTimeout
  | Policy
  | All

(** 
    
     *)
type set_queue_attributes_request = {
  attributes: (string * string) list;
  (** 
    A map of attributes to set.
    
     The following lists the names, descriptions, and values of the special request parameters that the [SetQueueAttributes] action uses:
     
      {ul
           {- [DelaySeconds] – The length of time, in seconds, for which the delivery of all messages in the queue is delayed. Valid values: An integer from 0 to 900 (15 minutes). Default: 0.
              
              }
            {- [MaximumMessageSize] – The limit of how many bytes a message can contain before Amazon SQS rejects it. Valid values: An integer from 1,024 bytes (1 KiB) up to 262,144 bytes (256 KiB). Default: 262,144 (256 KiB).
               
               }
            {- [MessageRetentionPeriod] – The length of time, in seconds, for which Amazon SQS retains a message. Valid values: An integer representing seconds, from 60 (1 minute) to 1,209,600 (14 days). Default: 345,600 (4 days). When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.
               
               }
            {- [Policy] – The queue's policy. A valid Amazon Web Services policy. For more information about policy structure, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/PoliciesOverview.html}Overview of Amazon Web Services IAM Policies} in the {i Identity and Access Management User Guide}.
               
               }
            {- [ReceiveMessageWaitTimeSeconds] – The length of time, in seconds, for which a 
               {[
               [ReceiveMessage]
               ]}
                action waits for a message to arrive. Valid values: An integer from 0 to 20 (seconds). Default: 0.
               
               }
            {- [VisibilityTimeout] – The visibility timeout for the queue, in seconds. Valid values: An integer from 0 to 43,200 (12 hours). Default: 30. For more information about the visibility timeout, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.
               
               }
           
      }
       The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues:}
       
        {ul
             {- [RedrivePolicy] – The string that includes the parameters for the dead-letter queue functionality of the source queue as a JSON object. The parameters are as follows:
                
                 {ul
                      {- [deadLetterTargetArn] – The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS moves messages after the value of [maxReceiveCount] is exceeded.
                         
                         }
                       {- [maxReceiveCount] – The number of times a message is delivered to the source queue before being moved to the dead-letter queue. Default: 10. When the [ReceiveCount] for a message exceeds the [maxReceiveCount] for a queue, Amazon SQS moves the message to the dead-letter-queue.
                          
                          }
                      
               }
               }
              {- [RedriveAllowPolicy] – The string that includes the parameters for the permissions for the dead-letter queue redrive permission and which source queues can specify dead-letter queues as a JSON object. The parameters are as follows:
                 
                  {ul
                       {- [redrivePermission] – The permission type that defines which source queues can specify the current queue as the dead-letter queue. Valid values are:
                          
                           {ul
                                {- [allowAll] – (Default) Any source queues in this Amazon Web Services account in the same Region can specify this queue as the dead-letter queue.
                                   
                                   }
                                 {- [denyAll] – No source queues can specify this queue as the dead-letter queue.
                                    
                                    }
                                 {- [byQueue] – Only queues specified by the [sourceQueueArns] parameter can specify this queue as the dead-letter queue.
                                    
                                    }
                                
                         }
                         }
                        {- [sourceQueueArns] – The Amazon Resource Names (ARN)s of the source queues that can specify this queue as the dead-letter queue and redrive messages. You can specify this parameter only when the [redrivePermission] parameter is set to [byQueue]. You can specify up to 10 source queue ARNs. To allow more than 10 source queues to specify dead-letter queues, set the [redrivePermission] parameter to [allowAll].
                           
                           }
                       
               }
               }
             
      }
       The dead-letter queue of a FIFO queue must also be a FIFO queue. Similarly, the dead-letter queue of a standard queue must also be a standard queue.
       
        The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html}server-side-encryption}:
        
         {ul
              {- [KmsMasterKeyId] – The ID of an Amazon Web Services managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms}Key Terms}. While the alias of the AWS-managed CMK for Amazon SQS is always [alias/aws/sqs], the alias of a custom CMK can, for example, be 
                 {[
                 alias/{i MyAlias}
                 ]}
                 . For more examples, see {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters}KeyId} in the {i Key Management Service API Reference}.
                 
                 }
               {- [KmsDataKeyReusePeriodSeconds] – The length of time, in seconds, for which Amazon SQS can reuse a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys}data key} to encrypt or decrypt messages before calling KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). Default: 300 (5 minutes). A shorter time period provides better security but results in more calls to KMS which might incur charges after Free Tier. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work}How Does the Data Key Reuse Period Work?}.
                  
                  }
               {- [SqsManagedSseEnabled] – Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).
                  
                  }
              
      }
       The following attribute applies only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO (first-in-first-out) queues}:
       
        {ul
             {- [ContentBasedDeduplication] – Enables content-based deduplication. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html}Exactly-once processing} in the {i Amazon SQS Developer Guide}. Note the following:
                
                 {ul
                      {- Every message must have a unique [MessageDeduplicationId].
                         
                          {ul
                               {- You may provide a [MessageDeduplicationId] explicitly.
                                  
                                  }
                                {- If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message).
                                   
                                   }
                                {- If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.
                                   
                                   }
                                {- If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.
                                   
                                   }
                               
                        }
                        }
                       {- When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.
                          
                          }
                       {- If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered.
                          
                          }
                      
               }
               }
             
      }
       The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/high-throughput-fifo.html}high throughput for FIFO queues}:
       
        {ul
             {- [DeduplicationScope] – Specifies whether message deduplication occurs at the message group or queue level. Valid values are [messageGroup] and [queue].
                
                }
              {- [FifoThroughputLimit] – Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are [perQueue] and [perMessageGroupId]. The [perMessageGroupId] value is allowed only when the value for [DeduplicationScope] is [messageGroup].
                 
                 }
             
      }
       To enable high throughput for FIFO queues, do the following:
       
        {ul
             {- Set [DeduplicationScope] to [messageGroup].
                
                }
              {- Set [FifoThroughputLimit] to [perMessageGroupId].
                 
                 }
             
      }
       If you set these attributes to anything other than the values shown for enabling high throughput, normal throughput is in effect and deduplication occurs as specified.
       
        For information on throughput quotas, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-messages.html}Quotas related to messages} in the {i Amazon SQS Developer Guide}.
         *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue whose attributes are set.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    The specified action violates a limit. For example, [ReceiveMessage] returns this error if the maximum number of in flight messages is reached and [AddPermission] returns this error if the maximum number of permissions for the queue is reached.
     *)
type over_limit = {
  message: string option;
  
}

(** 
    A queue attribute value is invalid.
     *)
type invalid_attribute_value = {
  message: string option;
  
}

(** 
    The specified attribute doesn't exist.
     *)
type invalid_attribute_name = {
  message: string option;
  
}

(** 
    The [MD5OfMessageBody] and [MessageId] elements.
     *)
type send_message_result = {
  sequence_number: string option;
  (** 
    This parameter applies only to FIFO (first-in-first-out) queues.
    
     The large, non-consecutive number that Amazon SQS assigns to each message.
     
      The length of [SequenceNumber] is 128 bits. [SequenceNumber] continues to increase for a particular [MessageGroupId].
       *)

  message_id: string option;
  (** 
    An attribute containing the [MessageId] of the message sent to the queue. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html}Queue and Message Identifiers} in the {i Amazon SQS Developer Guide}.
     *)

  md5_of_message_system_attributes: string option;
  (** 
    An MD5 digest of the non-URL-encoded message system attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest.
     *)

  md5_of_message_attributes: string option;
  (** 
    An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.
     *)

  md5_of_message_body: string option;
  (** 
    An MD5 digest of the non-URL-encoded message body string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.
     *)

}

(** 
    The user-specified message attribute value. For string data types, the [Value] attribute has the same restrictions on the content as the message body. For more information, see 
    {[
    [SendMessage].
    ]}
    
    
     [Name], [type], [value] and the message body must not be empty or null. All parts of the message attribute, including [Name], [Type], and [Value], are part of the message size restriction (256 KiB or 262,144 bytes).
      *)
type message_attribute_value = {
  data_type: string;
  (** 
    Amazon SQS supports the following logical data types: [String], [Number], and [Binary]. For the [Number] data type, you must use [StringValue].
    
     You can also append custom labels. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS Message Attributes} in the {i Amazon SQS Developer Guide}.
      *)

  binary_list_values: bytes list option;
  (** 
    Not implemented. Reserved for future use.
     *)

  string_list_values: string list option;
  (** 
    Not implemented. Reserved for future use.
     *)

  binary_value: bytes option;
  (** 
    Binary type attributes can store any binary data, such as compressed data, encrypted data, or images.
     *)

  string_value: string option;
  (** 
    Strings are Unicode with UTF-8 binary encoding. For a list of code values, see {{:http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}ASCII Printable Characters}.
     *)

}

(** 
    The user-specified message system attribute value. For string data types, the [Value] attribute has the same restrictions on the content as the message body. For more information, see 
    {[
    [SendMessage].
    ]}
    
    
     [Name], [type], [value] and the message body must not be empty or null.
      *)
type message_system_attribute_value = {
  data_type: string;
  (** 
    Amazon SQS supports the following logical data types: [String], [Number], and [Binary]. For the [Number] data type, you must use [StringValue].
    
     You can also append custom labels. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS Message Attributes} in the {i Amazon SQS Developer Guide}.
      *)

  binary_list_values: bytes list option;
  (** 
    Not implemented. Reserved for future use.
     *)

  string_list_values: string list option;
  (** 
    Not implemented. Reserved for future use.
     *)

  binary_value: bytes option;
  (** 
    Binary type attributes can store any binary data, such as compressed data, encrypted data, or images.
     *)

  string_value: string option;
  (** 
    Strings are Unicode with UTF-8 binary encoding. For a list of code values, see {{:http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}ASCII Printable Characters}.
     *)

}

type message_system_attribute_name_for_sends = | AWSTraceHeader

(** 
    
     *)
type send_message_request = {
  message_group_id: string option;
  [@ocaml.doc {| 
    This parameter applies only to FIFO (first-in-first-out) queues.
    
     The tag that specifies that a message belongs to a specific message group. Messages that belong to the same message group are processed in a FIFO manner (however, messages in different message groups might be processed out of order). To interleave multiple ordered streams within a single queue, use [MessageGroupId] values (for example, session data for multiple users). In this scenario, multiple consumers can process the queue, but the session data of each user is processed in a FIFO fashion.
     
      {ul
           {- You must associate a non-empty [MessageGroupId] with a message. If you don't provide a [MessageGroupId], the action fails.
              
              }
            {- [ReceiveMessage] might return messages with multiple [MessageGroupId] values. For each [MessageGroupId], the messages are sorted by time sent. The caller can't specify a [MessageGroupId].
               
               }
           
      }
       The maximum length of [MessageGroupId] is 128 characters. Valid values: alphanumeric characters and punctuation [(!"#$%&'()*+,-./:;<=>?@\[\\]^_`{|\}~)].
       
        For best practices of using [MessageGroupId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagegroupid-property.html}Using the MessageGroupId Property} in the {i Amazon SQS Developer Guide}.
        
         [MessageGroupId] is required for FIFO queues. You can't use it for Standard queues.
         
          |}]

  message_deduplication_id: string option;
  [@ocaml.doc {| 
    This parameter applies only to FIFO (first-in-first-out) queues.
    
     The token used for deduplication of sent messages. If a message with a particular [MessageDeduplicationId] is sent successfully, any messages sent with the same [MessageDeduplicationId] are accepted successfully but aren't delivered during the 5-minute deduplication interval. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html}Exactly-once processing} in the {i Amazon SQS Developer Guide}.
     
      {ul
           {- Every message must have a unique [MessageDeduplicationId],
              
               {ul
                    {- You may provide a [MessageDeduplicationId] explicitly.
                       
                       }
                     {- If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message).
                        
                        }
                     {- If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.
                        
                        }
                     {- If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.
                        
                        }
                    
             }
             }
            {- When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.
               
               }
            {- If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered.
               
               }
           
      }
       The [MessageDeduplicationId] is available to the consumer of the message (this can be useful for troubleshooting delivery issues).
       
        If a message is sent successfully but the acknowledgement is lost and the message is resent with the same [MessageDeduplicationId] after the deduplication interval, Amazon SQS can't detect duplicate messages.
        
         Amazon SQS continues to keep track of the message deduplication ID even after the message is received and deleted.
         
          The maximum length of [MessageDeduplicationId] is 128 characters. [MessageDeduplicationId] can contain alphanumeric characters ([a-z], [A-Z], [0-9]) and punctuation ([!"#$%&'()*+,-./:;<=>?@\[\\]^_`{|\}~]).
          
           For best practices of using [MessageDeduplicationId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagededuplicationid-property.html}Using the MessageDeduplicationId Property} in the {i Amazon SQS Developer Guide}.
            |}]

  message_system_attributes: (string * message_system_attribute_value) list option;
  (** 
    The message system attribute to send. Each message system attribute consists of a [Name], [Type], and [Value].
    
     {ul
          {- Currently, the only supported message system attribute is [AWSTraceHeader]. Its type must be [String] and its value must be a correctly formatted X-Ray trace header string.
             
             }
           {- The size of a message system attribute doesn't count towards the total size of a message.
              
              }
          
      }
       *)

  message_attributes: (string * message_attribute_value) list option;
  (** 
    Each message attribute consists of a [Name], [Type], and [Value]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS message attributes} in the {i Amazon SQS Developer Guide}.
     *)

  delay_seconds: int option;
  (** 
    The length of time, in seconds, for which to delay a specific message. Valid values: 0 to 900. Maximum: 15 minutes. Messages with a positive [DelaySeconds] value become available for processing after the delay period is finished. If you don't specify a value, the default value for the queue applies.
    
     When you set [FifoQueue], you can't set [DelaySeconds] per message. You can set this parameter only on a queue level.
     
      *)

  message_body: string;
  (** 
    The message to send. The minimum size is one character. The maximum size is 256 KiB.
    
     A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the {{:http://www.w3.org/TR/REC-xml/#charsets}W3C specification for characters}.
     
      [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to [#x10FFFF]
      
       Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing the message in the queue, as long as the message body contains at least one valid character.
       
        *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue to which a message is sent.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    Encloses a [MessageId] for a successfully-enqueued message in a 
    {[
    [SendMessageBatch].
    ]}
    
     *)
type send_message_batch_result_entry = {
  sequence_number: string option;
  (** 
    This parameter applies only to FIFO (first-in-first-out) queues.
    
     The large, non-consecutive number that Amazon SQS assigns to each message.
     
      The length of [SequenceNumber] is 128 bits. As [SequenceNumber] continues to increase for a particular [MessageGroupId].
       *)

  md5_of_message_system_attributes: string option;
  (** 
    An MD5 digest of the non-URL-encoded message system attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.
     *)

  md5_of_message_attributes: string option;
  (** 
    An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.
     *)

  md5_of_message_body: string;
  (** 
    An MD5 digest of the non-URL-encoded message body string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.
     *)

  message_id: string;
  (** 
    An identifier for the message.
     *)

  id: string;
  (** 
    An identifier for the message in this batch.
     *)

}

(** 
    Gives a detailed description of the result of an action on each entry in the request.
     *)
type batch_result_error_entry = {
  message: string option;
  (** 
    A message explaining why the action failed on this entry.
     *)

  code: string;
  (** 
    An error code representing why the action failed on this entry.
     *)

  sender_fault: bool;
  (** 
    Specifies whether the error happened due to the caller of the batch API action.
     *)

  id: string;
  (** 
    The [Id] of an entry in a batch request.
     *)

}

(** 
    For each message in the batch, the response contains a 
    {[
    [SendMessageBatchResultEntry]
    ]}
     tag if the message succeeds or a 
    {[
    [BatchResultErrorEntry]
    ]}
     tag if the message fails.
     *)
type send_message_batch_result = {
  failed: batch_result_error_entry list;
  (** 
    A list of 
    {[
    [BatchResultErrorEntry]
    ]}
     items with error details about each message that can't be enqueued.
     *)

  successful: send_message_batch_result_entry list;
  (** 
    A list of 
    {[
    [SendMessageBatchResultEntry]
    ]}
     items.
     *)

}

(** 
    Contains the details of a single Amazon SQS message along with an [Id].
     *)
type send_message_batch_request_entry = {
  message_group_id: string option;
  [@ocaml.doc {| 
    This parameter applies only to FIFO (first-in-first-out) queues.
    
     The tag that specifies that a message belongs to a specific message group. Messages that belong to the same message group are processed in a FIFO manner (however, messages in different message groups might be processed out of order). To interleave multiple ordered streams within a single queue, use [MessageGroupId] values (for example, session data for multiple users). In this scenario, multiple consumers can process the queue, but the session data of each user is processed in a FIFO fashion.
     
      {ul
           {- You must associate a non-empty [MessageGroupId] with a message. If you don't provide a [MessageGroupId], the action fails.
              
              }
            {- [ReceiveMessage] might return messages with multiple [MessageGroupId] values. For each [MessageGroupId], the messages are sorted by time sent. The caller can't specify a [MessageGroupId].
               
               }
           
      }
       The length of [MessageGroupId] is 128 characters. Valid values: alphanumeric characters and punctuation [(!"#$%&'()*+,-./:;<=>?@\[\\]^_`{|\}~)].
       
        For best practices of using [MessageGroupId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagegroupid-property.html}Using the MessageGroupId Property} in the {i Amazon SQS Developer Guide}.
        
         [MessageGroupId] is required for FIFO queues. You can't use it for Standard queues.
         
          |}]

  message_deduplication_id: string option;
  [@ocaml.doc {| 
    This parameter applies only to FIFO (first-in-first-out) queues.
    
     The token used for deduplication of messages within a 5-minute minimum deduplication interval. If a message with a particular [MessageDeduplicationId] is sent successfully, subsequent messages with the same [MessageDeduplicationId] are accepted successfully but aren't delivered. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html}Exactly-once processing} in the {i Amazon SQS Developer Guide}.
     
      {ul
           {- Every message must have a unique [MessageDeduplicationId],
              
               {ul
                    {- You may provide a [MessageDeduplicationId] explicitly.
                       
                       }
                     {- If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message).
                        
                        }
                     {- If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.
                        
                        }
                     {- If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.
                        
                        }
                    
             }
             }
            {- When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.
               
               }
            {- If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered.
               
               }
           
      }
       The [MessageDeduplicationId] is available to the consumer of the message (this can be useful for troubleshooting delivery issues).
       
        If a message is sent successfully but the acknowledgement is lost and the message is resent with the same [MessageDeduplicationId] after the deduplication interval, Amazon SQS can't detect duplicate messages.
        
         Amazon SQS continues to keep track of the message deduplication ID even after the message is received and deleted.
         
          The length of [MessageDeduplicationId] is 128 characters. [MessageDeduplicationId] can contain alphanumeric characters ([a-z], [A-Z], [0-9]) and punctuation ([!"#$%&'()*+,-./:;<=>?@\[\\]^_`{|\}~]).
          
           For best practices of using [MessageDeduplicationId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagededuplicationid-property.html}Using the MessageDeduplicationId Property} in the {i Amazon SQS Developer Guide}.
            |}]

  message_system_attributes: (string * message_system_attribute_value) list option;
  (** 
    The message system attribute to send Each message system attribute consists of a [Name], [Type], and [Value].
    
     {ul
          {- Currently, the only supported message system attribute is [AWSTraceHeader]. Its type must be [String] and its value must be a correctly formatted X-Ray trace header string.
             
             }
           {- The size of a message system attribute doesn't count towards the total size of a message.
              
              }
          
      }
       *)

  message_attributes: (string * message_attribute_value) list option;
  (** 
    Each message attribute consists of a [Name], [Type], and [Value]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS message attributes} in the {i Amazon SQS Developer Guide}.
     *)

  delay_seconds: int option;
  (** 
    The length of time, in seconds, for which a specific message is delayed. Valid values: 0 to 900. Maximum: 15 minutes. Messages with a positive [DelaySeconds] value become available for processing after the delay period is finished. If you don't specify a value, the default value for the queue is applied.
    
     When you set [FifoQueue], you can't set [DelaySeconds] per message. You can set this parameter only on a queue level.
     
      *)

  message_body: string;
  (** 
    The body of the message.
     *)

  id: string;
  (** 
    An identifier for a message in this batch used to communicate the result.
    
     The [Id]s of a batch request need to be unique within a request.
     
      This identifier can have up to 80 characters. The following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).
      
       *)

}

(** 
    
     *)
type send_message_batch_request = {
  entries: send_message_batch_request_entry list;
  (** 
    A list of 
    {[
    [SendMessageBatchRequestEntry]
    ]}
     items.
     *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue to which batched messages are sent.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    Amazon Web Services KMS throttles requests for the following conditions.
     *)
type kms_throttled = {
  message: string option;
  
}

(** 
    The request was rejected because the specified key policy isn't syntactically or semantically correct.
     *)
type kms_opt_in_required = {
  message: string option;
  
}

(** 
    The request was rejected because the specified entity or resource could not be found.
     *)
type kms_not_found = {
  message: string option;
  
}

(** 
    The request was rejected because the state of the specified resource is not valid for this request.
     *)
type kms_invalid_state = {
  message: string option;
  
}

(** 
    The request was rejected for one of the following reasons:
    
     {ul
          {- The KeyUsage value of the KMS key is incompatible with the API operation.
             
             }
           {- The encryption algorithm or signing algorithm specified for the operation is incompatible with the type of key material in the KMS key (KeySpec).
              
              }
          
      }
       *)
type kms_invalid_key_usage = {
  message: string option;
  
}

(** 
    The request was denied due to request throttling.
     *)
type kms_disabled = {
  message: string option;
  
}

(** 
    The caller doesn't have the required KMS access.
     *)
type kms_access_denied = {
  message: string option;
  
}

(** 
    The [Id] of a batch entry in a batch request doesn't abide by the specification.
     *)
type invalid_batch_entry_id = {
  message: string option;
  
}

(** 
    The batch request doesn't contain any entries.
     *)
type empty_batch_request = {
  message: string option;
  
}

(** 
    The length of all the messages put together is more than the limit.
     *)
type batch_request_too_long = {
  message: string option;
  
}

(** 
    Two or more batch entries in the request have the same [Id].
     *)
type batch_entry_ids_not_distinct = {
  message: string option;
  
}

(** 
    The message contains characters outside the allowed set.
     *)
type invalid_message_contents = {
  message: string option;
  
}

(** 
    
     *)
type remove_permission_request = {
  label: string;
  (** 
    The identification of the permission to remove. This is the label added using the 
    {[
    [AddPermission]
    ]}
     action.
     *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue from which permissions are removed.
    
     Queue URLs and names are case-sensitive.
      *)

}

type message_system_attribute_name = | DeadLetterQueueSourceArn
  | AWSTraceHeader
  | MessageGroupId
  | MessageDeduplicationId
  | SequenceNumber
  | ApproximateFirstReceiveTimestamp
  | ApproximateReceiveCount
  | SentTimestamp
  | SenderId
  | All

(** 
    An Amazon SQS message.
     *)
type message = {
  message_attributes: (string * message_attribute_value) list option;
  (** 
    Each message attribute consists of a [Name], [Type], and [Value]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS message attributes} in the {i Amazon SQS Developer Guide}.
     *)

  md5_of_message_attributes: string option;
  (** 
    An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.
     *)

  attributes: (string * string) list option;
  (** 
    A map of the attributes requested in 
    {[
    [ReceiveMessage]
    ]}
     to their respective values. Supported attributes:
    
     {ul
          {- [ApproximateReceiveCount]
             
             }
           {- [ApproximateFirstReceiveTimestamp]
              
              }
           {- [MessageDeduplicationId]
              
              }
           {- [MessageGroupId]
              
              }
           {- [SenderId]
              
              }
           {- [SentTimestamp]
              
              }
           {- [SequenceNumber]
              
              }
          
      }
       [ApproximateFirstReceiveTimestamp] and [SentTimestamp] are each returned as an integer representing the {{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds.
        *)

  body: string option;
  (** 
    The message's contents (not URL-encoded).
     *)

  md5_of_body: string option;
  (** 
    An MD5 digest of the non-URL-encoded message body string.
     *)

  receipt_handle: string option;
  (** 
    An identifier associated with the act of receiving the message. A new receipt handle is returned every time you receive a message. When deleting a message, you provide the last received receipt handle to delete the message.
     *)

  message_id: string option;
  (** 
    A unique identifier for the message. A [MessageId]is considered unique across all Amazon Web Services accounts for an extended period of time.
     *)

}

(** 
    A list of received messages.
     *)
type receive_message_result = {
  messages: message list option;
  (** 
    A list of messages.
     *)

}

(** 
    
     *)
type receive_message_request = {
  receive_request_attempt_id: string option;
  [@ocaml.doc {| 
    This parameter applies only to FIFO (first-in-first-out) queues.
    
     The token used for deduplication of [ReceiveMessage] calls. If a networking issue occurs after a [ReceiveMessage] action, and instead of a response you receive a generic error, it is possible to retry the same action with an identical [ReceiveRequestAttemptId] to retrieve the same set of messages, even if their visibility timeout has not yet expired.
     
      {ul
           {- You can use [ReceiveRequestAttemptId] only for 5 minutes after a [ReceiveMessage] action.
              
              }
            {- When you set [FifoQueue], a caller of the [ReceiveMessage] action can provide a [ReceiveRequestAttemptId] explicitly.
               
               }
            {- It is possible to retry the [ReceiveMessage] action with the same [ReceiveRequestAttemptId] if none of the messages have been modified (deleted or had their visibility changes).
               
               }
            {- During a visibility timeout, subsequent calls with the same [ReceiveRequestAttemptId] return the same messages and receipt handles. If a retry occurs within the deduplication interval, it resets the visibility timeout. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.
               
                If a caller of the [ReceiveMessage] action still processes messages when the visibility timeout expires and messages become visible, another worker consuming from the same queue can receive the same messages and therefore process duplicates. Also, if a consumer whose message processing time is longer than the visibility timeout tries to delete the processed messages, the action fails with an error.
                
                 To mitigate this effect, ensure that your application observes a safe threshold before the visibility timeout expires and extend the visibility timeout as necessary.
                 
                 }
            {- While messages with a particular [MessageGroupId] are invisible, no more messages belonging to the same [MessageGroupId] are returned until the visibility timeout expires. You can still receive messages with another [MessageGroupId] as long as it is also visible.
               
               }
            {- If a caller of [ReceiveMessage] can't track the [ReceiveRequestAttemptId], no retries work until the original visibility timeout expires. As a result, delays might occur but the messages in the queue remain in a strict order.
               
               }
           
      }
       The maximum length of [ReceiveRequestAttemptId] is 128 characters. [ReceiveRequestAttemptId] can contain alphanumeric characters ([a-z], [A-Z], [0-9]) and punctuation ([!"#$%&'()*+,-./:;<=>?@\[\\]^_`{|\}~]).
       
        For best practices of using [ReceiveRequestAttemptId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-receiverequestattemptid-request-parameter.html}Using the ReceiveRequestAttemptId Request Parameter} in the {i Amazon SQS Developer Guide}.
         |}]

  wait_time_seconds: int option;
  (** 
    The duration (in seconds) for which the call waits for a message to arrive in the queue before returning. If a message is available, the call returns sooner than [WaitTimeSeconds]. If no messages are available and the wait time expires, the call does not return a message list.
    
     To avoid HTTP errors, ensure that the HTTP response timeout for [ReceiveMessage] requests is longer than the [WaitTimeSeconds] parameter. For example, with the Java SDK, you can set HTTP transport settings using the {{:https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/http/nio/netty/NettyNioAsyncHttpClient.html}NettyNioAsyncHttpClient} for asynchronous clients, or the {{:https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/http/apache/ApacheHttpClient.html}ApacheHttpClient} for synchronous clients.
     
      *)

  visibility_timeout: int option;
  (** 
    The duration (in seconds) that the received messages are hidden from subsequent retrieve requests after being retrieved by a [ReceiveMessage] request.
     *)

  max_number_of_messages: int option;
  (** 
    The maximum number of messages to return. Amazon SQS never returns more messages than this value (however, fewer messages might be returned). Valid values: 1 to 10. Default: 1.
     *)

  message_attribute_names: string list option;
  (** 
    The name of the message attribute, where {i N} is the index.
    
     {ul
          {- The name can contain alphanumeric characters and the underscore ([_]), hyphen ([-]), and period ([.]).
             
             }
           {- The name is case-sensitive and must be unique among all attribute names for the message.
              
              }
           {- The name must not start with AWS-reserved prefixes such as [AWS.] or [Amazon.] (or any casing variants).
              
              }
           {- The name must not start or end with a period ([.]), and it should not have periods in succession ([..]).
              
              }
           {- The name can be up to 256 characters long.
              
              }
          
      }
       When using [ReceiveMessage], you can send a list of attribute names to receive, or you can return all of the attributes by specifying [All] or [.*] in your request. You can also use all message attributes starting with a prefix, for example [bar.*].
        *)

  message_system_attribute_names: message_system_attribute_name list option;
  (** 
    A list of attributes that need to be returned along with each message. These attributes include:
    
     {ul
          {- [All] – Returns all values.
             
             }
           {- [ApproximateFirstReceiveTimestamp] – Returns the time the message was first received from the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).
              
              }
           {- [ApproximateReceiveCount] – Returns the number of times a message has been received across all queues but not deleted.
              
              }
           {- [AWSTraceHeader] – Returns the X-Ray trace header string.
              
              }
           {- [SenderId]
              
               {ul
                    {- For a user, returns the user ID, for example [ABCDEFGHI1JKLMNOPQ23R].
                       
                       }
                     {- For an IAM role, returns the IAM role ID, for example [ABCDE1F2GH3I4JK5LMNOP:i-a123b456].
                        
                        }
                    
            }
            }
           {- [SentTimestamp] – Returns the time the message was sent to the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).
              
              }
           {- [SqsManagedSseEnabled] – Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).
              
              }
           {- [MessageDeduplicationId] – Returns the value provided by the producer that calls the 
              {[
              [SendMessage]
              ]}
               action.
              
              }
           {- [MessageGroupId] – Returns the value provided by the producer that calls the 
              {[
              [SendMessage]
              ]}
               action. Messages with the same [MessageGroupId] are returned in sequence.
              
              }
           {- [SequenceNumber] – Returns the value provided by Amazon SQS.
              
              }
          
      }
       *)

  attribute_names: queue_attribute_name list option;
  (** 
    This parameter has been deprecated but will be supported for backward compatibility. To provide attribute names, you are encouraged to use [MessageSystemAttributeNames].
    
     A list of attributes that need to be returned along with each message. These attributes include:
     
      {ul
           {- [All] – Returns all values.
              
              }
            {- [ApproximateFirstReceiveTimestamp] – Returns the time the message was first received from the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).
               
               }
            {- [ApproximateReceiveCount] – Returns the number of times a message has been received across all queues but not deleted.
               
               }
            {- [AWSTraceHeader] – Returns the X-Ray trace header string.
               
               }
            {- [SenderId]
               
                {ul
                     {- For a user, returns the user ID, for example [ABCDEFGHI1JKLMNOPQ23R].
                        
                        }
                      {- For an IAM role, returns the IAM role ID, for example [ABCDE1F2GH3I4JK5LMNOP:i-a123b456].
                         
                         }
                     
             }
             }
            {- [SentTimestamp] – Returns the time the message was sent to the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).
               
               }
            {- [SqsManagedSseEnabled] – Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).
               
               }
            {- [MessageDeduplicationId] – Returns the value provided by the producer that calls the 
               {[
               [SendMessage]
               ]}
                action.
               
               }
            {- [MessageGroupId] – Returns the value provided by the producer that calls the 
               {[
               [SendMessage]
               ]}
                action. Messages with the same [MessageGroupId] are returned in sequence.
               
               }
            {- [SequenceNumber] – Returns the value provided by Amazon SQS.
               
               }
           
      }
       *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue from which messages are received.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    The specified receipt handle isn't valid.
     *)
type receipt_handle_is_invalid = {
  message: string option;
  
}

(** 
    A queue with this name already exists. Amazon SQS returns this error only if the request includes attributes whose values differ from those of the existing queue.
     *)
type queue_name_exists = {
  message: string option;
  
}

(** 
    You must wait 60 seconds after deleting a queue before you can create another queue with the same name.
     *)
type queue_deleted_recently = {
  message: string option;
  
}

(** 
    
     *)
type purge_queue_request = {
  queue_url: string;
  (** 
    The URL of the queue from which the [PurgeQueue] action deletes messages.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    Indicates that the specified queue previously received a [PurgeQueue] request within the last 60 seconds (the time it can take to delete the messages in the queue).
     *)
type purge_queue_in_progress = {
  message: string option;
  
}

(** 
    The specified message isn't in flight.
     *)
type message_not_inflight = unit

(** 
    A list of your queues.
     *)
type list_queues_result = {
  next_token: string option;
  (** 
    Pagination token to include in the next request. Token value is [null] if there are no additional results to request, or if you did not set [MaxResults] in the request.
     *)

  queue_urls: string list option;
  (** 
    A list of queue URLs, up to 1,000 entries, or the value of [MaxResults] that you sent in the request.
     *)

}

(** 
    
     *)
type list_queues_request = {
  max_results: int option;
  (** 
    Maximum number of results to include in the response. Value range is 1 to 1000. You must set [MaxResults] to receive a value for [NextToken] in the response.
     *)

  next_token: string option;
  (** 
    Pagination token to request the next set of results.
     *)

  queue_name_prefix: string option;
  (** 
    A string to use for filtering the list results. Only those queues whose name begins with the specified string are returned.
    
     Queue URLs and names are case-sensitive.
      *)

}

type list_queue_tags_result = {
  tags: (string * string) list option;
  (** 
    The list of all tags added to the specified queue.
     *)

}

type list_queue_tags_request = {
  queue_url: string;
  (** 
    The URL of the queue.
     *)

}

(** 
    Contains the details of a message movement task.
     *)
type list_message_move_tasks_result_entry = {
  started_timestamp: int option;
  (** 
    The timestamp of starting the message movement task.
     *)

  failure_reason: string option;
  (** 
    The task failure reason (only included if the task status is FAILED).
     *)

  approximate_number_of_messages_to_move: int option;
  (** 
    The number of messages to be moved from the source queue. This number is obtained at the time of starting the message movement task and is only included after the message movement task is selected to start.
     *)

  approximate_number_of_messages_moved: int option;
  (** 
    The approximate number of messages already moved to the destination queue.
     *)

  max_number_of_messages_per_second: int option;
  (** 
    The number of messages to be moved per second (the message movement rate), if it has been specified in the [StartMessageMoveTask] request. If a [MaxNumberOfMessagesPerSecond] has not been specified in the [StartMessageMoveTask] request, this field value will be NULL.
     *)

  destination_arn: string option;
  (** 
    The ARN of the destination queue if it has been specified in the [StartMessageMoveTask] request. If a [DestinationArn] has not been specified in the [StartMessageMoveTask] request, this field value will be NULL.
     *)

  source_arn: string option;
  (** 
    The ARN of the queue that contains the messages to be moved to another queue.
     *)

  status: string option;
  (** 
    The status of the message movement task. Possible values are: RUNNING, COMPLETED, CANCELLING, CANCELLED, and FAILED.
     *)

  task_handle: string option;
  (** 
    An identifier associated with a message movement task. When this field is returned in the response of the [ListMessageMoveTasks] action, it is only populated for tasks that are in RUNNING status.
     *)

}

type list_message_move_tasks_result = {
  results: list_message_move_tasks_result_entry list option;
  (** 
    A list of message movement tasks and their attributes.
     *)

}

type list_message_move_tasks_request = {
  max_results: int option;
  (** 
    The maximum number of results to include in the response. The default is 1, which provides the most recent message movement task. The upper limit is 10.
     *)

  source_arn: string;
  (** 
    The ARN of the queue whose message movement tasks are to be listed.
     *)

}

(** 
    A list of your dead letter source queues.
     *)
type list_dead_letter_source_queues_result = {
  next_token: string option;
  (** 
    Pagination token to include in the next request. Token value is [null] if there are no additional results to request, or if you did not set [MaxResults] in the request.
     *)

  queue_urls: string list;
  (** 
    A list of source queue URLs that have the [RedrivePolicy] queue attribute configured with a dead-letter queue.
     *)

}

(** 
    
     *)
type list_dead_letter_source_queues_request = {
  max_results: int option;
  (** 
    Maximum number of results to include in the response. Value range is 1 to 1000. You must set [MaxResults] to receive a value for [NextToken] in the response.
     *)

  next_token: string option;
  (** 
    Pagination token to request the next set of results.
     *)

  queue_url: string;
  (** 
    The URL of a dead-letter queue.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    The specified receipt handle isn't valid for the current version.
     *)
type invalid_id_format = unit

(** 
    For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-api-responses.html}Interpreting Responses} in the {i Amazon SQS Developer Guide}.
     *)
type get_queue_url_result = {
  queue_url: string option;
  (** 
    The URL of the queue.
     *)

}

(** 
    
     *)
type get_queue_url_request = {
  queue_owner_aws_account_id: string option;
  (** 
    The Amazon Web Services account ID of the account that created the queue.
     *)

  queue_name: string;
  (** 
    The name of the queue whose URL must be fetched. Maximum 80 characters. Valid values: alphanumeric characters, hyphens ([-]), and underscores ([_]).
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    A list of returned queue attributes.
     *)
type get_queue_attributes_result = {
  attributes: (string * string) list option;
  (** 
    A map of attributes to their respective values.
     *)

}

(** 
    
     *)
type get_queue_attributes_request = {
  attribute_names: queue_attribute_name list option;
  (** 
    A list of attributes for which to retrieve information.
    
     The [AttributeNames] parameter is optional, but if you don't specify values for this parameter, the request returns empty results.
     
      In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.
      
       The following attributes are supported:
       
        The [ApproximateNumberOfMessagesDelayed], [ApproximateNumberOfMessagesNotVisible], and [ApproximateNumberOfMessages] metrics may not achieve consistency until at least 1 minute after the producers stop sending messages. This period is required for the queue metadata to reach eventual consistency.
        
         {ul
              {- [All] – Returns all values.
                 
                 }
               {- [ApproximateNumberOfMessages] – Returns the approximate number of messages available for retrieval from the queue.
                  
                  }
               {- [ApproximateNumberOfMessagesDelayed] – Returns the approximate number of messages in the queue that are delayed and not available for reading immediately. This can happen when the queue is configured as a delay queue or when a message has been sent with a delay parameter.
                  
                  }
               {- [ApproximateNumberOfMessagesNotVisible] – Returns the approximate number of messages that are in flight. Messages are considered to be {i in flight} if they have been sent to a client but have not yet been deleted or have not yet reached the end of their visibility window.
                  
                  }
               {- [CreatedTimestamp] – Returns the time when the queue was created in seconds ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time}).
                  
                  }
               {- [DelaySeconds] – Returns the default delay on the queue in seconds.
                  
                  }
               {- [LastModifiedTimestamp] – Returns the time when the queue was last changed in seconds ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time}).
                  
                  }
               {- [MaximumMessageSize] – Returns the limit of how many bytes a message can contain before Amazon SQS rejects it.
                  
                  }
               {- [MessageRetentionPeriod] – Returns the length of time, in seconds, for which Amazon SQS retains a message. When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.
                  
                  }
               {- [Policy] – Returns the policy of the queue.
                  
                  }
               {- [QueueArn] – Returns the Amazon resource name (ARN) of the queue.
                  
                  }
               {- [ReceiveMessageWaitTimeSeconds] – Returns the length of time, in seconds, for which the [ReceiveMessage] action waits for a message to arrive.
                  
                  }
               {- [VisibilityTimeout] – Returns the visibility timeout for the queue. For more information about the visibility timeout, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.
                  
                  }
              
      }
       The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues:}
       
        {ul
             {- [RedrivePolicy] – The string that includes the parameters for the dead-letter queue functionality of the source queue as a JSON object. The parameters are as follows:
                
                 {ul
                      {- [deadLetterTargetArn] – The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS moves messages after the value of [maxReceiveCount] is exceeded.
                         
                         }
                       {- [maxReceiveCount] – The number of times a message is delivered to the source queue before being moved to the dead-letter queue. Default: 10. When the [ReceiveCount] for a message exceeds the [maxReceiveCount] for a queue, Amazon SQS moves the message to the dead-letter-queue.
                          
                          }
                      
               }
               }
              {- [RedriveAllowPolicy] – The string that includes the parameters for the permissions for the dead-letter queue redrive permission and which source queues can specify dead-letter queues as a JSON object. The parameters are as follows:
                 
                  {ul
                       {- [redrivePermission] – The permission type that defines which source queues can specify the current queue as the dead-letter queue. Valid values are:
                          
                           {ul
                                {- [allowAll] – (Default) Any source queues in this Amazon Web Services account in the same Region can specify this queue as the dead-letter queue.
                                   
                                   }
                                 {- [denyAll] – No source queues can specify this queue as the dead-letter queue.
                                    
                                    }
                                 {- [byQueue] – Only queues specified by the [sourceQueueArns] parameter can specify this queue as the dead-letter queue.
                                    
                                    }
                                
                         }
                         }
                        {- [sourceQueueArns] – The Amazon Resource Names (ARN)s of the source queues that can specify this queue as the dead-letter queue and redrive messages. You can specify this parameter only when the [redrivePermission] parameter is set to [byQueue]. You can specify up to 10 source queue ARNs. To allow more than 10 source queues to specify dead-letter queues, set the [redrivePermission] parameter to [allowAll].
                           
                           }
                       
               }
               }
             
      }
       The dead-letter queue of a FIFO queue must also be a FIFO queue. Similarly, the dead-letter queue of a standard queue must also be a standard queue.
       
        The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html}server-side-encryption}:
        
         {ul
              {- [KmsMasterKeyId] – Returns the ID of an Amazon Web Services managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms}Key Terms}.
                 
                 }
               {- [KmsDataKeyReusePeriodSeconds] – Returns the length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling KMS again. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work}How Does the Data Key Reuse Period Work?}.
                  
                  }
               {- [SqsManagedSseEnabled] – Returns information about whether the queue is using SSE-SQS encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).
                  
                  }
              
      }
       The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO (first-in-first-out) queues}:
       
        {ul
             {- [FifoQueue] – Returns information about whether the queue is FIFO. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-understanding-logic.html}FIFO queue logic} in the {i Amazon SQS Developer Guide}.
                
                 To determine whether a queue is {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO}, you can check whether [QueueName] ends with the [.fifo] suffix.
                 
                 }
              {- [ContentBasedDeduplication] – Returns whether content-based deduplication is enabled for the queue. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html}Exactly-once processing} in the {i Amazon SQS Developer Guide}.
                 
                 }
             
      }
       The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/high-throughput-fifo.html}high throughput for FIFO queues}:
       
        {ul
             {- [DeduplicationScope] – Specifies whether message deduplication occurs at the message group or queue level. Valid values are [messageGroup] and [queue].
                
                }
              {- [FifoThroughputLimit] – Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are [perQueue] and [perMessageGroupId]. The [perMessageGroupId] value is allowed only when the value for [DeduplicationScope] is [messageGroup].
                 
                 }
             
      }
       To enable high throughput for FIFO queues, do the following:
       
        {ul
             {- Set [DeduplicationScope] to [messageGroup].
                
                }
              {- Set [FifoThroughputLimit] to [perMessageGroupId].
                 
                 }
             
      }
       If you set these attributes to anything other than the values shown for enabling high throughput, normal throughput is in effect and deduplication occurs as specified.
       
        For information on throughput quotas, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-messages.html}Quotas related to messages} in the {i Amazon SQS Developer Guide}.
         *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue whose attribute information is retrieved.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    
     *)
type delete_queue_request = {
  queue_url: string;
  (** 
    The URL of the Amazon SQS queue to delete.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    
     *)
type delete_message_request = {
  receipt_handle: string;
  (** 
    The receipt handle associated with the message to delete.
     *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue from which messages are deleted.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    Encloses the [Id] of an entry in 
    {[
    [DeleteMessageBatch].
    ]}
    
     *)
type delete_message_batch_result_entry = {
  id: string;
  (** 
    Represents a successfully deleted message.
     *)

}

(** 
    For each message in the batch, the response contains a 
    {[
    [DeleteMessageBatchResultEntry]
    ]}
     tag if the message is deleted or a 
    {[
    [BatchResultErrorEntry]
    ]}
     tag if the message can't be deleted.
     *)
type delete_message_batch_result = {
  failed: batch_result_error_entry list;
  (** 
    A list of 
    {[
    [BatchResultErrorEntry]
    ]}
     items.
     *)

  successful: delete_message_batch_result_entry list;
  (** 
    A list of 
    {[
    [DeleteMessageBatchResultEntry]
    ]}
     items.
     *)

}

(** 
    Encloses a receipt handle and an identifier for it.
     *)
type delete_message_batch_request_entry = {
  receipt_handle: string;
  (** 
    A receipt handle.
     *)

  id: string;
  (** 
    The identifier for this particular receipt handle. This is used to communicate the result.
    
     The [Id]s of a batch request need to be unique within a request.
     
      This identifier can have up to 80 characters. The following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).
      
       *)

}

(** 
    
     *)
type delete_message_batch_request = {
  entries: delete_message_batch_request_entry list;
  (** 
    Lists the receipt handles for the messages to be deleted.
     *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue from which messages are deleted.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    Returns the [QueueUrl] attribute of the created queue.
     *)
type create_queue_result = {
  queue_url: string option;
  (** 
    The URL of the created Amazon SQS queue.
     *)

}

(** 
    
     *)
type create_queue_request = {
  tags: (string * string) list option;
  (** 
    Add cost allocation tags to the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.
    
     When you use queue tags, keep the following guidelines in mind:
     
      {ul
           {- Adding more than 50 tags to a queue isn't recommended.
              
              }
            {- Tags don't have any semantic meaning. Amazon SQS interprets tags as character strings.
               
               }
            {- Tags are case-sensitive.
               
               }
            {- A new tag with a key identical to that of an existing tag overwrites the existing tag.
               
               }
           
      }
       For a full list of tag restrictions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-limits.html#limits-queues}Quotas related to queues} in the {i Amazon SQS Developer Guide}.
       
        To be able to tag a queue on creation, you must have the [sqs:CreateQueue] and [sqs:TagQueue] permissions.
        
         Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
         
          *)

  attributes: (string * string) list option;
  (** 
    A map of attributes with their corresponding values.
    
     The following lists the names, descriptions, and values of the special request parameters that the [CreateQueue] action uses:
     
      {ul
           {- [DelaySeconds] – The length of time, in seconds, for which the delivery of all messages in the queue is delayed. Valid values: An integer from 0 to 900 seconds (15 minutes). Default: 0.
              
              }
            {- [MaximumMessageSize] – The limit of how many bytes a message can contain before Amazon SQS rejects it. Valid values: An integer from 1,024 bytes (1 KiB) to 262,144 bytes (256 KiB). Default: 262,144 (256 KiB).
               
               }
            {- [MessageRetentionPeriod] – The length of time, in seconds, for which Amazon SQS retains a message. Valid values: An integer from 60 seconds (1 minute) to 1,209,600 seconds (14 days). Default: 345,600 (4 days). When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.
               
               }
            {- [Policy] – The queue's policy. A valid Amazon Web Services policy. For more information about policy structure, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/PoliciesOverview.html}Overview of Amazon Web Services IAM Policies} in the {i IAM User Guide}.
               
               }
            {- [ReceiveMessageWaitTimeSeconds] – The length of time, in seconds, for which a 
               {[
               [ReceiveMessage]
               ]}
                action waits for a message to arrive. Valid values: An integer from 0 to 20 (seconds). Default: 0.
               
               }
            {- [VisibilityTimeout] – The visibility timeout for the queue, in seconds. Valid values: An integer from 0 to 43,200 (12 hours). Default: 30. For more information about the visibility timeout, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.
               
               }
           
      }
       The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues:}
       
        {ul
             {- [RedrivePolicy] – The string that includes the parameters for the dead-letter queue functionality of the source queue as a JSON object. The parameters are as follows:
                
                 {ul
                      {- [deadLetterTargetArn] – The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS moves messages after the value of [maxReceiveCount] is exceeded.
                         
                         }
                       {- [maxReceiveCount] – The number of times a message is delivered to the source queue before being moved to the dead-letter queue. Default: 10. When the [ReceiveCount] for a message exceeds the [maxReceiveCount] for a queue, Amazon SQS moves the message to the dead-letter-queue.
                          
                          }
                      
               }
               }
              {- [RedriveAllowPolicy] – The string that includes the parameters for the permissions for the dead-letter queue redrive permission and which source queues can specify dead-letter queues as a JSON object. The parameters are as follows:
                 
                  {ul
                       {- [redrivePermission] – The permission type that defines which source queues can specify the current queue as the dead-letter queue. Valid values are:
                          
                           {ul
                                {- [allowAll] – (Default) Any source queues in this Amazon Web Services account in the same Region can specify this queue as the dead-letter queue.
                                   
                                   }
                                 {- [denyAll] – No source queues can specify this queue as the dead-letter queue.
                                    
                                    }
                                 {- [byQueue] – Only queues specified by the [sourceQueueArns] parameter can specify this queue as the dead-letter queue.
                                    
                                    }
                                
                         }
                         }
                        {- [sourceQueueArns] – The Amazon Resource Names (ARN)s of the source queues that can specify this queue as the dead-letter queue and redrive messages. You can specify this parameter only when the [redrivePermission] parameter is set to [byQueue]. You can specify up to 10 source queue ARNs. To allow more than 10 source queues to specify dead-letter queues, set the [redrivePermission] parameter to [allowAll].
                           
                           }
                       
               }
               }
             
      }
       The dead-letter queue of a FIFO queue must also be a FIFO queue. Similarly, the dead-letter queue of a standard queue must also be a standard queue.
       
        The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html}server-side-encryption}:
        
         {ul
              {- [KmsMasterKeyId] – The ID of an Amazon Web Services managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms}Key Terms}. While the alias of the Amazon Web Services managed CMK for Amazon SQS is always [alias/aws/sqs], the alias of a custom CMK can, for example, be 
                 {[
                 alias/{i MyAlias}
                 ]}
                 . For more examples, see {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters}KeyId} in the {i Key Management Service API Reference}.
                 
                 }
               {- [KmsDataKeyReusePeriodSeconds] – The length of time, in seconds, for which Amazon SQS can reuse a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys}data key} to encrypt or decrypt messages before calling KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). Default: 300 (5 minutes). A shorter time period provides better security but results in more calls to KMS which might incur charges after Free Tier. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work}How Does the Data Key Reuse Period Work?}
                  
                  }
               {- [SqsManagedSseEnabled] – Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).
                  
                  }
              
      }
       The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO (first-in-first-out) queues}:
       
        {ul
             {- [FifoQueue] – Designates a queue as FIFO. Valid values are [true] and [false]. If you don't specify the [FifoQueue] attribute, Amazon SQS creates a standard queue. You can provide this attribute only during queue creation. You can't change it for an existing queue. When you set this attribute, you must also provide the [MessageGroupId] for your messages explicitly.
                
                 For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-understanding-logic.html}FIFO queue logic} in the {i Amazon SQS Developer Guide}.
                 
                 }
              {- [ContentBasedDeduplication] – Enables content-based deduplication. Valid values are [true] and [false]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html}Exactly-once processing} in the {i Amazon SQS Developer Guide}. Note the following:
                 
                  {ul
                       {- Every message must have a unique [MessageDeduplicationId].
                          
                           {ul
                                {- You may provide a [MessageDeduplicationId] explicitly.
                                   
                                   }
                                 {- If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message).
                                    
                                    }
                                 {- If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.
                                    
                                    }
                                 {- If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.
                                    
                                    }
                                
                         }
                         }
                        {- When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.
                           
                           }
                        {- If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered.
                           
                           }
                       
               }
               }
             
      }
       The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/high-throughput-fifo.html}high throughput for FIFO queues}:
       
        {ul
             {- [DeduplicationScope] – Specifies whether message deduplication occurs at the message group or queue level. Valid values are [messageGroup] and [queue].
                
                }
              {- [FifoThroughputLimit] – Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are [perQueue] and [perMessageGroupId]. The [perMessageGroupId] value is allowed only when the value for [DeduplicationScope] is [messageGroup].
                 
                 }
             
      }
       To enable high throughput for FIFO queues, do the following:
       
        {ul
             {- Set [DeduplicationScope] to [messageGroup].
                
                }
              {- Set [FifoThroughputLimit] to [perMessageGroupId].
                 
                 }
             
      }
       If you set these attributes to anything other than the values shown for enabling high throughput, normal throughput is in effect and deduplication occurs as specified.
       
        For information on throughput quotas, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-messages.html}Quotas related to messages} in the {i Amazon SQS Developer Guide}.
         *)

  queue_name: string;
  (** 
    The name of the new queue. The following limits apply to this name:
    
     {ul
          {- A queue name can have up to 80 characters.
             
             }
           {- Valid values: alphanumeric characters, hyphens ([-]), and underscores ([_]).
              
              }
           {- A FIFO queue name must end with the [.fifo] suffix.
              
              }
          
      }
       Queue URLs and names are case-sensitive.
        *)

}

type change_message_visibility_request = {
  visibility_timeout: int;
  (** 
    The new value for the message's visibility timeout (in seconds). Values range: [0] to [43200]. Maximum: 12 hours.
     *)

  receipt_handle: string;
  (** 
    The receipt handle associated with the message, whose visibility timeout is changed. This parameter is returned by the 
    {[
    [ReceiveMessage]
    ]}
     action.
     *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue whose message's visibility is changed.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    Encloses the [Id] of an entry in 
    {[
    [ChangeMessageVisibilityBatch].
    ]}
    
     *)
type change_message_visibility_batch_result_entry = {
  id: string;
  (** 
    Represents a message whose visibility timeout has been changed successfully.
     *)

}

(** 
    For each message in the batch, the response contains a 
    {[
    [ChangeMessageVisibilityBatchResultEntry]
    ]}
     tag if the message succeeds or a 
    {[
    [BatchResultErrorEntry]
    ]}
     tag if the message fails.
     *)
type change_message_visibility_batch_result = {
  failed: batch_result_error_entry list;
  (** 
    A list of 
    {[
    [BatchResultErrorEntry]
    ]}
     items.
     *)

  successful: change_message_visibility_batch_result_entry list;
  (** 
    A list of 
    {[
    [ChangeMessageVisibilityBatchResultEntry]
    ]}
     items.
     *)

}

(** 
    Encloses a receipt handle and an entry ID for each message in 
    {[
    [ChangeMessageVisibilityBatch].
    ]}
    
     *)
type change_message_visibility_batch_request_entry = {
  visibility_timeout: int option;
  (** 
    The new value (in seconds) for the message's visibility timeout.
     *)

  receipt_handle: string;
  (** 
    A receipt handle.
     *)

  id: string;
  (** 
    An identifier for this particular receipt handle used to communicate the result.
    
     The [Id]s of a batch request need to be unique within a request.
     
      This identifier can have up to 80 characters. The following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).
      
       *)

}

(** 
    
     *)
type change_message_visibility_batch_request = {
  entries: change_message_visibility_batch_request_entry list;
  (** 
    Lists the receipt handles of the messages for which the visibility timeout must be changed.
     *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue whose messages' visibility is changed.
    
     Queue URLs and names are case-sensitive.
      *)

}

type cancel_message_move_task_result = {
  approximate_number_of_messages_moved: int option;
  (** 
    The approximate number of messages already moved to the destination queue.
     *)

}

type cancel_message_move_task_request = {
  task_handle: string;
  (** 
    An identifier associated with a message movement task.
     *)

}

(** 
    
     *)
type add_permission_request = {
  actions: string list;
  (** 
    The action the client wants to allow for the specified principal. Valid values: the name of any action or [*].
    
     For more information about these actions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-overview-of-managing-access.html}Overview of Managing Access Permissions to Your Amazon Simple Queue Service Resource} in the {i Amazon SQS Developer Guide}.
     
      Specifying [SendMessage], [DeleteMessage], or [ChangeMessageVisibility] for [ActionName.n] also grants permissions for the corresponding batch versions of those actions: [SendMessageBatch], [DeleteMessageBatch], and [ChangeMessageVisibilityBatch].
       *)

  aws_account_ids: string list;
  (** 
    The Amazon Web Services account numbers of the {{:https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P}principals} who are to receive permission. For information about locating the Amazon Web Services account identification, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-making-api-requests.html#sqs-api-request-authentication}Your Amazon Web Services Identifiers} in the {i Amazon SQS Developer Guide}.
     *)

  label: string;
  (** 
    The unique identification of the permission you're setting (for example, [AliceSendMessage]). Maximum 80 characters. Allowed characters include alphanumeric characters, hyphens ([-]), and underscores ([_]).
     *)

  queue_url: string;
  (** 
    The URL of the Amazon SQS queue to which permissions are added.
    
     Queue URLs and names are case-sensitive.
      *)

}

(** 
    Welcome to the {i Amazon SQS API Reference}.
    
     Amazon SQS is a reliable, highly-scalable hosted queue for storing messages as they travel between applications or microservices. Amazon SQS moves data between distributed application components and helps you decouple these components.
     
      For information on the permissions you need to use this API, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-authentication-and-access-control.html}Identity and access management} in the {i Amazon SQS Developer Guide.}
      
       You can use {{:http://aws.amazon.com/tools/#sdk}Amazon Web Services SDKs} to access Amazon SQS using your favorite programming language. The SDKs perform tasks such as the following automatically:
       
        {ul
             {- Cryptographically sign your service requests
                
                }
              {- Retry requests
                 
                 }
              {- Handle error responses
                 
                 }
             
      }
       {b Additional information}
       
        {ul
             {- {{:http://aws.amazon.com/sqs/}Amazon SQS Product Page}
                
                }
              {- {i Amazon SQS Developer Guide}
                 
                  {ul
                       {- {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-making-api-requests.html}Making API Requests}
                          
                          }
                        {- {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS Message Attributes}
                           
                           }
                        {- {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}Amazon SQS Dead-Letter Queues}
                           
                           }
                       
               }
               }
              {- {{:http://docs.aws.amazon.com/cli/latest/reference/sqs/index.html}Amazon SQS in the {i Command Line Interface}}
                 
                 }
              {- {i Amazon Web Services General Reference}
                 
                  {ul
                       {- {{:https://docs.aws.amazon.com/general/latest/gr/rande.html#sqs_region}Regions and Endpoints}
                          
                          }
                       
               }
               }
             
      }
       *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_untag_queue_request :
  tag_keys:string list -> queue_url:string -> unit
-> untag_queue_request
(** Create a {!type-untag_queue_request} type *)

val make_tag_queue_request :
  tags:(string * string) list -> queue_url:string -> unit
-> tag_queue_request
(** Create a {!type-tag_queue_request} type *)

val make_start_message_move_task_request :
  ?max_number_of_messages_per_second:int ->
  ?destination_arn:string ->
  source_arn:string ->
  unit
-> start_message_move_task_request
(** Create a {!type-start_message_move_task_request} type *)

val make_set_queue_attributes_request :
  attributes:(string * string) list -> queue_url:string -> unit
-> set_queue_attributes_request
(** Create a {!type-set_queue_attributes_request} type *)

val make_message_attribute_value :
  ?binary_list_values:bytes list ->
  ?string_list_values:string list ->
  ?binary_value:bytes ->
  ?string_value:string ->
  data_type:string ->
  unit
-> message_attribute_value
(** Create a {!type-message_attribute_value} type *)

val make_message_system_attribute_value :
  ?binary_list_values:bytes list ->
  ?string_list_values:string list ->
  ?binary_value:bytes ->
  ?string_value:string ->
  data_type:string ->
  unit
-> message_system_attribute_value
(** Create a {!type-message_system_attribute_value} type *)

val make_send_message_request :
  ?message_group_id:string ->
  ?message_deduplication_id:string ->
  ?message_system_attributes:(string * message_system_attribute_value) list ->
  ?message_attributes:(string * message_attribute_value) list ->
  ?delay_seconds:int ->
  message_body:string ->
  queue_url:string ->
  unit
-> send_message_request
(** Create a {!type-send_message_request} type *)

val make_send_message_batch_result_entry :
  ?sequence_number:string ->
  ?md5_of_message_system_attributes:string ->
  ?md5_of_message_attributes:string ->
  md5_of_message_body:string ->
  message_id:string ->
  id:string ->
  unit
-> send_message_batch_result_entry
(** Create a {!type-send_message_batch_result_entry} type *)

val make_batch_result_error_entry :
  ?message:string -> code:string -> sender_fault:bool -> id:string -> unit
-> batch_result_error_entry
(** Create a {!type-batch_result_error_entry} type *)

val make_send_message_batch_request_entry :
  ?message_group_id:string ->
  ?message_deduplication_id:string ->
  ?message_system_attributes:(string * message_system_attribute_value) list ->
  ?message_attributes:(string * message_attribute_value) list ->
  ?delay_seconds:int ->
  message_body:string ->
  id:string ->
  unit
-> send_message_batch_request_entry
(** Create a {!type-send_message_batch_request_entry} type *)

val make_send_message_batch_request :
  entries:send_message_batch_request_entry list -> queue_url:string -> unit
-> send_message_batch_request
(** Create a {!type-send_message_batch_request} type *)

val make_remove_permission_request : label:string -> queue_url:string -> unit
-> remove_permission_request
(** Create a {!type-remove_permission_request} type *)

val make_message :
  ?message_attributes:(string * message_attribute_value) list ->
  ?md5_of_message_attributes:string ->
  ?attributes:(string * string) list ->
  ?body:string ->
  ?md5_of_body:string ->
  ?receipt_handle:string ->
  ?message_id:string ->
  unit
-> message
(** Create a {!type-message} type *)

val make_receive_message_request :
  ?receive_request_attempt_id:string ->
  ?wait_time_seconds:int ->
  ?visibility_timeout:int ->
  ?max_number_of_messages:int ->
  ?message_attribute_names:string list ->
  ?message_system_attribute_names:message_system_attribute_name list ->
  ?attribute_names:queue_attribute_name list ->
  queue_url:string ->
  unit
-> receive_message_request
(** Create a {!type-receive_message_request} type *)

val make_purge_queue_request : queue_url:string -> unit
-> purge_queue_request
(** Create a {!type-purge_queue_request} type *)

val make_list_queues_request :
  ?max_results:int -> ?next_token:string -> ?queue_name_prefix:string -> unit
-> list_queues_request
(** Create a {!type-list_queues_request} type *)

val make_list_queue_tags_request : queue_url:string -> unit
-> list_queue_tags_request
(** Create a {!type-list_queue_tags_request} type *)

val make_list_message_move_tasks_result_entry :
  ?started_timestamp:int ->
  ?failure_reason:string ->
  ?approximate_number_of_messages_to_move:int ->
  ?approximate_number_of_messages_moved:int ->
  ?max_number_of_messages_per_second:int ->
  ?destination_arn:string ->
  ?source_arn:string ->
  ?status:string ->
  ?task_handle:string ->
  unit
-> list_message_move_tasks_result_entry
(** Create a {!type-list_message_move_tasks_result_entry} type *)

val make_list_message_move_tasks_request :
  ?max_results:int -> source_arn:string -> unit
-> list_message_move_tasks_request
(** Create a {!type-list_message_move_tasks_request} type *)

val make_list_dead_letter_source_queues_request :
  ?max_results:int -> ?next_token:string -> queue_url:string -> unit
-> list_dead_letter_source_queues_request
(** Create a {!type-list_dead_letter_source_queues_request} type *)

val make_get_queue_url_request :
  ?queue_owner_aws_account_id:string -> queue_name:string -> unit
-> get_queue_url_request
(** Create a {!type-get_queue_url_request} type *)

val make_get_queue_attributes_request :
  ?attribute_names:queue_attribute_name list -> queue_url:string -> unit
-> get_queue_attributes_request
(** Create a {!type-get_queue_attributes_request} type *)

val make_delete_queue_request : queue_url:string -> unit
-> delete_queue_request
(** Create a {!type-delete_queue_request} type *)

val make_delete_message_request :
  receipt_handle:string -> queue_url:string -> unit
-> delete_message_request
(** Create a {!type-delete_message_request} type *)

val make_delete_message_batch_result_entry : id:string -> unit
-> delete_message_batch_result_entry
(** Create a {!type-delete_message_batch_result_entry} type *)

val make_delete_message_batch_request_entry :
  receipt_handle:string -> id:string -> unit
-> delete_message_batch_request_entry
(** Create a {!type-delete_message_batch_request_entry} type *)

val make_delete_message_batch_request :
  entries:delete_message_batch_request_entry list -> queue_url:string -> unit
-> delete_message_batch_request
(** Create a {!type-delete_message_batch_request} type *)

val make_create_queue_request :
  ?tags:(string * string) list ->
  ?attributes:(string * string) list ->
  queue_name:string ->
  unit
-> create_queue_request
(** Create a {!type-create_queue_request} type *)

val make_change_message_visibility_request :
  visibility_timeout:int -> receipt_handle:string -> queue_url:string -> unit
-> change_message_visibility_request
(** Create a {!type-change_message_visibility_request} type *)

val make_change_message_visibility_batch_result_entry : id:string -> unit
-> change_message_visibility_batch_result_entry
(** Create a {!type-change_message_visibility_batch_result_entry} type *)

val make_change_message_visibility_batch_request_entry :
  ?visibility_timeout:int -> receipt_handle:string -> id:string -> unit
-> change_message_visibility_batch_request_entry
(** Create a {!type-change_message_visibility_batch_request_entry} type *)

val make_change_message_visibility_batch_request :
  entries:change_message_visibility_batch_request_entry list ->
  queue_url:string ->
  unit
-> change_message_visibility_batch_request
(** Create a {!type-change_message_visibility_batch_request} type *)

val make_cancel_message_move_task_request : task_handle:string -> unit
-> cancel_message_move_task_request
(** Create a {!type-cancel_message_move_task_request} type *)

val make_add_permission_request :
  actions:string list ->
  aws_account_ids:string list ->
  label:string ->
  queue_url:string ->
  unit
-> add_permission_request
(** Create a {!type-add_permission_request} type *)

(** {1:operations Operations} *)

module AddPermission : sig
  val request :
    Smaws_Lib.Context.t ->
      add_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `OverLimit of over_limit
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Adds a permission to a queue for a specific {{:https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P}principal}. This allows sharing access to the queue.
    
     When you create a queue, you have full control access rights for the queue. Only you, the owner of the queue, can grant or deny permissions to the queue. For more information about these permissions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue}Allow Developers to Write Messages to a Shared Queue} in the {i Amazon SQS Developer Guide}.
     
      {ul
           {- [AddPermission] generates a policy for you. You can use 
              {[
              [SetQueueAttributes]
              ]}
               to upload your policy. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-creating-custom-policies.html}Using Custom Policies with the Amazon SQS Access Policy Language} in the {i Amazon SQS Developer Guide}.
              
              }
            {- An Amazon SQS policy can have a maximum of seven actions per statement.
               
               }
            {- To remove the ability to change queue permissions, you must deny permission to the [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.
               
               }
            {- Amazon SQS [AddPermission] does not support adding a non-account principal.
               
               }
           
      }
       Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
       
        *)

  
end

module CancelMessageMoveTask : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_message_move_task_request ->
        (cancel_message_move_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Cancels a specified message movement task. A message movement can only be cancelled when the current status is RUNNING. Cancelling a message movement task does not revert the messages that have already been moved. It can only stop the messages that have not been moved yet.
    
     {ul
          {- This action is currently limited to supporting message redrive from {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues (DLQs)} only. In this context, the source queue is the dead-letter queue (DLQ), while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue.
             
             }
           {- Only one active message movement task is supported per queue at any given time.
              
              }
          
      }
       *)

  
end

module ChangeMessageVisibility : sig
  val request :
    Smaws_Lib.Context.t ->
      change_message_visibility_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `MessageNotInflight of message_not_inflight
            | `QueueDoesNotExist of queue_does_not_exist
            | `ReceiptHandleIsInvalid of receipt_handle_is_invalid
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Changes the visibility timeout of a specified message in a queue to a new value. The default visibility timeout for a message is 30 seconds. The minimum is 0 seconds. The maximum is 12 hours. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.
    
     For example, if the default timeout for a queue is 60 seconds, 15 seconds have elapsed since you received the message, and you send a ChangeMessageVisibility call with [VisibilityTimeout] set to 10 seconds, the 10 seconds begin to count from the time that you make the [ChangeMessageVisibility] call. Thus, any attempt to change the visibility timeout or to delete that message 10 seconds after you initially change the visibility timeout (a total of 25 seconds) might result in an error.
     
      An Amazon SQS message has three basic states:
      
       {ol
            {- Sent to a queue by a producer.
               
               }
             {- Received from the queue by a consumer.
                
                }
             {- Deleted from the queue.
                
                }
            
      }
       A message is considered to be {i stored} after it is sent to a queue by a producer, but not yet received from the queue by a consumer (that is, between states 1 and 2). There is no limit to the number of stored messages. A message is considered to be {i in flight} after it is received from a queue by a consumer, but not yet deleted from the queue (that is, between states 2 and 3). There is a limit to the number of in flight messages.
       
        Limits that apply to in flight messages are unrelated to the {i unlimited} number of stored messages.
        
         For most standard queues (depending on queue traffic and message backlog), there can be a maximum of approximately 120,000 in flight messages (received from a queue by a consumer, but not yet deleted from the queue). If you reach this limit, Amazon SQS returns the [OverLimit] error message. To avoid reaching the limit, you should delete messages from the queue after they're processed. You can also increase the number of queues you use to process your messages. To request a limit increase, {{:https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-sqs}file a support request}.
         
          For FIFO queues, there can be a maximum of 20,000 in flight messages (received from a queue by a consumer, but not yet deleted from the queue). If you reach this limit, Amazon SQS returns no error messages.
          
           If you attempt to set the [VisibilityTimeout] to a value greater than the maximum time left, Amazon SQS returns an error. Amazon SQS doesn't automatically recalculate and increase the timeout to the maximum remaining time.
           
            Unlike with a queue, when you change the visibility timeout for a specific message the timeout value is applied immediately but isn't saved in memory for that message. If you don't delete a message after it is received, the visibility timeout for the message reverts to the original timeout value (not to the value you set using the [ChangeMessageVisibility] action) the next time the message is received.
            
             *)

  
end

module ChangeMessageVisibilityBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      change_message_visibility_batch_request ->
        (change_message_visibility_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
            | `EmptyBatchRequest of empty_batch_request
            | `InvalidAddress of invalid_address
            | `InvalidBatchEntryId of invalid_batch_entry_id
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Changes the visibility timeout of multiple messages. This is a batch version of 
    {[
    [ChangeMessageVisibility].
    ]}
     The result of the action on each message is reported individually in the response. You can send up to 10 
    {[
    [ChangeMessageVisibility]
    ]}
     requests with each [ChangeMessageVisibilityBatch] action.
    
     Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of [200].
     
      *)

  
end

module CreateQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      create_queue_request ->
        (create_queue_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidAttributeName of invalid_attribute_name
            | `InvalidAttributeValue of invalid_attribute_value
            | `InvalidSecurity of invalid_security
            | `QueueDeletedRecently of queue_deleted_recently
            | `QueueNameExists of queue_name_exists
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Creates a new standard or FIFO queue. You can pass one or more attributes in the request. Keep the following in mind:
    
     {ul
          {- If you don't specify the [FifoQueue] attribute, Amazon SQS creates a standard queue.
             
              You can't change the queue type after you create it and you can't convert an existing standard queue into a FIFO queue. You must either create a new FIFO queue for your application or delete your existing standard queue and recreate it as a FIFO queue. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-moving}Moving From a Standard Queue to a FIFO Queue} in the {i Amazon SQS Developer Guide}.
              
              }
           {- If you don't provide a value for an attribute, the queue is created with the default value for the attribute.
              
              }
           {- If you delete a queue, you must wait at least 60 seconds before creating a queue with the same name.
              
              }
          
      }
       To successfully create a new queue, you must provide a queue name that adheres to the {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/limits-queues.html}limits related to queues} and is unique within the scope of your queues.
       
        After you create a queue, you must wait at least one second after the queue is created to be able to use the queue.
        
         To get the queue URL, use the 
         {[
         [GetQueueUrl]
         ]}
          action. 
         {[
         [GetQueueUrl]
         ]}
          requires only the [QueueName] parameter. be aware of existing queue names:
         
          {ul
               {- If you provide the name of an existing queue along with the exact names and values of all the queue's attributes, [CreateQueue] returns the queue URL for the existing queue.
                  
                  }
                {- If the queue name, attribute names, or attribute values don't match an existing queue, [CreateQueue] returns an error.
                   
                   }
               
      }
       Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
       
        *)

  
end

module DeleteMessage : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_message_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidIdFormat of invalid_id_format
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `ReceiptHandleIsInvalid of receipt_handle_is_invalid
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Deletes the specified message from the specified queue. To select the message to delete, use the [ReceiptHandle] of the message ({i not} the [MessageId] which you receive when you send the message). Amazon SQS can delete a message from a queue even if a visibility timeout setting causes the message to be locked by another consumer. Amazon SQS automatically deletes messages left in a queue longer than the retention period configured for the queue.
    
     The [ReceiptHandle] is associated with a {i specific instance} of receiving a message. If you receive a message more than once, the [ReceiptHandle] is different each time you receive a message. When you use the [DeleteMessage] action, you must provide the most recently received [ReceiptHandle] for the message (otherwise, the request succeeds, but the message will not be deleted).
     
      For standard queues, it is possible to receive a message even after you delete it. This might happen on rare occasions if one of the servers which stores a copy of the message is unavailable when you send the request to delete the message. The copy remains on the server and might be returned to you during a subsequent receive request. You should ensure that your application is idempotent, so that receiving a message more than once does not cause issues.
      
       *)

  
end

module DeleteMessageBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_message_batch_request ->
        (delete_message_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
            | `EmptyBatchRequest of empty_batch_request
            | `InvalidAddress of invalid_address
            | `InvalidBatchEntryId of invalid_batch_entry_id
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Deletes up to ten messages from the specified queue. This is a batch version of 
    {[
    [DeleteMessage].
    ]}
     The result of the action on each message is reported individually in the response.
    
     Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of [200].
     
      *)

  
end

module DeleteQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Deletes the queue specified by the [QueueUrl], regardless of the queue's contents.
    
     Be careful with the [DeleteQueue] action: When you delete a queue, any messages in the queue are no longer available.
     
      When you delete a queue, the deletion process takes up to 60 seconds. Requests you send involving that queue during the 60 seconds might succeed. For example, a 
      {[
      [SendMessage]
      ]}
       request might succeed, but after 60 seconds the queue and the message you sent no longer exist.
      
       When you delete a queue, you must wait at least 60 seconds before creating a queue with the same name.
       
        Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
        
         The delete operation uses the HTTP [GET] verb.
         
          *)

  
end

module GetQueueAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
      get_queue_attributes_request ->
        (get_queue_attributes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidAttributeName of invalid_attribute_name
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Gets attributes for the specified queue.
    
     To determine whether a queue is {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO}, you can check whether [QueueName] ends with the [.fifo] suffix.
     
      *)

  
end

module GetQueueUrl : sig
  val request :
    Smaws_Lib.Context.t ->
      get_queue_url_request ->
        (get_queue_url_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Returns the URL of an existing Amazon SQS queue.
    
     To access a queue that belongs to another AWS account, use the [QueueOwnerAWSAccountId] parameter to specify the account ID of the queue's owner. The queue's owner must grant you permission to access the queue. For more information about shared queue access, see 
     {[
     [AddPermission]
     ]}
      or see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue}Allow Developers to Write Messages to a Shared Queue} in the {i Amazon SQS Developer Guide}.
      *)

  
end

module ListDeadLetterSourceQueues : sig
  val request :
    Smaws_Lib.Context.t ->
      list_dead_letter_source_queues_request ->
        (list_dead_letter_source_queues_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Returns a list of your queues that have the [RedrivePolicy] queue attribute configured with a dead-letter queue.
    
     The [ListDeadLetterSourceQueues] methods supports pagination. Set parameter [MaxResults] in the request to specify the maximum number of results to be returned in the response. If you do not set [MaxResults], the response includes a maximum of 1,000 results. If you set [MaxResults] and there are additional results to display, the response includes a value for [NextToken]. Use [NextToken] as a parameter in your next request to [ListDeadLetterSourceQueues] to receive the next page of results.
     
      For more information about using dead-letter queues, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}Using Amazon SQS Dead-Letter Queues} in the {i Amazon SQS Developer Guide}.
       *)

  
end

module ListMessageMoveTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_message_move_tasks_request ->
        (list_message_move_tasks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Gets the most recent message movement tasks (up to 10) under a specific source queue.
    
     {ul
          {- This action is currently limited to supporting message redrive from {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues (DLQs)} only. In this context, the source queue is the dead-letter queue (DLQ), while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue.
             
             }
           {- Only one active message movement task is supported per queue at any given time.
              
              }
          
      }
       *)

  
end

module ListQueueTags : sig
  val request :
    Smaws_Lib.Context.t ->
      list_queue_tags_request ->
        (list_queue_tags_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    List all cost allocation tags added to the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.
    
     Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
     
      *)

  
end

module ListQueues : sig
  val request :
    Smaws_Lib.Context.t ->
      list_queues_request ->
        (list_queues_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Returns a list of your queues in the current region. The response includes a maximum of 1,000 results. If you specify a value for the optional [QueueNamePrefix] parameter, only queues with a name that begins with the specified value are returned.
    
     The [listQueues] methods supports pagination. Set parameter [MaxResults] in the request to specify the maximum number of results to be returned in the response. If you do not set [MaxResults], the response includes a maximum of 1,000 results. If you set [MaxResults] and there are additional results to display, the response includes a value for [NextToken]. Use [NextToken] as a parameter in your next request to [listQueues] to receive the next page of results.
     
      Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
      
       *)

  
end

module PurgeQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      purge_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `PurgeQueueInProgress of purge_queue_in_progress
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Deletes available messages in a queue (including in-flight messages) specified by the [QueueURL] parameter.
    
     When you use the [PurgeQueue] action, you can't retrieve any messages deleted from a queue.
     
      The message deletion process takes up to 60 seconds. We recommend waiting for 60 seconds regardless of your queue's size.
      
       Messages sent to the queue {i before} you call [PurgeQueue] might be received but are deleted within the next minute.
       
        Messages sent to the queue {i after} you call [PurgeQueue] might be deleted while the queue is being purged.
         *)

  
end

module ReceiveMessage : sig
  val request :
    Smaws_Lib.Context.t ->
      receive_message_request ->
        (receive_message_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `KmsAccessDenied of kms_access_denied
            | `KmsDisabled of kms_disabled
            | `KmsInvalidKeyUsage of kms_invalid_key_usage
            | `KmsInvalidState of kms_invalid_state
            | `KmsNotFound of kms_not_found
            | `KmsOptInRequired of kms_opt_in_required
            | `KmsThrottled of kms_throttled
            | `OverLimit of over_limit
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Retrieves one or more messages (up to 10), from the specified queue. Using the [WaitTimeSeconds] parameter enables long-poll support. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html}Amazon SQS Long Polling} in the {i Amazon SQS Developer Guide}.
    
     Short poll is the default behavior where a weighted random set of machines is sampled on a [ReceiveMessage] call. Thus, only the messages on the sampled machines are returned. If the number of messages in the queue is small (fewer than 1,000), you most likely get fewer messages than you requested per [ReceiveMessage] call. If the number of messages in the queue is extremely small, you might not receive any messages in a particular [ReceiveMessage] response. If this happens, repeat the request.
     
      For each message returned, the response includes the following:
      
       {ul
            {- The message body.
               
               }
             {- An MD5 digest of the message body. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.
                
                }
             {- The [MessageId] you received when you sent the message to the queue.
                
                }
             {- The receipt handle.
                
                }
             {- The message attributes.
                
                }
             {- An MD5 digest of the message attributes.
                
                }
            
      }
       The receipt handle is the identifier you must provide when deleting the message. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html}Queue and Message Identifiers} in the {i Amazon SQS Developer Guide}.
       
        You can provide the [VisibilityTimeout] parameter in your request. The parameter is applied to the messages that Amazon SQS returns in the response. If you don't include the parameter, the overall visibility timeout for the queue is used for the returned messages. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.
        
         A message that isn't deleted or a message whose visibility isn't extended before the visibility timeout expires counts as a failed receive. Depending on the configuration of the queue, the message might be sent to the dead-letter queue.
         
          In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.
          
           *)

  
end

module RemovePermission : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Revokes any permissions in the queue policy that matches the specified [Label] parameter.
    
     {ul
          {- Only the owner of a queue can remove permissions from it.
             
             }
           {- Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
              
              }
           {- To remove the ability to change queue permissions, you must deny permission to the [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.
              
              }
          
      }
       *)

  
end

module SendMessage : sig
  val request :
    Smaws_Lib.Context.t ->
      send_message_request ->
        (send_message_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidMessageContents of invalid_message_contents
            | `InvalidSecurity of invalid_security
            | `KmsAccessDenied of kms_access_denied
            | `KmsDisabled of kms_disabled
            | `KmsInvalidKeyUsage of kms_invalid_key_usage
            | `KmsInvalidState of kms_invalid_state
            | `KmsNotFound of kms_not_found
            | `KmsOptInRequired of kms_opt_in_required
            | `KmsThrottled of kms_throttled
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Delivers a message to the specified queue.
    
     A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the {{:http://www.w3.org/TR/REC-xml/#charsets}W3C specification for characters}.
     
      [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to [#x10FFFF]
      
       Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing the message in the queue, as long as the message body contains at least one valid character.
       
        *)

  
end

module SendMessageBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      send_message_batch_request ->
        (send_message_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
            | `BatchRequestTooLong of batch_request_too_long
            | `EmptyBatchRequest of empty_batch_request
            | `InvalidAddress of invalid_address
            | `InvalidBatchEntryId of invalid_batch_entry_id
            | `InvalidSecurity of invalid_security
            | `KmsAccessDenied of kms_access_denied
            | `KmsDisabled of kms_disabled
            | `KmsInvalidKeyUsage of kms_invalid_key_usage
            | `KmsInvalidState of kms_invalid_state
            | `KmsNotFound of kms_not_found
            | `KmsOptInRequired of kms_opt_in_required
            | `KmsThrottled of kms_throttled
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    You can use [SendMessageBatch] to send up to 10 messages to the specified queue by assigning either identical or different values to each message (or by not assigning values at all). This is a batch version of 
    {[
    [SendMessage].
    ]}
     For a FIFO queue, multiple messages within a single batch are enqueued in the order they are sent.
    
     The result of sending each message is reported individually in the response. Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of [200].
     
      The maximum allowed individual message size and the maximum total payload size (the sum of the individual lengths of all of the batched messages) are both 256 KiB (262,144 bytes).
      
       A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the {{:http://www.w3.org/TR/REC-xml/#charsets}W3C specification for characters}.
       
        [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to [#x10FFFF]
        
         Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing the message in the queue, as long as the message body contains at least one valid character.
         
          If you don't specify the [DelaySeconds] parameter for an entry, Amazon SQS uses the default value for the queue.
           *)

  
end

module SetQueueAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
      set_queue_attributes_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidAttributeName of invalid_attribute_name
            | `InvalidAttributeValue of invalid_attribute_value
            | `InvalidSecurity of invalid_security
            | `OverLimit of over_limit
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Sets the value of one or more queue attributes, like a policy. When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.
    
     {ul
          {- In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.
             
             }
           {- Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
              
              }
           {- To remove the ability to change queue permissions, you must deny permission to the [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.
              
              }
          
      }
       *)

  
end

module StartMessageMoveTask : sig
  val request :
    Smaws_Lib.Context.t ->
      start_message_move_task_request ->
        (start_message_move_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Starts an asynchronous task to move messages from a specified source queue to a specified destination queue.
    
     {ul
          {- This action is currently limited to supporting message redrive from queues that are configured as {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues (DLQs)} of other Amazon SQS queues only. Non-SQS queue sources of dead-letter queues, such as Lambda or Amazon SNS topics, are currently not supported.
             
             }
           {- In dead-letter queues redrive context, the [StartMessageMoveTask] the source queue is the DLQ, while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue.
              
              }
           {- Only one active message movement task is supported per queue at any given time.
              
              }
          
      }
       *)

  
end

module TagQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Add cost allocation tags to the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.
    
     When you use queue tags, keep the following guidelines in mind:
     
      {ul
           {- Adding more than 50 tags to a queue isn't recommended.
              
              }
            {- Tags don't have any semantic meaning. Amazon SQS interprets tags as character strings.
               
               }
            {- Tags are case-sensitive.
               
               }
            {- A new tag with a key identical to that of an existing tag overwrites the existing tag.
               
               }
           
      }
       For a full list of tag restrictions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-limits.html#limits-queues}Quotas related to queues} in the {i Amazon SQS Developer Guide}.
       
        Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
        
         *)

  
end

module UntagQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** 
    Remove cost allocation tags from the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.
    
     Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
     
      *)

  
end

