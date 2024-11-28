open Smaws_Lib
let service =
  Service.{
    namespace = "cloudtrail";
    endpointPrefix = "cloudtrail";
    version = "2013-11-01";
    protocol = AwsJson_1_1
  };

(** 
    Returns the objects or data listed below if successful. Otherwise, returns an error.
     *)
type update_trail_response = {
  is_organization_trail: bool option;
  (** 
    Specifies whether the trail is an organization trail.
     *)

  kms_key_id: string option;
  (** 
    Specifies the KMS key ID that encrypts the logs delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.
    
     [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012]
      *)

  cloud_watch_logs_role_arn: string option;
  (** 
    Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group.
     *)

  cloud_watch_logs_log_group_arn: string option;
  (** 
    Specifies the Amazon Resource Name (ARN) of the log group to which CloudTrail logs are delivered.
     *)

  log_file_validation_enabled: bool option;
  (** 
    Specifies whether log file integrity validation is enabled.
     *)

  trail_ar_n: string option;
  (** 
    Specifies the ARN of the trail that was updated. The following is the format of a trail ARN.
    
     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
      *)

  is_multi_region_trail: bool option;
  (** 
    Specifies whether the trail exists in one Region or in all Regions.
     *)

  include_global_service_events: bool option;
  (** 
    Specifies whether the trail is publishing events from global services such as IAM to the log files.
     *)

  sns_topic_ar_n: string option;
  (** 
    Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send notifications when log files are delivered. The following is the format of a topic ARN.
    
     [arn:aws:sns:us-east-2:123456789012:MyTopic]
      *)

  sns_topic_name: string option;
  (** 
    This field is no longer in use. Use [SnsTopicARN].
     *)

  s3_key_prefix: string option;
  (** 
    Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for log file delivery. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files}Finding Your IAM Log Files}.
     *)

  s3_bucket_name: string option;
  (** 
    Specifies the name of the Amazon S3 bucket designated for publishing log files.
     *)

  name: string option;
  (** 
    Specifies the name of the trail.
     *)

}

(** 
    Specifies settings to update for the trail.
     *)
type update_trail_request = {
  is_organization_trail: bool option;
  (** 
    Specifies whether the trail is applied to all accounts in an organization in Organizations, or only for the current Amazon Web Services account. The default is false, and cannot be true unless the call is made on behalf of an Amazon Web Services account that is the management account for an organization in Organizations. If the trail is not an organization trail and this is set to [true], the trail will be created in all Amazon Web Services accounts that belong to the organization. If the trail is an organization trail and this is set to [false], the trail will remain in the current Amazon Web Services account but be deleted from all member accounts in the organization.
    
     Only the management account for the organization can convert an organization trail to a non-organization trail, or convert a non-organization trail to an organization trail.
     
      *)

  kms_key_id: string option;
  [@ocaml.doc {| 
    Specifies the KMS key ID to use to encrypt the logs delivered by CloudTrail. The value can be an alias name prefixed by "alias/", a fully specified ARN to an alias, a fully specified ARN to a key, or a globally unique identifier.
    
     CloudTrail also supports KMS multi-Region keys. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Using multi-Region keys} in the {i Key Management Service Developer Guide}.
     
      Examples:
      
       {ul
            {- alias/MyAliasName
               
               }
             {- arn:aws:kms:us-east-2:123456789012:alias/MyAliasName
                
                }
             {- arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012
                
                }
             {- 12345678-1234-1234-1234-123456789012
                
                }
            
      }
       |}]

  cloud_watch_logs_role_arn: string option;
  (** 
    Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group. You must use a role that exists in your account.
     *)

  cloud_watch_logs_log_group_arn: string option;
  (** 
    Specifies a log group name using an Amazon Resource Name (ARN), a unique identifier that represents the log group to which CloudTrail logs are delivered. You must use a log group that exists in your account.
    
     Not required unless you specify [CloudWatchLogsRoleArn].
      *)

  enable_log_file_validation: bool option;
  (** 
    Specifies whether log file validation is enabled. The default is false.
    
     When you disable log file integrity validation, the chain of digest files is broken after one hour. CloudTrail does not create digest files for log files that were delivered during a period in which log file integrity validation was disabled. For example, if you enable log file integrity validation at noon on January 1, disable it at noon on January 2, and re-enable it at noon on January 10, digest files will not be created for the log files delivered from noon on January 2 to noon on January 10. The same applies whenever you stop CloudTrail logging or delete a trail.
     
      *)

  is_multi_region_trail: bool option;
  (** 
    Specifies whether the trail applies only to the current Region or to all Regions. The default is false. If the trail exists only in the current Region and this value is set to true, shadow trails (replications of the trail) will be created in the other Regions. If the trail exists in all Regions and this value is set to false, the trail will remain in the Region where it was created, and its shadow trails in other Regions will be deleted. As a best practice, consider using trails that log events in all Regions.
     *)

  include_global_service_events: bool option;
  (** 
    Specifies whether the trail is publishing events from global services such as IAM to the log files.
     *)

  sns_topic_name: string option;
  (** 
    Specifies the name of the Amazon SNS topic defined for notification of log file delivery. The maximum length is 256 characters.
     *)

  s3_key_prefix: string option;
  (** 
    Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for log file delivery. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files}Finding Your CloudTrail Log Files}. The maximum length is 200 characters.
     *)

  s3_bucket_name: string option;
  (** 
    Specifies the name of the Amazon S3 bucket designated for publishing log files. See {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html}Amazon S3 Bucket naming rules}.
     *)

  name: string;
  (** 
    Specifies the name of the trail or trail ARN. If [Name] is a trail name, the string must meet the following requirements:
    
     {ul
          {- Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)
             
             }
           {- Start with a letter or number, and end with a letter or number
              
              }
           {- Be between 3 and 128 characters
              
              }
           {- Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.
              
              }
           {- Not be in IP address format (for example, 192.168.5.4)
              
              }
          
      }
       If [Name] is a trail ARN, it must be in the following format.
       
        [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
         *)

}

(** 
    This exception is thrown when the requested operation is not supported.
     *)
type unsupported_operation_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is no longer in use.
     *)
type trail_not_provided_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the trail with the given name is not found.
     *)
type trail_not_found_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the request rate exceeds the limit.
     *)
type throttling_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the specified S3 bucket does not exist.
     *)
type s3_bucket_does_not_exist_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the request is made from an Amazon Web Services account that is not a member of an organization. To make this request, sign in using the credentials of an account that belongs to an organization.
     *)
type organizations_not_in_use_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when Organizations is not configured to support all features. All features must be enabled in Organizations to support creating an organization trail or event data store.
     *)
type organization_not_in_all_features_mode_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the requested operation is not permitted.
     *)
type operation_not_permitted_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the Amazon Web Services account making the request to create or update an organization trail or event data store is not the management account for an organization in Organizations. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/creating-an-organizational-trail-prepare.html}Prepare For Creating a Trail For Your Organization} or {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-organizations.html}Organization event data stores}.
     *)
type not_organization_master_account_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the management account does not have a service-linked role.
     *)
type no_management_account_slr_exists_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the KMS key does not exist, when the S3 bucket and the KMS key are not in the same Region, or when the KMS key associated with the Amazon SNS topic either does not exist or is not in the same Region.
     *)
type kms_key_not_found_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is no longer in use.
     *)
type kms_key_disabled_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when there is an issue with the specified KMS key and the trail or event data store can't be updated.
     *)
type kms_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the provided trail name is not valid. Trail names must meet the following requirements:
    
     {ul
          {- Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)
             
             }
           {- Start with a letter or number, and end with a letter or number
              
              }
           {- Be between 3 and 128 characters
              
              }
           {- Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.
              
              }
           {- Not be in IP address format (for example, 192.168.5.4)
              
              }
          
      }
       *)
type invalid_trail_name_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the provided SNS topic name is not valid.
     *)
type invalid_sns_topic_name_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the provided S3 prefix is not valid.
     *)
type invalid_s3_prefix_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the provided S3 bucket name is not valid.
     *)
type invalid_s3_bucket_name_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    The request includes a parameter that is not valid.
     *)
type invalid_parameter_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the combination of parameters provided is not valid.
     *)
type invalid_parameter_combination_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the KMS key ARN is not valid.
     *)
type invalid_kms_key_id_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when an operation is called on a trail from a Region other than the Region in which the trail was created.
     *)
type invalid_home_region_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the [PutEventSelectors] operation is called with a number of event selectors, advanced event selectors, or data resources that is not valid. The combination of event selectors or advanced event selectors and data resources is not valid. A trail can have up to 5 event selectors. If a trail uses advanced event selectors, a maximum of 500 total values for all conditions in all advanced event selectors is allowed. A trail is limited to 250 data resources. These data resources can be distributed across event selectors, but the overall total cannot exceed 250.
    
     You can:
     
      {ul
           {- Specify a valid number of event selectors (1 to 5) for a trail.
              
              }
            {- Specify a valid number of data resources (1 to 250) for an event selector. The limit of number of resources on an individual event selector is configurable up to 250. However, this upper limit is allowed only if the total number of data resources does not exceed 250 across all event selectors for a trail.
               
               }
            {- Specify up to 500 values for all conditions in all advanced event selectors for a trail.
               
               }
            {- Specify a valid value for a parameter. For example, specifying the [ReadWriteType] parameter with a value of [read-only] is not valid.
               
               }
           
      }
       *)
type invalid_event_selectors_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the provided role is not valid.
     *)
type invalid_cloud_watch_logs_role_arn_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the provided CloudWatch Logs log group is not valid.
     *)
type invalid_cloud_watch_logs_log_group_arn_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the policy on the Amazon SNS topic is not sufficient.
     *)
type insufficient_sns_topic_policy_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the policy on the S3 bucket is not sufficient.
     *)
type insufficient_s3_bucket_policy_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the policy on the S3 bucket or KMS key does not have sufficient permissions for the operation.
     *)
type insufficient_encryption_policy_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the IAM identity that is used to create the organization resource lacks one or more required permissions for creating an organization resource in a required service.
     *)
type insufficient_dependency_service_access_permission_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the specified resource is not ready for an operation. This can occur when you try to run an operation on a resource before CloudTrail has time to fully load the resource, or because another operation is modifying the resource. If this exception occurs, wait a few minutes, and then try the operation again.
     *)
type conflict_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Cannot set a CloudWatch Logs delivery for this Region.
     *)
type cloud_watch_logs_delivery_unavailable_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when a call results in the [InvalidClientTokenId] error code. This can occur when you are creating or updating a trail to send notifications to an Amazon SNS topic that is in a suspended Amazon Web Services account.
     *)
type cloud_trail_invalid_client_token_id_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when an operation is called with an ARN that is not valid.
    
     The following is the format of a trail ARN: [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
     
      The following is the format of an event data store ARN: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE]
      
       The following is the format of a channel ARN: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890]
        *)
type cloud_trail_arn_invalid_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when trusted access has not been enabled between CloudTrail and Organizations. For more information, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_how-to-enable-disable-trusted-access}How to enable or disable trusted access} in the {i Organizations User Guide} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/creating-an-organizational-trail-prepare.html}Prepare For Creating a Trail For Your Organization} in the {i CloudTrail User Guide}.
     *)
type cloud_trail_access_not_enabled_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type event_data_store_status = | STOPPED_INGESTION
  | STOPPING_INGESTION
  | STARTING_INGESTION
  | PENDING_DELETION
  | ENABLED
  | CREATED

(** 
    A single selector statement in an advanced event selector.
     *)
type advanced_field_selector = {
  not_ends_with: string list option;
  (** 
    An operator that excludes events that match the last few characters of the event record field specified as the value of [Field].
     *)

  not_starts_with: string list option;
  (** 
    An operator that excludes events that match the first few characters of the event record field specified as the value of [Field].
     *)

  not_equals: string list option;
  (** 
    An operator that excludes events that match the exact value of the event record field specified as the value of [Field].
     *)

  ends_with: string list option;
  (** 
    An operator that includes events that match the last few characters of the event record field specified as the value of [Field].
     *)

  starts_with: string list option;
  (** 
    An operator that includes events that match the first few characters of the event record field specified as the value of [Field].
     *)

  equals: string list option;
  (** 
    An operator that includes events that match the exact value of the event record field specified as the value of [Field]. This is the only valid operator that you can use with the [readOnly], [eventCategory], and [resources.type] fields.
     *)

  field: string;
  (** 
    A field in a CloudTrail event record on which to filter events to be logged. For event data stores for CloudTrail Insights events, Config configuration items, Audit Manager evidence, or events outside of Amazon Web Services, the field is used only for selecting events as filtering is not supported.
    
     For CloudTrail management events, supported fields include [readOnly], [eventCategory], and [eventSource].
     
      For CloudTrail data events, supported fields include [readOnly], [eventCategory], [eventName], [resources.type], and [resources.ARN].
      
       For event data stores for CloudTrail Insights events, Config configuration items, Audit Manager evidence, or events outside of Amazon Web Services, the only supported field is [eventCategory].
       
        {ul
             {- {b [readOnly]} - Optional. Can be set to [Equals] a value of [true] or [false]. If you do not add this field, CloudTrail logs both [read] and [write] events. A value of [true] logs only [read] events. A value of [false] logs only [write] events.
                
                }
              {- {b [eventSource]} - For filtering management events only. This can be set to [NotEquals] [kms.amazonaws.com] or [NotEquals] [rdsdata.amazonaws.com].
                 
                 }
              {- {b [eventName]} - Can use any operator. You can use it to ﬁlter in or ﬁlter out any data event logged to CloudTrail, such as [PutBucket] or [GetSnapshotBlock]. You can have multiple values for this ﬁeld, separated by commas.
                 
                 }
              {- {b [eventCategory]} - This is required and must be set to [Equals].
                 
                  {ul
                       {- For CloudTrail management events, the value must be [Management].
                          
                          }
                        {- For CloudTrail data events, the value must be [Data].
                           
                           }
                       
               }
                The following are used only for event data stores:
                
                 {ul
                      {- For CloudTrail Insights events, the value must be [Insight].
                         
                         }
                       {- For Config configuration items, the value must be [ConfigurationItem].
                          
                          }
                       {- For Audit Manager evidence, the value must be [Evidence].
                          
                          }
                       {- For non-Amazon Web Services events, the value must be [ActivityAuditLog].
                          
                          }
                      
               }
               }
              {- {b [resources.type]} - This ﬁeld is required for CloudTrail data events. [resources.type] can only use the [Equals] operator, and the value can be one of the following:
                 
                  {ul
                       {- [AWS::DynamoDB::Table]
                          
                          }
                        {- [AWS::Lambda::Function]
                           
                           }
                        {- [AWS::S3::Object]
                           
                           }
                        {- [AWS::AppConfig::Configuration]
                           
                           }
                        {- [AWS::B2BI::Transformer]
                           
                           }
                        {- [AWS::Bedrock::AgentAlias]
                           
                           }
                        {- [AWS::Bedrock::KnowledgeBase]
                           
                           }
                        {- [AWS::Cassandra::Table]
                           
                           }
                        {- [AWS::CloudFront::KeyValueStore]
                           
                           }
                        {- [AWS::CloudTrail::Channel]
                           
                           }
                        {- [AWS::CodeWhisperer::Customization]
                           
                           }
                        {- [AWS::CodeWhisperer::Profile]
                           
                           }
                        {- [AWS::Cognito::IdentityPool]
                           
                           }
                        {- [AWS::DynamoDB::Stream]
                           
                           }
                        {- [AWS::EC2::Snapshot]
                           
                           }
                        {- [AWS::EMRWAL::Workspace]
                           
                           }
                        {- [AWS::FinSpace::Environment]
                           
                           }
                        {- [AWS::Glue::Table]
                           
                           }
                        {- [AWS::GreengrassV2::ComponentVersion]
                           
                           }
                        {- [AWS::GreengrassV2::Deployment]
                           
                           }
                        {- [AWS::GuardDuty::Detector]
                           
                           }
                        {- [AWS::IoT::Certificate]
                           
                           }
                        {- [AWS::IoT::Thing]
                           
                           }
                        {- [AWS::IoTSiteWise::Asset]
                           
                           }
                        {- [AWS::IoTSiteWise::TimeSeries]
                           
                           }
                        {- [AWS::IoTTwinMaker::Entity]
                           
                           }
                        {- [AWS::IoTTwinMaker::Workspace]
                           
                           }
                        {- [AWS::KendraRanking::ExecutionPlan]
                           
                           }
                        {- [AWS::KinesisVideo::Stream]
                           
                           }
                        {- [AWS::ManagedBlockchain::Network]
                           
                           }
                        {- [AWS::ManagedBlockchain::Node]
                           
                           }
                        {- [AWS::MedicalImaging::Datastore]
                           
                           }
                        {- [AWS::NeptuneGraph::Graph]
                           
                           }
                        {- [AWS::PCAConnectorAD::Connector]
                           
                           }
                        {- [AWS::QApps:QApp]
                           
                           }
                        {- [AWS::QBusiness::Application]
                           
                           }
                        {- [AWS::QBusiness::DataSource]
                           
                           }
                        {- [AWS::QBusiness::Index]
                           
                           }
                        {- [AWS::QBusiness::WebExperience]
                           
                           }
                        {- [AWS::RDS::DBCluster]
                           
                           }
                        {- [AWS::S3::AccessPoint]
                           
                           }
                        {- [AWS::S3ObjectLambda::AccessPoint]
                           
                           }
                        {- [AWS::S3Outposts::Object]
                           
                           }
                        {- [AWS::SageMaker::Endpoint]
                           
                           }
                        {- [AWS::SageMaker::ExperimentTrialComponent]
                           
                           }
                        {- [AWS::SageMaker::FeatureGroup]
                           
                           }
                        {- [AWS::ServiceDiscovery::Namespace ]
                           
                           }
                        {- [AWS::ServiceDiscovery::Service]
                           
                           }
                        {- [AWS::SCN::Instance]
                           
                           }
                        {- [AWS::SNS::PlatformEndpoint]
                           
                           }
                        {- [AWS::SNS::Topic]
                           
                           }
                        {- [AWS::SQS::Queue]
                           
                           }
                        {- [AWS::SSM::ManagedNode]
                           
                           }
                        {- [AWS::SSMMessages::ControlChannel]
                           
                           }
                        {- [AWS::SWF::Domain]
                           
                           }
                        {- [AWS::ThinClient::Device]
                           
                           }
                        {- [AWS::ThinClient::Environment]
                           
                           }
                        {- [AWS::Timestream::Database]
                           
                           }
                        {- [AWS::Timestream::Table]
                           
                           }
                        {- [AWS::VerifiedPermissions::PolicyStore]
                           
                           }
                        {- [AWS::XRay::Trace]
                           
                           }
                       
               }
                You can have only one [resources.type] ﬁeld per selector. To log data events on more than one resource type, add another selector.
                
                }
              {- {b [resources.ARN]} - You can use any operator with [resources.ARN], but if you use [Equals] or [NotEquals], the value must exactly match the ARN of a valid resource of the type you've speciﬁed in the template as the value of resources.type.
                 
                  You can't use the [resources.ARN] field to filter resource types that do not have ARNs.
                  
                   The [resources.ARN] field can be set one of the following.
                   
                    If resources.type equals [AWS::S3::Object], the ARN must be in one of the following formats. To log all data events for all objects in a specific S3 bucket, use the [StartsWith] operator, and include only the bucket ARN as the matching value.
                    
                     The trailing slash is intentional; do not exclude it. Replace the text between less than and greater than symbols (<>) with resource-specific information.
                     
                      {ul
                           {- 
                              {[
                              arn::s3:::/
                              ]}
                              
                              
                              }
                            {- 
                               {[
                               arn::s3::://
                               ]}
                               
                               
                               }
                           
               }
                When resources.type equals [AWS::DynamoDB::Table], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::dynamodb:::table/
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::Lambda::Function], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::lambda:::function:
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::AppConfig::Configuration], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::appconfig:::application//environment//configuration/
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::B2BI::Transformer], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::b2bi:::transformer/
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::Bedrock::AgentAlias], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::bedrock:::agent-alias//
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::Bedrock::KnowledgeBase], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::bedrock:::knowledge-base/
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::Cassandra::Table], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::cassandra:::/keyspace//table/
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::CloudFront::KeyValueStore], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::cloudfront:::key-value-store/
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::CloudTrail::Channel], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::cloudtrail:::channel/
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::CodeWhisperer::Customization], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::codewhisperer:::customization/
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::CodeWhisperer::Profile], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::codewhisperer:::profile/
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::Cognito::IdentityPool], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::cognito-identity:::identitypool/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::DynamoDB::Stream], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::dynamodb:::table//stream/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::EC2::Snapshot], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::ec2:::snapshot/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::EMRWAL::Workspace], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::emrwal:::workspace/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::FinSpace::Environment], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::finspace:::environment/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::Glue::Table], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::glue:::table//
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::GreengrassV2::ComponentVersion], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::greengrass:::components/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::GreengrassV2::Deployment], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::greengrass:::deployments/
                         ]}
                         
                         
                         [
                  ]}
                      [
               ]
               }
               
             {[
             When [resources.type] equals [AWS::GuardDuty::Detector], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
             
              {ul
                   {- 
                      {[
                      arn::guardduty:::detector/
                      ]}
                      
                      
                      }
                   
               }
                When [resources.type] equals [AWS::IoT::Certificate], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::iot:::cert/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::IoT::Thing], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::iot:::thing/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::IoTSiteWise::Asset], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::iotsitewise:::asset/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::IoTSiteWise::TimeSeries], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::iotsitewise:::timeseries/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::IoTTwinMaker::Entity], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::iottwinmaker:::workspace//entity/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::IoTTwinMaker::Workspace], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::iottwinmaker:::workspace/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::KendraRanking::ExecutionPlan], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::kendra-ranking:::rescore-execution-plan/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::KinesisVideo::Stream], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::kinesisvideo:::stream//
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::ManagedBlockchain::Network], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::managedblockchain:::networks/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::ManagedBlockchain::Node], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::managedblockchain:::nodes/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::MedicalImaging::Datastore], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::medical-imaging:::datastore/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::NeptuneGraph::Graph], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::neptune-graph:::graph/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::PCAConnectorAD::Connector], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::pca-connector-ad:::connector/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::QApps:QApp], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::qapps:::application//qapp/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::QBusiness::Application], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::qbusiness:::application/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::QBusiness::DataSource], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::qbusiness:::application//index//data-source/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::QBusiness::Index], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::qbusiness:::application//index/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::QBusiness::WebExperience], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::qbusiness:::application//web-experience/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::RDS::DBCluster], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::rds:::cluster/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::S3::AccessPoint], and the operator is set to [Equals] or [NotEquals], the ARN must be in one of the following formats. To log events on all objects in an S3 access point, we recommend that you use only the access point ARN, don’t include the object path, and use the [StartsWith] or [NotStartsWith] operators.
                
                 {ul
                      {- 
                         {[
                         arn::s3:::accesspoint/
                         ]}
                         
                         
                         }
                       {- 
                          {[
                          arn::s3:::accesspoint//object/
                          ]}
                          
                          
                          }
                      
               }
                When [resources.type] equals [AWS::S3ObjectLambda::AccessPoint], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::s3-object-lambda:::accesspoint/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::S3Outposts::Object], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::s3-outposts:::
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::SageMaker::Endpoint], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::sagemaker:::endpoint/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::SageMaker::ExperimentTrialComponent], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::sagemaker:::experiment-trial-component/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::SageMaker::FeatureGroup], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::sagemaker:::feature-group/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::SCN::Instance], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::scn:::instance/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::ServiceDiscovery::Namespace], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::servicediscovery:::namespace/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::ServiceDiscovery::Service], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::servicediscovery:::service/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::SNS::PlatformEndpoint], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::sns:::endpoint///
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::SNS::Topic], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::sns:::
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::SQS::Queue], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::sqs:::
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::SSM::ManagedNode], and the operator is set to [Equals] or [NotEquals], the ARN must be in one of the following formats:
                
                 {ul
                      {- 
                         {[
                         arn::ssm:::managed-instance/
                         ]}
                         
                         
                         }
                       {- 
                          {[
                          arn::ec2:::instance/
                          ]}
                          
                          
                          }
                      
               }
                When [resources.type] equals [AWS::SSMMessages::ControlChannel], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::ssmmessages:::control-channel/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::SWF::Domain], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::swf:::domain/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::ThinClient::Device], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::thinclient:::device/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::ThinClient::Environment], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::thinclient:::environment/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::Timestream::Database], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::timestream:::database/
                         ]}
                         
                         
                         }
                      
               }
                When [resources.type] equals [AWS::Timestream::Table], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::timestream:::database//table/
                         ]}
                         
                         
                         }
                      
               }
                When resources.type equals [AWS::VerifiedPermissions::PolicyStore], and the operator is set to [Equals] or [NotEquals], the ARN must be in the following format:
                
                 {ul
                      {- 
                         {[
                         arn::verifiedpermissions:::policy-store/
                         ]}
                         
                         
                         }
                      
               }
               
             ]}
             }
             [
         ]
      }
       *)

}

(** 
    Advanced event selectors let you create fine-grained selectors for CloudTrail management and data events. They help you control costs by logging only those events that are important to you. For more information about advanced event selectors, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging management events} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events} in the {i CloudTrail User Guide}.
    
     You cannot apply both event selectors and advanced event selectors to a trail.
     
      {b Supported CloudTrail event record fields for management events}
      
       {ul
            {- [eventCategory] (required)
               
               }
             {- [eventSource]
                
                }
             {- [readOnly]
                
                }
            
      }
       {b Supported CloudTrail event record fields for data events}
       
        {ul
             {- [eventCategory] (required)
                
                }
              {- [resources.type] (required)
                 
                 }
              {- [readOnly]
                 
                 }
              {- [eventName]
                 
                 }
              {- [resources.ARN]
                 
                 }
             
      }
       For event data stores for CloudTrail Insights events, Config configuration items, Audit Manager evidence, or events outside of Amazon Web Services, the only supported field is [eventCategory].
       
        *)
type advanced_event_selector = {
  field_selectors: advanced_field_selector list;
  (** 
    Contains all selector statements in an advanced event selector.
     *)

  name: string option;
  [@ocaml.doc {| 
    An optional, descriptive name for an advanced event selector, such as "Log data events for only two S3 buckets".
     |}]

}

type billing_mode = | FIXED_RETENTION_PRICING
  | EXTENDABLE_RETENTION_PRICING

type federation_status = | DISABLED
  | DISABLING
  | ENABLED
  | ENABLING

type update_event_data_store_response = {
  federation_role_arn: string option;
  (** 
    If Lake query federation is enabled, provides the ARN of the federation role used to access the resources for the federated event data store.
     *)

  federation_status: federation_status option;
  (** 
    Indicates the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html}Lake query federation} status. The status is [ENABLED] if Lake query federation is enabled, or [DISABLED] if Lake query federation is disabled. You cannot delete an event data store if the [FederationStatus] is [ENABLED].
     *)

  billing_mode: billing_mode option;
  (** 
    The billing mode for the event data store.
     *)

  kms_key_id: string option;
  (** 
    Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.
    
     [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012]
      *)

  updated_timestamp: float option;
  (** 
    The timestamp that shows when the event data store was last updated. [UpdatedTimestamp] is always either the same or newer than the time shown in [CreatedTimestamp].
     *)

  created_timestamp: float option;
  (** 
    The timestamp that shows when an event data store was first created.
     *)

  termination_protection_enabled: bool option;
  (** 
    Indicates whether termination protection is enabled for the event data store.
     *)

  retention_period: int option;
  (** 
    The retention period, in days.
     *)

  organization_enabled: bool option;
  (** 
    Indicates whether an event data store is collecting logged events for an organization in Organizations.
     *)

  multi_region_enabled: bool option;
  (** 
    Indicates whether the event data store includes events from all Regions, or only from the Region in which it was created.
     *)

  advanced_event_selectors: advanced_event_selector list option;
  (** 
    The advanced event selectors that are applied to the event data store.
     *)

  status: event_data_store_status option;
  (** 
    The status of an event data store.
     *)

  name: string option;
  (** 
    The name of the event data store.
     *)

  event_data_store_arn: string option;
  (** 
    The ARN of the event data store.
     *)

}

type update_event_data_store_request = {
  billing_mode: billing_mode option;
  (** 
    You can't change the billing mode from [EXTENDABLE_RETENTION_PRICING] to [FIXED_RETENTION_PRICING]. If [BillingMode] is set to [EXTENDABLE_RETENTION_PRICING] and you want to use [FIXED_RETENTION_PRICING] instead, you'll need to stop ingestion on the event data store and create a new event data store that uses [FIXED_RETENTION_PRICING].
    
     The billing mode for the event data store determines the cost for ingesting events and the default and maximum retention period for the event data store.
     
      The following are the possible values:
      
       {ul
            {- [EXTENDABLE_RETENTION_PRICING] - This billing mode is generally recommended if you want a flexible retention period of up to 3653 days (about 10 years). The default retention period for this billing mode is 366 days.
               
               }
             {- [FIXED_RETENTION_PRICING] - This billing mode is recommended if you expect to ingest more than 25 TB of event data per month and need a retention period of up to 2557 days (about 7 years). The default retention period for this billing mode is 2557 days.
                
                }
            
      }
       For more information about CloudTrail pricing, see {{:http://aws.amazon.com/cloudtrail/pricing/}CloudTrail Pricing} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-manage-costs.html}Managing CloudTrail Lake costs}.
        *)

  kms_key_id: string option;
  (** 
    Specifies the KMS key ID to use to encrypt the events delivered by CloudTrail. The value can be an alias name prefixed by [alias/], a fully specified ARN to an alias, a fully specified ARN to a key, or a globally unique identifier.
    
     Disabling or deleting the KMS key, or removing CloudTrail permissions on the key, prevents CloudTrail from logging events to the event data store, and prevents users from querying the data in the event data store that was encrypted with the key. After you associate an event data store with a KMS key, the KMS key cannot be removed or changed. Before you disable or delete a KMS key that you are using with an event data store, delete or back up your event data store.
     
      CloudTrail also supports KMS multi-Region keys. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Using multi-Region keys} in the {i Key Management Service Developer Guide}.
      
       Examples:
       
        {ul
             {- [alias/MyAliasName]
                
                }
              {- [arn:aws:kms:us-east-2:123456789012:alias/MyAliasName]
                 
                 }
              {- [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012]
                 
                 }
              {- [12345678-1234-1234-1234-123456789012]
                 
                 }
             
      }
       *)

  termination_protection_enabled: bool option;
  (** 
    Indicates that termination protection is enabled and the event data store cannot be automatically deleted.
     *)

  retention_period: int option;
  (** 
    The retention period of the event data store, in days. If [BillingMode] is set to [EXTENDABLE_RETENTION_PRICING], you can set a retention period of up to 3653 days, the equivalent of 10 years. If [BillingMode] is set to [FIXED_RETENTION_PRICING], you can set a retention period of up to 2557 days, the equivalent of seven years.
    
     CloudTrail Lake determines whether to retain an event by checking if the [eventTime] of the event is within the specified retention period. For example, if you set a retention period of 90 days, CloudTrail will remove events when the [eventTime] is older than 90 days.
     
      If you decrease the retention period of an event data store, CloudTrail will remove any events with an [eventTime] older than the new retention period. For example, if the previous retention period was 365 days and you decrease it to 100 days, CloudTrail will remove events with an [eventTime] older than 100 days.
      
       *)

  organization_enabled: bool option;
  (** 
    Specifies whether an event data store collects events logged for an organization in Organizations.
    
     Only the management account for the organization can convert an organization event data store to a non-organization event data store, or convert a non-organization event data store to an organization event data store.
     
      *)

  multi_region_enabled: bool option;
  (** 
    Specifies whether an event data store collects events from all Regions, or only from the Region in which it was created.
     *)

  advanced_event_selectors: advanced_event_selector list option;
  (** 
    The advanced event selectors used to select events for the event data store. You can configure up to five advanced event selectors for each event data store.
     *)

  name: string option;
  (** 
    The event data store name.
     *)

  event_data_store: string;
  (** 
    The ARN (or the ID suffix of the ARN) of the event data store that you want to update.
     *)

}

(** 
    For [PutInsightSelectors], this exception is thrown when the formatting or syntax of the [InsightSelectors] JSON statement is not valid, or the specified [InsightType] in the [InsightSelectors] statement is not valid. Valid values for [InsightType] are [ApiCallRateInsight] and [ApiErrorRateInsight]. To enable Insights on an event data store, the destination event data store specified by the [InsightsDestination] parameter must log Insights events and the source event data store specified by the [EventDataStore] parameter must log management events.
    
     For [UpdateEventDataStore], this exception is thrown if Insights are enabled on the event data store and the updated advanced event selectors are not compatible with the configured [InsightSelectors]. If the [InsightSelectors] includes an [InsightType] of [ApiCallRateInsight], the source event data store must log [write] management events. If the [InsightSelectors] includes an [InsightType] of [ApiErrorRateInsight], the source event data store must log management events.
      *)
type invalid_insight_selectors_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    The event data store is inactive.
     *)
type inactive_event_data_store_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    The specified event data store was not found.
     *)
type event_data_store_not_found_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when you try to update or delete an event data store that currently has an import in progress.
     *)
type event_data_store_has_ongoing_import_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    The specified event data store ARN is not valid or does not map to an event data store in your account.
     *)
type event_data_store_arn_invalid_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    An event data store with that name already exists.
     *)
type event_data_store_already_exists_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type destination_type = | AWS_SERVICE
  | EVENT_DATA_STORE

(** 
    Contains information about the destination receiving events.
     *)
type destination = {
  location: string;
  (** 
    For channels used for a CloudTrail Lake integration, the location is the ARN of an event data store that receives events from a channel. For service-linked channels, the location is the name of the Amazon Web Services service.
     *)

  type_: destination_type;
  (** 
    The type of destination for events arriving from a channel. For channels used for a CloudTrail Lake integration, the value is [EVENT_DATA_STORE]. For service-linked channels, the value is [AWS_SERVICE].
     *)

}

type update_channel_response = {
  destinations: destination list option;
  (** 
    The event data stores that log events arriving through the channel.
     *)

  source: string option;
  (** 
    The event source of the channel that was updated.
     *)

  name: string option;
  (** 
    The name of the channel that was updated.
     *)

  channel_arn: string option;
  (** 
    The ARN of the channel that was updated.
     *)

}

type update_channel_request = {
  name: string option;
  (** 
    Changes the name of the channel.
     *)

  destinations: destination list option;
  (** 
    The ARNs of event data stores that you want to log events arriving through the channel.
     *)

  channel: string;
  (** 
    The ARN or ID (the ARN suffix) of the channel that you want to update.
     *)

}

(** 
    This exception is thrown when event categories of specified event data stores are not valid.
     *)
type invalid_event_data_store_category_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when CloudTrail cannot find the specified channel.
     *)
type channel_not_found_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the specified value of [ChannelARN] is not valid.
     *)
type channel_arn_invalid_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the provided channel already exists.
     *)
type channel_already_exists_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Information about a CloudTrail trail, including the trail's name, home Region, and Amazon Resource Name (ARN).
     *)
type trail_info = {
  home_region: string option;
  (** 
    The Amazon Web Services Region in which a trail was created.
     *)

  name: string option;
  (** 
    The name of a trail.
     *)

  trail_ar_n: string option;
  (** 
    The ARN of a trail.
     *)

}

(** 
    The settings for a trail.
     *)
type trail = {
  is_organization_trail: bool option;
  (** 
    Specifies whether the trail is an organization trail.
     *)

  has_insight_selectors: bool option;
  (** 
    Specifies whether a trail has insight types specified in an [InsightSelector] list.
     *)

  has_custom_event_selectors: bool option;
  (** 
    Specifies if the trail has custom event selectors.
     *)

  kms_key_id: string option;
  (** 
    Specifies the KMS key ID that encrypts the logs delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.
    
     [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012]
      *)

  cloud_watch_logs_role_arn: string option;
  (** 
    Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group.
     *)

  cloud_watch_logs_log_group_arn: string option;
  (** 
    Specifies an Amazon Resource Name (ARN), a unique identifier that represents the log group to which CloudTrail logs will be delivered.
     *)

  log_file_validation_enabled: bool option;
  (** 
    Specifies whether log file validation is enabled.
     *)

  trail_ar_n: string option;
  (** 
    Specifies the ARN of the trail. The following is the format of a trail ARN.
    
     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
      *)

  home_region: string option;
  (** 
    The Region in which the trail was created.
     *)

  is_multi_region_trail: bool option;
  (** 
    Specifies whether the trail exists only in one Region or exists in all Regions.
     *)

  include_global_service_events: bool option;
  (** 
    Set to {b True} to include Amazon Web Services API calls from Amazon Web Services global services such as IAM. Otherwise, {b False}.
     *)

  sns_topic_ar_n: string option;
  (** 
    Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send notifications when log files are delivered. The following is the format of a topic ARN.
    
     [arn:aws:sns:us-east-2:123456789012:MyTopic]
      *)

  sns_topic_name: string option;
  (** 
    This field is no longer in use. Use [SnsTopicARN].
     *)

  s3_key_prefix: string option;
  (** 
    Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for log file delivery. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files}Finding Your CloudTrail Log Files}. The maximum length is 200 characters.
     *)

  s3_bucket_name: string option;
  (** 
    Name of the Amazon S3 bucket into which CloudTrail delivers your trail files. See {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html}Amazon S3 Bucket naming rules}.
     *)

  name: string option;
  (** 
    Name of the trail set by calling [CreateTrail]. The maximum length is 128 characters.
     *)

}

(** 
    This exception is thrown when the specified trail already exists.
     *)
type trail_already_exists_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    A custom key-value pair associated with a resource such as a CloudTrail trail, event data store, or channel.
     *)
type tag = {
  value: string option;
  (** 
    The value in a key-value pair of a tag. The value must be no longer than 256 Unicode characters.
     *)

  key: string;
  (** 
    The key in a key-value pair. The key must be must be no longer than 128 Unicode characters. The key must be unique for the resource to which it applies.
     *)

}

(** 
    The number of tags per trail, event data store, or channel has exceeded the permitted amount. Currently, the limit is 50.
     *)
type tags_limit_exceeded_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Returns the objects or data listed below if successful. Otherwise, returns an error.
     *)
type stop_logging_response = unit

(** 
    Passes the request to CloudTrail to stop logging Amazon Web Services API calls for the specified account.
     *)
type stop_logging_request = {
  name: string;
  (** 
    Specifies the name or the CloudTrail ARN of the trail for which CloudTrail will stop logging Amazon Web Services API calls. The following is the format of a trail ARN.
    
     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
      *)

}

(** 
    The settings for the source S3 bucket.
     *)
type s3_import_source = {
  s3_bucket_access_role_arn: string;
  (** 
    The IAM ARN role used to access the source S3 bucket.
     *)

  s3_bucket_region: string;
  (** 
    The Region associated with the source S3 bucket.
     *)

  s3_location_uri: string;
  (** 
    The URI for the source S3 bucket.
     *)

}

(** 
    The import source.
     *)
type import_source = {
  s3: s3_import_source;
  (** 
    The source S3 bucket.
     *)

}

type import_status = | COMPLETED
  | STOPPED
  | FAILED
  | IN_PROGRESS
  | INITIALIZING

(** 
    Provides statistics for the specified [ImportID]. CloudTrail does not update import statistics in real-time. Returned values for parameters such as [EventsCompleted] may be lower than the actual value, because CloudTrail updates statistics incrementally over the course of the import.
     *)
type import_statistics = {
  failed_entries: int option;
  (** 
    The number of failed entries.
     *)

  events_completed: int option;
  (** 
    The number of trail events imported into the event data store.
     *)

  files_completed: int option;
  (** 
    The number of log files that completed import.
     *)

  prefixes_completed: int option;
  (** 
    The number of S3 prefixes that completed import.
     *)

  prefixes_found: int option;
  (** 
    The number of S3 prefixes found for the import.
     *)

}

type stop_import_response = {
  import_statistics: import_statistics option;
  (** 
    Returns information on the stopped import.
     *)

  end_event_time: float option;
  (** 
    Used with [StartEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period.
     *)

  start_event_time: float option;
  (** 
    Used with [EndEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period.
     *)

  updated_timestamp: float option;
  (** 
    The timestamp of the import's last update.
     *)

  created_timestamp: float option;
  (** 
    The timestamp of the import's creation.
     *)

  import_status: import_status option;
  (** 
    The status of the import.
     *)

  destinations: string list option;
  (** 
    The ARN of the destination event data store.
     *)

  import_source: import_source option;
  (** 
    The source S3 bucket for the import.
     *)

  import_id: string option;
  (** 
    The ID for the import.
     *)

}

type stop_import_request = {
  import_id: string;
  (** 
    The ID of the import.
     *)

}

(** 
    The specified import was not found.
     *)
type import_not_found_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type stop_event_data_store_ingestion_response = unit

type stop_event_data_store_ingestion_request = {
  event_data_store: string;
  (** 
    The ARN (or ID suffix of the ARN) of the event data store for which you want to stop ingestion.
     *)

}

(** 
    The event data store is not in a status that supports the operation.
     *)
type invalid_event_data_store_status_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type start_query_response = {
  query_id: string option;
  (** 
    The ID of the started query.
     *)

}

type start_query_request = {
  query_parameters: string list option;
  (** 
    The query parameters for the specified [QueryAlias].
     *)

  query_alias: string option;
  (** 
    The alias that identifies a query template.
     *)

  delivery_s3_uri: string option;
  (** 
    The URI for the S3 bucket where CloudTrail delivers the query results.
     *)

  query_statement: string option;
  (** 
    The SQL code of your query.
     *)

}

(** 
    You are already running the maximum number of concurrent queries. The maximum number of concurrent queries is 10. Wait a minute for some queries to finish, and then run the query again.
     *)
type max_concurrent_queries_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    The query that was submitted has validation errors, or uses incorrect syntax or unsupported keywords. For more information about writing a query, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-create-edit-query.html}Create or edit a query} in the {i CloudTrail User Guide}.
     *)
type invalid_query_statement_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Returns the objects or data listed below if successful. Otherwise, returns an error.
     *)
type start_logging_response = unit

(** 
    The request to CloudTrail to start logging Amazon Web Services API calls for an account.
     *)
type start_logging_request = {
  name: string;
  (** 
    Specifies the name or the CloudTrail ARN of the trail for which CloudTrail logs Amazon Web Services API calls. The following is the format of a trail ARN.
    
     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
      *)

}

type start_import_response = {
  updated_timestamp: float option;
  (** 
    The timestamp of the import's last update, if applicable.
     *)

  created_timestamp: float option;
  (** 
    The timestamp for the import's creation.
     *)

  import_status: import_status option;
  (** 
    Shows the status of the import after a [StartImport] request. An import finishes with a status of [COMPLETED] if there were no failures, or [FAILED] if there were failures.
     *)

  end_event_time: float option;
  (** 
    Used with [StartEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period.
     *)

  start_event_time: float option;
  (** 
    Used with [EndEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period.
     *)

  import_source: import_source option;
  (** 
    The source S3 bucket for the import.
     *)

  destinations: string list option;
  (** 
    The ARN of the destination event data store.
     *)

  import_id: string option;
  (** 
    The ID of the import.
     *)

}

type start_import_request = {
  import_id: string option;
  (** 
    The ID of the import. Use this parameter when you are retrying an import.
     *)

  end_event_time: float option;
  (** 
    Use with [StartEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period. When you specify a time range, CloudTrail checks the prefix and log file names to verify the names contain a date between the specified [StartEventTime] and [EndEventTime] before attempting to import events.
     *)

  start_event_time: float option;
  (** 
    Use with [EndEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period. When you specify a time range, CloudTrail checks the prefix and log file names to verify the names contain a date between the specified [StartEventTime] and [EndEventTime] before attempting to import events.
     *)

  import_source: import_source option;
  (** 
    The source S3 bucket for the import. Use this parameter for a new import.
     *)

  destinations: string list option;
  (** 
    The ARN of the destination event data store. Use this parameter for a new import.
     *)

}

(** 
    This exception is thrown when the provided source S3 bucket is not valid for import.
     *)
type invalid_import_source_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when you start a new import and a previous import is still in progress.
     *)
type account_has_ongoing_import_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type start_event_data_store_ingestion_response = unit

type start_event_data_store_ingestion_request = {
  event_data_store: string;
  (** 
    The ARN (or ID suffix of the ARN) of the event data store for which you want to start ingestion.
     *)

}

(** 
    Contains configuration information about the channel.
     *)
type source_config = {
  advanced_event_selectors: advanced_event_selector list option;
  (** 
    The advanced event selectors that are configured for the channel.
     *)

  apply_to_all_regions: bool option;
  (** 
    Specifies whether the channel applies to a single Region or to all Regions.
     *)

}

type restore_event_data_store_response = {
  billing_mode: billing_mode option;
  (** 
    The billing mode for the event data store.
     *)

  kms_key_id: string option;
  (** 
    Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.
    
     [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012]
      *)

  updated_timestamp: float option;
  (** 
    The timestamp that shows when an event data store was updated, if applicable. [UpdatedTimestamp] is always either the same or newer than the time shown in [CreatedTimestamp].
     *)

  created_timestamp: float option;
  (** 
    The timestamp of an event data store's creation.
     *)

  termination_protection_enabled: bool option;
  (** 
    Indicates that termination protection is enabled and the event data store cannot be automatically deleted.
     *)

  retention_period: int option;
  (** 
    The retention period, in days.
     *)

  organization_enabled: bool option;
  (** 
    Indicates whether an event data store is collecting logged events for an organization in Organizations.
     *)

  multi_region_enabled: bool option;
  (** 
    Indicates whether the event data store is collecting events from all Regions, or only from the Region in which the event data store was created.
     *)

  advanced_event_selectors: advanced_event_selector list option;
  (** 
    The advanced event selectors that were used to select events.
     *)

  status: event_data_store_status option;
  (** 
    The status of the event data store.
     *)

  name: string option;
  (** 
    The name of the event data store.
     *)

  event_data_store_arn: string option;
  (** 
    The event data store ARN.
     *)

}

type restore_event_data_store_request = {
  event_data_store: string;
  (** 
    The ARN (or the ID suffix of the ARN) of the event data store that you want to restore.
     *)

}

(** 
    Your account has used the maximum number of event data stores.
     *)
type event_data_store_max_limit_exceeded_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the specified resource type is not supported by CloudTrail.
     *)
type resource_type_not_supported_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    A resource tag.
     *)
type resource_tag = {
  tags_list: tag list option;
  (** 
    A list of tags.
     *)

  resource_id: string option;
  (** 
    Specifies the ARN of the resource.
     *)

}

(** 
    This exception is thrown when the resouce-based policy has syntax errors, or contains a principal that is not valid.
    
     The following are requirements for the resource policy:
     
      {ul
           {- Contains only one action: cloudtrail-data:PutAuditEvents
              
              }
            {- Contains at least one statement. The policy can have a maximum of 20 statements.
               
               }
            {- Each statement contains at least one principal. A statement can have a maximum of 50 principals.
               
               }
           
      }
       *)
type resource_policy_not_valid_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the specified resource policy is not found.
     *)
type resource_policy_not_found_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the specified resource is not found.
     *)
type resource_not_found_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Specifies the type and name of a resource referenced by an event.
     *)
type resource = {
  resource_name: string option;
  [@ocaml.doc {| 
    The name of the resource referenced by the event returned. These are user-created names whose values will depend on the environment. For example, the resource name might be "auto-scaling-test-group" for an Auto Scaling Group or "i-1234567" for an EC2 Instance.
     |}]

  resource_type: string option;
  (** 
    The type of a resource referenced by the event returned. When the resource type cannot be determined, null is returned. Some examples of resource types are: {b Instance} for EC2, {b Trail} for CloudTrail, {b DBInstance} for Amazon RDS, and {b AccessKey} for IAM. To learn more about how to look up and filter events by the resource types supported for a service, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/view-cloudtrail-events-console.html#filtering-cloudtrail-events}Filtering CloudTrail Events}.
     *)

}

(** 
    This exception is thrown when the provided resource does not exist, or the ARN format of the resource is not valid. The following is the valid format for a resource ARN: [arn:aws:cloudtrail:us-east-2:123456789012:channel/MyChannel].
     *)
type resource_arn_not_valid_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Returns the objects or data listed below if successful. Otherwise, returns an error.
     *)
type remove_tags_response = unit

(** 
    Specifies the tags to remove from a trail, event data store, or channel.
     *)
type remove_tags_request = {
  tags_list: tag list;
  (** 
    Specifies a list of tags to be removed.
     *)

  resource_id: string;
  (** 
    Specifies the ARN of the trail, event data store, or channel from which tags should be removed.
    
     Example trail ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
     
      Example event data store ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE]
      
       Example channel ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890]
        *)

}

(** 
    This exception is thrown when the specified tag key or values are not valid. It can also occur if there are duplicate tags or too many tags on the resource.
     *)
type invalid_tag_parameter_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Returns the following response if successful. Otherwise, returns an error.
     *)
type register_organization_delegated_admin_response = unit

(** 
    Specifies an organization member account ID as a CloudTrail delegated administrator.
     *)
type register_organization_delegated_admin_request = {
  member_account_id: string;
  (** 
    An organization member account ID that you want to designate as a delegated administrator.
     *)

}

(** 
    This exception is thrown when the account making the request is not the organization's management account.
     *)
type not_organization_management_account_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the maximum number of CloudTrail delegated administrators is reached.
     *)
type delegated_admin_account_limit_exceeded_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the management account of an organization is registered as the CloudTrail delegated administrator.
     *)
type cannot_delegate_management_account_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the account is already registered as the CloudTrail delegated administrator.
     *)
type account_registered_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown when the specified account is not found or not part of an organization.
     *)
type account_not_found_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type read_write_type = | All
  | WriteOnly
  | ReadOnly

type query_status = | TIMED_OUT
  | CANCELLED
  | FAILED
  | FINISHED
  | RUNNING
  | QUEUED

(** 
    Gets metadata about a query, including the number of events that were matched, the total number of events scanned, the query run time in milliseconds, and the query's creation time.
     *)
type query_statistics_for_describe_query = {
  creation_time: float option;
  (** 
    The creation time of the query.
     *)

  execution_time_in_millis: int option;
  (** 
    The query's run time, in milliseconds.
     *)

  bytes_scanned: int option;
  (** 
    The total bytes that the query scanned in the event data store. This value matches the number of bytes for which your account is billed for the query, unless the query is still running.
     *)

  events_scanned: int option;
  (** 
    The number of events that the query scanned in the event data store.
     *)

  events_matched: int option;
  (** 
    The number of events that matched a query.
     *)

}

(** 
    Metadata about a query, such as the number of results.
     *)
type query_statistics = {
  bytes_scanned: int option;
  (** 
    The total bytes that the query scanned in the event data store. This value matches the number of bytes for which your account is billed for the query, unless the query is still running.
     *)

  total_results_count: int option;
  (** 
    The total number of results returned by a query.
     *)

  results_count: int option;
  (** 
    The number of results returned.
     *)

}

(** 
    The query ID does not exist or does not map to a query.
     *)
type query_id_not_found_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    A SQL string of criteria about events that you want to collect in an event data store.
     *)
type query = {
  creation_time: float option;
  (** 
    The creation time of a query.
     *)

  query_status: query_status option;
  (** 
    The status of the query. This can be [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED].
     *)

  query_id: string option;
  (** 
    The ID of a query.
     *)

}

type put_resource_policy_response = {
  resource_policy: string option;
  (** 
    The JSON-formatted string of the Amazon Web Services resource-based policy attached to the CloudTrail channel.
     *)

  resource_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the CloudTrail channel attached to the resource-based policy.
     *)

}

type put_resource_policy_request = {
  resource_policy: string;
  (** 
    A JSON-formatted string for an Amazon Web Services resource-based policy.
    
     The following are requirements for the resource policy:
     
      {ul
           {- Contains only one action: cloudtrail-data:PutAuditEvents
              
              }
            {- Contains at least one statement. The policy can have a maximum of 20 statements.
               
               }
            {- Each statement contains at least one principal. A statement can have a maximum of 50 principals.
               
               }
           
      }
       *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the CloudTrail channel attached to the resource-based policy. The following is the format of a resource ARN: [arn:aws:cloudtrail:us-east-2:123456789012:channel/MyChannel].
     *)

}

type insight_type = | ApiErrorRateInsight
  | ApiCallRateInsight

(** 
    A JSON string that contains a list of Insights types that are logged on a trail or event data store.
     *)
type insight_selector = {
  insight_type: insight_type option;
  (** 
    The type of Insights events to log on a trail or event data store. [ApiCallRateInsight] and [ApiErrorRateInsight] are valid Insight types.
    
     The [ApiCallRateInsight] Insights type analyzes write-only management API calls that are aggregated per minute against a baseline API call volume.
     
      The [ApiErrorRateInsight] Insights type analyzes management API calls that result in error codes. The error is shown if the API call is unsuccessful.
       *)

}

type put_insight_selectors_response = {
  insights_destination: string option;
  (** 
    The ARN of the destination event data store that logs Insights events.
     *)

  event_data_store_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the source event data store for which you want to change or add Insights selectors.
     *)

  insight_selectors: insight_selector list option;
  (** 
    A JSON string that contains the Insights event types that you want to log on a trail or event data store. The valid Insights types are [ApiErrorRateInsight] and [ApiCallRateInsight].
     *)

  trail_ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of a trail for which you want to change or add Insights selectors.
     *)

}

type put_insight_selectors_request = {
  insights_destination: string option;
  (** 
    The ARN (or ID suffix of the ARN) of the destination event data store that logs Insights events. To enable Insights on an event data store, you must provide both the [EventDataStore] and [InsightsDestination] parameters.
    
     You cannot use this parameter with the [TrailName] parameter.
      *)

  event_data_store: string option;
  (** 
    The ARN (or ID suffix of the ARN) of the source event data store for which you want to change or add Insights selectors. To enable Insights on an event data store, you must provide both the [EventDataStore] and [InsightsDestination] parameters.
    
     You cannot use this parameter with the [TrailName] parameter.
      *)

  insight_selectors: insight_selector list;
  (** 
    A JSON string that contains the Insights types you want to log on a trail or event data store. [ApiCallRateInsight] and [ApiErrorRateInsight] are valid Insight types.
    
     The [ApiCallRateInsight] Insights type analyzes write-only management API calls that are aggregated per minute against a baseline API call volume.
     
      The [ApiErrorRateInsight] Insights type analyzes management API calls that result in error codes. The error is shown if the API call is unsuccessful.
       *)

  trail_name: string option;
  (** 
    The name of the CloudTrail trail for which you want to change or add Insights selectors.
    
     You cannot use this parameter with the [EventDataStore] and [InsightsDestination] parameters.
      *)

}

(** 
    Data events provide information about the resource operations performed on or within a resource itself. These are also known as data plane operations. You can specify up to 250 data resources for a trail.
    
     Configure the [DataResource] to specify the resource type and resource ARNs for which you want to log data events.
     
      You can specify the following resource types in your event selectors for your trail:
      
       {ul
            {- [AWS::DynamoDB::Table]
               
               }
             {- [AWS::Lambda::Function]
                
                }
             {- [AWS::S3::Object]
                
                }
            
      }
       The total number of allowed data resources is 250. This number can be distributed between 1 and 5 event selectors, but the total cannot exceed 250 across all selectors for the trail.
       
        If you are using advanced event selectors, the maximum total number of values for all conditions, across all advanced event selectors for the trail, is 500.
        
         The following example demonstrates how logging works when you configure logging of all data events for an S3 bucket named [bucket-1]. In this example, the CloudTrail user specified an empty prefix, and the option to log both [Read] and [Write] data events.
         
          {ol
               {- A user uploads an image file to [bucket-1].
                  
                  }
                {- The [PutObject] API operation is an Amazon S3 object-level API. It is recorded as a data event in CloudTrail. Because the CloudTrail user specified an S3 bucket with an empty prefix, events that occur on any object in that bucket are logged. The trail processes and logs the event.
                   
                   }
                {- A user uploads an object to an Amazon S3 bucket named [arn:aws:s3:::bucket-2].
                   
                   }
                {- The [PutObject] API operation occurred for an object in an S3 bucket that the CloudTrail user didn't specify for the trail. The trail doesn’t log the event.
                   
                   }
               
      }
       The following example demonstrates how logging works when you configure logging of Lambda data events for a Lambda function named {i MyLambdaFunction}, but not for all Lambda functions.
       
        {ol
             {- A user runs a script that includes a call to the {i MyLambdaFunction} function and the {i MyOtherLambdaFunction} function.
                
                }
              {- The [Invoke] API operation on {i MyLambdaFunction} is an Lambda API. It is recorded as a data event in CloudTrail. Because the CloudTrail user specified logging data events for {i MyLambdaFunction}, any invocations of that function are logged. The trail processes and logs the event.
                 
                 }
              {- The [Invoke] API operation on {i MyOtherLambdaFunction} is an Lambda API. Because the CloudTrail user did not specify logging data events for all Lambda functions, the [Invoke] operation for {i MyOtherLambdaFunction} does not match the function specified for the trail. The trail doesn’t log the event.
                 
                 }
             
      }
       *)
type data_resource = {
  values: string list option;
  (** 
    An array of Amazon Resource Name (ARN) strings or partial ARN strings for the specified resource type.
    
     {ul
          {- To log data events for all objects in all S3 buckets in your Amazon Web Services account, specify the prefix as [arn:aws:s3].
             
              This also enables logging of data event activity performed by any user or role in your Amazon Web Services account, even if that activity is performed on a bucket that belongs to another Amazon Web Services account.
              
              }
           {- To log data events for all objects in an S3 bucket, specify the bucket and an empty object prefix such as [arn:aws:s3:::bucket-1/]. The trail logs data events for all objects in this S3 bucket.
              
              }
           {- To log data events for specific objects, specify the S3 bucket and object prefix such as [arn:aws:s3:::bucket-1/example-images]. The trail logs data events for objects in this S3 bucket that match the prefix.
              
              }
           {- To log data events for all Lambda functions in your Amazon Web Services account, specify the prefix as [arn:aws:lambda].
              
               This also enables logging of [Invoke] activity performed by any user or role in your Amazon Web Services account, even if that activity is performed on a function that belongs to another Amazon Web Services account.
               
               }
           {- To log data events for a specific Lambda function, specify the function ARN.
              
               Lambda function ARNs are exact. For example, if you specify a function ARN {i arn:aws:lambda:us-west-2:111111111111:function:helloworld}, data events will only be logged for {i arn:aws:lambda:us-west-2:111111111111:function:helloworld}. They will not be logged for {i arn:aws:lambda:us-west-2:111111111111:function:helloworld2}.
               
               }
           {- To log data events for all DynamoDB tables in your Amazon Web Services account, specify the prefix as [arn:aws:dynamodb].
              
              }
          
      }
       *)

  type_: string option;
  (** 
    The resource type in which you want to log data events. You can specify the following {i basic} event selector resource types:
    
     {ul
          {- [AWS::DynamoDB::Table]
             
             }
           {- [AWS::Lambda::Function]
              
              }
           {- [AWS::S3::Object]
              
              }
          
      }
       Additional resource types are available through {i advanced} event selectors. For more information about these additional resource types, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedFieldSelector.html}AdvancedFieldSelector}.
        *)

}

(** 
    Use event selectors to further specify the management and data event settings for your trail. By default, trails created without specific event selectors will be configured to log all read and write management events, and no data events. When an event occurs in your account, CloudTrail evaluates the event selector for all trails. For each trail, if the event matches any event selector, the trail processes and logs the event. If the event doesn't match any event selector, the trail doesn't log the event.
    
     You can configure up to five event selectors for a trail.
     
      You cannot apply both event selectors and advanced event selectors to a trail.
       *)
type event_selector = {
  exclude_management_event_sources: string list option;
  (** 
    An optional list of service event sources from which you do not want management events to be logged on your trail. In this release, the list can be empty (disables the filter), or it can filter out Key Management Service or Amazon RDS Data API events by containing [kms.amazonaws.com] or [rdsdata.amazonaws.com]. By default, [ExcludeManagementEventSources] is empty, and KMS and Amazon RDS Data API events are logged to your trail. You can exclude management event sources only in Regions that support the event source.
     *)

  data_resources: data_resource list option;
  (** 
    CloudTrail supports data event logging for Amazon S3 objects, Lambda functions, and Amazon DynamoDB tables with basic event selectors. You can specify up to 250 resources for an individual event selector, but the total number of data resources cannot exceed 250 across all event selectors in a trail. This limit does not apply if you configure resource logging for all data events.
    
     For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Data Events} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html}Limits in CloudTrail} in the {i CloudTrail User Guide}.
      *)

  include_management_events: bool option;
  (** 
    Specify if you want your event selector to include management events for your trail.
    
     For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Management Events} in the {i CloudTrail User Guide}.
     
      By default, the value is [true].
      
       The first copy of management events is free. You are charged for additional copies of management events that you are logging on any subsequent trail in the same Region. For more information about CloudTrail pricing, see {{:http://aws.amazon.com/cloudtrail/pricing/}CloudTrail Pricing}.
        *)

  read_write_type: read_write_type option;
  (** 
    Specify if you want your trail to log read-only events, write-only events, or all. For example, the EC2 [GetConsoleOutput] is a read-only API operation and [RunInstances] is a write-only API operation.
    
     By default, the value is [All].
      *)

}

type put_event_selectors_response = {
  advanced_event_selectors: advanced_event_selector list option;
  (** 
    Specifies the advanced event selectors configured for your trail.
     *)

  event_selectors: event_selector list option;
  (** 
    Specifies the event selectors configured for your trail.
     *)

  trail_ar_n: string option;
  (** 
    Specifies the ARN of the trail that was updated with event selectors. The following is the format of a trail ARN.
    
     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
      *)

}

type put_event_selectors_request = {
  advanced_event_selectors: advanced_event_selector list option;
  (** 
    Specifies the settings for advanced event selectors. You can add advanced event selectors, and conditions for your advanced event selectors, up to a maximum of 500 values for all conditions and selectors on a trail. You can use either [AdvancedEventSelectors] or [EventSelectors], but not both. If you apply [AdvancedEventSelectors] to a trail, any existing [EventSelectors] are overwritten. For more information about advanced event selectors, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events} in the {i CloudTrail User Guide}.
     *)

  event_selectors: event_selector list option;
  (** 
    Specifies the settings for your event selectors. You can configure up to five event selectors for a trail. You can use either [EventSelectors] or [AdvancedEventSelectors] in a [PutEventSelectors] request, but not both. If you apply [EventSelectors] to a trail, any existing [AdvancedEventSelectors] are overwritten.
     *)

  trail_name: string;
  (** 
    Specifies the name of the trail or trail ARN. If you specify a trail name, the string must meet the following requirements:
    
     {ul
          {- Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)
             
             }
           {- Start with a letter or number, and end with a letter or number
              
              }
           {- Be between 3 and 128 characters
              
              }
           {- Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.
              
              }
           {- Not be in IP address format (for example, 192.168.5.4)
              
              }
          
      }
       If you specify a trail ARN, it must be in the following format.
       
        [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
         *)

}

(** 
    Contains information about a returned public key.
     *)
type public_key = {
  fingerprint: string option;
  (** 
    The fingerprint of the public key.
     *)

  validity_end_time: float option;
  (** 
    The ending time of validity of the public key.
     *)

  validity_start_time: float option;
  (** 
    The starting time of validity of the public key.
     *)

  value: bytes option;
  (** 
    The DER encoded public key value in PKCS#1 format.
     *)

}

(** 
    Contains information about a partition key for an event data store.
     *)
type partition_key = {
  type_: string;
  (** 
    The data type of the partition key. For example, [bigint] or [string].
     *)

  name: string;
  (** 
    The name of the partition key.
     *)

}

(** 
    This exception is thrown when the maximum number of trails is reached.
     *)
type maximum_number_of_trails_exceeded_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Contains information about an event that was returned by a lookup request. The result includes a representation of a CloudTrail event.
     *)
type event = {
  cloud_trail_event: string option;
  (** 
    A JSON string that contains a representation of the event returned.
     *)

  resources: resource list option;
  (** 
    A list of resources referenced by the event returned.
     *)

  username: string option;
  (** 
    A user name or role name of the requester that called the API in the event returned.
     *)

  event_source: string option;
  (** 
    The Amazon Web Services service to which the request was made.
     *)

  event_time: float option;
  (** 
    The date and time of the event returned.
     *)

  access_key_id: string option;
  (** 
    The Amazon Web Services access key ID that was used to sign the request. If the request was made with temporary security credentials, this is the access key ID of the temporary credentials.
     *)

  read_only: string option;
  (** 
    Information about whether the event is a write event or a read event.
     *)

  event_name: string option;
  (** 
    The name of the event returned.
     *)

  event_id: string option;
  (** 
    The CloudTrail ID of the event returned.
     *)

}

(** 
    Contains a response to a LookupEvents action.
     *)
type lookup_events_response = {
  next_token: string option;
  (** 
    The token to use to get the next page of results after a previous API call. If the token does not appear, there are no more results to return. The token must be passed in with the same parameters as the previous call. For example, if the original call specified an AttributeKey of 'Username' with a value of 'root', the call with NextToken should include those same parameters.
     *)

  events: event list option;
  (** 
    A list of events returned based on the lookup attributes specified and the CloudTrail event. The events list is sorted by time. The most recent event is listed first.
     *)

}

type lookup_attribute_key = | ACCESS_KEY_ID
  | EVENT_SOURCE
  | RESOURCE_NAME
  | RESOURCE_TYPE
  | USERNAME
  | READ_ONLY
  | EVENT_NAME
  | EVENT_ID

(** 
    Specifies an attribute and value that filter the events returned.
     *)
type lookup_attribute = {
  attribute_value: string;
  (** 
    Specifies a value for the specified [AttributeKey].
    
     The maximum length for the [AttributeValue] is 2000 characters. The following characters ('[_]', '[ ]', '[,]', '[\\n]') count as two characters towards the 2000 character limit.
      *)

  attribute_key: lookup_attribute_key;
  (** 
    Specifies an attribute on which to filter the events returned.
     *)

}

type event_category = | Insight

(** 
    Contains a request for LookupEvents.
     *)
type lookup_events_request = {
  next_token: string option;
  (** 
    The token to use to get the next page of results after a previous API call. This token must be passed in with the same parameters that were specified in the original call. For example, if the original call specified an AttributeKey of 'Username' with a value of 'root', the call with NextToken should include those same parameters.
     *)

  max_results: int option;
  (** 
    The number of events to return. Possible values are 1 through 50. The default is 50.
     *)

  event_category: event_category option;
  (** 
    Specifies the event category. If you do not specify an event category, events of the category are not returned in the response. For example, if you do not specify [insight] as the value of [EventCategory], no Insights events are returned.
     *)

  end_time: float option;
  (** 
    Specifies that only events that occur before or at the specified time are returned. If the specified end time is before the specified start time, an error is returned.
     *)

  start_time: float option;
  (** 
    Specifies that only events that occur after or at the specified time are returned. If the specified start time is after the specified end time, an error is returned.
     *)

  lookup_attributes: lookup_attribute list option;
  (** 
    Contains a list of lookup attributes. Currently the list can contain only one item.
     *)

}

(** 
    Occurs if the timestamp values are not valid. Either the start time occurs after the end time, or the time range is outside the range of possible values.
     *)
type invalid_time_range_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    A token that is not valid, or a token that was previously used in a request with different parameters. This exception is thrown if the token is not valid.
     *)
type invalid_next_token_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    This exception is thrown if the limit specified is not valid.
     *)
type invalid_max_results_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Occurs when a lookup attribute is specified that is not valid.
     *)
type invalid_lookup_attributes_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Occurs if an event category that is not valid is specified as a value of [EventCategory].
     *)
type invalid_event_category_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type list_trails_response = {
  next_token: string option;
  (** 
    The token to use to get the next page of results after a previous API call. If the token does not appear, there are no more results to return. The token must be passed in with the same parameters as the previous call. For example, if the original call specified an AttributeKey of 'Username' with a value of 'root', the call with NextToken should include those same parameters.
     *)

  trails: trail_info list option;
  (** 
    Returns the name, ARN, and home Region of trails in the current account.
     *)

}

type list_trails_request = {
  next_token: string option;
  (** 
    The token to use to get the next page of results after a previous API call. This token must be passed in with the same parameters that were specified in the original call. For example, if the original call specified an AttributeKey of 'Username' with a value of 'root', the call with NextToken should include those same parameters.
     *)

}

(** 
    Returns the objects or data listed below if successful. Otherwise, returns an error.
     *)
type list_tags_response = {
  next_token: string option;
  (** 
    Reserved for future use.
     *)

  resource_tag_list: resource_tag list option;
  (** 
    A list of resource tags.
     *)

}

(** 
    Specifies a list of tags to return.
     *)
type list_tags_request = {
  next_token: string option;
  (** 
    Reserved for future use.
     *)

  resource_id_list: string list;
  (** 
    Specifies a list of trail, event data store, or channel ARNs whose tags will be listed. The list has a limit of 20 ARNs.
    
     Example trail ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
     
      Example event data store ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE]
      
       Example channel ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890]
        *)

}

(** 
    Reserved for future use.
     *)
type invalid_token_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type list_queries_response = {
  next_token: string option;
  (** 
    A token you can use to get the next page of results.
     *)

  queries: query list option;
  (** 
    Lists matching query results, and shows query ID, status, and creation time of each query.
     *)

}

type list_queries_request = {
  query_status: query_status option;
  (** 
    The status of queries that you want to return in results. Valid values for [QueryStatus] include [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED].
     *)

  end_time: float option;
  (** 
    Use with [StartTime] to bound a [ListQueries] request, and limit its results to only those queries run within a specified time period.
     *)

  start_time: float option;
  (** 
    Use with [EndTime] to bound a [ListQueries] request, and limit its results to only those queries run within a specified time period.
     *)

  max_results: int option;
  (** 
    The maximum number of queries to show on a page.
     *)

  next_token: string option;
  (** 
    A token you can use to get the next page of results.
     *)

  event_data_store: string;
  (** 
    The ARN (or the ID suffix of the ARN) of an event data store on which queries were run.
     *)

}

(** 
    The query status is not valid for the operation.
     *)
type invalid_query_status_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    A date range for the query was specified that is not valid. Be sure that the start time is chronologically before the end time. For more information about writing a query, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-create-edit-query.html}Create or edit a query} in the {i CloudTrail User Guide}.
     *)
type invalid_date_range_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Returns the objects or data listed below if successful. Otherwise, returns an error.
     *)
type list_public_keys_response = {
  next_token: string option;
  (** 
    Reserved for future use.
     *)

  public_key_list: public_key list option;
  (** 
    Contains an array of PublicKey objects.
    
     The returned public keys may have validity time ranges that overlap.
     
      *)

}

(** 
    Requests the public keys for a specified time range.
     *)
type list_public_keys_request = {
  next_token: string option;
  (** 
    Reserved for future use.
     *)

  end_time: float option;
  (** 
    Optionally specifies, in UTC, the end of the time range to look up public keys for CloudTrail digest files. If not specified, the current time is used.
     *)

  start_time: float option;
  (** 
    Optionally specifies, in UTC, the start of the time range to look up public keys for CloudTrail digest files. If not specified, the current time is used, and the current public key is returned.
     *)

}

type list_insights_metric_data_response = {
  next_token: string option;
  (** 
    Only returned if the full results could not be returned in a single query. You can set the [NextToken] parameter in the next request to this value to continue retrieval.
     *)

  values: float list option;
  (** 
    List of values representing the API call rate or error rate at each timestamp. The number of values is equal to the number of timestamps.
     *)

  timestamps: float list option;
  (** 
    List of timestamps at intervals corresponding to the specified time period.
     *)

  error_code: string option;
  (** 
    Only returned if [InsightType] parameter was set to [ApiErrorRateInsight].
    
     If returning metrics for the [ApiErrorRateInsight] Insights type, this is the error to retrieve data for. For example, [AccessDenied].
      *)

  insight_type: insight_type option;
  (** 
    The type of CloudTrail Insights event, which is either [ApiCallRateInsight] or [ApiErrorRateInsight]. The [ApiCallRateInsight] Insights type analyzes write-only management API calls that are aggregated per minute against a baseline API call volume. The [ApiErrorRateInsight] Insights type analyzes management API calls that result in error codes.
     *)

  event_name: string option;
  (** 
    The name of the event, typically the Amazon Web Services API on which unusual levels of activity were recorded.
     *)

  event_source: string option;
  (** 
    The Amazon Web Services service to which the request was made, such as [iam.amazonaws.com] or [s3.amazonaws.com].
     *)

}

type insights_metric_data_type = | NON_ZERO_DATA
  | FILL_WITH_ZEROS

type list_insights_metric_data_request = {
  next_token: string option;
  (** 
    Returned if all datapoints can't be returned in a single call. For example, due to reaching [MaxResults].
    
     Add this parameter to the request to continue retrieving results starting from the last evaluated point.
      *)

  max_results: int option;
  (** 
    The maximum number of datapoints to return. Valid values are integers from 1 to 21600. The default value is 21600.
     *)

  data_type: insights_metric_data_type option;
  (** 
    Type of datapoints to return. Valid values are [NonZeroData] and [FillWithZeros]. The default is [NonZeroData].
     *)

  period: int option;
  (** 
    Granularity of data to retrieve, in seconds. Valid values are [60], [300], and [3600]. If you specify any other value, you will get an error. The default is 3600 seconds.
     *)

  end_time: float option;
  (** 
    Specifies, in UTC, the end time for time-series data. The value specified is exclusive; results include data points up to the specified time stamp.
    
     The default is the time of request.
      *)

  start_time: float option;
  (** 
    Specifies, in UTC, the start time for time-series data. The value specified is inclusive; results include data points with the specified time stamp.
    
     The default is 90 days before the time of request.
      *)

  error_code: string option;
  (** 
    Conditionally required if the [InsightType] parameter is set to [ApiErrorRateInsight].
    
     If returning metrics for the [ApiErrorRateInsight] Insights type, this is the error to retrieve data for. For example, [AccessDenied].
      *)

  insight_type: insight_type;
  (** 
    The type of CloudTrail Insights event, which is either [ApiCallRateInsight] or [ApiErrorRateInsight]. The [ApiCallRateInsight] Insights type analyzes write-only management API calls that are aggregated per minute against a baseline API call volume. The [ApiErrorRateInsight] Insights type analyzes management API calls that result in error codes.
     *)

  event_name: string;
  (** 
    The name of the event, typically the Amazon Web Services API on which unusual levels of activity were recorded.
     *)

  event_source: string;
  (** 
    The Amazon Web Services service to which the request was made, such as [iam.amazonaws.com] or [s3.amazonaws.com].
     *)

}

(** 
    Contains information about an import that was returned by a lookup request.
     *)
type imports_list_item = {
  updated_timestamp: float option;
  (** 
    The timestamp of the import's last update.
     *)

  created_timestamp: float option;
  (** 
    The timestamp of the import's creation.
     *)

  destinations: string list option;
  (** 
    The ARN of the destination event data store.
     *)

  import_status: import_status option;
  (** 
    The status of the import.
     *)

  import_id: string option;
  (** 
    The ID of the import.
     *)

}

type list_imports_response = {
  next_token: string option;
  (** 
    A token you can use to get the next page of import results.
     *)

  imports: imports_list_item list option;
  (** 
    The list of returned imports.
     *)

}

type list_imports_request = {
  next_token: string option;
  (** 
    A token you can use to get the next page of import results.
     *)

  import_status: import_status option;
  (** 
    The status of the import.
     *)

  destination: string option;
  (** 
    The ARN of the destination event data store.
     *)

  max_results: int option;
  (** 
    The maximum number of imports to display on a single page.
     *)

}

type import_failure_status = | SUCCEEDED
  | RETRY
  | FAILED

(** 
    Provides information about an import failure.
     *)
type import_failure_list_item = {
  last_updated_time: float option;
  (** 
    When the import was last updated.
     *)

  error_message: string option;
  (** 
    Provides the reason the import failed.
     *)

  error_type: string option;
  (** 
    The type of import error.
     *)

  status: import_failure_status option;
  (** 
    The status of the import.
     *)

  location: string option;
  (** 
    The location of the failure in the S3 bucket.
     *)

}

type list_import_failures_response = {
  next_token: string option;
  (** 
    A token you can use to get the next page of results.
     *)

  failures: import_failure_list_item list option;
  (** 
    Contains information about the import failures.
     *)

}

type list_import_failures_request = {
  next_token: string option;
  (** 
    A token you can use to get the next page of import failures.
     *)

  max_results: int option;
  (** 
    The maximum number of failures to display on a single page.
     *)

  import_id: string;
  (** 
    The ID of the import.
     *)

}

(** 
    A storage lake of event data against which you can run complex SQL-based queries. An event data store can include events that you have logged on your account. To select events for an event data store, use {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-concepts.html#adv-event-selectors}advanced event selectors}.
     *)
type event_data_store = {
  updated_timestamp: float option;
  (** 
    The timestamp showing when an event data store was updated, if applicable. [UpdatedTimestamp] is always either the same or newer than the time shown in [CreatedTimestamp].
     *)

  created_timestamp: float option;
  (** 
    The timestamp of the event data store's creation.
     *)

  retention_period: int option;
  (** 
    The retention period, in days.
     *)

  organization_enabled: bool option;
  (** 
    Indicates that an event data store is collecting logged events for an organization.
     *)

  multi_region_enabled: bool option;
  (** 
    Indicates whether the event data store includes events from all Regions, or only from the Region in which it was created.
     *)

  advanced_event_selectors: advanced_event_selector list option;
  (** 
    The advanced event selectors that were used to select events for the data store.
     *)

  status: event_data_store_status option;
  (** 
    The status of an event data store.
     *)

  termination_protection_enabled: bool option;
  (** 
    Indicates whether the event data store is protected from termination.
     *)

  name: string option;
  (** 
    The name of the event data store.
     *)

  event_data_store_arn: string option;
  (** 
    The ARN of the event data store.
     *)

}

type list_event_data_stores_response = {
  next_token: string option;
  (** 
    A token you can use to get the next page of results.
     *)

  event_data_stores: event_data_store list option;
  (** 
    Contains information about event data stores in the account, in the current Region.
     *)

}

type list_event_data_stores_request = {
  max_results: int option;
  (** 
    The maximum number of event data stores to display on a single page.
     *)

  next_token: string option;
  (** 
    A token you can use to get the next page of event data store results.
     *)

}

(** 
    Contains information about a returned CloudTrail channel.
     *)
type channel = {
  name: string option;
  (** 
    The name of the CloudTrail channel. For service-linked channels, the name is [aws-service-channel/service-name/custom-suffix] where [service-name] represents the name of the Amazon Web Services service that created the channel and [custom-suffix] represents the suffix created by the Amazon Web Services service.
     *)

  channel_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of a channel.
     *)

}

type list_channels_response = {
  next_token: string option;
  (** 
    The token to use to get the next page of results after a previous API call.
     *)

  channels: channel list option;
  (** 
    The list of channels in the account.
     *)

}

type list_channels_request = {
  next_token: string option;
  (** 
    The token to use to get the next page of results after a previous API call. This token must be passed in with the same parameters that were specified in the original call. For example, if the original call specified an AttributeKey of 'Username' with a value of 'root', the call with NextToken should include those same parameters.
     *)

  max_results: int option;
  (** 
    The maximum number of CloudTrail channels to display on a single page.
     *)

}

(** 
    This exception is thrown when the specified value of [Source] is not valid.
     *)
type invalid_source_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    If you run [GetInsightSelectors] on a trail or event data store that does not have Insights events enabled, the operation throws the exception [InsightNotEnabledException].
     *)
type insight_not_enabled_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    A table showing information about the most recent successful and failed attempts to ingest events.
     *)
type ingestion_status = {
  latest_ingestion_attempt_event_i_d: string option;
  (** 
    The event ID of the most recent attempt to ingest events.
     *)

  latest_ingestion_attempt_time: float option;
  (** 
    The time stamp of the most recent attempt to ingest events on the channel.
     *)

  latest_ingestion_error_code: string option;
  (** 
    The error code for the most recent failure to ingest events.
     *)

  latest_ingestion_success_event_i_d: string option;
  (** 
    The event ID of the most recent successful ingestion of events.
     *)

  latest_ingestion_success_time: float option;
  (** 
    The time stamp of the most recent successful ingestion of events for the channel.
     *)

}

(** 
    The specified query cannot be canceled because it is in the [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED] state.
     *)
type inactive_query_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Returns the objects or data listed below if successful. Otherwise, returns an error.
     *)
type get_trail_status_response = {
  time_logging_stopped: string option;
  (** 
    This field is no longer in use.
     *)

  time_logging_started: string option;
  (** 
    This field is no longer in use.
     *)

  latest_delivery_attempt_succeeded: string option;
  (** 
    This field is no longer in use.
     *)

  latest_notification_attempt_succeeded: string option;
  (** 
    This field is no longer in use.
     *)

  latest_notification_attempt_time: string option;
  (** 
    This field is no longer in use.
     *)

  latest_delivery_attempt_time: string option;
  (** 
    This field is no longer in use.
     *)

  latest_digest_delivery_error: string option;
  (** 
    Displays any Amazon S3 error that CloudTrail encountered when attempting to deliver a digest file to the designated bucket. For more information, see {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html}Error Responses} in the Amazon S3 API Reference.
    
     This error occurs only when there is a problem with the destination S3 bucket, and does not occur for requests that time out. To resolve the issue, fix the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create-s3-bucket-policy-for-cloudtrail.html}bucket policy} so that CloudTrail can write to the bucket; or create a new bucket and call [UpdateTrail] to specify the new bucket.
     
      *)

  latest_digest_delivery_time: float option;
  (** 
    Specifies the date and time that CloudTrail last delivered a digest file to an account's Amazon S3 bucket.
     *)

  latest_cloud_watch_logs_delivery_time: float option;
  (** 
    Displays the most recent date and time when CloudTrail delivered logs to CloudWatch Logs.
     *)

  latest_cloud_watch_logs_delivery_error: string option;
  (** 
    Displays any CloudWatch Logs error that CloudTrail encountered when attempting to deliver logs to CloudWatch Logs.
     *)

  stop_logging_time: float option;
  (** 
    Specifies the most recent date and time when CloudTrail stopped recording API calls for an Amazon Web Services account.
     *)

  start_logging_time: float option;
  (** 
    Specifies the most recent date and time when CloudTrail started recording API calls for an Amazon Web Services account.
     *)

  latest_notification_time: float option;
  (** 
    Specifies the date and time of the most recent Amazon SNS notification that CloudTrail has written a new log file to an account's Amazon S3 bucket.
     *)

  latest_delivery_time: float option;
  (** 
    Specifies the date and time that CloudTrail last delivered log files to an account's Amazon S3 bucket.
     *)

  latest_notification_error: string option;
  (** 
    Displays any Amazon SNS error that CloudTrail encountered when attempting to send a notification. For more information about Amazon SNS errors, see the {{:https://docs.aws.amazon.com/sns/latest/dg/welcome.html}Amazon SNS Developer Guide}.
     *)

  latest_delivery_error: string option;
  (** 
    Displays any Amazon S3 error that CloudTrail encountered when attempting to deliver log files to the designated bucket. For more information, see {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html}Error Responses} in the Amazon S3 API Reference.
    
     This error occurs only when there is a problem with the destination S3 bucket, and does not occur for requests that time out. To resolve the issue, fix the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create-s3-bucket-policy-for-cloudtrail.html}bucket policy} so that CloudTrail can write to the bucket; or create a new bucket and call [UpdateTrail] to specify the new bucket.
     
      *)

  is_logging: bool option;
  (** 
    Whether the CloudTrail trail is currently logging Amazon Web Services API calls.
     *)

}

(** 
    The name of a trail about which you want the current status.
     *)
type get_trail_status_request = {
  name: string;
  (** 
    Specifies the name or the CloudTrail ARN of the trail for which you are requesting status. To get the status of a shadow trail (a replication of the trail in another Region), you must specify its ARN. The following is the format of a trail ARN.
    
     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
      *)

}

type get_trail_response = {
  trail: trail option;
  
}

type get_trail_request = {
  name: string;
  (** 
    The name or the Amazon Resource Name (ARN) of the trail for which you want to retrieve settings information.
     *)

}

type get_resource_policy_response = {
  resource_policy: string option;
  (** 
    A JSON-formatted string that contains the resource-based policy attached to the CloudTrail channel.
     *)

  resource_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the CloudTrail channel attached to resource-based policy.
     *)

}

type get_resource_policy_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the CloudTrail channel attached to the resource-based policy. The following is the format of a resource ARN: [arn:aws:cloudtrail:us-east-2:123456789012:channel/MyChannel].
     *)

}

type get_query_results_response = {
  error_message: string option;
  (** 
    The error message returned if a query failed.
     *)

  next_token: string option;
  (** 
    A token you can use to get the next page of query results.
     *)

  query_result_rows: (string * string) list list list option;
  (** 
    Contains the individual event results of the query.
     *)

  query_statistics: query_statistics option;
  (** 
    Shows the count of query results.
     *)

  query_status: query_status option;
  (** 
    The status of the query. Values include [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED].
     *)

}

type get_query_results_request = {
  max_query_results: int option;
  (** 
    The maximum number of query results to display on a single page.
     *)

  next_token: string option;
  (** 
    A token you can use to get the next page of query results.
     *)

  query_id: string;
  (** 
    The ID of the query for which you want to get results.
     *)

  event_data_store: string option;
  (** 
    The ARN (or ID suffix of the ARN) of the event data store against which the query was run.
     *)

}

type get_insight_selectors_response = {
  insights_destination: string option;
  (** 
    The ARN of the destination event data store that logs Insights events.
     *)

  event_data_store_arn: string option;
  (** 
    The ARN of the source event data store that enabled Insights events.
     *)

  insight_selectors: insight_selector list option;
  (** 
    A JSON string that contains the Insight types you want to log on a trail or event data store. [ApiErrorRateInsight] and [ApiCallRateInsight] are supported as Insights types.
     *)

  trail_ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of a trail for which you want to get Insights selectors.
     *)

}

type get_insight_selectors_request = {
  event_data_store: string option;
  (** 
    Specifies the ARN (or ID suffix of the ARN) of the event data store for which you want to get Insights selectors.
    
     You cannot use this parameter with the [TrailName] parameter.
      *)

  trail_name: string option;
  (** 
    Specifies the name of the trail or trail ARN. If you specify a trail name, the string must meet the following requirements:
    
     {ul
          {- Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)
             
             }
           {- Start with a letter or number, and end with a letter or number
              
              }
           {- Be between 3 and 128 characters
              
              }
           {- Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.
              
              }
           {- Not be in IP address format (for example, 192.168.5.4)
              
              }
          
      }
       If you specify a trail ARN, it must be in the format:
       
        [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
        
         You cannot use this parameter with the [EventDataStore] parameter.
          *)

}

type get_import_response = {
  import_statistics: import_statistics option;
  (** 
    Provides statistics for the import. CloudTrail does not update import statistics in real-time. Returned values for parameters such as [EventsCompleted] may be lower than the actual value, because CloudTrail updates statistics incrementally over the course of the import.
     *)

  updated_timestamp: float option;
  (** 
    The timestamp of when the import was updated.
     *)

  created_timestamp: float option;
  (** 
    The timestamp of the import's creation.
     *)

  import_status: import_status option;
  (** 
    The status of the import.
     *)

  end_event_time: float option;
  (** 
    Used with [StartEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period.
     *)

  start_event_time: float option;
  (** 
    Used with [EndEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period.
     *)

  import_source: import_source option;
  (** 
    The source S3 bucket.
     *)

  destinations: string list option;
  (** 
    The ARN of the destination event data store.
     *)

  import_id: string option;
  (** 
    The ID of the import.
     *)

}

type get_import_request = {
  import_id: string;
  (** 
    The ID for the import.
     *)

}

type get_event_selectors_response = {
  advanced_event_selectors: advanced_event_selector list option;
  (** 
    The advanced event selectors that are configured for the trail.
     *)

  event_selectors: event_selector list option;
  (** 
    The event selectors that are configured for the trail.
     *)

  trail_ar_n: string option;
  (** 
    The specified trail ARN that has the event selectors.
     *)

}

type get_event_selectors_request = {
  trail_name: string;
  (** 
    Specifies the name of the trail or trail ARN. If you specify a trail name, the string must meet the following requirements:
    
     {ul
          {- Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)
             
             }
           {- Start with a letter or number, and end with a letter or number
              
              }
           {- Be between 3 and 128 characters
              
              }
           {- Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.
              
              }
           {- Not be in IP address format (for example, 192.168.5.4)
              
              }
          
      }
       If you specify a trail ARN, it must be in the format:
       
        [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
         *)

}

type get_event_data_store_response = {
  partition_keys: partition_key list option;
  (** 
    The partition keys for the event data store. To improve query performance and efficiency, CloudTrail Lake organizes event data into partitions based on values derived from partition keys.
     *)

  federation_role_arn: string option;
  (** 
    If Lake query federation is enabled, provides the ARN of the federation role used to access the resources for the federated event data store.
     *)

  federation_status: federation_status option;
  (** 
    Indicates the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html}Lake query federation} status. The status is [ENABLED] if Lake query federation is enabled, or [DISABLED] if Lake query federation is disabled. You cannot delete an event data store if the [FederationStatus] is [ENABLED].
     *)

  billing_mode: billing_mode option;
  (** 
    The billing mode for the event data store.
     *)

  kms_key_id: string option;
  (** 
    Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.
    
     [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012]
      *)

  updated_timestamp: float option;
  (** 
    Shows the time that an event data store was updated, if applicable. [UpdatedTimestamp] is always either the same or newer than the time shown in [CreatedTimestamp].
     *)

  created_timestamp: float option;
  (** 
    The timestamp of the event data store's creation.
     *)

  termination_protection_enabled: bool option;
  (** 
    Indicates that termination protection is enabled.
     *)

  retention_period: int option;
  (** 
    The retention period of the event data store, in days.
     *)

  organization_enabled: bool option;
  (** 
    Indicates whether an event data store is collecting logged events for an organization in Organizations.
     *)

  multi_region_enabled: bool option;
  (** 
    Indicates whether the event data store includes events from all Regions, or only from the Region in which it was created.
     *)

  advanced_event_selectors: advanced_event_selector list option;
  (** 
    The advanced event selectors used to select events for the data store.
     *)

  status: event_data_store_status option;
  (** 
    The status of an event data store.
     *)

  name: string option;
  (** 
    The name of the event data store.
     *)

  event_data_store_arn: string option;
  (** 
    The event data store Amazon Resource Number (ARN).
     *)

}

type get_event_data_store_request = {
  event_data_store: string;
  (** 
    The ARN (or ID suffix of the ARN) of the event data store about which you want information.
     *)

}

type get_channel_response = {
  ingestion_status: ingestion_status option;
  (** 
    A table showing information about the most recent successful and failed attempts to ingest events.
     *)

  destinations: destination list option;
  (** 
    The destinations for the channel. For channels created for integrations, the destinations are the event data stores that log events arriving through the channel. For service-linked channels, the destination is the Amazon Web Services service that created the service-linked channel to receive events.
     *)

  source_config: source_config option;
  (** 
    Provides information about the advanced event selectors configured for the channel, and whether the channel applies to all Regions or a single Region.
     *)

  source: string option;
  (** 
    The source for the CloudTrail channel.
     *)

  name: string option;
  (** 
    The name of the CloudTrail channel. For service-linked channels, the name is [aws-service-channel/service-name/custom-suffix] where [service-name] represents the name of the Amazon Web Services service that created the channel and [custom-suffix] represents the suffix generated by the Amazon Web Services service.
     *)

  channel_arn: string option;
  (** 
    The ARN of an channel returned by a [GetChannel] request.
     *)

}

type get_channel_request = {
  channel: string;
  (** 
    The ARN or [UUID] of a channel.
     *)

}

(** 
    The event data store cannot be deleted because termination protection is enabled for it.
     *)
type event_data_store_termination_protected_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    You cannot delete the event data store because Lake query federation is enabled. To delete the event data store, run the [DisableFederation] operation to disable Lake query federation on the event data store.
     *)
type event_data_store_federation_enabled_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type enable_federation_response = {
  federation_role_arn: string option;
  (** 
    The ARN of the federation role.
     *)

  federation_status: federation_status option;
  (** 
    The federation status.
     *)

  event_data_store_arn: string option;
  (** 
    The ARN of the event data store for which you enabled Lake query federation.
     *)

}

type enable_federation_request = {
  federation_role_arn: string;
  (** 
    The ARN of the federation role to use for the event data store. Amazon Web Services services like Lake Formation use this federation role to access data for the federated event data store. The federation role must exist in your account and provide the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html#query-federation-permissions-role}required minimum permissions}.
     *)

  event_data_store: string;
  (** 
    The ARN (or ID suffix of the ARN) of the event data store for which you want to enable Lake query federation.
     *)

}

(** 
    You are trying to update a resource when another request is in progress. Allow sufficient wait time for the previous request to complete, then retry your request.
     *)
type concurrent_modification_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    You do not have sufficient access to perform this action.
     *)
type access_denied_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type disable_federation_response = {
  federation_status: federation_status option;
  (** 
    The federation status.
     *)

  event_data_store_arn: string option;
  (** 
    The ARN of the event data store for which you disabled Lake query federation.
     *)

}

type disable_federation_request = {
  event_data_store: string;
  (** 
    The ARN (or ID suffix of the ARN) of the event data store for which you want to disable Lake query federation.
     *)

}

(** 
    Returns the objects or data listed below if successful. Otherwise, returns an error.
     *)
type describe_trails_response = {
  trail_list: trail list option;
  (** 
    The list of trail objects. Trail objects with string values are only returned if values for the objects exist in a trail's configuration. For example, [SNSTopicName] and [SNSTopicARN] are only returned in results if a trail is configured to send SNS notifications. Similarly, [KMSKeyId] only appears in results if a trail's log files are encrypted with KMS customer managed keys.
     *)

}

(** 
    Returns information about the trail.
     *)
type describe_trails_request = {
  include_shadow_trails: bool option;
  (** 
    Specifies whether to include shadow trails in the response. A shadow trail is the replication in a Region of a trail that was created in a different Region, or in the case of an organization trail, the replication of an organization trail in member accounts. If you do not include shadow trails, organization trails in a member account and Region replication trails will not be returned. The default is true.
     *)

  trail_name_list: string list option;
  (** 
    Specifies a list of trail names, trail ARNs, or both, of the trails to describe. The format of a trail ARN is:
    
     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
     
      If an empty list is specified, information for the trail in the current Region is returned.
      
       {ul
            {- If an empty list is specified and [IncludeShadowTrails] is false, then information for all trails in the current Region is returned.
               
               }
             {- If an empty list is specified and IncludeShadowTrails is null or true, then information for all trails in the current Region and any associated shadow trails in other Regions is returned.
                
                }
            
      }
       If one or more trail names are specified, information is returned only if the names match the names of trails belonging only to the current Region and current account. To return information about a trail in another Region, you must specify its trail ARN.
       
        *)

}

type delivery_status = | UNKNOWN
  | CANCELLED
  | ACCESS_DENIED_SIGNING_FILE
  | ACCESS_DENIED
  | RESOURCE_NOT_FOUND
  | PENDING
  | FAILED_SIGNING_FILE
  | FAILED
  | SUCCESS

type describe_query_response = {
  delivery_status: delivery_status option;
  (** 
    The delivery status.
     *)

  delivery_s3_uri: string option;
  (** 
    The URI for the S3 bucket where CloudTrail delivered query results, if applicable.
     *)

  error_message: string option;
  (** 
    The error message returned if a query failed.
     *)

  query_statistics: query_statistics_for_describe_query option;
  (** 
    Metadata about a query, including the number of events that were matched, the total number of events scanned, the query run time in milliseconds, and the query's creation time.
     *)

  query_status: query_status option;
  (** 
    The status of a query. Values for [QueryStatus] include [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED]
     *)

  query_string: string option;
  (** 
    The SQL code of a query.
     *)

  query_id: string option;
  (** 
    The ID of the query.
     *)

}

type describe_query_request = {
  query_alias: string option;
  (** 
    The alias that identifies a query template.
     *)

  query_id: string option;
  (** 
    The query ID.
     *)

  event_data_store: string option;
  (** 
    The ARN (or the ID suffix of the ARN) of an event data store on which the specified query was run.
     *)

}

(** 
    Returns the following response if successful. Otherwise, returns an error.
     *)
type deregister_organization_delegated_admin_response = unit

(** 
    Removes CloudTrail delegated administrator permissions from a specified member account in an organization that is currently designated as a delegated administrator.
     *)
type deregister_organization_delegated_admin_request = {
  delegated_admin_account_id: string;
  (** 
    A delegated administrator account ID. This is a member account in an organization that is currently designated as a delegated administrator.
     *)

}

(** 
    This exception is thrown when the specified account is not registered as the CloudTrail delegated administrator.
     *)
type account_not_registered_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

(** 
    Returns the objects or data listed below if successful. Otherwise, returns an error.
     *)
type delete_trail_response = unit

(** 
    The request that specifies the name of a trail to delete.
     *)
type delete_trail_request = {
  name: string;
  (** 
    Specifies the name or the CloudTrail ARN of the trail to be deleted. The following is the format of a trail ARN. [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
     *)

}

type delete_resource_policy_response = unit

type delete_resource_policy_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the CloudTrail channel you're deleting the resource-based policy from. The following is the format of a resource ARN: [arn:aws:cloudtrail:us-east-2:123456789012:channel/MyChannel].
     *)

}

type delete_event_data_store_response = unit

type delete_event_data_store_request = {
  event_data_store: string;
  (** 
    The ARN (or the ID suffix of the ARN) of the event data store to delete.
     *)

}

(** 
    This exception is thrown when the specified event data store cannot yet be deleted because it is in use by a channel.
     *)
type channel_exists_for_eds_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type delete_channel_response = unit

type delete_channel_request = {
  channel: string;
  (** 
    The ARN or the [UUID] value of the channel that you want to delete.
     *)

}

(** 
    Returns the objects or data listed below if successful. Otherwise, returns an error.
     *)
type create_trail_response = {
  is_organization_trail: bool option;
  (** 
    Specifies whether the trail is an organization trail.
     *)

  kms_key_id: string option;
  (** 
    Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.
    
     [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012]
      *)

  cloud_watch_logs_role_arn: string option;
  (** 
    Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group.
     *)

  cloud_watch_logs_log_group_arn: string option;
  (** 
    Specifies the Amazon Resource Name (ARN) of the log group to which CloudTrail logs will be delivered.
     *)

  log_file_validation_enabled: bool option;
  (** 
    Specifies whether log file integrity validation is enabled.
     *)

  trail_ar_n: string option;
  (** 
    Specifies the ARN of the trail that was created. The format of a trail ARN is:
    
     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
      *)

  is_multi_region_trail: bool option;
  (** 
    Specifies whether the trail exists in one Region or in all Regions.
     *)

  include_global_service_events: bool option;
  (** 
    Specifies whether the trail is publishing events from global services such as IAM to the log files.
     *)

  sns_topic_ar_n: string option;
  (** 
    Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send notifications when log files are delivered. The format of a topic ARN is:
    
     [arn:aws:sns:us-east-2:123456789012:MyTopic]
      *)

  sns_topic_name: string option;
  (** 
    This field is no longer in use. Use [SnsTopicARN].
     *)

  s3_key_prefix: string option;
  (** 
    Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for log file delivery. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files}Finding Your CloudTrail Log Files}.
     *)

  s3_bucket_name: string option;
  (** 
    Specifies the name of the Amazon S3 bucket designated for publishing log files.
     *)

  name: string option;
  (** 
    Specifies the name of the trail.
     *)

}

(** 
    Specifies the settings for each trail.
     *)
type create_trail_request = {
  tags_list: tag list option;
  
  is_organization_trail: bool option;
  (** 
    Specifies whether the trail is created for all accounts in an organization in Organizations, or only for the current Amazon Web Services account. The default is false, and cannot be true unless the call is made on behalf of an Amazon Web Services account that is the management account or delegated administrator account for an organization in Organizations.
     *)

  kms_key_id: string option;
  (** 
    Specifies the KMS key ID to use to encrypt the logs delivered by CloudTrail. The value can be an alias name prefixed by [alias/], a fully specified ARN to an alias, a fully specified ARN to a key, or a globally unique identifier.
    
     CloudTrail also supports KMS multi-Region keys. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Using multi-Region keys} in the {i Key Management Service Developer Guide}.
     
      Examples:
      
       {ul
            {- [alias/MyAliasName]
               
               }
             {- [arn:aws:kms:us-east-2:123456789012:alias/MyAliasName]
                
                }
             {- [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012]
                
                }
             {- [12345678-1234-1234-1234-123456789012]
                
                }
            
      }
       *)

  cloud_watch_logs_role_arn: string option;
  (** 
    Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group. You must use a role that exists in your account.
     *)

  cloud_watch_logs_log_group_arn: string option;
  (** 
    Specifies a log group name using an Amazon Resource Name (ARN), a unique identifier that represents the log group to which CloudTrail logs will be delivered. You must use a log group that exists in your account.
    
     Not required unless you specify [CloudWatchLogsRoleArn].
      *)

  enable_log_file_validation: bool option;
  (** 
    Specifies whether log file integrity validation is enabled. The default is false.
    
     When you disable log file integrity validation, the chain of digest files is broken after one hour. CloudTrail does not create digest files for log files that were delivered during a period in which log file integrity validation was disabled. For example, if you enable log file integrity validation at noon on January 1, disable it at noon on January 2, and re-enable it at noon on January 10, digest files will not be created for the log files delivered from noon on January 2 to noon on January 10. The same applies whenever you stop CloudTrail logging or delete a trail.
     
      *)

  is_multi_region_trail: bool option;
  (** 
    Specifies whether the trail is created in the current Region or in all Regions. The default is false, which creates a trail only in the Region where you are signed in. As a best practice, consider creating trails that log events in all Regions.
     *)

  include_global_service_events: bool option;
  (** 
    Specifies whether the trail is publishing events from global services such as IAM to the log files.
     *)

  sns_topic_name: string option;
  (** 
    Specifies the name of the Amazon SNS topic defined for notification of log file delivery. The maximum length is 256 characters.
     *)

  s3_key_prefix: string option;
  (** 
    Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for log file delivery. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files}Finding Your CloudTrail Log Files}. The maximum length is 200 characters.
     *)

  s3_bucket_name: string;
  (** 
    Specifies the name of the Amazon S3 bucket designated for publishing log files. For information about bucket naming rules, see {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html}Bucket naming rules} in the {i Amazon Simple Storage Service User Guide}.
     *)

  name: string;
  (** 
    Specifies the name of the trail. The name must meet the following requirements:
    
     {ul
          {- Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)
             
             }
           {- Start with a letter or number, and end with a letter or number
              
              }
           {- Be between 3 and 128 characters
              
              }
           {- Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.
              
              }
           {- Not be in IP address format (for example, 192.168.5.4)
              
              }
          
      }
       *)

}

type create_event_data_store_response = {
  billing_mode: billing_mode option;
  (** 
    The billing mode for the event data store.
     *)

  kms_key_id: string option;
  (** 
    Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.
    
     [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012]
      *)

  updated_timestamp: float option;
  (** 
    The timestamp that shows when an event data store was updated, if applicable. [UpdatedTimestamp] is always either the same or newer than the time shown in [CreatedTimestamp].
     *)

  created_timestamp: float option;
  (** 
    The timestamp that shows when the event data store was created.
     *)

  tags_list: tag list option;
  
  termination_protection_enabled: bool option;
  (** 
    Indicates whether termination protection is enabled for the event data store.
     *)

  retention_period: int option;
  (** 
    The retention period of an event data store, in days.
     *)

  organization_enabled: bool option;
  (** 
    Indicates whether an event data store is collecting logged events for an organization in Organizations.
     *)

  multi_region_enabled: bool option;
  (** 
    Indicates whether the event data store collects events from all Regions, or only from the Region in which it was created.
     *)

  advanced_event_selectors: advanced_event_selector list option;
  (** 
    The advanced event selectors that were used to select the events for the data store.
     *)

  status: event_data_store_status option;
  (** 
    The status of event data store creation.
     *)

  name: string option;
  (** 
    The name of the event data store.
     *)

  event_data_store_arn: string option;
  (** 
    The ARN of the event data store.
     *)

}

type create_event_data_store_request = {
  billing_mode: billing_mode option;
  (** 
    The billing mode for the event data store determines the cost for ingesting events and the default and maximum retention period for the event data store.
    
     The following are the possible values:
     
      {ul
           {- [EXTENDABLE_RETENTION_PRICING] - This billing mode is generally recommended if you want a flexible retention period of up to 3653 days (about 10 years). The default retention period for this billing mode is 366 days.
              
              }
            {- [FIXED_RETENTION_PRICING] - This billing mode is recommended if you expect to ingest more than 25 TB of event data per month and need a retention period of up to 2557 days (about 7 years). The default retention period for this billing mode is 2557 days.
               
               }
           
      }
       The default value is [EXTENDABLE_RETENTION_PRICING].
       
        For more information about CloudTrail pricing, see {{:http://aws.amazon.com/cloudtrail/pricing/}CloudTrail Pricing} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-manage-costs.html}Managing CloudTrail Lake costs}.
         *)

  start_ingestion: bool option;
  (** 
    Specifies whether the event data store should start ingesting live events. The default is true.
     *)

  kms_key_id: string option;
  (** 
    Specifies the KMS key ID to use to encrypt the events delivered by CloudTrail. The value can be an alias name prefixed by [alias/], a fully specified ARN to an alias, a fully specified ARN to a key, or a globally unique identifier.
    
     Disabling or deleting the KMS key, or removing CloudTrail permissions on the key, prevents CloudTrail from logging events to the event data store, and prevents users from querying the data in the event data store that was encrypted with the key. After you associate an event data store with a KMS key, the KMS key cannot be removed or changed. Before you disable or delete a KMS key that you are using with an event data store, delete or back up your event data store.
     
      CloudTrail also supports KMS multi-Region keys. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Using multi-Region keys} in the {i Key Management Service Developer Guide}.
      
       Examples:
       
        {ul
             {- [alias/MyAliasName]
                
                }
              {- [arn:aws:kms:us-east-2:123456789012:alias/MyAliasName]
                 
                 }
              {- [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012]
                 
                 }
              {- [12345678-1234-1234-1234-123456789012]
                 
                 }
             
      }
       *)

  tags_list: tag list option;
  
  termination_protection_enabled: bool option;
  (** 
    Specifies whether termination protection is enabled for the event data store. If termination protection is enabled, you cannot delete the event data store until termination protection is disabled.
     *)

  retention_period: int option;
  (** 
    The retention period of the event data store, in days. If [BillingMode] is set to [EXTENDABLE_RETENTION_PRICING], you can set a retention period of up to 3653 days, the equivalent of 10 years. If [BillingMode] is set to [FIXED_RETENTION_PRICING], you can set a retention period of up to 2557 days, the equivalent of seven years.
    
     CloudTrail Lake determines whether to retain an event by checking if the [eventTime] of the event is within the specified retention period. For example, if you set a retention period of 90 days, CloudTrail will remove events when the [eventTime] is older than 90 days.
     
      If you plan to copy trail events to this event data store, we recommend that you consider both the age of the events that you want to copy as well as how long you want to keep the copied events in your event data store. For example, if you copy trail events that are 5 years old and specify a retention period of 7 years, the event data store will retain those events for two years.
      
       *)

  organization_enabled: bool option;
  (** 
    Specifies whether an event data store collects events logged for an organization in Organizations.
     *)

  multi_region_enabled: bool option;
  (** 
    Specifies whether the event data store includes events from all Regions, or only from the Region in which the event data store is created.
     *)

  advanced_event_selectors: advanced_event_selector list option;
  (** 
    The advanced event selectors to use to select the events for the data store. You can configure up to five advanced event selectors for each event data store.
    
     For more information about how to use advanced event selectors to log CloudTrail events, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html#creating-data-event-selectors-advanced}Log events by using advanced event selectors} in the CloudTrail User Guide.
     
      For more information about how to use advanced event selectors to include Config configuration items in your event data store, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-eds-cli.html#lake-cli-create-eds-config}Create an event data store for Config configuration items} in the CloudTrail User Guide.
      
       For more information about how to use advanced event selectors to include events outside of Amazon Web Services events in your event data store, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-integrations-cli.html#lake-cli-create-integration}Create an integration to log events from outside Amazon Web Services} in the CloudTrail User Guide.
        *)

  name: string;
  (** 
    The name of the event data store.
     *)

}

type create_channel_response = {
  tags: tag list option;
  
  destinations: destination list option;
  (** 
    The event data stores that log the events arriving through the channel.
     *)

  source: string option;
  (** 
    The partner or external event source name.
     *)

  name: string option;
  (** 
    The name of the new channel.
     *)

  channel_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the new channel.
     *)

}

type create_channel_request = {
  tags: tag list option;
  
  destinations: destination list;
  (** 
    One or more event data stores to which events arriving through a channel will be logged.
     *)

  source: string;
  (** 
    The name of the partner or external event source. You cannot change this name after you create the channel. A maximum of one channel is allowed per source.
    
     A source can be either [Custom] for all valid non-Amazon Web Services events, or the name of a partner event source. For information about the source names for available partners, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-event-data-store-integration.html#cloudtrail-lake-partner-information}Additional information about integration partners} in the CloudTrail User Guide.
      *)

  name: string;
  (** 
    The name of the channel.
     *)

}

(** 
    This exception is thrown when the maximum number of channels limit is exceeded.
     *)
type channel_max_limit_exceeded_exception = {
  message: string option;
  (** 
    Brief description of the exception returned by the request.
     *)

}

type cancel_query_response = {
  query_status: query_status;
  (** 
    Shows the status of a query after a [CancelQuery] request. Typically, the values shown are either [RUNNING] or [CANCELLED].
     *)

  query_id: string;
  (** 
    The ID of the canceled query.
     *)

}

type cancel_query_request = {
  query_id: string;
  (** 
    The ID of the query that you want to cancel. The [QueryId] comes from the response of a [StartQuery] operation.
     *)

  event_data_store: string option;
  (** 
    The ARN (or the ID suffix of the ARN) of an event data store on which the specified query is running.
     *)

}

(** 
    Returns the objects or data if successful. Otherwise, returns an error.
     *)
type add_tags_response = unit

(** 
    Specifies the tags to add to a trail, event data store, or channel.
     *)
type add_tags_request = {
  tags_list: tag list;
  (** 
    Contains a list of tags, up to a limit of 50
     *)

  resource_id: string;
  (** 
    Specifies the ARN of the trail, event data store, or channel to which one or more tags will be added.
    
     The format of a trail ARN is: [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail]
     
      The format of an event data store ARN is: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE]
      
       The format of a channel ARN is: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890]
        *)

}

(** 
    CloudTrail This is the CloudTrail API Reference. It provides descriptions of actions, data types, common parameters, and common errors for CloudTrail.
               
                CloudTrail is a web service that records Amazon Web Services API calls for your Amazon Web Services account and delivers log files to an Amazon S3 bucket. The recorded information includes the identity of the user, the start time of the Amazon Web Services API call, the source IP address, the request parameters, and the response elements returned by the service.
                
                 As an alternative to the API, you can use one of the Amazon Web Services SDKs, which consist of libraries and sample code for various programming languages and platforms (Java, Ruby, .NET, iOS, Android, etc.). The SDKs provide programmatic access to CloudTrail. For example, the SDKs handle cryptographically signing requests, managing errors, and retrying requests automatically. For more information about the Amazon Web Services SDKs, including how to download and install them, see {{:http://aws.amazon.com/tools/}Tools to Build on Amazon Web Services}.
                 
                  See the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html}CloudTrail User Guide} for information about the data that is included with each Amazon Web Services API call listed in the log files.
                   *)


type base_document = Json.t

